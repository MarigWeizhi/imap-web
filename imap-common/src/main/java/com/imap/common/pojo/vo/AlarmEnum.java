package com.imap.common.pojo.vo;

public enum AlarmEnum {
    TEMPERATURE_ABNORMAL("温度异常"),
    HUMIDITY_ABNORMAL("湿度异常"),
    BRIGHTNESS_ABNORMAL("亮度异常"),
    OTHER_ABNORMAL("其他异常");

    private String description;

    private AlarmEnum(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}