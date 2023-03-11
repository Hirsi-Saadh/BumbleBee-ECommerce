<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/6/2023
  Time: 1:57 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.example.projectone.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <%--Navbar Style and CSS    --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <style>
        @media screen and (max-width: 600px) {
            div.hide {
                display: none;
            }
        }

        body{
            background-color: #EAEBED;
        }
    </style>

</head>
<body>
<% Connection conn= DBConnection.getConn();
    out.print(conn);%>
<%@include file="includes/navbar.jsp"%>
<%@include file="home.jsp"%>
<%@include file="includes/footer.jsp"%>

</body>

</html>