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
    <title>Title</title>
</head>
<body>

<form id="login-form" action="user-login" method="post">

    <label for="email">Username</label>
    <input type="email" id="email" name="email" required>
    <br>
    <label for="password">Passwords</label>
    <input type="password" id="password" name="password" required>
    <br>
    <button type="submit">Login</button>
    <button type="button" id="register-button">Register</button>
</form>

</body>
</html>
