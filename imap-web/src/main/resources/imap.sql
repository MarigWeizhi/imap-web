/*
 Navicat Premium Data Transfer

 Source Server         : 本地MYSQL
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : imap

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 07/03/2023 02:29:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dev_alarm
-- ----------------------------
DROP TABLE IF EXISTS `dev_alarm`;
CREATE TABLE `dev_alarm`  (
                              `alarm_id` int(11) NOT NULL AUTO_INCREMENT,
                              `site_id` int(11) NULL DEFAULT NULL,
                              `type` int(11) NULL DEFAULT NULL,
                              `info` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                              `status` int(11) NULL DEFAULT NULL,
                              `create_time` datetime(0) NULL DEFAULT NULL,
                              PRIMARY KEY (`alarm_id`) USING BTREE,
                              INDEX `FK_dev_site_alarm`(`site_id`) USING BTREE,
                              CONSTRAINT `dev_alarm_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `dev_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备告警信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dev_alarm
-- ----------------------------
INSERT INTO `dev_alarm` VALUES (1, 1, 3, '设备异常', 1, '2022-10-08 10:31:24');
INSERT INTO `dev_alarm` VALUES (22, 1, 0, '温度过高：50.0℃', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (23, 1, 1, '湿度过高：90.0%', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (24, 2, 2, '亮度异常', 0, '2023-02-08 10:31:24');
INSERT INTO `dev_alarm` VALUES (25, 1, 3, '设备异常', 1, '2022-10-07 10:31:24');
INSERT INTO `dev_alarm` VALUES (28, 3, 1, '湿度过高：90.0%', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (29, 3, 1, '湿度过高：80.0%', 0, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (30, 4, 2, '亮度异常', 0, '2023-02-08 10:31:24');
INSERT INTO `dev_alarm` VALUES (31, 5, 3, '设备异常', 1, '2023-02-08 10:31:24');
INSERT INTO `dev_alarm` VALUES (32, 5, 3, '设备异常', 0, '2023-02-08 10:31:24');
INSERT INTO `dev_alarm` VALUES (33, 1, 1, '湿度过高：90.0%', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (34, 1, 1, '湿度过高：90.0%', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (35, 1, 2, '亮度异常', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (36, 1, 0, '温度过高：50.0℃', 0, '2023-01-08 13:15:49');

-- ----------------------------
-- Table structure for dev_avg_data
-- ----------------------------
DROP TABLE IF EXISTS `dev_avg_data`;
CREATE TABLE `dev_avg_data`  (
                                 `site_id` int(11) NOT NULL,
                                 `end_time` datetime(0) NOT NULL,
                                 `type` int(11) NOT NULL COMMENT '时间粒度1：分钟、2：小时、3：天、4：星期、5：月',
                                 `avg_tmp` decimal(8, 2) NULL DEFAULT NULL,
                                 `avg_hmt` decimal(8, 2) NULL DEFAULT NULL,
                                 `avg_lx` decimal(8, 2) NULL DEFAULT NULL,
                                 PRIMARY KEY (`site_id`, `end_time`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dev_avg_data
-- ----------------------------
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-02 00:07:15', 2, 58.15, 0.46, 361.09);
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-02 02:07:20', 2, 95.49, 0.61, 145.60);
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-02 04:07:30', 2, 65.07, 0.50, 598.20);
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-02 06:07:35', 2, 48.92, 0.57, 719.72);
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-02 08:07:40', 2, 29.25, 0.29, 217.27);
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-02 14:07:45', 2, 41.73, 0.64, 469.65);
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-03 00:07:15', 2, 58.15, 0.46, 361.09);
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-03 02:07:20', 2, 95.49, 0.61, 145.60);
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-03 04:07:30', 2, 65.07, 0.50, 598.20);
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-03 06:07:35', 2, 48.92, 0.57, 719.72);
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-03 08:07:40', 2, 29.25, 0.29, 217.27);
INSERT INTO `dev_avg_data` VALUES (1, '2023-03-03 14:07:45', 2, 41.73, 0.64, 469.65);
INSERT INTO `dev_avg_data` VALUES (2, '2023-02-27 14:07:20', 2, 47.55, 0.44, 390.20);
INSERT INTO `dev_avg_data` VALUES (2, '2023-02-27 14:07:25', 2, 51.59, 0.68, 360.43);
INSERT INTO `dev_avg_data` VALUES (2, '2023-02-27 14:07:30', 5, 42.29, 0.92, 378.73);
INSERT INTO `dev_avg_data` VALUES (3, '2023-02-27 14:07:20', 5, 51.91, 0.08, 12.88);
INSERT INTO `dev_avg_data` VALUES (3, '2023-02-27 14:07:30', 5, 16.94, 0.08, 640.02);
INSERT INTO `dev_avg_data` VALUES (3, '2023-02-27 14:07:35', 5, 38.60, 0.72, 202.01);
INSERT INTO `dev_avg_data` VALUES (3, '2023-02-27 14:07:40', 5, 63.71, 0.24, 755.24);
INSERT INTO `dev_avg_data` VALUES (3, '2023-02-27 14:07:45', 5, 88.66, 0.33, 682.26);
INSERT INTO `dev_avg_data` VALUES (4, '2023-02-27 14:07:15', 5, 47.18, 0.69, 506.10);
INSERT INTO `dev_avg_data` VALUES (4, '2023-02-27 14:07:25', 5, 48.66, 0.67, 336.53);
INSERT INTO `dev_avg_data` VALUES (4, '2023-02-27 14:07:30', 5, 6.31, 0.03, 425.08);
INSERT INTO `dev_avg_data` VALUES (4, '2023-02-27 14:07:40', 5, 30.28, 0.37, 219.48);
INSERT INTO `dev_avg_data` VALUES (4, '2023-02-27 14:07:45', 5, 27.68, 0.98, 999.66);
INSERT INTO `dev_avg_data` VALUES (5, '2023-02-27 14:07:10', 5, 29.48, 0.60, 825.91);
INSERT INTO `dev_avg_data` VALUES (5, '2023-02-27 14:07:15', 5, 21.27, 0.21, 480.10);
INSERT INTO `dev_avg_data` VALUES (5, '2023-02-27 14:07:35', 5, 2.01, 0.04, 38.02);

-- ----------------------------
-- Table structure for dev_data_report
-- ----------------------------
DROP TABLE IF EXISTS `dev_data_report`;
CREATE TABLE `dev_data_report`  (
                                    `report_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'report_id',
                                    `site_id` int(11) NOT NULL COMMENT 'site_id',
                                    `timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'timestamp',
                                    `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'type',
                                    `version` int(11) NULL DEFAULT NULL COMMENT 'version',
                                    `status` int(11) NULL DEFAULT NULL,
                                    `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'data',
                                    PRIMARY KEY (`report_id`, `site_id`) USING BTREE,
                                    INDEX `Identifier_1`(`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备数据上报' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dev_data_report
-- ----------------------------
INSERT INTO `dev_data_report` VALUES (15, 5, '2023-02-27 14:26:25', 'report', 1, 0, '{\"tmp\":54.41,\"lx\":691.27,\"hmt\":0.55}');
INSERT INTO `dev_data_report` VALUES (16, 4, '2023-02-27 14:26:27', 'report', 1, 0, '{\"tmp\":5.25,\"lx\":96.29,\"hmt\":0.12}');
INSERT INTO `dev_data_report` VALUES (17, 4, '2023-02-27 14:26:28', 'report', 1, 0, '{\"tmp\":58.32,\"lx\":803.26,\"hmt\":0.04}');
INSERT INTO `dev_data_report` VALUES (18, 1, '2023-02-27 14:26:29', 'report', 1, 0, '{\"tmp\":42.93,\"lx\":697.29,\"hmt\":0.75}');
INSERT INTO `dev_data_report` VALUES (19, 3, '2023-02-27 14:26:30', 'report', 1, 0, '{\"tmp\":30.05,\"lx\":2.06,\"hmt\":0.68}');
INSERT INTO `dev_data_report` VALUES (20, 1, '2023-02-27 14:26:31', 'report', 1, 0, '{\"tmp\":94.72,\"lx\":82.61,\"hmt\":0.79}');
INSERT INTO `dev_data_report` VALUES (21, 1, '2023-02-27 14:26:32', 'report', 1, 0, '{\"tmp\":3.79,\"lx\":224.8,\"hmt\":0.53}');
INSERT INTO `dev_data_report` VALUES (22, 2, '2023-02-27 14:26:33', 'report', 1, 0, '{\"tmp\":84.99,\"lx\":872.38,\"hmt\":0.52}');
INSERT INTO `dev_data_report` VALUES (23, 5, '2023-02-27 14:26:34', 'report', 1, 0, '{\"tmp\":37.27,\"lx\":695.96,\"hmt\":0.99}');
INSERT INTO `dev_data_report` VALUES (24, 1, '2023-02-27 14:26:35', 'report', 1, 0, '{\"tmp\":23.36,\"lx\":200.89,\"hmt\":0.45}');
INSERT INTO `dev_data_report` VALUES (25, 3, '2023-02-27 14:26:36', 'report', 1, 0, '{\"tmp\":67.43,\"lx\":189.84,\"hmt\":0.2}');
INSERT INTO `dev_data_report` VALUES (26, 5, '2023-02-27 14:26:37', 'report', 1, 0, '{\"tmp\":52.42,\"lx\":160.99,\"hmt\":0.14}');
INSERT INTO `dev_data_report` VALUES (27, 2, '2023-02-27 14:26:38', 'report', 1, 0, '{\"tmp\":15.02,\"lx\":246.85,\"hmt\":0.76}');
INSERT INTO `dev_data_report` VALUES (28, 4, '2023-02-27 14:26:39', 'report', 1, 0, '{\"tmp\":20.25,\"lx\":682.39,\"hmt\":0.04}');

-- ----------------------------
-- Table structure for dev_monitor_config
-- ----------------------------
DROP TABLE IF EXISTS `dev_monitor_config`;
CREATE TABLE `dev_monitor_config`  (
                                       `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'config_id',
                                       `site_id` int(11) NOT NULL COMMENT 'site_id;',
                                       `timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'timestamp;',
                                       `version` int(11) NULL DEFAULT NULL COMMENT 'version;',
                                       `interval` int(11) NULL DEFAULT NULL COMMENT 'interval;',
                                       `is_delete` int(11) NULL DEFAULT NULL COMMENT 'is_delete;',
                                       `monitor_items` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'monitor_items;',
                                       PRIMARY KEY (`config_id`) USING BTREE,
                                       INDEX `report_idx`(`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '监控配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dev_monitor_config
-- ----------------------------
INSERT INTO `dev_monitor_config` VALUES (3, 10, '2023-03-07 01:47:58', 1, 2, 1, '{\"tmp\":{\"max\":\"20.6\",\"min\":\"27.2\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"2000\",\"min\":\"0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.1\",\"min\":\"0.8\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (4, 12, '2023-03-07 02:19:26', 1, 20, 0, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"10.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.9\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (5, 1, '2023-03-07 02:19:26', 1, 20, 0, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"10.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.9\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (6, 2, '2023-03-07 02:19:26', 1, 20, 0, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"10.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.9\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (7, 3, '2023-03-07 02:19:26', 1, 20, 0, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"10.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.9\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (8, 4, '2023-03-07 02:19:26', 1, 20, 0, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"10.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.9\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (9, 5, '2023-03-07 02:19:26', 1, 20, 0, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"10.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.9\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');

-- ----------------------------
-- Table structure for dev_site
-- ----------------------------
DROP TABLE IF EXISTS `dev_site`;
CREATE TABLE `dev_site`  (
                             `site_id` int(11) NOT NULL AUTO_INCREMENT,
                             `site_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                             `lon` decimal(18, 14) NULL DEFAULT NULL,
                             `lat` decimal(18, 14) NULL DEFAULT NULL,
                             `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                             `update_time` datetime(0) NULL DEFAULT NULL,
                             `create_time` datetime(0) NULL DEFAULT NULL,
                             `create_user` int(11) NULL DEFAULT NULL,
                             `is_delete` int(11) NULL DEFAULT NULL,
                             PRIMARY KEY (`site_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dev_site
-- ----------------------------
INSERT INTO `dev_site` VALUES (1, 'IMAP_SITE_001', 121.65796481150367, 31.27103070027770, 'http://192.168.2.12:5000/device/1', '2023-02-27 11:41:03', '2022-10-07 22:41:02', 1, 0);
INSERT INTO `dev_site` VALUES (2, 'IMAP_SITE_002', 116.39747700000000, 39.90869200000000, 'http://localhost:5000/device/2', '2023-02-27 11:41:03', '2022-10-07 22:41:02', 1, 0);
INSERT INTO `dev_site` VALUES (3, 'IMAP_SITE_003', 120.39747700000000, 35.90869200000000, 'http://localhost:5000/device/2', '2023-02-27 11:41:03', '2022-10-07 22:41:02', 1, 0);
INSERT INTO `dev_site` VALUES (4, 'IMAP_SITE_004', 121.39747700000000, 37.90869200000000, 'http://localhost:5000/device/2', '2023-02-27 11:41:03', '2022-10-07 22:41:02', 1, 0);
INSERT INTO `dev_site` VALUES (5, 'IMAP_SITE_005', 119.39747700000000, 39.90869200000000, 'http://localhost:5000/device/2', '2023-02-27 11:41:03', '2022-10-07 22:41:02', 1, 0);
INSERT INTO `dev_site` VALUES (10, '测试', 20.00000000000000, 20.00000000000000, 'url', '2023-03-07 01:47:58', '2023-03-07 01:47:58', 1, 1);
INSERT INTO `dev_site` VALUES (12, 'IMAP_测试', 60.00000000000000, 20.00000000000000, 'url', '2023-03-07 02:19:26', '2023-03-07 02:19:26', 1, 0);

-- ----------------------------
-- Table structure for dev_site_photo
-- ----------------------------
DROP TABLE IF EXISTS `dev_site_photo`;
CREATE TABLE `dev_site_photo`  (
                                   `photo_id` int(11) NOT NULL AUTO_INCREMENT,
                                   `site_id` int(11) NULL DEFAULT NULL,
                                   `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                   `create_time` timestamp(0) NULL DEFAULT NULL,
                                   PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点照片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dev_site_photo
-- ----------------------------
INSERT INTO `dev_site_photo` VALUES (1, 1, 'http://localhost:8080/img/upload/1.jpg', '2022-11-15 08:53:16');
INSERT INTO `dev_site_photo` VALUES (2, 1, 'http://localhost:8080/img/upload/2.jpg', '2022-11-15 08:53:20');
INSERT INTO `dev_site_photo` VALUES (3, 1, 'http://localhost:8080/img/upload/3.jpg', '2022-11-15 08:53:20');
INSERT INTO `dev_site_photo` VALUES (4, 1, 'http://localhost:8080/img/upload/4.jpg', '2022-11-15 08:53:21');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
                             `menu_id` int(11) NOT NULL AUTO_INCREMENT,
                             `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                             `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                             `parent_id` int(11) NULL DEFAULT NULL,
                             `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                             `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                             PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
                             `role_id` int(11) NOT NULL AUTO_INCREMENT,
                             `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                             `create_time` datetime(0) NULL DEFAULT NULL,
                             `create_user` int(11) NULL DEFAULT NULL,
                             `is_delete` int(11) NULL DEFAULT 0,
                             `role_level` int(11) NULL DEFAULT NULL,
                             `update_time` timestamp(0) NULL DEFAULT NULL,
                             PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '2022-09-27 19:36:43', 1, 0, 0, '2022-11-16 09:22:25');
INSERT INTO `sys_role` VALUES (2, '高级用户', '2022-09-27 19:37:06', 1, 0, 1, '2022-11-16 09:22:27');
INSERT INTO `sys_role` VALUES (3, '普通用户', '2022-09-27 19:37:20', 1, 0, 2, '2022-11-16 14:06:17');
INSERT INTO `sys_role` VALUES (4, '高级用户2', '2022-09-27 19:37:06', 1, 0, 1, '2022-11-16 09:22:27');
INSERT INTO `sys_role` VALUES (5, '测试2', '2022-09-27 19:36:43', 1, 1, 2, '2022-09-27 19:36:43');
INSERT INTO `sys_role` VALUES (7, '测试的角色', '2022-11-16 14:06:31', 1, 1, 3, '2022-11-16 14:06:31');
INSERT INTO `sys_role` VALUES (8, '低级用户', '2022-12-12 13:29:32', 1, 1, 3, '2022-12-12 13:29:32');
INSERT INTO `sys_role` VALUES (9, '低级用户', '2022-12-12 13:49:22', 1, 0, 3, '2022-12-12 13:49:22');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
                                  `role_id` int(11) NOT NULL,
                                  `menu_id` int(11) NOT NULL,
                                  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
                                  INDEX `FK_sys_role_menu2`(`menu_id`) USING BTREE,
                                  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                                  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色-菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
                             `user_id` int(11) NOT NULL AUTO_INCREMENT,
                             `login_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                             `login_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                             `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                             `sex` int(11) NULL DEFAULT NULL,
                             `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                             `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                             `last_login_time` datetime(0) NULL DEFAULT NULL,
                             `ipaddr` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                             `create_time` datetime(0) NULL DEFAULT NULL,
                             `create_user` int(11) NULL DEFAULT NULL,
                             `is_delete` int(11) NULL DEFAULT NULL,
                             `update_time` datetime(0) NULL DEFAULT NULL,
                             PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '123456', 'admin', 1, '13312344568', 'admin@fims.com', NULL, NULL, '2022-10-08 12:13:34', 1, 0, '2022-10-21 09:24:52');
INSERT INTO `sys_user` VALUES (2, 'admin1', '123456', 'admin1', 1, '13312344567', 'admin@fims.com', NULL, NULL, '2022-10-08 12:13:36', 1, 0, NULL);
INSERT INTO `sys_user` VALUES (3, 'test', '123456', 'test', 2, '13312344567', 'admin@fims.com', NULL, NULL, '2022-10-08 12:13:39', 3, 0, NULL);
INSERT INTO `sys_user` VALUES (5, 'test2', '123456', '测试2', 0, '13255547856', '21@test.com', NULL, NULL, '2022-10-08 17:02:31', 1, 0, NULL);
INSERT INTO `sys_user` VALUES (8, '测试', '123456', '测试', 1, '', '', NULL, NULL, '2022-11-23 08:58:07', 1, 1, NULL);
INSERT INTO `sys_user` VALUES (9, '测试22', '123456', '测试22', 1, '15317852610', '123@qq.com', NULL, NULL, '2022-11-23 09:10:22', 1, 1, NULL);
INSERT INTO `sys_user` VALUES (12, 'user1', '123456', '测试用户1', 1, '', '', NULL, NULL, '2022-12-12 13:24:22', 1, 0, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
                                  `user_id` int(11) NOT NULL,
                                  `role_id` int(11) NOT NULL,
                                  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
                                  INDEX `FK_sys_user_role2`(`role_id`) USING BTREE,
                                  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                                  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户-角色信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (12, 3);

SET FOREIGN_KEY_CHECKS = 1;
