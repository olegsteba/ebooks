from django import forms
from .models import Book, Genre, PublishingHouse, Author, BookInAuthor


class AddBookForm(forms.Form):
    """Форма не связанная с моделью"""
    author_array = (
        [author.id, f"{author.last_name} {author.first_name}"] for author in Author.objects.all()
    )
        
    book_name = forms.CharField(max_length=1024, label='Название книги', widget=forms.TextInput(attrs={'class': 'field-book-name'}))
    slug = forms.SlugField(max_length=255, label='URL адрес',)
    description = forms.CharField(
        widget=forms.Textarea(attrs={'cols': 60, 'rows': 10}),
        label='Описание',
    )
    date_create = forms.DateField(label='Дата написания')
    is_deleted = forms.BooleanField(label='Удален', required=False)
    genre = forms.ModelChoiceField(
        queryset=Genre.objects.all(), 
        label='Жанр', 
        empty_label='Жанр не выбран',
    )
    publishing_house = forms.ModelChoiceField(
        queryset=PublishingHouse.objects.all(), 
        label='Издательство', 
        empty_label='Издательство не выбрано',
    )
    author = forms.MultipleChoiceField(
        widget=forms.SelectMultiple,
        choices=author_array,
        label="Авторы",
        required=True,
    )

