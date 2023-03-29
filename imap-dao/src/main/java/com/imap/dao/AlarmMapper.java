package com.imap.dao;

import com.imap.common.po.AlarmPO;
import com.imap.common.vo.AlarmTableVO;
import com.imap.common.vo.AlarmTypeVO;
import com.imap.common.vo.DataItemVO;
import com.imap.common.vo.AlarmVO;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface AlarmMapper {

    List<AlarmVO> getAlarmList(int siteId);

    List<DataItemVO> getAlarmTop(int n);
    List<AlarmTypeVO> getAlarmTypes();

    List<DataItemVO> getAlarmsPerMonth(@Param("time") String time, @Param("n")int n);

    List<DataItemVO> getAllAlarmsWithSite();

    List<AlarmVO> getAlarms(int n);

    void setStatus(List<Integer> alarmIds);

    AlarmTableVO getAlarmById(Integer alarmId);

    List<PageData> findListPage(Page page);

    int getListSize(Page page);

    List<PageData> getAllAlarms();

    void addAlarm(AlarmPO alarmPO);

    Date getLastestAlarm(Integer siteId);
}


