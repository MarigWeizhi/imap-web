package com.imap.web.controller;

import com.imap.common.controller.BaseController;
import com.imap.common.pojo.Role;
import com.imap.common.pojo.User;
import com.imap.common.vo.AlarmTableVO;
import com.imap.common.util.*;
import com.imap.service.AlarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import static com.imap.common.util.JsonToMap.bean2Map;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/6 22:39
 * @Description:
 */

@Controller
@RequestMapping("/system/alarm")
public class AlarmController extends BaseController {

    @Autowired
    AlarmService alarmService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    ModelAndView index(HttpServletRequest request, ModelAndView mv){
        PageData pd = new PageData(request);
        mv.getModel().put("pd", pd);
        mv.setViewName("forward:/system/alarm/alarm_list.jsp");
        return mv;
    }

    @RequestMapping(value = "/status", method = RequestMethod.GET)
    public void update(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        List<Integer> ids = Arrays.stream(pd.get("alarm_ids").toString().split(","))
                .map(item -> Integer.parseInt(item)).collect(Collectors.toList());
        Json json = new Json();
        int num = alarmService.setStatus(ids);
        json.setCode(num);
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response, json);
    }

    @RequestMapping(value = "/findListPage", method = RequestMethod.GET)
    public void findListPage(Page page, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        // 去除无效过滤条件
        Verify.removeNull(pd,"filter_site_name","filter_type","filter_status");
        //处理分页
        if (Verify.verifyIsNotNull(pd.get("page"))) {
            page.setIndex(Integer.parseInt(pd.get("page").toString()));
        } else {
            page.setIndex(1);
        }
        if (Verify.verifyIsNotNull(pd.get("limit"))) {
            page.setShowCount(Integer.parseInt(pd.get("limit").toString()));
        } else {
            page.setShowCount(10);
        }
        User user = (User) session.getAttribute("user");
        Role role = (Role) session.getAttribute("role");
        pd.putAll(bean2Map(user));
        pd.putAll(bean2Map(role));
        page.setPd(pd);
        List<PageData> list = alarmService.findListPage(page);
        int num = alarmService.getListSize(page);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setCode(0);
        json.setCount(num);
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response, json);
    }

    @RequestMapping(value = "/info/{alarmId}", method = RequestMethod.GET)
    public ModelAndView info(@PathVariable("alarmId")int alarmId, ModelAndView mv, HttpServletRequest request) {
        AlarmTableVO info = alarmService.getInfo(alarmId);
        mv.getModelMap().put("p", info);
        mv.setViewName("forward:/system/alarm/alarm_info.jsp");
        return mv;
    }

}
