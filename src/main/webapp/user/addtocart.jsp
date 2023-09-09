<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add to Cart</title>
</head>
<body>
<h1>Add to Cart</h1>
<form action="addToCart" method="post">
    <input type="hidden" name="productId" value="${product.id}" />
    <label for="quantity">Quantity:</label>
    <input type="number" name="quantity" id="quantity" min="1" max="100" value="1" required />
    <br />
    <button type="submit">Add to Cart</button>
</form>
</body>
</html>
