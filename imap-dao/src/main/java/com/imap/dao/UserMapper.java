package com.imap.dao;


import com.imap.common.pojo.User;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {

    User getUserById(int userId);

    User getUserByLogin(@Param("userName")String userName, @Param("password")String password);

    List<PageData> findListPage(Page page);

    int findListSize(Page page);

    List<PageData> getAllList(PageData pd);

    void save(PageData pd);

    PageData findUser(PageData pd);

    void update(PageData pd);

    void delete(PageData pd);

    void saveUserRole(PageData pd);

}
