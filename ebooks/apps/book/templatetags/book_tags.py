from django import template
from django.db.models import Count
from apps.book.models import Book, Genre, PublishingHouse, Author, BookInAuthor


register = template.Library()

@register.simple_tag(name='getgenres')
def get_genres(filter=None):
    if not filter:
        return Genre.objects.all()
    else:
        return Genre.objects.filter(pk=filter)


@register.inclusion_tag('book/list_genres.html')
def show_genres(sort=None, genre_selected=0):
    if not sort:
        genres = Genre.objects.annotate(Count('genre_books'))
    else:
        genres = Genre.objects.annotate(Count('genre_books')).order_by(sort)
    
    return {"genres": genres, "genre_selected": genre_selected}


@register.inclusion_tag('book/main_menu.html')
def show_main_menu():
    main_menu = [
        {'title': "Главная", 'url_name': 'home'}, 
        {'title': "О сате", 'url_name': 'about'},
        # {'title': "Задать вопрос", 'url_name': 'question'},
        {'title': "Добавить книгу", 'url_name': 'add_book'},
        {'title': "Войти", 'url_name': 'login'},
    ]    
    return {'main_menu': main_menu}
