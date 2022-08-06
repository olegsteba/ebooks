from django import forms
from django.core.exceptions import ValidationError
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm


class RegistrationUserForm(UserCreationForm):
    username = forms.CharField(label='Логин', widget=forms.TextInput(attrs={'class': ''}))
    email = forms.EmailField(label='Адрес электронной почты', widget=forms.EmailInput(attrs={'class': ''}))
    password1 = forms.CharField(label='Пароль', widget=forms.PasswordInput(attrs={'class': ''}))
    password2 = forms.CharField(label='Подтверждение пароля', widget=forms.PasswordInput(attrs={'class': ''}))
    
    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2',)
        

class LoginUserForm(AuthenticationForm):
    username = forms.CharField(label='Логин', widget=forms.TextInput(attrs={'class': ''}))
    password = forms.CharField(label='Пароль', widget=forms.PasswordInput(attrs={'class': ''}))


        