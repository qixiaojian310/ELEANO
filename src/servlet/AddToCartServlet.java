package servlet;

import dao.CartDao;
import dao.impl.CartDAOImpl;
import vo.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * This Servlet aims to add item to cart.
 */
public class AddToCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customer = (String) session.getAttribute("UserID");
        Product product = (Product) session.getAttribute("product");
        String p_amount = request.getParameter("p_amount");
        CartDao pdo = new CartDAOImpl();
        pdo.AddToCart(product,p_amount,customer);

        request.getRequestDispatcher("/checkcart").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
