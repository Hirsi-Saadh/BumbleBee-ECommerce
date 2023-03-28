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
    <title>New Product - Bumblebee</title>
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
<h1 style="margin-left: 5%; margin-top: 5%">Add Product</h1>
<form action="../add-product" method="post" style="margin-left: 5%; width: 30%">
    <label for="name" class="form-label">Name:</label>
    <input class="form-control" type="text" id="name" name="name">
    <br>
    <label class="form-label" for="description">Description:</label>
    <textarea class="form-control" id="description" name="description"></textarea>
    <br>
    <label class="form-label" for="price">Price:</label>
    <input class="form-control" type="text" id="price" name="price">
    <br>
    <input type="submit" value="Add">
</form>
<p style="margin-left: 5%"><a href="products">Back to Products</a></p>
        </div>
    </div>
</div>
</body>
</html>
