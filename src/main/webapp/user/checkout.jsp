<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 4/2/2023
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <meta charset="UTF-8">
    <title>Order Checkout</title>
</head>
<body>
<jsp:include page="../includes/navbar.jsp" />

<div class="container-fluid" style="max-width: 1200px; margin-bottom: 1%">
    <div style="text-align: center; margin-top: 1%; margin-bottom: 1%"><h1>Order Checkout</h1></div>
    <form action="processOrder" method="post">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">

                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<c:out value="${sessionScope.userEmail}"/>">
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" class="form-control" id="phone" name="phone" pattern="[0-9]{10}" required>
                </div>
                <div class="form-group">
                    <label for="street">Street</label>
                    <input type="text" class="form-control" id="street" name="street" required>
                </div>
                <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" class="form-control" id="city" name="city" required>
                </div>
                <div class="form-group">
                    <label for="district">District</label>
                    <input type="text" class="form-control" id="district" name="district" required>
                </div>

                <fieldset class="form-group">
                    <div class="row">
                        <legend class="col-form-label col-sm-2 pt-0">Radios</legend>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="paymentMethod" value="singlePayment" checked>
                                <label class="form-check-label" for="paymentMethod">
                                    One Time Payment
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="paymentMethod" value="threeMonthInstallment">
                                <label class="form-check-label" for="paymentMethod">
                                    Three Month Installment <p>3 Month x LKR <b><span id="result"></span>.00</b></p>
                                </label>
                            </div>
                        </div>
                    </div>
                </fieldset>

            </div>
            <div class="col-md-6">
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th>Product</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                    </thead>
                    <c:forEach items="${items}" var="item">
                        <tr>
                            <td>${item.product.name}</td>
                            <td><img style="height: 100px" src="data:image/jpeg;base64,${item.product.imageBase64}"/></td>
                            <td>LKR ${item.product.price}.00</td>
                            <td>${item.quantity}</td>
                            <td>LKR ${item.getSubtotal()}.00</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td class="bg-dark" style="text-align: center; color: white" colspan="3"><h3>Total</h3></td>
                        <td style="text-align: right" colspan="2"><b>LKR ${total}.00</b></td>
                        <input type="hidden" id="total" value="${total}" name="total">
                    </tr>
                </table>
                <button type="submit" class="btn btn-warning">Confirm Order</button>
            </div>
        </div>
    </form>
</div>

<script>
    const result = ${total} / 3;
    document.getElementById('result').textContent = result;

    let total = ${total}; // replace with your total value
    if (total > 15000) {
        // hide the "Three Month Installment" radio button
        document.querySelector('input[value="threeMonthInstallment"]').style.display = "none";
    }
</script>


<jsp:include page="../includes/footer.jsp" />
</body>
</html>
