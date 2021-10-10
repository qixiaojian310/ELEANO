package servlet;

import dao.UserDAO;
import dao.impl.UserDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * This Servlet aims to check sign up information.
 */
public class CheckSignUpIDServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String userID = request.getParameter("SignUpID");
        UserDAO dao = new UserDAOImpl();
        boolean flag = dao.ValidateID(userID);
        if (!flag) {
            out.print("The userID is already exited");
        } else {
            out.print("OK");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
