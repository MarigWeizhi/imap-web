package com.imap.service.impl;

import com.alibaba.fastjson.TypeReference;
import com.imap.common.pojo.DataReport;
import com.imap.common.pojo.vo.AlarmVO;
import com.imap.common.pojo.vo.PhotoVO;
import com.imap.common.pojo.vo.SiteDataVO;
import com.imap.common.util.DateTimeUtil;
import com.imap.common.util.JsonToMap;
import com.imap.common.util.PageData;
import com.imap.dao.SiteMapper;
import com.imap.dao.AlarmMapper;
import com.imap.dao.PhotoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
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

    @Autowired
    SiteMapper siteMapper;

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

    public SiteDataVO getSiteData(int siteId) {
        DataReport data = siteMapper.getCurSiteData(siteId);
        Map<String,Double> map = JsonToMap.jsonToObj(data.getDataStr(), new TypeReference<Map<String,Double>>(){});
        data.setData(map);
        SiteDataVO siteDataVO = new SiteDataVO(
                data.getSiteId(),
                data.getType(),
                data.getStatus(),
                DateTimeUtil.timeStamp2DateString(data.getTimestamp()),
                data.getData().get("tmp"),
                data.getData().get("hmt")*100,
                data.getData().get("lx")
        );

        return siteDataVO;
    }
}
