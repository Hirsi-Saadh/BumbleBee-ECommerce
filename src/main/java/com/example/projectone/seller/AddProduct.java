package com.example.projectone.seller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddProduct", value = "/add-product")
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDao productDao;

    public void init() {
        productDao = new ProductDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));

        Product product = new Product(name, description, price);
        productDao.addProduct(product);

        response.sendRedirect("product?action=list");
    }
}
