package com.imap.service.impl;

import com.imap.common.pojo.vo.AlarmVO;
import com.imap.common.pojo.vo.HistoryHTVO;
import com.imap.common.pojo.vo.PhotoVO;
import com.imap.common.util.PageData;
import com.imap.dao.AlarmMapper;
import com.imap.dao.PhotoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author: Weizhi
 * @Date: create in 2022/5/27 21:11
 * @Description:
 */

@Service
public class DataService {

    @Autowired
    AlarmMapper alarmMapper;

    @Autowired
    PhotoMapper photoMapper;


    public List<AlarmVO> getAlarmList(int siteId) {
        List<AlarmVO> alarmList = alarmMapper.getAlarmList(siteId);
        alarmList.stream().forEach(alarm -> alarm.change());
        return alarmList;
    }

    public List<PhotoVO> getPhotos(int siteId) {
        List<String> photos = photoMapper.getPhotos(siteId);
        List<PhotoVO> collect = photos.stream()
                .map(url -> new PhotoVO(url))
                .collect(Collectors.toList());
        return collect;
    }
    public String getCameraUrl(int siteId) {
        return photoMapper.getCameraUrl(siteId);
    }

    public void addAlarm(PageData pd) {
        alarmMapper.addAlarm(pd);
    }
}
