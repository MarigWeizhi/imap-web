package com.imap.common.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: Weizhi
 * @Date: create in 2022/10/7 21:38
 * @Description:
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HistoryHTVO {
    private String time;
    private double value;
    private String name;
}
