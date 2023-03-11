package com.imap.common.po;

import com.alibaba.fastjson.TypeReference;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.imap.common.pojo.MonitorConfig;
import com.imap.common.pojo.MonitorItem;
import com.imap.common.util.JsonToMap;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Map;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/11 0:11
 * @Description:
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MonitorConfigPO implements Serializable {
    private Integer siteId;  // 监控站点
    private Long timestamp; // 创建时间
    private Integer version;    // 监控配置版本，设备端拉取最新版
    private Integer interval;   // 设备数据上报时间间隔
    private Integer isDelete; // 是否删除
    private String monitorItems;  // 保存各个监控传感器配置项

    public static MonitorConfigPO from(MonitorConfig config) {
        try {
            return new MonitorConfigPO(config.getSiteId(),
                    config.getTimestamp(),
                    config.getVersion(),
                    config.getInterval(),
                    config.getIsDelete(),
                    JsonToMap.objToJson(config.getMonitorItems()));
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    public MonitorConfig to() {
        return new MonitorConfig(siteId,timestamp,version,interval,isDelete,
                JsonToMap.jsonToObj(monitorItems,new TypeReference<Map<String,MonitorItem>>(){}));
    }
}
