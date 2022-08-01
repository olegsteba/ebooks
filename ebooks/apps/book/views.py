from multiprocessing import context
from django.http import HttpRequest, HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, HttpResponseNotFound
from .models import Book, Genre


def index(request):
    books = Book.objects.all()
    context = {
        'books': books, 
        'title': 'Список книг',        
        'genre_selected': 0,
    }
    
    return render(request, 'book/book_list.html', context=context)


def about(request):
    return render(request, 'book/about.html')


def addbook(request):
    return HttpResponse("Жанры")


def question(request):
    return HttpResponse("Жанры")


def login(request):
    return HttpResponse("Жанры")


def show_book(request, book_id):
    book = get_object_or_404(Book, pk=book_id)
    
    context = {
        'book': book,
        'title': book.book_name,
        'genre_selected': book.genre_id,
    }

    return render(request, 'book/book_detail.html', context=context)

def show_genre(request, genre_id):
    
    try:
        genre = Genre.objects.get(pk=genre_id)
    except Exception:
        raise Http404()
    
    books = Book.objects.filter(genre_id=genre_id)
       
    context = {
        'books': books, 
        'title': f'Список книг жанра: {genre}',        
        'genre_selected': genre_id,
    }
    
    return render(request, 'book/book_list.html', context=context)

def pageNotFound(request, exception):
    return HttpResponseNotFound("Страница не найдена")
