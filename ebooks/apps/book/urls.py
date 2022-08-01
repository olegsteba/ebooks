from django.urls import path
from .views import index, about, addbook, question, login, show_book, show_genre

urlpatterns = [
    path('', index, name='home'),
    path('about/', about, name='about'),
    path('addbook/', addbook, name='add_book'),
    path('question/', question, name='question'),
    path('login/', login, name='login'),
    path('book/<int:book_id>/', show_book, name='book'),
    path('genre/<int:genre_id>/', show_genre, name='genre'),
]
