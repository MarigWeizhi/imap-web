package com.imap.common.controller;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import com.imap.common.util.Verify;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

public class BaseController {

//    自己创建完ObjectMapper实例后没有注册JavaTimeModule，会导致LocalDateTime时间转换异常
//    而Spring容器中的ObjectMapper实例是框架已经配置好了的所以不会出现这个问题
    @Autowired
    public ObjectMapper objMapper;

    public Page dealDataAuth(Page page, PageData pd, HttpSession session){
        PageData user = (PageData) session.getAttribute("user");
        PageData organize = (PageData) session.getAttribute("role");
        //用户所在组织
        pd.put("auth_user",user.get("id"));
        pd.put("auth_role",user.get("organize_id"));
        //用户数据权限组织
        if(Verify.verifyIsNotNull(organize.get("authOrgIds"))){
            pd.put("auth_organize_ids",Arrays.asList(organize.get("authOrgIds").toString().split(",")));
        }else{
            pd.put("auth_organize_ids",new ArrayList<String>());
        }
        page.setPd(pd);
        return page;
    }


    /**
     * @Description: dealDataAuth
     * @Param: [pd, session]
     * @return: com.qingfeng.base.util.PageData
     * @Author: qingfeng
     * @Date: 2019-11-28 13:58
     */
    public PageData dealDataAuth(PageData pd, HttpSession session){
        PageData user = (PageData) session.getAttribute("user");
        PageData organize = (PageData) session.getAttribute("loginOrganize");
        //用户所在组织
        pd.put("auth_user",user.get("id"));
        pd.put("auth_organize",user.get("organize_id"));
        //用户数据权限组织
        if(Verify.verifyIsNotNull(organize.get("authOrgIds"))){
            pd.put("auth_organize_ids",Arrays.asList(organize.get("authOrgIds").toString().split(",")));
        }else{
            pd.put("auth_organize_ids",new ArrayList<String>());
        }
        return pd;
    }

    /**
     * @Description: writeJson
     * @Param: [response, object]
     * @return: void
     * @Author: qingfeng
     * @Date: 2018-8-24 13:09
     */
    public void writeJson(HttpServletResponse response, Object object) throws IOException {
//        ObjectMapper objMapper = new ObjectMapper();
        response.setContentType("text/html;charset=utf-8");
        JsonGenerator jsonGenerator = objMapper.getFactory().createGenerator(response.getOutputStream(),JsonEncoding.UTF8);
        jsonGenerator.writeObject(object);
        jsonGenerator.flush();
        jsonGenerator.close();
    }

}
