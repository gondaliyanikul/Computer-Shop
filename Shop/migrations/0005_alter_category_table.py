# Generated by Django 4.1.3 on 2022-12-11 10:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Shop', '0004_category'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='category',
            table='categorys',
        ),
    ]