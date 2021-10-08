package com.wang.web.servlet;

import com.wang.service.UserService;
import com.wang.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delSelectServlet")
public class DelSelectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取所有的id
        String[] s_ids = request.getParameterValues("s_id");
        if(s_ids !=null && s_ids.length >0){
            //调用service的del方法
            UserService service= new UserServiceImpl();
            service.deleteUsers(s_ids);
        }
        //重定向跳转到Servlet
        response.sendRedirect(request.getContextPath()+"/userListServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
