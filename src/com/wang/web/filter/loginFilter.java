package com.wang.web.filter;

import com.wang.momo.User;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

public class loginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        //获取用户填写的验证码
        String check = request.getParameter("check");
        if (check != null){
            //校验验证码
            HttpServletRequest r = (HttpServletRequest) request;
            HttpSession session = r.getSession();
            String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
            if (checkcode_server.equalsIgnoreCase(check)) {

                Map<String, String[]> map = request.getParameterMap();
                User user = new User();
                String username = request.getParameter("qq");
                String password = request.getParameter("password");
                filterChain.doFilter(request, response);
            }
        }
        request.setAttribute("login_msg","验证码错误！");
        request.getRequestDispatcher("/login.jsp").forward(request,response);

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
