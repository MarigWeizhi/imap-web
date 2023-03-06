package com.imap.common.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: Weizhi
 * @Date: create in 2022/11/15 9:27
 * @Description:
 */
@Data
@NoArgsConstructor
public class PhotoVO {
    String url;
    String name;
    String id;

    public PhotoVO(String url) {
        this.url = url;
        this.id = url;
        this.name = "name"+url;
    }
}
