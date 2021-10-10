package servlet;

import dao.OrderDAO;
import dao.impl.OrderDAOImpl;
import vo.OrderMessage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * This Servlet aims to show order list.
 */
public class ShowOrderListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customer = (String) session.getAttribute("UserID");
        OrderDAO od = new OrderDAOImpl();
        List<OrderMessage> OrderList = od.CheckTotalOrder(customer);
        session.setAttribute("CheckOrderList",OrderList);
        request.getRequestDispatcher("/getOrderDetail.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
