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
</head>
<body>

<h1>Registration Form</h1>
<form action="../seller-register" method="post">
    <label>Username:</label>
    <input type="text" name="username" required>
    <br>
    <label>Password:</label>
    <input type="password" name="password" required>
    <br>
    <label>Email:</label>
    <input type="email" name="email" required>
    <br>
    <input type="submit" value="Register">
</form>

</body>
</html>
