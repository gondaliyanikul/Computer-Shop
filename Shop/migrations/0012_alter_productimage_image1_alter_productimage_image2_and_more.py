# Generated by Django 4.1.3 on 2022-12-14 06:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Shop', '0011_productimage'),
    ]

    operations = [
        migrations.AlterField(
            model_name='productimage',
            name='image1',
            field=models.ImageField(default='', upload_to='images'),
        ),
        migrations.AlterField(
            model_name='productimage',
            name='image2',
            field=models.ImageField(default='', upload_to='images'),
        ),
        migrations.AlterField(
            model_name='productimage',
            name='image3',
            field=models.ImageField(default='', upload_to='images'),
        ),
        migrations.AlterField(
            model_name='productimage',
            name='image4',
            field=models.ImageField(default='', upload_to='images'),
        ),
        migrations.AlterField(
            model_name='productimage',
            name='image5',
            field=models.ImageField(default='', upload_to='images'),
        ),
    ]
