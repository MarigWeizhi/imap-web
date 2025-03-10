package com.imap.service.impl;

import com.imap.common.pojo.MenuTypeEnum;
import com.imap.common.pojo.Role;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import com.imap.dao.RoleMapper;
import com.imap.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.StringJoiner;

/**
 * @Author: Weizhi
 * @Date: create in 2022/9/27 19:30
 * @Description:
 */
@Service
public class RoleServiceImpl extends RoleService {

    @Autowired
    RoleMapper roleMapper;

    @Override
    public int getRoleId(int userId) {
        return roleMapper.getRoleIdByUserId(userId);
    }
    @Override
    public Role getRoleById(int roleId) {
        return roleMapper.getRoleById(roleId);
    }

    @Override
    public List<PageData> getAllList(PageData pd) {
        List<PageData> listPage = roleMapper.getAllList(pd);
        listPage.stream().forEach(p -> p.put("create_time", p.get("create_time").toString()));
        listPage.stream().forEach(p -> p.put("update_time", p.get("update_time").toString()));
        return listPage;
    }

    @Override
    public List<PageData> findListPage(Page page) {
        List<PageData> listPage = roleMapper.findListPage(page);
        listPage.stream().forEach(pd -> pd.put("create_time", pd.get("create_time").toString()));
        listPage.stream().forEach(pd -> pd.put("update_time", pd.get("update_time").toString()));
        return listPage;
    }

    @Override
    public int getListSize(Page page) {
        int size = roleMapper.getAllList(page.getPd()).size();
        return size;
    }

    @Override
    public PageData findInfo(PageData pd) {
        return new PageData();
    }

    @Override
    public String getRoleConfig(Integer roleId) {
        Role role = getRoleById(roleId);
        return role.getRoleConfig();
    }

    @Override
    public void save(PageData pd) {
        StringJoiner sj = new StringJoiner(";");
        if(pd.get(MenuTypeEnum.ONLINE.getCode())!=null){sj.add(MenuTypeEnum.ONLINE.getCode());}
        if(pd.get(MenuTypeEnum.HISTORY.getCode())!=null){sj.add(MenuTypeEnum.HISTORY.getCode() );}
        if(pd.get(MenuTypeEnum.USER.getCode())!=null){sj.add(MenuTypeEnum.USER.getCode() );}
        if(pd.get(MenuTypeEnum.ROLE.getCode())!=null){sj.add(MenuTypeEnum.ROLE.getCode() );}
        if(pd.get(MenuTypeEnum.SITE.getCode())!=null){sj.add(MenuTypeEnum.SITE.getCode() );}
        if(pd.get(MenuTypeEnum.ALARM.getCode())!=null){sj.add(MenuTypeEnum.ALARM.getCode() );}
        pd.put("role_config",sj.toString());
        roleMapper.save(pd);
    }

    @Override
    public int update(PageData pd) {
        StringJoiner sj = new StringJoiner(";");
        if(pd.get(MenuTypeEnum.ONLINE.getCode())!=null){sj.add(MenuTypeEnum.ONLINE.getCode());}
        if(pd.get(MenuTypeEnum.HISTORY.getCode())!=null){sj.add(MenuTypeEnum.HISTORY.getCode());}
        if(pd.get(MenuTypeEnum.USER.getCode())!=null){sj.add(MenuTypeEnum.USER.getCode());}
        if(pd.get(MenuTypeEnum.ROLE.getCode())!=null){sj.add(MenuTypeEnum.ROLE.getCode());}
        if(pd.get(MenuTypeEnum.SITE.getCode())!=null){sj.add(MenuTypeEnum.SITE.getCode());}
        if(pd.get(MenuTypeEnum.ALARM.getCode())!=null){sj.add(MenuTypeEnum.ALARM.getCode());}
        pd.put("role_config",sj.toString());
        roleMapper.update(pd);
        return 200;
    }

    @Override
    public void delete(PageData pd) {
        roleMapper.delete(pd);
    }
}
