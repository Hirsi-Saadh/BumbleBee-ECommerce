<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/7/2023
  Time: 6:00 AM
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<style>

    .dealscarousel .carousel {
        margin: 50px auto;
        padding: 0 70px;
        margin-top: 10px;
    }
    .dealscarousel .carousel .item {
        color: #747d89;
        min-height: 325px;
        text-align: center;
        overflow: hidden;
    }
    .dealscarousel .carousel .thumb-wrapper {
        padding: 25px 15px;
        background: #fff;
        border-radius: 6px;
        text-align: center;
        position: relative;
        box-shadow: 0 2px 3px rgba(0,0,0,0.2);
    }
    .dealscarousel .carousel .item .img-box {
        height: 120px;
        margin-bottom: 20px;
        width: 100%;
        position: relative;
    }
    .dealscarousel .carousel .item img {
        max-width: 100%;
        max-height: 100%;
        display: inline-block;
        position: absolute;
        bottom: 0;
        margin: 0 auto;
        left: 0;
        right: 0;
    }
    .dealscarousel .carousel .item h4 {
        font-size: 18px;
    }
    .dealscarousel .carousel .item h4, .carousel .item p, .carousel .item ul {
        margin-bottom: 5px;
    }
    .dealscarousel .carousel .thumb-content .btn {
        color: #a2822a;
        font-size: 11px;
        text-transform: uppercase;
        font-weight: bold;
        background: none;
        border: 1px solid #a2822a;
        padding: 6px 14px;
        margin-top: 5px;
        line-height: 16px;
        border-radius: 20px;
    }
    .dealscarousel .carousel .thumb-content .btn:hover, .carousel .thumb-content .btn:focus {
        color: #fff;
        background: #a2822a;
        box-shadow: none;
    }
    .dealscarousel .carousel .thumb-content .btn i {
        font-size: 14px;
        font-weight: bold;
        margin-left: 5px;
    }
    .dealscarousel .carousel .item-price {
        font-size: 13px;
        padding: 2px 0;
    }
    .dealscarousel .carousel .item-price strike {
        opacity: 0.7;
        margin-right: 5px;
    }
    .dealscarousel .carousel-control-prev, .carousel-control-next {
        height: 44px;
        width: 40px;
        background: #a2822a;
        margin: auto 0;
        margin-right: 10px;
        margin-left: 10px;
        border-radius: 4px;
        opacity: 0.8;
    }
    .dealscarousel .carousel-control-prev:hover, .carousel-control-next:hover {
        background: #a2822a;
        opacity: 1;
    }
    .dealscarousel .carousel-control-prev i, .carousel-control-next i {
        font-size: 36px;
        position: absolute;
        top: 50%;
        display: inline-block;
        margin: -19px 0 0 0;
        z-index: 5;
        left: 0;
        right: 0;
        color: #fff;
        text-shadow: none;
        font-weight: bold;
    }
    .dealscarousel .carousel-control-prev i {
        margin-left: -2px;
    }
    .dealscarousel .carousel-control-next i {
        margin-right: -4px;
    }

    .dealscarousel .carousel .wish-icon {
        position: absolute;
        right: 10px;
        top: 10px;
        z-index: 99;
        cursor: pointer;
        font-size: 16px;
        color: #abb0b8;
    }
    .dealscarousel .carousel .wish-icon .fa-heart {
        color: #ff6161;
    }
    .dealscarousel .star-rating li {
        padding: 0;
    }
    .dealscarousel .star-rating i {
        font-size: 14px;
        color: #ffc000;
    }
</style>
<script>
    $(document).ready(function(){
        $(".wish-icon i").click(function(){
            $(this).toggleClass("fa-heart fa-heart-o");
        });
    });
</script>
<%--Products Section--%>
<section class="mt-3" style = "background-color: #292B2CFF; min-height: 450px;">
    <div class="container-fluid d-flex" style="max-width: 1200px; min-height: 450px;">
        <div class="container">
            <h4 class="mt-1" style="color: #a2822a">Bee Deals</h4>

            <div class="container-fluid d-flex mb-0" style="background-color: #a2822a">
                <p class="mx-3 mt-2 mb-2" style="color: black">Sale Ends in : </p>
                <b><p class="mt-2 mb-2"  style="color: black" id="demo"></p></b>
            </div>
            <%--To show available products from the database--%>
            <div class="container-fluid m-0 p-0 mb-0" style = "height: 350px; max-width: 1200px">
                <%--                --%>
                <div class="dealscarousel">
                    <div class="container-fluid m-0 p-0 bg-light" style="width: 100%; height: 350px">
                        <div class="row">
                            <div class="col-md-12">
                                <div id="myCarousel" class="carousel slide" data-bs-ride="carousel" data-interval="0">

                                    <!-- Wrapper for carousel items -->
                                    <div class="carousel-inner">
                                        <div class="item carousel-item active">
                                            <div class="row">
                                                <c:forEach items="${products}" var="product">

                                                    <div class="col-sm-3">
                                                        <div class="thumb-wrapper">
                                                            <span class="wish-icon"><i class="fa fa-heart-o"></i></span>
                                                            <div class="img-box">
                                                                <img style="height: 100px" src="data:image/jpeg;base64,${product.imageBase64}"/>
                                                            </div>
                                                            <div class="thumb-content">
                                                                <h4>${product.name}</h4>
                                                                <div class="star-rating">
                                                                    <ul class="list-inline">
                                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                                        <li class="list-inline-item"><i class="fa-regular fa-star"></i></li>
                                                                    </ul>
                                                                </div>
                                                                <p class="item-price"><strike>$400.00</strike> <b>${product.price}</b></p>
                                                                <a href="productdetails.jsp?id=${product.id}" class="btn btn-primary">Add to Cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Carousel controls -->
                                    <a class="carousel-control-prev" href="#myCarousel" data-bs-slide="prev">
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                    <a class="carousel-control-next" href="#myCarousel" data-bs-slide="next">
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

    <script>
        // Set the date we're counting down to
        var countDownDate = new Date("Mar 9, 2023 00:00:00").getTime();

        // Update the count down every 1 second
        var x = setInterval(function() {

            // Get today's date and time
            var now = new Date().getTime();

            // Find the distance between now and the count down date
            var distance = countDownDate - now;

            // Time calculations for days, hours, minutes and seconds
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            // Display the result in the element with id="demo"
            document.getElementById("demo").innerHTML = days + "d " + hours + "h "
                + minutes + "m " + seconds + "s ";

            // If the count down is finished, write some text
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("demo").innerHTML = "EXPIRED";
            }
        }, 1000);
    </script>

</section>