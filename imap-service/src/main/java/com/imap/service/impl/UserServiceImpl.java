package com.imap.service.impl;

import com.imap.common.pojo.User;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import com.imap.dao.UserMapper;
import com.imap.service.RoleService;
import com.imap.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: Weizhi
 * @Date: create in 2022/4/5 22:11
 * @Description:
 */

@Service("userService")
public class UserServiceImpl extends UserService {

    @Autowired
    UserMapper userMapper;
    @Autowired
    private RoleService roleService;

    @Override
    public User login(String userName, String password) {
        User user = userMapper.getUserByLogin(userName, password);
        if(user != null){
            user.setRoleId(roleService.getRoleId(user.getUserId()));
        }
        System.out.println("登入结果：" + user);
        return user;
    }

    @Override
    public User getUserById(int userId) {
        User userById = userMapper.getUserById(userId);
        return userById;
    }

    @Override
    public List<PageData> getAllList(PageData pd) {
        return userMapper.getAllList(pd);
    }

    @Override
//    @Cacheable(cacheNames = "page", unless = "#result==null")
    public List<PageData> findListPage(Page page) {
//        PageHelper.startPage(page.getIndex(), page.getShowCount());
        List<PageData> listPage = userMapper.findListPage(page);
        listPage.stream().forEach(pd -> pd.put("create_time", pd.get("create_time").toString()));
        return listPage;
    }

    @Override
    public int getListSize(Page page) {
        return userMapper.findListSize(page);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(PageData pd) {
        userMapper.save(pd);
        User user = userMapper.getUserByLogin(pd.get("login_name").toString(), pd.get("login_password").toString());
        pd.put("user_id",user.getUserId());
        userMapper.saveUserRole(pd);
    }

    @Override
    public PageData findUser(PageData pd) {
        return userMapper.findUser(pd);
    }

    @Override
    public int update(PageData pd) {
        userMapper.update(pd);
        userMapper.updateUserRole(pd);

        return 200;
    }

    @Override
    public void delete(PageData pd) {
        userMapper.delete(pd);
    }

    @Override
    public void delUserRole(PageData pd) {
        // user逻辑删除即可，实际UserRole不删也行
    }


}
