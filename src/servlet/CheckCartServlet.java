package servlet;

import dao.CartDao;
import dao.impl.CartDAOImpl;
import vo.CartProduct;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * This Servlet aims to check cart in cart.jsp.
 */
public class CheckCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customer = (String) session.getAttribute("UserID");
        if (customer == null)
        {
            response.sendRedirect("login.jsp");
        }
        else{
              CartDao pdo = new CartDAOImpl();
              List<CartProduct> productList = pdo.CheckCart(customer);
              session.setAttribute("cartList", productList);
              request.getRequestDispatcher("/cart.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
