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

@WebServlet(name = "userRegister", value = "/user-register")
public class UserRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Hash the password using SHA-256
        String hashedPassword = hashPassword(password);

        User user = new User(username, address, phone, email, hashedPassword);
        UserService userService = new UserService();
        userService.addUser(user);

        // Redirect to login page
        response.sendRedirect("home.jsp");
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
