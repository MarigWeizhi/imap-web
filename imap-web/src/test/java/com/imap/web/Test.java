package com.imap.web;

import com.alibaba.fastjson.TypeReference;
import com.imap.common.util.DateTimeUtil;
import com.imap.common.util.JsonToMap;

import java.sql.Timestamp;
import java.util.Map;

import static com.imap.common.util.DateTimeUtil.getDateTimeStr;

/**
 * @Author: Weizhi
 * @Date: create in 2023/2/21 21:16
 * @Description:
 */
public class Test {
    public static void main(String[] args) throws InterruptedException {
        String str = "{\"tmp\":2000.96,\"lx\":163.86,\"hmt\":0.68}";
        System.out.println(JsonToMap.jsonToObj(str, new TypeReference<Map<String,Double>>(){}));
        System.out.println(DateTimeUtil.timeStamp2DateString(1678297096000L));

        for (int i = 0; i < 100; i++) {
            System.out.println(System.currentTimeMillis());
            Thread.sleep(1000);
        }
    }
}
