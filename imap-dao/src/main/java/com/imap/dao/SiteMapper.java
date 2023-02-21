package com.imap.dao;

import com.imap.common.pojo.Site;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SiteMapper {

    void save(PageData pd);

    void delete(PageData pd);

    void update(PageData pd);

    List<PageData> findListPage(Page page);

    int getListSize(Page page);

    List<PageData> getAllList(PageData pd);

    Site getSiteById(int siteId);
}
