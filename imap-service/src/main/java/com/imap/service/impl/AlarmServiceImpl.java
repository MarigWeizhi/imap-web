package com.imap.service.impl;

import com.imap.common.pojo.vo.AlarmTableVO;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import com.imap.dao.AlarmMapper;
import com.imap.service.AlarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/5 23:49
 * @Description:
 */

@Service
public class AlarmServiceImpl extends AlarmService {

    @Autowired
    AlarmMapper alarmMapper;

    @Override
    public void setStatus(List<Integer> alarmIds) {
        alarmMapper.setStatus(alarmIds);
    }

    @Override
    public AlarmTableVO getInfo(Integer alarmId) {
        AlarmTableVO alarmTableVO = alarmMapper.getAlarmById(alarmId);
        alarmTableVO.change();
        return alarmTableVO;
    }

    @Override
    public List<PageData> getAllList(PageData pd) {
        return alarmMapper.getAllAlarms();
    }

    @Override
    public List<PageData> findListPage(Page page) {
        return alarmMapper.findListPage(page);
    }

    @Override
    public int getListSize(Page page) {
        return alarmMapper.getListSize(page);
    }

    @Override
    public void save(PageData pd) {
        alarmMapper.addAlarm(pd);
    }

    @Override
    public int update(PageData pd) {
        return 0;
    }

    @Override
    public void delete(PageData pd) {

    }
}
