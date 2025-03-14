package com.imap.web.controller;

import com.imap.common.controller.BaseController;
import com.imap.common.pojo.Role;
import com.imap.common.pojo.Site;
import com.imap.common.pojo.User;
import com.imap.common.util.*;
import com.imap.service.SiteService;
import com.imap.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
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
 * @Date: create in 2022/11/16 9:46
 * @Description:
 */

@Controller
@RequestMapping("/system/site")
public class SiteController extends BaseController {

    @Autowired
    SiteService siteService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    ModelAndView index(HttpServletRequest request,ModelAndView mv){
        PageData pd = new PageData(request);
        mv.getModel().put("pd", pd);
        mv.setViewName("forward:/system/site/site_list.jsp");
        return mv;
    }

    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public ModelAndView toAdd(ModelAndView mv, HttpServletRequest request) {
        PageData pd = new PageData(request);
        mv.getModelMap().put("pd", pd);
        mv.setViewName("forward:/system/site/site_add.jsp");
        return mv;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletRequest request, MultipartFile file, HttpServletResponse response, HttpSession session) throws Exception {
        PageData pd = new PageData(request);
        Json json = new Json();
        String time = DateTimeUtil.getDateTimeStr();

        pd.put("tmp_open", pd.get("tmp_open")!=null?1:0);
        pd.put("hmt_open", pd.get("hmt_open")!=null?1:0);
        pd.put("lx_open", pd.get("lx_open")!=null?1:0);

        pd.put("create_time", time);
        pd.put("update_time", time);
        User user = (User) session.getAttribute("user");
        pd.put("create_user", user.getUserId());

        siteService.save(pd);
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response, json);
    }

    @RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
    public ModelAndView toUpdate(ModelAndView mv, HttpServletRequest request) {
        PageData pd = new PageData(request);
        PageData site = siteService.getSiteConfigById(Integer.parseInt((String) pd.get("site_id")));
        mv.getModelMap().put("p", site);
        mv.setViewName("forward:/system/site/site_update.jsp");
        return mv;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        String time = DateTimeUtil.getDateTimeStr();
        pd.put("update_time", time);

        pd.put("tmp_open", pd.get("tmp_open")!=null?1:0);
        pd.put("hmt_open", pd.get("hmt_open")!=null?1:0);
        pd.put("lx_open", pd.get("lx_open")!=null?1:0);

        Json json = new Json();
        int num = siteService.update(pd);
        json.setCode(num);
        if (num==200){
            json.setSuccess(true);
            json.setMsg("操作成功。");
        }else {
            json.setMsg("异常：" + num);
        }
        this.writeJson(response, json);
    }

    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        List<Integer> ids = Arrays.stream(pd.get("site_ids").toString().split(","))
                .map(item -> Integer.parseInt(item)).collect(Collectors.toList());
        pd.put("site_ids", ids);
        siteService.delete(pd);
        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }

    @RequestMapping(value = "/findListPage", method = RequestMethod.GET)
    public void findListPage(Page page, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        // 去除空过滤项
        Verify.removeNull(pd,"filter_create_user","filter_site_name");

        //处理数据权限
//        page = dealDataAuth(page,pd,session);
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
        List<PageData> list = siteService.findListPage(page);
        int num = siteService.getListSize(page);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setCode(0);
        json.setCount(num);
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response, json);
    }

    @RequestMapping(value = "/getAllList", method = RequestMethod.GET)
    public void getAllList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        //处理数据权限
//        page = dealDataAuth(page,pd,session);

        User user = (User) session.getAttribute("user");
        Role role = (Role) session.getAttribute("role");
        pd.putAll(bean2Map(user));
        pd.putAll(bean2Map(role));

        List<PageData> list = siteService.getAllList(pd);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setCode(0);
        json.setCount(list.size());
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response, json);
    }


}
