package com.imap.common.vo;

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

    public static AlarmEnum from(String type){
        switch(type){
            case "tmp":return AlarmEnum.TEMPERATURE_ABNORMAL;
            case "hmt":return AlarmEnum.HUMIDITY_ABNORMAL;
            case "lx":return AlarmEnum.BRIGHTNESS_ABNORMAL;
            default: return AlarmEnum.OTHER_ABNORMAL;
        }
    }
}