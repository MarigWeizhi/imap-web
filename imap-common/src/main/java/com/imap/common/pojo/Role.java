package com.imap.common.pojo;

import lombok.Data;

import java.sql.Timestamp;

/**
 * @Author: Weizhi
 * @Date: create in 2022/11/16 9:00
 * @Description:
 */

@Data
public class Role {
    int roleId;
    String roleName;
    Timestamp createTime;
    Timestamp updateTime;
    int createUser;
    int isDelete;
    int roleLevel;
}
