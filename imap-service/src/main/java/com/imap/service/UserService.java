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

public abstract class UserService implements BaseService {

    public abstract User login(String userName, String password);

    public abstract User getUserById(int uid);

    public abstract PageData findUser(PageData pd);

    public abstract void delUserRole(PageData pd);
}
