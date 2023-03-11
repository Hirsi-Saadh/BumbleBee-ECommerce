<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/10/2023
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Seller Login</h1>
<form action="../seller-login" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username"><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password"><br>
    <input type="submit" value="Login">
</form>
<%-- Display error message if there is one --%>
<% String errorMessage = request.getParameter("error");
    if (errorMessage != null) {
        out.print("<p style='color: red;'>" + errorMessage + "</p>");
    }
%>

</body>
</html>
