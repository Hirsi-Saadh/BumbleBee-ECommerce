<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 4/2/2023
  Time: 7:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Login | Bumblebee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
</head>
<body>

<div class="container-fluid" style="max-width: 600px; max-height: 1000px; margin: 0 auto; margin-top: 10%; background-color: #EAEBED">

        <form id="login-form" action="user-login" method="post" style="margin-top: 5%; margin-bottom: 5%">
            <h3 style="text-align: center"> Sign In</h3>


            <!-- Email input -->
            <div class="form-outline mb-4">
                <input type="email" name="email" id="email" class="form-control" />
                <label class="form-label" for="email">Email</label>
            </div>

            <!-- Password input -->
            <div class="form-outline mb-4">
                <input type="password" name="password" id="password" class="form-control" />
                <label class="form-label" for="password">Password</label>
            </div>

            <!-- 2 column grid layout -->
            <div class="row mb-4">
                <div class="col-md-6 d-flex justify-content-center">
                    <!-- Checkbox -->
                    <div class="form-check mb-3 mb-md-0">
                        <input class="form-check-input" type="checkbox" value="" id="loginCheck" checked />
                        <label class="form-check-label" for="loginCheck"> Remember me </label>
                    </div>
                </div>

            </div>

            <!-- Submit button -->
            <button type="submit" style="width:400px;margin-left: 10%" class="btn btn-primary btn-block mb-4">Sign in</button>

            <!-- Register buttons -->
            <div class="text-center">
                <p>Not a member? <a href="#!">Register</a></p>
            </div>
        </form>
    </div>



</div>
<!-- Pills content -->

</div>

<%--<form id="login-form" action="user-login" method="post">--%>

<%--    <label for="email">Username</label>--%>
<%--    <input type="email" id="email" name="email" required>--%>
<%--    <br>--%>
<%--    <label for="password">Passwords</label>--%>
<%--    <input type="password" id="password" name="password" required>--%>
<%--    <br>--%>
<%--    <button type="submit">Login</button>--%>
<%--    <button type="button" id="register-button">Register</button>--%>
<%--</form>--%>

</body>
</html>
