<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/10/2023
  Time: 12:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bumblebee Seller Center</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">


    <style>
        .gradient-custom-3 {
            /* fallback for old browsers */
            background: #84fab0;

            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));

            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))
        }
        .gradient-custom-4 {
            /* fallback for old browsers */
            background: #84fab0;

            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));

            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
        }
    </style>
</head>
<body>

<%--<h1>Registration Form</h1>--%>
<%--<form action="../seller-register" method="post">--%>
<%--    <label>Username:</label>--%>
<%--    <input type="text" name="username" required>--%>
<%--    <br>--%>
<%--    <label>Password:</label>--%>
<%--    <input type="password" name="password" required>--%>
<%--    <br>--%>
<%--    <label>Email:</label>--%>
<%--    <input type="email" name="email" required>--%>
<%--    <br>--%>
<%--    <input type="submit" value="Register">--%>
<%--</form>--%>

<section class="vh-100 bg-image"
         style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card rounded-3" >
                        <div class="card-body p-5">
                            <div class="text-center">
                                <img src="../resources/images/navbar/logo.png"
                                     style="width: 185px;" alt="logo">
                                <h4 class="mt-1 mb-2 pb-1">Welcome to <br><b>BumbleBee Seller Center</b></h4>
                            </div>

                            <h5 class="text-center mb-3"><b>Create an Account</b></h5>

                            <form  action="../seller-register" method="post">

                                <div class="form-outline mb-2">
                                    <label class="form-label" for="username">Your Name</label>
                                    <input type="text" id="username" name="username" class="form-control form-control-lg" required />

                                </div>

                                <div class="form-outline mb-2">
                                    <label class="form-label" for="email">Your Email</label>
                                    <input type="email" id="email" name="email" class="form-control form-control-lg" required/>

                                </div>

                                <div class="form-outline mb-2">
                                    <label class="form-label" for="password">Password</label>
                                    <input type="password" id="password" name="password" class="form-control form-control-lg" onchange='check_pass();' required/>

                                </div>

                                <div class="form-outline mb-2">
                                    <label class="form-label" for="confirm_password">Repeat your password</label>
                                    <input type="password" id="confirm_password" name="confirm_password" class="form-control form-control-lg" onchange='check_pass();' required/>
                                    <span id='message'></span>

                                </div>

                                <div class="form-check d-flex justify-content-center mb-3">
                                    <label class="form-check-label" for="form2Example3cg">
                                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg" required/>

                                        I agree all information provided are correct
                                    </label>
                                </div>

                                <div class="d-flex justify-content-center">
                                    <button type="submit" value="Register"
                                            class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                                </div>

                                <p class="text-center text-muted mt-5 mb-0">Have an account already? <a href="index.jsp"
                                                                                                        class="fw-bold text-body"><u>Login here</u></a></p>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    document.getElementById("register").onclick = function () {
        location.href = "sellerRegistration.jsp";
    };

    function check_pass() {
        if (document.getElementById('password').value ==
            document.getElementById('confirm_password').value) {
            document.getElementById('submit').disabled = false;
        } else {
            document.getElementById('submit').disabled = true;
        }
    }
</script>

</body>
</html>
