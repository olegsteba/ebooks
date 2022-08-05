from django.urls import path
from .views import BookList, BookGenre, BookDetail, BookAdd, about, question


urlpatterns = [
    path('', BookList.as_view(), name='home'),
    path('about/', about, name='about'),
    path('book/<slug:book_slug>/', BookDetail.as_view(), name='book'),
    path('genre/<slug:genre_slug>/', BookGenre.as_view(), name='genre'),
    path('addbook/', BookAdd.as_view(), name='add_book'),
#    path('question/', question, name='question'),
]
