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
 * This Servlet aims to sign up.
 */
public class SignUpServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
        User user = new User();
        user.setUserID(req.getParameter("UserID"));
        user.setUserPassword(MD5Utils.getPwd(req.getParameter("UserPassword")));
        user.setUserPhone(req.getParameter("UserPhone"));
        user.setUserEmail(req.getParameter("UserEmail"));
        user.setNickName(req.getParameter("UserName"));

        UserDAO dao = new UserDAOImpl();
        int flag = 0;
        try {
            flag = dao.SignUpUser(user);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if(flag == 1){
            HttpSession session=req.getSession();
            session.setAttribute("UserID", user.getUserID());
            session.setAttribute("NickName",user.getNickName());
            res.sendRedirect("./index.jsp");
        } else {
            res.setContentType("text/html;charset=gb2312");
            res.getWriter().print("<script>alert('This account is already exits');</script>");
            res.sendRedirect("./signUp.jsp");
        }
    }
}
