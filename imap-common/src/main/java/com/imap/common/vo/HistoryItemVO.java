package com.imap.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/12 1:54
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class HistoryItemVO {
    private Integer siteId;
    private String title;
    private String typeName;
    private List<List<String>> data;

}
