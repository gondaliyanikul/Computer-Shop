from django.db import models

# Create your models here.


class Registers(models.Model):

    name = models.CharField(max_length=50, null=False)
    mobile = models.IntegerField(null=False)
    email = models.EmailField(max_length=50, null=False)
    password = models.TextField(max_length=50, null=False)
    user_type = models.IntegerField(null=False)

    class Meta:
        db_table = "users"


class OtpVerification(models.Model):

    email = models.EmailField(max_length=50)
    otp = models.IntegerField(null=False)

    class Meta:
        db_table = "otp_verification"


class Category(models.Model):

    category = models.CharField(max_length=50, null=False)

    class Meta:
        db_table = "categorys"


class Product(models.Model):

    name = models.CharField(max_length=100, null=False)
    price = models.FloatField(null=False)
    company = models.CharField(max_length=50, null=False)
    category = models.CharField(max_length=50, null=False)
    quantity = models.IntegerField(null=False)
    model = models.CharField(max_length=50, null=False)
    display_size = models.CharField(max_length=50, null=False)
    description = models.CharField(max_length=1000, null=False)

    class Meta:
        db_table = "products"


class ProductImage(models.Model):

    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    image1 = models.ImageField(upload_to='images', default="")
    image2 = models.ImageField(upload_to='images', default="")
    image3 = models.ImageField(upload_to='images', default="")
    image4 = models.ImageField(upload_to='images', default="")
    image5 = models.ImageField(upload_to='images', default="")

    class Meta:
        db_table = "product_image"


class Cart(models.Model):

    user = models.ForeignKey(Registers, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(null=False, blank=False)
    time = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = "cart"


class Wishlist(models.Model):

    user = models.ForeignKey(Registers, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    time = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = "wishlist"


class Order(models.Model):

    fname = models.CharField(max_length=100, null=False)
    lname = models.CharField(max_length=100, null=False)
    email = models.EmailField(max_length=100, null=False)
    phone = models.IntegerField(null=False)
    address1 = models.CharField(max_length=100, null=False)
    address2 = models.CharField(max_length=100, null=False)
    city = models.CharField(max_length=100, null=False)
    state = models.CharField(max_length=100, null=False)
    country = models.CharField(max_length=100, null=False)
    pin = models.IntegerField(null=False)
    user = models.ForeignKey(Registers, on_delete=models.CASCADE)

    class Meta:
        db_table = "orders"


class Contact(models.Model):

    name = models.CharField(max_length=100, null=False)
    email = models.EmailField(max_length=100, null=False)
    mobile = models.IntegerField(null=False)
    message = models.CharField(max_length=255, null=False)
    user = models.ForeignKey(Registers, on_delete=models.CASCADE)

    class Meta:
        db_table = "contacts"
