package servlet;

import dao.CartDao;
import dao.impl.CartDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * This Servlet aims to delete a item in cart.
 */
public class DeleteCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customer = (String) session.getAttribute("UserID");
        String productID = request.getParameter("CartDeleteIid");
        CartDao pdo = new CartDAOImpl();
        pdo.CartDelete(customer,productID);
        request.getRequestDispatcher("/checkcart").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
