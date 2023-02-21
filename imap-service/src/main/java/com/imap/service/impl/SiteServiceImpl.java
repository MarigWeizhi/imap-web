package com.imap.service.impl;

import com.imap.common.pojo.Site;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import com.imap.dao.SiteMapper;
import com.imap.dao.UserMapper;
import com.imap.service.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
        return siteMapper.getAllList(pd);
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
    }

    @Override
    public int update(PageData pd) {
        try{
            siteMapper.update(pd);
            return 1;
        }catch (Exception e){
            return 0;
        }
    }

    @Override
    public void delete(PageData pd) {
        siteMapper.delete(pd);
    }

    @Override
    public Site getSiteById(int siteId) {
        return siteMapper.getSiteById(siteId);
    }
}
