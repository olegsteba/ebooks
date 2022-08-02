from django.contrib import admin
from .models import Book, Genre, PublishingHouse, Author, BookInAuthor


class BookAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'book_name', 'slug', 'book_image', 
        'date_create', 'genre', 'is_deleted',
    )
    list_display_links = ('id', 'book_name',)
    search_fields = ('book_name', 'genre',)
    list_editable = ('is_deleted',)
    list_filter = ('genre', 'publishing_house', 'is_deleted')
    fieldsets = (
        (
            (None,{
                'fields': (
                    'book_name', 'slug', 'description', 'book_image',
                    'date_create', 'is_deleted',
                    'genre', 'publishing_house', 'author',
                )
            }),
        )
    )
    prepopulated_fields = {'slug': ('book_name',)} #Автоматическое заполнение слага URL
    
    
class GenreAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'genre_name', 'slug', 'is_deleted',
    )
    list_display_links = ('id', 'genre_name',)
    search_fields = ('genre_name',)
    list_editable = ('is_deleted',)
    list_filter = ('genre_name', 'is_deleted')
    fieldsets = (
        (
            (None,{
                'fields': (
                    'genre_name', 'slug', 'is_deleted',
                )
            }),
        )
    )
    prepopulated_fields = {'slug': ('genre_name',)}    


class PublishingHouseAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'publishing_house_name', 'address',
        'contact_phone', 'email', 'website_link', 'is_deleted'
    )
    list_display_links = ('id', 'publishing_house_name')
    search_fields = ('publishing_house_name',)
    list_editable = ('is_deleted',)
    list_filter = ('address', 'is_deleted')
    fieldsets = (
        (
            (None, {
                'fields': ('publishing_house_name', 'address', 'is_deleted')
            }),
            ('Контакты', {
                'fields': ('contact_phone', 'email', 'website_link',)
            }),
        )
    )
    
    
class AuthorAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'first_name', 'last_name',
        'father_name', 'country',
        'birthday', 'language',
        'date_add', 'is_deleted'
    )
    list_display_links = ('id', 'first_name',)
    search_fields = ('first_name', 'last_name',)
    list_editable = ('is_deleted',)
    list_filter = ('country', 'is_deleted', )
    
    inlines = [
       BookInAuthor,
    ]
    

     
#Регистрация моделей в админ-панеле
admin.site.register(Book, BookAdmin)
admin.site.register(Genre, GenreAdmin)
admin.site.register(PublishingHouse, PublishingHouseAdmin)
admin.site.register(Author, AuthorAdmin)
