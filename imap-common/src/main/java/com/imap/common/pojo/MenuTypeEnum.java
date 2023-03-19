package com.imap.common.pojo;

public enum MenuTypeEnum {
    NULL("none","未知"),
    ONLINE("online","在线监控"),
    HISTORY("history","历史数据"),
    USER("user","用户管理"),
    ROLE("role","角色管理"),
    SITE("site","站点管理"),
    ALARM("alarm","告警管理");

    private String code;
    private String typeStr;

    MenuTypeEnum(String code, String typeStr) {
        this.code = code;
        this.typeStr = typeStr;
    }
    public String getTypeStr() {
        return typeStr;
    }
    public String getCode() {
        return code;
    }


}