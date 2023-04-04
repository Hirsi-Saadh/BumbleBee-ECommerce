<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.example.projectone.DBConnection" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/26/2023
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%  int productID = Integer.parseInt(request.getParameter("id"));

    Connection conn = DBConnection.getConn();
    String sql = "SELECT * FROM products WHERE id = ?";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setInt(1, productID);
    ResultSet result = statement.executeQuery();

    while (result.next()) {
        String productId = result.getString("id");
        String productName = result.getString("name");
        BigDecimal productPrice = result.getBigDecimal("price");
        String productDescription = result.getString("description");
        String productCategory = result.getString("category");
        String productStock = result.getString("stock");
        String productWeight = result.getString("weight");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Update</title>
</head>
<body>
<h1>Product Update</h1>
<form action="${pageContext.request.contextPath}/update-product" method="post" enctype="multipart/form-data">
    <input type="hidden" name="productId" id="productId" value="<%= productId %>" />
    <label for="name">Name:</label>
    <input type="text" name="name" id="name" value="<%= productName %>" required /><br />
    <label for="description">Description:</label>
    <textarea name="description" id="description" required><%= productDescription %></textarea><br />
    <label for="category">Category:</label>
    <select class="form-select" aria-label="<%= productCategory %>" id="category" name="category">
        <option value="<%= productCategory %>" selected>Open this select menu</option>
        <option value="1">Electronic Devices</option>
        <option value="2">Electronic Accessories</option>
        <option value="3">TV & Home Appliances</option>
        <option value="4">Health & Beauty</option>
        <option value="5">Babies & Toys</option>
        <option value="6">Groceries & Pets</option>
        <option value="7">Home & Lifestyle</option>
        <option value="8">Women's Fashion</option>
        <option value="9">Men's Fashion</option>
        <option value="10">Watches & Accessories</option>
        <option value="11">Sports & Outdoor</option>
        <option value="12">Automotive & Motorbike</option>
    </select><br />
    <label for="price">Price:</label>
    <input type="number" name="price" id="price" value="<%= productPrice %>" step="0.01" min="0" required /><br />
    <label for="weight">Weight:</label>
    <input type="text" name="weight" id="weight" value="<%= productWeight %>" /><br />
    <label for="stock">Stock:</label>
    <input type="text" name="stock" id="stock" value="<%= productStock %>" /><br />
    <input type="submit" value="Update" />
</form>

</body>
</html>
<% }%>