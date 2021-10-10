package servlet;

import dao.UserDAO;
import dao.impl.UserDAOImpl;
import utils.MD5Utils;
import vo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * This Servlet aims to check login information.
 */
public class CheckLoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        User user = new User();
        user.setUserID(request.getParameter("UserID"));
        user.setUserPassword(MD5Utils.getPwd(request.getParameter("UserPassword")));
        PrintWriter out = response.getWriter();
        UserDAO dao = new UserDAOImpl();
        int flag = 0;
        try {
            flag = dao.queryByUserID(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag == 1) {
            out.print("OK");
        } else {
            out.print("wrong");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
