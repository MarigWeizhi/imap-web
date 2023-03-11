package com.imap.common.pojo;

public enum DataTypeEnum {
    TEMPERATURE("tmp","温度"),
    HUMIDITY("hmt","湿度"),
    BRIGHTNESS("lx","亮度"),
    ALARM("alarm","告警");

    private String type;
    private String typeStr;

    private DataTypeEnum(String type, String typeStr) {
        this.type = type;
        this.typeStr = typeStr;
    }
    public String getTypeStr() {
        return typeStr;
    }
    public String getType() {
        return type;
    }

    public static DataTypeEnum from(String type){
        switch(type){
            case "tmp":return DataTypeEnum.TEMPERATURE;
            case "hmt":return DataTypeEnum.HUMIDITY;
            case "lx":return DataTypeEnum.BRIGHTNESS;
            case "alarm":return DataTypeEnum.ALARM;
            default: return DataTypeEnum.TEMPERATURE;
        }
    }

    public static DataTypeEnum from(Integer type) {
        switch(type){
            case 0:return DataTypeEnum.TEMPERATURE;
            case 1:return DataTypeEnum.HUMIDITY;
            case 2:return DataTypeEnum.BRIGHTNESS;
            case 3:return DataTypeEnum.ALARM;
            default: return DataTypeEnum.TEMPERATURE;
        }
    }
}