<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/6/2023
  Time: 1:57 PM
  To change this template use File | Settings | File Templates.
--%>
<style>
    @media screen and (max-width: 1000px) {
        div.hide {
            display: none;
        }

        div.centerslider{
            margin: 0 auto;
            width: 100%;
        }

        div.buttonline{
            display: inline-block;
        }

        div.pillbuttons{
            width: 200px;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #a2822a;
            color: #EAEBED;
        }
    }

    @media screen and (min-width: 1000px){
        div.normalsize{
            width: 75%;
        }

        div.buttonline{
            display: flex;
        }

        div.pillbuttons{
            width: 22%;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #a2822a;
            color: #EAEBED;
        }
    }

    @media (min-width: 768px) {
        .carousel {
            width: 100%;
        }


    }


    div.pillbuttons:hover{
        transform: rotateY(0deg) scale(1.1);
        cursor: pointer;
    }
</style>

<section style = "background-color: #EAEBED">
<div class="container-fluid" style="max-width: 1200px;">
    <div class="d-flex container" style="width: 100%">
        <div class="bg-light container hide" style = "width: 25%">
            <div class="list-group list-group-light" style="border-radius: 0px 0px 0px 0px; height: 100%">
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">Electronic Devices</a>
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">Electronic Accessories</a>
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">TV & Home Appliances</a>
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">Health & Beauty</a>
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">Babies & Toys</a>
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">Groceries & Pets</a>
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">Home & Lifestyle</a>
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">Women's Fashion</a>
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">Men's Fashion</a>
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">Watches & Accessories</a>
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">Sports & Outdoor</a>
                <a href="#" class="list-group-item list-group-item-action px-3 border-0 fs-6" onmouseover="this.style.color='#0275d8';" onmouseout="this.style.color='#292b2c';">Automotive & Motorbike</a>
            </div>
        </div>

            <div id="carouselExampleSlidesOnly" class="carousel carousel-fade slide normalsize centerslider" data-bs-interval="3000" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="resources/images/banner/banner1.png" class="d-block img-fluid" alt="Image 1">
                    </div>
                    <div class="carousel-item">
                        <img src="resources/images/banner/banner2.png" class="d-block img-fluid" alt="Image 2">
                    </div>
                    <div class="carousel-item">
                        <img src="resources/images/banner/banner1.png" class="d-block img-fluid" alt="Image 3">
                    </div>
                </div>
            </div>

    </div>
</div>
</section>



<%--Button Section--%>
<section class="mt-3" style = "background-color: #EAEBED">
    <div class="container-fluid buttonline" style="max-width: 1200px;">

            <%--Div Icons to click--%>
            <%--Number 001--%>
            <div class = "button rounded-pill pillbuttons d-flex m-auto mt-2" onclick="gotoproducts()">
                <img src="resources/icons/pills/online-order.png"/>
                <h3 class="mx-3">Products</h3>
                <i class="fa-solid fa-chevron-right fa-2x"></i>
            </div>

            <%--Number 002--%>
            <div class = "button rounded-pill pillbuttons d-flex m-auto mt-2" onclick="gotopay()">
                <img src="resources/icons/pills/cash-in-hand.png"/>
                <h3 class="mx-3">Bee Pay</h3>
                <i class="fa-solid fa-chevron-right fa-2x"></i>
            </div>

            <%--Number 003--%>
            <div class = "button rounded-pill pillbuttons d-flex m-auto mt-2" onclick="gotomart()">
                <img src="resources/icons/pills/shopping-mall.png"/>
                <h3 class="mx-3">Bee Mart</h3>
                <i class="fa-solid fa-chevron-right fa-2x"></i>
            </div>

            <%--Number 004--%>
            <div class = "button rounded-pill pillbuttons d-flex m-auto mt-2" onclick="gotodeals()">
                <img src="resources/icons/pills/external-offer-ecommerce-kiranshastry-solid-kiranshastry.png"/>
                <h3 class="mx-3">Bee Deals</h3>
                <i class="fa-solid fa-chevron-right fa-2x"></i>
            </div>

    </div>

    <script>
        function gotoproducts() {
            window.location.href = "#";
        }

        function gotopay() {
            window.location.href = "#";
        }

        function gotomart() {
            window.location.href = "#";
        }

        function gotodeals() {
            window.location.href = "#";
        }
    </script>
</section>





                <%@include file="carousel/deals.jsp"%>


