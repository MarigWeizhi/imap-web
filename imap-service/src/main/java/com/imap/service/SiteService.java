package com.imap.service;


import com.imap.common.pojo.Site;
import com.imap.common.pojo.User;
import com.imap.common.util.PageData;

public abstract class SiteService implements BaseService {

    public abstract Site getSiteById(int siteId);

    public abstract PageData getSiteConfigById(int siteId);
}
