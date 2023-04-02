package com.example.projectone.cart;

import com.example.projectone.DBConnection;
import com.example.projectone.seller.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/addToCart")
public class AddtoCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session = request.getSession();
        if (session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
        }else{

        String userEmail = (String) session.getAttribute("userEmail");
//        int userId = (int) session.getAttribute("userId");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try (Connection conn = DBConnection.getConn()) {
            // Check if item already exists in cart
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM cart WHERE user_email = ? AND product_id = ?");
            stmt.setString(1, userEmail);
            stmt.setInt(2, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // Item already exists in cart, update quantity
                int cartId = rs.getInt("id");
                int oldQuantity = rs.getInt("quantity");
                int newQuantity = oldQuantity + quantity;
                PreparedStatement updateStmt = conn.prepareStatement("UPDATE cart SET quantity = ? WHERE id = ?");
                updateStmt.setInt(1, newQuantity);
                updateStmt.setInt(2, cartId);
                updateStmt.executeUpdate();
            } else {
                // Item doesn't exist in cart, insert new item
                PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO cart (user_email, product_id, quantity) VALUES (?, ?, ?)");
                insertStmt.setString(1, userEmail);
//                insertStmt.setInt(1, userId);
                insertStmt.setInt(2, productId);
                insertStmt.setInt(3, quantity);
                insertStmt.executeUpdate();
            }
            response.sendRedirect("viewCart");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
    }

}



