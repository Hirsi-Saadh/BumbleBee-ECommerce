<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/26/2023
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Update</title>
</head>
<body>
<h1>Product Update</h1>
<form action="${pageContext.request.contextPath}/product-update" method="post" enctype="multipart/form-data">
    <input type="hidden" name="productId" id="productId" value="${product.id}" />
    <label for="name">Name:</label>
    <input type="text" name="name" id="name" value="${product.name}" required /><br />
    <label for="description">Description:</label>
    <textarea name="description" id="description" required>${product.description}</textarea><br />
    <label for="category">Category:</label>
    <input type="text" name="category" id="category" value="${product.category}" required /><br />
    <label for="price">Price:</label>
    <input type="number" name="price" id="price" value="${product.price}" step="0.01" min="0" required /><br />
    <label for="image">Image:</label>
    <input type="file" name="image" id="image" accept="image/*" /><br />
    <label for="dimensions">Dimensions:</label>
    <input type="text" name="dimensions" id="dimensions" value="${product.dimensions}" /><br />
    <label for="weight">Weight:</label>
    <input type="text" name="weight" id="weight" value="${product.weight}" /><br />
    <label for="color">Color:</label>
    <input type="text" name="color" id="color" value="${product.color}" /><br />
    <input type="submit" value="Update" />
</form>

</body>
</html>