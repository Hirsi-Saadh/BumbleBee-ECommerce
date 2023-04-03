<%@ page import="com.example.projectone.seller.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 4/3/2023
  Time: 6:02 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <title>Search Results</title>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container-fluid" style="max-width: 1200px; margin-top: 1%; margin-bottom: 1%">
    <h1 style="text-align: center">Search Results</h1>
    <h3 style="text-align: center">Showing products that match: <%= request.getParameter("keyword") %></h3>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% for (Product product : (List<Product>)request.getAttribute("products")) { %>
        <div class="col">
            <div class="card">

                <img src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(product.getImage()) %>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <p class="card-text"><%= product.getDescription() %></p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Category: <%= product.getCategory() %></li>
                    <li class="list-group-item">Price: <%= product.getPrice() %></li>
                </ul>
                <a href="productdetails.jsp?id=<%= product.getId() %>" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
        <% } %>
    </div>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>
