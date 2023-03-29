package com.imap.dao;

import com.imap.common.util.PageData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PhotoMapper {


    List<String> getPhotos(int siteId);

    String getCameraUrl(int siteId);

    void savePhoto(PageData pd);
}
