/*
 Navicat Premium Data Transfer

 Source Server         : cm
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : web_bank

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 18/11/2019 08:49:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `aid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '账号',
  `acid` int(11) NOT NULL COMMENT '客户编号',
  `aopendate` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '开卡日期',
  `abalance` double NOT NULL COMMENT '余额',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (101, 1, '2019-11-16 19:01:13', 50);
INSERT INTO `account` VALUES (102, 2, '2019-11-16 23:12:10', 0);
INSERT INTO `account` VALUES (103, 3, '2019-11-16 23:12:45', 500);
INSERT INTO `account` VALUES (113, 9, '2019-11-16 19:06:48', 1000);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户编号',
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `cpassword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `cregdate` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '注册日期',
  `lastdate` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次登录时间',
  `caddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户地址',
  `cemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户电子邮箱',
  `cphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户电话号码',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '小明', '123456', '2019-11-16 13:57:11', '2019-11-16 13:57:11', '湖北武汉', '2224590714@qq.com', '17720597727');
INSERT INTO `customer` VALUES (2, '小红', 'zxcvbn', '2019-11-16 13:57:27', '2019-11-16 13:57:27', '北京朝阳区', '2046749835@qq.com', '18971385628');
INSERT INTO `customer` VALUES (3, '小黄', 'asdf', '2019-11-16 13:57:48', '2019-11-16 13:57:48', '上海', '1111111111@163.com', '110   ');
INSERT INTO `customer` VALUES (9, '123', '111', '2019-11-16 16:50:31', '2019-11-16 16:50:31', '111', '111', '111');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易记录编号',
  `rtransdate` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '日志生成时间',
  `raidfrom` int(11) NOT NULL COMMENT '取款、存款、转账对应操作账号',
  `raidto` int(11) NULL DEFAULT NULL COMMENT '转账到对应的账号',
  `rtranstype` int(11) NOT NULL COMMENT '交易类型：转账3，存款1，取款2',
  `rtranssummary` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `rabalance` double NOT NULL COMMENT '当前余额',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, '2019-11-16 19:03:53', 101, 102, 3, '给钱你用！', 50);
INSERT INTO `record` VALUES (2, '2019-11-16 19:02:58', 102, NULL, 2, '取钱花！', 0);
INSERT INTO `record` VALUES (3, '2019-11-16 19:04:37', 103, NULL, 1, '666', 100);
INSERT INTO `record` VALUES (4, '2019-11-16 19:06:26', 109, NULL, 2, NULL, 900);
INSERT INTO `record` VALUES (5, '2019-11-16 20:49:22', 0, NULL, 1, '100', 400);
INSERT INTO `record` VALUES (6, '2019-11-16 20:51:34', 103, NULL, 1, '123455', 500);
INSERT INTO `record` VALUES (7, '2019-11-16 20:52:51', 103, NULL, 2, '123', 300);
INSERT INTO `record` VALUES (14, '2019-11-16 21:32:10', 103, 102, 3, '阿萨德', 100);
INSERT INTO `record` VALUES (15, '2019-11-16 21:39:41', 102, 2, 3, '123', 0);
INSERT INTO `record` VALUES (20, '2019-11-16 21:46:47', 103, NULL, 1, '娃哈哈', 600);
INSERT INTO `record` VALUES (21, '2019-11-16 21:47:35', 103, NULL, 2, '哈哈哇', 500);
INSERT INTO `record` VALUES (22, '2019-11-16 23:11:17', 103, 102, 3, '', 300);
INSERT INTO `record` VALUES (23, '2019-11-16 23:11:59', 102, NULL, 2, '', 0);
INSERT INTO `record` VALUES (24, '2019-11-16 23:12:38', 103, NULL, 1, '', 500);

SET FOREIGN_KEY_CHECKS = 1;
