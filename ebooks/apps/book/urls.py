from django.urls import path
from .views import BookList, BookGenre, BookDetail, BookAdd, about, question, login


urlpatterns = [
    path('', BookList.as_view(), name='home'),
    path('about/', about, name='about'),
    path('addbook/', BookAdd.as_view(), name='add_book'),
    path('question/', question, name='question'),
    path('login/', login, name='login'),
    path('book/<slug:book_slug>/', BookDetail.as_view(), name='book'),
    path('genre/<slug:genre_slug>/', BookGenre.as_view(), name='genre'),
]
