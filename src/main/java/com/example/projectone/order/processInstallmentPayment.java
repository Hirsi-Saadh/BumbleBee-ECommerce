package com.example.projectone.order;

import com.example.projectone.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

@SuppressWarnings("ALL")
@WebServlet("/processInstallmentPayment")
public class processInstallmentPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int installmentNumber = Integer.parseInt(request.getParameter("installmentNumber"));

        String userEmail = (String) request.getSession().getAttribute("userEmail");

        try (Connection conn = DBConnection.getConn()) {
            double totalAmount = 0;
            String sql = "SELECT total FROM orders WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, orderId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalAmount = resultSet.getDouble("total");
            }

            // Calculate installment amount based on installment number
            double installmentAmount = totalAmount / 3;

            // Insert installment row
            sql = "INSERT INTO installment (order_id, installment_number, user_email, amount, payment_date) VALUES (?, ?, ?, ?, ?)";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, orderId);
            statement.setInt(2, installmentNumber);
            statement.setString(3, userEmail);
            statement.setDouble(4, installmentAmount);
            statement.setDate(5, Date.valueOf(LocalDate.now().plusMonths(installmentNumber - 1)));
            statement.executeUpdate();

            // Update order status to paid if all installments have been paid
            sql = "SELECT COUNT(*) AS installment_count FROM installment WHERE order_id = ?";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, orderId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int installmentCount = resultSet.getInt("installment_count");
                if (installmentCount == 3) {
                    sql = "UPDATE orders SET status = 'PAID' WHERE id = ?";
                    statement = conn.prepareStatement(sql);
                    statement.setInt(1, orderId);
                    statement.executeUpdate();
                } else{
                    sql = "UPDATE orders SET status = 'UNPAID' WHERE id = ?";
                    statement = conn.prepareStatement(sql);
                    statement.setInt(1, orderId);
                    statement.executeUpdate();
                }
            }

            // Redirect to payment confirmation page
            response.sendRedirect(request.getContextPath() + "/payment-confirmation.jsp");

        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
