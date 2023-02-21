package com.imap.service;

import com.imap.common.util.Page;
import com.imap.common.util.PageData;

import java.util.List;

public interface BaseService {

    /**
     *
     * @deprecated 获取所有数据
     * */
    List<PageData> getAllList(PageData pd);

    /**
     * @deprecated 获取指定页面数据
     * */

    List<PageData> findListPage(Page page);

    /**
     * @deprecated 获取所有数据大小
     * */

    int getListSize(Page page);

    void save(PageData pd);

    int update(PageData pd);

    void delete(PageData pd);
}
