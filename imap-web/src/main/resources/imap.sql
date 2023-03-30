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

 Date: 30/03/2023 08:39:44
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
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备告警信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dev_alarm
-- ----------------------------
INSERT INTO `dev_alarm` VALUES (1, 1, 3, '设备异常', 1, '2022-10-08 10:31:24');
INSERT INTO `dev_alarm` VALUES (22, 1, 0, '温度过高：50.0℃', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (23, 1, 1, '湿度过高：90.0%', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (24, 2, 2, '亮度异常', 1, '2023-02-08 10:31:24');
INSERT INTO `dev_alarm` VALUES (25, 1, 3, '设备异常', 1, '2022-10-07 10:31:24');
INSERT INTO `dev_alarm` VALUES (28, 3, 1, '湿度过高：90.0%', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (29, 3, 1, '湿度过高：80.0%', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (30, 4, 2, '亮度异常', 0, '2023-02-08 10:31:24');
INSERT INTO `dev_alarm` VALUES (31, 5, 3, '设备异常', 1, '2023-02-08 10:31:24');
INSERT INTO `dev_alarm` VALUES (32, 5, 3, '设备异常', 1, '2023-02-08 10:31:24');
INSERT INTO `dev_alarm` VALUES (33, 1, 1, '湿度过高：90.0%', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (34, 1, 1, '湿度过高：90.0%', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (35, 1, 2, '亮度异常', 1, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (36, 1, 0, '温度过高：50.0℃', 0, '2023-01-08 13:15:49');
INSERT INTO `dev_alarm` VALUES (37, 1, 0, '温度异常: 当前值为：99.96 参考值为：10.0 ~ 60.0', 0, '2023-03-08 17:38:16');
INSERT INTO `dev_alarm` VALUES (38, 1, 1, '湿度异常: 当前值为：0.91 参考值为：0.1 ~ 0.9', 0, '2023-03-08 17:38:16');
INSERT INTO `dev_alarm` VALUES (42, 1, 1, '湿度异常: 当前值为：0.99 参考值为：0.1 ~ 0.9', 1, '2023-03-08 17:38:16');
INSERT INTO `dev_alarm` VALUES (43, 1, 1, '湿度异常: 当前值为：0.99 参考值为：0.1 ~ 0.9', 1, '2023-03-08 17:38:16');
INSERT INTO `dev_alarm` VALUES (45, 1, 1, '湿度异常: 当前值为：0.98 参考值为：0.1 ~ 0.9', 1, '2023-03-08 17:38:16');
INSERT INTO `dev_alarm` VALUES (46, 2, 0, '温度异常: 当前值为：2000.96 参考值为：10.0 ~ 60.0', 1, '2023-03-08 18:39:21');
INSERT INTO `dev_alarm` VALUES (47, 1, 1, '湿度异常: 当前值为：0.6986 参考值为：0.1 ~ 0.5', 1, '2023-03-13 13:05:42');
INSERT INTO `dev_alarm` VALUES (48, 1, 1, '湿度异常: 当前值为：0.6878 参考值为：0.1 ~ 0.5', 0, '2023-03-13 13:05:48');
INSERT INTO `dev_alarm` VALUES (49, 1, 1, '湿度异常: 当前值为：0.4094 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:40:56');
INSERT INTO `dev_alarm` VALUES (50, 1, 1, '湿度异常: 当前值为：0.41009999999999996 参考值为：0.1 ~ 0.3', 1, '2023-03-13 18:41:01');
INSERT INTO `dev_alarm` VALUES (51, 1, 1, '湿度异常: 当前值为：0.40979999999999994 参考值为：0.1 ~ 0.3', 1, '2023-03-13 18:41:06');
INSERT INTO `dev_alarm` VALUES (52, 1, 1, '湿度异常: 当前值为：0.4117 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:41:11');
INSERT INTO `dev_alarm` VALUES (53, 1, 1, '湿度异常: 当前值为：0.4122 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:41:17');
INSERT INTO `dev_alarm` VALUES (54, 1, 1, '湿度异常: 当前值为：0.4118 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:41:22');
INSERT INTO `dev_alarm` VALUES (55, 1, 1, '湿度异常: 当前值为：0.4114 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:41:27');
INSERT INTO `dev_alarm` VALUES (56, 1, 1, '湿度异常: 当前值为：0.4114 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:41:32');
INSERT INTO `dev_alarm` VALUES (57, 1, 1, '湿度异常: 当前值为：0.41259999999999997 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:41:37');
INSERT INTO `dev_alarm` VALUES (58, 1, 1, '湿度异常: 当前值为：0.4129 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:41:42');
INSERT INTO `dev_alarm` VALUES (59, 1, 1, '湿度异常: 当前值为：0.41229999999999994 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:41:47');
INSERT INTO `dev_alarm` VALUES (60, 1, 1, '湿度异常: 当前值为：0.41090000000000004 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:41:52');
INSERT INTO `dev_alarm` VALUES (61, 1, 1, '湿度异常: 当前值为：0.4119 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:41:57');
INSERT INTO `dev_alarm` VALUES (62, 1, 1, '湿度异常: 当前值为：0.4108 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:42:02');
INSERT INTO `dev_alarm` VALUES (63, 1, 1, '湿度异常: 当前值为：0.4107 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:42:07');
INSERT INTO `dev_alarm` VALUES (64, 1, 1, '湿度异常: 当前值为：0.4115 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:42:12');
INSERT INTO `dev_alarm` VALUES (65, 1, 1, '湿度异常: 当前值为：0.41159999999999997 参考值为：0.1 ~ 0.3', 0, '2023-03-13 18:42:17');
INSERT INTO `dev_alarm` VALUES (66, 1, 0, '温度异常: 当前值为：88.8 参考值为：0.0 ~ 22.2', 0, '2023-03-23 00:08:38');
INSERT INTO `dev_alarm` VALUES (67, 1, 0, '温度异常: 当前值为：88.8 参考值为：0.0 ~ 22.2', 0, '2023-03-23 00:08:48');
INSERT INTO `dev_alarm` VALUES (68, 2, 0, '温度异常: 当前值为：88.8 参考值为：0.0 ~ 22.2', 0, '2023-03-23 00:08:48');

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
INSERT INTO `dev_data_report` VALUES (18, 1, '2023-03-15 01:46:25', 'report', 1, 0, '{\"tmp\":22.92,\"lx\":53.0,\"hmt\":0.48729999999999996}');
INSERT INTO `dev_data_report` VALUES (19, 3, '2023-02-27 14:26:30', 'report', 1, 0, '{\"tmp\":30.05,\"lx\":2.06,\"hmt\":0.68}');
INSERT INTO `dev_data_report` VALUES (22, 2, '2023-03-09 02:39:21', 'report', 1, 0, '{\"tmp\":2000.96,\"lx\":163.86,\"hmt\":0.68}');

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '监控配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dev_monitor_config
-- ----------------------------
INSERT INTO `dev_monitor_config` VALUES (3, 10, '2023-03-07 01:47:58', 1, 2, 1, '{\"tmp\":{\"max\":\"20.6\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"2000\",\"min\":\"0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.1\",\"min\":\"0.8\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (4, 12, '2023-03-13 00:17:55', 2, 20, 1, '{\"tmp\":{\"max\":60.0,\"min\":0.0,\"open\":1,\"type\":\"tmp\"},\"lx\":{\"max\":10000.0,\"min\":0.0,\"open\":0,\"type\":\"lx\"},\"hmt\":{\"max\":0.9,\"min\":0.1,\"open\":1,\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (5, 1, '2023-03-14 23:07:55', 19, 5, 0, '{\"tmp\":{\"max\":60.0,\"min\":-10.2,\"open\":1,\"type\":\"tmp\"},\"lx\":{\"max\":10000.0,\"min\":0.0,\"open\":1,\"type\":\"lx\"},\"hmt\":{\"max\":0.6,\"min\":0.1,\"open\":1,\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (6, 2, '2023-03-07 02:19:26', 1, 20, 0, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.9\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (7, 3, '2023-03-07 02:19:26', 1, 20, 0, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.9\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (8, 4, '2023-03-07 02:19:26', 1, 20, 0, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.9\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (9, 5, '2023-03-07 02:19:26', 1, 20, 0, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.9\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (10, 13, '2023-03-08 01:42:45', 1, 30, 1, '{\"tmp\":{\"max\":\"80.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"5000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.8\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (11, 14, '2023-03-08 02:25:48', 4, 30, 1, '{\"tmp\":{\"max\":\"80.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"6000.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"0.8\",\"min\":\"0.1\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (12, 15, '2023-03-08 02:44:23', 2, 20, 1, '{\"tmp\":{\"max\":\"50.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"2000.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"lx\"},\"hmt\":{\"max\":\"1.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (13, 16, '2023-03-12 23:42:46', 1, 60, 1, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"-5.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"lx\"},\"hmt\":{\"max\":\"1.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (14, 17, '2023-03-12 23:42:46', 1, 60, 1, '{\"tmp\":{\"max\":\"60.0\",\"min\":\"-5.0\",\"open\":\"1\",\"type\":\"tmp\"},\"lx\":{\"max\":\"10000.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"lx\"},\"hmt\":{\"max\":\"1.0\",\"min\":\"0.0\",\"open\":\"1\",\"type\":\"hmt\"}}');
INSERT INTO `dev_monitor_config` VALUES (15, 18, '2023-03-12 23:57:44', 1, 60, 1, '{\"tmp\":{\"max\":\"1.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"tmp\"},\"lx\":{\"max\":\"1.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"lx\"},\"hmt\":{\"max\":\"1.0\",\"min\":\"0.0\",\"open\":\"0\",\"type\":\"hmt\"}}');

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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dev_site
-- ----------------------------
INSERT INTO `dev_site` VALUES (1, 'IMAP_SSPU_001', 121.65796481150367, 31.27103070027770, 'http://180.160.119.78:5000/device/1', '2023-03-14 23:07:55', '2022-10-07 22:41:02', 1, 0);
INSERT INTO `dev_site` VALUES (2, 'IMAP_SU_002', 120.63698048198502, 31.32943041240300, 'http://localhost:5000/device/2', '2023-02-27 11:41:03', '2022-10-07 22:41:02', 1, 0);
INSERT INTO `dev_site` VALUES (3, 'IMAP_NAN_003', 118.78575033387865, 32.05640659315841, 'http://localhost:5000/device/2', '2023-02-27 11:41:03', '2022-10-07 22:41:02', 1, 0);
INSERT INTO `dev_site` VALUES (4, 'IMAP_DONG_004', 121.50624740542344, 31.24551844510179, 'http://localhost:5000/device/2', '2023-02-27 11:41:03', '2022-10-07 22:41:02', 1, 0);
INSERT INTO `dev_site` VALUES (5, 'IMAP_DI_005', 121.66866105173406, 31.15444437621832, 'http://localhost:5000/device/2', '2023-02-27 11:41:03', '2022-10-07 22:41:02', 1, 0);
INSERT INTO `dev_site` VALUES (10, '测试', 20.00000000000000, 20.00000000000000, 'url', '2023-03-07 01:47:58', '2023-03-07 01:47:58', 1, 1);
INSERT INTO `dev_site` VALUES (12, 'IMAP_测试', 60.00000000000000, 22.00000000000000, 'url', '2023-03-13 00:17:55', '2023-03-07 02:19:26', 1, 1);
INSERT INTO `dev_site` VALUES (13, '测试站点2', 20.00000000000000, 2.00000000000000, 'url', '2023-03-08 01:42:45', '2023-03-08 01:42:45', 1, 1);
INSERT INTO `dev_site` VALUES (14, '测试站点5', 50.00000000000000, 2.00000000000000, 'url', '2023-03-08 02:25:48', '2023-03-08 01:45:53', 2, 1);
INSERT INTO `dev_site` VALUES (15, '测试2', 23.00000000000000, 20.00000000000000, '20', '2023-03-08 02:44:23', '2023-03-08 02:43:22', 2, 1);
INSERT INTO `dev_site` VALUES (16, 'IMAP_Test', 135.00000000000000, 23.50000000000000, 'localhosts:8080', '2023-03-12 23:42:46', '2023-03-12 23:42:46', 1, 1);
INSERT INTO `dev_site` VALUES (17, 'IMAP_Test', 135.00000000000000, 23.50000000000000, 'localhosts:8080', '2023-03-12 23:42:46', '2023-03-12 23:42:46', 1, 1);
INSERT INTO `dev_site` VALUES (18, 'ces', 20.00000000000000, 60.00000000000000, 'url', '2023-03-12 23:57:44', '2023-03-12 23:57:44', 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点照片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dev_site_photo
-- ----------------------------
INSERT INTO `dev_site_photo` VALUES (1, 1, '1.jpg', '2022-11-15 08:53:16');
INSERT INTO `dev_site_photo` VALUES (2, 1, '2.jpg', '2022-11-15 08:53:20');
INSERT INTO `dev_site_photo` VALUES (3, 1, '3.jpg', '2022-11-15 08:53:20');
INSERT INTO `dev_site_photo` VALUES (4, 1, '4.jpg', '2022-11-15 08:53:21');
INSERT INTO `dev_site_photo` VALUES (5, 1, '5.jpg', '2022-11-15 08:53:21');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
                             `role_id` int(11) NOT NULL AUTO_INCREMENT,
                             `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                             `role_config` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                             `create_user` int(11) NULL DEFAULT NULL,
                             `create_time` datetime(0) NULL DEFAULT NULL,
                             `update_time` datetime(0) NULL DEFAULT NULL,
                             `is_delete` int(11) NULL DEFAULT 0,
                             PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'online;history;user;role;site;alarm', 1, '2022-09-27 19:36:43', '2022-11-16 09:22:25', 0);
INSERT INTO `sys_role` VALUES (2, '高级用户', 'online;history;site;alarm', 1, '2023-03-19 22:19:13', '2023-03-19 22:58:59', 0);
INSERT INTO `sys_role` VALUES (3, '普通用户', 'online;history;alarm', 1, '2023-03-19 23:49:22', '2023-03-19 23:49:22', 0);
INSERT INTO `sys_role` VALUES (4, '监控用户', 'online', 1, '2023-03-19 23:49:40', '2023-03-19 23:49:40', 0);

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
                             `create_time` datetime(0) NULL DEFAULT NULL,
                             `create_user` int(11) NULL DEFAULT NULL,
                             `is_delete` int(11) NULL DEFAULT NULL,
                             `update_time` datetime(0) NULL DEFAULT NULL,
                             PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '123456', 'admin', 1, '13312344568', 'admin@fims.com', '2022-10-08 12:13:34', 1, 0, '2022-10-21 09:24:52');
INSERT INTO `sys_user` VALUES (2, 'admin1', '123456', 'admin1', 1, '13312344567', 'admin@fims.com', '2022-10-08 12:13:36', 1, 0, NULL);
INSERT INTO `sys_user` VALUES (3, 'test', '123456', 'test', 0, '13312344567', 'admin@fims.com', '2022-10-08 12:13:39', 3, 0, '2023-03-19 23:53:19');
INSERT INTO `sys_user` VALUES (4, 'imap', '123456', '王经理', 1, '13999998888', '1456416969@qq.com', '2023-03-19 23:50:39', 1, 0, '2023-03-19 23:55:00');
INSERT INTO `sys_user` VALUES (5, 'user1', '123456', '李明', 1, '13999998888', '1456416969@qq.com', '2023-03-19 23:52:49', 1, 0, NULL);
INSERT INTO `sys_user` VALUES (6, 'ob', '123456', '监控大屏', 1, '', '', '2023-03-19 23:54:26', 1, 0, NULL);

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
INSERT INTO `sys_user_role` VALUES (2, 1);
INSERT INTO `sys_user_role` VALUES (3, 1);
INSERT INTO `sys_user_role` VALUES (4, 2);
INSERT INTO `sys_user_role` VALUES (5, 3);
INSERT INTO `sys_user_role` VALUES (6, 4);

SET FOREIGN_KEY_CHECKS = 1;
