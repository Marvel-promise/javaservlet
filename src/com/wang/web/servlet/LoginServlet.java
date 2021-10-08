package com.wang.web.servlet;

import com.wang.momo.User;
import com.wang.service.UserService;
import com.wang.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("utf-8");
        //获取数据
        String check = request.getParameter("check");
        String checkcode_server = (String) request.getSession().getAttribute("CHECKCODE_SERVER");
        request.getSession().removeAttribute("CHECKCODE_SERVER");//确保验证码一次性
        System.out.println(checkcode_server);
        if ( ! checkcode_server.equalsIgnoreCase(check)) {
            request.setAttribute("login_msg","验证码错误！");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
            return;
        }
        String qq = request.getParameter("qq");
        String password = request.getParameter("password");
        //封装User
        //调用service查询
        User login_user = new UserServiceImpl().login(qq, password);
        //判断是否登录成功
        if(login_user != null){
            //登录成功，将用户存入session
            request.getSession().setAttribute("user",login_user);
            //跳转页面
            response.sendRedirect(request.getContextPath()+"/index.jsp");

        }else{
            //登录失败
            //提示登录失败信息
            request.setAttribute("login_msg","用户名或密码错误");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
