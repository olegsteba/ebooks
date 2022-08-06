class DataMixin:  
    def get_user_context(self, **kwargs):
        """Формируем контекст для вывода"""
        context = kwargs
        context['main_menu'] = [
            {'title': "Главная", 'url_name': 'home'}, 
            {'title': "О сате", 'url_name': 'about'},
            # {'title': "Задать вопрос", 'url_name': 'question'},
            {'title': "Добавить книгу", 'url_name': 'add_book'},
            {'title': "Войти", 'url_name': 'login'},
            {'title': "Регистрация", 'url_name': 'registration'},
            {'title': "Выйти", 'url_name': 'logout'},
        ]         
        return context