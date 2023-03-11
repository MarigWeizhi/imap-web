package com.imap.dao;

import com.imap.common.po.MonitorConfigPO;
import com.imap.common.pojo.Site;
import com.imap.common.pojo.DataReport;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SiteMapper {

    int save(PageData pd);

    void delete(PageData pd);

    void update(PageData pd);

    List<PageData> findListPage(Page page);

    int getListSize(Page page);

    List<PageData> getAllList(PageData pd);

    Site getSiteById(int siteId);

    DataReport getCurSiteData(int siteId);

    PageData getSiteConfigById(int siteId);

    void addConfig(PageData pd);

    void deleteConfig(PageData pd);

    void updateConfig(PageData pd);

    void setCurSiteData(DataReport dataReport);

    MonitorConfigPO getMonitorConfig(Integer siteId);
    void setMonitorConfig(MonitorConfigPO monitorConfig);

}
