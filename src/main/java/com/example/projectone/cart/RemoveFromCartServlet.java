package com.example.projectone.cart;

import com.example.projectone.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static com.example.projectone.seller.Product.closeResources;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        int productId = Integer.parseInt(request.getParameter("id"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConn();
            stmt = conn.prepareStatement("DELETE FROM cart WHERE user_email = ? AND product_id = ?");
            stmt.setString(1, userEmail);
            stmt.setInt(2, productId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, null);
        }

        response.sendRedirect("viewCart");
    }
}
