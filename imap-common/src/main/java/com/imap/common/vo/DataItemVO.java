package com.imap.common.vo;

import lombok.Data;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/3 17:05
 * @Description:
 */
@Data
public class DataItemVO {
//    前端限制，AlarmTopVO的time属性实际放站点名
//    {
//        "time": "IMAP_001",
//            "value": 53,
//            "name": "告警数"
//    }
    private String time;
    private int value;
    private String name;
}
