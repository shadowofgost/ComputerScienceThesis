-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` varchar(20) NOT NULL COMMENT '账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `salt` char(32) NOT NULL COMMENT '加密盐',
  `level` tinyint(1) NOT NULL COMMENT '1，超级管理员，2老师',
  `name` varchar(60) NOT NULL COMMENT '姓名',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `admin` (`id`, `admin`, `password`, `salt`, `level`, `name`, `status`) VALUES
(1,	'admin',	'516eb11bbeb8a504dda4fd1198e042d7',	'e625fb438d13f7f6defbbacb1f0a6d84',	1,	'管理员',	1),
(43,	'J6eXsZ',	'b6e851e84e9df8b612396bfe8df15f9e',	'01976fbe4dba7ba7cfb22fa0e579f642',	2,	'最新',	1),
(42,	'jyHXTa',	'2dd97cd23aee6558adb13b160f2bc456',	'8cd0123d78b000789312a4fec575e0ee',	2,	'最大',	1),
(41,	'gH8DcY',	'ed095fbfeeaf6f649bf4c007bff80e58',	'8d3060365adde62c3aa636fded3d7f60',	2,	'wJ',	1),
(40,	'Uv9JeQ',	'21b028be8fefc04919e0cb83a337a79e',	'01e7616debdebfd4e9f3c78c5716027f',	2,	'BA',	1),
(39,	'DtH8Xa',	'15755d9a48ee6ae8d4b44fabcbeb517b',	'7870a422703d8025b105730dfff2ccd9',	2,	'gN',	1),
(38,	'5ExnyV',	'ec8bc708c09ce7950464e574f160e84f',	'8a25ad0ceda51ae7f9497256b19bade3',	2,	'z5',	1),
(37,	'LUAsZ4',	'0a7ec5b8b2f868349983b85386118072',	'3ecb8e363b8d2ac3171b2aadf457a93c',	2,	'NV',	1),
(36,	'cQSPdf1',	'a59245e544687566963af957c772e987',	'3b279677c720dd3e9741a11592c8144a',	2,	'大哥223',	1),
(31,	'3bQPve',	'e93fe7552778ded9c169ec54bcafa632',	'1aaac9251c500fb3a4bcdce9d21ff8ce',	2,	'最小22',	1),
(32,	'8rjZF3',	'779fbba718592493009dbfb9f5032e90',	'a7a3b3cfac70baf20f3ab56f03bd2142',	2,	'一二三',	0),
(34,	'z7KJXm',	'add79aa0fd47d468ed47699171a4bd34',	'9351cab7ba7db8459102f049e199fe31',	2,	'大老师',	1),
(35,	'cQSPdf',	'77e8b39a096fb3984f1985e6baf29674',	'f522a8eb6b9471f49786376d599248f1',	2,	'大哥',	1);

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '班级名字',
  `t_id` int(11) NOT NULL COMMENT '班级管理老师',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `user_count` int(11) NOT NULL COMMENT '班级学生人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='班级';

INSERT INTO `class` (`id`, `name`, `t_id`, `addtime`, `user_count`) VALUES
(2,	'二班',	23,	1600760130,	2),
(4,	'三班',	15,	1607061051,	4);

DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '学生id',
  `k_time` int(11) NOT NULL COMMENT '考试时间',
  `score` float(3,1) NOT NULL COMMENT '分数',
  `kskc` varchar(60) NOT NULL COMMENT '考试课程',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分数表';

INSERT INTO `score` (`id`, `uid`, `k_time`, `score`, `kskc`) VALUES
(1,	1,	1607011200,	80.0,	'语文'),
(2,	2,	1607011200,	20.5,	'语文'),
(3,	3,	1607011200,	81.0,	'语文'),
(4,	7,	1607011200,	81.5,	'语文'),
(5,	1,	1606924800,	80.0,	'数学'),
(6,	2,	1606924800,	80.5,	'数学'),
(7,	3,	1606924800,	88.5,	'数学'),
(9,	5,	1606838400,	50.0,	'英语'),
(10,	6,	1606838400,	95.5,	'英语');

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '姓名',
  `code` varchar(20) NOT NULL COMMENT '学号',
  `cid` char(18) NOT NULL COMMENT '身份证',
  `in_time` int(11) NOT NULL COMMENT '入学时间',
  `out_time` int(11) NOT NULL COMMENT '离开学校时间',
  `info` text NOT NULL COMMENT '简介',
  `l_name` varchar(60) NOT NULL COMMENT '联系人',
  `l_phone` char(11) NOT NULL COMMENT '联系人手机',
  `l2_name` varchar(60) NOT NULL COMMENT '备用联系人',
  `l2_phone` char(11) NOT NULL COMMENT '备用联系人手机',
  `add` varchar(255) NOT NULL COMMENT '住址',
  `class_id` int(11) NOT NULL COMMENT '班级id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学生';

INSERT INTO `student` (`id`, `name`, `code`, `cid`, `in_time`, `out_time`, `info`, `l_name`, `l_phone`, `l2_name`, `l2_phone`, `add`, `class_id`) VALUES
(1,	'张五',	'2020124152300',	'513723199112023637',	1607011200,	0,	'是个好学生哦',	'贞观三年',	'18888888888',	'张三姆',	'15555555555',	'什么路什么号',	4),
(2,	'李斯打赏',	'2020124152444',	'513723199112023636',	1606838400,	0,	'',	'李斯爸爸',	'18888888888',	'',	'0',	'0',	4),
(3,	'王五1',	'2020124152717',	'513723199112023639',	1607356800,	1609430400,	'',	'搜索',	'18888888888',	'啊啊',	'',	'',	4),
(5,	'123',	'2020124164340',	'513723199112023635',	1606752000,	0,	'',	'123',	'18888888888',	'',	'',	'',	2),
(6,	'123',	'2020124164340',	'513723199112023638',	1606752000,	0,	'',	'123',	'18888888888',	'',	'',	'',	2),
(7,	'123',	'2020124164340',	'513723199112023739',	1606752000,	0,	'',	'123',	'18888888888',	'',	'',	'',	4);

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` int(11) NOT NULL COMMENT '账号id',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `cid` char(18) NOT NULL COMMENT '身份证',
  `in_time` int(11) NOT NULL COMMENT '入职时间',
  `out_time` int(11) NOT NULL COMMENT '离职时间',
  `oa_time` int(11) NOT NULL COMMENT '合同到期时间',
  `info` text NOT NULL COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='教师';

INSERT INTO `teacher` (`id`, `a_id`, `name`, `cid`, `in_time`, `out_time`, `oa_time`, `info`) VALUES
(16,	35,	'大哥',	'513723199112024634',	1609344000,	1607011200,	1606924800,	'<p>啦啦啦</p>'),
(15,	34,	'大老师',	'513723199112024633',	1606838400,	1608825600,	1609344000,	'<p>萨达</p>'),
(12,	31,	'最小22',	'513723199112024631',	0,	0,	0,	''),
(13,	32,	'一二三',	'513723199112024632',	0,	1608739200,	1608912000,	''),
(17,	36,	'大哥223',	'513723199112024635',	1606924800,	1607011200,	1606924800,	'<p>啦啦啦2</p>'),
(18,	37,	'NV',	'513723199112024635',	0,	0,	0,	''),
(19,	38,	'z5',	'513723199112024635',	0,	0,	0,	''),
(20,	39,	'gN',	'513723199112024635',	0,	0,	0,	''),
(21,	40,	'BA',	'513723199112024635',	0,	0,	0,	''),
(22,	41,	'wJ',	'513723199112024635',	0,	0,	0,	''),
(23,	42,	'最大',	'513723199112024635',	0,	0,	0,	''),
(24,	43,	'最新',	'513723199112024635',	0,	0,	0,	'');

-- 2020-12-04 14:31:30
