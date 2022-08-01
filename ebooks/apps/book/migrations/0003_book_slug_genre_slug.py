# Generated by Django 4.0.6 on 2022-08-01 12:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('book', '0002_alter_book_options'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='slug',
            field=models.SlugField(max_length=255, null=True, unique=True, verbose_name='URL адрес'),
        ),
        migrations.AddField(
            model_name='genre',
            name='slug',
            field=models.SlugField(max_length=255, null=True, unique=True, verbose_name='URL адрес'),
        ),
    ]