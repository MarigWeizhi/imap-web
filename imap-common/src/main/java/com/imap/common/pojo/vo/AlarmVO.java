package com.imap.common.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: Weizhi
 * @Date: create in 2022/10/7 22:54
 * @Description:
 */


@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlarmVO {
    private String site;
    private String type;
    private String event;
    private String time;

    public void change() {
        this.type = String.valueOf(AlarmEnum.values()[Integer.valueOf(this.type)]);
//        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        this.time = format.format(Long.valueOf(time));
    }
}
