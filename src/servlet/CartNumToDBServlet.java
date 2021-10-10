package servlet;

import dao.CartDao;
import dao.impl.CartDAOImpl;
import utils.ProductIDProcessUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * This Servlet aims to change the number of Database when you change the number in cart.jsp.
 */
public class CartNumToDBServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String customer = (String) session.getAttribute("UserID");
        CartDao cdo = new CartDAOImpl();

        String pid =  request.getParameter("ProductID");
        Integer num = Integer.parseInt(request.getParameter("ProductNum"));
        pid = ProductIDProcessUtils.Process(pid);
        cdo.CartUpdate(customer,pid,num);
        out.print("OK");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
