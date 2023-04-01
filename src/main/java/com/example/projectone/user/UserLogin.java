package com.example.projectone.user;

import com.example.projectone.DBConnection;
import com.example.projectone.seller.SellerRegister;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.example.projectone.seller.SellerRegister.hashPassword;


@WebServlet(name = "userLogin", value = "/user-login")
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final UserService userService = new UserService(); // Assumes UserService is defined

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Render login form
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate user
        User user = userService.validateUser(email, password); // Assumes UserService has a validateUser method

        if (user != null) {
            // Create session and redirect to home page
            HttpSession session = request.getSession();
            session.setAttribute("name", user.getUsername());
            session.setAttribute("userEmail", user.getEmail());
            response.sendRedirect("home.jsp");
        } else {
            // Display error message and render login form
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}






