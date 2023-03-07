package com.imap.common.pojo;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.imap.common.util.JsonToMap;
import com.imap.common.util.MathUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Author: Weizhi
 * @Date: create in 2023/1/14 21:50
 * @Description:
 */


@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MonitorConfig {
    private Integer siteId;  // 监控站点
    private Long timestamp; // 创建时间
    private Integer version;    // 监控配置版本，设备端拉取最新版
    private Integer interval;   // 设备数据上报时间间隔
    private Integer isDelete; // 是否删除
    private Map<String,MonitorItem> monitorItems;  // 保存各个监控传感器配置项

    public static MonitorConfig getDefaultConfig(Integer siteId){
        MonitorConfig monitorConfig = new MonitorConfig();
        monitorConfig.setSiteId(siteId);
        monitorConfig.setInterval(30);
        monitorConfig.setTimestamp(System.currentTimeMillis());
        monitorConfig.setVersion(1);
        monitorConfig.setIsDelete(0);
        MonitorItem tmp = new MonitorItem("tmp", 1,
                MathUtil.getRandomData(2,2), 0.00);
        MonitorItem hmt = new MonitorItem("hmt", 1,
                MathUtil.getRandomData(0,2), 0.00);
        ConcurrentHashMap<String, MonitorItem> monitorItemConcurrentHashMap = new ConcurrentHashMap<>();
        monitorItemConcurrentHashMap.put("tmp",tmp);
        monitorItemConcurrentHashMap.put("hmt",hmt);
        monitorConfig.setMonitorItems(monitorItemConcurrentHashMap);
        return monitorConfig;
    }

    public String toJson() {
        try {
            return JsonToMap.objToJson(this);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<MonitorConfig> getDefaultConfigList(){
        MonitorConfig config1 = getDefaultConfig(1);
        MonitorConfig config2 = getDefaultConfig(2);
        MonitorConfig config3 = getDefaultConfig(3);
        MonitorConfig config4 = getDefaultConfig(4);
        MonitorConfig config5 = getDefaultConfig(5);

        List<MonitorConfig> monitorConfigs = Arrays.asList(config1, config2, config3, config4, config5);
        return monitorConfigs;
    }

    public static MonitorConfig getConfig(String json) throws IOException {
        MonitorConfig config = JsonToMap.jsonToObj(json, MonitorConfig.class);
        return config;
    }

    public static void main(String[] args) throws IOException {
        MonitorConfig defaultConfig = getDefaultConfig(1);
        String str = JsonToMap.objToJson(defaultConfig);
        System.out.println(str);
        System.out.println("======");
        MonitorConfig configFromJson = getConfig(str);
        System.out.println(configFromJson);
    }
}
