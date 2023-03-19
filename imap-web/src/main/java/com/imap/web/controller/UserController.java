package com.imap.web.controller;

import com.imap.common.controller.BaseController;
import com.imap.common.pojo.Role;
import com.imap.common.pojo.User;
import com.imap.common.util.*;
import com.imap.service.RoleService;
import com.imap.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
 * @Date: create in 2022/4/5 22:46
 * @Description:
 */

@Controller
@RequestMapping("/system/user")
public class UserController extends BaseController {
    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;

    @RequestMapping("/login")
    ModelAndView login(String userName, String password, HttpServletRequest req, ModelAndView mv) {
        PageData pd = new PageData(req);
        System.out.println("登入：");
        for (String key : pd.getKeys(pd)) {
            System.out.println(key + pd.get(key));
        }

        System.out.println("login:" + userName);
        User user = userService.login(userName, password);
        if (user != null) {
            int roleId = roleService.getRoleId(user.getUserId());
            user.setRoleId(roleId);
            Role role = roleService.getRoleById(roleId);
            // 维持登入状态
            req.getSession().setAttribute("user", user);
            req.getSession().setAttribute("role", role);
            // 重定向
            mv.setViewName("redirect:/system/admin/index.jsp");
            return mv;
        } else {
            mv.addObject("loginMsg", "用户名或密码错误");
            mv.setViewName("forward:/system/login.jsp");
            return mv;
        }
    }

    @RequestMapping("/logout")
    ModelAndView logout(HttpServletRequest req, ModelAndView mv) {
        req.getSession().removeAttribute("user");
        req.getSession().removeAttribute("role");
        mv.addObject("loginMsg", "");
        mv.setViewName("forward:/system/login.jsp");
        return mv;
    }

    //    @RequiresPermissions("userList")
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(ModelAndView mv, ModelMap map, HttpServletRequest request) throws IOException {
        PageData pd = new PageData(request);
        mv.getModelMap().put("pd", pd);
        mv.setViewName("forward:/system/user/user_list.jsp");
        return mv;
//        中文
    }

    //    @RequiresPermissions("userList")
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public void findList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        List<PageData> list = userService.getAllList(pd);
        for (String key : pd.getKeys(pd)) {
            System.out.println(key + pd.get(key));
        }
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response, json);
    }


    @RequestMapping(value = "/findListPage", method = RequestMethod.GET)
    //    @RequiresPermissions("userList")
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
        pd.putAll(bean2Map(session.getAttribute("user")));
        page.setPd(pd);
        List<PageData> list = userService.findListPage(page);
        int num = userService.getListSize(page);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setCode(0);
        json.setCount(num);
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response, json);
    }


    //    @RequiresPermissions("user:add")
    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public ModelAndView toAdd(ModelAndView mv, HttpServletRequest request) {
        PageData pd = new PageData(request);
        mv.getModelMap().put("pd", pd);
        mv.setViewName("forward:/system/user/user_add.jsp");
        return mv;
    }

    //    @RequiresPermissions("user:add")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletRequest request, MultipartFile file, HttpServletResponse response, HttpSession session) throws Exception {
        PageData pd = new PageData(request);
        Json json = new Json();

        //判断登录用户名称是否存在
        pd.put("query_login_name", Arrays.asList(pd.get("login_name").toString().split(",")));
        List<PageData> list = userService.getAllList(pd);
        if (list.size() > 0) {
            json.setSuccess(false);
            json.setMsg("用户【 " + pd.get("login_name").toString() + " 】已经存在！");
            this.writeJson(response, json);
            return;
        }
        // 判断用户id是否存在
        int roleId = Integer.valueOf(pd.get("role").toString());
        Role role = roleService.getRoleById(roleId);
        if(role == null){
            json.setSuccess(false);
            json.setMsg("角色id【 " + roleId + " 】不存在！");
            this.writeJson(response, json);
            return;
        }
        //主键id
        String time = DateTimeUtil.getDateTimeStr();
        pd.put("login_name", pd.get("login_name").toString());
//            pd.put("login_password", PasswordUtil.encrypt(pd.get("login_password").toString(), pd.get("login_name").toString()));
        pd.put("login_password", pd.get("login_password").toString());
        pd.put("name", pd.get("name").toString());
        pd.put("sex", pd.get("sex").toString());
        pd.put("phone", pd.get("phone").toString());
        pd.put("email", pd.get("email").toString());
        pd.put("role", pd.get("role").toString());
        pd.put("create_time", time);
        pd.put("update_time", time);
        User user = (User) session.getAttribute("user");
        pd.put("create_user", user.getUserId());
        userService.save(pd);
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response, json);
    }


    //    @RequiresPermissions("user:edit")
    @RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
    public ModelAndView toUpdate(ModelAndView mv, HttpServletRequest request) {
        ModelMap map = mv.getModelMap();
        PageData pd = new PageData(request);
        PageData p = userService.findUser(pd);
        int userId = Integer.valueOf(pd.get("user_id").toString());
        User user = userService.getUserById(userId);
        int roleId = user.getRoleId();
        p.put("user_id", userId);
        p.put("role_id", roleId);
        map.put("p", p);
        map.put("pd", pd);
        mv.setViewName("forward:/system/user/user_update.jsp");
        return mv;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        Json json = new Json();

        if (null != pd.get("old_login_name") && !pd.get("old_login_name").equals(pd.get("login_name"))) {
            //判断登录用户名称是否存在
            pd.put("query_login_name", Arrays.asList(pd.get("login_name").toString().split(",")));
            List<PageData> list = userService.getAllList(pd);
            if (list.size() > 0) {
                json.setSuccess(false);
                json.setMsg("用户【" + pd.get("login_name").toString() + "】已经存在！");
                this.writeJson(response, json);
                return;
            }
        }

        // 判断用户id是否存在
        int roleId = Integer.valueOf(pd.get("role_id").toString());
        Role role = roleService.getRoleById(roleId);
        if(role == null){
            json.setSuccess(false);
            json.setMsg("角色id【 " + roleId + " 】不存在！");
            this.writeJson(response, json);
            return;
        }

        String time = DateTimeUtil.getDateTimeStr();
        pd.put("update_time", time);
        userService.update(pd);
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response, json);
    }

    //    @RequiresPermissions("user:del")
    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        List<Integer> ids = Arrays.stream(pd.get("user_ids").toString().split(","))
                .map(item -> Integer.parseInt(item)).collect(Collectors.toList());
        pd.put("user_ids", ids);
        pd.put("idList", Arrays.asList(ids));
        //删除用户角色关联
        userService.delUserRole(pd);
        userService.delete(pd);
        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response, json);
    }


}
