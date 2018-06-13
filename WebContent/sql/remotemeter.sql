/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : remotemeter

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-07 20:49:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(15) NOT NULL,
  `code_a` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `code_c` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`code_a`),
  KEY `FK_Reference_9` (`code_c`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`code_c`) REFERENCES `city` (`code_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ʵ��Ϊ�������򻮷ֵȼ�';

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(15) NOT NULL,
  `code_c` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `code_p` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`code_c`),
  KEY `FK_Reference_10` (`code_p`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`code_p`) REFERENCES `province` (`code_p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ʵ��Ϊ�������򻮷ֵȼ�';

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `type` varchar(5) NOT NULL COMMENT '������Ϊÿ���ͻ��Ŀͻ����ͱ�ʶ',
  `company` varchar(15) DEFAULT NULL COMMENT '������Ϊ���й�˾����ҵ����',
  `address` varchar(25) DEFAULT NULL COMMENT '������Ϊ��ҵ�û��Ĺ�˾��ַ',
  `phone` varchar(15) DEFAULT NULL COMMENT '�ͻ�����ϵ�绰',
  `email` varchar(25) NOT NULL COMMENT '��˾�ͻ�����ϵ����',
  `bankcard` varchar(25) DEFAULT NULL COMMENT '����֧�������߽ɷ����󶨵����п���',
  `name` varchar(15) DEFAULT NULL COMMENT '��������������',
  `idcard` varchar(18) DEFAULT NULL COMMENT '��˾�ͻ��ķ������������֤��',
  `password` varchar(15) NOT NULL COMMENT '������Ϊ�û��ĵ�¼����',
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000265 DEFAULT CHARSET=utf8 COMMENT='��ʵ�屣����ҵ�û����˻���Ϣ';

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL COMMENT '�ʷѱ�׼�������Чʱ��',
  `type` varchar(5) NOT NULL COMMENT '�����ʷѱ�׼�����Ӧ�ı������',
  `price` float(8,2) NOT NULL COMMENT '�����ʷѱ�׼�����ļ۸�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='�ñ��¼��ʷ�ʷѱ�׼���Ա����պ���';

-- ----------------------------
-- Table structure for master
-- ----------------------------
DROP TABLE IF EXISTS `master`;
CREATE TABLE `master` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `password` varchar(15) NOT NULL COMMENT '����Ա��¼����',
  `name` varchar(15) DEFAULT NULL,
  `email` varchar(25) NOT NULL,
  `type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=916365053 DEFAULT CHARSET=utf8 COMMENT='�ñ�Ϊ����Ա�ĵ�½�˻�����������Ա�˻����˺�����';

-- ----------------------------
-- Table structure for meter
-- ----------------------------
DROP TABLE IF EXISTS `meter`;
CREATE TABLE `meter` (
  `meter_id` varchar(15) NOT NULL COMMENT '������Ϊÿ���������ı�ţ�һ�����Ψһ��Ӧһ�����',
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `typen` int(5) DEFAULT NULL,
  `sche` int(15) DEFAULT NULL COMMENT '�ɼ������ķ������',
  `code_a` varchar(15) DEFAULT NULL,
  `state` varchar(5) DEFAULT NULL COMMENT '�õ��ĵ�ǰ״̬��ͨ�绹�Ƕϵ�',
  `balance` float(8,2) DEFAULT NULL COMMENT '�õ���ǰ�������',
  `remark` varchar(50) DEFAULT NULL COMMENT '�õ�����ϸ��Ϣ���ͺš������ַ����ⱨ����Ϣ��',
  `isdelete` int(1) DEFAULT NULL,
  `sort` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`meter_id`),
  KEY `FK_Reference_3` (`id`),
  KEY `FK_Reference_5` (`sche`),
  KEY `FK_Reference_8` (`code_a`),
  KEY `FK_Reference_4` (`typen`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`typen`) REFERENCES `type` (`typen`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`sche`) REFERENCES `scheme` (`sche`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`code_a`) REFERENCES `area` (`code_a`)
) ENGINE=InnoDB AUTO_INCREMENT=10000266 DEFAULT CHARSET=utf8 COMMENT='��ʵ��ΪԶ�̳���ϵͳ�еĵ��ʵ�壬��¼���������Ϣ';

-- ----------------------------
-- Table structure for personal
-- ----------------------------
DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personal` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `type` varchar(5) NOT NULL COMMENT '������Ϊÿ���ͻ��Ŀͻ����ͱ�ʶ',
  `name` varchar(15) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL COMMENT '������Ϊ�ͻ����Ա𣬷����������û�����',
  `phone` varchar(15) DEFAULT NULL COMMENT '�ͻ�����ϵ�绰',
  `email` varchar(25) NOT NULL COMMENT '�ͻ�����ϵ����',
  `address` varchar(25) DEFAULT NULL COMMENT '������Ϊ�����û��ľ�ס��ַ',
  `bankcard` varchar(25) DEFAULT NULL,
  `idcard` varchar(18) DEFAULT NULL,
  `password` varchar(15) NOT NULL COMMENT '������Ϊ�û��ĵ�¼����',
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000266 DEFAULT CHARSET=utf8 COMMENT='��ʵ�屣������û����˻���Ϣ';

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(15) NOT NULL,
  `code_p` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`code_p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ʵ��Ϊ�������򻮷ֵȼ�';

-- ----------------------------
-- Table structure for reading
-- ----------------------------
DROP TABLE IF EXISTS `reading`;
CREATE TABLE `reading` (
  `record_r` int(15) NOT NULL AUTO_INCREMENT,
  `meter_id` varchar(15) NOT NULL COMMENT '������Ϊÿ���������ı�ţ�һ�����Ψһ��Ӧһ�����',
  `time` datetime NOT NULL,
  `reading` float(8,2) DEFAULT NULL,
  PRIMARY KEY (`record_r`),
  KEY `FK_Reference_6` (`meter_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`meter_id`) REFERENCES `meter` (`meter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292849 DEFAULT CHARSET=utf8 COMMENT='�ñ��¼ĳһʱ�����Ķ���������ʷ����';

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `record_p` int(15) NOT NULL AUTO_INCREMENT,
  `meter_id` varchar(15) NOT NULL COMMENT '������Ϊÿ���������ı�ţ�һ�����Ψһ��Ӧһ�����',
  `time` datetime NOT NULL COMMENT '������Ϊÿһ�νɷѵĽɷ�ʱ�䣬�����պ��֤',
  `money` float(8,2) NOT NULL COMMENT '������Ϊÿһ�νɷѵĽɷ�ʱ�䣬�����պ��֤',
  `balance` float(8,2) DEFAULT NULL COMMENT '���˽ɷѺ󣬸õ��Ŀ������',
  PRIMARY KEY (`record_p`),
  KEY `FK_Reference_7` (`meter_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`meter_id`) REFERENCES `meter` (`meter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146036 DEFAULT CHARSET=utf8 COMMENT='�ñ��¼�û��˻��ĽɷѼ�¼���Լ��ɷ�֮���������Ϣ';

-- ----------------------------
-- Table structure for scheme
-- ----------------------------
DROP TABLE IF EXISTS `scheme`;
CREATE TABLE `scheme` (
  `sche` int(15) NOT NULL AUTO_INCREMENT,
  `rate` int(11) NOT NULL COMMENT '�����Ա�ʾ�ɼ������Ķ�ʱ�ɼ�Ƶ��',
  `start` datetime NOT NULL COMMENT '�����Ա�ʾ�òɼ���������ʼ�ɼ�ʱ��',
  `end` datetime DEFAULT NULL COMMENT '�����Ա�ʾ�òɼ���������ֹ�ɼ�ʱ��',
  `isdelete` int(1) DEFAULT NULL,
  PRIMARY KEY (`sche`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='�ñ���泣�õĲɼ�������ÿ��������ѡ��һ�ַ���ִ�вɼ�����';

-- ----------------------------
-- Table structure for standard
-- ----------------------------
DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard` (
  `type` varchar(5) NOT NULL COMMENT '������Ϊ�������ͣ�Ŀǰ��Ϊ���ú����ã���ͬ������Ҳ�����żƷѱ�׼�Ĳ�ͬ',
  `threshold` float(8,2) DEFAULT NULL COMMENT '������Ϊ��ͬ���͵�����󳬶������ֵ����',
  `price` float(8,2) NOT NULL COMMENT '������Ϊ��ͬ���͵��ļƷѱ�׼',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ�ļƷѱ�׼���������ú����õ��ʷѱ�׼����ֵ����';

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `typen` int(5) NOT NULL AUTO_INCREMENT,
  `type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`typen`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='�ñ������ĸ�������';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=916365052 DEFAULT CHARSET=utf8 COMMENT='�ñ��¼���пͻ��Ŀͻ���ż�����';
