package servlet;

import vo.CartProduct;
import vo.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * This Servlet aims to check out single product.
 */
public class SingleCheckOutServlet extends HttpServlet {

    public void PtoCP(CartProduct CP, Product P, String num){
      CP.setIid(P.getIid());
      CP.setIname(P.getName());
      CP.setIprice(P.getPrice());
      CP.setNum(Integer.parseInt(num));
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customer = (String) session.getAttribute("UserID");
        Product product = (Product) session.getAttribute("product");
        CartProduct product1 = new CartProduct();
        PtoCP(product1,product,request.getParameter("p_amount"));
        session.setAttribute("singleCP",product1);
        session.setAttribute("IsSingleOrder",1);
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
