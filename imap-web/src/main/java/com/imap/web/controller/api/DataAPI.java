package com.imap.web.controller.api;

import com.alibaba.fastjson.JSON;
import com.imap.common.pojo.vo.AlarmVO;
import com.imap.common.pojo.vo.HistoryHTVO;
import com.imap.common.pojo.vo.PhotoVO;
import com.imap.service.impl.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

/**
 * @Author: Weizhi
 * @Date: create in 2022/5/27 21:01
 * @Description:
 */

@Controller
@RequestMapping("/api")
public class DataAPI {

    @Autowired
    DataService dataService;

//    /api/hmt/1
// 没有 @ResponseBody 注解，spring会以为你返回的字符串是个url
    @ResponseBody
    @GetMapping("/hmt/{siteId}")
    String getHmt(@PathVariable("siteId") int siteId){
//        id = 1
//        double curHmt = dataService.getCurHmt(siteId);
        HashMap<String, Object> map = new HashMap<>();
        map.put("name","hmt");
        map.put("value","curHmt");
        return String.format("[%s]",JSON.toJSONString(map));
    }

//    @ResponseBody
//    @GetMapping(value = "/animals-number",produces = {"application/json;charset=utf-8"})
    // 解决中文乱码
//    String getNumber(){
//        List<AnimalsNumber> date = dataService.getNumber();
//        return JSON.toJSONString(date);
//    }


    @ResponseBody
    @GetMapping(value = "/alarm-list/{siteId}",produces = {"application/json;charset=utf-8"})
    String getAlarmList(@PathVariable("siteId")int siteId ){
        List<AlarmVO> alarmList = dataService.getAlarmList(siteId);
        return JSON.toJSONString(alarmList);
    }

    @ResponseBody
    @GetMapping("/photo/{siteId}")
    String getPhoto(@PathVariable("siteId")int siteId){
        List<PhotoVO> photos = dataService.getPhotos(siteId);
        return JSON.toJSONString(photos);
    }

    @ResponseBody
    @GetMapping("/camera/{siteId}")
    String getCamera(@PathVariable("siteId")int siteId){
        return dataService.getCameraUrl(siteId);
    }

}
