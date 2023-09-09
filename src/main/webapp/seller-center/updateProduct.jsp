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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
</head>
<body>

<div class="d-flex">
    <%@include file="includes/sidebar.jsp"%>

    <div class="container-fluid d-block" style="width: 100%; height:30%">
        <%@include file="includes/topnav.jsp"%>
        <div>
<h1 style="margin-left: 5%; margin-top: 5%">Product Update</h1>
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

        </div>
    </div>
</div>


</body>
</html>
<% }%>