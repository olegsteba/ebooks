from django.http import HttpRequest, HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseNotFound
from .models import Book, Genre

main_menu = [
    {'title': "Главная", 'url_name': 'home'}, 
    {'title': "О сате", 'url_name': 'about'},
    {'title': "Добавить книгу", 'url_name': 'add_book'},
    {'title': "Задать вопрос", 'url_name': 'question'},
    {'title': "Войти", 'url_name': 'login'},
]

def index(request):
    books = Book.objects.all()
    genres = Genre.objects.all()
    context = {
        'books': books, 
        'genres': genres,
        'main_menu': main_menu,
        'title': 'Список книг',        
        'genre_select': 0,
    }
    
    return render(request, 'book/index.html', context=context)


def about(request):
    return render(request, 'book/about.html', {'main_menu': main_menu,'title': 'О сайте'})


def addbook(request):
    return HttpResponse("Жанры")


def question(request):
    return HttpResponse("Жанры")


def login(request):
    return HttpResponse("Жанры")


def show_book(request, book_id):
    return HttpResponse("Жанры")


def show_genre(request, genre_id):
    
    try:
        genre = Genre.objects.get(pk=genre_id)
    except Exception:
        raise Http404()
    
    books = Book.objects.filter(genre_id=genre_id)
    genres = Genre.objects.all()
       
    context = {
        'books': books, 
        'genres': genres,
        'main_menu': main_menu,
        'title': f'Список книг жанра: {genre}',        
        'genre_select': genre_id,
    }
    
    return render(request, 'book/index.html', context=context)

def pageNotFound(request, exception):
    return HttpResponseNotFound("Страница не найдена")
