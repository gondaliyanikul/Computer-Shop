from django.shortcuts import render, redirect, HttpResponseRedirect
from ComputerShop.settings import RAZORPAY_API_KEY, RAZORPAY_API_SECRET_KEY
from .manager import DatabaseManager as Data
from django.core.mail import send_mail
import random
import datetime
import razorpay

# Create your views here.


def index(request):

    user = request.session.get('email', '')

    print(user)

    user_id = Data.getUserId(user)

    new_user_id = Data.removePuncInt(user_id)

    wishlist_product_id = []

    if user != '':

        product_ids = Data.getProductId(new_user_id)

        wishlists = list(product_ids)

        for w in wishlists:
            wishlist_product_id.append(w[0])

    product = Data.showProduct()

    print("user: ", user)

    params = {'product': product, 'navbar': 'page1',
              'users': user, 'wishlist_product': wishlist_product_id}

    return render(request, 'index.html', params)


def checkLogin(request):

    msg = ""

    if request.method == "POST":

        email = request.POST.get('email', None)
        password = request.POST.get('password', None)

        data0 = Data.userLogin(email, password)

        data1 = Data.adminLogin(email, password)

        print("user : ", email)
        print("user : ", password)
        print("user : ", data0)
        print("admin : ", data1)

        if data0 == [(0,)]:
            request.session['email'] = email

            return redirect('/')

        elif data1 == [(1,)]:
            request.session['email'] = email

            return redirect('/admin/home')

        else:
            msg = "Login fail"

    params = {"message": msg}

    return render(request, 'login.html', params)


def checkRegistration(request):

    msg = ""

    if request.method == "POST":

        name = request.POST['name']
        email = request.POST['email']
        mobile = request.POST['mobile']
        password = request.POST['password']

        data = Data.exeistEmail(email)

        if data:

            msg = "Email is already exist"

        else:

            if len(mobile) == 10:

                Data.addUser(name, mobile, email, password)

                Data.deleteOtp(email)

                request.session['email'] = email

                otp = random.randint(100000, 999999)

                Data.insertOtp(email, otp)

                Data.sendEmail(otp, email)

                # send_mail(
                #     'Computer Shop',
                #     f'Your otp is : {otp}',
                #     'computershop501@gmail.com',
                #     [f'{email}'],
                #     fail_silently=False,
                # )

                print("Send mail success")

                return redirect('/otpVerification')

            else:
                msg = "mobile number is invalid"

    params = {'message': msg}

    return render(request, 'registration.html', params)


def contact(request):

    user = request.session.get('email', '')

    if request.method == "POST":

        name = request.POST.get('name')
        email = request.POST.get('email')
        mobile = int(request.POST.get('number'))
        message = request.POST.get('message')

        user_id = Data.getUserId(user)

        new_user_id = Data.removePuncInt(user_id)

        Data.callAdmin(name, email, mobile, message, new_user_id)

    return render(request, 'contact.html', {'navbar': 'page4'})


def about(request):

    return render(request, 'about.html', {'navbar': 'page2'})


def forgotPassword(request):

    msg = ""

    if request.method == "POST":

        email = request.POST['email']

        data = Data.emailValid(email)

        if data:

            request.session['email'] = email

            Data.deleteOtp(email)

            otp = random.randint(100000, 999999)

            Data.insertOtp(email, otp)

            Data.sendEmail(otp, email)

            return redirect('/otpVerification')

        else:
            msg = "Email is Invalid"

    params = {'message': msg}

    return render(request, 'forgotPassword.html', params)


def otpVerification(request):

    msg = ""

    email = request.session.get('email', '')

    if request.method == "POST":

        otp = request.POST['otp']

        print(otp, email)

        data = Data.ShowOtp(email, otp)

        if data:
            return redirect('/')

        else:
            msg = "Invalid otp"

        # return redirect('/resetPassword')
    params = {"message": msg}

    return render(request, 'otpVerification.html', params)


def resetPassword(request):

    msg = ""

    user = request.session.get('email', '')

    if request.method == "POST":

        pass1 = request.POST.get('password1')
        pass2 = request.POST.get('password2')

        if pass1 == pass2:

            user_id = Data.getUserId(user)

            new_user_id = Data.removePuncInt(user_id)

            print(new_user_id)

            Data.updatePassword(pass1, new_user_id)

            return redirect('/')
        else:

            msg = "Both password are not match"

    params = {'message': msg}

    return render(request, 'resetPassword.html', params)


def adminIndex(request):

    user = request.session.get('email', '')

    user_id = Data.getUserId(user)

    if user_id == [(1,)]:

        data = Data.showAdminProduct()

        params = {'products': data, 'navbar': 'page1'}
    else:

        return redirect('/')

    return render(request, 'adminIndex.html', params)


def addProduct(request):

    msg = ""

    user = request.session.get('email', '')

    user_id = Data.getUserId(user)

    if user_id == [(1,)]:

        data = Data.showAdminProduct()

        params = {'products': data, 'navbar': 'page1'}
    else:

        return redirect('/')

    if request.method == "POST":

        files = request.FILES.getlist('files[]', None)

        name = request.POST['name']
        price = request.POST['price']
        company = request.POST['company']
        category = request.POST['option']
        quantity = request.POST['quantity']
        model = request.POST['model']
        size = request.POST['size']
        description = request.POST['description']

        image1 = ""
        image2 = ""
        image3 = ""
        image4 = ""
        image5 = ""

        for i in files:

            handle_upload_file(i)

            if image1 == "":
                image1 = i

            elif image2 == "":
                image2 = i

            elif image3 == "":
                image3 = i

            elif image4 == "":
                image4 = i

            elif image5 == "":
                image5 = i

            elif msg == "":
                msg = "File upload success"
                break

        if category != "--Select--":

            Data.insertProduct(name, price, company, category,
                               quantity, model, size, description)

            getId = Data.lastIdGet()

            newId = Data.removePuncInt(getId)

            Data.insertProductImage(
                newId, image1, image2, image3, image4, image5)

    data = Data.showAdminCategory()

    params = {'options': data, 'message': msg,
              'navbar': 'page2', 'product': 'newAdd'}

    return render(request, 'addProduct.html', params)


def handle_upload_file(f):
    with open('media/images/'+f.name, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)


def category(request):

    user = request.session.get('email', '')

    user_id = Data.getUserId(user)

    if user_id == [(1,)]:

        data = Data.showAdminProduct()

        params = {'products': data, 'navbar': 'page1'}
    else:

        return redirect('/')

    if request.method == "POST":

        AddItem = request.POST.get('category')

        categoryValue = request.POST.get('editCategory', None)
        catId = request.POST.get('catId')

        if AddItem:

            Data.AddCategory(AddItem)

        if catId != None and categoryValue:

            Data.updateCategory(categoryValue, int(catId))

    data = Data.showAdminCategory()

    params = {"category": data, 'navbar': 'page3'}

    return render(request, 'category.html', params)


def details(request, id):

    user = request.session.get('email', '')

    data = Data.showProductDetails(id)

    category = Data.getProductCategoryId(id)

    new_category = Data.removePuncString(category)

    cart = Data.showCategoryProduct(new_category)

    print(cart)

    params = {'product': data, 'carts': cart, 'users': user}

    return render(request, 'details.html', params)


def products(request):

    msg = "Hello"
    search = ""
    searchCategory = ""

    user = request.session.get('email', '')

    print(user)

    if request.method == "POST":
        search = request.POST.get('search', '')
        searchCategory = request.POST.get('category', '')
        product_id = request.POST.get('product_id', None)
        cart = request.POST.get('addCart', None)
        wish = request.POST.get('addWish', None)
        like = request.POST.get('like', None)

        print(wish, like)

        time = datetime.datetime.now()

        user_id = Data.getUserId(user)

        new_id = Data.removePuncInt(user_id)

        if cart != None:

            old_quantity = Data.getQuantity(product_id, new_id)

            new_quantity = Data.removePuncInt(old_quantity)

            if new_quantity != "":

                Data.updateCartQuantity(
                    new_quantity+1, time, product_id, new_id)

                msg = "Add to cart item"

            else:

                Data.addToCart(time, product_id, new_id)

                msg = "Add to cart item"

        elif wish != None:

            if like == '0':
                Data.deleteWishlist(product_id, new_id)
                print("delete wish")
            else:
                Data.addWishlist(time, product_id, new_id)
                print("add wish")

    category = Data.showCategory()

    user_id = Data.getUserId(user)

    new_user_id = Data.removePuncInt(user_id)

    wishlist_product_id = []

    if user != '':

        product_ids = Data.getProductId(new_user_id)

        wishlists = list(product_ids)

        for w in wishlists:
            wishlist_product_id.append(w[0])

    product = Data.searchProduct(new_user_id, search, searchCategory)

    params = {'category': category, 'product': product,
              'message': msg, 'navbar': 'page3', 'search': search, 'searchCat': searchCategory, 'users': user, 'wishlist_product': wishlist_product_id}

    return render(request, 'product.html', params)


def cart(request):

    user = request.session.get('email', '')

    if request.method == "POST":

        product_id = request.POST.get("product_id", None)

        product_id_increment = request.POST.get("increment_productId", None)

        quantity = request.POST.get("incrementQuantity", None)

        product_id_decrement = request.POST.get("decrement_productId", None)

        decrement_quantity = request.POST.get("decrementQuantity", None)

        user_id = Data.getUserId(user)

        new_id = Data.removePuncInt(user_id)

        Data.deleteCartWishlist(product_id, new_id)

        Data.incrementQuantity(quantity, product_id_increment, new_id)

        Data.decrementQuantity(
            decrement_quantity, product_id_decrement, new_id)

    user_id = Data.getUserId(user)

    new_user_id = Data.removePuncInt(user_id)

    cart_data = Data.showCartData(new_user_id)

    totalSum = Data.sumQuantity(new_user_id)

    totalQty = Data.removePuncInt(totalSum)

    params = {'products': cart_data, 'navbar': 'page5', 'sumQty': totalQty}

    return render(request, 'cart.html', params)


def checkout(request):

    user = request.session.get('email', '')

    user_id = Data.getUserId(user)

    new_user_id = Data.removePuncInt(user_id)

    if request.method == "POST":

        fname = request.POST.get('first', '')
        lname = request.POST.get('last', '')
        phone = int(request.POST.get('phone', ''))
        email = request.POST.get('email', '')
        address1 = request.POST.get('address1', '')
        address2 = request.POST.get('address2', '')
        city = request.POST.get('city', '')
        state = request.POST.get('state', '')
        country = request.POST.get('country', '')
        pin = int(request.POST.get('pin', ''))

        payment = request.POST.get('payment', '')

        if fname != '' and lname != '' and phone != '' and email != '' and address1 != '' and address2 != '' and city != '' and state != '' and country != '' and pin != '':

            Data.insertCheckout(fname, lname, email, phone, address1,
                                address2, city, state, country, pin, new_user_id)

        if payment != '':

            Data.orderQuantity(new_user_id)

    addreses = Data.checkoutShowAddress(new_user_id)

    totalSum = Data.sumQuantity(new_user_id)

    totalQty = Data.removePuncInt(totalSum)

    client = razorpay.Client(auth=(RAZORPAY_API_KEY, RAZORPAY_API_SECRET_KEY))

    DATA = {
        "amount": totalQty*100,
        "currency": "INR",
    }
    payment_order = client.order.create(data=DATA)

    payment_order_id = payment_order['id']

    uname = Data.getUserName(user)

    user_name = Data.removePuncString(uname)

    umobile = Data.getUserMobile(user)

    user_mobile = Data.removePuncInt(umobile)

    params = {'address': addreses, 'totalPay': totalQty,
              'api_key': RAZORPAY_API_KEY, 'order_id': payment_order_id, 'user_name': user_name, 'email': user, 'mobile': user_mobile}

    return render(request, 'checkout.html', params)


def myWishlist(request):

    user = request.session.get('email', '')

    if request.method == "POST":

        product_id = request.POST.get("product_id", None)

        user_id = Data.getUserId(user)

        new_id = Data.removePuncInt(user_id)

        Data.deleteWishlist(product_id, new_id)

    user_id = Data.getUserId(user)

    new_user_id = Data.removePuncInt(user_id)

    print(new_user_id)

    data = Data.showWishlist(new_user_id)

    params = {"wishes": data, 'navbar': 'page6'}

    return render(request, 'wishlist.html', params)

# 22qqcbi


def deleteCategory(request, id):

    Data.deleteCategoryId(id)

    return redirect('/admin/category')


def deleteProduct(id):
    print(id)

    Data.deleteProductId(id)

    return redirect('/admin/home')


def updateProduct(request, id):

    user = request.session.get('email', '')

    user_id = Data.getUserId(user)

    if user_id == [(1,)]:

        data = Data.showAdminProduct()

        params = {'products': data, 'navbar': 'page1'}
    else:

        return redirect('/')

    if request.method == "POST":

        # print('hello')

        name = request.POST.get('name', '')
        price = request.POST.get('price', '')
        company = request.POST.get('company', '')
        category = request.POST.get('option', '')
        quantity = request.POST.get('quantity', '')
        model = request.POST.get('model', '')
        size = request.POST.get('size', '')
        description = request.POST.get('description', '')

        # print(id, name, price, company, category,
        #       quantity, model, size, description)

        Data.updateProduct(name, price, company, category,
                           quantity, model, size, description, id)

        return redirect('/admin/home')

    productData = Data.showUpdateProduct(id)

    data = Data.showAdminCategory()

    params = {'options': data,
              'navbar': 'page2', 'products': productData}

    return render(request, 'updateProduct.html', params)


def adminContactUs(request):

    user = request.session.get('email', '')

    user_id = Data.getUserId(user)

    if user_id == [(1,)]:

        data = Data.showAdminProduct()

        params = {'products': data, 'navbar': 'page1'}
    else:

        return redirect('/')

    contacts = Data.showContact()

    params = {'navbar': 'page4', 'contacts': contacts}

    return render(request, 'adminContactUs.html', params)


def userLogout(request):

    request.session['email'] = ''

    return redirect('/')
