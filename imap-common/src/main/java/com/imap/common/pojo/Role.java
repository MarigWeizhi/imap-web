package com.imap.common.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

/**
 * @Author: Weizhi
 * @Date: create in 2022/11/16 9:00
 * @Description:
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role {
    int roleId;
    String roleName;
    String roleConfig = "";
    Timestamp createTime;
    Timestamp updateTime;
    int createUser;
    int isDelete;
}
