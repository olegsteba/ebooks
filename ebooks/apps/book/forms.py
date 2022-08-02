from django import forms
from .models import Book, Genre, PublishingHouse, Author, BookInAuthor


class AddBookForm(forms.Form):
    author_array = (
        [author.id, f"{author.last_name} {author.first_name}"] for author in Author.objects.all()
    )
        
    book_name = forms.CharField(max_length=1024)
    slug = forms.SlugField(max_length=255)
    description = forms.CharField(
        widget=forms.Textarea(attrs={'cols': 60, 'rows': 10})
    )
    date_create = forms.DateField()
    is_deleted = forms.BooleanField()
    genre = forms.ModelChoiceField(queryset=Genre.objects.all())
    publishing_house = forms.ModelChoiceField(queryset=PublishingHouse.objects.all())
    author = forms.MultipleChoiceField(
        widget=forms.CheckboxSelectMultiple,
        choices=author_array,
        label="Авторы",
        required=True,
    )

