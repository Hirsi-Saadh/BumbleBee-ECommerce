package com.example.projectone.user;

import com.example.projectone.DBConnection;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

@WebServlet(name = "userLogin", value = "/user-login")
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Hash the password using SHA-256
        String hashedPassword = hashPassword(password);

        UserService userService = new UserService();
        User user = userService.authenticateUser(email, hashedPassword);

        if (user != null) {
            // Set session attribute to indicate that the user is logged in
            HttpSession session = request.getSession();
            session.setAttribute("loggedIn", true);
            session.setAttribute("loggedInUser", user);

            // Forward to home page
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            // Show error message on login page
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private String hashPassword(String password) {
        String hashedPassword = null;

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(password.getBytes());
            hashedPassword = Base64.getEncoder().encodeToString(hashBytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return hashedPassword;
    }
}






