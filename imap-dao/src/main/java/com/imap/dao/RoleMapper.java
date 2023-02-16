package com.imap.dao;

import com.imap.common.pojo.Role;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoleMapper {

    int getRoleIdByUserId(int userId);
    Role getRoleById(int roleId);
    List<PageData> findListPage(Page page);

    List<PageData> getAllList(PageData pd);

    int findListSize(Page page);

    void save(PageData pd);

    void update(PageData pd);

    void delete(PageData pd);
}
