package com.example.projectone.seller;

import com.example.projectone.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private Connection connection;

    public ProductDao() {
        // initialize database connection
        connection = DBConnection.getConn();
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO products (name, description, price) VALUES (?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, product.getName());
            statement.setString(2, product.getDescription());
            statement.setDouble(3, product.getPrice());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product product) {
        String sql = "UPDATE products SET name = ?, description = ?, price = ? WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, product.getName());
            statement.setString(2, product.getDescription());
            statement.setDouble(3, product.getPrice());
            statement.setInt(4, product.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Product getProductById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        Product product = null;

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                product = new Product(id, name, description, price);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }

    public List<Product> getAllProducts() {
        String sql = "SELECT * FROM products";
        List<Product> products = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                Product product = new Product(id, name, description, price);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }
}

