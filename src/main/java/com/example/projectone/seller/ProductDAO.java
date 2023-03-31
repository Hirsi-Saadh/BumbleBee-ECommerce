package com.example.projectone.seller;

import com.example.projectone.DBConnection;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();

        String sql = "SELECT * FROM products";
        try (Connection conn = DBConnection.getConn();
             Statement statement = conn.createStatement();
             ResultSet result = statement.executeQuery(sql)) {

            while (result.next()) {
                int id = result.getInt("id");
                String name = result.getString("name");
                String description = result.getString("description");
                String category = result.getString("category");
                BigDecimal price = result.getBigDecimal("price");
                byte[] image = result.getBytes("image");
                String dimensions = result.getString("dimensions");
                String weight = result.getString("weight");
                String color = result.getString("color");

                Product product = new Product(id, name, description, category, price, image, dimensions, weight, color);
                products.add(product);
            }
        }

        return products;
    }
}
