package com.example.projectone.user;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.example.projectone.seller.SellerRegister.hashPassword;

@WebServlet(name = "userRegister", value = "/user-register")
public class UserRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;

        private final UserService userService = new UserService(); // Assumes UserService is defined

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                // Render registration form
                request.getRequestDispatcher("register.jsp").forward(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                // Get parameters from form
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");

                // Create user object
                User user = new User(username, address, phone, email, password);

                // Validate and save user
                boolean success = userService.saveUser(user); // Assumes UserService has a saveUser method

                if (success) {
                        // Redirect to login page
                        response.sendRedirect(request.getContextPath() + "/login");
                } else {
                        // Display error message and render registration form
                        request.setAttribute("errorMessage", "Error registering user");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                }
        }
}
