package com.example.projectone.order;

import com.example.projectone.DBConnection;
import com.example.projectone.cart.ShoppingCart;
import com.example.projectone.cart.ShoppingCartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/processOrder")
public class ProcessOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
        }else{

        }
        String userEmail = (String) session.getAttribute("userEmail");
        // get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String district = request.getParameter("district");

        // get order items from session
        List<ShoppingCartItem> cartItems = (List<ShoppingCartItem>) request.getSession().getAttribute("cartItems");

        // calculate total
        int total = Integer.parseInt(request.getParameter("total"));


        // save order to database
        try (Connection conn = DBConnection.getConn()) {
            // insert order
            String sql = "INSERT INTO orders (user_email, name, phone, street, city, district, total) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, userEmail);
            statement.setString(2, name);
            statement.setString(3, phone);
            statement.setString(4, street);
            statement.setString(5, city);
            statement.setString(6, district);
            statement.setDouble(7, total);
            int affectedRows = statement.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int orderId = generatedKeys.getInt(1);
                // insert order items
                for (ShoppingCartItem cartItem : cartItems) {
                    sql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
                    statement = conn.prepareStatement(sql);
                    statement.setInt(1, orderId);
                    statement.setInt(2, cartItem.getProduct().getId());
                    statement.setInt(3, cartItem.getQuantity());
                    statement.setBigDecimal(4, cartItem.getProduct().getPrice());
                    statement.executeUpdate();

                    // update product stock
                    sql = "UPDATE products SET stock = stock - ? WHERE id = ?";
                    statement = conn.prepareStatement(sql);
                    statement.setInt(1, cartItem.getQuantity());
                    statement.setInt(2, cartItem.getProduct().getId());
                    statement.executeUpdate();

                    sql = "DELETE FROM cart WHERE user_email = ? AND product_id = ?";
                    statement = conn.prepareStatement(sql);
                    statement.setString(1, userEmail);
                    statement.setInt(2, cartItem.getProduct().getId());
                    statement.executeUpdate();
                }
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }

        // clear cart and session
        cartItems.clear();
        request.getSession().removeAttribute("cartItems");

        // redirect to confirmation page
        response.sendRedirect(request.getContextPath() + "/confirmation.jsp");

    }

}

