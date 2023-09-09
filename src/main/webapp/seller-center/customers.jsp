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
    <title>Recent Orders</title>
</head>
<body>
<div class="d-flex">
    <jsp:include page="includes/sidebar.jsp" />

    <div class="d-block" style="width: 100%">
        <jsp:include page="includes/topnav.jsp" />
        <div class="container-fluid">
            <h1 style="text-align: center">Order History</h1>
            <hr>
            <table class="table table-striped table-hover">

                <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>Customer Address</th>
                    <th>Customer Phone</th>
                    <th>Customer Email</th>
                </tr>
                </thead>
                <tbody>
                <%
                    {

                        Connection conn = DBConnection.getConn();
                        String sql = "SELECT * FROM users";
                        PreparedStatement statement = conn.prepareStatement(sql);
                        ResultSet orderResult = statement.executeQuery();

                        while (orderResult.next()) {
                            int Id = orderResult.getInt("id");
                            String Name = orderResult.getString("name");
                            String Address = orderResult.getString("address");
                            String Phone = orderResult.getString("phone");
                            String Email = orderResult.getString("email");



                %>

                <tr>
                    <td># <%=Id%></td>
                    <td><%=Name%></td>
                    <td><%=Address%></td>
                    <td><%=Phone%></td>
                    <td><%=Email%></td>
                </tr>

                <%
                            }

                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
</html>

