package com.example.projectone.user;

import com.example.projectone.DBConnection;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {


    public boolean saveUser(User user) {
        try (Connection conn = DBConnection.getConn();
             PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users (name, address, phone, email, password) VALUES (?, ?, ?, ?, ?)")) {

            // Hash the password using SHA-256
            String hashedPassword = hashSHA256(user.getPassword());

            // Set parameters for prepared statement
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getAddress());
            pstmt.setString(3, user.getPhone());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, hashedPassword);

            // Execute prepared statement
            int rowsAffected = pstmt.executeUpdate();

            // Check if any rows were affected
            if (rowsAffected == 1) {
                return true; // User was saved successfully
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false; // User was not saved
    }

    public User validateUser(String email, String password) {
        try (Connection conn = DBConnection.getConn();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM users WHERE email = ?")) {

            // Set parameters for prepared statement
            pstmt.setString(1, email);

            // Execute prepared statement and get result set
            ResultSet rs = pstmt.executeQuery();

            // Check if any rows were returned
            if (rs.next()) {
                // Hash the password using SHA-256
                String hashedPassword = hashSHA256(password);

                // Check if the hashed password matches the stored password
                if (hashedPassword.equals(rs.getString("password"))) {
                    // Create user object from result set
                    User user = new User(
                            rs.getString("name"),
                            rs.getString("address"),
                            rs.getString("phone"),
                            rs.getString("email"),
                            rs.getString("password")
                    );
                    return user; // User exists and password is correct, return user object
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // User does not exist or password is incorrect, return null
    }

    private String hashSHA256(String password) {
        try {
            // Create message digest object for SHA-256 algorithm
            MessageDigest md = MessageDigest.getInstance("SHA-256");

            // Add password bytes to message digest
            md.update(password.getBytes());

            // Get the hashed password bytes
            byte[] hashedBytes = md.digest();

            // Convert hashed bytes to hexadecimal string
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return null; // Hashing failed
    }
}
