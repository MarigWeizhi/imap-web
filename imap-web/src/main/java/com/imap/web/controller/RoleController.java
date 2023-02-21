package com.imap.web.controller;

import com.imap.common.controller.BaseController;
import com.imap.common.pojo.Role;
import com.imap.common.pojo.User;
import com.imap.common.util.*;
import com.imap.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
 * @Date: create in 2022/11/16 8:23
 * @Description:
 */

@Controller
@RequestMapping("/system/role")
public class RoleController extends BaseController {

    @Autowired
    RoleService roleService;

    @RequestMapping(value = "index", method = RequestMethod.GET)
    ModelAndView index(ModelAndView mv, HttpServletRequest request) {
        PageData pd = new PageData(request);
        mv.getModel().put("pd", pd);
        mv.setViewName("forward:/system/role/role_list.jsp");
        return mv;
    }

    @RequestMapping(value = "/findListPage", method = RequestMethod.GET)
    public void findListPage(Page page, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
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
        List<PageData> list = roleService.findListPage(page);
        int num = roleService.getListSize(page);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setCode(0);
        json.setCount(num);
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response, json);
    }

    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public void findList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        List<PageData> list = roleService.getAllList(pd);
        for (String key : pd.getKeys(pd)) {
            System.out.println(key + pd.get(key));
        }
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response, json);
    }

    @RequestMapping(value = "/findInfo", method = RequestMethod.GET)
    public ModelAndView findInfo(ModelAndView mv, HttpServletRequest request) {
        PageData pd = new PageData(request);
        PageData p = roleService.findInfo(pd);
        mv.getModelMap().addAttribute("p", p);
        mv.setViewName("forward:/system/role/role_info.jsp");
        return mv;
    }

    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public ModelAndView toAdd(ModelAndView mv, HttpServletRequest request) {
        PageData pd = new PageData(request);
        mv.getModelMap().put("pd", pd);
        mv.setViewName("forward:/system/role/role_add.jsp");
        return mv;
    }

    @RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
    public ModelAndView toUpdate(ModelAndView mv, HttpServletRequest request) {
        PageData pd = new PageData(request);
        Role role = roleService.getRoleById(Integer.parseInt((String) pd.get("role_id")));
        PageData p = new PageData();
        p.putAll(bean2Map(role));
        mv.getModelMap().put("p", p);
        mv.setViewName("forward:/system/role/role_update.jsp");
        return mv;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        String role_level = pd.get("role_level").toString();
        Role role = (Role) session.getAttribute("role");
        Json json = new Json();
        if(role_level!= null && role != null && Integer.parseInt(role_level) <= role.getRoleLevel()){
            json.setSuccess(false);
            json.setMsg("您只能创建等级:"+role.getRoleLevel()+" 以上的角色。");
            this.writeJson(response, json);
            return;
        }
        int num = roleService.update(pd);
        json.setCode(num);
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response, json);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletRequest request, MultipartFile file, HttpServletResponse response, HttpSession session) throws Exception {
        PageData pd = new PageData(request);
        Json json = new Json();
        String time = DateTimeUtil.getDateTimeStr();
        pd.put("role_name", pd.get("role_name").toString());
        String role_level = pd.get("role_level").toString();
        pd.put("role_level", role_level);
        pd.put("create_time", time);
        pd.put("update_time", time);
        User user = (User) session.getAttribute("user");
        Role role = (Role) session.getAttribute("role");
        pd.put("create_user", user.getCreateUser());

        if(role_level!= null && role != null && Integer.parseInt(role_level) <= role.getRoleLevel()){
            json.setSuccess(false);
            json.setMsg("您只能创建等级:"+role.getRoleLevel()+" 以上的角色。");
            this.writeJson(response, json);
            return;
        }

        roleService.save(pd);
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response, json);
    }

    //    @RequiresPermissions("user:del")
    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        List<Integer> ids = Arrays.stream(pd.get("role_ids").toString().split(","))
                .map(item -> Integer.parseInt(item)).collect(Collectors.toList());
        pd.put("role_ids", ids);
        roleService.delete(pd);
//        pd.put("idList", Arrays.asList(ids));
        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }


}
