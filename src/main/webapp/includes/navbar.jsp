<%--suppress XmlDuplicatedId --%>
<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/5/2023
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<style>
    @media screen and (max-width: 720px) {
        select.hide {
            display: none;
        }
    }

    body {
        padding-top: 100px;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid" style="max-width: 1200px;">

        <a class="navbar-brand" href="https://techzap.lk"><img src="resources/images/navbar/logo.png" style="max-height: 75px;"></a>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Shop</a>
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

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-shopping-cart fa-lg"></i></a>
                </li>

                <li class="nav-item">
                <div class="dropdown">
                    <a class="nav-link" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-user-circle fa-lg" style ="color: #a2822a"></i>
                    </a>

                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <li><a class="dropdown-item" href="seller-center/index.jsp">Login</a></li>
                        <li><a class="dropdown-item" href="#">Forgot Password</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Sign Up</a></li>
                    </ul>
                </div>
                </li>

            </ul>
        </div>
    </div>
</nav>

