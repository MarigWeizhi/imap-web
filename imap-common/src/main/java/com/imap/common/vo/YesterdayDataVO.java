package com.imap.common.vo;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/3 15:04
 * @Description:
 */

@Data
public class YesterdayDataVO implements Serializable {

    private String time;
    @JSONField(serialize = false)
    private Date date;
    private Double value;
    private String name;
}
