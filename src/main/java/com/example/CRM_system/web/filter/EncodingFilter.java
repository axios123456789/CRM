package com.example.CRM_system.web.filter;

import javax.servlet.*;
import java.io.IOException;

//过滤器 处理编码乱码的问题
public class EncodingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("进入到过滤字符编码的过滤器");

        //过滤post请求中文参数乱码
        servletRequest.setCharacterEncoding("UTF-8");
        //过滤响应流响应中文乱码
        servletResponse.setContentType("text/html;charset=utf-8");

        //将请求放行
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
