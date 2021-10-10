package servlet;

import dao.ProductDAO;
import dao.impl.ProductDAOImpl;
import vo.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * This Servlet aims to check single product.
 */
public class ProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        ProductDAO pdo = new ProductDAOImpl();
        Product product = pdo.showProduct(request.getParameter("productID"));
        //商品的集合准备好
        //将数据存到request域 转发给product_list.js进行显示
        HttpSession session=request.getSession();
        session.setAttribute("product", product);
        //request.setAttribute("productList", productList);
        request.getRequestDispatcher("/single_product.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
