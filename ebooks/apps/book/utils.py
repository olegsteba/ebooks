from .models import Genre


class DataMixin:
    paginate_by = 3 #Построничный вывод   
    
    def get_user_context(self, **kwargs):
        """Формируем контекст для вывода"""
        context = kwargs
        genres = Genre.objects.all()
        context['genre'] = genres
        context['main_menu'] = [
            {'title': "Главная", 'url_name': 'home'}, 
            {'title': "О сате", 'url_name': 'about'},
            # {'title': "Задать вопрос", 'url_name': 'question'},
            {'title': "Добавить книгу", 'url_name': 'add_book'},
            {'title': "Войти", 'url_name': 'login'},
            {'title': "Регистрация", 'url_name': 'registration'},
            {'title': "Выйти", 'url_name': 'logout'},
        ] 
        if 'genre_selected' not in context:
            context['genre_selected'] = 0
        return context