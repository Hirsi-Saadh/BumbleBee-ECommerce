<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/26/2023
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Management - Add Product</title>
</head>
<body>
<h1>Add Product</h1>
<form action="../add-product" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name">
    <br>
    <label for="description">Description:</label>
    <textarea id="description" name="description"></textarea>
    <br>
    <label for="price">Price:</label>
    <input type="text" id="price" name="price">
    <br>
    <input type="submit" value="Add">
</form>
<p><a href="products">Back to Products</a></p>
</body>
</html>
