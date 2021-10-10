package servlet;

import dao.ProductDAO;
import dao.impl.ProductDAOImpl;
import vo.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * This Servlet aims to order product in price.
 */
public class PriceOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        ProductDAO pdo = new ProductDAOImpl();
        HttpSession session = request.getSession();
        int flag =  Integer.parseInt(request.getParameter("HOL"));
        List<Product> productList;
        if (flag == 1){
            productList = pdo.HLPrice();
        }
        else {
            productList = pdo.LHPrice();
        }
        //Prepare for the list of product
        //save the data in request and dispatcher it to productList.jsp
        session.setAttribute("productList", productList);
        //request.setAttribute("productList", productList);
        request.getRequestDispatcher("/productList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
