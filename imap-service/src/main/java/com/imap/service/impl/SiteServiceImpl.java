package com.imap.service.impl;

import com.alibaba.fastjson.TypeReference;
import com.imap.common.po.MonitorConfigPO;
import com.imap.common.pojo.MonitorConfig;
import com.imap.common.pojo.MonitorItem;
import com.imap.common.pojo.Site;
import com.imap.common.util.JsonToMap;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import com.imap.dao.SiteMapper;
import com.imap.dao.UserMapper;
import com.imap.service.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

    @Autowired
    KafkaService kafkaService;

    @Override
    public List<PageData> getAllList(PageData pd) {
        List<PageData> allList = siteMapper.getAllList(pd);
        // 为每个站点查询对应管理员名字
        allList.forEach(site -> {
            Integer userId = (Integer) site.get("create_user");
            String userName = userMapper.getUserById(userId).getUserName();
            site.put("administrator", userName);
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
        // save执行后自动注入siteId在pd内，供addConfig使用
        siteMapper.save(pd);
        ConcurrentHashMap<String, MonitorItem> monitorItems = getMonitorItems(pd);
        pd.put("monitorItems", JsonToMap.map2json(monitorItems));
        siteMapper.addConfig(pd);

        Integer siteId = (Integer) pd.get("siteId");
        long time = Timestamp.valueOf(pd.get("create_time").toString()).getTime();
        int version = 1;
        int interval = Integer.valueOf(pd.get("interval").toString());
        int isDelete = 0;
        MonitorConfig monitorConfig = new MonitorConfig(siteId, time, version, interval, isDelete, monitorItems);

        // 将配置信息发送给kafka
        kafkaService.updateMonitorConfig(monitorConfig.toJson());
    }

    @Override
    public int update(PageData pd) {
        try {
            Integer siteId = Integer.valueOf(pd.get("site_id").toString());
            PageData versionPd = siteMapper.getSiteConfigById(siteId);
            int version = (Integer) versionPd.get("version") + 1;
            long time = Timestamp.valueOf(pd.get("update_time").toString()).getTime();
            int interval = Integer.valueOf(pd.get("interval").toString());
            int isDelete = 0;
            ConcurrentHashMap<String, MonitorItem> monitorItems = getMonitorItems(pd);
            MonitorConfig monitorConfig = new MonitorConfig(siteId, time, version, interval, isDelete, monitorItems);

            pd.put("monitorItems", JsonToMap.map2json(monitorItems));
            pd.put("version", version);
            pd.put("interval", interval);
            // 更新站点信息和更新配置信息
            siteMapper.update(pd);
//            siteMapper.updateConfig(pd);
            setMonitorConfig(monitorConfig);
            // 将配置信息发送给kafka
            kafkaService.updateMonitorConfig(monitorConfig.toJson());
            return 200;
        } catch (Exception e) {
            System.out.println(e);
            return 400;
        }
    }

    @Override
    @Cacheable(value = "config" ,key = "#siteId")
    public MonitorConfig getMonitorConfig(Integer siteId) {
        return siteMapper.getMonitorConfig(siteId).to();
    }

    @Override
    @CachePut(value = "config" ,key = "#result.siteId")
    public MonitorConfig setMonitorConfig(MonitorConfig monitorConfig) {
        siteMapper.setMonitorConfig(MonitorConfigPO.from(monitorConfig));
        return monitorConfig;
    }

    @Override
    public void delete(PageData pd) {
        List<Integer> ids = (List<Integer>) pd.get("site_ids");
        for (Integer id : ids) {
            PageData config = siteMapper.getSiteConfigById(id);
            MonitorConfig monitorConfig = new MonitorConfig(id,
                    System.currentTimeMillis(),
                    (Integer)config.get("version"),
                    (Integer)config.get("interval"),
                    1,
                    JsonToMap.jsonToObj(config.get("monitor_items").toString(),new TypeReference<Map<String, MonitorItem>>(){}));
            kafkaService.updateMonitorConfig(monitorConfig.toJson());
        }
        siteMapper.delete(pd);
        siteMapper.deleteConfig(pd);
    }

    @Override
    public Site getSiteById(Integer siteId) {
        return siteMapper.getSiteById(siteId);
    }

    @Override
    public PageData getSiteConfigById(Integer siteId) {
        Site site = siteMapper.getSiteById(siteId);
        PageData siteConfig = siteMapper.getSiteConfigById(siteId);
        HashMap<String, MonitorItem> monitorItems = JsonToMap.jsonToObj(
                siteConfig.get("monitor_items").toString(),
                new TypeReference<HashMap<String, MonitorItem>>() {});

        MonitorItem tmp = monitorItems.get("tmp");
        MonitorItem hmt = monitorItems.get("hmt");
        MonitorItem lx = monitorItems.get("lx");

        siteConfig.put("tmpMin", tmp.getMin());
        siteConfig.put("tmpMax", tmp.getMax());
        siteConfig.put("tmpOpen", tmp.getOpen());

        siteConfig.put("hmtMin", hmt.getMin());
        siteConfig.put("hmtMax", hmt.getMax());
        siteConfig.put("hmtOpen", hmt.getOpen());

        siteConfig.put("lxMin", lx.getMin());
        siteConfig.put("lxMax", lx.getMax());
        siteConfig.put("lxOpen", lx.getOpen());

        siteConfig.putAll(JsonToMap.bean2Map(site));
        return siteConfig;
    }

    private static ConcurrentHashMap<String, MonitorItem> getMonitorItems(PageData pd) {
        MonitorItem tmp = new MonitorItem("tmp",
                Integer.valueOf(pd.get("tmp_open").toString()),
                Double.valueOf(pd.get("tmp_max").toString()),
                Double.valueOf(pd.get("tmp_min").toString()));
        MonitorItem hmt = new MonitorItem("hmt",
                Integer.valueOf(pd.get("hmt_open").toString()),
                Double.valueOf(pd.get("hmt_max").toString()),
                Double.valueOf(pd.get("hmt_min").toString()));
        MonitorItem lx = new MonitorItem("lx",
                Integer.valueOf(pd.get("lx_open").toString()),
                Double.valueOf(pd.get("lx_max").toString()),
                Double.valueOf(pd.get("lx_min").toString()));
        ConcurrentHashMap<String, MonitorItem> map = new ConcurrentHashMap<>();
        map.put("tmp", tmp);
        map.put("hmt", hmt);
        map.put("lx", lx);
        return map;
    }
}
