from multiprocessing import context
from django.http import HttpRequest, HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, HttpResponseNotFound
from django.urls import reverse_lazy
from django.views.generic import ListView, DetailView, CreateView

from .forms import AddBookForm
from .models import Book, Genre, PublishingHouse, Author, BookInAuthor


class BookList(ListView):
    """Формирование всего списка книг"""
    model = Book
    template_name = 'book/book_list.html'
    context_object_name = 'books'
    
    def get_context_data(self, *, object_list=None, **kwargs):
        """Формируем контекст для вывода"""
        context = super().get_context_data(**kwargs)
        context['title'] = 'Список книг'
        context['genre_selected'] = 0
        return context
        
    def get_queryset(self):
        """Выборка не удаленных данных"""
        return Book.objects.filter(is_deleted=False)


class BookGenre(ListView):
    """Формирование списка книг определенного жанра"""
    model = Book
    template_name = 'book/book_list.html'
    context_object_name = 'books'
    allow_empty = False
    
    def get_context_data(self, *, object_list=None, **kwargs):
        """Формируем контекст для вывода"""
        context = super().get_context_data(**kwargs)
        context['title'] = f'Список книг жанра: ' + str(context['books'][0].genre)
        context['genre_selected'] = context['books'][0].genre_id
        return context
        
    def get_queryset(self):
        """Выборка не удаленных данных"""
        return Book.objects.filter(genre__slug=self.kwargs['genre_slug'], is_deleted=False)
    
class BookDetail(DetailView):
    """Формирование детальной информации о книге
    #pk_url_kwarg = 'book_pk'"""
    model = Book
    template_name = 'book/book_detail.html'
    slug_url_kwarg = 'book_slug' 
    context_object_name = 'book'   
    allow_empty = False
    
    def get_context_data(self, *, object_list=None, **kwargs):
        """Формируем контекст для вывода"""
        context = super().get_context_data(**kwargs)
        context['title'] = f'Информация о книге'
        context['genre_selected'] = context['book'].genre_id
        return context    


class BookAdd(CreateView):
    """Формирует форму добавления книги"""
    form_class = AddBookForm
    template_name = 'book/book_add.html'
    success_url = reverse_lazy('home')

    def get_context_data(self, *, object_list=None, **kwargs):
        """Формируем контекст для вывода"""
        context = super().get_context_data(**kwargs)
        context['title'] = f'Добавить книгу'
        return context 
        
    
# def index(request):
#     books = Book.objects.all()
#     context = {
#         'books': books, 
#         'title': 'Список книг',        
#         'genre_selected': 0,
#     }    

#     return render(request, 'book/book_list.html', context=context)


# def show_genre(request, genre_slug):
    
#     try:
#         genre = Genre.objects.get(slug=genre_slug)
#     except Exception:
#         raise Http404()
    
#     books = Book.objects.filter(genre_id=genre.pk)
       
#     context = {
#         'books': books, 
#         'title': f'Список книг жанра: {genre}',        
#         'genre_selected': genre.pk,
#     }
    
#     return render(request, 'book/book_list.html', context=context)


# def show_book(request, book_slug):
#     book = get_object_or_404(Book, slug=book_slug)
    
#     context = {
#         'book': book,
#         'title': book.book_name,
#         'genre_selected': book.genre_id,
#     }

#     return render(request, 'book/book_detail.html', context=context)


# def addbook(request):
#     if request.method == 'POST':
#         form = AddBookForm(request.POST, request.FILES)
#         if form.is_valid():           
#             form.save()
#             return redirect('home')
#             # try:
#             #     book = Book.objects.create(
#             #         book_name=form.cleaned_data['book_name'],
#             #         slug=form.cleaned_data['slug'],
#             #         description=form.cleaned_data['description'],
#             #         date_create=form.cleaned_data['date_create'],
#             #         is_deleted=form.cleaned_data['is_deleted'],
#             #         genre=form.cleaned_data['genre'],
#             #         publishing_house=form.cleaned_data['publishing_house'],
#             #     )
#             #     author = form.cleaned_data['author']
#             #     book.author.add(*author)
#             #     book.save()
#             #     return redirect('home')
#             # except:
#             #     form.add_error(None, 'Ошибка при добавлении книги')
#     else:
#         form = AddBookForm()
        
#     context = {
#         'form': form,
#         'title': 'Добавить книгу',        
#     }    
#     return render(request, 'book/book_add.html', context=context)


def about(request):
    return HttpResponse("Жанры")


def question(request):
    return HttpResponse("Жанры")


def login(request):
    return HttpResponse("Жанры")


def pageNotFound(request, exception):
    return HttpResponseNotFound("Страница не найдена")
