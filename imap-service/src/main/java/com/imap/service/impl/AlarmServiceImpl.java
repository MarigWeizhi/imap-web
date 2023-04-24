package com.imap.service.impl;

import com.imap.common.util.MailUtil;
import com.imap.common.po.AlarmPO;
import com.imap.common.pojo.*;
import com.imap.common.util.DateTimeUtil;
import com.imap.common.vo.AlarmEnum;
import com.imap.common.vo.AlarmTableVO;
import com.imap.common.util.Page;
import com.imap.common.util.PageData;
import com.imap.dao.AlarmMapper;
import com.imap.dao.SiteMapper;
import com.imap.dao.UserMapper;
import com.imap.service.AlarmService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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

    @Autowired
    SiteMapper siteMapper;

    @Autowired
    UserMapper userMapper;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public int setStatus(List<Integer> alarmIds) {
        alarmMapper.setStatus(alarmIds);
        return 200;
    }

    @Override
    public AlarmTableVO getInfo(Integer alarmId) {
        AlarmTableVO alarmTableVO = alarmMapper.getAlarmById(alarmId);
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
    // 由addAlarm代替
    public void save(PageData pd) {
    }

    public void addAlarm(AlarmItem alarmItem) {
        DataReport dataReport = alarmItem.getDataReport();
        MonitorItem monitorItem = alarmItem.getMonitorItem();
        AlarmEnum alarmEnum = AlarmEnum.from(monitorItem.getType());
        Integer siteId = dataReport.getSiteId();
        Integer type = alarmEnum.ordinal();
        // 同站点最近5分钟未告警则发送email通知
        Date time = alarmMapper.getLastestAlarm(siteId);
        if (time == null || dataReport.getTimestamp() - (time.getTime() - 8*60*60*1000) > 5 * 60 * 1000) {
            String info = alarmEnum.getDescription()
                    + ": 当前值为：" + dataReport.getData().get(monitorItem.getType())
                    + " 参考值为：" + monitorItem.getMin() + " ~ " + monitorItem.getMax();
            Integer status = 0; // 0是未处理
            String createDate = DateTimeUtil.timeStamp2DateString(dataReport.getTimestamp());
            AlarmPO alarmPO = new AlarmPO(null, siteId, type, info, status, createDate);
//            logger.info("addAlarm:" + alarmPO);
            Site site = siteMapper.getSiteById(siteId);
            User user = userMapper.getUserById(site.getCreateUser());
            MailUtil.sendAlarm(user.getUserName(), site.getSiteName(), info);
            alarmMapper.addAlarm(alarmPO);
        }
    }

    @Override
    //不提供更新和删除接口
    public int update(PageData pd) {
        return 0;
    }

    @Override
    public void delete(PageData pd) {
    }

}
