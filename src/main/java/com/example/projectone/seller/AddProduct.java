package com.example.projectone.seller;

import com.example.projectone.DBConnection;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "AddProduct", value = "/add-product")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // get form data
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

        // insert product data into database
        String sql = "INSERT INTO products (name, description, category, price, image, imagetwo, imagethree, imagefour, dimensions, weight, color, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            Connection conn = DBConnection.getConn();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, description);
            statement.setString(3, category);
            statement.setBigDecimal(4, price);

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(5, inputStream);
            }
            if (inputStream2 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(6, inputStream2);
            }
            if (inputStream3 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(7, inputStream3);
            }
            if (inputStream4 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(8, inputStream4);
            }

            statement.setString(9, dimensions);
            statement.setString(10, weight);
            statement.setString(11, color);
            statement.setInt(12, stock);

            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // display success message in alert box
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write("<script>alert('Product added successfully!')</script>");

        // display success message in alert box
//        response.setContentType("text/html;charset=UTF-8");
//        response.getWriter().write("<script>alert('Product added successfully!')</script>");

        // redirect to product list page
        response.sendRedirect("view-products");
    }
}
