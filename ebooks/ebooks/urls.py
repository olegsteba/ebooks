from django.conf.urls.static import static
from django import views
from ebooks import settings
from django.contrib import admin
from django.urls import path, include
from apps.book.views import pageNotFound



urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('apps.book.urls')),
    path('user/', include('apps.user.urls')),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

handler404 = pageNotFound
