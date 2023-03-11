package com.imap.web.controller;

import com.alibaba.fastjson.JSON;
import com.imap.common.controller.BaseController;
import com.imap.common.pojo.DataTypeEnum;
import com.imap.common.util.PageData;
import com.imap.common.util.Verify;
import com.imap.common.vo.HistoryItemVO;
import com.imap.service.impl.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
@RequestMapping("/system/history")
public class HistoryController extends BaseController {

    @Autowired
    DataService dataService;


    @GetMapping("/")
    String getHistoryData(HttpServletRequest request){
        PageData pd = new PageData(request);
        if(Verify.verifyIsNull(pd,"siteId","dataType","timeType","time")){
           return "";
        }

        Integer siteId = Integer.valueOf(pd.get("siteId").toString());
        DataTypeEnum dataType= DataTypeEnum.from(Integer.valueOf(pd.get("dataType").toString()));
        Integer timeType = Integer.valueOf(pd.get("timeType").toString());
        String[] times = pd.get("time").toString().split("-");
        String start = times[0].trim();
        String end = times[1].trim();
        HistoryItemVO siteData = dataService.getHistoryData(siteId,dataType,timeType,start,end);
        return JSON.toJSONString(siteData);
    }

    @RequestMapping(value = "index", method = RequestMethod.GET)
    ModelAndView index(HttpServletRequest request, ModelAndView mv){
        PageData pd = new PageData(request);
        mv.getModel().put("pd", pd);
        mv.setViewName("forward:/system/history/history.jsp");
        return mv;
    }
}
