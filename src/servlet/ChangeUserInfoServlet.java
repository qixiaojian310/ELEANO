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
 * This Servlet aims to change the userinfo.
 */
public class ChangeUserInfoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        String passwordGet = request.getParameter("password");
        String password ,customer;
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String nickname = request.getParameter("nickname");

        if (passwordGet == ""){
            password = ((User)session.getAttribute("User")).getUserPassword();
        }
        else {
            password = MD5Utils.getPwd(passwordGet);
        }
        if (phone == ""){
            phone = ((User)session.getAttribute("User")).getUserPhone();
        }
        if (email == ""){
            email = ((User)session.getAttribute("User")).getUserEmail();
        }
        if (nickname == ""){
            nickname = ((User)session.getAttribute("User")).getNickName();
        }

        customer = (String) session.getAttribute("UserID");
        UserDAO dao = new UserDAOImpl();
        dao.ChangeUser(customer,password,phone,email,nickname);
        User user = dao.ReturnUser(customer);
        session.setAttribute("User",user);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

