package com.example.projectone.seller;

import java.math.BigDecimal;
import java.util.Base64;

public class Product {
    private int id;
    private String name;
    private String description;
    private String category;
    private BigDecimal price;
    private byte[] image;
    private String dimensions;
    private String weight;
    private String color;

    public Product(int id, String name, String description, String category, BigDecimal price, byte[] image, String dimensions, String weight, String color) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.category = category;
        this.price = price;
        this.image = image;
        this.dimensions = dimensions;
        this.weight = weight;
        this.color = color;
    }

    public String getImageBase64() {
        if (image == null) {
            return null;
        }
        return Base64.getEncoder().encodeToString(image);
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getCategory() {
        return category;
    }

    public BigDecimal getPrice() {
        return price;
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
}
