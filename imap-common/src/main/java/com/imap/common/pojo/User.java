package com.imap.common.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

/**
 * @Author: Weizhi
 * @Date: create in 2022/4/5 20:48
 * @Description:
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class User {
    private int userId;
    private String loginName;
    private String loginPassword;
    private String userName;
    private String phone;
    private String email;
    private int createUser;
    private int isDelete;
    private int roleId;

}
