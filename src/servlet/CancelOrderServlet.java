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

/**
 * This Servlet aims to cancel order.
 */
public class CancelOrderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customer = (String) session.getAttribute("UserID");
        OrderDAO od =  new OrderDAOImpl();
        OrderMessage om = (OrderMessage) session.getAttribute("CheckOrderMessage");
        od.CancelOrder(om.getOid(),customer);

        request.getRequestDispatcher("/thankyou.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
