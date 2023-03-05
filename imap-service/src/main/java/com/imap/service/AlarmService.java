package com.imap.service;

import com.imap.common.pojo.vo.AlarmTableVO;

import java.util.List;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/5 23:42
 * @Description:
 */
public abstract class AlarmService implements BaseService {

    public abstract void setStatus(List<Integer> alarmIds);

    public abstract AlarmTableVO getInfo(Integer alarmId);

}
