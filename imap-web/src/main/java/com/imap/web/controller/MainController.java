package com.imap.web.controller;

import io.github.resilience4j.circuitbreaker.CallNotPermittedException;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

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
        mv.setViewName("forward:/system/admin/index.jsp");
        return mv;
    }

    @RequestMapping("/online")
    ModelAndView map(ModelAndView mv){
        mv.setViewName("forward:/map.jsp");
        return mv;
    }

    @RequestMapping(value = "/online/{siteId}", method = RequestMethod.GET)
    ModelAndView showSiteBI(@PathVariable("siteId")Integer siteId, ModelAndView mv){
        mv.addObject("siteId", siteId);
        mv.setViewName("forward:/siteBI.jsp");
        return mv;
    }

    @RequestMapping("/*")
    ModelAndView to404(ModelAndView mv, HttpServletRequest request){
        String url = request.getRequestURL().toString();
        mv.getModel().put("url",url);
        mv.setViewName("forward:/404.jsp");
        return mv;
    }

}
