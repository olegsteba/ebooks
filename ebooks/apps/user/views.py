from multiprocessing import context
from django.http import HttpRequest, HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, HttpResponseNotFound, HttpResponseRedirect
from django.urls import reverse_lazy
from django.contrib.auth.models import User
from django.contrib import auth
from django.views.generic import ListView, DetailView, CreateView
from .utils import DataMixin
from .forms import RegistrationUserForm


class RegistrationUser(DataMixin, CreateView):
    form_class = RegistrationUserForm
    template_name = 'user/registration.html'
    success_url = reverse_lazy('login')
    
    def get_context_data(self, *, object_list=None, **kwargs):
        """Формируем контекст для вывода"""
        context = super().get_context_data(**kwargs)
        c_def = self.get_user_context(title='Регистрация')
        context.update(c_def)
        return context
    

def login(request):
    context = {
        'title': 'Вход',        
    }        
    return render(request, 'about.html', context=context)


def logout(request):
    auth.logout(request)
    return redirect('home')