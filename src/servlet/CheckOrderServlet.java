package servlet;

import dao.OrderDAO;
import dao.impl.OrderDAOImpl;
import vo.CartProduct;
import vo.OrderMessage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * This Servlet aims to check order.
 */
public class CheckOrderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customer = (String) session.getAttribute("UserID");
        String Oid = request.getParameter("CheckOrderID");
        OrderDAO od = new OrderDAOImpl();
        OrderMessage Order = od.CheckOrder(customer,Integer.parseInt(Oid));
        List<CartProduct> ProductList = od.CheckOrderItem(Integer.parseInt(Oid));
        session.setAttribute("OrderItemList",ProductList);
        session.setAttribute("CheckOrderMessage",Order);
        request.getRequestDispatcher("/checkorder.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
