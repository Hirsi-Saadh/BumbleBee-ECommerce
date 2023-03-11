package com.example.projectone.seller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "sellerLogin", value = "/seller-login")
public class SellerLogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Hash the user-entered password using SHA-256
        String hashedPassword = hashPassword(password);

        // Retrieve the seller with the given username from the database
        SellerDAO sellerDAO = new SellerDAO();
        Seller seller = sellerDAO.getSellerByUsername(username);

        if (seller != null && seller.getPassword().equals(hashedPassword)) {
            // Authentication successful, redirect to success page
            response.sendRedirect("seller-center/success.jsp");
        } else {
            // Authentication failed, redirect to error page
            response.sendRedirect("seller-center/sellerRegistration.jsp");
        }
    }

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedPasswordBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedPasswordBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}