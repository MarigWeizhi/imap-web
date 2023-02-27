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
//      TODO 对应监控配置删除
    }

    @Override
    public Site getSiteById(int siteId) {
        return siteMapper.getSiteById(siteId);
    }
}
