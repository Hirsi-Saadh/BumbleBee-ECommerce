package com.example.projectone.cart;

import com.example.projectone.seller.Product;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ShoppingCart {
    private static List<ShoppingCartItem> items;

    public ShoppingCart() {
        this.items = new ArrayList<>();
    }

    public static List<ShoppingCartItem> getItems() {
        return items;
    }

    public static void addItem(Product product, int quantity) {
        BigDecimal price = product.getPrice().multiply(new BigDecimal(quantity));
        ShoppingCartItem item = new ShoppingCartItem(product, quantity);
        items.add(item);
    }

    public static BigDecimal getTotal(List<ShoppingCartItem> items) {
        BigDecimal total = BigDecimal.ZERO;
        for (ShoppingCartItem item : items) {
            total = total.add(item.getSubtotal());
        }
        return total;
    }

    public static void removeItem(Product product) {
        for (Iterator<ShoppingCartItem> iterator = items.iterator(); iterator.hasNext();) {
            ShoppingCartItem item = iterator.next();
            if (item.getProduct().equals(product)) {
                iterator.remove();
                break;
            }
        }
    }

    public static void clear() {
        items.clear();
        BigDecimal subtotal = BigDecimal.ZERO;
        BigDecimal total = BigDecimal.ZERO;
    }
}


