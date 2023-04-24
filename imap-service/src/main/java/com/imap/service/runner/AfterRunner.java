package com.imap.service.runner;

import com.imap.common.pojo.MonitorConfig;
import com.imap.service.SiteService;
import com.imap.service.impl.KafkaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: Weizhi
 * @Date: create in 2023/4/2 11:17
 * @Description:
 */

@Component
@Order(value = 1)
@Slf4j
public class AfterRunner implements ApplicationRunner {

    @Autowired
    KafkaService kafkaService;
    @Autowired
    SiteService siteService;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        List<MonitorConfig> allMonitorConfig = siteService.getAllMonitorConfig();
        log.info("同步监控配置：" + allMonitorConfig.size());
        for (MonitorConfig monitorConfig : allMonitorConfig) {
            kafkaService.updateMonitorConfig(monitorConfig.toJson());
        }
    }
}