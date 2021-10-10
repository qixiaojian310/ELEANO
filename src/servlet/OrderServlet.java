package servlet;

import dao.CartDao;
import dao.OrderDAO;
import dao.impl.CartDAOImpl;
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
 * This Servlet aims to place an order.
 */
public class OrderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customer = (String) session.getAttribute("UserID");
        OrderDAO od =  new OrderDAOImpl();
        OrderMessage om = new OrderMessage();
        om.setfName(request.getParameter("c_fname"));
        om.setlName(request.getParameter("c_lname"));
        om.setAddress(request.getParameter("c_address"));
        om.setPhone(request.getParameter("c_phone"));
        Integer Oid = od.My_Order(om,customer, (Integer) session.getAttribute("c_price"));

        if ((Integer) session.getAttribute("IsSingleOrder") == 1){
            CartProduct product = (CartProduct) session.getAttribute("singleCP");
            od.OrderItem(product,product.getNum(),customer,Oid);
        }
        else {
            List<CartProduct> productList = (List<CartProduct>) session.getAttribute("cartList");
            for (CartProduct product:productList){
                od.OrderItem(product,product.getNum(),customer,Oid);
            }
            CartDao cdo = new CartDAOImpl();
            cdo.CartClear(customer);
        }
        session.setAttribute("IsSingleOrder",0);



        request.getRequestDispatcher("/thankyou.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
