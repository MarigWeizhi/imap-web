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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
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

    private Logger logger = LoggerFactory.getLogger(this.getClass());

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

    /**
     * @Cacheable: 将该方法查询结果comment存放在SpringBoot默认缓存中
     * cacheNames: 起一个缓存的命名空间，对应缓存的唯一标识
     * value：缓存结果   key：默认只有一个参数的情况下，key值默认就是方法参数值; 如果没有参数或者多个参数的情况：会使用SimpleKeyGenerate来为生成key
     */
    @Cacheable(cacheNames = "siteData", unless = "#result==null")
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
        logger.info("获取数据" + siteDataVO);
        return siteDataVO;
    }
}
