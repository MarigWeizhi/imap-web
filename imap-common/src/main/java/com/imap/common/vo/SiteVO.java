package com.imap.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @Author: Weizhi
 * @Date: create in 2023/4/5 17:45
 * @Description:
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SiteVO {
    private Integer siteId;
    private String siteName;
    private BigDecimal lon; // 经度 保留14位小数
    private BigDecimal lat; // 维度 保留14位小数
    private String url; // 监控url
    private Integer createUser; // 创建者

}
