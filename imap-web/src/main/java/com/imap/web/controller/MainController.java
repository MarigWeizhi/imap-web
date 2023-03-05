package com.imap.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/3 23:02
 * @Description:
 */

@Controller
@RequestMapping("/")
public class MainController {
    @RequestMapping("/")
    ModelAndView index1(ModelAndView mv){
        mv.setViewName("forward:/map.jsp");
        return mv;
    }
    @RequestMapping("/index")
    ModelAndView index(ModelAndView mv){
        mv.setViewName("forward:/map.jsp");
        return mv;
    }

    @RequestMapping("/map")
    ModelAndView map(ModelAndView mv){
        mv.setViewName("forward:/map.jsp");
        return mv;
    }

    @RequestMapping(value = "/site/{siteId}", method = RequestMethod.GET)
    ModelAndView showSiteBI(@PathVariable("siteId")Integer siteId, ModelAndView mv){
        mv.addObject("siteId", siteId);
        mv.setViewName("forward:/siteBI.jsp");
        return mv;
    }

    @RequestMapping("/*")
    ModelAndView to404(ModelAndView mv){
        mv.setViewName("forward:/404.jsp");
        return mv;
    }

}
