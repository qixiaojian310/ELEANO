package servlet;

import dao.ProductDAO;
import dao.impl.ProductDAOImpl;
import vo.Product;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import java.util.List;

/**
 * This Servlet aims to show product in index page.
 */
public class InitialServlet extends HttpServlet {
    ServletContext Context;

    public void init() {
        ProductDAO pdo = new ProductDAOImpl();
        List<Product> productList = pdo.IndexProduct();
        Context = getServletContext();
        Context.setAttribute("IndexProduct", productList);
        System.out.println("Start running");
}

}
