package servlet;

import dao.UserDAO;
import dao.impl.UserDAOImpl;
import utils.MD5Utils;
import vo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * This Servlet aims to login.
 */
public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
        User user = new User();
        user.setUserID(req.getParameter("UserID"));
        user.setUserPassword(MD5Utils.getPwd(req.getParameter("UserPassword")));
        UserDAO dao = new UserDAOImpl();
        int flag = 0;
        try {
            flag = dao.queryByUserID(user);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if(flag == 1){
            user = dao.ReturnUser(user.getUserID());
            HttpSession session=req.getSession();
            session.setAttribute("UserID", user.getUserID());
            session.setAttribute("NickName",user.getNickName());
            session.setAttribute("User",user);
            res.sendRedirect("./index.jsp");
        } else {
            req.getSession().setAttribute("Passwordmatch", "Password is wrong");
            res.sendRedirect("./login.jsp");
        }
    }
}
