class DataMixin:  
    def get_user_context(self, **kwargs):
        """Формируем контекст для вывода"""
        context = kwargs
        return context