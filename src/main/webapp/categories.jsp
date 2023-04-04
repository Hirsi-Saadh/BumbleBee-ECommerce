<%@ page import="java.sql.*" %>
<%@ page import="com.example.projectone.DBConnection" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
    <title>Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <style></style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container py-5" style="max-width: 1200px">
    <h1 class="text-center mb-5">Category: <%= request.getParameter("filter") %></h1>
    <div class="row row-cols-1 row-cols-md-3 g-4">
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
            <div class="card">
                <img src="data:image/jpeg;base64,<%= new String(Base64.getEncoder().encode(rs.getBytes("image"))) %>" class="card-img-top" height="250" alt="<%= rs.getString("name") %>">
                <div class="card-body">
                    <h5 class="card-title"><%= rs.getString("name") %></h5>
                    <p class="card-text"><%= rs.getString("description") %></p>
                    <p class="card-text">Category: <%= categoryName %></p>
                    <p class="card-text">Price: <%= rs.getDouble("price") %></p>
                    <<a href="productdetails.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning"><i class="fas fa-shopping-cart me-2"></i>Add to Cart</a>
                </div>
            </div>
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
