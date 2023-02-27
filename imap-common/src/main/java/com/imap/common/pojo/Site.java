package com.imap.common.pojo;

import lombok.Data;

/**
 * @Author: Weizhi
 * @Date: create in 2023/2/22 0:26
 * @Description:
 */

@Data
public class Site {
    private Integer siteId;
    private String siteName;
    private Double lat;
    private Double lon;
    private String url;
    private Long updateTime;
    private Long createTime;
    private Integer createUser;
}
