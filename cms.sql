/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50130
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2017-06-22 18:40:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_article`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article`;
CREATE TABLE `tbl_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `clickTimes` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `publishDate` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `c_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKE9859575C06FB1C7` (`c_id`),
  CONSTRAINT `FKE9859575C06FB1C7` FOREIGN KEY (`c_id`) REFERENCES `tbl_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_article
-- ----------------------------
INSERT INTO `tbl_article` VALUES ('2', '祁朋', '10', '”病马“，原名”冯永明“，又名”小马哥“。', null, '病马的传奇一生', '1');
INSERT INTO `tbl_article` VALUES ('22', '祁朋朋', '4', '腾讯科技 雷建平 3月20日报道\n随着腾讯日前公布财报，国内互联网三大巨头腾讯、阿里、百度2014年第四季度业绩已揭晓。从年度数据对比看，腾讯营收指标相对领先，阿里追赶势头明显，百度相对落伍。', '2017-06-20 10:19:30', '腾讯科技新闻', '1');
INSERT INTO `tbl_article` VALUES ('23', '1', '2', '1111111', '2017-06-20 16:31:13', '开始打架你回复电视剧你看就咖色尽可能放假可能', '2');
INSERT INTO `tbl_article` VALUES ('24', 'zz', '4', 'zz', '2017-06-21 11:08:06', 'zz', '1');
INSERT INTO `tbl_article` VALUES ('25', 'aa', '1', 'aa', '2017-06-21 11:11:22', 'aa', '1');
INSERT INTO `tbl_article` VALUES ('26', 'qq', '2', 'qqq', '2017-06-21 11:22:29', 'qq', '1');
INSERT INTO `tbl_article` VALUES ('29', '4', '3', '44', '2017-06-21 17:06:03', '4', '1');
INSERT INTO `tbl_article` VALUES ('30', '小七', '1', '亲爱的姑娘', '2017-06-22 09:45:15', '亲爱的姑娘', '1');

-- ----------------------------
-- Table structure for `tbl_basicinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_basicinfo`;
CREATE TABLE `tbl_basicinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_basicinfo
-- ----------------------------
INSERT INTO `tbl_basicinfo` VALUES ('1', '杰普软件科技有限公司', '昆山市巴城学院路828号', 'Copyright @ 2016 by Briup Technology,Inc. , All rights Reserved. ICP 05024518');

-- ----------------------------
-- Table structure for `tbl_category`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO `tbl_category` VALUES ('1', '2', '歌唱大赛');
INSERT INTO `tbl_category` VALUES ('2', '2', '中国好声音');
INSERT INTO `tbl_category` VALUES ('3', '3', '中期检查');
INSERT INTO `tbl_category` VALUES ('12', '5', '哈哈哈大赛');
INSERT INTO `tbl_category` VALUES ('15', '12', '我我我');

-- ----------------------------
-- Table structure for `tbl_link`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_link`;
CREATE TABLE `tbl_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_link
-- ----------------------------
INSERT INTO `tbl_link` VALUES ('2', '百度', 'www.baidu.com');
INSERT INTO `tbl_link` VALUES ('3', '新浪', 'www.sina.cn');
INSERT INTO `tbl_link` VALUES ('5', '搜狐新闻', 'www.xinwen.souhu.com');
