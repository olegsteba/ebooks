from django import forms
from django.core.exceptions import ValidationError
from .models import Book, Genre, PublishingHouse, Author, BookInAuthor


class AddBookForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['genre'].empty_label = 'Жанр не выбран'
        self.fields['publishing_house'].empty_label = 'Издательство не выбрано'
    
    def clean_book_name(self):
        """Проверка на валидность названия книги"""
        book_name = self.cleaned_data['book_name']
        if len(book_name) > 255:
            raise ValidationError('Название книги привышает 255 символов')
        
        return book_name
    
    class Meta:
        model = Book
        fields = [
            'book_name', 'slug', 'description', 'book_image', 'date_create', 
            'is_deleted', 'genre', 'publishing_house', 'author',
        ]
        widgets = {
            'is_deleted': forms.CheckboxInput(attrs={'class': 'field-checkbox'}),
        }


# class AddBookForm(forms.Form):
#     """Форма не связанная с моделью"""
#     author_array = (
#         [author.id, f"{author.last_name} {author.first_name}"] for author in Author.objects.all()
#     )
        
#     book_name = forms.CharField(max_length=1024, label='Название книги', widget=forms.TextInput(attrs={'class': 'field-book-name'}))
#     slug = forms.SlugField(max_length=255, label='URL адрес',)
#     description = forms.CharField(
#         widget=forms.Textarea(attrs={'cols': 60, 'rows': 10}),
#         label='Описание',
#     )
#     date_create = forms.DateField(label='Дата написания')
#     is_deleted = forms.BooleanField(label='Удален', required=False)
#     genre = forms.ModelChoiceField(
#         queryset=Genre.objects.all(), 
#         label='Жанр', 
#         empty_label='Жанр не выбран',
#     )
#     publishing_house = forms.ModelChoiceField(
#         queryset=PublishingHouse.objects.all(), 
#         label='Издательство', 
#         empty_label='Издательство не выбрано',
#     )
#     author = forms.MultipleChoiceField(
#         widget=forms.SelectMultiple,
#         choices=author_array,
#         label="Авторы",
#         required=True,
#     )
