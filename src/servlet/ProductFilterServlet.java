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
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This Servlet aims to filter product in price.
 */
public class ProductFilterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        Pattern p = Pattern.compile("\\d{2,}");
        String s = request.getParameter("amount");
        Matcher m = p.matcher(s);
        String[] s1 = new String[2];
        int i = 0;
        while (m.find()) {
            s1[i] = m.group();
            i++;
        }
        ProductDAO pdo = new ProductDAOImpl();
        List<Product> productList = pdo.searchByFilter(s1[0],s1[1]);
        //商品的集合准备好
        //将数据存到request域 转发给product_list.js进行显示
        HttpSession session=request.getSession();
        session.setAttribute("productList", productList);
        //request.setAttribute("productList", productList);
        request.getRequestDispatcher("/productList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}