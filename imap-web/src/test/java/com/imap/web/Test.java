package com.imap.web;

import com.imap.common.util.DateTimeUtil;

import java.sql.Timestamp;

import static com.imap.common.util.DateTimeUtil.getDateTimeStr;

/**
 * @Author: Weizhi
 * @Date: create in 2023/2/21 21:16
 * @Description:
 */
public class Test {
    public static void main(String[] args) {

        long time = Timestamp.valueOf(getDateTimeStr()).getTime();
        System.out.println(time);
        System.out.println(DateTimeUtil.timeStamp2DateString(1678297096000L));
    }
}
