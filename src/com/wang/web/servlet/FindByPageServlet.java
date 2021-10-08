package com.wang.web.servlet;

import com.wang.momo.PageBean;
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

@WebServlet("/findByPageServlet")
public class FindByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("utf-8");
        //接受请求参数
        String currentPage = request.getParameter("currentPage"); //当前页码
        String rows = request.getParameter("rows");//每页显示条数
        if (currentPage == null || "".equals(currentPage)){
            currentPage = "1";
        }
        if (rows == null || "".equals(rows)){
            rows = "4";
        }
        Map<String, String[]> condition = request.getParameterMap();
        UserService service = new UserServiceImpl();
        PageBean<User> userByPage = service.findUserByPage(currentPage, rows,condition);
        //将pageBean存入request
        request.setAttribute("pb",userByPage);
        request.getRequestDispatcher("/list.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
