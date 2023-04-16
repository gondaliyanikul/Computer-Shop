
// var likes = 1;

// function clickNew(id) {
//     var image = document.getElementById('image' + id);

//     if (image.src.match("/media/images/love")) {
//         image.src = "/media/images/heart.png";
//         likes = 1;

//     }
//     else {
//         image.src = "/media/images/love.png";
//         likes = 0;
//     }
// }


$('.addToCartBtn').click(function (e) {
    e.preventDefault();

    var product_id = $(this).closest('.product_data').find('.product_id').val();

    var token = $('input[name=csrfmiddlewaretoken]').val();

    /*$('button.view-cart').text(product_id); */

    $.ajax({

        method: "POST",
        /*url: "product",*/
        data: {
            'product_id': product_id,
            csrfmiddlewaretoken: token,
            'addCart': 'cart'
        },
        dataType: "dataType"
        /*success: function (response){

        }*/

    });

});

$('.wishlist-btn').click(function (e) {
    e.preventDefault();

    var product_id = $(this).closest('.product_data').find('.product_id').val();

    var token = $('input[name=csrfmiddlewaretoken]').val();

    /*$('button.view-cart').text(product_id); */

    $.ajax({

        method: "POST",
        data: {
            'product_id': product_id,
            'like': likes,
            csrfmiddlewaretoken: token,
            'addWish': 'wishes'

        },
        dataType: "dataType"

    });

});



// multiple image 

$(document).ready(function () {
    $("#fileUpload").on('change', function () {
        //Get count of selected files
        var countFiles = $(this)[0].files.length;
        var imgPath = $(this)[0].value;
        var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
        var image_holder = $("#image-holder");
        image_holder.empty();
        if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
            if (typeof (FileReader) != "undefined") {
                //loop for each file selected for uploaded.
                for (var i = 0; i < countFiles; i++) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("<img />", {
                            "src": e.target.result,
                            "class": "thumb-image"
                        }).appendTo(image_holder);
                    }
                    image_holder.show();
                    reader.readAsDataURL($(this)[0].files[i]);
                }
            } else {
                alert("This browser does not support FileReader.");
            }
        } else {
            alert("Pls select only images");
        }
    });
});

function Display() {

    document.getElementById('Show').style.display = "none";

}