<%--suppress XmlDuplicatedId --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/5/2023
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>



<style>
    @media screen and (max-width: 600px) {
        div.hide {
            display: none;
        }
    }

    body{
        background-color: #EAEBED;
    }

    .modal {
        display: none;
        position: fixed;
        z-index: 9999;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 30%;
    }

    .close {
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }


    @media screen and (max-width: 720px) {
        select.hide {
            display: none;
        }
    }

    /*body {*/
    /*    padding-top: 100px;*/
    /*}*/
</style>

<div class="container-fluid" style="width:100%; background-color: #a6a3a3">
    <div class="container-fluid d-flex" style="height: 25px; max-width: 1200px">
        <div class="container fluid " style="width:75%">
            <c:if test="${not empty sessionScope.name}">
            <p>Welcome, <c:out value="${sessionScope.name}"/>!  <c:out value="${sessionScope.userEmail}"/></p>
            </c:if>
        </div>

        <c:if test="${empty sessionScope.name}">
        <div class="container fluid " style="width:25%">
            <a href="seller-center" style="text-decoration: none" class="link-light">BEE CENTER</a>
        </div>
        </c:if>

        <c:if test="${not empty sessionScope.name}">
        <div class="container fluid " style="width:25%">
            <a href="user-logout" style="text-decoration: none" class="link-light">LOGOUT</a>
        </div>
        </c:if>
    </div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">



    <div class="container-fluid d-flex" style="max-width: 1200px;">


        <a class="navbar-brand" href="https://techzap.lk"><img src="resources/images/navbar/logo.png" style="max-height: 75px;"></a>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="product-carousel">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact Us</a>
                </li>
            </ul>
        </div>
        <form class="d-flex">
            <input class="form-control" type="search" placeholder="Search in Bumblebee" aria-label="Search" style="border-radius: 75px 0px 0px 75px; margin-left: 0; max-width: 65%;">

            <select class="hide form-select" aria-label="Default select example" style="border-radius: 0px 0px 0px 00px; margin-left: 0; max-width: 35%;">
                <option selected>Categories</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
            <button class="btn btn-outline-warning" type="submit" style="border-radius: 0px 75px 75px 0px; margin-right: 0;">
                <i class="fa fa-search"></i>
            </button>
        </form>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav2">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="viewCart"><i class="fa fa-shopping-cart fa-lg"></i></a>
                </li>

                <li class="nav-item">
                    <div class="dropdown">
                        <a class="nav-link" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-user-circle fa-lg" style ="color: #a2822a"></i>
                        </a>

                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <c:if test="${not empty sessionScope.name}">
                                <li><a class="dropdown-item" href="#"><c:out value="${sessionScope.name}"/>'s Profile</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="user-logout" >Logout</a></li>
                            </c:if>

                                <!-- If the user is not logged in, show a login button -->
                            <c:if test="${empty sessionScope.name}">
                                <li><a type="button" id="login-button" class="dropdown-item">Login</a></li>
                                <li><a class="dropdown-item" href="#">Forgot Password</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Sign Up</a></li>
                            </c:if>
                        </ul>
                    </div>
                </li>

            </ul>
        </div>
    </div>
</nav>

<div id="login-modal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Login</h2>
        <form id="login-form" action="user-login" method="post">
            <label for="email">Username</label>
            <input type="email" id="email" name="email" required>
            <br>
            <label for="password">Passwords</label>
            <input type="password" id="pass" name="password" required>
            <br>
            <button type="submit">Login</button>
            <button type="button" id="register-button">Register</button>
        </form>
        <div id="login-message"></div>
    </div>
</div>

<div id="register-modal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Register</h2>
        <form class="needs-validation" id="register-form" action="user-register" method="post">
            <label class="form-label" for="username">Username</label>
            <input class="form-control" type="text" id="username" name="username" required>
            <br>
            <label class="form-label" for="email">Email</label>
            <input class="form-control" type="email" id="email" name="email" required>
            <br>
            <label class="form-label" for="password">Password</label>
            <input class="form-control" type="password" id="password" name="password" required>
            <br>
            <label class="form-label" for="address">Address</label>
            <input class="form-control" type="text" id="address" name="address" required>
            <br>
            <label class="form-label" for="phone">Phone</label>
            <input class="form-control" type="text" id="phone" name="phone" required>
            <br>
            <button type="submit">Register</button>
            <button type="button" id="login-button-f">login</button>
        </form>
        <div id="register-message"></div>
    </div>
</div>

<script>
    // Get the modal element
    var loginModal = document.getElementById("login-modal");
    var registerModal = document.getElementById("register-modal");

    // Get the button that opens the modal
    var loginButton = document.getElementById("login-button");
    var loginButtonF = document.getElementById("login-button-f");
    var registerButton = document.getElementById("register-button");

    // Get the <span> element that closes the modal
    var loginClose = document.getElementsByClassName("close")[0];
    var registerClose = document.getElementsByClassName("close")[1];

    // When the user clicks the button, open the modal
    loginButton.onclick = function() {
        loginModal.style.display = "block";
    }

    loginButtonF.onclick = function() {
        registerModal.style.display = "none";
        loginModal.style.display = "block";
    }

    registerButton.onclick = function() {
        loginModal.style.display = "none";
        registerModal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    loginClose.onclick = function() {
        loginModal.style.display = "none";
    }

    registerClose.onclick = function() {
        registerModal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it

    window.onclick = function(event) {
        if (event.target == loginModal) {
            loginModal.style.display = "none";
        }
        if (event.target == registerModal) {
            registerModal.style.display = "none";
        }
    }

</script>
