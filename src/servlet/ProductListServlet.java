package servlet;

import dao.ProductDAO;
import dao.impl.ProductDAOImpl;
import vo.Catagory;
import vo.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * This Servlet aims to get product list show in the shop page.
 */
public class ProductListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String catagory = request.getParameter("CatagoryFlag");

        ProductDAO pdo = new ProductDAOImpl();
        List<Product> productList = null;
        List<Catagory> catagoryList = pdo.GetCatagory();
        if (catagory == null){
            productList = pdo.ShowList();
        }
        else {
            productList = pdo.ShowList(catagory);
        }
        //商品的集合准备好
        //将数据存到request域 转发给product_list.js进行显示
        HttpSession session=request.getSession();
        session.setAttribute("productList", productList);
        session.setAttribute("Catagory",catagoryList);
        //request.setAttribute("productList", productList);
        request.getRequestDispatcher("/productList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
