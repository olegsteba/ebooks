from multiprocessing import context
from django.http import HttpRequest, HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, HttpResponseNotFound

from .forms import AddBookForm
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
    return HttpResponse("Жанры")


def addbook(request):
    if request.method == 'POST':
        form = AddBookForm(request.POST)
        if form.is_valid():
            print(form.cleaned_data)
    else:
        form = AddBookForm()
        
    context = {
        'form': form,
        'title': 'Добавить книгу',        
    }    
    return render(request, 'book/book_add.html', context=context)


def question(request):
    return HttpResponse("Жанры")


def login(request):
    return HttpResponse("Жанры")


def show_book(request, book_slug):
    book = get_object_or_404(Book, slug=book_slug)
    
    context = {
        'book': book,
        'title': book.book_name,
        'genre_selected': book.genre_id,
    }

    return render(request, 'book/book_detail.html', context=context)

def show_genre(request, genre_slug):
    
    try:
        genre = Genre.objects.get(slug=genre_slug)
    except Exception:
        raise Http404()
    
    books = Book.objects.filter(genre_id=genre.pk)
       
    context = {
        'books': books, 
        'title': f'Список книг жанра: {genre}',        
        'genre_selected': genre.pk,
    }
    
    return render(request, 'book/book_list.html', context=context)

def pageNotFound(request, exception):
    return HttpResponseNotFound("Страница не найдена")
