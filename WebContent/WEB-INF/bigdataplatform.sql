/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : bigdataplatform

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-02-25 22:58:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `device`
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `dev_id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_name` varchar(255) DEFAULT NULL,
  `pro_id` int(11) DEFAULT NULL,
  `for_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dev_id`),
  KEY `pro_id` (`pro_id`),
  KEY `for_id` (`for_id`),
  CONSTRAINT `for_id` FOREIGN KEY (`for_id`) REFERENCES `format` (`for_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pro_id` FOREIGN KEY (`pro_id`) REFERENCES `project` (`pro_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('2', 'device_0', '1', '5');
INSERT INTO `device` VALUES ('3', 'device_1', '1', '5');
INSERT INTO `device` VALUES ('4', 'device_2', '1', '5');
INSERT INTO `device` VALUES ('5', 'newdevice_0', '1', '5');
INSERT INTO `device` VALUES ('6', 'newdevice_1', '1', '5');

-- ----------------------------
-- Table structure for `format`
-- ----------------------------
DROP TABLE IF EXISTS `format`;
CREATE TABLE `format` (
  `for_id` int(11) NOT NULL AUTO_INCREMENT,
  `for_name` varchar(255) DEFAULT NULL,
  `for_namelist` varchar(255) DEFAULT NULL,
  `for_typelist` varchar(255) DEFAULT NULL,
  `pro_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`for_id`),
  KEY `pro_id1` (`pro_id`),
  CONSTRAINT `pro_id1` FOREIGN KEY (`pro_id`) REFERENCES `project` (`pro_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of format
-- ----------------------------
INSERT INTO `format` VALUES ('5', 'GPS', 'lat,lon,time', 'varchar,varchar,varchar', '1');

-- ----------------------------
-- Table structure for `gps_1`
-- ----------------------------
DROP TABLE IF EXISTS `gps_1`;
CREATE TABLE `gps_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` varchar(255) DEFAULT NULL,
  `lon` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `pro_id` int(11) DEFAULT NULL,
  `dev_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pro_id` (`pro_id`),
  KEY `dev_id` (`dev_id`),
  CONSTRAINT `gps_1_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `project` (`pro_id`) ON DELETE CASCADE,
  CONSTRAINT `gps_1_ibfk_2` FOREIGN KEY (`dev_id`) REFERENCES `device` (`dev_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gps_1
-- ----------------------------
INSERT INTO `gps_1` VALUES ('1', '2', '3', '4', '1', '2');
INSERT INTO `gps_1` VALUES ('2', '22', '33', '44', '1', '2');
INSERT INTO `gps_1` VALUES ('3', '1', '5', '8', '1', '2');
INSERT INTO `gps_1` VALUES ('4', '5', '3', '2', '1', '2');
INSERT INTO `gps_1` VALUES ('5', '3', '6', '1', '1', '2');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(255) DEFAULT NULL,
  `pro_info` varchar(255) DEFAULT NULL,
  `u_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'X', 'X', 'liu');
INSERT INTO `project` VALUES ('2', 'A', 'A', 'liu');
INSERT INTO `project` VALUES ('3', 'fefe', 'fefe', 'liu');
INSERT INTO `project` VALUES ('4', 'f', 'f', 'liu');
INSERT INTO `project` VALUES ('5', 'abc', 'abc', 'liu');
INSERT INTO `project` VALUES ('6', 'haha', 'haha', 'liu');
INSERT INTO `project` VALUES ('7', 'project1', 'project1', 'liu');
INSERT INTO `project` VALUES ('8', 'project2', 'project2', 'liu');
INSERT INTO `project` VALUES ('9', 'p3', 'p3', 'liu');
INSERT INTO `project` VALUES ('10', 'p4', 'p4', 'liu');
INSERT INTO `project` VALUES ('11', 'p5', 'p5', 'liu');
INSERT INTO `project` VALUES ('12', 'fff', 'fff', 'liu');
INSERT INTO `project` VALUES ('13', 'X', 'X', 'l');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'varchar');
INSERT INTO `type` VALUES ('2', 'int');
INSERT INTO `type` VALUES ('3', 'float');
INSERT INTO `type` VALUES ('4', 'double');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) DEFAULT NULL,
  `u_password` varchar(255) DEFAULT NULL,
  `u_identity` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'liu', 'liu', '1');
