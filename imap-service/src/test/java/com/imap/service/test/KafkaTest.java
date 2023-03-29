package com.imap.service.test;

import com.imap.common.pojo.AlarmItem;
import com.imap.common.pojo.DataReport;
import com.imap.service.impl.KafkaService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Random;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/22 23:20
 * @Description:
 */

@RunWith(SpringRunner.class)
@SpringBootTest(classes = KafkaService.class)
public class KafkaTest {
    public static final String[] NAMES = {"tmp","hmt","lx"};
    public static final int[] SITE_ID = {1,2,3,4,5};
    public static final String TYPE = "report";
    public static int version = 1;
    public static int status = 0;
    public static Random random = new Random();

    @Autowired
    KafkaService kafkaService;

    @Test
    public void addAlarm(){
        AlarmItem alarmItem = AlarmItem.from("{\"dataReport\":{\"siteId\":1,\"timestamp\":1679499152691,\"type\":\"report\",\"version\":1,\"status\":0,\"data\":{\"tmp\":88.8,\"lx\":656.21,\"hmt\":0.84}},\"monitorItem\":{\"type\":\"tmp\",\"open\":1,\"max\":22.2,\"min\":0.0}}");
        kafkaService.sendMessage("alarm",alarmItem.toString());
    }

    public static DataReport getRandomDataReport() {
        HashMap<String, Double> map = new HashMap<>();
        DataReport dataReport = new DataReport();
        map.put(NAMES[0],getRandomData(2,2));
        map.put(NAMES[1],getRandomData(0,2));
        map.put(NAMES[2],getRandomData(3,2));

        dataReport.setTimestamp(System.currentTimeMillis());
        dataReport.setSiteId(SITE_ID[random.nextInt(SITE_ID.length)]);
        dataReport.setType(TYPE);
        dataReport.setVersion(version);
        dataReport.setStatus(status);
        dataReport.setData(map);
        return dataReport;
    }

    public static Double getRandomData(int n, int scale) {
        Random random = new Random();
        double base = Math.pow(10,n);
        BigDecimal bigDecimal = new BigDecimal(random.nextDouble() * base)
                .setScale(scale, BigDecimal.ROUND_HALF_UP);
        return bigDecimal.doubleValue();
    }
}
