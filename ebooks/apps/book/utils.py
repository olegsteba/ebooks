from .models import Genre


class DataMixin:
    paginate_by = 3 #Построничный вывод
    
    def get_user_context(self, **kwargs):
        """Формируем контекст для вывода"""
        context = kwargs
        genres = Genre.objects.all()
        context['genre'] = genres
        if 'genre_selected' not in context:
            context['genre_selected'] = 0
        return context