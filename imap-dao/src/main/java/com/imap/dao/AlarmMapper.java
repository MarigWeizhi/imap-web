package com.imap.dao;

import com.imap.common.vo.AlarmTableVO;
import com.imap.common.vo.AlarmTypeVO;
import com.imap.common.vo.DataItemVO;
import com.imap.common.vo.AlarmVO;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AlarmMapper {

    List<AlarmVO> getAlarmList(int siteId);

    void addAlarm(PageData pd);

    List<DataItemVO> getAlarmTop(int n);
    List<AlarmTypeVO> getAlarmTypes();

    List<DataItemVO> getAlarmsPerMonth(@Param("time") String time, @Param("n")int n);

    List<DataItemVO> getAllAlarmsWithSite(int n);

    List<AlarmVO> getAlarms(int n);

    void setStatus(List<Integer> alarmIds);

    AlarmTableVO getAlarmById(Integer alarmId);

    List<PageData> findListPage(Page page);

    int getListSize(Page page);

    List<PageData> getAllAlarms();
}


