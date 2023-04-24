package com.imap.web.controller.api;

import com.alibaba.fastjson.JSON;
import com.imap.common.pojo.MonitorConfig;
import com.imap.common.pojo.Site;
import com.imap.common.vo.*;
import com.imap.service.SiteService;
import com.imap.service.impl.DataService;
import io.github.resilience4j.circuitbreaker.CallNotPermittedException;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @Author: Weizhi
 * @Date: create in 2022/5/27 21:01
 * @Description:
 */
@CrossOrigin
@RestController
@RequestMapping("/api")
@Log4j2
public class DataAPI {

    @Autowired
    DataService dataService;

    @Autowired
    SiteService siteService;

    private static AtomicInteger count = new AtomicInteger(0);

    @CircuitBreaker(name="test",fallbackMethod="testFail")
    @GetMapping("/test")
    public String test() throws TimeoutException {
        int num = count.getAndIncrement();
        if(num%4==1){
            throw new TimeoutException("超时");
        }
        if (num % 4 == 3){
            throw new RuntimeException("特殊异常");
        }
        log.info("正常访问，count的值 = " + num);
        return "success";
    }
    public String testFail(TimeoutException  e){
        log.info("超时" + e.getMessage());
        return e.getMessage();
    }
    public String testFail(RuntimeException  e){
        log.info("特殊异常" + e.getMessage());
        return e.getMessage();
    }
    public String testFail(CallNotPermittedException e){
        log.info("异常3" + e.getCausingCircuitBreakerName() + " : " + e.getMessage());
        return e.getMessage();
    }
    public String testFail(Throwable e){
        log.info("异常4" + e.getMessage());
        return e.getMessage();
    }

    @GetMapping("/cur/{siteId}")
    String getSiteData(@PathVariable("siteId") int siteId){
        SiteDataVO siteData = dataService.getSiteData(siteId);
        return JSON.toJSONString(siteData);
    }

    @GetMapping("/hmt/{siteId}")
    String getYesterdayHmt(@PathVariable("siteId") int siteId){
        List<YesterdayDataVO> hmtList = dataService.getYesterdayData(siteId,"hmt");
        return JSON.toJSONString(hmtList);
    }

    @GetMapping("/tmp/{siteId}")
    String getYesterdayTmp(@PathVariable("siteId") int siteId){
        List<YesterdayDataVO> tmpList = dataService.getYesterdayData(siteId,"tmp");
        return JSON.toJSONString(tmpList);
    }

    @GetMapping("/lx/{siteId}")
    String getYesterdayLx(@PathVariable("siteId") int siteId){
        List<YesterdayDataVO> tmpList = dataService.getYesterdayData(siteId,"lx");
        return JSON.toJSONString(tmpList);
    }

    @GetMapping(value = "/alarm-list/{siteId}",produces = {"application/json;charset=utf-8"})
    String getAlarmList(@PathVariable("siteId")int siteId ){
        List<AlarmVO> alarmList = dataService.getAlarmList(siteId);
        return JSON.toJSONString(alarmList);
    }

    @GetMapping("/photo/{siteId}")
    String getPhoto(@PathVariable("siteId")int siteId){
        List<PhotoVO> photos = dataService.getPhotos(siteId);
        return JSON.toJSONString(photos);
    }

    @GetMapping("/camera/{siteId}")
    String getCamera(@PathVariable("siteId")int siteId){
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("url",dataService.getCameraUrl(siteId));
        return JSON.toJSONString(map);
    }

    @GetMapping("/site/name/{siteId}")
    String getSiteName(@PathVariable("siteId")int siteId){
        Site site = siteService.getSiteById(siteId);
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("data",site.getSiteName());
        return JSON.toJSONString(Arrays.asList(map));
    }

    @GetMapping("/alarm-top5")
    String getAlarmTop5(){
        List<DataItemVO> list = dataService.getAlarmTop(5);
        return JSON.toJSONString(list);
    }

    @GetMapping("/alarm-types")
    String getAlarmTypes(){
        List<AlarmTypeVO> list = dataService.getAlarmTypes();
        return JSON.toJSONString(list);
    }

    @GetMapping("/alarm-month")
    String getAlarmsPerMonth(){
        List<DataItemVO> list = dataService.getAlarmsPerMonth();
        return JSON.toJSONString(list);
    }

    @GetMapping("/alarm-site")
    String getAllAlarmsWithSite(){
        List<DataItemVO> list = dataService.getAllAlarmsWithSite();
        return JSON.toJSONString(list);
    }

    @GetMapping("/alarm-all")
    String getAllAlarms(){
        List<AlarmVO> list = dataService.getAllAlarms();
        return JSON.toJSONString(list);
    }

    @GetMapping("/config/{siteId}")
    String getMonitorConfig(@PathVariable("siteId")int siteId){
        MonitorConfig monitorConfig = siteService.getMonitorConfig(siteId);
        return JSON.toJSONString(monitorConfig);
    }


}
