package com.imap.web.controller.filter;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/3 23:11
 * @Description:
 */
//@ControllerAdvice
//public class GlobalExceptionHandler {
//
//    @ExceptionHandler(NoHandlerFoundException.class)
//    public ModelAndView handle404Exception(HttpServletRequest request, Exception e) {
//        // TODO 未生效
//
//        ModelAndView mav = new ModelAndView();
//        mav.addObject("exception", e);
//        mav.addObject("url", request.getRequestURL());
//        mav.setViewName("forward:/404.jsp");
//        return mav;
//    }
//}
