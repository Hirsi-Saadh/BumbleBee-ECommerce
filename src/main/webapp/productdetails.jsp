<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.projectone.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.Blob" %><%--
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <meta charset="UTF-8">
    <title>Product Details</title>
</head>
<body>
<jsp:include page="includes/navbar.jsp" />

<div class="container-fluid d-flex" style="max-width: 1200px; margin-top: 3%; margin-bottom: 3%">

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
        String productID = result.getString("id");
        String productName = result.getString("name");
        BigDecimal productPrice = result.getBigDecimal("price");
        String productDescription = result.getString("description");
        Blob productImage = result.getBlob("image");
        byte[] imageBytes = productImage.getBytes(1, (int) productImage.length());
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);

        Blob image2 = result.getBlob("imagetwo");
        byte[] image2Bytes = image2.getBytes(1, (int) image2.length());
        String image2Base64 = Base64.getEncoder().encodeToString(image2Bytes);





//    // Dummy product details for testing purposes
//    String productName = "Sample Product";
//    String productDescription = "This is a sample product description.";
//    double productPrice = 9.99;
%>


<div class="container-fluid d-block" style="max-width: 50%">
    <div class="conainer-fluid">
    <img height="350" src="data:image/png;base64, <%= base64Image %>" />
    </div>

    <img height="100" src="data:image/png;base64, <%= image2Base64 %>" />




</div>

<div class="container-fluid d-block" style="max-width: 50%">
    <h2><%= productName %></h2>
    <p><%= productDescription %></p>
    <p>Price: $<%= productPrice %></p>


<form method="post" action="addToCart">
    <input type="hidden" name="userId" id="userId" value="<c:out value="${sessionScope.userId}"/>" />
    <input type="hidden" name="productId" id="productId" value="<%= productID %>" />
    <input type="number" name="quantity" id="quantity" value="1" />
    <button type="submit">Add to Cart</button>
</form>


<a href="viewCart">View Cart</a>

</div>
</div>
<jsp:include page="includes/footer.jsp" />


</body>
</html>

<% } %>