package com.imap.service;


import com.imap.common.pojo.Role;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;

import java.util.List;

public abstract class RoleService implements BaseService{

    public abstract int getRoleId(int userId);

    public abstract Role getRoleById(int roleId);

    public abstract PageData findInfo(PageData pd);
}
