package com.example.projectone.seller;

import com.example.projectone.DBConnection;

import java.math.BigDecimal;
import java.sql.*;
import java.util.Base64;

public class Product {
    private int id;
    private String name;
    private String description;
    private String category;
    private BigDecimal price;
    private byte[] image;

    private byte[] image2;
    private byte[] image3;
    private byte[] image4;
    private String dimensions;
    private String weight;
    private String color;

    private int stock;

    public Product(int id, String name, String description, String category, BigDecimal price, byte[] image, byte[] image2, byte[] image3, byte[] image4, String dimensions, String weight, String color, int stock) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.category = category;
        this.price = price;
        this.image = image;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
        this.dimensions = dimensions;
        this.weight = weight;
        this.color = color;
        this.stock = stock;
    }


    public static Product getProductById(int productId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Product product = null;
        try {
            conn = DBConnection.getConn();
            stmt = conn.prepareStatement("SELECT * FROM products WHERE id = ?");
            stmt.setInt(1, productId);
            rs = stmt.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String category = rs.getString("category");
                BigDecimal price = rs.getBigDecimal("price");
                byte[] image = rs.getBytes("image");
                byte[] image2 = rs.getBytes("imagetwo");
                byte[] image3 = rs.getBytes("imagethree");
                byte[] image4 = rs.getBytes("imagefour");
                String dimensions = rs.getString("dimensions");
                String weight = rs.getString("weight");
                String color = rs.getString("color");
                int stock = rs.getInt("stock");
                product = new Product(id, name, description, category, price, image, image2, image3, image4, dimensions, weight, color, stock);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return product;
    }

    public static void closeResources(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            System.out.println("Error closing ResultSet: " + e.getMessage());
        }

        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {
            System.out.println("Error closing Statement: " + e.getMessage());
        }

        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println("Error closing Connection: " + e.getMessage());
        }
    }

    public String getImageBase64() {
        if (image == null) {
            return null;
        }
        return Base64.getEncoder().encodeToString(image);
    }

    public String getImage2Base64() {
        if (image2 == null) {
            return null;
        }
        return Base64.getEncoder().encodeToString(image2);
    }

    public String getImage3Base64() {
        if (image3 == null) {
            return null;
        }
        return Base64.getEncoder().encodeToString(image3);
    }


    public String getImage4Base64() {
        if (image4 == null) {
            return null;
        }
        return Base64.getEncoder().encodeToString(image4);
    }




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public byte[] getImage() {
        return image;
    }

    public String getDimensions() {
        return dimensions;
    }

    public String getWeight() {
        return weight;
    }

    public String getColor() {
        return color;
    }

    public int getStock() {    return stock; }

    public void setStock(int stock) {  this.stock = stock;  }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public byte[] getImage2() {
        return image2;
    }

    public void setImage2(byte[] image2) {
        this.image2 = image2;
    }

    public byte[] getImage3() {
        return image3;
    }

    public void setImage3(byte[] image3) {
        this.image3 = image3;
    }

    public byte[] getImage4() {
        return image4;
    }

    public void setImage4(byte[] image4) {
        this.image4 = image4;
    }

    public void setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
