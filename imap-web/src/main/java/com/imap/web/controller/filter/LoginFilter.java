package com.imap.web.controller.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 登录验证过滤器
 * */

@WebFilter("/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void destroy() {
    }
    String[] urls = {"login","static","css","js","register","api","img","report"};

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String url = httpServletRequest.getRequestURL().toString();
        System.out.println(url);
        // 符合条件的url，免登入访问
        for (String u : urls) {
            if(url.contains(u)){
//                System.out.println("提前放行" + u);
                chain.doFilter(request, response);
                return;
            }
        }

        Object user = httpServletRequest.getSession().getAttribute("user");

        if(user != null) {
            // 放行
            chain.doFilter(request, response);
        }else{
            httpServletRequest.setAttribute("loginMsg","您尚未登录");
            httpServletRequest.getRequestDispatcher("/system/login.jsp").forward(request,response);
        }
    }
}
