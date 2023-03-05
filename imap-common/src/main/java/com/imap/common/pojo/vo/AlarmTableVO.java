package com.imap.common.pojo.vo;

import com.fasterxml.jackson.annotation.JsonAlias;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/5 23:45
 * @Description:
 */
@Data
@AllArgsConstructor
public class AlarmTableVO implements Serializable {

    @JsonAlias("alarm_id")
    private Integer alarmId;
    @JsonAlias("site_name")
    private String siteName;
    private String name;
    private String email;
    private String type;
    private String status;
    private String info;
    private String time;

    public void change() {
        this.type = AlarmEnum.values()[Integer.valueOf(this.type)].getDescription();
    }
}