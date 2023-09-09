<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 4/4/2023
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.projectone.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.Blob" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
  <meta charset="UTF-8">
    <style>
     .btn {
            color: #a2822a;
            font-size: 11px;
            text-transform: uppercase;
            font-weight: bold;
            background: none;
            border: 1px solid #a2822a;
            padding: 6px 14px;
            margin-top: 5px;
            line-height: 16px;
            border-radius: 20px;

        }
     .btn:focus {
            color: #fff;
            background: #a2822a;
            box-shadow: none;
        }

     .btn i {
         font-size: 14px;
         font-weight: bold;
         margin-left: 5px;
     }
    </style>
  <title>All Products</title>
</head>
<body>
<jsp:include page="includes/navbar.jsp" />

<div class="container-fluid" style="max-width: 1200px; margin-top: 3%; margin-bottom: 3%">
  <h1 style="text-align: center">All Products</h1>
  <hr>

  <div class="row row-cols-1 row-cols-md-3 g-4">
      <%
                Connection conn = DBConnection.getConn();
                String sql = "SELECT * FROM products ORDER BY id DESC";
                PreparedStatement statement = conn.prepareStatement(sql);
                ResultSet result = statement.executeQuery();

                while (result.next()) {
                    String productId = result.getString("id");
                    String productName = result.getString("name");
                    BigDecimal productPrice = result.getBigDecimal("price");
                    String productDescription = result.getString("description");
                    String productCategory = result.getString("category");
                    String productStock = result.getString("stock");
                    String productWeight = result.getString("weight");
                    Blob productImage = result.getBlob("image");
                    byte[] imageBytes = productImage.getBytes(1, (int) productImage.length());
                    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            %>

    <div class="col">
      <div class="card h-100">
        <img src="data:image/png;base64, <%= base64Image %>" class="card-img-top" alt="<%= productName %>">
        <div class="card-body">
          <h5 class="card-title"><%= productName %></h5>
          <p class="card-text"><%= productDescription %></p>
          <p class="card-text"><strong>Price: </strong>$<%= productPrice %></p>
          <p class="card-text"><strong>Category: </strong><%=productCategory %></p>
          <p class="card-text"><strong>Stock: </strong><%= productStock %></p>
          <p class="card-text"><strong>Weight: </strong><%= productWeight %>g</p>

          <a href="productdetails.jsp?id=<%= productId %>" class="btn btn-primary">View Product</a>
        </div>
      </div>
    </div>
    <% } %>
  </div>
</div>
<jsp:include page="includes/footer.jsp" />
</body>
</html>

