<%@ page import="java.sql.*" %>
<%@ page import="com.example.projectone.DBConnection" %>
<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 4/3/2023
  Time: 9:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

</head>
<body>

<jsp:include page="../includes/navbar.jsp" />

<%
    // retrieve order ID parameter from URL
    int orderId = Integer.parseInt(request.getParameter("order_id"));

    // retrieve order details from database
    try (Connection conn = DBConnection.getConn()) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, orderId);
        ResultSet resultSet = statement.executeQuery();

        // display order details
        if (resultSet.next()) {
            String name = resultSet.getString("name");
            String email = resultSet.getString("user_email");
            String phone = resultSet.getString("phone");
            String street = resultSet.getString("street");
            String city = resultSet.getString("city");
            String district = resultSet.getString("district");
            double total = resultSet.getDouble("total");
            String paymentMethod = resultSet.getString("payment_method");

            double installment = total / 3;

            // output order details to page
            out.println("<div class='container-fluid d-flex' style='max-width:1200px; margin-top: 1%; margin-bottom: 1%'>");
            out.println("<div class='container-fluid d-block' style='max-width:50%'>");
            out.println("<h2>Your Order Number #" + orderId + " Details:</h2>");
            out.println("<p>Name: " + name + "</p>");
            out.println("<p>Email: " + email + "</p>");
            out.println("<p>Phone: " + phone + "</p>");
            out.println("<p>Street: " + street + "</p>");
            out.println("<p>City: " + city + "</p>");
            out.println("<p>District: " + district + "</p>");
            out.println("<p><b>Total: LKR " + total + "</b></p>");
            out.println("<p><b>Installment: LKR " + installment + "</b></p>");
            out.println("<p>Payment Method: " + paymentMethod + "</p>");
            out.println("</div>");

            out.println("<div class='container-fluid d-block' style='max-width:50%; margin-top: 12%'>");
            // create a form for each installment
            for (int i = 1; i <= 3; i++) {
                out.println("<form action='" + request.getContextPath() + "/processInstallmentPayment' method='post'>");
                out.println("<input type='hidden' name='orderId' value='" + orderId + "'>");
                out.println("<input type='hidden' name='installmentNumber' value='" + i + "'>");
                out.println("<input type='submit' value='Pay " + i + " Installment'>");
                out.println("</form>");

            }
            out.println("</div>");
            out.println("</div>");
        } else {
            out.println("<h2>Order not found.</h2>");

        }
    } catch (SQLException e) {
        throw new ServletException("Database error", e);
    }
%>


<jsp:include page="../includes/footer.jsp" />

</body>
</html>
