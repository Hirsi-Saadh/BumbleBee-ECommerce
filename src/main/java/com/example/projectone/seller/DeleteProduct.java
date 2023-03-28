package com.example.projectone.seller;

import com.example.projectone.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "DeleteProduct", value = "/delete-product")
public class DeleteProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        try {
            Connection conn = DBConnection.getConn();
            String sql = "DELETE FROM products WHERE id=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, productId);
            int rowsDeleted = statement.executeUpdate();
            statement.close();
            conn.close();

            if (rowsDeleted > 0) {
                // If the deletion was successful, display a success message in an alert box
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('Product deleted successfully!')</script>");
                out.println("<meta http-equiv='refresh' content='0; URL=./seller-center/product.jsp'>");
            } else {
                // If the deletion failed, display an error message in an alert box
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('Product deletion failed!')</script>");
                out.println("<meta http-equiv='refresh' content='0; URL=./seller-center/product.jsp'>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
