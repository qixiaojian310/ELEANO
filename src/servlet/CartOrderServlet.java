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
 * This Servlet aims to place an order in cart.
 */
public class CartOrderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customer = (String) session.getAttribute("UserID");
        CartDao pdo = new CartDAOImpl();
        List<CartProduct> productList = (List<CartProduct>) session.getAttribute("cartList");
        int i=0;
        for (CartProduct product:productList){
            Integer num = Integer.parseInt(request.getParameter("Cart"+product.getIid()));
            pdo.CartUpdate(customer,product.getIid(),num);
        }
        productList=pdo.CheckCart(customer);
        session.setAttribute("cartList", productList);
        if (request.getParameter("IsOrder")==null)
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
        else{
            session.setAttribute("IsSingleOrder",0);
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}