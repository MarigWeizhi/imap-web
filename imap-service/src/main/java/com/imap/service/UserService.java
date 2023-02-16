package com.imap.service;


import com.imap.common.pojo.User;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;

import java.util.List;


/**
 * @Author: Weizhi
 * @Date: create in 2022/4/5 20:47
 * @Description:
 */

public interface UserService {

    User login(String userName, String password);

    User getUserById(int uid);

    List<PageData> findList(PageData pd);

    List<PageData> findListPage(Page page);

    int findListSize(Page page);

    void save(PageData pd);

    PageData findUser(PageData pd);

    void update(PageData pd);

    void del(PageData ids);
}
