package com.imap.web.controller;

import com.imap.common.controller.BaseController;
import com.imap.common.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author: Weizhi
 * @Date: create in 2022/11/16 9:46
 * @Description:
 */

@Controller
@RequestMapping("/system/site")
public class SiteController extends BaseController {

    @RequestMapping(value = "index", method = RequestMethod.GET)
    ModelAndView index(HttpServletRequest request,ModelAndView mv){
        PageData pd = new PageData(request);
        mv.getModel().put("pd", pd);
        mv.setViewName("forward:/system/site/index.jsp");
        return mv;
    }

}
