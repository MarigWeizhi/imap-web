package com.imap.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Author: Weizhi
 * @Date: create in 2022/9/27 14:18
 * @Description:
 */

@Controller
@RequestMapping("/system/admin")
public class AdminController {

    @RequestMapping("/index")
    ModelAndView index(ModelAndView mv){
        mv.setViewName("forward:/system/admin/desktop.jsp");
        return mv;
    }

}
