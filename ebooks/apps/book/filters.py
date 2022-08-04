import django_filters
from django import forms
from .models import Book, PublishingHouse, Author


class BookFilter(django_filters.FilterSet):
    """Фильтрация книг"""
#    book_name = django_filters.CharFilter()
    publishing_house = django_filters.ModelChoiceFilter(
        queryset=PublishingHouse.objects.all(),
        label='Издательство',
        empty_label='Все издательства',
    )
    author = django_filters.ModelChoiceFilter(
        queryset=Author.objects.all(), 
        label='Автор',
        empty_label='Все авторы',
    )   
    
    class Meta:
        model = Book
        exclude = ['book_image'] 
        fields = ['publishing_house', 'author']
    