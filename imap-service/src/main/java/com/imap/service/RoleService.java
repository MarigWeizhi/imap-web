package com.imap.service;


import com.imap.common.pojo.Role;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;

import java.util.List;

public interface RoleService {

    public int getRoleId(int userId);

    Role getRoleById(int roleId);


    List<PageData> findList(PageData pd);

    List<PageData> findListPage(Page page);

    int findListSize(Page page);

    PageData findInfo(PageData pd);

    void save(PageData pd);

    int update(PageData pd);

    void delete(PageData pd);
}
