package com.imap.web.controller.api;

import com.imap.common.controller.BaseController;
import com.imap.common.util.DateTimeUtil;
import com.imap.common.util.Json;
import com.imap.common.util.PageData;
import com.imap.service.impl.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: Weizhi
 * @Date: create in 2022/11/17 10:18
 * @Description:
 */

@RestController
@RequestMapping("/report")
public class DataReportAPI extends BaseController {
    @Autowired
    DataService dataService;

    @PostMapping("/curHT/{siteId}")
    void updateHT(HttpServletRequest request, HttpServletResponse response,@PathVariable("siteId") int siteId) throws IOException {
        PageData pd = new PageData(request);
        pd.put("cur", DateTimeUtil.getDateTimeStr());
        pd.put("siteId",siteId);
        double tmp = Double.valueOf(pd.get("tmp").toString());
        double hmt = Double.valueOf(pd.get("hmt").toString());
        if(tmp > 30){
            PageData pd1 = new PageData();
            pd1.put("site_id",siteId);
            pd1.put("type",2);
            pd1.put("info","温度过高：" + tmp + "℃");
            pd1.put("create_time",DateTimeUtil.getDateTimeStr());
            dataService.addAlarm(pd1);
        }

        if(hmt > 0.7){
            PageData pd2 = new PageData();
            pd2.put("site_id",siteId);
            pd2.put("type",2);
            pd2.put("info","湿度过高：" + (hmt*100) + "%");
            pd2.put("create_time",DateTimeUtil.getDateTimeStr());
            dataService.addAlarm(pd2);
        }

    }

    @PostMapping("/alarm/{siteId}")
    void addAlarm(HttpServletRequest request,HttpServletResponse response,@PathVariable("siteId") int siteId) throws IOException {
        PageData pd = new PageData(request);
        pd.put("create_time",DateTimeUtil.getDateTimeStr());
        pd.put("site_id",siteId);
        dataService.addAlarm(pd);
        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("上报成功。");
        this.writeJson(response, json);
    }

}
