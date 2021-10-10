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
 * This Servlet aims to change the order.
 */
public class ChangeOrderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customer = (String) session.getAttribute("UserID");
        OrderDAO od =  new OrderDAOImpl();
        OrderMessage om = (OrderMessage) session.getAttribute("CheckOrderMessage");
        om.setfName(request.getParameter("c_fname"));
        om.setlName(request.getParameter("c_lname"));
        om.setAddress(request.getParameter("c_address"));
        om.setPhone(request.getParameter("c_phone"));
        od.ChangeOrder(om,customer,om.getOid());

        request.getRequestDispatcher("/thankyou.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
