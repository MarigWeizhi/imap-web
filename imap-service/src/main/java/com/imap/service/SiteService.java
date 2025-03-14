package com.imap.service;


import com.imap.common.po.MonitorConfigPO;
import com.imap.common.pojo.MonitorConfig;
import com.imap.common.pojo.Site;
import com.imap.common.pojo.User;
import com.imap.common.util.PageData;
import org.springframework.cache.annotation.CachePut;

import java.util.List;

public abstract class SiteService implements BaseService {

    public abstract MonitorConfig setMonitorConfig(MonitorConfig monitorConfig);

    public abstract Site getSiteById(Integer siteId);

    /**
     * 网页用的
     * */
    public abstract PageData getSiteConfigById(Integer siteId);

    /**
     * 发给kafka用的
     * */

    public abstract MonitorConfig getMonitorConfig(Integer siteId);
    public abstract List<MonitorConfig> getAllMonitorConfig();
}
