from django.contrib import admin
from django.db import models
from django.urls import reverse


class Book(models.Model):
    book_name = models.CharField(max_length=1024, verbose_name='Название книги')
    slug = models.SlugField(max_length=255, unique=True, db_index=True, null=True, verbose_name="URL адрес")
    description = models.TextField(verbose_name='Описание')
    book_image = models.ImageField(
        upload_to='books/%Y/%m/%d', 
        verbose_name='Изображение обложки',
        null=True,
        blank=True,
    )
    date_add = models.DateField(auto_now_add=True, verbose_name='Дата добавления')
    date_create = models.DateField(verbose_name='Дата написания')
    is_deleted = models.BooleanField(default=False, verbose_name='Удален')
    genre = models.ForeignKey(
        "Genre", 
        on_delete=models.PROTECT,
        related_name="genre_books",
        verbose_name="ID жанра",
    )
    publishing_house = models.ForeignKey(
        "PublishingHouse",
        on_delete=models.PROTECT,
        related_name="publishing_house_books",
        verbose_name="ID издательства",
        null=True,
    )
    author = models.ManyToManyField(
        "Author",
        related_name="author_books",
        verbose_name="ID авторов",
    )
        
    def get_absolute_url(self):
        return reverse('book', kwargs={"book_slug": self.slug})
    
    def __str__(self):
        return self.book_name

    class Meta:
        verbose_name = "Книга"
        verbose_name_plural = "Книги"
        ordering = ['-pk', 'book_name']
        
        
class Genre(models.Model):
    genre_name = models.CharField(max_length=512, db_index=True, verbose_name="Жанр")
    slug = models.SlugField(max_length=255, unique=True, db_index=True, null=True, verbose_name="URL адрес")
    is_deleted = models.BooleanField(default=False, verbose_name='Удален')

    def get_absolute_url(self):
        return reverse('genre', kwargs={"genre_slug": self.slug})
        
    def __str__(self):
        return self.genre_name
    
    class Meta:
        verbose_name = "Жанр"
        verbose_name_plural = "Жанры"    
        

class PublishingHouse(models.Model):
    publishing_house_name = models.CharField(max_length=300, verbose_name="Название издательства")
    address = models.CharField(max_length=1500, verbose_name="Адресс издательства")
    contact_phone = models.CharField(max_length=12, verbose_name="Номер телефона")
    email = models.EmailField(max_length=254, verbose_name="Электронный адрес")
    website_link = models.URLField(max_length=255, verbose_name="Адрес сайта", null=True, blank=True)
    date_add = models.DateTimeField(auto_now_add=True, verbose_name="Дата добавления")
    is_deleted = models.BooleanField(default=False, verbose_name='Удален')

    def __str__(self):
        return self.publishing_house_name

    class Meta:
        verbose_name = "Издательство"
        verbose_name_plural = "Издательства"    
        

class Author(models.Model):
    first_name = models.CharField(max_length=100, verbose_name="Имя")
    last_name = models.CharField(max_length=100, verbose_name="Фамилия")
    father_name = models.CharField(max_length=100, verbose_name="Отчество", null=True, blank=True)
    country = models.CharField(max_length=100, verbose_name="Страна")
    birthday = models.DateField(verbose_name="Дата рождения")
    language = models.JSONField(verbose_name="Языки на которыз писал автор")
    date_add = models.DateTimeField(auto_now_add=True, verbose_name="Дата добавления")
    is_deleted = models.BooleanField(default=False, verbose_name='Удален')

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

    class Meta:
        verbose_name = "Автор"
        verbose_name_plural = "Авторы"


class BookInAuthor(admin.TabularInline):
    model = Book.author.through
