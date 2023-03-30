package com.example.projectone.user;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static java.lang.System.out;

@WebServlet(name = "userLogin", value = "/user-login")
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Hash the password using SHA-256
        String hashedPassword = hashPassword(password);

        UserService userService = new UserService();
        User user = userService.getUser(email, hashedPassword);

        if (user != null) {
            // Set session attribute to indicate that the user is logged in
            HttpSession session = request.getSession();
            session.setAttribute("loggedIn", true);
            session.setAttribute("loggedInUser", user);


            // Redirect to home page
            response.sendRedirect("index.jsp");
        } else {
            // Show error message on login page
            // Display an alert box with an error message
            String message = "Incorrect email or password";
            out.println("<script>alert('" + message + "');</script>");
            RequestDispatcher dispatcher = request.getRequestDispatcher("fuck.jsp");
            dispatcher.include(request, response);
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