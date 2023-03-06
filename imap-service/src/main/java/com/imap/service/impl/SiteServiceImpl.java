package com.imap.service.impl;

import com.alibaba.fastjson.TypeReference;
import com.imap.common.pojo.MonitorItem;
import com.imap.common.pojo.Site;
import com.imap.common.util.JsonToMap;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import com.imap.dao.SiteMapper;
import com.imap.dao.UserMapper;
import com.imap.service.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Author: Weizhi
 * @Date: create in 2023/2/22 0:28
 * @Description:
 */

@Service
public class SiteServiceImpl extends SiteService {

    @Autowired
    SiteMapper siteMapper;

    @Autowired
    UserMapper userMapper;

    @Override
    public List<PageData> getAllList(PageData pd) {

        List<PageData> allList = siteMapper.getAllList(pd);

        // 为每个站点查询对应管理员名字
        allList.forEach(site -> {
            Integer userId = (Integer) site.get("create_user");
            String userName = userMapper.getUserById(userId).getUserName();
            site.put("administrator",userName);
        });

        return allList;
    }

    @Override
    public List<PageData> findListPage(Page page) {
        return siteMapper.findListPage(page);
    }

    @Override
    public int getListSize(Page page) {
        return siteMapper.getListSize(page);
    }


    @Override
    public void save(PageData pd) {
        siteMapper.save(pd);
        int siteId = (int)pd.get("id");
        MonitorItem tmp = new MonitorItem("tmp",
                Integer.valueOf(pd.get("tmp_open").toString()) ,
                Double.valueOf(pd.get("tmp_max").toString()),
                Double.valueOf(pd.get("tmp_min").toString()));
        MonitorItem hmt = new MonitorItem("hmt",
                Integer.valueOf(pd.get("hmt_open").toString()) ,
                Double.valueOf(pd.get("hmt_max").toString()),
                Double.valueOf(pd.get("hmt_min").toString()));
        MonitorItem lx = new MonitorItem("lx",
                Integer.valueOf(pd.get("lx_open").toString()) ,
                Double.valueOf(pd.get("lx_max").toString()),
                Double.valueOf(pd.get("lx_min").toString()));
        ConcurrentHashMap<String, MonitorItem> map = new ConcurrentHashMap<>();
        map.put("tmp",tmp);
        map.put("hmt",hmt);
        map.put("lx",lx);
        pd.put("monitorItems",JsonToMap.map2json(map));
        pd.put("siteId",siteId);
        siteMapper.addConfig(pd);
    }

    @Override
    public int update(PageData pd) {
        try{
            siteMapper.update(pd);
            return 200;
        }catch (Exception e){
            return 400;
        }
    }

    @Override
    public void delete(PageData pd) {
        siteMapper.delete(pd);
        siteMapper.deleteConfig(pd);
    }

    @Override
    public Site getSiteById(int siteId) {
        return siteMapper.getSiteById(siteId);
    }

    @Override
    public PageData getSiteConfigById(int siteId) {
        Site site = siteMapper.getSiteById(siteId);
        PageData siteConfig = siteMapper.getSiteConfigById(siteId);
        HashMap<String, MonitorItem> monitorItems = JsonToMap.jsonToObj(
                siteConfig.get("monitor_items").toString(),
                new TypeReference<HashMap<String, MonitorItem>>() {});
        MonitorItem tmp = monitorItems.get("tmp");
        MonitorItem hmt = monitorItems.get("hmt");
        MonitorItem lx = monitorItems.get("lx");

        siteConfig.put("tmpMin",tmp.getMin());
        siteConfig.put("tmpMax",tmp.getMax());
        siteConfig.put("tmpOpen",tmp.getOpen());

        siteConfig.put("hmtMin",hmt.getMin());
        siteConfig.put("hmtMax",hmt.getMax());
        siteConfig.put("hmtOpen",hmt.getOpen());

        siteConfig.put("lxMin",lx.getMin());
        siteConfig.put("lxMax",lx.getMax());
        siteConfig.put("lxOpen",lx.getOpen());

        siteConfig.putAll(JsonToMap.bean2Map(site));
        return siteConfig;
    }
}
