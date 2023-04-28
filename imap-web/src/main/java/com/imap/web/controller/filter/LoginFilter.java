package com.imap.web.controller.filter;

import com.imap.common.pojo.MenuTypeEnum;
import com.imap.common.pojo.Role;
import com.imap.common.pojo.User;
import com.imap.common.util.Verify;
import com.imap.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 登录验证过滤器
 * */

@WebFilter("/*")
@Component
@Slf4j
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void destroy() {
    }

    @Autowired
    RoleService roleService;
    String[] ALLOW_URLS = {"login","logout","static","css","js","register","api","img","report"};

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String url = httpServletRequest.getRequestURL().toString();
        log.info(url);
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

        // 非管理员且没有权限
        if(!"admin".equals(user.getUserName()) && !authority(url,role)){
            log.info("无权访问");
            httpServletRequest.setAttribute("info", "您没有权限访问此页面，请联系管理员");
            httpServletRequest.setAttribute("info2", url);
            httpServletRequest.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        // 放行
        chain.doFilter(request, response);
    }

    private boolean authority(String url, Role role) {
        String config = roleService.getRoleConfig(role.getRoleId());
        if(url==null){
            return true;
        }
        if(config == null) {
            return false;
        }
        if(url.contains(MenuTypeEnum.ONLINE.getCode()) && !config.contains(MenuTypeEnum.ONLINE.getCode())){
            return false;
        }
        if(url.contains(MenuTypeEnum.HISTORY.getCode()) && !config.contains(MenuTypeEnum.HISTORY.getCode())){
            return false;
        }
        if(url.contains(MenuTypeEnum.USER.getCode()) && !config.contains(MenuTypeEnum.USER.getCode())){
            return false;
        }
        if(url.contains(MenuTypeEnum.ROLE.getCode()) && !config.contains(MenuTypeEnum.ROLE.getCode())){
            return false;
        }
        if(url.contains(MenuTypeEnum.SITE.getCode()) && !config.contains(MenuTypeEnum.SITE.getCode())){
            return false;
        }
        if(url.contains(MenuTypeEnum.ALARM.getCode()) && !config.contains(MenuTypeEnum.ALARM.getCode())){
            return false;
        }
        return true;
    }


}
