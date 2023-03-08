package com.imap.common.pojo;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.imap.common.util.JsonToMap;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.IOException;
import java.io.Serializable;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/8 22:43
 * @Description:
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlarmItem implements Serializable {
    DataReport dataReport;
    MonitorItem monitorItem;

    public static AlarmItem of(DataReport dataReport, MonitorItem monitorItem) {
        return new AlarmItem(dataReport,monitorItem);
    }

    public static AlarmItem from(String json) {
        try {
            return JsonToMap.jsonToObj(json,AlarmItem.class);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }



    @Override
    public String toString() {
        try {
            return JsonToMap.objToJson(this);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }
}
