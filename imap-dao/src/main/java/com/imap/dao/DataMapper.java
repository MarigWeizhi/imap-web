package com.imap.dao;

import com.imap.common.pojo.vo.TmpOrHmtVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DataMapper {
    List<TmpOrHmtVO> getHmt(@Param("siteId") int siteId, @Param("time")String time);
    List<TmpOrHmtVO> getTmp(@Param("siteId") int siteId, @Param("time")String time);
    List<TmpOrHmtVO> getLx(@Param("siteId") int siteId, @Param("time")String time);

}
