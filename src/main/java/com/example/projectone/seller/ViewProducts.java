package com.example.projectone.seller;

import com.example.projectone.DBConnection;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ViewProducts", value = "/view-products")
public class ViewProducts extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // handle POST requests here
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> products = new ArrayList<Product>();

        // retrieve all products from database
        String sql = "SELECT * FROM products";
        try {
            Connection conn = DBConnection.getConn();
            Statement statement = conn.createStatement();
            ResultSet result = statement.executeQuery(sql);

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

            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("seller-center/product.jsp").forward(request, response);
    }
}
