package com.example.CRM_system.web.filter;

import com.example.CRM_system.settings.pojo.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//拦截器
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("进入到验证有没有登录过的过滤器");

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String path = request.getServletPath();

        if ("/login.jsp".equals(path) || "/settings/user/login.do".equals(path)){//不应该拦截的资源，自动放行请求
            filterChain.doFilter(servletRequest, servletResponse);
        }else {//其他资源必须验证有没有登录过
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            if (user != null){//user不为空说明登录过
                filterChain.doFilter(servletRequest, servletResponse);
            }else {//没登录过 请求重定向到登录界面
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }
        }
    }

    @Override
    public void destroy() {

    }
}
