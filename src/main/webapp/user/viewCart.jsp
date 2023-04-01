<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Cart</title>
</head>
<body>
<h1>View Cart</h1>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Subtotal</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${items}" var="item">
        <tr>
            <td>${item.product.name}</td>
            <td>${item.product.description}</td>
            <td>${item.product.price}</td>
            <td>
                <form action="reduceQuantity" method="post">
                    <input type="hidden" name="productId" value="${item.product.id}" />
                    <input type="number" name="quantity" id="quantity" value="${item.quantity}" min="1" max="${item.product.stock}" />
                    <button type="submit">Update</button>
                </form>
            </td>
            <td>${item.getSubtotal()}</td>
            <td>
                <form action="removeFromCart" method="post">
                    <input type="hidden" name="productId" value="${item.product.id}" />
                    <button type="submit">Remove</button>
                </form>
            </td>
        </tr>
    </c:forEach>

    <tr>
        <td colspan="4">Total:</td>
        <td>${total}</td>
        <td></td>
    </tr>
    <a href="user/checkout.jsp?total=${total}"><button>Proceed to Checkout</button></a>
</table>

<!-- Confirmation dialog -->
<div id="remove-dialog" style="display: none;">
    <p>Are you sure you want to remove the item "<span id="remove-name"></span>" from your cart?</p>
    <button onclick="removeItem()">Yes</button>
    <button onclick="hideDialog()">Cancel</button>
    <input type="hidden" id="remove-id">
</div>

<script>
    let removeDialog = document.getElementById('remove-dialog');
    let removeName = document.getElementById('remove-name');
    let removeId = document.getElementById('remove-id');

    function confirmRemove(name, id) {
        removeName.innerText = name;
        removeId.value = id;
        removeDialog.style.display = 'block';
    }

    function hideDialog() {
        removeDialog.style.display = 'none';
    }

    function removeItem() {
        let id = removeId.value;
        window.location.href = 'removeFromCart?id=' + id;
    }
</script>
</body>
</html>
