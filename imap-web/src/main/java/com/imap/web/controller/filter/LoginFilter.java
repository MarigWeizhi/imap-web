package com.imap.web.controller.filter;

import com.imap.common.pojo.Role;
import com.imap.common.pojo.User;
import com.imap.common.util.Verify;

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
    String[] ALLOW_URLS = {"login","logout","static","css","js","register","api","img","report"};

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String url = httpServletRequest.getRequestURL().toString();
        System.out.println(url);
        // 符合条件的url，免登入访问
        for (String u : ALLOW_URLS) {
            if(url.contains(u)){
                // System.out.println("提前放行" + u);
                chain.doFilter(request, response);
                return;
            }
        }
        User user = (User) httpServletRequest.getSession().getAttribute("user");
        Role role = (Role) httpServletRequest.getSession().getAttribute("role");
        if(user == null || role == null) {
            httpServletRequest.setAttribute("loginMsg", "您尚未登录");
            httpServletRequest.getRequestDispatcher("/system/login.jsp").forward(request, response);
            return;
        }
        // 非管理员或者没有权限
        if(!"admin".equals(user.getUserName()) && !Verify.authority(url,role)){
            httpServletRequest.setAttribute("info", "您没有权限访问此页面，请联系管理员");
            httpServletRequest.setAttribute("info2", url);
            httpServletRequest.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        // 放行
        chain.doFilter(request, response);
    }
}
