package com.imap.service.impl;

import com.imap.common.pojo.AlarmItem;
import com.imap.common.pojo.DataReport;
import com.imap.common.util.JsonToMap;
import com.imap.service.AlarmService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.io.IOException;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/8 0:22
 * @Description:
 */
@Service
public class KafkaService {

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    @Autowired
    private DataService dataService;

    @Autowired
    private AlarmService alarmService;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @KafkaListener(topics = "alarm", groupId = "alarm-group")
    public void listenAlarm(String alarm) {
        // 处理接收到的消息
        AlarmItem alarmItem = AlarmItem.from(alarm);
        if(alarmItem!=null){
            alarmService.addAlarm(alarmItem);
            logger.info("accepted an Alarm：" + alarm);
        }
    }

    @KafkaListener(topics = "report")
    public void listenDataReport(String dataReport) {
        try {
            dataService.setSiteData(JsonToMap.jsonToObj(dataReport, DataReport.class));
//        logger.info("listenDataReport：" + dataReport);
        } catch (IOException e) {
            logger.warn("无法解析该数据");
            logger.warn(e.getMessage());
        }
    }

    public void sendMessage(String topic, String message){
        kafkaTemplate.send(topic, message);
    }

    public void updateMonitorConfig(String monitorConfig){
        kafkaTemplate.send("config", monitorConfig);
    }

}
