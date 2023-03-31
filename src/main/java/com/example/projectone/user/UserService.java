package com.example.projectone.user;

import com.example.projectone.DBConnection;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;


public class UserService {

        // Method to authenticate a user
        public User authenticateUser(String email, String password) {
            // Hash the password using SHA-256
            String hashedPassword = hashPassword(password);

            try {
                // Get a connection to the database
                Connection conn = DBConnection.getConn();

                // Create the SQL statement to retrieve the user with the given email and hashed password
                String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, email);
                statement.setString(2, hashedPassword);

                // Execute the query
                ResultSet result = statement.executeQuery();

                // If the query returned a result, create a User object from it and return it
                if (result.next()) {
                    int id = result.getInt("id");
                    String name = result.getString("name");
                    String address = result.getString("address");
                    String phone = result.getString("phone");
                    email = result.getString("email");
                    password = result.getString("password");
                    User user = new User(name, address, phone, email, password);
                    return user;
                }

                // If the query did not return a result, return null
                return null;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }

        // Method to hash a password using SHA-256
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


    public User getUser(String email, String hashedPassword) {
        try {
            // get a connection to the database
            Connection conn = DBConnection.getConn();

            // create the SQL statement to retrieve the customer with the given email and password
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, hashedPassword);

            // execute the query
            ResultSet result = statement.executeQuery();

            // if the query returned a result, create a Customer object from it and return it
            if (result.next()) {
                int id = result.getInt("id");
                String name = result.getString("name");
                String address = result.getString("address");
                String phone = result.getString("phone");
                String password = result.getString("password");
                User user = new User(name, address, phone, email, password);
                return user;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public void addUser(User user) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "INSERT INTO users (name, address, phone, email, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getAddress());
            pstmt.setString(3, user.getPhone());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPassword());
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        // Update an existing customer in the database
        try {
            Connection conn = DBConnection.getConn();
            PreparedStatement pstmt = conn.prepareStatement("UPDATE users SET name = ?, address = ?, phone = ?, email = ?, password = ? WHERE id = ?");

            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getAddress());
            pstmt.setString(3, user.getPhone());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPassword());
            pstmt.setInt(6, user.getId());

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(User user) {
        // Delete a customer from the database
        try {
            Connection conn = DBConnection.getConn();
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM users WHERE id = ?");
            pstmt.setInt(1, user.getId());
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
