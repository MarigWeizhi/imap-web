package com.imap.service.impl;

import com.alibaba.fastjson.TypeReference;
import com.imap.common.po.AlarmPO;
import com.imap.common.pojo.AlarmItem;
import com.imap.common.pojo.DataReport;
import com.imap.common.pojo.MonitorItem;
import com.imap.common.vo.*;
import com.imap.common.util.DateTimeUtil;
import com.imap.common.util.JsonToMap;
import com.imap.common.util.PageData;
import com.imap.dao.SiteMapper;
import com.imap.dao.AlarmMapper;
import com.imap.dao.PhotoMapper;
import com.imap.dao.DataMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
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

    @Autowired
    DataMapper dataMapper;

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
    }

    /**
     * @Cacheable: 将该方法查询结果comment存放在SpringBoot默认缓存中
     * cacheNames: 起一个缓存的命名空间，对应缓存的唯一标识
     * value：缓存结果   key：默认只有一个参数的情况下，key值默认就是方法参数值; 如果没有参数或者多个参数的情况：会使用SimpleKeyGenerate来为生成key
     */
    @Cacheable(cacheNames = "siteData", key = "#siteId",unless = "#result==null")
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
                data.getData().get("hmt"),
                data.getData().get("lx")
        );
        logger.info("siteData从数据库获取");
        return siteDataVO;
    }

    @CachePut(cacheNames = "siteData", key = "#result.site_id")
    public SiteDataVO setSiteData(DataReport dataReport) {
        siteMapper.setCurSiteData(dataReport);
        Map<String,Double> map = JsonToMap.jsonToObj(dataReport.getDataStr(), new TypeReference<Map<String,Double>>(){});
        dataReport.setData(map);
        SiteDataVO siteDataVO = new SiteDataVO(
                dataReport.getSiteId(),
                dataReport.getType(),
                dataReport.getStatus(),
                DateTimeUtil.timeStamp2DateString(dataReport.getTimestamp()),
                dataReport.getData().get("tmp"),
                dataReport.getData().get("hmt"),
                dataReport.getData().get("lx")
        );
        return siteDataVO;
    }

    public List<TmpOrHmtVO> getYesterdayData(int siteId, String type) {
        String time = DateTimeUtil.subtractTime(1, ChronoUnit.DAYS);
        List<TmpOrHmtVO> list = new ArrayList<>();
        if("tmp".equals(type)){
            list = dataMapper.getTmp(siteId,time);
        }
        if("hmt".equals(type)){
            list = dataMapper.getHmt(siteId,time);
        }
        if("lx".equals(type)){
            list = dataMapper.getLx(siteId,time);
        }
        list.forEach(item -> {
            item.setTime(DateTimeUtil.transform(item.getDate(),"HH:mm"));
        });
        return list;
    }

    public List<DataItemVO> getAlarmTop(int n) {
        return alarmMapper.getAlarmTop(n);
    }

    public List<DataItemVO> getAlarmsPerMonth() {
        Date now = new Date();
        String transform = DateTimeUtil.transform(now, "yyyy-MM");
        List<DataItemVO> alarmsPerMonth = alarmMapper.getAlarmsPerMonth(transform, 7);
        return alarmsPerMonth;
    }

    public List<DataItemVO> getAllAlarmsWithSite() {
        List<DataItemVO> allAlarmsWithSite = alarmMapper.getAllAlarmsWithSite(5);
        return allAlarmsWithSite;
    }

    public List<AlarmVO> getAllAlarms() {
        List<AlarmVO> allAlarms = alarmMapper.getAlarms(50);
        allAlarms.forEach(item -> item.change());
        return allAlarms;
    }

    public List<AlarmTypeVO> getAlarmTypes() {
        List<AlarmTypeVO> alarmTypes = alarmMapper.getAlarmTypes();
        alarmTypes.forEach(
                item->item.setName(AlarmEnum.values()[Integer.valueOf(item.getName())]
                        .getDescription()));
        return alarmTypes;
    }

    public void addAlarm(AlarmItem alarmItem) {
        DataReport dataReport = alarmItem.getDataReport();
        MonitorItem monitorItem = alarmItem.getMonitorItem();
        AlarmEnum alarmEnum = AlarmEnum.from(monitorItem.getType());
        Integer siteId = dataReport.getSiteId();
        Integer type = alarmEnum.ordinal();
        String info = alarmEnum.getDescription()
                + ": 当前值为：" + dataReport.getData().get(monitorItem.getType())
                + " 参考值为：" +  monitorItem.getMin()  + " ~ " + monitorItem.getMax();
        Integer status = 0; // 0是未处理
        String createDate = DateTimeUtil.timeStamp2DateString(dataReport.getTimestamp());
        AlarmPO alarmPO = new AlarmPO(null,siteId,type,info,status,createDate);
        alarmMapper.addAlarm(alarmPO);
    }

}
