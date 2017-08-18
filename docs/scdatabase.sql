/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : scdatabase

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-04-16 21:14:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `Cno` char(10) NOT NULL,
  `Cname` char(20) NOT NULL,
  `Cteacher` char(10) NOT NULL,
  `Ctype` char(10) NOT NULL,
  `Ctime` char(20) NOT NULL,
  `Cplace` char(10) DEFAULT NULL,
  `Chours` char(10) DEFAULT NULL,
  `Ccredit` char(10) DEFAULT NULL,
  PRIMARY KEY (`Cno`),
  KEY `FKAF42E01B2A0F0CC7` (`Cteacher`),
  CONSTRAINT `FKAF42E01B2A0F0CC7` FOREIGN KEY (`Cteacher`) REFERENCES `teacher` (`Tenum`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Cteacher`) REFERENCES `teacher` (`Tenum`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('c0001', '数据库理论', 't0001', '计算机类', '未知', '工业中心303', '60', '2');
INSERT INTO `course` VALUES ('c0002', '数据库设计', 't0001', '计算机类', '网上课程', '工业中心303', '60', '2');
INSERT INTO `course` VALUES ('c0003', '电子商务', 't0001', '管理类', '周三下午、节', '工业中心203', '48', '2');
INSERT INTO `course` VALUES ('c0004', '数字控制技术', 't0001', '电子类', '周三下午、节', 'HH303', '48', '2');
INSERT INTO `course` VALUES ('c0007', 'c语言基础', 't0002', '计算机类', '周四上午、节', 'JB405', '48', '3');
INSERT INTO `course` VALUES ('c0009', '电路板基础', 't0003', '电子类', '周三下午、节', 'HF302', '64', '4');
INSERT INTO `course` VALUES ('c0012', '手机开发', 't0002', '安卓类', '下午', '工业中心', '10', '2');
INSERT INTO `course` VALUES ('c0013', 'dfsfs', 't0005', '计算机类', '45345', '45645', '534534', '35435');
INSERT INTO `course` VALUES ('c0019', 'fdsf', 't0001', 'fdsfs', 'dfs', 'dfs', '33', '33');
INSERT INTO `course` VALUES ('c0024', 'fd', 't0002', '管理类', '454', '546', '80', '4');
INSERT INTO `course` VALUES ('c0025', 'fsdf', 't0001', 'dsfsdf', 'fsdf', 'fsdf', '333', '3');
INSERT INTO `course` VALUES ('c0026', 'fljsd', 't0001', 'fsdf', 'fsdf', 'sfdfs', 'fdsdf', 'fsdf');

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `power` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`),
   UNIQUE KEY `INDEX_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES ('7', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'C');
INSERT INTO `register` VALUES ('16', 's0001', 'e10adc3949ba59abbe56e057f20f883e', 'A');
INSERT INTO `register` VALUES ('18', 't0001', 'e10adc3949ba59abbe56e057f20f883e', 'B');
INSERT INTO `register` VALUES ('19', 't0002', '25d55ad283aa400af464c76d713c07ad', 'B');
INSERT INTO `register` VALUES ('20', 's0002', '81dc9bdb52d04dc20036dbd8313ed055', 'A');
INSERT INTO `register` VALUES ('21', 's0003', '81dc9bdb52d04dc20036dbd8313ed055', 'A');
INSERT INTO `register` VALUES ('22', 's0004', 'e10adc3949ba59abbe56e057f20f883e', 'A');
INSERT INTO `register` VALUES ('23', 's0005', 'e10adc3949ba59abbe56e057f20f883e', 'A');
INSERT INTO `register` VALUES ('24', 's0006', 'e10adc3949ba59abbe56e057f20f883e', 'A');
INSERT INTO `register` VALUES ('25', 's0007', 'e10adc3949ba59abbe56e057f20f883e', 'A');
INSERT INTO `register` VALUES ('26', 's0008', 'e10adc3949ba59abbe56e057f20f883e', 'A');

-- ----------------------------
-- Table structure for select_course
-- ----------------------------
DROP TABLE IF EXISTS `select_course`;
CREATE TABLE `select_course` (
  `Stunum` char(10) NOT NULL,
  `Cno` char(10) NOT NULL,
  `Result` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Stunum`,`Cno`),
  KEY `FK189954BE46C6DD3` (`Stunum`),
  KEY `FK189954BE309BD5F9` (`Cno`),
  CONSTRAINT `FK189954BE309BD5F9` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`),
  CONSTRAINT `FK189954BE46C6DD3` FOREIGN KEY (`Stunum`) REFERENCES `student` (`Stunum`),
  CONSTRAINT `select_course_ibfk_1` FOREIGN KEY (`Stunum`) REFERENCES `student` (`Stunum`),
  CONSTRAINT `select_course_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of select_course
-- ----------------------------
INSERT INTO `select_course` VALUES ('s0001', 'c0003', '89');
INSERT INTO `select_course` VALUES ('s0001', 'c0007', '78');
INSERT INTO `select_course` VALUES ('s0001', 'c0013', '90');
INSERT INTO `select_course` VALUES ('s0001', 'c0025', '0');
INSERT INTO `select_course` VALUES ('s0002', 'c0001', '89');
INSERT INTO `select_course` VALUES ('s0002', 'c0009', '0');
INSERT INTO `select_course` VALUES ('s0002', 'c0012', '87');
INSERT INTO `select_course` VALUES ('s0003', 'c0002', '65');
INSERT INTO `select_course` VALUES ('s0003', 'c0004', '98');
INSERT INTO `select_course` VALUES ('s0003', 'c0007', '78');
INSERT INTO `select_course` VALUES ('s0003', 'c0012', '86');
INSERT INTO `select_course` VALUES ('s0004', 'c0001', '99');
INSERT INTO `select_course` VALUES ('s0004', 'c0012', '68');
INSERT INTO `select_course` VALUES ('s0004', 'c0013', '59');
INSERT INTO `select_course` VALUES ('s0005', 'c0012', '0');
INSERT INTO `select_course` VALUES ('s0006', 'c0002', '0');
INSERT INTO `select_course` VALUES ('s0006', 'c0013', '0');
INSERT INTO `select_course` VALUES ('s0006', 'c0026', '0');
INSERT INTO `select_course` VALUES ('s0007', 'c0001', '0');
INSERT INTO `select_course` VALUES ('s0007', 'c0007', '0');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Stunum` char(10) NOT NULL,
  `Stuname` char(10) NOT NULL,
  `Stusex` char(2) NOT NULL DEFAULT '男',
  `Stubirth` char(10) NOT NULL,
  `Stuadim` char(10) NOT NULL,
  `Stumajor` char(10) NOT NULL,
  `Stuclass` char(10) NOT NULL,
  `Stucollege` char(10) NOT NULL,
  PRIMARY KEY (`Stunum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('s0001', '景天', '女', '1973-03-24', '1993-03-27', '中戏', '13中戏2班', '中戏学院');
INSERT INTO `student` VALUES ('s0002', '云天河', '男', '1990-01-12', '2008-09-01', '会计', '2班', '商学院');
INSERT INTO `student` VALUES ('s0003', '唐雪见', '女', '1990-09-01', '2009-09-01', '信息工程', '1班', '信息学院');
INSERT INTO `student` VALUES ('s0004', '张琳芃', '男', '1989-05-09', '2008-09-01', '信息工程', '2班', '信息学院');
INSERT INTO `student` VALUES ('s0005', '陈琳', '女', '1991-02-01', '2009-09-01', '英语', '1班', '外语学院');
INSERT INTO `student` VALUES ('s0006', '王小雪', '女', '1990-05-20', '2008-09-01', '英语', '3班', '外语学院');
INSERT INTO `student` VALUES ('s0007', '李大龙', '男', '1989-12-02', '2008-09-01', '英语', '4班', '外语学院');
INSERT INTO `student` VALUES ('s0008', '何天', '男', '1989-09-15', '2007-09-01', '数学', '1班', '数理学院');
INSERT INTO `student` VALUES ('s0009', '卢巧音', '女', '1991-07-12', '2009-09-01', '数学', '2班', '数理学院');
INSERT INTO `student` VALUES ('s0010', '卓不凡', '男', '1989-10-23', '2009-09-01', '化学', '1班', '化工学院');
INSERT INTO `student` VALUES ('s0011', '林达妹', '女', '1990-08-05', '2008-09-01', '化学', '5班', '化工学院');
INSERT INTO `student` VALUES ('s0012', 'chen', '女', '2017-03-04', '2017-03-04', '电子工程', '14电子2班', '电子信息学院');
INSERT INTO `student` VALUES ('s0013', '陈松青', '男', '1996-03-04', '2013-09-04', '计算机科学与技术', '13计本2班', '计算机科学学院');
INSERT INTO `student` VALUES ('s0014', '周远', '男', '1993-03-10', '2015-03-11', '地方', '2班', '计算机科学学院');
INSERT INTO `student` VALUES ('s0015', 'fs', '男', '2017-04-11', '2017-04-20', 'fsdf', 'fsdf', 'fdsf');
INSERT INTO `student` VALUES ('s0016', '陈雄', '男', '2017-04-12', '2017-04-13', '计算机科学与技术', '13计师3班', '计算机科学学院');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `Tenum` char(10) NOT NULL,
  `Tename` char(10) NOT NULL,
  `Tesex` char(2) NOT NULL DEFAULT '男',
  `Tetitle` char(10) NOT NULL,
  `Temajor` char(20) NOT NULL,
  PRIMARY KEY (`Tenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('t0001', '牛老师', '女', '教授', '计算机科学与技术');
INSERT INTO `teacher` VALUES ('t0002', '张老师', '男', '教师', '信息工程');
INSERT INTO `teacher` VALUES ('t0003', '何老师', '男', '教授', '物理学');
INSERT INTO `teacher` VALUES ('t0004', '陈老师', '女', '教师', '管理经济学');
INSERT INTO `teacher` VALUES ('t0005', '刘老师', '男', '副教授', '物理');
INSERT INTO `teacher` VALUES ('t0006', '郑老师', '男', '教师', '信管管理');
INSERT INTO `teacher` VALUES ('t0007', '王老师', '女', '教师', '信息工程');
INSERT INTO `teacher` VALUES ('t0008', '黄老师', '男', '教授', '物理');
INSERT INTO `teacher` VALUES ('t0009', '祝老师', '女', '教授', '管理经济学');
