<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.projectone.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.math.BigDecimal" %><%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/31/2023
  Time: 5:43 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
</head>
<body>
<h1>Product Details</h1>

<%
    // Get the product ID from the request parameter
    String productId = request.getParameter("id");

    Connection conn = DBConnection.getConn();

// Define SQL query to retrieve product information based on product ID
    String sql = "SELECT * FROM products WHERE id = ?";

// Create prepared statement
    PreparedStatement statement = conn.prepareStatement(sql);

// Set parameter for the product ID
    statement.setString(1, productId);

// Execute query and retrieve result set
    ResultSet result = statement.executeQuery();

// Process result set to retrieve data
    while (result.next()) {
        String productName = result.getString("name");
        BigDecimal productPrice = result.getBigDecimal("price");
        String productDescription = result.getString("description");



//    // Dummy product details for testing purposes
//    String productName = "Sample Product";
//    String productDescription = "This is a sample product description.";
//    double productPrice = 9.99;
%>

<h2><%= productName %></h2>
<p><%= productDescription %></p>
<p>Price: $<%= productPrice %></p>

<form action="addToCart.jsp" method="post">
    <input type="hidden" name="productId" value="<%= productId %>">
    <input type="submit" value="Add to Cart">
</form>

<a href="viewCart.jsp">View Cart</a>
</body>
</html>

<% } %>