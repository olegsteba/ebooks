from django.urls import path
from .views import RegistrationUser, login, logout


urlpatterns = [
    path('registration/', RegistrationUser.as_view(), name='registration'),
    path('login/', login, name='login'),
    path('logout/', logout, name='logout'),
]