from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.index, name="Index"),
    path('login/', views.checkLogin, name="Login"),
    path('registration/', views.checkRegistration, name="Registration"),
    path('contact/', views.contact, name="Contact"),
    path('about/', views.about, name="About"),
    path('forgotPassword/', views.forgotPassword, name="Forgot"),
    path('otpVerification/', views.otpVerification, name="Verification"),
    path('resetPassword/', views.resetPassword, name="ResetPass"),
    path('admin/home/', views.adminIndex, name="Admin"),
    path('admin/home/<slug:id>', views.deleteProduct, name="DeleteProduct"),
    path('admin/home/update/<slug:id>',
         views.updateProduct, name="UpdateProduct"),
    path('admin/addProduct', views.addProduct, name="AddProduct"),
    path('admin/category', views.category, name="Category"),
    path('admin/category/<slug:id>', views.deleteCategory, name="DeleteCategory"),
    path('details/<slug:id>', views.details, name="Details"),
    path('product/', views.products, name="Product"),
    path('cart/', views.cart, name="MyCart"),
    # path('product/search/<slug:search>', views.searchProducts, name="Search"),
    path('cart/checkout', views.checkout, name="Checkout"),
    path('wishlist/', views.myWishlist, name="MyWish"),
    path('admin/contact', views.adminContactUs, name="AdminContact"),
    path('logout/', views.userLogout, name="Logout")
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
