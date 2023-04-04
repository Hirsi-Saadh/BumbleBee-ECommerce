package com.example.projectone.seller;

import com.example.projectone.DBConnection;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "ProductUpdate", value = "/update-product")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB

public class UpdateProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // get form data
        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String dimensions = request.getParameter("dimensions");
        String weight = request.getParameter("weight");
        String color = request.getParameter("color");
        int stock = Integer.parseInt(request.getParameter("stock"));
        InputStream inputStream = null; // input stream of the upload file
        InputStream inputStream2 = null;
        InputStream inputStream3 = null;
        InputStream inputStream4 = null;

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("image");
        Part filePart2 = request.getPart("image2");
        Part filePart3 = request.getPart("image3");
        Part filePart4 = request.getPart("image4");
        if (filePart != null) {
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            inputStream2 = filePart2.getInputStream();
            inputStream3 = filePart3.getInputStream();
            inputStream4 = filePart4.getInputStream();
        }

        // update product data in database
        String sql = "UPDATE products SET name=?, description=?, category=?, price=?, weight=?, stock=? WHERE id=?";
        try {

            Connection conn = DBConnection.getConn();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, description);
            statement.setString(3, category);
            statement.setBigDecimal(4, price);



            statement.setString(5, weight);

            statement.setInt(6, stock);

            statement.setInt(7, productId);

            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // display success message in alert box
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write("<script>alert('Product updated successfully!')</script>");

        // redirect to product list page
        response.sendRedirect("view-products");
    }
}