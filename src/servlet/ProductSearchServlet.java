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
 * This Servlet aims to search product.
 */
public class ProductSearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {


        ProductDAO pdo = new ProductDAOImpl();
        List<Product> productList = pdo.searchByName(request.getParameter("ProductName"));
        //商品的集合准备好
        //将数据存到request域 转发给product_list.js进行显示
        HttpSession session=request.getSession();
        session.setAttribute("productList", productList);
        List<Catagory> catagoryList = pdo.GetCatagory();
        session.setAttribute("Catagory",catagoryList);
        //request.setAttribute("productList", productList);
        request.getRequestDispatcher("/productList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
