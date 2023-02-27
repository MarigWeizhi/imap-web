package com.imap.common.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: Weizhi
 * @Date: create in 2023/2/27 14:39
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SiteDataVO {
    private Integer site_id;
    private String type;
    private Integer status;
    private String time;
    private Double tmp;
    private Double hmt;
    private Double lx;
}
