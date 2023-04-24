package com.imap.web.controller.api;

import com.imap.common.controller.BaseController;
import com.imap.common.pojo.DataReport;
import com.imap.common.util.DateTimeUtil;
import com.imap.common.util.Json;
import com.imap.common.util.JsonToMap;
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

    @PostMapping("/cur/{siteId}")
    void report(HttpServletRequest request, HttpServletResponse response,@PathVariable("siteId") int siteId) throws IOException {
        PageData pd = new PageData(request);
        String report = (String) pd.get("report");
        DataReport dataReport = JsonToMap.jsonToObj(report, DataReport.class);
        dataService.setSiteData(dataReport);
    }
    @PostMapping("/alarm/{siteId}")
    void alarm(HttpServletRequest request,HttpServletResponse response,@PathVariable("siteId") int siteId) throws IOException {
        PageData pd = new PageData(request);
        pd.put("create_time",DateTimeUtil.getDateTimeStr());
        pd.put("site_id",siteId);
        dataService.addAlarm(pd);
        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("上报成功。");
        this.writeJson(response, json);
    }

    @PostMapping("/photo/{siteId}")
    void photo(HttpServletRequest request,HttpServletResponse response,@PathVariable("siteId") int siteId) throws IOException {
        PageData pd = new PageData(request);
        pd.put("create_time",DateTimeUtil.getDateTimeStr());
        pd.put("site_id",siteId);
        dataService.savePhoto(pd);
        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("上报成功。");
        this.writeJson(response, json);
    }

}
