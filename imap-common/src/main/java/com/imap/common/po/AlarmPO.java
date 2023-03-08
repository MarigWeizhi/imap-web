package com.imap.common.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/9 0:53
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlarmPO {
    private Integer alarmId;
    private Integer siteId;
    private Integer type;
    private String info;
    private Integer status;
    private String createTime;
}
