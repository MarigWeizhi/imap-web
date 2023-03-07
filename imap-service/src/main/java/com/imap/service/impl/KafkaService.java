package com.imap.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/8 0:22
 * @Description:
 */
@Service
public class KafkaService {

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    @KafkaListener(topics = "alarm", groupId = "alarm-group")
    public void listen(String message) {
        // 处理接收到的消息
        System.out.println("接收到消息：" + message);
    }

    public void sendMessage(String topic, String message){
        kafkaTemplate.send(topic, message);
    }

    public void updateMonitorConfig(String monitorConfig){
        kafkaTemplate.send("config", monitorConfig);
    }

}
