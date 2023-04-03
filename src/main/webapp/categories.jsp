<%@ page import="java.sql.*" %>
<%@ page import="com.example.projectone.DBConnection" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
    <title>Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div style="max-width: 1200px; margin: 0 auto">
<h1 style="text-align: center">Category: <%= request.getParameter("filter") %></h1>

<div class="row row-cols-1 row-cols-md-3 g-4" style="max-width: 1200px; ">
    <% try {
        String filter = request.getParameter("filter");

        // Connect to the database
        Connection conn = DBConnection.getConn();

        // Execute the query
        String sql = "SELECT * FROM products WHERE category = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, filter);
        ResultSet rs = stmt.executeQuery();


        // Loop through the ResultSet and display the products

        while (rs.next()) {
            // Get the category name for the current product
            int categoryId = rs.getInt("category");
            String categorySql = "SELECT category FROM category WHERE id = ?";
            PreparedStatement categoryStmt = conn.prepareStatement(categorySql);
            categoryStmt.setInt(1, categoryId);
            ResultSet categoryRs = categoryStmt.executeQuery();
            String categoryName = "";
            if (categoryRs.next()) {
                categoryName = categoryRs.getString("category");
            }

            // Display the current product
    %>
    <div class="col">
        <h3><%= rs.getString("name") %></h3>
        <p><img height="100" src="data:image/jpeg;base64,<%= new String(Base64.getEncoder().encode(rs.getBytes("image"))) %>"></p>
        <p><%= rs.getString("description") %></p>
        <p><%= categoryName %></p>
        <p>Price: <%= rs.getDouble("price") %></p>
        <a href="productdetails.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary">Add to Cart</a>
    </div>
    <%
            }

            // Close the database connection, statement, and result set
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</div>
</div>

<%@include file="includes/footer.jsp"%>

</body>
</html>
