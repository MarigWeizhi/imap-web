package com.imap.dao;

import com.imap.common.pojo.vo.AlarmVO;
import com.imap.common.util.PageData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AlarmMapper {

    List<AlarmVO> getAlarmList(int siteId);

    void addAlarm(PageData pd);
}


