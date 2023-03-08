package com.imap.common.pojo;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.imap.common.util.DateTimeUtil;
import com.imap.common.util.JsonToMap;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

/**
 * @Author: Weizhi
 * @Date: create in 2023/1/16 16:17
 * @Description:
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataReport {
// timestamp要求精确到秒
//    {"siteId":1,"timestamp":1678297096,"type":"report","version":1,"status":0,"data":{"tmp":20.96,"lx":163.86,"hmt":0.98}}
    private Integer siteId;  // 站点id
    private Long timestamp; // 创建时间
    private String date; // 创建时间
    private String type;  // 数据类型
    private Integer version;  // 监控版本
    private Integer status; // 数据状态 0为正常，1为异常
    private Map<String,Double> data;  // 数据
    private String dataStr;  // 数据

    public String getDataStr() {
        try {
            return JsonToMap.objToJson(data);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    public String getDate() {
        return DateTimeUtil.timeStamp2DateString(timestamp);
    }

    @Override
    public String toString() {
        return "DataReport{" +
                "siteId=" + siteId +
                ", timestamp=" + new Timestamp(timestamp) +
                ", type='" + type + '\'' +
                ", version=" + version +
                ", status=" + status +
                ", data=" + data +
                '}';
    }
}
