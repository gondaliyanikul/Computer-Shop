from mysql import connector as c
import random
from django.core.mail import send_mail

con = c.connect(host="localhost", user="root",
                passwd="", database="computer_shop")

cursor = con.cursor()


class DatabaseManager():

    def insertOtp(email, otp):

        otpQuery = f"insert into otp_verification(email,otp)values('{email}','{otp}')"

        cursor.execute(otpQuery)

        con.commit()

    def sendEmail(otp, email):

        send_mail(
            'Computer Shop',
            f'Your otp is : {otp}',
            'computershop501@gmail.com',
            [f'{email}'],
            fail_silently=False,
        )

        print("Send mail success")

    def addUser(name, mobile, email, password):

        query = f"insert into users(name,mobile,email,password,user_type)values('{name}',{mobile},'{email}','{password}',{0})"

        cursor.execute(query)

        con.commit()

    def deleteOtp(email):

        otpQuery = f"delete from otp_verification where email='{email}' "

        cursor.execute(otpQuery)

        con.commit()

    def removePuncInt(remove):

        new_id = ""

        punc = '''!()-[];:'"\,<>./?@#$%^&*_-'''

        for i in remove:
            for j in i:
                if j is not punc:
                    new_id = j

        return new_id

    def removePuncString(remove):

        new_id = ""

        punc = '''!()-[];:'"\,<>./?@#$%^&*_-'''

        for i in remove:
            for j in i:
                if j is not punc:
                    new_id += j

        return new_id

    def homePageShowProduct():

        product_join_query = f"select products.id, products.name, products.description, products.price ,product_image.image1 from products join product_image on products.id=product_image.product_id "

        cursor.execute(product_join_query)

        data = cursor.fetchall()

        return data

    def getProductId(user_id):

        get_query = f"select product_id from wishlist where user_id={user_id} "

        cursor.execute(get_query)

        data = cursor.fetchall()

        return data

    def showCategory():

        category_query = f"select id, category from categorys "

        cursor.execute(category_query)

        data = cursor.fetchall()

        return data

    def showProduct():

        # product_join_query = f"select products.id, products.name, products.description, products.price ,product_image.image1, from products join product_image on products.id=product_image.product_id "
        product_join_query = f"select products.id, products.name, products.description, products.price ,product_image.image1, wishlist.product_id from products join product_image on products.id=product_image.product_id left join wishlist on products.id=wishlist.product_id"

        cursor.execute(product_join_query)

        data = cursor.fetchall()

        return data

    def searchProduct(user_id, search="", searchCategory=""):

        print("user: ", user_id)

        if (search == "" and searchCategory == ""):
            product_join_query = f"select products.id, products.name, products.description, products.price ,product_image.image1 from products join product_image on products.id=product_image.product_id"
        elif (search != "" and searchCategory == ""):
            product_join_query = f"select products.id, products.name, products.description, products.price ,product_image.image1 from products join product_image on products.id=product_image.product_id where products.name like '%{search}%'"
        elif (search == "" and searchCategory != ""):
            product_join_query = f"select products.id, products.name, products.description, products.price ,product_image.image1 from products join product_image on products.id=product_image.product_id where products.category like '%{searchCategory}%'"
        else:
            product_join_query = f"select products.id, products.name, products.description, products.price ,product_image.image1 from products join product_image on products.id=product_image.product_id where products.name like '%{search}%' and products.category like '%{searchCategory}%'"

        cursor.execute(product_join_query)

        data = cursor.fetchall()

        return data

    def searchCategory(category):

        product_join_query = f"select products.id, products.name, products.description, products.price ,product_image.image1, wishlist.product_id from products join product_image on products.id=product_image.product_id left join wishlist on products.id=wishlist.product_id where products.category like '%{category}%' "

        cursor.execute(product_join_query)

        data = cursor.fetchall()

        return data

    def showCartData(user_id):

        print(type(user_id))

        cart_query = f"select products.id, products.name, cart.quantity, products.price, product_image.image1 from products inner join product_image on products.id=product_image.product_id inner join cart on products.id=cart.product_id where cart.user_id='{user_id}' "

        cursor.execute(cart_query)

        data = cursor.fetchall()

        return data

    def getUserId(user):

        user_id_query = f"select id from users where email='{user}' "

        cursor.execute(user_id_query)

        data = cursor.fetchall()

        return data

    def deleteCartWishlist(product_id, new_id):

        delete_wish_query = f"delete from cart where product_id='{product_id}' and user_id='{new_id}' "

        cursor.execute(delete_wish_query)

        con.commit()

    def insertCheckout(fname, lname, email, phone, address1, address2, city, state, country, pin, new_user_id):

        checkout_query = f"insert into orders(fname,lname,email,phone,address1,address2,city,state,country,pin,user_id)values('{fname}','{lname}','{email}',{phone},'{address1}','{address2}','{city}','{state}','{country}',{pin},{new_user_id})"

        cursor.execute(checkout_query)

        con.commit()

    def checkoutShowAddress(user_id):

        address_show_query = f"select fname, lname, address1, address2, city, state, country, pin from orders where user_id={user_id} "

        cursor.execute(address_show_query)

        data = cursor.fetchall()

        print(data)

        return data

    def deleteWishlist(product_id, new_id):

        delete_wish_query = f"delete from wishlist where product_id='{product_id}' and user_id='{new_id}' "

        cursor.execute(delete_wish_query)

        con.commit()

    def showWishlist(user_id):

        wish_query = f"select products.id, products.name, products.price, product_image.image1 from products inner join product_image on products.id=product_image.product_id inner join wishlist on products.id=wishlist.product_id where wishlist.user_id={user_id} "

        cursor.execute(wish_query)

        data = cursor.fetchall()

        return data

    def deleteProductId(id):

        delete_product_query = f"delete from products where id={id} "

        cursor.execute(delete_product_query)

        con.commit()

    def deleteCategoryId(id):

        delete_category_query = f"delete from categorys where id={id} "

        cursor.execute(delete_category_query)

        con.commit()

    def getQuantity(product_id, new_id):

        product_Quantity_query = f"select quantity from cart where product_id='{product_id}' and user_id='{new_id}' "

        cursor.execute(product_Quantity_query)

        data = cursor.fetchall()

        return data

    def sumQuantity(user_id):

        sum_query = f"select sum(products.price * cart.quantity) as total from cart join products on cart.product_id=products.id where cart.user_id={user_id} "

        cursor.execute(sum_query)

        data = cursor.fetchall()

        return data

    def incrementQuantity(quantity, product_id, new_id):

        print(quantity)

        if quantity:

            increment_query = f"update cart set quantity={quantity} where product_id='{product_id}' and user_id='{new_id}' "

            cursor.execute(increment_query)

            con.commit()

    def decrementQuantity(quantity, product_id, new_id):

        print(quantity)

        if quantity:

            increment_query = f"update cart set quantity={quantity} where product_id='{product_id}' and user_id='{new_id}' "

            cursor.execute(increment_query)

            con.commit()

    def updateCartQuantity(new_quantity, time, product_id, new_id):

        cart_query = f"update cart set quantity={new_quantity}, time='{time}' where product_id='{product_id}' and user_id='{new_id}' "

        cursor.execute(cart_query)

        con.commit()

    def addToCart(time, product_id, new_id):

        add_cart_query = f"insert into cart(quantity,time,product_id,user_id)values({1},'{time}',{product_id},{new_id})"

        cursor.execute(add_cart_query)

        con.commit()

    def addWishlist(time, product_id, new_id):

        add_wish_query = f"insert into wishlist(time,product_id,user_id)values('{time}',{product_id},{new_id})"

        cursor.execute(add_wish_query)

        con.commit()

    def showProductDetails(id):

        product_image_query = f"select products.id, product_image.image1, product_image.image2, product_image.image3, product_image.image4, products.name, products.category, products.company, products.model, products.price, products.description from products join product_image on products.id=product_image.product_id where products.id={id} "

        cursor.execute(product_image_query)

        data = cursor.fetchall()

        return data

    def getProductCategoryId(id):

        category_search = f"select category from products where id={id}"

        cursor.execute(category_search)

        data = cursor.fetchall()

        return data

    def showCategoryProduct(new_category):

        category_query = f"select products.id, products.name, products.description, products.price ,product_image.image1 from products join product_image on products.id=product_image.product_id where products.category like '%{new_category}%' "

        cursor.execute(category_query)

        data = cursor.fetchall()

        return data

    def AddCategory(AddItem):

        query = f"insert into categorys(category)values('{AddItem}')"

        cursor.execute(query)

        con.commit()

    def updateCategory(categoryValue, catId):

        update_query = f"update categorys set category='{categoryValue}' where id={catId}"

        cursor.execute(update_query)

        con.commit()

    def showAdminCategory():

        query = f"select * from categorys"

        cursor.execute(query)

        data = cursor.fetchall()

        return data

    def insertProductImage(newId, image1, image2, image3, image4, image5):

        product_image_query = f"insert into product_image(product_id,image1,image2,image3,image4,image5)values({newId},'{image1}','{image2}','{image3}','{image4}','{image5}')"

        cursor.execute(product_image_query)

        con.commit()

    def lastIdGet():

        id_query = "select id from products order by id desc limit 1"

        cursor.execute(id_query)

        data = cursor.fetchall()

        return data

    def insertProduct(name, price, company, category, quantity, model, size, description):

        product_query = f"insert into products(name,price,company,category,quantity,model,display_size,description)values('{name}',{price},'{company}','{category}',{quantity},'{model}','{size}','{description}')"

        cursor.execute(product_query)

        con.commit()

    def updateProduct(name, price, company, category, quantity, model, size, description, id):

        print('Hello ', id)

        update_product_query = f"update products set name='{name}',price={price},company='{company}',quantity={quantity},model='{model}',display_size='{size}',description='{description}' where id={id} "

        print(update_product_query)

        cursor.execute(update_product_query)

        con.commit()

    def showAdminProduct():

        product_query = f"select products.id, products.name, products.price, products.quantity, products.category, product_image.image1 from products join product_image on products.id=product_image.product_id"

        cursor.execute(product_query)

        data = cursor.fetchall()

        return data

    def ShowOtp(email, otp):

        query = f"select * from otp_verification where email='{email}' and otp='{otp}'"

        cursor.execute(query)

        data = cursor.fetchall()

        return data

    def emailValid(email):

        query = f"select * from users where email='{email}' "

        cursor.execute(query)

        data = cursor.fetchall()

        return data

    def exeistEmail(email):

        query1 = f"select email from users where email='{email}' "

        cursor.execute(query1)

        data = cursor.fetchall()

        return data

    def userLogin(email, password):

        query = f"select user_type from users where email='{email}' and password='{password}' "

        print(query)

        cursor.execute(query)

        data = cursor.fetchall()

        return data

    def adminLogin(email, password):

        query1 = f"select user_type from users where email='{email}' and password='{password}' "

        cursor.execute(query1)

        data = cursor.fetchall()

        return data

    def callAdmin(name, email, mobile, message, user_id):

        contact_query = f"insert into contacts(name,email,mobile,message,user_id)values('{name}', '{email}',{mobile},'{message}',{user_id})"

        cursor.execute(contact_query)

        con.commit()

    def showContact():

        query = "select * from contacts"

        cursor.execute(query)

        data = cursor.fetchall()

        return data

    def showUpdateProduct(id):

        query = f"select * from products where id={id} "

        cursor.execute(query)

        data = cursor.fetchall()

        return data

    def updatePassword(password, user_id):

        query = f"update users set password='{password}' where id={user_id} "

        cursor.execute(query)

        con.commit()

    def orderQuantity(user_id):

        query = f"update products, cart set products.quantity = products.quantity - cart.quantity where products.id = cart.product_id and cart.user_id={user_id} "

        print(query)
        cursor.execute(query)

        con.commit()

    def getUserName(user):

        print(user)

        get_name_query = f"select name from users where email='{user}' "

        cursor.execute(get_name_query)

        data = cursor.fetchall()

        return data

    def getUserMobile(user):

        get_name_query = f"select mobile from users where email='{user}' "

        cursor.execute(get_name_query)

        data = cursor.fetchall()

        return data
