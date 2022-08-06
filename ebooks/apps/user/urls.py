from django.urls import path
from .views import RegistrationUser, LoginUser, logout


urlpatterns = [
    path('registration/', RegistrationUser.as_view(), name='registration'),
    path('login/', LoginUser.as_view(), name='login'),
    path('logout/', logout, name='logout'),
]