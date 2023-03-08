package com.imap.common.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MonitorItem {
    private String type;
    private Integer open;
    private Double max;
    private Double min;
}