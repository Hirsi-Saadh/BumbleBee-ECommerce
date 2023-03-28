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
<form class="needs-validation" action="../add-product" method="post" enctype="multipart/form-data" style="margin-left: 5%; width: 50%" novalidate>
    <label for="name" class="form-label">Product Name:</label>
    <input class="form-control" type="text" id="name" name="name" required>
    <div class="valid-feedback">Looks good!</div>
    <div class="invalid-feedback">Enter product name</div>
    <br>
    <label for="category" class="form-label">Product Category:</label>
    <select class="form-select" aria-label="select category" id="category" name="category">
        <option selected>Open this select menu</option>
        <option value="1">One</option>
        <option value="2">Two</option>
        <option value="3">Three</option>
    </select>
    <br>

    <label class="form-label" for="description">Description:</label>
    <textarea class="form-control" id="description" name="description"></textarea>
    <br>
    <label class="form-label" for="price">Price:</label>
    <input class="form-control" type="text" id="price" name="price" step="0.01" min="0" required>
    <div class="valid-feedback">Looks good!</div>
    <div class="invalid-feedback">Enter valid price</div>
    <br>
    <label class="form-label" for="image">Image:</label>
    <input class="form-control" type="file" name="image" id="image" >
    <div class="valid-feedback">Looks good!</div>
    <div class="invalid-feedback">Add product image</div>
    <br>
    <label class="form-label" for="dimensions">Dimensions:</label>
    <input class="form-control" type="text" name="dimensions" id="dimensions">
    <br>
    <label class="form-label" for="weight">Weight:</label>
    <input class="form-control" type="text" name="weight" id="weight">
    <br>
    <label class="form-label" for="color">Color:</label>
    <input class="form-control" type="text" name="color" id="color">
    <br>
    <button class="btn btn-primary" type="submit">ADD</button>
</form>
<p style="margin-left: 5%"><a href="products">Back to Products</a></p>
        </div>
    </div>
</div>

<form action="../view-products" method="GET">
<%--    <input type="hidden" name="param1" value="value1">--%>
    <button type="submit">Go to MyServlet</button>
</form>

<script>
    (function () {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>
</body>
</html>
