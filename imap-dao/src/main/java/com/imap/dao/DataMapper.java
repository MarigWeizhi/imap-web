package com.imap.dao;

import com.imap.common.po.BaseDataPO;
import com.imap.common.util.PageData;
import com.imap.common.vo.YesterdayDataVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DataMapper {
    List<YesterdayDataVO> getHmt(@Param("siteId") int siteId, @Param("time")String time);
    List<YesterdayDataVO> getTmp(@Param("siteId") int siteId, @Param("time")String time);
    List<YesterdayDataVO> getLx(@Param("siteId") int siteId, @Param("time")String time);

    List<BaseDataPO> getHistoryData(PageData pageData);
}
