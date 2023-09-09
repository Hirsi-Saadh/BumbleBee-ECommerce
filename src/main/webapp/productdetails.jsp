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

    <style>
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            display: none;
        }

        .modal img {
            max-height: 90%;
            max-width: 90%;
            margin: auto;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
    </style>


</head>
<body>
<jsp:include page="includes/navbar.jsp" />

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
        String productCategory = result.getString("category");
        String productStock = result.getString("stock");
        String productWeight = result.getString("weight");
        Blob productImage = result.getBlob("image");
        byte[] imageBytes = productImage.getBytes(1, (int) productImage.length());
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);

        Blob image2 = result.getBlob("imagetwo");
        byte[] image2Bytes = image2.getBytes(1, (int) image2.length());
        String image2Base64 = Base64.getEncoder().encodeToString(image2Bytes);

        Blob image3 = result.getBlob("imagethree");
        byte[] image3Bytes = image3.getBytes(1, (int) image3.length());
        String image3Base64 = Base64.getEncoder().encodeToString(image3Bytes);

        Blob image4 = result.getBlob("imagefour");
        byte[] image4Bytes = image4.getBytes(1, (int) image4.length());
        String image4Base64 = Base64.getEncoder().encodeToString(image4Bytes);

%>
<div class="container-fluid d-flex" style="max-width: 1200px; margin-top: 3%; margin-bottom: 3%">


<div class="container-fluid d-block" style="max-width: 50%">

    <span><a style="text-decoration: none" href="homepage" class="link-dark">&nbsp;&nbsp;Home </a></span><span>></span>
    <span><a style="text-decoration: none" href="homepage" class="link-dark"><%= productCategory %> </a></span><span>></span>
    <span><a style="text-decoration: none" href="homepage" class="link-dark"><%= productName %></a></span>

    <div class="image-container" style="margin-top: 5%">
        <div class="container-fluid">
        <img height="350" src="data:image/png;base64, <%= base64Image %>" />
        </div>
        <img height="100" onerror="this.style.display='none'" src="data:image/png;base64, <%= image2Base64 %>" />
        <img height="100" onerror="this.style.display='none'" src="data:image/png;base64, <%= image3Base64 %>" />
        <img height="100" onerror="this.style.display='none'" src="data:image/png;base64, <%= image4Base64 %>" />
    </div>





</div>

<div class="container-fluid d-block" style="max-width: 50%; margin-top: 5%">
    <h2><%= productName %></h2>
    <p><%= productDescription %></p>
    <p>Product Weight: <%= productWeight %> KG</p>
    <p><b>LKR <%= productPrice %></b></p>
    <p>Items Left: <%= productStock %></p>


<form method="post" action="addToCart">
    <input type="hidden" name="userId" id="userId" value="<c:out value="${sessionScope.userId}"/>" />
    <input type="hidden" name="productId" id="productId" value="<%= productID %>" />
    <div class="d-flex">
    <input class="form-control"  type="number" name="quantity" id="quantity" value="1" style="width: 75px; margin-right: 25px"/>
    <button class="btn btn-outline-warning"  type="submit">Add to Cart</button>
    </div>
</form>


</div>
</div>
<jsp:include page="includes/footer.jsp" />

<script>
    const container = document.querySelector('.image-container');
    const images = container.querySelectorAll('img');
    const modal = document.createElement('div');
    modal.classList.add('modal');
    const modalImage = document.createElement('img');
    modal.appendChild(modalImage);

    images.forEach((image) => {
        image.addEventListener('click', () => {
            modalImage.src = image.src;
            modal.style.display = 'block';
        });
    });

    modal.addEventListener('click', () => {
        modal.style.display = 'none';
    });

    document.body.appendChild(modal);
</script>


</body>
</html>

<% } %>