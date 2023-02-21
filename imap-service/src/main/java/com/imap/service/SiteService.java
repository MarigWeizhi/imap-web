package com.imap.service;


import com.imap.common.pojo.Site;
import com.imap.common.pojo.User;

public abstract class SiteService implements BaseService {

    public abstract Site getSiteById(int siteId);

}
