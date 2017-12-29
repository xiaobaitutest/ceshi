/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : master_com

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-29 18:34:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'phpcms', 'e2237824cd14ea45e5bec3b8e046c8a1', '1', 'LeWexr', '127.0.0.1', '1514533694', 'test@qq.com', '', '', '');

-- ----------------------------
-- Table structure for `t_admin_panel`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_panel`;
CREATE TABLE `t_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_panel
-- ----------------------------

-- ----------------------------
-- Table structure for `t_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
INSERT INTO `t_admin_role` VALUES ('1', '超级管理员', '超级管理员', '0', '0');
INSERT INTO `t_admin_role` VALUES ('2', '站点管理员', '站点管理员', '0', '0');
INSERT INTO `t_admin_role` VALUES ('3', '运营总监', '运营总监', '1', '0');
INSERT INTO `t_admin_role` VALUES ('4', '总编', '总编', '5', '0');
INSERT INTO `t_admin_role` VALUES ('5', '编辑', '编辑', '1', '0');
INSERT INTO `t_admin_role` VALUES ('7', '发布人员', '发布人员', '0', '0');

-- ----------------------------
-- Table structure for `t_admin_role_priv`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role_priv`;
CREATE TABLE `t_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_role_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `t_announce`
-- ----------------------------
DROP TABLE IF EXISTS `t_announce`;
CREATE TABLE `t_announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_announce
-- ----------------------------

-- ----------------------------
-- Table structure for `t_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `t_attachment`;
CREATE TABLE `t_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attachment
-- ----------------------------
INSERT INTO `t_attachment` VALUES ('1', 'content', '15', 'default.png', '2017/1006/20171006111739809.png', '27088', 'png', '1', '0', '0', '1', '1507303059', '127.0.0.1', '1', '538438f9e0c1cb8bd6c5a8c09b64277d', '1');
INSERT INTO `t_attachment` VALUES ('2', 'content', '15', '1待付款.JPG', '2017/1006/20171006111853508.jpg', '1840116', 'jpg', '1', '0', '0', '1', '1507303133', '127.0.0.1', '1', 'f1d6c155ffab65cbe1023e78c25dd917', '1');
INSERT INTO `t_attachment` VALUES ('3', 'content', '15', '1待付款.JPG', '2017/1006/20171006111854511.jpg', '1840116', 'jpg', '1', '0', '0', '1', '1507303133', '127.0.0.1', '1', '72a50274dcf623ee3da308657735afcc', '1');
INSERT INTO `t_attachment` VALUES ('4', 'content', '15', '2-1退款中.JPG', '2017/1006/20171006111854939.jpg', '1882907', 'jpg', '1', '0', '0', '1', '1507303134', '127.0.0.1', '1', 'b34de91088a7ad673452f9f931481926', '1');
INSERT INTO `t_attachment` VALUES ('5', 'content', '15', '2-2退款成功.JPG', '2017/1006/20171006111855814.jpg', '1743532', 'jpg', '1', '0', '0', '1', '1507303135', '127.0.0.1', '1', 'b108da36339d165ebe6d574c1d1c8ef7', '1');
INSERT INTO `t_attachment` VALUES ('6', 'content', '15', '2已付款.JPG', '2017/1006/20171006111856696.jpg', '1919155', 'jpg', '1', '0', '0', '1', '1507303136', '127.0.0.1', '1', 'e03189ec44c37a514b791b0d4697c089', '1');
INSERT INTO `t_attachment` VALUES ('7', 'content', '15', '3-1退货中.JPG', '2017/1006/20171006111857490.jpg', '1974768', 'jpg', '1', '0', '0', '1', '1507303137', '127.0.0.1', '1', '0d4c622085f11581c837e70e31c85995', '1');
INSERT INTO `t_attachment` VALUES ('8', 'content', '15', '3-2退货中（同意退货后）.JPG', '2017/1006/20171006111858937.jpg', '1873244', 'jpg', '1', '0', '0', '1', '1507303138', '127.0.0.1', '1', 'dd6777c9e1afd444b2b90806e6dedcd6', '1');
INSERT INTO `t_attachment` VALUES ('9', 'content', '15', '3已发货.JPG', '2017/1006/20171006111859820.jpg', '1905325', 'jpg', '1', '0', '0', '1', '1507303139', '127.0.0.1', '1', 'e816169dbd4d8592814412015d087527', '1');
INSERT INTO `t_attachment` VALUES ('10', 'content', '15', '4交易完成.JPG', '2017/1006/20171006111900326.jpg', '1754837', 'jpg', '1', '0', '0', '1', '1507303140', '127.0.0.1', '1', 'a98f329a0dae846be39299d974f5bf6d', '1');

-- ----------------------------
-- Table structure for `t_attachment_index`
-- ----------------------------
DROP TABLE IF EXISTS `t_attachment_index`;
CREATE TABLE `t_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attachment_index
-- ----------------------------
INSERT INTO `t_attachment_index` VALUES ('c-15-1', '1');
INSERT INTO `t_attachment_index` VALUES ('c-15-1', '2');
INSERT INTO `t_attachment_index` VALUES ('c-15-1', '3');
INSERT INTO `t_attachment_index` VALUES ('c-15-1', '4');
INSERT INTO `t_attachment_index` VALUES ('c-15-1', '5');
INSERT INTO `t_attachment_index` VALUES ('c-15-1', '6');
INSERT INTO `t_attachment_index` VALUES ('c-15-1', '7');
INSERT INTO `t_attachment_index` VALUES ('c-15-1', '8');
INSERT INTO `t_attachment_index` VALUES ('c-15-1', '9');
INSERT INTO `t_attachment_index` VALUES ('c-15-1', '10');
INSERT INTO `t_attachment_index` VALUES ('c-10-5', '4');
INSERT INTO `t_attachment_index` VALUES ('c-15-3', '9');
INSERT INTO `t_attachment_index` VALUES ('c-15-3', '8');

-- ----------------------------
-- Table structure for `t_badword`
-- ----------------------------
DROP TABLE IF EXISTS `t_badword`;
CREATE TABLE `t_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_badword
-- ----------------------------

-- ----------------------------
-- Table structure for `t_block`
-- ----------------------------
DROP TABLE IF EXISTS `t_block`;
CREATE TABLE `t_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_block
-- ----------------------------

-- ----------------------------
-- Table structure for `t_block_history`
-- ----------------------------
DROP TABLE IF EXISTS `t_block_history`;
CREATE TABLE `t_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_block_history
-- ----------------------------

-- ----------------------------
-- Table structure for `t_block_priv`
-- ----------------------------
DROP TABLE IF EXISTS `t_block_priv`;
CREATE TABLE `t_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_block_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `t_cache`
-- ----------------------------
DROP TABLE IF EXISTS `t_cache`;
CREATE TABLE `t_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cache
-- ----------------------------
INSERT INTO `t_cache` VALUES ('mood_program.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    1 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'震惊\',\n      \'pic\' => \'mood/a1.gif\',\n    ),\n    2 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'不解\',\n      \'pic\' => \'mood/a2.gif\',\n    ),\n    3 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'愤怒\',\n      \'pic\' => \'mood/a3.gif\',\n    ),\n    4 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'杯具\',\n      \'pic\' => \'mood/a4.gif\',\n    ),\n    5 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'无聊\',\n      \'pic\' => \'mood/a5.gif\',\n    ),\n    6 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'高兴\',\n      \'pic\' => \'mood/a6.gif\',\n    ),\n    7 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'支持\',\n      \'pic\' => \'mood/a7.gif\',\n    ),\n    8 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'超赞\',\n      \'pic\' => \'mood/a8.gif\',\n    ),\n    9 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n    10 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n  ),\n);\n?>');
INSERT INTO `t_cache` VALUES ('category_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'1\',\n  2 => \'1\',\n  6 => \'1\',\n  7 => \'1\',\n  3 => \'1\',\n  8 => \'1\',\n  4 => \'1\',\n  5 => \'1\',\n  9 => \'1\',\n  10 => \'1\',\n  11 => \'1\',\n  12 => \'1\',\n  13 => \'1\',\n  14 => \'1\',\n  15 => \'1\',\n  16 => \'1\',\n  17 => \'1\',\n  18 => \'1\',\n  19 => \'1\',\n  20 => \'1\',\n  21 => \'1\',\n  22 => \'1\',\n  23 => \'1\',\n  24 => \'1\',\n  25 => \'1\',\n  26 => \'1\',\n  27 => \'1\',\n  28 => \'1\',\n  29 => \'1\',\n  30 => \'1\',\n);\n?>');
INSERT INTO `t_cache` VALUES ('category_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'catid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'1,2,3,4,5\',\n    \'catname\' => \'网站介绍\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'about\',\n    \'url\' => \'/html/about/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'1\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'wangzhanjieshao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  2 => \n  array (\n    \'catid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'2\',\n    \'catname\' => \'关于我们\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'aboutus\',\n    \'url\' => \'/html/about/aboutus/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'关于我们\\\',\n  \\\'meta_keywords\\\' => \\\'关于我们\\\',\n  \\\'meta_description\\\' => \\\'关于我们\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'1\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'guanyuwomen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  6 => \n  array (\n    \'catid\' => \'6\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'6,9,10,11,12,13,14\',\n    \'catname\' => \'小说\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'wenzhang\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=6\',\n    \'items\' => \'5\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'1\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xiaoshuo\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  3 => \n  array (\n    \'catid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'3\',\n    \'catname\' => \'联系方式\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'contactus\',\n    \'url\' => \'/html/about/contactus/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'联系方式\\\',\n  \\\'meta_keywords\\\' => \\\'联系方式\\\',\n  \\\'meta_description\\\' => \\\'联系方式\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'2\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'lianxifangshi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  7 => \n  array (\n    \'catid\' => \'7\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'2\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'7\',\n    \'catname\' => \'下载\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'down\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=7\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'2\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xiazai\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  4 => \n  array (\n    \'catid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'4\',\n    \'catname\' => \'版权声明\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'copyright\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=4\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'版权声明\\\',\n  \\\'meta_keywords\\\' => \\\'版权声明\\\',\n  \\\'meta_description\\\' => \\\'版权声明\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'3\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'banquanshengming\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  8 => \n  array (\n    \'catid\' => \'8\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'8,15,16,17,18,19,20,21\',\n    \'catname\' => \'图片\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'pps\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=8\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'3\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'tupian\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  5 => \n  array (\n    \'catid\' => \'5\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'5\',\n    \'catname\' => \'招聘信息\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'hr\',\n    \'url\' => \'/html/about/hr/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'4\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhaopinxinxi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  9 => \n  array (\n    \'catid\' => \'9\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'9\',\n    \'catname\' => \'激情文学\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'jiqingwenxue\',\n    \'parentdir\' => \'wenzhang/\',\n    \'catdir\' => \'jiqingwenxue\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=9\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'9\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'jiqingwenxue\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  10 => \n  array (\n    \'catid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'10\',\n    \'catname\' => \'乱伦文学\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'wenzhang/\',\n    \'catdir\' => \'luanlunwenxue\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=10\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'10\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'luanlunwenxue\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  11 => \n  array (\n    \'catid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'11\',\n    \'catname\' => \'明星校园\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'明星校园\',\n    \'parentdir\' => \'wenzhang/\',\n    \'catdir\' => \'mingxingxiaoyuan\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=11\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'11\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'mingxingxiaoyuan\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  12 => \n  array (\n    \'catid\' => \'12\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'12\',\n    \'catname\' => \'武侠古典\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'武侠古典\',\n    \'parentdir\' => \'wenzhang/\',\n    \'catdir\' => \'wuxiagudian\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=12\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'12\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'wuxiagudian\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  13 => \n  array (\n    \'catid\' => \'13\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'13\',\n    \'catname\' => \'黄色笑话\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'黄色笑话\',\n    \'parentdir\' => \'wenzhang/\',\n    \'catdir\' => \'huangsexiaohua\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=13\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'13\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'huangsexiaohua\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  14 => \n  array (\n    \'catid\' => \'14\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'14\',\n    \'catname\' => \'性爱技巧\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'wenzhang/\',\n    \'catdir\' => \'xingaijiqiao\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=14\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'14\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xingaijiqiao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  15 => \n  array (\n    \'catid\' => \'15\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'8\',\n    \'arrparentid\' => \'0,8\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'15\',\n    \'catname\' => \'偷拍自拍\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'pps/\',\n    \'catdir\' => \'p_toupaizipai\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=15\',\n    \'items\' => \'6\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'15\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'toupaizipai\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  16 => \n  array (\n    \'catid\' => \'16\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'8\',\n    \'arrparentid\' => \'0,8\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'16\',\n    \'catname\' => \'亚洲色图\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'pps/\',\n    \'catdir\' => \'yazhousetu\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=16\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'16\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'yazhousetu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  17 => \n  array (\n    \'catid\' => \'17\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'8\',\n    \'arrparentid\' => \'0,8\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'17\',\n    \'catname\' => \'美腿丝袜\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'pps/\',\n    \'catdir\' => \'meituisiwa\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=17\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'17\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'meituisiwa\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  18 => \n  array (\n    \'catid\' => \'18\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'8\',\n    \'arrparentid\' => \'0,8\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'18\',\n    \'catname\' => \'欧美性爱\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'pps/\',\n    \'catdir\' => \'oumeixingai\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=18\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'18\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'oumeixingai\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  19 => \n  array (\n    \'catid\' => \'19\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'8\',\n    \'arrparentid\' => \'0,8\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'19\',\n    \'catname\' => \'激情明星\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'pps/\',\n    \'catdir\' => \'jiqingmingxing\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=19\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'19\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'jiqingmingxing\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  20 => \n  array (\n    \'catid\' => \'20\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'8\',\n    \'arrparentid\' => \'0,8\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'20\',\n    \'catname\' => \'清纯唯美\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'qingchunweimei\',\n    \'parentdir\' => \'pps/\',\n    \'catdir\' => \'qingcunweimei\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=20\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'20\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'qingchunweimei\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  21 => \n  array (\n    \'catid\' => \'21\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'8\',\n    \'arrparentid\' => \'0,8\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'21\',\n    \'catname\' => \'成人动漫\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'pps/\',\n    \'catdir\' => \'chengrendongman\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=21\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'21\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'chengrendongman\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  22 => \n  array (\n    \'catid\' => \'22\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'11\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'22,23,24,25\',\n    \'catname\' => \'视频\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'视频\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'shiping\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=22\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'22\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shipin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  23 => \n  array (\n    \'catid\' => \'23\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'11\',\n    \'parentid\' => \'22\',\n    \'arrparentid\' => \'0,22\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'23\',\n    \'catname\' => \'亚洲色情\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'shiping/\',\n    \'catdir\' => \'yazhouseqing\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=23\',\n    \'items\' => \'100\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'23\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'yazhouseqing\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  24 => \n  array (\n    \'catid\' => \'24\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'11\',\n    \'parentid\' => \'22\',\n    \'arrparentid\' => \'0,22\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'24\',\n    \'catname\' => \'制服丝袜\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'shiping/\',\n    \'catdir\' => \'zhifusiwa\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=24\',\n    \'items\' => \'60\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'24\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhifusiwa\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  25 => \n  array (\n    \'catid\' => \'25\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'11\',\n    \'parentid\' => \'22\',\n    \'arrparentid\' => \'0,22\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'25\',\n    \'catname\' => \'欧美性爱\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'shiping/\',\n    \'catdir\' => \'oumeixingai\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=25\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'25\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'oumeixingai\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  26 => \n  array (\n    \'catid\' => \'26\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'26\',\n    \'catname\' => \'案例\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'案例\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'site_case\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=26\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"list_template\":\"list_case\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'26\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'anli\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  27 => \n  array (\n    \'catid\' => \'27\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'27\',\n    \'catname\' => \'模板\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'templates\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=27\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"list_template\":\"list_templates\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'27\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'moban\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  28 => \n  array (\n    \'catid\' => \'28\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'28\',\n    \'catname\' => \'加盟\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'jiameng\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=28\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"master\",\"page_template\":\"page_jiameng\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'28\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'jiameng\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  29 => \n  array (\n    \'catid\' => \'29\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'29\',\n    \'catname\' => \'帮助\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'help\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=29\',\n    \'items\' => \'6\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"list_template\":\"list_help\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'29\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'bangzhu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  30 => \n  array (\n    \'catid\' => \'30\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'30\',\n    \'catname\' => \'推广教程\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'spread\',\n    \'url\' => \'http://www.master.com/index.php?m=content&c=index&a=lists&catid=30\',\n    \'items\' => \'6\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"list_template\":\"list_spread\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'30\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'tuiguangjiaocheng\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `t_cache` VALUES ('sitelist.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'默认站点\',\n    \'dirname\' => \'\',\n    \'domain\' => \'\',\n    \'site_title\' => \'小白兔建站\',\n    \'keywords\' => \'小白兔建站\',\n    \'description\' => \'小白兔建站\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'master\',\n    \'template\' => \'master\',\n    \'setting\' => \'{\"QQ\":\"12121\",\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"1\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\\\/images\\\\/water\\\\/\\\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}\',\n    \'uuid\' => \'56235942-aa93-11e7-a96e-fc45968cec44\',\n    \'url\' => \'//\',\n  ),\n);\n?>');
INSERT INTO `t_cache` VALUES ('downservers.cache.php', 'caches_commons/caches_data/', '<?php\nreturn NULL;\n?>');
INSERT INTO `t_cache` VALUES ('badword.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `t_cache` VALUES ('ipbanned.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `t_cache` VALUES ('keylink.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `t_cache` VALUES ('position.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  2 => \n  array (\n    \'posid\' => \'2\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'4\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  1 => \n  array (\n    \'posid\' => \'1\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页焦点图推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'1\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  16 => \n  array (\n    \'posid\' => \'16\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页每日热点\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  15 => \n  array (\n    \'posid\' => \'15\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  14 => \n  array (\n    \'posid\' => \'14\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  12 => \n  array (\n    \'posid\' => \'12\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页图片推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  10 => \n  array (\n    \'posid\' => \'10\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目首页推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  9 => \n  array (\n    \'posid\' => \'9\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'网站顶部推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  8 => \n  array (\n    \'posid\' => \'8\',\n    \'modelid\' => \'30\',\n    \'catid\' => \'54\',\n    \'name\' => \'图片频道首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  5 => \n  array (\n    \'posid\' => \'5\',\n    \'modelid\' => \'69\',\n    \'catid\' => \'0\',\n    \'name\' => \'推荐下载\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  13 => \n  array (\n    \'posid\' => \'13\',\n    \'modelid\' => \'82\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  17 => \n  array (\n    \'posid\' => \'17\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频栏目精彩推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n);\n?>');
INSERT INTO `t_cache` VALUES ('role_siteid.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `t_cache` VALUES ('role.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'超级管理员\',\n  2 => \'站点管理员\',\n  3 => \'运营总监\',\n  4 => \'总编\',\n  5 => \'编辑\',\n  7 => \'发布人员\',\n);\n?>');
INSERT INTO `t_cache` VALUES ('urlrules_detail.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n);\n?>');
INSERT INTO `t_cache` VALUES ('urlrules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n);\n?>');
INSERT INTO `t_cache` VALUES ('modules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin\' => \n  array (\n    \'module\' => \'admin\',\n    \'name\' => \'admin\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'{\"admin_email\":\"phpcms@phpcms.cn\",\"maxloginfailedtimes\":\"8\",\"minrefreshtime\":\"2\",\"mail_type\":\"1\",\"mail_server\":\"smtp.qq.com\",\"mail_port\":\"25\",\"category_ajax\":\"0\",\"mail_user\":\"phpcms.cn@foxmail.com\",\"mail_auth\":\"1\",\"mail_from\":\"phpcms.cn@foxmail.com\",\"mail_password\":\"\",\"errorlog_size\":\"20\"}\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'会员\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'allowregister\\\' => \\\'1\\\',\n  \\\'choosemodel\\\' => \\\'1\\\',\n  \\\'enablemailcheck\\\' => \\\'0\\\',\n  \\\'registerverify\\\' => \\\'0\\\',\n  \\\'showapppoint\\\' => \\\'0\\\',\n  \\\'rmb_point_rate\\\' => \\\'10\\\',\n  \\\'defualtpoint\\\' => \\\'0\\\',\n  \\\'defualtamount\\\' => \\\'0\\\',\n  \\\'showregprotocol\\\' => \\\'0\\\',\n  \\\'regprotocol\\\' => \\\'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \\\',\n  \\\'registerverifymessage\\\' => \\\' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n  \\\'forgetpassword\\\' => \\\' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'支付\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'顶一下\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'专题\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'内容模块\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'全站搜索\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'木马扫描\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'附件\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'碎片\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'采集模块\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'数据源\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'模板风格\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'发布点\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'video\' => \n  array (\n    \'module\' => \'video\',\n    \'name\' => \'视频库\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2012-09-28\',\n    \'updatedate\' => \'2012-09-28\',\n  ),\n  \'announce\' => \n  array (\n    \'module\' => \'announce\',\n    \'name\' => \'公告\',\n    \'url\' => \'announce/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'公告\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-10-06\',\n    \'updatedate\' => \'2017-10-06\',\n  ),\n  \'comment\' => \n  array (\n    \'module\' => \'comment\',\n    \'name\' => \'评论\',\n    \'url\' => \'comment/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'评论\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-10-06\',\n    \'updatedate\' => \'2017-10-06\',\n  ),\n  \'link\' => \n  array (\n    \'module\' => \'link\',\n    \'name\' => \'友情链接\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  1 => \n  array (\n    \\\'is_post\\\' => \\\'1\\\',\n    \\\'enablecheckcode\\\' => \\\'0\\\',\n  ),\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'vote\' => \n  array (\n    \'module\' => \'vote\',\n    \'name\' => \'投票\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\r\n  1 => \r\n  array (\r\n    \\\'default_style\\\' => \\\'default\\\',\r\n    \\\'vote_tp_template\\\' => \\\'vote_tp\\\',\r\n    \\\'allowguest\\\' => \\\'1\\\',\r\n    \\\'enabled\\\' => \\\'1\\\',\r\n    \\\'interval\\\' => \\\'1\\\',\r\n    \\\'credit\\\' => \\\'1\\\',\r\n  ),\r\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'message\' => \n  array (\n    \'module\' => \'message\',\n    \'name\' => \'短消息\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'mood\' => \n  array (\n    \'module\' => \'mood\',\n    \'name\' => \'新闻心情\',\n    \'url\' => \'mood/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'新闻心情\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-10-06\',\n    \'updatedate\' => \'2017-10-06\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'广告模块\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'广告模块\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-10-06\',\n    \'updatedate\' => \'2017-10-06\',\n  ),\n  \'formguide\' => \n  array (\n    \'module\' => \'formguide\',\n    \'name\' => \'表单向导\',\n    \'url\' => \'formguide/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'formguide\',\n    \'setting\' => \'array (\n  \\\'allowmultisubmit\\\' => \\\'1\\\',\n  \\\'interval\\\' => \\\'30\\\',\n  \\\'allowunreg\\\' => \\\'0\\\',\n  \\\'mailmessage\\\' => \\\'用户向我们提交了表单数据，赶快去看看吧。\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-20\',\n    \'updatedate\' => \'2010-10-20\',\n  ),\n  \'wap\' => \n  array (\n    \'module\' => \'wap\',\n    \'name\' => \'手机门户\',\n    \'url\' => \'wap/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'手机门户\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-10-06\',\n    \'updatedate\' => \'2017-10-06\',\n  ),\n  \'upgrade\' => \n  array (\n    \'module\' => \'upgrade\',\n    \'name\' => \'在线升级\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-05-18\',\n    \'updatedate\' => \'2011-05-18\',\n  ),\n  \'tag\' => \n  array (\n    \'module\' => \'tag\',\n    \'name\' => \'标签向导\',\n    \'url\' => \'tag/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'标签向导\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-10-06\',\n    \'updatedate\' => \'2017-10-06\',\n  ),\n  \'sms\' => \n  array (\n    \'module\' => \'sms\',\n    \'name\' => \'短信平台\',\n    \'url\' => \'sms/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'短信平台\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-09-02\',\n    \'updatedate\' => \'2011-09-02\',\n  ),\n);\n?>');
INSERT INTO `t_cache` VALUES ('model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'文章模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'下载模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'图片模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'视频模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `t_cache` VALUES ('workflow_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'一级审核\',\n    \'description\' => \'审核一次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'二级审核\',\n    \'description\' => \'审核两次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'三级审核\',\n    \'description\' => \'审核三次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'四级审核\',\n    \'description\' => \'四级审核\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `t_cache` VALUES ('member_model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'普通会员\',\n    \'description\' => \'普通会员\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
INSERT INTO `t_cache` VALUES ('special.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `t_cache` VALUES ('common.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'category_ajax\' => \'0\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n);\n?>');
INSERT INTO `t_cache` VALUES ('category_items_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  6 => \'5\',\n  27 => \'0\',\n  9 => \'2\',\n  10 => \'2\',\n  11 => \'0\',\n  12 => \'0\',\n  13 => \'0\',\n  14 => \'0\',\n  26 => \'0\',\n  29 => \'6\',\n  30 => \'6\',\n);\n?>');
INSERT INTO `t_cache` VALUES ('category_items_2.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  7 => \'1\',\n);\n?>');
INSERT INTO `t_cache` VALUES ('category_items_3.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  8 => \'2\',\n  15 => \'6\',\n  16 => \'0\',\n  17 => \'0\',\n  18 => \'0\',\n  19 => \'0\',\n  20 => \'0\',\n  21 => \'0\',\n);\n?>');
INSERT INTO `t_cache` VALUES ('category_items_11.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  22 => \'0\',\n  23 => \'100\',\n  24 => \'60\',\n  25 => \'0\',\n);\n?>');
INSERT INTO `t_cache` VALUES ('type_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `t_cache` VALUES ('vote.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'default_style\' => \'default\',\n    \'vote_tp_template\' => \'vote_tp\',\n    \'allowguest\' => \'1\',\n    \'enabled\' => \'1\',\n    \'interval\' => \'1\',\n    \'credit\' => \'1\',\n  ),\n);\n?>');
INSERT INTO `t_cache` VALUES ('link.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `t_cache` VALUES ('type_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '1', 'content', '1', '0', '0', '0', '1', '1,2,3,4,5', '网站介绍', '', '', '', '', 'about', '/html/about/', '0', '0', 'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '1', '0', '0', 'wangzhanjieshao', '');
INSERT INTO `t_category` VALUES ('2', '1', 'content', '1', '0', '1', '0,1', '0', '2', '关于我们', '', '', '', 'about/', 'aboutus', '/html/about/aboutus/', '0', '0', 'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'关于我们\',\n  \'meta_keywords\' => \'关于我们\',\n  \'meta_description\' => \'关于我们\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '1', '1', '0', 'guanyuwomen', '');
INSERT INTO `t_category` VALUES ('3', '1', 'content', '1', '0', '1', '0,1', '0', '3', '联系方式', '', '', '', 'about/', 'contactus', '/html/about/contactus/', '0', '0', 'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'联系方式\',\n  \'meta_keywords\' => \'联系方式\',\n  \'meta_description\' => \'联系方式\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '2', '1', '0', 'lianxifangshi', '');
INSERT INTO `t_category` VALUES ('4', '1', 'content', '1', '0', '1', '0,1', '0', '4', '版权声明', '', '', '', 'about/', 'copyright', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=4', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'版权声明\',\n  \'meta_keywords\' => \'版权声明\',\n  \'meta_description\' => \'版权声明\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '3', '1', '0', 'banquanshengming', '');
INSERT INTO `t_category` VALUES ('5', '1', 'content', '1', '0', '1', '0,1', '0', '5', '招聘信息', '', '', '', 'about/', 'hr', '/html/about/hr/', '0', '0', 'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '4', '1', '0', 'zhaopinxinxi', '');
INSERT INTO `t_category` VALUES ('6', '1', 'content', '0', '1', '0', '0', '1', '6,9,10,11,12,13,14', '小说', '', '', '', '', 'wenzhang', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=6', '5', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '1', '0', '0', 'xiaoshuo', '');
INSERT INTO `t_category` VALUES ('7', '1', 'content', '0', '2', '0', '0', '0', '7', '下载', '', '', '', '', 'down', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=7', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '2', '0', '0', 'xiazai', '');
INSERT INTO `t_category` VALUES ('8', '1', 'content', '0', '3', '0', '0', '1', '8,15,16,17,18,19,20,21', '图片', '', '', '', '', 'pps', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=8', '2', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '3', '0', '0', 'tupian', '');
INSERT INTO `t_category` VALUES ('27', '1', 'content', '0', '1', '0', '0', '0', '27', '模板', '', '', '', '', 'templates', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=27', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"list_template\":\"list_templates\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '27', '1', '0', 'moban', '');
INSERT INTO `t_category` VALUES ('9', '1', 'content', '0', '1', '6', '0,6', '0', '9', '激情文学', '', '', 'jiqingwenxue', 'wenzhang/', 'jiqingwenxue', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=9', '2', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '9', '1', '0', 'jiqingwenxue', '');
INSERT INTO `t_category` VALUES ('10', '1', 'content', '0', '1', '6', '0,6', '0', '10', '乱伦文学', '', '', '', 'wenzhang/', 'luanlunwenxue', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=10', '2', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '10', '1', '0', 'luanlunwenxue', '');
INSERT INTO `t_category` VALUES ('11', '1', 'content', '0', '1', '6', '0,6', '0', '11', '明星校园', '', '', '明星校园', 'wenzhang/', 'mingxingxiaoyuan', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=11', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '11', '1', '0', 'mingxingxiaoyuan', '');
INSERT INTO `t_category` VALUES ('12', '1', 'content', '0', '1', '6', '0,6', '0', '12', '武侠古典', '', '', '武侠古典', 'wenzhang/', 'wuxiagudian', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=12', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '12', '1', '0', 'wuxiagudian', '');
INSERT INTO `t_category` VALUES ('13', '1', 'content', '0', '1', '6', '0,6', '0', '13', '黄色笑话', '', '', '黄色笑话', 'wenzhang/', 'huangsexiaohua', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=13', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '13', '1', '0', 'huangsexiaohua', '');
INSERT INTO `t_category` VALUES ('14', '1', 'content', '0', '1', '6', '0,6', '0', '14', '性爱技巧', '', '', '', 'wenzhang/', 'xingaijiqiao', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=14', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '14', '1', '0', 'xingaijiqiao', '');
INSERT INTO `t_category` VALUES ('15', '1', 'content', '0', '3', '8', '0,8', '0', '15', '偷拍自拍', '', '', '', 'pps/', 'p_toupaizipai', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=15', '6', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '15', '1', '0', 'toupaizipai', '');
INSERT INTO `t_category` VALUES ('16', '1', 'content', '0', '3', '8', '0,8', '0', '16', '亚洲色图', '', '', '', 'pps/', 'yazhousetu', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=16', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '16', '1', '0', 'yazhousetu', '');
INSERT INTO `t_category` VALUES ('17', '1', 'content', '0', '3', '8', '0,8', '0', '17', '美腿丝袜', '', '', '', 'pps/', 'meituisiwa', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=17', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '17', '1', '0', 'meituisiwa', '');
INSERT INTO `t_category` VALUES ('18', '1', 'content', '0', '3', '8', '0,8', '0', '18', '欧美性爱', '', '', '', 'pps/', 'oumeixingai', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=18', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '18', '1', '0', 'oumeixingai', '');
INSERT INTO `t_category` VALUES ('19', '1', 'content', '0', '3', '8', '0,8', '0', '19', '激情明星', '', '', '', 'pps/', 'jiqingmingxing', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=19', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '19', '1', '0', 'jiqingmingxing', '');
INSERT INTO `t_category` VALUES ('20', '1', 'content', '0', '3', '8', '0,8', '0', '20', '清纯唯美', '', '', 'qingchunweimei', 'pps/', 'qingcunweimei', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=20', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '20', '1', '0', 'qingchunweimei', '');
INSERT INTO `t_category` VALUES ('21', '1', 'content', '0', '3', '8', '0,8', '0', '21', '成人动漫', '', '', '', 'pps/', 'chengrendongman', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=21', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '21', '1', '0', 'chengrendongman', '');
INSERT INTO `t_category` VALUES ('22', '1', 'content', '0', '11', '0', '0', '1', '22,23,24,25', '视频', '', '', '视频', '', 'shiping', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=22', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '22', '0', '0', 'shipin', '');
INSERT INTO `t_category` VALUES ('23', '1', 'content', '0', '11', '22', '0,22', '0', '23', '亚洲色情', '', '', '', 'shiping/', 'yazhouseqing', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=23', '100', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '23', '1', '0', 'yazhouseqing', '');
INSERT INTO `t_category` VALUES ('24', '1', 'content', '0', '11', '22', '0,22', '0', '24', '制服丝袜', '', '', '', 'shiping/', 'zhifusiwa', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=24', '60', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '24', '1', '0', 'zhifusiwa', '');
INSERT INTO `t_category` VALUES ('25', '1', 'content', '0', '11', '22', '0,22', '0', '25', '欧美性爱', '', '', '', 'shiping/', 'oumeixingai', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=25', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '25', '1', '0', 'oumeixingai', '');
INSERT INTO `t_category` VALUES ('26', '1', 'content', '0', '1', '0', '0', '0', '26', '案例', '', '', '案例', '', 'site_case', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=26', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"list_template\":\"list_case\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '26', '1', '0', 'anli', '');
INSERT INTO `t_category` VALUES ('28', '1', 'content', '1', '0', '0', '0', '0', '28', '加盟', '', '', '', '', 'jiameng', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=28', '0', '0', '{\"ishtml\":\"0\",\"template_list\":\"master\",\"page_template\":\"page_jiameng\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', '28', '1', '0', 'jiameng', '');
INSERT INTO `t_category` VALUES ('29', '1', 'content', '0', '1', '0', '0', '0', '29', '帮助', '', '', '', '', 'help', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=29', '6', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"list_template\":\"list_help\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '29', '1', '0', 'bangzhu', '');
INSERT INTO `t_category` VALUES ('30', '1', 'content', '0', '1', '0', '0', '0', '30', '推广教程', '', '', '', '', 'spread', 'http://www.master.com/index.php?m=content&c=index&a=lists&catid=30', '6', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"master\",\"list_template\":\"list_spread\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '30', '1', '0', 'tuiguangjiaocheng', '');

-- ----------------------------
-- Table structure for `t_category_priv`
-- ----------------------------
DROP TABLE IF EXISTS `t_category_priv`;
CREATE TABLE `t_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `t_collection_content`
-- ----------------------------
DROP TABLE IF EXISTS `t_collection_content`;
CREATE TABLE `t_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collection_content
-- ----------------------------
INSERT INTO `t_collection_content` VALUES ('1', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22819.html', '乡下理发店大姐推油打飞机', '{\"title\":\"\\u4e61\\u4e0b\\u7406\\u53d1\\u5e97\\u5927\\u59d0\\u63a8\\u6cb9\\u6253\\u98de\\u673a \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962324\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2319.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('2', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22818.html', '舞蹈老师身体柔软姿势万千', '{\"title\":\"\\u821e\\u8e48\\u8001\\u5e08\\u8eab\\u4f53\\u67d4\\u8f6f\\u59ff\\u52bf\\u4e07\\u5343 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962324\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2320.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('3', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22817.html', '巨乳妹想啪啪啪了来个哥哥呗', '{\"title\":\"\\u5de8\\u4e73\\u59b9\\u60f3\\u556a\\u556a\\u556a\\u4e86\\u6765\\u4e2a\\u54e5\\u54e5\\u5457 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962323\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2321.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('4', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22816.html', '情趣嫩B特写内射射太多了一直往', '{\"title\":\"\\u60c5\\u8da3\\u5ae9B\\u7279\\u5199\\u5185\\u5c04\\u5c04\\u592a\\u591a\\u4e86\\u4e00\\u76f4\\u5f80\\u5916\\u6d41 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962323\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2322.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('5', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22815.html', '西安丝袜会所小姐好爽姐撸的我', '{\"title\":\"\\u897f\\u5b89\\u4e1d\\u889c\\u4f1a\\u6240\\u5c0f\\u59d0\\u597d\\u723d\\u59d0\\u64b8\\u7684\\u6211 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962322\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2323.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('6', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22763.html', '8合1让你一次撸个够', '{\"title\":\"8\\u54081\\u8ba9\\u4f60\\u4e00\\u6b21\\u64b8\\u4e2a\\u591f \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962322\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2314.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('7', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22762.html', '换妻俱乐部群P大战一触即发', '{\"title\":\"\\u6362\\u59bb\\u4ff1\\u4e50\\u90e8\\u7fa4P\\u5927\\u6218\\u4e00\\u89e6\\u5373\\u53d1 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962320\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2315.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('8', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22761.html', '高清口交，多体位爆操', '{\"title\":\"\\u9ad8\\u6e05\\u53e3\\u4ea4\\uff0c\\u591a\\u4f53\\u4f4d\\u7206\\u64cd \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962320\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2316.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('9', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22760.html', '青岛 骚货她要自慰给我看', '{\"title\":\"\\u9752\\u5c9b \\u9a9a\\u8d27\\u5979\\u8981\\u81ea\\u6170\\u7ed9\\u6211\\u770b \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962319\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2317.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('10', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22759.html', '滴蜡捆绑轻微SM叫声娇喘', '{\"title\":\"\\u6ef4\\u8721\\u6346\\u7ed1\\u8f7b\\u5faeSM\\u53eb\\u58f0\\u5a07\\u5598 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962319\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2318.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('11', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22731.html', '骚逼说不洗鸡巴不给我口', '{\"title\":\"\\u9a9a\\u903c\\u8bf4\\u4e0d\\u6d17\\u9e21\\u5df4\\u4e0d\\u7ed9\\u6211\\u53e3  \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962318\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2309.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('12', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22730.html', '每去一个地方都能找到个有小姐姐', '{\"title\":\"\\u6bcf\\u53bb\\u4e00\\u4e2a\\u5730\\u65b9\\u90fd\\u80fd\\u627e\\u5230\\u4e2a\\u6709\\u5c0f\\u59d0\\u59d0\\u7684\\u9152\\u5e97 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962318\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2310.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('13', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22729.html', '木浴盆大战，你们见过这样的浴盆', '{\"title\":\"\\u6728\\u6d74\\u76c6\\u5927\\u6218\\uff0c\\u4f60\\u4eec\\u89c1\\u8fc7\\u8fd9\\u6837\\u7684\\u6d74\\u76c6\\u5417 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962317\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2311.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('14', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22728.html', '喜欢做爱的美女看过来 百分百满', '{\"title\":\"\\u559c\\u6b22\\u505a\\u7231\\u7684\\u7f8e\\u5973\\u770b\\u8fc7\\u6765 \\u767e\\u5206\\u767e\\u6ee1\\u8db3 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962317\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2312.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('15', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22727.html', '高端会所一个漂亮的胸推妹子', '{\"title\":\"\\u9ad8\\u7aef\\u4f1a\\u6240\\u4e00\\u4e2a\\u6f02\\u4eae\\u7684\\u80f8\\u63a8\\u59b9\\u5b50 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962316\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2313.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('16', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22709.html', '出来约炮别人家的女人什么都愿意', '{\"title\":\"\\u51fa\\u6765\\u7ea6\\u70ae\\u522b\\u4eba\\u5bb6\\u7684\\u5973\\u4eba\\u4ec0\\u4e48\\u90fd\\u613f\\u610f\\u914d\\u5408 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962316\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2304.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('17', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22708.html', '曾经的前女友 很多年了在见面不', '{\"title\":\"\\u66fe\\u7ecf\\u7684\\u524d\\u5973\\u53cb \\u5f88\\u591a\\u5e74\\u4e86\\u5728\\u89c1\\u9762\\u4e0d\\u8bf4\\u522b\\u7684\\u5148\\u505a\\u7231 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962314\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2305.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('18', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22707.html', '上海学生妹丝足服务上门 裸足足', '{\"title\":\"\\u4e0a\\u6d77\\u5b66\\u751f\\u59b9\\u4e1d\\u8db3\\u670d\\u52a1\\u4e0a\\u95e8 \\u88f8\\u8db3\\u8db3\\u4ea4 \\u5b66\\u751f\\u59b9 \\u5f88\\u723d \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962314\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2306.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('19', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22706.html', 'KTV唱歌认识的朋友的朋友晚上', '{\"title\":\"KTV\\u5531\\u6b4c\\u8ba4\\u8bc6\\u7684\\u670b\\u53cb\\u7684\\u670b\\u53cb\\u665a\\u4e0a\\u53bb\\u5f00\\u623f \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962313\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2307.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('20', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22705.html', '黑絲抱著插 香奈兒', '{\"title\":\"\\u9ed1\\u7d72\\u62b1\\u8457\\u63d2 \\u9999\\u5948\\u5152  \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962313\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2308.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('21', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22685.html', '护士制服诱惑自慰潮喷', '{\"title\":\"\\u62a4\\u58eb\\u5236\\u670d\\u8bf1\\u60d1\\u81ea\\u6170\\u6f6e\\u55b7  \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962313\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2299.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('22', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22684.html', '98年学妹细长小腿足交', '{\"title\":\"98\\u5e74\\u5b66\\u59b9\\u7ec6\\u957f\\u5c0f\\u817f\\u8db3\\u4ea4 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962313\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2300.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('23', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22683.html', '东莞会所高挑美女给我做胸推口活', '{\"title\":\"\\u4e1c\\u839e\\u4f1a\\u6240\\u9ad8\\u6311\\u7f8e\\u5973\\u7ed9\\u6211\\u505a\\u80f8\\u63a8\\u53e3\\u6d3b\\u6309\\u6469\\u670d\\u52a1 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962312\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2301.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('24', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22682.html', '北京怀念之极品黑丝美腿', '{\"title\":\"\\u5317\\u4eac\\u6000\\u5ff5\\u4e4b\\u6781\\u54c1\\u9ed1\\u4e1d\\u7f8e\\u817f  \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962312\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2302.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('25', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22681.html', '北京怀念之大胸少妇', '{\"title\":\"\\u5317\\u4eac\\u6000\\u5ff5\\u4e4b\\u5927\\u80f8\\u5c11\\u5987  \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962311\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/08\\/p2303.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('26', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22660.html', '小骚货高潮胡乱叫喊', '{\"title\":\"\\u5c0f\\u9a9a\\u8d27\\u9ad8\\u6f6e\\u80e1\\u4e71\\u53eb\\u558a  \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962311\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2294.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('27', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22659.html', '卖衣服的足交，技术不熟练', '{\"title\":\"\\u5356\\u8863\\u670d\\u7684\\u8db3\\u4ea4\\uff0c\\u6280\\u672f\\u4e0d\\u719f\\u7ec3 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962310\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2295.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('28', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22658.html', '约炮172CM豪乳性感黑丝模特', '{\"title\":\"\\u7ea6\\u70ae172CM\\u8c6a\\u4e73\\u6027\\u611f\\u9ed1\\u4e1d\\u6a21\\u7279 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962310\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2296.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('29', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22657.html', '口交超大鸡吧根本吞不下去', '{\"title\":\"\\u53e3\\u4ea4\\u8d85\\u5927\\u9e21\\u5427\\u6839\\u672c\\u541e\\u4e0d\\u4e0b\\u53bb \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962308\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2297.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('30', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22656.html', '高颜值混血金融白领 一身骚', '{\"title\":\"\\u9ad8\\u989c\\u503c\\u6df7\\u8840\\u91d1\\u878d\\u767d\\u9886 \\u4e00\\u8eab\\u9a9a \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962308\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2298.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('31', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22629.html', '跪下来给我舔 躺着让我操', '{\"title\":\"\\u8dea\\u4e0b\\u6765\\u7ed9\\u6211\\u8214 \\u8eba\\u7740\\u8ba9\\u6211\\u64cd \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962307\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2289.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('32', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22628.html', '极品女神酒店阳台大胆深喉口爆', '{\"title\":\"\\u6781\\u54c1\\u5973\\u795e\\u9152\\u5e97\\u9633\\u53f0\\u5927\\u80c6\\u6df1\\u5589\\u53e3\\u7206 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962307\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2290.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('33', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22627.html', '偷情第二炮老婆查岗 直接就给吓', '{\"title\":\"\\u5077\\u60c5\\u7b2c\\u4e8c\\u70ae\\u8001\\u5a46\\u67e5\\u5c97 \\u76f4\\u63a5\\u5c31\\u7ed9\\u5413\\u51fa\\u6765\\u4e86 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962306\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2291.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('34', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22626.html', '潮吹女王野外露出小树林野战', '{\"title\":\"\\u6f6e\\u5439\\u5973\\u738b\\u91ce\\u5916\\u9732\\u51fa\\u5c0f\\u6811\\u6797\\u91ce\\u6218  \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962306\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2292.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('35', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22625.html', '紅衣幼師藤浦惠', '{\"title\":\"\\u7d05\\u8863\\u5e7c\\u5e2b\\u85e4\\u6d66\\u60e0 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962304\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2293.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('36', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22605.html', '农村泡澡推油，另一番风情', '{\"title\":\"\\u519c\\u6751\\u6ce1\\u6fa1\\u63a8\\u6cb9\\uff0c\\u53e6\\u4e00\\u756a\\u98ce\\u60c5 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962304\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2284.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('37', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22604.html', '宾馆约的小骚货 摸摸就出水', '{\"title\":\"\\u5bbe\\u9986\\u7ea6\\u7684\\u5c0f\\u9a9a\\u8d27 \\u6478\\u6478\\u5c31\\u51fa\\u6c34 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962302\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2285.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('38', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22603.html', '常年累月我在足疗店的专属技师', '{\"title\":\"\\u5e38\\u5e74\\u7d2f\\u6708\\u6211\\u5728\\u8db3\\u7597\\u5e97\\u7684\\u4e13\\u5c5e\\u6280\\u5e08 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962302\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2286.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('39', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22602.html', '偷情18岁女孩差点被她姐姐看到', '{\"title\":\"\\u5077\\u60c518\\u5c81\\u5973\\u5b69\\u5dee\\u70b9\\u88ab\\u5979\\u59d0\\u59d0\\u770b\\u5230 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962300\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2287.mp4\",\"content\":\"\"}');
INSERT INTO `t_collection_content` VALUES ('40', '1', '1', '2', 'http://www.deaishe.com/vodhtml/22601.html', '妩媚小女人丝袜按摩口暴', '{\"title\":\"\\u59a9\\u5a9a\\u5c0f\\u5973\\u4eba\\u4e1d\\u889c\\u6309\\u6469\\u53e3\\u66b4 \\u7f51\\u53cb\\u81ea\\u62cd - \\u5f97\\u7231\\u5c04\\u5728\\u7ebf\\u89c6\\u9891\",\"time\":\"1511962300\",\"video\":\"http:\\/\\/v4.pipib.net:8088\\/07\\/p2288.mp4\",\"content\":\"\"}');

-- ----------------------------
-- Table structure for `t_collection_history`
-- ----------------------------
DROP TABLE IF EXISTS `t_collection_history`;
CREATE TABLE `t_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collection_history
-- ----------------------------

-- ----------------------------
-- Table structure for `t_collection_node`
-- ----------------------------
DROP TABLE IF EXISTS `t_collection_node`;
CREATE TABLE `t_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collection_node
-- ----------------------------
INSERT INTO `t_collection_node` VALUES ('1', '视频采集地址', '1511962324', '1', 'utf-8', '1', 'http://www.deaishe.com/vodlist/31-(*).html', '1', '3', '', '1', '', '', '<div class=\"vodbox\">\r\n        <ul>', '</li>\r\n          \r\n        </ul>\r\n      </div>\r\n      <div class=cr></div>\r\n', '<title>[内容]</title>', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '0', '0', '1', '{\"0\":{\"name\":\"\\u89c6\\u9891\\u5730\\u5740\",\"en_name\":\"video\",\"rule\":\"var flashvars={        \\r\\n\\t\\tf:\'[\\u5185\\u5bb9]\', \",\"html_rule\":\"\"}}');

-- ----------------------------
-- Table structure for `t_collection_program`
-- ----------------------------
DROP TABLE IF EXISTS `t_collection_program`;
CREATE TABLE `t_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collection_program
-- ----------------------------
INSERT INTO `t_collection_program` VALUES ('1', '1', '1', '11', '23', '{\"add_introduce\":\"0\",\"auto_thumb\":\"0\",\"introcude_length\":\"200\",\"auto_thumb_no\":\"1\",\"content_status\":\"99\",\"map\":{\"title\":\"title\",\"video\":\"video\",\"updatetime\":\"time\",\"content\":\"content\",\"inputtime\":\"time\"},\"funcs\":{\"title\":\"trim\",\"video\":\"trim\"}}');
INSERT INTO `t_collection_program` VALUES ('2', '1', '1', '11', '24', '{\"add_introduce\":\"0\",\"auto_thumb\":\"0\",\"introcude_length\":\"200\",\"auto_thumb_no\":\"1\",\"content_status\":\"99\",\"map\":{\"video_url\":\"video\",\"title\":\"title\",\"video\":\"video\",\"updatetime\":\"time\",\"content\":\"content\",\"inputtime\":\"time\"}}');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `commentid` char(30) NOT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `total` int(8) unsigned DEFAULT '0',
  `square` mediumint(8) unsigned DEFAULT '0',
  `anti` mediumint(8) unsigned DEFAULT '0',
  `neutral` mediumint(8) unsigned DEFAULT '0',
  `display_type` tinyint(1) DEFAULT '0',
  `tableid` mediumint(8) unsigned DEFAULT '0',
  `lastupdate` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`commentid`),
  KEY `lastupdate` (`lastupdate`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_comment_check`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_check`;
CREATE TABLE `t_comment_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_data_id` int(10) DEFAULT '0' COMMENT '论评ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `tableid` mediumint(8) DEFAULT '0' COMMENT '数据存储表ID',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `comment_data_id` (`comment_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment_check
-- ----------------------------

-- ----------------------------
-- Table structure for `t_comment_data_1`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_data_1`;
CREATE TABLE `t_comment_data_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `commentid` char(30) NOT NULL DEFAULT '' COMMENT '评论ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `userid` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `creat_at` int(10) DEFAULT NULL COMMENT '发布时间',
  `ip` varchar(15) DEFAULT NULL COMMENT '用户IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '评论状态{0:未审核,-1:未通过审核,1:通过审核}',
  `content` text COMMENT '评论内容',
  `direction` tinyint(1) DEFAULT '0' COMMENT '评论方向{0:无方向,1:正文,2:反方,3:中立}',
  `support` mediumint(8) unsigned DEFAULT '0' COMMENT '支持数',
  `reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为回复',
  PRIMARY KEY (`id`),
  KEY `commentid` (`commentid`),
  KEY `direction` (`direction`),
  KEY `siteid` (`siteid`),
  KEY `support` (`support`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment_data_1
-- ----------------------------

-- ----------------------------
-- Table structure for `t_comment_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_setting`;
CREATE TABLE `t_comment_setting` (
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `guest` tinyint(1) DEFAULT '0' COMMENT '是否允许游客评论',
  `check` tinyint(1) DEFAULT '0' COMMENT '是否需要审核',
  `code` tinyint(1) DEFAULT '0' COMMENT '是否开启验证码',
  `add_point` tinyint(3) unsigned DEFAULT '0' COMMENT '添加的积分数',
  `del_point` tinyint(3) unsigned DEFAULT '0' COMMENT '扣除的积分数',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment_setting
-- ----------------------------
INSERT INTO `t_comment_setting` VALUES ('1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `t_comment_table`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_table`;
CREATE TABLE `t_comment_table` (
  `tableid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '表ID号',
  `total` int(10) unsigned DEFAULT '0' COMMENT '数据总量',
  `creat_at` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment_table
-- ----------------------------
INSERT INTO `t_comment_table` VALUES ('1', '0', '0');

-- ----------------------------
-- Table structure for `t_content_check`
-- ----------------------------
DROP TABLE IF EXISTS `t_content_check`;
CREATE TABLE `t_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_content_check
-- ----------------------------

-- ----------------------------
-- Table structure for `t_copyfrom`
-- ----------------------------
DROP TABLE IF EXISTS `t_copyfrom`;
CREATE TABLE `t_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_copyfrom
-- ----------------------------

-- ----------------------------
-- Table structure for `t_datacall`
-- ----------------------------
DROP TABLE IF EXISTS `t_datacall`;
CREATE TABLE `t_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_datacall
-- ----------------------------

-- ----------------------------
-- Table structure for `t_dbsource`
-- ----------------------------
DROP TABLE IF EXISTS `t_dbsource`;
CREATE TABLE `t_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dbsource
-- ----------------------------

-- ----------------------------
-- Table structure for `t_download`
-- ----------------------------
DROP TABLE IF EXISTS `t_download`;
CREATE TABLE `t_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_download
-- ----------------------------

-- ----------------------------
-- Table structure for `t_download_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_download_data`;
CREATE TABLE `t_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_download_data
-- ----------------------------

-- ----------------------------
-- Table structure for `t_downservers`
-- ----------------------------
DROP TABLE IF EXISTS `t_downservers`;
CREATE TABLE `t_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_downservers
-- ----------------------------

-- ----------------------------
-- Table structure for `t_extend_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_extend_setting`;
CREATE TABLE `t_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_extend_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `t_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `t_favorite`;
CREATE TABLE `t_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `t_hits`
-- ----------------------------
DROP TABLE IF EXISTS `t_hits`;
CREATE TABLE `t_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hits
-- ----------------------------
INSERT INTO `t_hits` VALUES ('c-1-1', '6', '1', '0', '1', '1', '1', '1507301261');
INSERT INTO `t_hits` VALUES ('c-1-2', '9', '2', '0', '1', '1', '1', '1511061781');
INSERT INTO `t_hits` VALUES ('c-1-3', '9', '1', '0', '1', '1', '1', '1507351578');
INSERT INTO `t_hits` VALUES ('c-1-4', '10', '3', '0', '1', '1', '1', '1510840057');
INSERT INTO `t_hits` VALUES ('c-3-1', '15', '1', '0', '1', '1', '1', '1507303158');
INSERT INTO `t_hits` VALUES ('c-1-5', '10', '2', '0', '2', '2', '2', '1507556499');
INSERT INTO `t_hits` VALUES ('c-3-2', '15', '0', '0', '0', '0', '0', '1507557368');
INSERT INTO `t_hits` VALUES ('c-3-3', '15', '0', '0', '0', '0', '0', '1507557436');
INSERT INTO `t_hits` VALUES ('c-3-4', '15', '0', '0', '0', '0', '0', '1507558334');
INSERT INTO `t_hits` VALUES ('c-3-5', '15', '0', '0', '0', '0', '0', '1507558542');
INSERT INTO `t_hits` VALUES ('c-3-6', '15', '0', '0', '0', '0', '0', '1507558604');
INSERT INTO `t_hits` VALUES ('c-11-1', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-2', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-3', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-4', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-5', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-6', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-7', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-8', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-9', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-10', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-11', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-12', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-13', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-14', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-15', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-16', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-17', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-18', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-19', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-20', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-21', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-22', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-23', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-24', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-25', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-26', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-27', '23', '0', '0', '0', '0', '0', '1511962870');
INSERT INTO `t_hits` VALUES ('c-11-28', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-30', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-29', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-31', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-32', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-33', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-34', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-35', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-36', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-37', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-38', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-39', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-40', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-41', '23', '0', '0', '0', '0', '0', '1511962873');
INSERT INTO `t_hits` VALUES ('c-11-42', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-43', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-44', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-45', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-46', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-47', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-48', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-49', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-50', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-51', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-52', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-53', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-54', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-55', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-56', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-57', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-58', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-59', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-60', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-61', '23', '0', '0', '0', '0', '0', '1511962874');
INSERT INTO `t_hits` VALUES ('c-11-62', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-63', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-65', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-64', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-66', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-67', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-68', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-69', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-70', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-71', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-72', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-73', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-74', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-75', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-76', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-77', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-78', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-79', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-80', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-81', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-82', '23', '0', '0', '0', '0', '0', '1511962875');
INSERT INTO `t_hits` VALUES ('c-11-83', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-84', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-85', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-86', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-87', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-88', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-89', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-90', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-91', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-92', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-93', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-94', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-95', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-96', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-97', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-98', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-99', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-100', '23', '0', '0', '0', '0', '0', '1511962876');
INSERT INTO `t_hits` VALUES ('c-11-101', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-102', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-103', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-104', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-105', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-106', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-107', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-108', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-109', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-110', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-111', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-112', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-113', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-114', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-115', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-116', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-117', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-118', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-120', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-119', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-121', '24', '0', '0', '0', '0', '0', '1511963365');
INSERT INTO `t_hits` VALUES ('c-11-122', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-123', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-124', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-125', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-126', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-127', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-128', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-129', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-130', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-131', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-132', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-133', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-134', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-135', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-136', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-137', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-138', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-139', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-140', '24', '0', '0', '0', '0', '0', '1511963366');
INSERT INTO `t_hits` VALUES ('c-11-141', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-142', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-143', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-144', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-145', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-146', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-147', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-148', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-149', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-150', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-151', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-152', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-153', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-154', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-155', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-156', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-157', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-158', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-159', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-11-160', '24', '0', '0', '0', '0', '0', '1511963368');
INSERT INTO `t_hits` VALUES ('c-1-6', '29', '0', '0', '0', '0', '0', '1514524838');
INSERT INTO `t_hits` VALUES ('c-1-7', '29', '0', '0', '0', '0', '0', '1514524946');
INSERT INTO `t_hits` VALUES ('c-1-8', '29', '0', '0', '0', '0', '0', '1514525062');
INSERT INTO `t_hits` VALUES ('c-1-9', '29', '0', '0', '0', '0', '0', '1514525135');
INSERT INTO `t_hits` VALUES ('c-1-10', '29', '0', '0', '0', '0', '0', '1514525210');
INSERT INTO `t_hits` VALUES ('c-1-11', '29', '0', '0', '0', '0', '0', '1514526058');
INSERT INTO `t_hits` VALUES ('c-1-12', '30', '0', '0', '0', '0', '0', '1514526589');
INSERT INTO `t_hits` VALUES ('c-1-13', '30', '0', '0', '0', '0', '0', '1514526787');
INSERT INTO `t_hits` VALUES ('c-1-14', '30', '0', '0', '0', '0', '0', '1514526856');
INSERT INTO `t_hits` VALUES ('c-1-15', '30', '0', '0', '0', '0', '0', '1514526910');
INSERT INTO `t_hits` VALUES ('c-1-16', '30', '0', '0', '0', '0', '0', '1514527107');
INSERT INTO `t_hits` VALUES ('c-1-17', '30', '0', '0', '0', '0', '0', '1514527176');

-- ----------------------------
-- Table structure for `t_ipbanned`
-- ----------------------------
DROP TABLE IF EXISTS `t_ipbanned`;
CREATE TABLE `t_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ipbanned
-- ----------------------------

-- ----------------------------
-- Table structure for `t_keylink`
-- ----------------------------
DROP TABLE IF EXISTS `t_keylink`;
CREATE TABLE `t_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_keylink
-- ----------------------------

-- ----------------------------
-- Table structure for `t_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `t_keyword`;
CREATE TABLE `t_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_keyword
-- ----------------------------
INSERT INTO `t_keyword` VALUES ('1', '1', '新闻', 'xinwen', '1', '0');
INSERT INTO `t_keyword` VALUES ('2', '1', '少妇白洁', 'shaofubaijie', '1', '0');
INSERT INTO `t_keyword` VALUES ('3', '1', '白洁', 'baijie', '1', '0');
INSERT INTO `t_keyword` VALUES ('4', '1', '少妇', 'shaofu', '1', '0');
INSERT INTO `t_keyword` VALUES ('5', '1', '文学', 'wenxue', '1', '0');
INSERT INTO `t_keyword` VALUES ('6', '1', 'test123', 'test123', '1', '0');
INSERT INTO `t_keyword` VALUES ('7', '1', '测试下哦', 'ceshixiao', '2', '0');
INSERT INTO `t_keyword` VALUES ('8', '1', '121', '121', '3', '0');
INSERT INTO `t_keyword` VALUES ('9', '1', '大额分', 'daefen', '1', '0');
INSERT INTO `t_keyword` VALUES ('10', '1', '324确认1212', '324queren1212', '1', '0');
INSERT INTO `t_keyword` VALUES ('11', '1', '', '', '160', '0');
INSERT INTO `t_keyword` VALUES ('12', '1', '如何免费创建一个色情网站', 'ruhemianfeichuangjianyigeseqingwangzhan', '1', '0');
INSERT INTO `t_keyword` VALUES ('13', '1', '域名', 'yuming', '1', '0');
INSERT INTO `t_keyword` VALUES ('14', '1', '网站', 'wangzhan', '3', '0');
INSERT INTO `t_keyword` VALUES ('15', '1', '如何申请提现', 'ruheshenqingtixian', '1', '0');
INSERT INTO `t_keyword` VALUES ('16', '1', '上传', 'shangchuan', '1', '0');
INSERT INTO `t_keyword` VALUES ('17', '1', '视频和图片', 'shipinhetupian', '1', '0');
INSERT INTO `t_keyword` VALUES ('18', '1', '系统', 'xitong', '1', '0');
INSERT INTO `t_keyword` VALUES ('19', '1', '图片', 'tupian', '1', '0');
INSERT INTO `t_keyword` VALUES ('20', '1', '视频', 'shipin', '1', '0');
INSERT INTO `t_keyword` VALUES ('21', '1', '网站不能正常访问了怎么办', 'wangzhanbunengzhengchangfangwenliaozenmeban', '2', '0');
INSERT INTO `t_keyword` VALUES ('22', '1', '如何在QQ群中推广该网站', 'ruhezaiqqqunzhongtuiguanggaiwangzhan', '1', '0');
INSERT INTO `t_keyword` VALUES ('23', '1', '视频直播', 'shipinzhibo', '1', '0');
INSERT INTO `t_keyword` VALUES ('24', '1', '选择好记的站名或者关键词', 'xuanzehaojidezhanminghuozheguanjianci', '1', '0');
INSERT INTO `t_keyword` VALUES ('25', '1', '灰色', 'huise', '2', '0');
INSERT INTO `t_keyword` VALUES ('26', '1', '行业灰色行业', 'xingyehuisexingye', '1', '0');
INSERT INTO `t_keyword` VALUES ('27', '1', '产品', 'chanpin', '1', '0');

-- ----------------------------
-- Table structure for `t_keyword_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_keyword_data`;
CREATE TABLE `t_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_keyword_data
-- ----------------------------
INSERT INTO `t_keyword_data` VALUES ('1', '1', '1', '1-1');
INSERT INTO `t_keyword_data` VALUES ('2', '2', '1', '2-1');
INSERT INTO `t_keyword_data` VALUES ('3', '3', '1', '3-1');
INSERT INTO `t_keyword_data` VALUES ('4', '4', '1', '3-1');
INSERT INTO `t_keyword_data` VALUES ('5', '5', '1', '4-1');
INSERT INTO `t_keyword_data` VALUES ('6', '6', '1', '1-3');
INSERT INTO `t_keyword_data` VALUES ('7', '7', '1', '5-1');
INSERT INTO `t_keyword_data` VALUES ('8', '8', '1', '2-3');
INSERT INTO `t_keyword_data` VALUES ('9', '8', '1', '3-3');
INSERT INTO `t_keyword_data` VALUES ('10', '9', '1', '4-3');
INSERT INTO `t_keyword_data` VALUES ('11', '8', '1', '5-3');
INSERT INTO `t_keyword_data` VALUES ('12', '10', '1', '6-3');
INSERT INTO `t_keyword_data` VALUES ('13', '11', '1', '1-11');
INSERT INTO `t_keyword_data` VALUES ('14', '11', '1', '2-11');
INSERT INTO `t_keyword_data` VALUES ('15', '11', '1', '3-11');
INSERT INTO `t_keyword_data` VALUES ('16', '11', '1', '4-11');
INSERT INTO `t_keyword_data` VALUES ('17', '11', '1', '6-11');
INSERT INTO `t_keyword_data` VALUES ('18', '11', '1', '7-11');
INSERT INTO `t_keyword_data` VALUES ('19', '11', '1', '8-11');
INSERT INTO `t_keyword_data` VALUES ('20', '11', '1', '9-11');
INSERT INTO `t_keyword_data` VALUES ('21', '11', '1', '10-11');
INSERT INTO `t_keyword_data` VALUES ('22', '11', '1', '11-11');
INSERT INTO `t_keyword_data` VALUES ('23', '11', '1', '12-11');
INSERT INTO `t_keyword_data` VALUES ('24', '11', '1', '13-11');
INSERT INTO `t_keyword_data` VALUES ('25', '11', '1', '14-11');
INSERT INTO `t_keyword_data` VALUES ('26', '11', '1', '5-11');
INSERT INTO `t_keyword_data` VALUES ('27', '11', '1', '15-11');
INSERT INTO `t_keyword_data` VALUES ('28', '11', '1', '16-11');
INSERT INTO `t_keyword_data` VALUES ('29', '11', '1', '17-11');
INSERT INTO `t_keyword_data` VALUES ('30', '11', '1', '18-11');
INSERT INTO `t_keyword_data` VALUES ('31', '11', '1', '19-11');
INSERT INTO `t_keyword_data` VALUES ('32', '11', '1', '20-11');
INSERT INTO `t_keyword_data` VALUES ('33', '11', '1', '21-11');
INSERT INTO `t_keyword_data` VALUES ('34', '11', '1', '22-11');
INSERT INTO `t_keyword_data` VALUES ('35', '11', '1', '23-11');
INSERT INTO `t_keyword_data` VALUES ('36', '11', '1', '24-11');
INSERT INTO `t_keyword_data` VALUES ('37', '11', '1', '25-11');
INSERT INTO `t_keyword_data` VALUES ('38', '11', '1', '26-11');
INSERT INTO `t_keyword_data` VALUES ('39', '11', '1', '27-11');
INSERT INTO `t_keyword_data` VALUES ('40', '11', '1', '28-11');
INSERT INTO `t_keyword_data` VALUES ('41', '11', '1', '30-11');
INSERT INTO `t_keyword_data` VALUES ('42', '11', '1', '31-11');
INSERT INTO `t_keyword_data` VALUES ('43', '11', '1', '32-11');
INSERT INTO `t_keyword_data` VALUES ('44', '11', '1', '33-11');
INSERT INTO `t_keyword_data` VALUES ('45', '11', '1', '34-11');
INSERT INTO `t_keyword_data` VALUES ('46', '11', '1', '35-11');
INSERT INTO `t_keyword_data` VALUES ('47', '11', '1', '36-11');
INSERT INTO `t_keyword_data` VALUES ('48', '11', '1', '37-11');
INSERT INTO `t_keyword_data` VALUES ('49', '11', '1', '38-11');
INSERT INTO `t_keyword_data` VALUES ('50', '11', '1', '39-11');
INSERT INTO `t_keyword_data` VALUES ('51', '11', '1', '40-11');
INSERT INTO `t_keyword_data` VALUES ('52', '11', '1', '41-11');
INSERT INTO `t_keyword_data` VALUES ('53', '11', '1', '29-11');
INSERT INTO `t_keyword_data` VALUES ('54', '11', '1', '42-11');
INSERT INTO `t_keyword_data` VALUES ('55', '11', '1', '43-11');
INSERT INTO `t_keyword_data` VALUES ('56', '11', '1', '44-11');
INSERT INTO `t_keyword_data` VALUES ('57', '11', '1', '45-11');
INSERT INTO `t_keyword_data` VALUES ('58', '11', '1', '47-11');
INSERT INTO `t_keyword_data` VALUES ('59', '11', '1', '48-11');
INSERT INTO `t_keyword_data` VALUES ('60', '11', '1', '49-11');
INSERT INTO `t_keyword_data` VALUES ('61', '11', '1', '50-11');
INSERT INTO `t_keyword_data` VALUES ('62', '11', '1', '51-11');
INSERT INTO `t_keyword_data` VALUES ('63', '11', '1', '52-11');
INSERT INTO `t_keyword_data` VALUES ('64', '11', '1', '53-11');
INSERT INTO `t_keyword_data` VALUES ('65', '11', '1', '54-11');
INSERT INTO `t_keyword_data` VALUES ('66', '11', '1', '55-11');
INSERT INTO `t_keyword_data` VALUES ('67', '11', '1', '56-11');
INSERT INTO `t_keyword_data` VALUES ('68', '11', '1', '57-11');
INSERT INTO `t_keyword_data` VALUES ('69', '11', '1', '58-11');
INSERT INTO `t_keyword_data` VALUES ('70', '11', '1', '59-11');
INSERT INTO `t_keyword_data` VALUES ('71', '11', '1', '60-11');
INSERT INTO `t_keyword_data` VALUES ('72', '11', '1', '46-11');
INSERT INTO `t_keyword_data` VALUES ('73', '11', '1', '61-11');
INSERT INTO `t_keyword_data` VALUES ('74', '11', '1', '62-11');
INSERT INTO `t_keyword_data` VALUES ('75', '11', '1', '63-11');
INSERT INTO `t_keyword_data` VALUES ('76', '11', '1', '65-11');
INSERT INTO `t_keyword_data` VALUES ('77', '11', '1', '66-11');
INSERT INTO `t_keyword_data` VALUES ('78', '11', '1', '67-11');
INSERT INTO `t_keyword_data` VALUES ('79', '11', '1', '68-11');
INSERT INTO `t_keyword_data` VALUES ('80', '11', '1', '69-11');
INSERT INTO `t_keyword_data` VALUES ('81', '11', '1', '70-11');
INSERT INTO `t_keyword_data` VALUES ('82', '11', '1', '71-11');
INSERT INTO `t_keyword_data` VALUES ('83', '11', '1', '72-11');
INSERT INTO `t_keyword_data` VALUES ('84', '11', '1', '73-11');
INSERT INTO `t_keyword_data` VALUES ('85', '11', '1', '74-11');
INSERT INTO `t_keyword_data` VALUES ('86', '11', '1', '75-11');
INSERT INTO `t_keyword_data` VALUES ('87', '11', '1', '76-11');
INSERT INTO `t_keyword_data` VALUES ('88', '11', '1', '77-11');
INSERT INTO `t_keyword_data` VALUES ('89', '11', '1', '78-11');
INSERT INTO `t_keyword_data` VALUES ('90', '11', '1', '79-11');
INSERT INTO `t_keyword_data` VALUES ('91', '11', '1', '64-11');
INSERT INTO `t_keyword_data` VALUES ('92', '11', '1', '80-11');
INSERT INTO `t_keyword_data` VALUES ('93', '11', '1', '81-11');
INSERT INTO `t_keyword_data` VALUES ('94', '11', '1', '82-11');
INSERT INTO `t_keyword_data` VALUES ('95', '11', '1', '83-11');
INSERT INTO `t_keyword_data` VALUES ('96', '11', '1', '84-11');
INSERT INTO `t_keyword_data` VALUES ('97', '11', '1', '85-11');
INSERT INTO `t_keyword_data` VALUES ('98', '11', '1', '86-11');
INSERT INTO `t_keyword_data` VALUES ('99', '11', '1', '87-11');
INSERT INTO `t_keyword_data` VALUES ('100', '11', '1', '88-11');
INSERT INTO `t_keyword_data` VALUES ('101', '11', '1', '89-11');
INSERT INTO `t_keyword_data` VALUES ('102', '11', '1', '90-11');
INSERT INTO `t_keyword_data` VALUES ('103', '11', '1', '91-11');
INSERT INTO `t_keyword_data` VALUES ('104', '11', '1', '92-11');
INSERT INTO `t_keyword_data` VALUES ('105', '11', '1', '93-11');
INSERT INTO `t_keyword_data` VALUES ('106', '11', '1', '94-11');
INSERT INTO `t_keyword_data` VALUES ('107', '11', '1', '95-11');
INSERT INTO `t_keyword_data` VALUES ('108', '11', '1', '96-11');
INSERT INTO `t_keyword_data` VALUES ('109', '11', '1', '97-11');
INSERT INTO `t_keyword_data` VALUES ('110', '11', '1', '98-11');
INSERT INTO `t_keyword_data` VALUES ('111', '11', '1', '99-11');
INSERT INTO `t_keyword_data` VALUES ('112', '11', '1', '100-11');
INSERT INTO `t_keyword_data` VALUES ('113', '11', '1', '101-11');
INSERT INTO `t_keyword_data` VALUES ('114', '11', '1', '102-11');
INSERT INTO `t_keyword_data` VALUES ('115', '11', '1', '103-11');
INSERT INTO `t_keyword_data` VALUES ('116', '11', '1', '104-11');
INSERT INTO `t_keyword_data` VALUES ('117', '11', '1', '105-11');
INSERT INTO `t_keyword_data` VALUES ('118', '11', '1', '106-11');
INSERT INTO `t_keyword_data` VALUES ('119', '11', '1', '107-11');
INSERT INTO `t_keyword_data` VALUES ('120', '11', '1', '108-11');
INSERT INTO `t_keyword_data` VALUES ('121', '11', '1', '109-11');
INSERT INTO `t_keyword_data` VALUES ('122', '11', '1', '110-11');
INSERT INTO `t_keyword_data` VALUES ('123', '11', '1', '111-11');
INSERT INTO `t_keyword_data` VALUES ('124', '11', '1', '112-11');
INSERT INTO `t_keyword_data` VALUES ('125', '11', '1', '113-11');
INSERT INTO `t_keyword_data` VALUES ('126', '11', '1', '114-11');
INSERT INTO `t_keyword_data` VALUES ('127', '11', '1', '115-11');
INSERT INTO `t_keyword_data` VALUES ('128', '11', '1', '116-11');
INSERT INTO `t_keyword_data` VALUES ('129', '11', '1', '117-11');
INSERT INTO `t_keyword_data` VALUES ('130', '11', '1', '118-11');
INSERT INTO `t_keyword_data` VALUES ('131', '11', '1', '120-11');
INSERT INTO `t_keyword_data` VALUES ('132', '11', '1', '121-11');
INSERT INTO `t_keyword_data` VALUES ('133', '11', '1', '119-11');
INSERT INTO `t_keyword_data` VALUES ('134', '11', '1', '122-11');
INSERT INTO `t_keyword_data` VALUES ('135', '11', '1', '123-11');
INSERT INTO `t_keyword_data` VALUES ('136', '11', '1', '124-11');
INSERT INTO `t_keyword_data` VALUES ('137', '11', '1', '125-11');
INSERT INTO `t_keyword_data` VALUES ('138', '11', '1', '126-11');
INSERT INTO `t_keyword_data` VALUES ('139', '11', '1', '127-11');
INSERT INTO `t_keyword_data` VALUES ('140', '11', '1', '128-11');
INSERT INTO `t_keyword_data` VALUES ('141', '11', '1', '129-11');
INSERT INTO `t_keyword_data` VALUES ('142', '11', '1', '130-11');
INSERT INTO `t_keyword_data` VALUES ('143', '11', '1', '131-11');
INSERT INTO `t_keyword_data` VALUES ('144', '11', '1', '132-11');
INSERT INTO `t_keyword_data` VALUES ('145', '11', '1', '133-11');
INSERT INTO `t_keyword_data` VALUES ('146', '11', '1', '134-11');
INSERT INTO `t_keyword_data` VALUES ('147', '11', '1', '135-11');
INSERT INTO `t_keyword_data` VALUES ('148', '11', '1', '136-11');
INSERT INTO `t_keyword_data` VALUES ('149', '11', '1', '137-11');
INSERT INTO `t_keyword_data` VALUES ('150', '11', '1', '138-11');
INSERT INTO `t_keyword_data` VALUES ('151', '11', '1', '139-11');
INSERT INTO `t_keyword_data` VALUES ('152', '11', '1', '140-11');
INSERT INTO `t_keyword_data` VALUES ('153', '11', '1', '141-11');
INSERT INTO `t_keyword_data` VALUES ('154', '11', '1', '142-11');
INSERT INTO `t_keyword_data` VALUES ('155', '11', '1', '143-11');
INSERT INTO `t_keyword_data` VALUES ('156', '11', '1', '144-11');
INSERT INTO `t_keyword_data` VALUES ('157', '11', '1', '145-11');
INSERT INTO `t_keyword_data` VALUES ('158', '11', '1', '146-11');
INSERT INTO `t_keyword_data` VALUES ('159', '11', '1', '147-11');
INSERT INTO `t_keyword_data` VALUES ('160', '11', '1', '148-11');
INSERT INTO `t_keyword_data` VALUES ('161', '11', '1', '149-11');
INSERT INTO `t_keyword_data` VALUES ('162', '11', '1', '150-11');
INSERT INTO `t_keyword_data` VALUES ('163', '11', '1', '151-11');
INSERT INTO `t_keyword_data` VALUES ('164', '11', '1', '152-11');
INSERT INTO `t_keyword_data` VALUES ('165', '11', '1', '153-11');
INSERT INTO `t_keyword_data` VALUES ('166', '11', '1', '154-11');
INSERT INTO `t_keyword_data` VALUES ('167', '11', '1', '155-11');
INSERT INTO `t_keyword_data` VALUES ('168', '11', '1', '156-11');
INSERT INTO `t_keyword_data` VALUES ('169', '11', '1', '157-11');
INSERT INTO `t_keyword_data` VALUES ('170', '11', '1', '158-11');
INSERT INTO `t_keyword_data` VALUES ('171', '11', '1', '159-11');
INSERT INTO `t_keyword_data` VALUES ('172', '11', '1', '160-11');
INSERT INTO `t_keyword_data` VALUES ('173', '12', '1', '6-1');
INSERT INTO `t_keyword_data` VALUES ('174', '13', '1', '7-1');
INSERT INTO `t_keyword_data` VALUES ('175', '14', '1', '7-1');
INSERT INTO `t_keyword_data` VALUES ('176', '15', '1', '8-1');
INSERT INTO `t_keyword_data` VALUES ('177', '16', '1', '9-1');
INSERT INTO `t_keyword_data` VALUES ('178', '17', '1', '9-1');
INSERT INTO `t_keyword_data` VALUES ('179', '18', '1', '10-1');
INSERT INTO `t_keyword_data` VALUES ('180', '19', '1', '10-1');
INSERT INTO `t_keyword_data` VALUES ('181', '20', '1', '10-1');
INSERT INTO `t_keyword_data` VALUES ('182', '21', '1', '11-1');
INSERT INTO `t_keyword_data` VALUES ('183', '22', '1', '12-1');
INSERT INTO `t_keyword_data` VALUES ('184', '23', '1', '13-1');
INSERT INTO `t_keyword_data` VALUES ('185', '14', '1', '13-1');
INSERT INTO `t_keyword_data` VALUES ('186', '14', '1', '14-1');
INSERT INTO `t_keyword_data` VALUES ('187', '24', '1', '15-1');
INSERT INTO `t_keyword_data` VALUES ('188', '25', '1', '16-1');
INSERT INTO `t_keyword_data` VALUES ('189', '26', '1', '16-1');
INSERT INTO `t_keyword_data` VALUES ('190', '25', '1', '17-1');
INSERT INTO `t_keyword_data` VALUES ('191', '27', '1', '17-1');

-- ----------------------------
-- Table structure for `t_link`
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_link
-- ----------------------------
INSERT INTO `t_link` VALUES ('1', '1', '0', '1', 'PHPCMS', 'http://www.phpcms.cn', 'http://www.phpcms.cn/images/logo_88_31.gif', '', '', '0', '0', '1', '1507293520');
INSERT INTO `t_link` VALUES ('2', '1', '0', '1', '盛大在线', 'http://www.sdo.com', 'http://www.snda.com/cn/logo/comp_logo_sdo.gif', '', '', '0', '0', '1', '1507293520');

-- ----------------------------
-- Table structure for `t_linkage`
-- ----------------------------
DROP TABLE IF EXISTS `t_linkage`;
CREATE TABLE `t_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_linkage
-- ----------------------------
INSERT INTO `t_linkage` VALUES ('1', '中国', '1', '0', '0', '', '0', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2', '北京市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3', '上海市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('4', '天津市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('5', '重庆市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('6', '河北省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('7', '山西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('8', '内蒙古', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('9', '辽宁省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('10', '吉林省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('11', '黑龙江省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('12', '江苏省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('13', '浙江省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('14', '安徽省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('15', '福建省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('16', '江西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('17', '山东省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('18', '河南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('19', '湖北省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('20', '湖南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('21', '广东省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('22', '广西', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('23', '海南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('24', '四川省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('25', '贵州省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('26', '云南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('27', '西藏', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('28', '陕西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('29', '甘肃省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('30', '青海省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('31', '宁夏', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('32', '新疆', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('33', '台湾省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('34', '香港', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('35', '澳门', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('36', '东城区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('37', '西城区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('38', '崇文区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('39', '宣武区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('40', '朝阳区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('41', '石景山区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('42', '海淀区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('43', '门头沟区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('44', '房山区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('45', '通州区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('46', '顺义区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('47', '昌平区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('48', '大兴区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('49', '怀柔区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('50', '平谷区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('51', '密云县', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('52', '延庆县', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('53', '黄浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('54', '卢湾区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('55', '徐汇区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('56', '长宁区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('57', '静安区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('58', '普陀区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('59', '闸北区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('60', '虹口区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('61', '杨浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('62', '闵行区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('63', '宝山区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('64', '嘉定区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('65', '浦东新区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('66', '金山区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('67', '松江区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('68', '青浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('69', '南汇区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('70', '奉贤区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('71', '崇明县', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('72', '和平区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('73', '河东区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('74', '河西区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('75', '南开区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('76', '河北区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('77', '红桥区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('78', '塘沽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('79', '汉沽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('80', '大港区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('81', '东丽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('82', '西青区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('83', '津南区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('84', '北辰区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('85', '武清区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('86', '宝坻区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('87', '宁河县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('88', '静海县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('89', '蓟县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('90', '万州区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('91', '涪陵区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('92', '渝中区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('93', '大渡口区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('94', '江北区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('95', '沙坪坝区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('96', '九龙坡区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('97', '南岸区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('98', '北碚区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('99', '万盛区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('100', '双桥区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('101', '渝北区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('102', '巴南区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('103', '黔江区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('104', '长寿区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('105', '綦江县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('106', '潼南县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('107', '铜梁县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('108', '大足县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('109', '荣昌县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('110', '璧山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('111', '梁平县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('112', '城口县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('113', '丰都县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('114', '垫江县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('115', '武隆县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('116', '忠县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('117', '开县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('118', '云阳县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('119', '奉节县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('120', '巫山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('121', '巫溪县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('122', '石柱县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('123', '秀山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('124', '酉阳县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('125', '彭水县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('126', '江津区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('127', '合川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('128', '永川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('129', '南川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('130', '石家庄市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('131', '唐山市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('132', '秦皇岛市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('133', '邯郸市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('134', '邢台市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('135', '保定市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('136', '张家口市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('137', '承德市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('138', '沧州市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('139', '廊坊市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('140', '衡水市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('141', '太原市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('142', '大同市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('143', '阳泉市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('144', '长治市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('145', '晋城市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('146', '朔州市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('147', '晋中市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('148', '运城市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('149', '忻州市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('150', '临汾市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('151', '吕梁市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('152', '呼和浩特市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('153', '包头市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('154', '乌海市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('155', '赤峰市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('156', '通辽市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('157', '鄂尔多斯市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('158', '呼伦贝尔市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('159', '巴彦淖尔市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('160', '乌兰察布市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('161', '兴安盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('162', '锡林郭勒盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('163', '阿拉善盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('164', '沈阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('165', '大连市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('166', '鞍山市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('167', '抚顺市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('168', '本溪市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('169', '丹东市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('170', '锦州市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('171', '营口市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('172', '阜新市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('173', '辽阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('174', '盘锦市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('175', '铁岭市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('176', '朝阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('177', '葫芦岛市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('178', '长春市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('179', '吉林市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('180', '四平市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('181', '辽源市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('182', '通化市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('183', '白山市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('184', '松原市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('185', '白城市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('186', '延边', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('187', '哈尔滨市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('188', '齐齐哈尔市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('189', '鸡西市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('190', '鹤岗市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('191', '双鸭山市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('192', '大庆市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('193', '伊春市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('194', '佳木斯市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('195', '七台河市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('196', '牡丹江市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('197', '黑河市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('198', '绥化市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('199', '大兴安岭地区', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('200', '南京市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('201', '无锡市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('202', '徐州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('203', '常州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('204', '苏州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('205', '南通市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('206', '连云港市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('207', '淮安市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('208', '盐城市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('209', '扬州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('210', '镇江市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('211', '泰州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('212', '宿迁市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('213', '杭州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('214', '宁波市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('215', '温州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('216', '嘉兴市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('217', '湖州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('218', '绍兴市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('219', '金华市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('220', '衢州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('221', '舟山市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('222', '台州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('223', '丽水市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('224', '合肥市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('225', '芜湖市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('226', '蚌埠市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('227', '淮南市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('228', '马鞍山市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('229', '淮北市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('230', '铜陵市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('231', '安庆市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('232', '黄山市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('233', '滁州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('234', '阜阳市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('235', '宿州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('236', '巢湖市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('237', '六安市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('238', '亳州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('239', '池州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('240', '宣城市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('241', '福州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('242', '厦门市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('243', '莆田市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('244', '三明市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('245', '泉州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('246', '漳州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('247', '南平市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('248', '龙岩市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('249', '宁德市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('250', '南昌市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('251', '景德镇市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('252', '萍乡市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('253', '九江市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('254', '新余市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('255', '鹰潭市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('256', '赣州市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('257', '吉安市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('258', '宜春市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('259', '抚州市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('260', '上饶市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('261', '济南市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('262', '青岛市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('263', '淄博市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('264', '枣庄市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('265', '东营市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('266', '烟台市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('267', '潍坊市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('268', '济宁市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('269', '泰安市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('270', '威海市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('271', '日照市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('272', '莱芜市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('273', '临沂市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('274', '德州市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('275', '聊城市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('276', '滨州市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('277', '荷泽市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('278', '郑州市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('279', '开封市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('280', '洛阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('281', '平顶山市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('282', '安阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('283', '鹤壁市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('284', '新乡市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('285', '焦作市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('286', '濮阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('287', '许昌市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('288', '漯河市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('289', '三门峡市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('290', '南阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('291', '商丘市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('292', '信阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('293', '周口市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('294', '驻马店市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('295', '武汉市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('296', '黄石市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('297', '十堰市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('298', '宜昌市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('299', '襄樊市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('300', '鄂州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('301', '荆门市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('302', '孝感市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('303', '荆州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('304', '黄冈市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('305', '咸宁市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('306', '随州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('307', '恩施土家族苗族自治州', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('308', '仙桃市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('309', '潜江市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('310', '天门市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('311', '神农架林区', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('312', '长沙市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('313', '株洲市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('314', '湘潭市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('315', '衡阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('316', '邵阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('317', '岳阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('318', '常德市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('319', '张家界市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('320', '益阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('321', '郴州市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('322', '永州市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('323', '怀化市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('324', '娄底市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('325', '湘西土家族苗族自治州', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('326', '广州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('327', '韶关市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('328', '深圳市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('329', '珠海市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('330', '汕头市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('331', '佛山市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('332', '江门市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('333', '湛江市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('334', '茂名市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('335', '肇庆市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('336', '惠州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('337', '梅州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('338', '汕尾市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('339', '河源市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('340', '阳江市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('341', '清远市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('342', '东莞市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('343', '中山市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('344', '潮州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('345', '揭阳市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('346', '云浮市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('347', '南宁市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('348', '柳州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('349', '桂林市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('350', '梧州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('351', '北海市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('352', '防城港市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('353', '钦州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('354', '贵港市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('355', '玉林市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('356', '百色市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('357', '贺州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('358', '河池市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('359', '来宾市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('360', '崇左市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('361', '海口市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('362', '三亚市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('363', '五指山市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('364', '琼海市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('365', '儋州市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('366', '文昌市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('367', '万宁市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('368', '东方市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('369', '定安县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('370', '屯昌县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('371', '澄迈县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('372', '临高县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('373', '白沙黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('374', '昌江黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('375', '乐东黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('376', '陵水黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('377', '保亭黎族苗族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('378', '琼中黎族苗族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('379', '西沙群岛', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('380', '南沙群岛', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('381', '中沙群岛的岛礁及其海域', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('382', '成都市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('383', '自贡市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('384', '攀枝花市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('385', '泸州市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('386', '德阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('387', '绵阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('388', '广元市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('389', '遂宁市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('390', '内江市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('391', '乐山市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('392', '南充市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('393', '眉山市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('394', '宜宾市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('395', '广安市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('396', '达州市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('397', '雅安市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('398', '巴中市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('399', '资阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('400', '阿坝州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('401', '甘孜州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('402', '凉山州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('403', '贵阳市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('404', '六盘水市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('405', '遵义市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('406', '安顺市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('407', '铜仁地区', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('408', '黔西南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('409', '毕节地区', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('410', '黔东南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('411', '黔南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('412', '昆明市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('413', '曲靖市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('414', '玉溪市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('415', '保山市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('416', '昭通市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('417', '丽江市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('418', '思茅市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('419', '临沧市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('420', '楚雄州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('421', '红河州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('422', '文山州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('423', '西双版纳', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('424', '大理', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('425', '德宏', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('426', '怒江', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('427', '迪庆', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('428', '拉萨市', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('429', '昌都', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('430', '山南', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('431', '日喀则', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('432', '那曲', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('433', '阿里', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('434', '林芝', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('435', '西安市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('436', '铜川市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('437', '宝鸡市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('438', '咸阳市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('439', '渭南市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('440', '延安市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('441', '汉中市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('442', '榆林市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('443', '安康市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('444', '商洛市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('445', '兰州市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('446', '嘉峪关市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('447', '金昌市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('448', '白银市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('449', '天水市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('450', '武威市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('451', '张掖市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('452', '平凉市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('453', '酒泉市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('454', '庆阳市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('455', '定西市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('456', '陇南市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('457', '临夏州', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('458', '甘州', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('459', '西宁市', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('460', '海东地区', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('461', '海州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('462', '黄南州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('463', '海南州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('464', '果洛州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('465', '玉树州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('466', '海西州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('467', '银川市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('468', '石嘴山市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('469', '吴忠市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('470', '固原市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('471', '中卫市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('472', '乌鲁木齐市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('473', '克拉玛依市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('474', '吐鲁番地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('475', '哈密地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('476', '昌吉州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('477', '博尔州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('478', '巴音郭楞州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('479', '阿克苏地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('480', '克孜勒苏柯尔克孜自治州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('481', '喀什地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('482', '和田地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('483', '伊犁州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('484', '塔城地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('485', '阿勒泰地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('486', '石河子市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('487', '阿拉尔市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('488', '图木舒克市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('489', '五家渠市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('490', '台北市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('491', '高雄市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('492', '基隆市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('493', '新竹市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('494', '台中市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('495', '嘉义市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('496', '台南市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('497', '台北县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('498', '桃园县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('499', '新竹县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('500', '苗栗县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('501', '台中县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('502', '彰化县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('503', '南投县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('504', '云林县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('505', '嘉义县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('506', '台南县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('507', '高雄县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('508', '屏东县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('509', '宜兰县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('510', '花莲县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('511', '台东县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('512', '澎湖县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('513', '金门县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('514', '连江县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('515', '中西区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('516', '东区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('517', '南区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('518', '湾仔区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('519', '九龙城区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('520', '观塘区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('521', '深水埗区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('522', '黄大仙区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('523', '油尖旺区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('524', '离岛区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('525', '葵青区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('526', '北区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('527', '西贡区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('528', '沙田区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('529', '大埔区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('530', '荃湾区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('531', '屯门区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('532', '元朗区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('533', '花地玛堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('534', '市圣安多尼堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('535', '大堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('536', '望德堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('537', '风顺堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('538', '嘉模堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('539', '圣方济各堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('540', '长安区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('541', '桥东区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('542', '桥西区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('543', '新华区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('544', '井陉矿区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('545', '裕华区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('546', '井陉县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('547', '正定县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('548', '栾城县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('549', '行唐县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('550', '灵寿县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('551', '高邑县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('552', '深泽县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('553', '赞皇县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('554', '无极县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('555', '平山县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('556', '元氏县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('557', '赵县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('558', '辛集市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('559', '藁城市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('560', '晋州市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('561', '新乐市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('562', '鹿泉市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('563', '路南区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('564', '路北区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('565', '古冶区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('566', '开平区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('567', '丰南区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('568', '丰润区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('569', '滦县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('570', '滦南县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('571', '乐亭县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('572', '迁西县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('573', '玉田县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('574', '唐海县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('575', '遵化市', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('576', '迁安市', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('577', '海港区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('578', '山海关区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('579', '北戴河区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('580', '青龙县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('581', '昌黎县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('582', '抚宁县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('583', '卢龙县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('584', '邯山区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('585', '丛台区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('586', '复兴区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('587', '峰峰矿区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('588', '邯郸县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('589', '临漳县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('590', '成安县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('591', '大名县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('592', '涉县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('593', '磁县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('594', '肥乡县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('595', '永年县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('596', '邱县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('597', '鸡泽县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('598', '广平县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('599', '馆陶县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('600', '魏县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('601', '曲周县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('602', '武安市', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('603', '桥东区', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('604', '桥西区', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('605', '邢台县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('606', '临城县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('607', '内丘县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('608', '柏乡县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('609', '隆尧县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('610', '任县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('611', '南和县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('612', '宁晋县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('613', '巨鹿县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('614', '新河县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('615', '广宗县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('616', '平乡县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('617', '威县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('618', '清河县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('619', '临西县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('620', '南宫市', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('621', '沙河市', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('622', '新市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('623', '北市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('624', '南市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('625', '满城县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('626', '清苑县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('627', '涞水县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('628', '阜平县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('629', '徐水县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('630', '定兴县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('631', '唐县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('632', '高阳县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('633', '容城县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('634', '涞源县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('635', '望都县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('636', '安新县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('637', '易县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('638', '曲阳县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('639', '蠡县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('640', '顺平县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('641', '博野县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('642', '雄县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('643', '涿州市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('644', '定州市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('645', '安国市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('646', '高碑店市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('647', '桥东区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('648', '桥西区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('649', '宣化区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('650', '下花园区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('651', '宣化县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('652', '张北县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('653', '康保县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('654', '沽源县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('655', '尚义县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('656', '蔚县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('657', '阳原县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('658', '怀安县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('659', '万全县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('660', '怀来县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('661', '涿鹿县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('662', '赤城县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('663', '崇礼县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('664', '双桥区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('665', '双滦区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('666', '鹰手营子矿区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('667', '承德县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('668', '兴隆县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('669', '平泉县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('670', '滦平县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('671', '隆化县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('672', '丰宁县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('673', '宽城县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('674', '围场县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('675', '新华区', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('676', '运河区', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('677', '沧县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('678', '青县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('679', '东光县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('680', '海兴县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('681', '盐山县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('682', '肃宁县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('683', '南皮县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('684', '吴桥县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('685', '献县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('686', '孟村县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('687', '泊头市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('688', '任丘市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('689', '黄骅市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('690', '河间市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('691', '安次区', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('692', '广阳区', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('693', '固安县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('694', '永清县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('695', '香河县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('696', '大城县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('697', '文安县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('698', '大厂县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('699', '霸州市', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('700', '三河市', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('701', '桃城区', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('702', '枣强县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('703', '武邑县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('704', '武强县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('705', '饶阳县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('706', '安平县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('707', '故城县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('708', '景县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('709', '阜城县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('710', '冀州市', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('711', '深州市', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('712', '小店区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('713', '迎泽区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('714', '杏花岭区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('715', '尖草坪区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('716', '万柏林区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('717', '晋源区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('718', '清徐县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('719', '阳曲县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('720', '娄烦县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('721', '古交市', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('722', '城区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('723', '矿区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('724', '南郊区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('725', '新荣区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('726', '阳高县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('727', '天镇县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('728', '广灵县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('729', '灵丘县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('730', '浑源县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('731', '左云县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('732', '大同县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('733', '城区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('734', '矿区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('735', '郊区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('736', '平定县', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('737', '盂县', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('738', '城区', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('739', '郊区', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('740', '长治县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('741', '襄垣县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('742', '屯留县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('743', '平顺县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('744', '黎城县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('745', '壶关县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('746', '长子县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('747', '武乡县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('748', '沁县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('749', '沁源县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('750', '潞城市', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('751', '城区', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('752', '沁水县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('753', '阳城县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('754', '陵川县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('755', '泽州县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('756', '高平市', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('757', '朔城区', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('758', '平鲁区', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('759', '山阴县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('760', '应县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('761', '右玉县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('762', '怀仁县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('763', '榆次区', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('764', '榆社县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('765', '左权县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('766', '和顺县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('767', '昔阳县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('768', '寿阳县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('769', '太谷县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('770', '祁县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('771', '平遥县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('772', '灵石县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('773', '介休市', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('774', '盐湖区', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('775', '临猗县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('776', '万荣县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('777', '闻喜县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('778', '稷山县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('779', '新绛县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('780', '绛县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('781', '垣曲县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('782', '夏县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('783', '平陆县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('784', '芮城县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('785', '永济市', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('786', '河津市', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('787', '忻府区', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('788', '定襄县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('789', '五台县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('790', '代县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('791', '繁峙县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('792', '宁武县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('793', '静乐县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('794', '神池县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('795', '五寨县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('796', '岢岚县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('797', '河曲县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('798', '保德县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('799', '偏关县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('800', '原平市', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('801', '尧都区', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('802', '曲沃县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('803', '翼城县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('804', '襄汾县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('805', '洪洞县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('806', '古县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('807', '安泽县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('808', '浮山县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('809', '吉县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('810', '乡宁县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('811', '大宁县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('812', '隰县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('813', '永和县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('814', '蒲县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('815', '汾西县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('816', '侯马市', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('817', '霍州市', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('818', '离石区', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('819', '文水县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('820', '交城县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('821', '兴县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('822', '临县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('823', '柳林县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('824', '石楼县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('825', '岚县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('826', '方山县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('827', '中阳县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('828', '交口县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('829', '孝义市', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('830', '汾阳市', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('831', '新城区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('832', '回民区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('833', '玉泉区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('834', '赛罕区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('835', '土默特左旗', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('836', '托克托县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('837', '和林格尔县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('838', '清水河县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('839', '武川县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('840', '东河区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('841', '昆都仑区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('842', '青山区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('843', '石拐区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('844', '白云矿区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('845', '九原区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('846', '土默特右旗', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('847', '固阳县', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('848', '达尔罕茂明安联合旗', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('849', '海勃湾区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('850', '海南区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('851', '乌达区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('852', '红山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('853', '元宝山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('854', '松山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('855', '阿鲁科尔沁旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('856', '巴林左旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('857', '巴林右旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('858', '林西县', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('859', '克什克腾旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('860', '翁牛特旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('861', '喀喇沁旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('862', '宁城县', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('863', '敖汉旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('864', '科尔沁区', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('865', '科尔沁左翼中旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('866', '科尔沁左翼后旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('867', '开鲁县', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('868', '库伦旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('869', '奈曼旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('870', '扎鲁特旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('871', '霍林郭勒市', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('872', '东胜区', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('873', '达拉特旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('874', '准格尔旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('875', '鄂托克前旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('876', '鄂托克旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('877', '杭锦旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('878', '乌审旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('879', '伊金霍洛旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('880', '海拉尔区', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('881', '阿荣旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('882', '莫力达瓦达斡尔族自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('883', '鄂伦春自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('884', '鄂温克族自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('885', '陈巴尔虎旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('886', '新巴尔虎左旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('887', '新巴尔虎右旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('888', '满洲里市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('889', '牙克石市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('890', '扎兰屯市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('891', '额尔古纳市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('892', '根河市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('893', '临河区', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('894', '五原县', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('895', '磴口县', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('896', '乌拉特前旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('897', '乌拉特中旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('898', '乌拉特后旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('899', '杭锦后旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('900', '集宁区', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('901', '卓资县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('902', '化德县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('903', '商都县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('904', '兴和县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('905', '凉城县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('906', '察哈尔右翼前旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('907', '察哈尔右翼中旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('908', '察哈尔右翼后旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('909', '四子王旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('910', '丰镇市', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('911', '乌兰浩特市', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('912', '阿尔山市', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('913', '科尔沁右翼前旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('914', '科尔沁右翼中旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('915', '扎赉特旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('916', '突泉县', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('917', '二连浩特市', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('918', '锡林浩特市', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('919', '阿巴嘎旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('920', '苏尼特左旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('921', '苏尼特右旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('922', '东乌珠穆沁旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('923', '西乌珠穆沁旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('924', '太仆寺旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('925', '镶黄旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('926', '正镶白旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('927', '正蓝旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('928', '多伦县', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('929', '阿拉善左旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('930', '阿拉善右旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('931', '额济纳旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('932', '和平区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('933', '沈河区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('934', '大东区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('935', '皇姑区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('936', '铁西区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('937', '苏家屯区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('938', '东陵区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('939', '新城子区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('940', '于洪区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('941', '辽中县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('942', '康平县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('943', '法库县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('944', '新民市', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('945', '中山区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('946', '西岗区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('947', '沙河口区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('948', '甘井子区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('949', '旅顺口区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('950', '金州区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('951', '长海县', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('952', '瓦房店市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('953', '普兰店市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('954', '庄河市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('955', '铁东区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('956', '铁西区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('957', '立山区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('958', '千山区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('959', '台安县', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('960', '岫岩满族自治县', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('961', '海城市', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('962', '新抚区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('963', '东洲区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('964', '望花区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('965', '顺城区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('966', '抚顺县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('967', '新宾满族自治县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('968', '清原满族自治县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('969', '平山区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('970', '溪湖区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('971', '明山区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('972', '南芬区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('973', '本溪满族自治县', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('974', '桓仁满族自治县', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('975', '元宝区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('976', '振兴区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('977', '振安区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('978', '宽甸满族自治县', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('979', '东港市', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('980', '凤城市', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('981', '古塔区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('982', '凌河区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('983', '太和区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('984', '黑山县', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('985', '义县', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('986', '凌海市', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('987', '北镇市', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('988', '站前区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('989', '西市区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('990', '鲅鱼圈区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('991', '老边区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('992', '盖州市', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('993', '大石桥市', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('994', '海州区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('995', '新邱区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('996', '太平区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('997', '清河门区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('998', '细河区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('999', '阜新蒙古族自治县', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1000', '彰武县', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1001', '白塔区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1002', '文圣区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1003', '宏伟区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1004', '弓长岭区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1005', '太子河区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1006', '辽阳县', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1007', '灯塔市', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1008', '双台子区', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1009', '兴隆台区', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1010', '大洼县', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1011', '盘山县', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1012', '银州区', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1013', '清河区', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1014', '铁岭县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1015', '西丰县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1016', '昌图县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1017', '调兵山市', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1018', '开原市', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1019', '双塔区', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1020', '龙城区', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1021', '朝阳县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1022', '建平县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1023', '喀喇沁左翼蒙古族自治县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1024', '北票市', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1025', '凌源市', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1026', '连山区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1027', '龙港区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1028', '南票区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1029', '绥中县', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1030', '建昌县', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1031', '兴城市', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1032', '南关区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1033', '宽城区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1034', '朝阳区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1035', '二道区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1036', '绿园区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1037', '双阳区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1038', '农安县', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1039', '九台市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1040', '榆树市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1041', '德惠市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1042', '昌邑区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1043', '龙潭区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1044', '船营区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1045', '丰满区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1046', '永吉县', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1047', '蛟河市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1048', '桦甸市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1049', '舒兰市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1050', '磐石市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1051', '铁西区', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1052', '铁东区', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1053', '梨树县', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1054', '伊通满族自治县', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1055', '公主岭市', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1056', '双辽市', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1057', '龙山区', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1058', '西安区', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1059', '东丰县', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1060', '东辽县', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1061', '东昌区', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1062', '二道江区', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1063', '通化县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1064', '辉南县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1065', '柳河县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1066', '梅河口市', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1067', '集安市', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1068', '八道江区', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1069', '抚松县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1070', '靖宇县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1071', '长白朝鲜族自治县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1072', '江源县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1073', '临江市', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1074', '宁江区', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1075', '前郭尔罗斯蒙古族自治县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1076', '长岭县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1077', '乾安县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1078', '扶余县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1079', '洮北区', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1080', '镇赉县', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1081', '通榆县', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1082', '洮南市', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1083', '大安市', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1084', '延吉市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1085', '图们市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1086', '敦化市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1087', '珲春市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1088', '龙井市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1089', '和龙市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1090', '汪清县', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1091', '安图县', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1092', '道里区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1093', '南岗区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1094', '道外区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1095', '香坊区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1096', '动力区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1097', '平房区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1098', '松北区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1099', '呼兰区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1100', '依兰县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1101', '方正县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1102', '宾县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1103', '巴彦县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1104', '木兰县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1105', '通河县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1106', '延寿县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1107', '阿城市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1108', '双城市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1109', '尚志市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1110', '五常市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1111', '龙沙区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1112', '建华区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1113', '铁锋区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1114', '昂昂溪区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1115', '富拉尔基区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1116', '碾子山区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1117', '梅里斯达斡尔族区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1118', '龙江县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1119', '依安县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1120', '泰来县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1121', '甘南县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1122', '富裕县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1123', '克山县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1124', '克东县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1125', '拜泉县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1126', '讷河市', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1127', '鸡冠区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1128', '恒山区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1129', '滴道区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1130', '梨树区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1131', '城子河区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1132', '麻山区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1133', '鸡东县', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1134', '虎林市', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1135', '密山市', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1136', '向阳区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1137', '工农区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1138', '南山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1139', '兴安区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1140', '东山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1141', '兴山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1142', '萝北县', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1143', '绥滨县', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1144', '尖山区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1145', '岭东区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1146', '四方台区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1147', '宝山区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1148', '集贤县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1149', '友谊县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1150', '宝清县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1151', '饶河县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1152', '萨尔图区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1153', '龙凤区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1154', '让胡路区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1155', '红岗区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1156', '大同区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1157', '肇州县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1158', '肇源县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1159', '林甸县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1160', '杜尔伯特蒙古族自治县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1161', '伊春区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1162', '南岔区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1163', '友好区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1164', '西林区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1165', '翠峦区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1166', '新青区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1167', '美溪区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1168', '金山屯区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1169', '五营区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1170', '乌马河区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1171', '汤旺河区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1172', '带岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1173', '乌伊岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1174', '红星区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1175', '上甘岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1176', '嘉荫县', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1177', '铁力市', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1178', '永红区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1179', '向阳区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1180', '前进区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1181', '东风区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1182', '郊区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1183', '桦南县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1184', '桦川县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1185', '汤原县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1186', '抚远县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1187', '同江市', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1188', '富锦市', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1189', '新兴区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1190', '桃山区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1191', '茄子河区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1192', '勃利县', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1193', '东安区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1194', '阳明区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1195', '爱民区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1196', '西安区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1197', '东宁县', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1198', '林口县', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1199', '绥芬河市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1200', '海林市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1201', '宁安市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1202', '穆棱市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1203', '爱辉区', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1204', '嫩江县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1205', '逊克县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1206', '孙吴县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1207', '北安市', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1208', '五大连池市', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1209', '北林区', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1210', '望奎县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1211', '兰西县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1212', '青冈县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1213', '庆安县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1214', '明水县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1215', '绥棱县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1216', '安达市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1217', '肇东市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1218', '海伦市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1219', '呼玛县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1220', '塔河县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1221', '漠河县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1222', '玄武区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1223', '白下区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1224', '秦淮区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1225', '建邺区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1226', '鼓楼区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1227', '下关区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1228', '浦口区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1229', '栖霞区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1230', '雨花台区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1231', '江宁区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1232', '六合区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1233', '溧水县', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1234', '高淳县', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1235', '崇安区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1236', '南长区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1237', '北塘区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1238', '锡山区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1239', '惠山区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1240', '滨湖区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1241', '江阴市', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1242', '宜兴市', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1243', '鼓楼区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1244', '云龙区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1245', '九里区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1246', '贾汪区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1247', '泉山区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1248', '丰县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1249', '沛县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1250', '铜山县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1251', '睢宁县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1252', '新沂市', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1253', '邳州市', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1254', '天宁区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1255', '钟楼区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1256', '戚墅堰区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1257', '新北区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1258', '武进区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1259', '溧阳市', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1260', '金坛市', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1261', '沧浪区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1262', '平江区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1263', '金阊区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1264', '虎丘区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1265', '吴中区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1266', '相城区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1267', '常熟市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1268', '张家港市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1269', '昆山市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1270', '吴江市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1271', '太仓市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1272', '崇川区', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1273', '港闸区', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1274', '海安县', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1275', '如东县', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1276', '启东市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1277', '如皋市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1278', '通州市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1279', '海门市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1280', '连云区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1281', '新浦区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1282', '海州区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1283', '赣榆县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1284', '东海县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1285', '灌云县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1286', '灌南县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1287', '清河区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1288', '楚州区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1289', '淮阴区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1290', '清浦区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1291', '涟水县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1292', '洪泽县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1293', '盱眙县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1294', '金湖县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1295', '亭湖区', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1296', '盐都区', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1297', '响水县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1298', '滨海县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1299', '阜宁县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1300', '射阳县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1301', '建湖县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1302', '东台市', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1303', '大丰市', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1304', '广陵区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1305', '邗江区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1306', '维扬区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1307', '宝应县', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1308', '仪征市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1309', '高邮市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1310', '江都市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1311', '京口区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1312', '润州区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1313', '丹徒区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1314', '丹阳市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1315', '扬中市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1316', '句容市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1317', '海陵区', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1318', '高港区', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1319', '兴化市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1320', '靖江市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1321', '泰兴市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1322', '姜堰市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1323', '宿城区', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1324', '宿豫区', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1325', '沭阳县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1326', '泗阳县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1327', '泗洪县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1328', '上城区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1329', '下城区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1330', '江干区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1331', '拱墅区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1332', '西湖区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1333', '滨江区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1334', '萧山区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1335', '余杭区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1336', '桐庐县', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1337', '淳安县', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1338', '建德市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1339', '富阳市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1340', '临安市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1341', '海曙区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1342', '江东区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1343', '江北区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1344', '北仑区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1345', '镇海区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1346', '鄞州区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1347', '象山县', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1348', '宁海县', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1349', '余姚市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1350', '慈溪市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1351', '奉化市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1352', '鹿城区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1353', '龙湾区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1354', '瓯海区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1355', '洞头县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1356', '永嘉县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1357', '平阳县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1358', '苍南县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1359', '文成县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1360', '泰顺县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1361', '瑞安市', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1362', '乐清市', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1363', '秀城区', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1364', '秀洲区', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1365', '嘉善县', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1366', '海盐县', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1367', '海宁市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1368', '平湖市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1369', '桐乡市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1370', '吴兴区', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1371', '南浔区', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1372', '德清县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1373', '长兴县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1374', '安吉县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1375', '越城区', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1376', '绍兴县', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1377', '新昌县', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1378', '诸暨市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1379', '上虞市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1380', '嵊州市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1381', '婺城区', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1382', '金东区', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1383', '武义县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1384', '浦江县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1385', '磐安县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1386', '兰溪市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1387', '义乌市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1388', '东阳市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1389', '永康市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1390', '柯城区', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1391', '衢江区', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1392', '常山县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1393', '开化县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1394', '龙游县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1395', '江山市', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1396', '定海区', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1397', '普陀区', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1398', '岱山县', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1399', '嵊泗县', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1400', '椒江区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1401', '黄岩区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1402', '路桥区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1403', '玉环县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1404', '三门县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1405', '天台县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1406', '仙居县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1407', '温岭市', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1408', '临海市', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1409', '莲都区', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1410', '青田县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1411', '缙云县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1412', '遂昌县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1413', '松阳县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1414', '云和县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1415', '庆元县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1416', '景宁畲族自治县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1417', '龙泉市', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1418', '瑶海区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1419', '庐阳区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1420', '蜀山区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1421', '包河区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1422', '长丰县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1423', '肥东县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1424', '肥西县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1425', '镜湖区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1426', '弋江区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1427', '鸠江区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1428', '三山区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1429', '芜湖县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1430', '繁昌县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1431', '南陵县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1432', '龙子湖区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1433', '蚌山区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1434', '禹会区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1435', '淮上区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1436', '怀远县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1437', '五河县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1438', '固镇县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1439', '大通区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1440', '田家庵区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1441', '谢家集区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1442', '八公山区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1443', '潘集区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1444', '凤台县', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1445', '金家庄区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1446', '花山区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1447', '雨山区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1448', '当涂县', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1449', '杜集区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1450', '相山区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1451', '烈山区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1452', '濉溪县', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1453', '铜官山区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1454', '狮子山区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1455', '郊区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1456', '铜陵县', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1457', '迎江区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1458', '大观区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1459', '宜秀区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1460', '怀宁县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1461', '枞阳县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1462', '潜山县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1463', '太湖县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1464', '宿松县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1465', '望江县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1466', '岳西县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1467', '桐城市', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1468', '屯溪区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1469', '黄山区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1470', '徽州区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1471', '歙县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1472', '休宁县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1473', '黟县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1474', '祁门县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1475', '琅琊区', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1476', '南谯区', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1477', '来安县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1478', '全椒县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1479', '定远县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1480', '凤阳县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1481', '天长市', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1482', '明光市', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1483', '颍州区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1484', '颍东区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1485', '颍泉区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1486', '临泉县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1487', '太和县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1488', '阜南县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1489', '颍上县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1490', '界首市', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1491', '埇桥区', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1492', '砀山县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1493', '萧县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1494', '灵璧县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1495', '泗县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1496', '居巢区', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1497', '庐江县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1498', '无为县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1499', '含山县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1500', '和县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1501', '金安区', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1502', '裕安区', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1503', '寿县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1504', '霍邱县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1505', '舒城县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1506', '金寨县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1507', '霍山县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1508', '谯城区', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1509', '涡阳县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1510', '蒙城县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1511', '利辛县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1512', '贵池区', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1513', '东至县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1514', '石台县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1515', '青阳县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1516', '宣州区', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1517', '郎溪县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1518', '广德县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1519', '泾县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1520', '绩溪县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1521', '旌德县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1522', '宁国市', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1523', '鼓楼区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1524', '台江区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1525', '仓山区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1526', '马尾区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1527', '晋安区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1528', '闽侯县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1529', '连江县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1530', '罗源县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1531', '闽清县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1532', '永泰县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1533', '平潭县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1534', '福清市', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1535', '长乐市', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1536', '思明区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1537', '海沧区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1538', '湖里区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1539', '集美区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1540', '同安区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1541', '翔安区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1542', '城厢区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1543', '涵江区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1544', '荔城区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1545', '秀屿区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1546', '仙游县', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1547', '梅列区', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1548', '三元区', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1549', '明溪县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1550', '清流县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1551', '宁化县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1552', '大田县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1553', '尤溪县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1554', '沙县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1555', '将乐县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1556', '泰宁县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1557', '建宁县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1558', '永安市', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1559', '鲤城区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1560', '丰泽区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1561', '洛江区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1562', '泉港区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1563', '惠安县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1564', '安溪县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1565', '永春县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1566', '德化县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1567', '金门县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1568', '石狮市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1569', '晋江市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1570', '南安市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1571', '芗城区', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1572', '龙文区', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1573', '云霄县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1574', '漳浦县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1575', '诏安县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1576', '长泰县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1577', '东山县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1578', '南靖县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1579', '平和县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1580', '华安县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1581', '龙海市', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1582', '延平区', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1583', '顺昌县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1584', '浦城县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1585', '光泽县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1586', '松溪县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1587', '政和县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1588', '邵武市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1589', '武夷山市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1590', '建瓯市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1591', '建阳市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1592', '新罗区', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1593', '长汀县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1594', '永定县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1595', '上杭县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1596', '武平县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1597', '连城县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1598', '漳平市', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1599', '蕉城区', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1600', '霞浦县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1601', '古田县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1602', '屏南县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1603', '寿宁县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1604', '周宁县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1605', '柘荣县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1606', '福安市', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1607', '福鼎市', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1608', '东湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1609', '西湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1610', '青云谱区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1611', '湾里区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1612', '青山湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1613', '南昌县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1614', '新建县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1615', '安义县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1616', '进贤县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1617', '昌江区', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1618', '珠山区', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1619', '浮梁县', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1620', '乐平市', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1621', '安源区', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1622', '湘东区', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1623', '莲花县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1624', '上栗县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1625', '芦溪县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1626', '庐山区', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1627', '浔阳区', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1628', '九江县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1629', '武宁县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1630', '修水县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1631', '永修县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1632', '德安县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1633', '星子县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1634', '都昌县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1635', '湖口县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1636', '彭泽县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1637', '瑞昌市', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1638', '渝水区', '0', '254', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1639', '分宜县', '0', '254', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1640', '月湖区', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1641', '余江县', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1642', '贵溪市', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1643', '章贡区', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1644', '赣县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1645', '信丰县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1646', '大余县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1647', '上犹县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1648', '崇义县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1649', '安远县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1650', '龙南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1651', '定南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1652', '全南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1653', '宁都县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1654', '于都县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1655', '兴国县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1656', '会昌县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1657', '寻乌县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1658', '石城县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1659', '瑞金市', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1660', '南康市', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1661', '吉州区', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1662', '青原区', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1663', '吉安县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1664', '吉水县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1665', '峡江县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1666', '新干县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1667', '永丰县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1668', '泰和县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1669', '遂川县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1670', '万安县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1671', '安福县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1672', '永新县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1673', '井冈山市', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1674', '袁州区', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1675', '奉新县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1676', '万载县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1677', '上高县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1678', '宜丰县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1679', '靖安县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1680', '铜鼓县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1681', '丰城市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1682', '樟树市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1683', '高安市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1684', '临川区', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1685', '南城县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1686', '黎川县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1687', '南丰县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1688', '崇仁县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1689', '乐安县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1690', '宜黄县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1691', '金溪县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1692', '资溪县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1693', '东乡县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1694', '广昌县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1695', '信州区', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1696', '上饶县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1697', '广丰县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1698', '玉山县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1699', '铅山县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1700', '横峰县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1701', '弋阳县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1702', '余干县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1703', '鄱阳县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1704', '万年县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1705', '婺源县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1706', '德兴市', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1707', '历下区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1708', '市中区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1709', '槐荫区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1710', '天桥区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1711', '历城区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1712', '长清区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1713', '平阴县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1714', '济阳县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1715', '商河县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1716', '章丘市', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1717', '市南区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1718', '市北区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1719', '四方区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1720', '黄岛区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1721', '崂山区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1722', '李沧区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1723', '城阳区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1724', '胶州市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1725', '即墨市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1726', '平度市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1727', '胶南市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1728', '莱西市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1729', '淄川区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1730', '张店区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1731', '博山区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1732', '临淄区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1733', '周村区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1734', '桓台县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1735', '高青县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1736', '沂源县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1737', '市中区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1738', '薛城区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1739', '峄城区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1740', '台儿庄区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1741', '山亭区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1742', '滕州市', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1743', '东营区', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1744', '河口区', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1745', '垦利县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1746', '利津县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1747', '广饶县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1748', '芝罘区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1749', '福山区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1750', '牟平区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1751', '莱山区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1752', '长岛县', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1753', '龙口市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1754', '莱阳市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1755', '莱州市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1756', '蓬莱市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1757', '招远市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1758', '栖霞市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1759', '海阳市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1760', '潍城区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1761', '寒亭区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1762', '坊子区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1763', '奎文区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1764', '临朐县', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1765', '昌乐县', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1766', '青州市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1767', '诸城市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1768', '寿光市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1769', '安丘市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1770', '高密市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1771', '昌邑市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1772', '市中区', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1773', '任城区', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1774', '微山县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1775', '鱼台县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1776', '金乡县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1777', '嘉祥县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1778', '汶上县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1779', '泗水县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1780', '梁山县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1781', '曲阜市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1782', '兖州市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1783', '邹城市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1784', '泰山区', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1785', '岱岳区', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1786', '宁阳县', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1787', '东平县', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1788', '新泰市', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1789', '肥城市', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1790', '环翠区', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1791', '文登市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1792', '荣成市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1793', '乳山市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1794', '东港区', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1795', '岚山区', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1796', '五莲县', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1797', '莒县', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1798', '莱城区', '0', '272', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1799', '钢城区', '0', '272', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1800', '兰山区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1801', '罗庄区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1802', '河东区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1803', '沂南县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1804', '郯城县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1805', '沂水县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1806', '苍山县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1807', '费县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1808', '平邑县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1809', '莒南县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1810', '蒙阴县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1811', '临沭县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1812', '德城区', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1813', '陵县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1814', '宁津县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1815', '庆云县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1816', '临邑县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1817', '齐河县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1818', '平原县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1819', '夏津县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1820', '武城县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1821', '乐陵市', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1822', '禹城市', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1823', '东昌府区', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1824', '阳谷县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1825', '莘县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1826', '茌平县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1827', '东阿县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1828', '冠县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1829', '高唐县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1830', '临清市', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1831', '滨城区', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1832', '惠民县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1833', '阳信县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1834', '无棣县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1835', '沾化县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1836', '博兴县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1837', '邹平县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1838', '牡丹区', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1839', '曹县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1840', '单县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1841', '成武县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1842', '巨野县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1843', '郓城县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1844', '鄄城县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1845', '定陶县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1846', '东明县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1847', '中原区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1848', '二七区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1849', '管城回族区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1850', '金水区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1851', '上街区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1852', '惠济区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1853', '中牟县', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1854', '巩义市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1855', '荥阳市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1856', '新密市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1857', '新郑市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1858', '登封市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1859', '龙亭区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1860', '顺河回族区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1861', '鼓楼区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1862', '禹王台区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1863', '金明区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1864', '杞县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1865', '通许县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1866', '尉氏县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1867', '开封县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1868', '兰考县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1869', '老城区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1870', '西工区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1871', '廛河回族区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1872', '涧西区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1873', '吉利区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1874', '洛龙区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1875', '孟津县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1876', '新安县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1877', '栾川县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1878', '嵩县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1879', '汝阳县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1880', '宜阳县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1881', '洛宁县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1882', '伊川县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1883', '偃师市', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1884', '新华区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1885', '卫东区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1886', '石龙区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1887', '湛河区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1888', '宝丰县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1889', '叶县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1890', '鲁山县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1891', '郏县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1892', '舞钢市', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1893', '汝州市', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1894', '文峰区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1895', '北关区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1896', '殷都区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1897', '龙安区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1898', '安阳县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1899', '汤阴县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1900', '滑县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1901', '内黄县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1902', '林州市', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1903', '鹤山区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1904', '山城区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1905', '淇滨区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1906', '浚县', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1907', '淇县', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1908', '红旗区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1909', '卫滨区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1910', '凤泉区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1911', '牧野区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1912', '新乡县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1913', '获嘉县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1914', '原阳县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1915', '延津县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1916', '封丘县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1917', '长垣县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1918', '卫辉市', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1919', '辉县市', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1920', '解放区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1921', '中站区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1922', '马村区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1923', '山阳区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1924', '修武县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1925', '博爱县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1926', '武陟县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1927', '温县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1928', '济源市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1929', '沁阳市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1930', '孟州市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1931', '华龙区', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1932', '清丰县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1933', '南乐县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1934', '范县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1935', '台前县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1936', '濮阳县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1937', '魏都区', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1938', '许昌县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1939', '鄢陵县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1940', '襄城县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1941', '禹州市', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1942', '长葛市', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1943', '源汇区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1944', '郾城区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1945', '召陵区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1946', '舞阳县', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1947', '临颍县', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1948', '湖滨区', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1949', '渑池县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1950', '陕县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1951', '卢氏县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1952', '义马市', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1953', '灵宝市', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1954', '宛城区', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1955', '卧龙区', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1956', '南召县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1957', '方城县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1958', '西峡县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1959', '镇平县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1960', '内乡县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1961', '淅川县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1962', '社旗县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1963', '唐河县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1964', '新野县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1965', '桐柏县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1966', '邓州市', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1967', '梁园区', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1968', '睢阳区', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1969', '民权县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1970', '睢县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1971', '宁陵县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1972', '柘城县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1973', '虞城县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1974', '夏邑县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1975', '永城市', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1976', '浉河区', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1977', '平桥区', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1978', '罗山县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1979', '光山县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1980', '新县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1981', '商城县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1982', '固始县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1983', '潢川县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1984', '淮滨县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1985', '息县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1986', '川汇区', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1987', '扶沟县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1988', '西华县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1989', '商水县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1990', '沈丘县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1991', '郸城县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1992', '淮阳县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1993', '太康县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1994', '鹿邑县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1995', '项城市', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1996', '驿城区', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1997', '西平县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1998', '上蔡县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('1999', '平舆县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2000', '正阳县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2001', '确山县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2002', '泌阳县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2003', '汝南县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2004', '遂平县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2005', '新蔡县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2006', '江岸区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2007', '江汉区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2008', '硚口区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2009', '汉阳区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2010', '武昌区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2011', '青山区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2012', '洪山区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2013', '东西湖区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2014', '汉南区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2015', '蔡甸区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2016', '江夏区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2017', '黄陂区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2018', '新洲区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2019', '黄石港区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2020', '西塞山区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2021', '下陆区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2022', '铁山区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2023', '阳新县', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2024', '大冶市', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2025', '茅箭区', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2026', '张湾区', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2027', '郧县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2028', '郧西县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2029', '竹山县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2030', '竹溪县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2031', '房县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2032', '丹江口市', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2033', '西陵区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2034', '伍家岗区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2035', '点军区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2036', '猇亭区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2037', '夷陵区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2038', '远安县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2039', '兴山县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2040', '秭归县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2041', '长阳土家族自治县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2042', '五峰土家族自治县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2043', '宜都市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2044', '当阳市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2045', '枝江市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2046', '襄城区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2047', '樊城区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2048', '襄阳区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2049', '南漳县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2050', '谷城县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2051', '保康县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2052', '老河口市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2053', '枣阳市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2054', '宜城市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2055', '梁子湖区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2056', '华容区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2057', '鄂城区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2058', '东宝区', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2059', '掇刀区', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2060', '京山县', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2061', '沙洋县', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2062', '钟祥市', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2063', '孝南区', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2064', '孝昌县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2065', '大悟县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2066', '云梦县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2067', '应城市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2068', '安陆市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2069', '汉川市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2070', '沙市区', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2071', '荆州区', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2072', '公安县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2073', '监利县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2074', '江陵县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2075', '石首市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2076', '洪湖市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2077', '松滋市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2078', '黄州区', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2079', '团风县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2080', '红安县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2081', '罗田县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2082', '英山县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2083', '浠水县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2084', '蕲春县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2085', '黄梅县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2086', '麻城市', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2087', '武穴市', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2088', '咸安区', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2089', '嘉鱼县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2090', '通城县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2091', '崇阳县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2092', '通山县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2093', '赤壁市', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2094', '曾都区', '0', '306', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2095', '广水市', '0', '306', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2096', '恩施市', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2097', '利川市', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2098', '建始县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2099', '巴东县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2100', '宣恩县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2101', '咸丰县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2102', '来凤县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2103', '鹤峰县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2104', '芙蓉区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2105', '天心区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2106', '岳麓区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2107', '开福区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2108', '雨花区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2109', '长沙县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2110', '望城县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2111', '宁乡县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2112', '浏阳市', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2113', '荷塘区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2114', '芦淞区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2115', '石峰区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2116', '天元区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2117', '株洲县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2118', '攸县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2119', '茶陵县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2120', '炎陵县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2121', '醴陵市', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2122', '雨湖区', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2123', '岳塘区', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2124', '湘潭县', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2125', '湘乡市', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2126', '韶山市', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2127', '珠晖区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2128', '雁峰区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2129', '石鼓区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2130', '蒸湘区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2131', '南岳区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2132', '衡阳县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2133', '衡南县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2134', '衡山县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2135', '衡东县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2136', '祁东县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2137', '耒阳市', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2138', '常宁市', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2139', '双清区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2140', '大祥区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2141', '北塔区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2142', '邵东县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2143', '新邵县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2144', '邵阳县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2145', '隆回县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2146', '洞口县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2147', '绥宁县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2148', '新宁县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2149', '城步苗族自治县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2150', '武冈市', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2151', '岳阳楼区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2152', '云溪区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2153', '君山区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2154', '岳阳县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2155', '华容县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2156', '湘阴县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2157', '平江县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2158', '汨罗市', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2159', '临湘市', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2160', '武陵区', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2161', '鼎城区', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2162', '安乡县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2163', '汉寿县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2164', '澧县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2165', '临澧县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2166', '桃源县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2167', '石门县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2168', '津市市', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2169', '永定区', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2170', '武陵源区', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2171', '慈利县', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2172', '桑植县', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2173', '资阳区', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2174', '赫山区', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2175', '南县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2176', '桃江县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2177', '安化县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2178', '沅江市', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2179', '北湖区', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2180', '苏仙区', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2181', '桂阳县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2182', '宜章县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2183', '永兴县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2184', '嘉禾县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2185', '临武县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2186', '汝城县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2187', '桂东县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2188', '安仁县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2189', '资兴市', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2190', '零陵区', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2191', '冷水滩区', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2192', '祁阳县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2193', '东安县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2194', '双牌县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2195', '道县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2196', '江永县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2197', '宁远县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2198', '蓝山县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2199', '新田县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2200', '江华瑶族自治县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2201', '鹤城区', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2202', '中方县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2203', '沅陵县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2204', '辰溪县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2205', '溆浦县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2206', '会同县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2207', '麻阳苗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2208', '新晃侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2209', '芷江侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2210', '靖州苗族侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2211', '通道侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2212', '洪江市', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2213', '娄星区', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2214', '双峰县', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2215', '新化县', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2216', '冷水江市', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2217', '涟源市', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2218', '吉首市', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2219', '泸溪县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2220', '凤凰县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2221', '花垣县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2222', '保靖县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2223', '古丈县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2224', '永顺县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2225', '龙山县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2226', '荔湾区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2227', '越秀区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2228', '海珠区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2229', '天河区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2230', '白云区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2231', '黄埔区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2232', '番禺区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2233', '花都区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2234', '南沙区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2235', '萝岗区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2236', '增城市', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2237', '从化市', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2238', '武江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2239', '浈江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2240', '曲江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2241', '始兴县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2242', '仁化县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2243', '翁源县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2244', '乳源瑶族自治县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2245', '新丰县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2246', '乐昌市', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2247', '南雄市', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2248', '罗湖区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2249', '福田区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2250', '南山区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2251', '宝安区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2252', '龙岗区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2253', '盐田区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2254', '香洲区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2255', '斗门区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2256', '金湾区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2257', '龙湖区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2258', '金平区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2259', '濠江区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2260', '潮阳区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2261', '潮南区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2262', '澄海区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2263', '南澳县', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2264', '禅城区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2265', '南海区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2266', '顺德区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2267', '三水区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2268', '高明区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2269', '蓬江区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2270', '江海区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2271', '新会区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2272', '台山市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2273', '开平市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2274', '鹤山市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2275', '恩平市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2276', '赤坎区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2277', '霞山区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2278', '坡头区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2279', '麻章区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2280', '遂溪县', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2281', '徐闻县', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2282', '廉江市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2283', '雷州市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2284', '吴川市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2285', '茂南区', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2286', '茂港区', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2287', '电白县', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2288', '高州市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2289', '化州市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2290', '信宜市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2291', '端州区', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2292', '鼎湖区', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2293', '广宁县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2294', '怀集县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2295', '封开县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2296', '德庆县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2297', '高要市', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2298', '四会市', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2299', '惠城区', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2300', '惠阳区', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2301', '博罗县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2302', '惠东县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2303', '龙门县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2304', '梅江区', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2305', '梅县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2306', '大埔县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2307', '丰顺县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2308', '五华县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2309', '平远县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2310', '蕉岭县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2311', '兴宁市', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2312', '城区', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2313', '海丰县', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2314', '陆河县', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2315', '陆丰市', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2316', '源城区', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2317', '紫金县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2318', '龙川县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2319', '连平县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2320', '和平县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2321', '东源县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2322', '江城区', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2323', '阳西县', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2324', '阳东县', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2325', '阳春市', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2326', '清城区', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2327', '佛冈县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2328', '阳山县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2329', '连山壮族瑶族自治县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2330', '连南瑶族自治县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2331', '清新县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2332', '英德市', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2333', '连州市', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2334', '湘桥区', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2335', '潮安县', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2336', '饶平县', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2337', '榕城区', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2338', '揭东县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2339', '揭西县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2340', '惠来县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2341', '普宁市', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2342', '云城区', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2343', '新兴县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2344', '郁南县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2345', '云安县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2346', '罗定市', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2347', '兴宁区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2348', '青秀区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2349', '江南区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2350', '西乡塘区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2351', '良庆区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2352', '邕宁区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2353', '武鸣县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2354', '隆安县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2355', '马山县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2356', '上林县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2357', '宾阳县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2358', '横县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2359', '城中区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2360', '鱼峰区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2361', '柳南区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2362', '柳北区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2363', '柳江县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2364', '柳城县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2365', '鹿寨县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2366', '融安县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2367', '融水苗族自治县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2368', '三江侗族自治县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2369', '秀峰区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2370', '叠彩区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2371', '象山区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2372', '七星区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2373', '雁山区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2374', '阳朔县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2375', '临桂县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2376', '灵川县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2377', '全州县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2378', '兴安县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2379', '永福县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2380', '灌阳县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2381', '龙胜各族自治县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2382', '资源县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2383', '平乐县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2384', '荔蒲县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2385', '恭城瑶族自治县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2386', '万秀区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2387', '蝶山区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2388', '长洲区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2389', '苍梧县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2390', '藤县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2391', '蒙山县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2392', '岑溪市', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2393', '海城区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2394', '银海区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2395', '铁山港区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2396', '合浦县', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2397', '港口区', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2398', '防城区', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2399', '上思县', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2400', '东兴市', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2401', '钦南区', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2402', '钦北区', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2403', '灵山县', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2404', '浦北县', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2405', '港北区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2406', '港南区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2407', '覃塘区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2408', '平南县', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2409', '桂平市', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2410', '玉州区', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2411', '容县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2412', '陆川县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2413', '博白县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2414', '兴业县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2415', '北流市', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2416', '右江区', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2417', '田阳县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2418', '田东县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2419', '平果县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2420', '德保县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2421', '靖西县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2422', '那坡县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2423', '凌云县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2424', '乐业县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2425', '田林县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2426', '西林县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2427', '隆林各族自治县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2428', '八步区', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2429', '昭平县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2430', '钟山县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2431', '富川瑶族自治县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2432', '金城江区', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2433', '南丹县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2434', '天峨县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2435', '凤山县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2436', '东兰县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2437', '罗城仫佬族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2438', '环江毛南族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2439', '巴马瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2440', '都安瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2441', '大化瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2442', '宜州市', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2443', '兴宾区', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2444', '忻城县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2445', '象州县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2446', '武宣县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2447', '金秀瑶族自治县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2448', '合山市', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2449', '江洲区', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2450', '扶绥县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2451', '宁明县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2452', '龙州县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2453', '大新县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2454', '天等县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2455', '凭祥市', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2456', '秀英区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2457', '龙华区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2458', '琼山区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2459', '美兰区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2460', '锦江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2461', '青羊区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2462', '金牛区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2463', '武侯区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2464', '成华区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2465', '龙泉驿区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2466', '青白江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2467', '新都区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2468', '温江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2469', '金堂县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2470', '双流县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2471', '郫县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2472', '大邑县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2473', '蒲江县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2474', '新津县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2475', '都江堰市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2476', '彭州市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2477', '邛崃市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2478', '崇州市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2479', '自流井区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2480', '贡井区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2481', '大安区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2482', '沿滩区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2483', '荣县', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2484', '富顺县', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2485', '东区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2486', '西区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2487', '仁和区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2488', '米易县', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2489', '盐边县', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2490', '江阳区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2491', '纳溪区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2492', '龙马潭区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2493', '泸县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2494', '合江县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2495', '叙永县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2496', '古蔺县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2497', '旌阳区', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2498', '中江县', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2499', '罗江县', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2500', '广汉市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2501', '什邡市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2502', '绵竹市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2503', '涪城区', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2504', '游仙区', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2505', '三台县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2506', '盐亭县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2507', '安县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2508', '梓潼县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2509', '北川羌族自治县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2510', '平武县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2511', '江油市', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2512', '市中区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2513', '元坝区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2514', '朝天区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2515', '旺苍县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2516', '青川县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2517', '剑阁县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2518', '苍溪县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2519', '船山区', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2520', '安居区', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2521', '蓬溪县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2522', '射洪县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2523', '大英县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2524', '市中区', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2525', '东兴区', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2526', '威远县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2527', '资中县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2528', '隆昌县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2529', '市中区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2530', '沙湾区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2531', '五通桥区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2532', '金口河区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2533', '犍为县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2534', '井研县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2535', '夹江县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2536', '沐川县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2537', '峨边彝族自治县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2538', '马边彝族自治县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2539', '峨眉山市', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2540', '顺庆区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2541', '高坪区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2542', '嘉陵区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2543', '南部县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2544', '营山县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2545', '蓬安县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2546', '仪陇县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2547', '西充县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2548', '阆中市', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2549', '东坡区', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2550', '仁寿县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2551', '彭山县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2552', '洪雅县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2553', '丹棱县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2554', '青神县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2555', '翠屏区', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2556', '宜宾县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2557', '南溪县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2558', '江安县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2559', '长宁县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2560', '高县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2561', '珙县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2562', '筠连县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2563', '兴文县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2564', '屏山县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2565', '广安区', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2566', '岳池县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2567', '武胜县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2568', '邻水县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2569', '华蓥市', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2570', '通川区', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2571', '达县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2572', '宣汉县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2573', '开江县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2574', '大竹县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2575', '渠县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2576', '万源市', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2577', '雨城区', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2578', '名山县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2579', '荥经县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2580', '汉源县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2581', '石棉县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2582', '天全县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2583', '芦山县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2584', '宝兴县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2585', '巴州区', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2586', '通江县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2587', '南江县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2588', '平昌县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2589', '雁江区', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2590', '安岳县', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2591', '乐至县', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2592', '简阳市', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2593', '汶川县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2594', '理县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2595', '茂县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2596', '松潘县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2597', '九寨沟县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2598', '金川县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2599', '小金县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2600', '黑水县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2601', '马尔康县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2602', '壤塘县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2603', '阿坝县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2604', '若尔盖县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2605', '红原县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2606', '康定县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2607', '泸定县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2608', '丹巴县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2609', '九龙县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2610', '雅江县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2611', '道孚县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2612', '炉霍县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2613', '甘孜县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2614', '新龙县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2615', '德格县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2616', '白玉县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2617', '石渠县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2618', '色达县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2619', '理塘县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2620', '巴塘县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2621', '乡城县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2622', '稻城县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2623', '得荣县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2624', '西昌市', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2625', '木里藏族自治县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2626', '盐源县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2627', '德昌县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2628', '会理县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2629', '会东县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2630', '宁南县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2631', '普格县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2632', '布拖县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2633', '金阳县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2634', '昭觉县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2635', '喜德县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2636', '冕宁县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2637', '越西县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2638', '甘洛县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2639', '美姑县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2640', '雷波县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2641', '南明区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2642', '云岩区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2643', '花溪区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2644', '乌当区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2645', '白云区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2646', '小河区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2647', '开阳县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2648', '息烽县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2649', '修文县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2650', '清镇市', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2651', '钟山区', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2652', '六枝特区', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2653', '水城县', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2654', '盘县', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2655', '红花岗区', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2656', '汇川区', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2657', '遵义县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2658', '桐梓县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2659', '绥阳县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2660', '正安县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2661', '道真仡佬族苗族自治县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2662', '务川仡佬族苗族自治县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2663', '凤冈县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2664', '湄潭县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2665', '余庆县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2666', '习水县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2667', '赤水市', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2668', '仁怀市', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2669', '西秀区', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2670', '平坝县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2671', '普定县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2672', '镇宁布依族苗族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2673', '关岭布依族苗族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2674', '紫云苗族布依族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2675', '铜仁市', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2676', '江口县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2677', '玉屏侗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2678', '石阡县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2679', '思南县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2680', '印江土家族苗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2681', '德江县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2682', '沿河土家族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2683', '松桃苗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2684', '万山特区', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2685', '兴义市', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2686', '兴仁县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2687', '普安县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2688', '晴隆县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2689', '贞丰县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2690', '望谟县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2691', '册亨县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2692', '安龙县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2693', '毕节市', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2694', '大方县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2695', '黔西县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2696', '金沙县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2697', '织金县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2698', '纳雍县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2699', '威宁彝族回族苗族自治县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2700', '赫章县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2701', '凯里市', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2702', '黄平县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2703', '施秉县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2704', '三穗县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2705', '镇远县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2706', '岑巩县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2707', '天柱县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2708', '锦屏县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2709', '剑河县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2710', '台江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2711', '黎平县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2712', '榕江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2713', '从江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2714', '雷山县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2715', '麻江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2716', '丹寨县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2717', '都匀市', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2718', '福泉市', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2719', '荔波县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2720', '贵定县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2721', '瓮安县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2722', '独山县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2723', '平塘县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2724', '罗甸县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2725', '长顺县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2726', '龙里县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2727', '惠水县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2728', '三都水族自治县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2729', '五华区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2730', '盘龙区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2731', '官渡区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2732', '西山区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2733', '东川区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2734', '呈贡县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2735', '晋宁县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2736', '富民县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2737', '宜良县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2738', '石林彝族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2739', '嵩明县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2740', '禄劝彝族苗族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2741', '寻甸回族彝族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2742', '安宁市', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2743', '麒麟区', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2744', '马龙县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2745', '陆良县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2746', '师宗县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2747', '罗平县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2748', '富源县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2749', '会泽县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2750', '沾益县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2751', '宣威市', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2752', '红塔区', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2753', '江川县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2754', '澄江县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2755', '通海县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2756', '华宁县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2757', '易门县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2758', '峨山彝族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2759', '新平彝族傣族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2760', '元江哈尼族彝族傣族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2761', '隆阳区', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2762', '施甸县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2763', '腾冲县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2764', '龙陵县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2765', '昌宁县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2766', '昭阳区', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2767', '鲁甸县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2768', '巧家县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2769', '盐津县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2770', '大关县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2771', '永善县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2772', '绥江县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2773', '镇雄县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2774', '彝良县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2775', '威信县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2776', '水富县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2777', '古城区', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2778', '玉龙纳西族自治县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2779', '永胜县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2780', '华坪县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2781', '宁蒗彝族自治县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2782', '翠云区', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2783', '普洱哈尼族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2784', '墨江哈尼族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2785', '景东彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2786', '景谷傣族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2787', '镇沅彝族哈尼族拉祜族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2788', '江城哈尼族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2789', '孟连傣族拉祜族佤族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2790', '澜沧拉祜族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2791', '西盟佤族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2792', '临翔区', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2793', '凤庆县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2794', '云县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2795', '永德县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2796', '镇康县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2797', '双江拉祜族佤族布朗族傣族自治县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2798', '耿马傣族佤族自治县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2799', '沧源佤族自治县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2800', '楚雄市', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2801', '双柏县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2802', '牟定县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2803', '南华县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2804', '姚安县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2805', '大姚县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2806', '永仁县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2807', '元谋县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2808', '武定县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2809', '禄丰县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2810', '个旧市', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2811', '开远市', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2812', '蒙自县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2813', '屏边苗族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2814', '建水县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2815', '石屏县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2816', '弥勒县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2817', '泸西县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2818', '元阳县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2819', '红河县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2820', '金平苗族瑶族傣族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2821', '绿春县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2822', '河口瑶族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2823', '文山县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2824', '砚山县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2825', '西畴县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2826', '麻栗坡县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2827', '马关县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2828', '丘北县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2829', '广南县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2830', '富宁县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2831', '景洪市', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2832', '勐海县', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2833', '勐腊县', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2834', '大理市', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2835', '漾濞彝族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2836', '祥云县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2837', '宾川县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2838', '弥渡县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2839', '南涧彝族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2840', '巍山彝族回族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2841', '永平县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2842', '云龙县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2843', '洱源县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2844', '剑川县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2845', '鹤庆县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2846', '瑞丽市', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2847', '潞西市', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2848', '梁河县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2849', '盈江县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2850', '陇川县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2851', '泸水县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2852', '福贡县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2853', '贡山独龙族怒族自治县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2854', '兰坪白族普米族自治县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2855', '香格里拉县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2856', '德钦县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2857', '维西傈僳族自治县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2858', '城关区', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2859', '林周县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2860', '当雄县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2861', '尼木县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2862', '曲水县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2863', '堆龙德庆县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2864', '达孜县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2865', '墨竹工卡县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2866', '昌都县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2867', '江达县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2868', '贡觉县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2869', '类乌齐县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2870', '丁青县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2871', '察雅县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2872', '八宿县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2873', '左贡县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2874', '芒康县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2875', '洛隆县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2876', '边坝县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2877', '乃东县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2878', '扎囊县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2879', '贡嘎县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2880', '桑日县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2881', '琼结县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2882', '曲松县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2883', '措美县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2884', '洛扎县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2885', '加查县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2886', '隆子县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2887', '错那县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2888', '浪卡子县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2889', '日喀则市', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2890', '南木林县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2891', '江孜县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2892', '定日县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2893', '萨迦县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2894', '拉孜县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2895', '昂仁县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2896', '谢通门县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2897', '白朗县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2898', '仁布县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2899', '康马县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2900', '定结县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2901', '仲巴县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2902', '亚东县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2903', '吉隆县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2904', '聂拉木县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2905', '萨嘎县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2906', '岗巴县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2907', '那曲县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2908', '嘉黎县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2909', '比如县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2910', '聂荣县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2911', '安多县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2912', '申扎县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2913', '索县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2914', '班戈县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2915', '巴青县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2916', '尼玛县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2917', '普兰县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2918', '札达县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2919', '噶尔县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2920', '日土县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2921', '革吉县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2922', '改则县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2923', '措勤县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2924', '林芝县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2925', '工布江达县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2926', '米林县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2927', '墨脱县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2928', '波密县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2929', '察隅县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2930', '朗县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2931', '新城区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2932', '碑林区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2933', '莲湖区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2934', '灞桥区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2935', '未央区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2936', '雁塔区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2937', '阎良区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2938', '临潼区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2939', '长安区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2940', '蓝田县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2941', '周至县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2942', '户县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2943', '高陵县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2944', '王益区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2945', '印台区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2946', '耀州区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2947', '宜君县', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2948', '渭滨区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2949', '金台区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2950', '陈仓区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2951', '凤翔县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2952', '岐山县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2953', '扶风县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2954', '眉县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2955', '陇县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2956', '千阳县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2957', '麟游县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2958', '凤县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2959', '太白县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2960', '秦都区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2961', '杨凌区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2962', '渭城区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2963', '三原县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2964', '泾阳县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2965', '乾县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2966', '礼泉县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2967', '永寿县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2968', '彬县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2969', '长武县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2970', '旬邑县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2971', '淳化县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2972', '武功县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2973', '兴平市', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2974', '临渭区', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2975', '华县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2976', '潼关县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2977', '大荔县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2978', '合阳县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2979', '澄城县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2980', '蒲城县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2981', '白水县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2982', '富平县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2983', '韩城市', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2984', '华阴市', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2985', '宝塔区', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2986', '延长县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2987', '延川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2988', '子长县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2989', '安塞县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2990', '志丹县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2991', '吴起县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2992', '甘泉县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2993', '富县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2994', '洛川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2995', '宜川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2996', '黄龙县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2997', '黄陵县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2998', '汉台区', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('2999', '南郑县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3000', '城固县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3001', '洋县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3002', '西乡县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3003', '勉县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3004', '宁强县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3005', '略阳县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3006', '镇巴县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3007', '留坝县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3008', '佛坪县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3009', '榆阳区', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3010', '神木县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3011', '府谷县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3012', '横山县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3013', '靖边县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3014', '定边县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3015', '绥德县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3016', '米脂县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3017', '佳县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3018', '吴堡县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3019', '清涧县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3020', '子洲县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3021', '汉滨区', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3022', '汉阴县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3023', '石泉县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3024', '宁陕县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3025', '紫阳县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3026', '岚皋县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3027', '平利县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3028', '镇坪县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3029', '旬阳县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3030', '白河县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3031', '商州区', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3032', '洛南县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3033', '丹凤县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3034', '商南县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3035', '山阳县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3036', '镇安县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3037', '柞水县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3038', '城关区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3039', '七里河区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3040', '西固区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3041', '安宁区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3042', '红古区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3043', '永登县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3044', '皋兰县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3045', '榆中县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3046', '金川区', '0', '447', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3047', '永昌县', '0', '447', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3048', '白银区', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3049', '平川区', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3050', '靖远县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3051', '会宁县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3052', '景泰县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3053', '秦城区', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3054', '北道区', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3055', '清水县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3056', '秦安县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3057', '甘谷县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3058', '武山县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3059', '张家川回族自治县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3060', '凉州区', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3061', '民勤县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3062', '古浪县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3063', '天祝藏族自治县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3064', '甘州区', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3065', '肃南裕固族自治县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3066', '民乐县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3067', '临泽县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3068', '高台县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3069', '山丹县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3070', '崆峒区', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3071', '泾川县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3072', '灵台县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3073', '崇信县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3074', '华亭县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3075', '庄浪县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3076', '静宁县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3077', '肃州区', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3078', '金塔县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3079', '瓜州县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3080', '肃北蒙古族自治县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3081', '阿克塞哈萨克族自治县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3082', '玉门市', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3083', '敦煌市', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3084', '西峰区', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3085', '庆城县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3086', '环县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3087', '华池县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3088', '合水县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3089', '正宁县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3090', '宁县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3091', '镇原县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3092', '安定区', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3093', '通渭县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3094', '陇西县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3095', '渭源县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3096', '临洮县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3097', '漳县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3098', '岷县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3099', '武都区', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3100', '成县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3101', '文县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3102', '宕昌县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3103', '康县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3104', '西和县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3105', '礼县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3106', '徽县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3107', '两当县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3108', '临夏市', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3109', '临夏县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3110', '康乐县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3111', '永靖县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3112', '广河县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3113', '和政县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3114', '东乡族自治县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3115', '积石山保安族东乡族撒拉族自治县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3116', '合作市', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3117', '临潭县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3118', '卓尼县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3119', '舟曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3120', '迭部县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3121', '玛曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3122', '碌曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3123', '夏河县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3124', '城东区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3125', '城中区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3126', '城西区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3127', '城北区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3128', '大通回族土族自治县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3129', '湟中县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3130', '湟源县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3131', '平安县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3132', '民和回族土族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3133', '乐都县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3134', '互助土族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3135', '化隆回族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3136', '循化撒拉族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3137', '门源回族自治县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3138', '祁连县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3139', '海晏县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3140', '刚察县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3141', '同仁县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3142', '尖扎县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3143', '泽库县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3144', '河南蒙古族自治县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3145', '共和县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3146', '同德县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3147', '贵德县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3148', '兴海县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3149', '贵南县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3150', '玛沁县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3151', '班玛县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3152', '甘德县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3153', '达日县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3154', '久治县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3155', '玛多县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3156', '玉树县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3157', '杂多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3158', '称多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3159', '治多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3160', '囊谦县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3161', '曲麻莱县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3162', '格尔木市', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3163', '德令哈市', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3164', '乌兰县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3165', '都兰县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3166', '天峻县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3167', '兴庆区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3168', '西夏区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3169', '金凤区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3170', '永宁县', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3171', '贺兰县', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3172', '灵武市', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3173', '大武口区', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3174', '惠农区', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3175', '平罗县', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3176', '利通区', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3177', '盐池县', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3178', '同心县', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3179', '青铜峡市', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3180', '原州区', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3181', '西吉县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3182', '隆德县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3183', '泾源县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3184', '彭阳县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3185', '沙坡头区', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3186', '中宁县', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3187', '海原县', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3188', '天山区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3189', '沙依巴克区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3190', '新市区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3191', '水磨沟区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3192', '头屯河区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3193', '达坂城区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3194', '东山区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3195', '乌鲁木齐县', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3196', '独山子区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3197', '克拉玛依区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3198', '白碱滩区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3199', '乌尔禾区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3200', '吐鲁番市', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3201', '鄯善县', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3202', '托克逊县', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3203', '哈密市', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3204', '巴里坤哈萨克自治县', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3205', '伊吾县', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3206', '昌吉市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3207', '阜康市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3208', '米泉市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3209', '呼图壁县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3210', '玛纳斯县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3211', '奇台县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3212', '吉木萨尔县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3213', '木垒哈萨克自治县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3214', '博乐市', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3215', '精河县', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3216', '温泉县', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3217', '库尔勒市', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3218', '轮台县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3219', '尉犁县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3220', '若羌县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3221', '且末县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3222', '焉耆回族自治县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3223', '和静县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3224', '和硕县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3225', '博湖县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3226', '阿克苏市', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3227', '温宿县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3228', '库车县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3229', '沙雅县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3230', '新和县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3231', '拜城县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3232', '乌什县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3233', '阿瓦提县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3234', '柯坪县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3235', '阿图什市', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3236', '阿克陶县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3237', '阿合奇县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3238', '乌恰县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3239', '喀什市', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3240', '疏附县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3241', '疏勒县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3242', '英吉沙县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3243', '泽普县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3244', '莎车县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3245', '叶城县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3246', '麦盖提县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3247', '岳普湖县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3248', '伽师县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3249', '巴楚县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3250', '塔什库尔干塔吉克自治县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3251', '和田市', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3252', '和田县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3253', '墨玉县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3254', '皮山县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3255', '洛浦县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3256', '策勒县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3257', '于田县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3258', '民丰县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3259', '伊宁市', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3260', '奎屯市', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3261', '伊宁县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3262', '察布查尔锡伯自治县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3263', '霍城县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3264', '巩留县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3265', '新源县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3266', '昭苏县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3267', '特克斯县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3268', '尼勒克县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3269', '塔城市', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3270', '乌苏市', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3271', '额敏县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3272', '沙湾县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3273', '托里县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3274', '裕民县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3275', '和布克赛尔蒙古自治县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3276', '阿勒泰市', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3277', '布尔津县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3278', '富蕴县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3279', '福海县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3280', '哈巴河县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3281', '青河县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3282', '吉木乃县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3358', '钓鱼岛', '', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `t_linkage` VALUES ('3359', '钓鱼岛', '', '3358', '0', '', '1', '0', '', null, '0');

-- ----------------------------
-- Table structure for `t_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=416 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('1', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-10-06 20:38:49');
INSERT INTO `t_log` VALUES ('2', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-10-06 20:38:49');
INSERT INTO `t_log` VALUES ('3', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-10-06 20:39:01');
INSERT INTO `t_log` VALUES ('4', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:45:31');
INSERT INTO `t_log` VALUES ('5', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:45:58');
INSERT INTO `t_log` VALUES ('6', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:46:44');
INSERT INTO `t_log` VALUES ('7', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:47:11');
INSERT INTO `t_log` VALUES ('8', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:51:59');
INSERT INTO `t_log` VALUES ('9', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:52:27');
INSERT INTO `t_log` VALUES ('10', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:53:12');
INSERT INTO `t_log` VALUES ('11', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:53:24');
INSERT INTO `t_log` VALUES ('12', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:53:37');
INSERT INTO `t_log` VALUES ('13', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:53:52');
INSERT INTO `t_log` VALUES ('14', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:54:25');
INSERT INTO `t_log` VALUES ('15', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:54:33');
INSERT INTO `t_log` VALUES ('16', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:54:54');
INSERT INTO `t_log` VALUES ('17', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:55:34');
INSERT INTO `t_log` VALUES ('18', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:55:37');
INSERT INTO `t_log` VALUES ('19', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:56:15');
INSERT INTO `t_log` VALUES ('20', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:56:17');
INSERT INTO `t_log` VALUES ('21', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:57:05');
INSERT INTO `t_log` VALUES ('22', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:58:28');
INSERT INTO `t_log` VALUES ('23', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:58:33');
INSERT INTO `t_log` VALUES ('24', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:58:46');
INSERT INTO `t_log` VALUES ('25', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:58:58');
INSERT INTO `t_log` VALUES ('26', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:59:13');
INSERT INTO `t_log` VALUES ('27', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 22:59:15');
INSERT INTO `t_log` VALUES ('28', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:00:19');
INSERT INTO `t_log` VALUES ('29', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:00:32');
INSERT INTO `t_log` VALUES ('30', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:00:36');
INSERT INTO `t_log` VALUES ('31', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:00:39');
INSERT INTO `t_log` VALUES ('32', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:00:40');
INSERT INTO `t_log` VALUES ('33', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:02:29');
INSERT INTO `t_log` VALUES ('34', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:03:07');
INSERT INTO `t_log` VALUES ('35', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:03:28');
INSERT INTO `t_log` VALUES ('36', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:03:57');
INSERT INTO `t_log` VALUES ('37', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:04:03');
INSERT INTO `t_log` VALUES ('38', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:04:10');
INSERT INTO `t_log` VALUES ('39', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:05:26');
INSERT INTO `t_log` VALUES ('40', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:07:36');
INSERT INTO `t_log` VALUES ('41', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:08:03');
INSERT INTO `t_log` VALUES ('42', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:08:05');
INSERT INTO `t_log` VALUES ('43', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:08:30');
INSERT INTO `t_log` VALUES ('44', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:08:41');
INSERT INTO `t_log` VALUES ('45', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:09:17');
INSERT INTO `t_log` VALUES ('46', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:09:19');
INSERT INTO `t_log` VALUES ('47', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:09:37');
INSERT INTO `t_log` VALUES ('48', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:10:52');
INSERT INTO `t_log` VALUES ('49', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:11:37');
INSERT INTO `t_log` VALUES ('50', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:11:42');
INSERT INTO `t_log` VALUES ('51', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:12:01');
INSERT INTO `t_log` VALUES ('52', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:12:03');
INSERT INTO `t_log` VALUES ('53', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:12:18');
INSERT INTO `t_log` VALUES ('54', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:12:20');
INSERT INTO `t_log` VALUES ('55', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:12:54');
INSERT INTO `t_log` VALUES ('56', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:12:56');
INSERT INTO `t_log` VALUES ('57', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:13:33');
INSERT INTO `t_log` VALUES ('58', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:13:36');
INSERT INTO `t_log` VALUES ('59', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:14:28');
INSERT INTO `t_log` VALUES ('60', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:14:30');
INSERT INTO `t_log` VALUES ('61', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:14:52');
INSERT INTO `t_log` VALUES ('62', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:14:54');
INSERT INTO `t_log` VALUES ('63', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:15:12');
INSERT INTO `t_log` VALUES ('64', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:15:20');
INSERT INTO `t_log` VALUES ('65', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:15:27');
INSERT INTO `t_log` VALUES ('66', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:16:17');
INSERT INTO `t_log` VALUES ('67', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:17:02');
INSERT INTO `t_log` VALUES ('68', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:17:52');
INSERT INTO `t_log` VALUES ('69', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-06 23:19:07');
INSERT INTO `t_log` VALUES ('70', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:44:02');
INSERT INTO `t_log` VALUES ('71', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:44:18');
INSERT INTO `t_log` VALUES ('72', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:44:19');
INSERT INTO `t_log` VALUES ('73', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:44:22');
INSERT INTO `t_log` VALUES ('74', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:44:23');
INSERT INTO `t_log` VALUES ('75', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:44:25');
INSERT INTO `t_log` VALUES ('76', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:44:30');
INSERT INTO `t_log` VALUES ('77', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:44:48');
INSERT INTO `t_log` VALUES ('78', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:44:52');
INSERT INTO `t_log` VALUES ('79', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:45:02');
INSERT INTO `t_log` VALUES ('80', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:45:25');
INSERT INTO `t_log` VALUES ('81', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'phpcms', '127.0.0.1', '2017-10-07 12:45:41');
INSERT INTO `t_log` VALUES ('82', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:33:44');
INSERT INTO `t_log` VALUES ('83', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:34:05');
INSERT INTO `t_log` VALUES ('84', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:34:13');
INSERT INTO `t_log` VALUES ('85', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:35:35');
INSERT INTO `t_log` VALUES ('86', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:35:46');
INSERT INTO `t_log` VALUES ('87', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:38:47');
INSERT INTO `t_log` VALUES ('88', '', '0', 'content', '', 'content', '?m=content&c=content&a=add_othors', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:38:57');
INSERT INTO `t_log` VALUES ('89', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:39:12');
INSERT INTO `t_log` VALUES ('90', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:39:26');
INSERT INTO `t_log` VALUES ('91', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:39:42');
INSERT INTO `t_log` VALUES ('92', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:44:30');
INSERT INTO `t_log` VALUES ('93', '', '0', 'dbsource', '', 'data', '?m=dbsource&c=data&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:44:51');
INSERT INTO `t_log` VALUES ('94', '', '0', 'dbsource', '', 'data', '?m=dbsource&c=data&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:44:56');
INSERT INTO `t_log` VALUES ('95', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:45:06');
INSERT INTO `t_log` VALUES ('96', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:45:08');
INSERT INTO `t_log` VALUES ('97', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:45:09');
INSERT INTO `t_log` VALUES ('98', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:45:12');
INSERT INTO `t_log` VALUES ('99', '', '0', 'special', '', 'special', '?m=special&c=special&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:46:13');
INSERT INTO `t_log` VALUES ('100', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:46:35');
INSERT INTO `t_log` VALUES ('101', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:46:36');
INSERT INTO `t_log` VALUES ('102', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:46:39');
INSERT INTO `t_log` VALUES ('103', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:46:41');
INSERT INTO `t_log` VALUES ('104', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:54:31');
INSERT INTO `t_log` VALUES ('105', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:54:32');
INSERT INTO `t_log` VALUES ('106', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:55:12');
INSERT INTO `t_log` VALUES ('107', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:56:08');
INSERT INTO `t_log` VALUES ('108', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:56:27');
INSERT INTO `t_log` VALUES ('109', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 21:57:16');
INSERT INTO `t_log` VALUES ('110', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 22:12:05');
INSERT INTO `t_log` VALUES ('111', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 22:12:14');
INSERT INTO `t_log` VALUES ('112', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 22:14:42');
INSERT INTO `t_log` VALUES ('113', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 22:15:07');
INSERT INTO `t_log` VALUES ('114', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 22:15:42');
INSERT INTO `t_log` VALUES ('115', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 22:16:14');
INSERT INTO `t_log` VALUES ('116', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 22:16:44');
INSERT INTO `t_log` VALUES ('117', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-09 22:16:46');
INSERT INTO `t_log` VALUES ('118', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-10-13 20:10:35');
INSERT INTO `t_log` VALUES ('119', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-11-14 22:24:59');
INSERT INTO `t_log` VALUES ('120', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-11-14 22:25:16');
INSERT INTO `t_log` VALUES ('121', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-11-14 22:25:20');
INSERT INTO `t_log` VALUES ('122', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-11-14 22:26:06');
INSERT INTO `t_log` VALUES ('123', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-11-14 22:26:07');
INSERT INTO `t_log` VALUES ('124', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-11-14 22:26:21');
INSERT INTO `t_log` VALUES ('125', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-14 22:34:58');
INSERT INTO `t_log` VALUES ('126', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-14 22:35:01');
INSERT INTO `t_log` VALUES ('127', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'phpcms', '127.0.0.1', '2017-11-14 22:35:42');
INSERT INTO `t_log` VALUES ('128', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-14 22:37:40');
INSERT INTO `t_log` VALUES ('129', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-14 22:37:46');
INSERT INTO `t_log` VALUES ('130', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-11-19 11:26:30');
INSERT INTO `t_log` VALUES ('131', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-11-19 11:32:31');
INSERT INTO `t_log` VALUES ('132', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-11-19 11:32:38');
INSERT INTO `t_log` VALUES ('133', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-26 17:16:21');
INSERT INTO `t_log` VALUES ('134', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-26 17:16:31');
INSERT INTO `t_log` VALUES ('135', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-26 17:16:34');
INSERT INTO `t_log` VALUES ('136', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-26 17:16:48');
INSERT INTO `t_log` VALUES ('137', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-26 17:16:50');
INSERT INTO `t_log` VALUES ('138', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-26 17:17:01');
INSERT INTO `t_log` VALUES ('139', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-26 17:17:03');
INSERT INTO `t_log` VALUES ('140', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-26 17:17:17');
INSERT INTO `t_log` VALUES ('141', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 18:21:48');
INSERT INTO `t_log` VALUES ('142', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:33:59');
INSERT INTO `t_log` VALUES ('143', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:34:00');
INSERT INTO `t_log` VALUES ('144', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:34:05');
INSERT INTO `t_log` VALUES ('145', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:34:14');
INSERT INTO `t_log` VALUES ('146', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:34:47');
INSERT INTO `t_log` VALUES ('147', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:35:04');
INSERT INTO `t_log` VALUES ('148', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:35:38');
INSERT INTO `t_log` VALUES ('149', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:35:46');
INSERT INTO `t_log` VALUES ('150', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:36:14');
INSERT INTO `t_log` VALUES ('151', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:36:56');
INSERT INTO `t_log` VALUES ('152', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:37:03');
INSERT INTO `t_log` VALUES ('153', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:37:38');
INSERT INTO `t_log` VALUES ('154', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-26 22:38:04');
INSERT INTO `t_log` VALUES ('155', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-27 21:34:36');
INSERT INTO `t_log` VALUES ('156', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-27 21:34:42');
INSERT INTO `t_log` VALUES ('157', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-27 21:34:47');
INSERT INTO `t_log` VALUES ('158', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-29 21:00:34');
INSERT INTO `t_log` VALUES ('159', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-11-29 21:00:47');
INSERT INTO `t_log` VALUES ('160', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:01:03');
INSERT INTO `t_log` VALUES ('161', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:01:06');
INSERT INTO `t_log` VALUES ('162', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:17:06');
INSERT INTO `t_log` VALUES ('163', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:17:08');
INSERT INTO `t_log` VALUES ('164', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:17:23');
INSERT INTO `t_log` VALUES ('165', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:17:31');
INSERT INTO `t_log` VALUES ('166', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:17:32');
INSERT INTO `t_log` VALUES ('167', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:17:49');
INSERT INTO `t_log` VALUES ('168', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:17:50');
INSERT INTO `t_log` VALUES ('169', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:17:51');
INSERT INTO `t_log` VALUES ('170', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:17:51');
INSERT INTO `t_log` VALUES ('171', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:18:46');
INSERT INTO `t_log` VALUES ('172', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:18:47');
INSERT INTO `t_log` VALUES ('173', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:18:55');
INSERT INTO `t_log` VALUES ('174', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:23:44');
INSERT INTO `t_log` VALUES ('175', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:23:45');
INSERT INTO `t_log` VALUES ('176', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:23:49');
INSERT INTO `t_log` VALUES ('177', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:23:49');
INSERT INTO `t_log` VALUES ('178', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:23:50');
INSERT INTO `t_log` VALUES ('179', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:23:51');
INSERT INTO `t_log` VALUES ('180', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:26:42');
INSERT INTO `t_log` VALUES ('181', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:26:46');
INSERT INTO `t_log` VALUES ('182', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:26:47');
INSERT INTO `t_log` VALUES ('183', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:26:47');
INSERT INTO `t_log` VALUES ('184', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_url_list', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:26:48');
INSERT INTO `t_log` VALUES ('185', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:26:58');
INSERT INTO `t_log` VALUES ('186', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:28:14');
INSERT INTO `t_log` VALUES ('187', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:37');
INSERT INTO `t_log` VALUES ('188', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:38');
INSERT INTO `t_log` VALUES ('189', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:40');
INSERT INTO `t_log` VALUES ('190', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:42');
INSERT INTO `t_log` VALUES ('191', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:44');
INSERT INTO `t_log` VALUES ('192', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:46');
INSERT INTO `t_log` VALUES ('193', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:47');
INSERT INTO `t_log` VALUES ('194', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:48');
INSERT INTO `t_log` VALUES ('195', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:50');
INSERT INTO `t_log` VALUES ('196', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:51');
INSERT INTO `t_log` VALUES ('197', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:52');
INSERT INTO `t_log` VALUES ('198', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:53');
INSERT INTO `t_log` VALUES ('199', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:53');
INSERT INTO `t_log` VALUES ('200', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:54');
INSERT INTO `t_log` VALUES ('201', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:56');
INSERT INTO `t_log` VALUES ('202', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:57');
INSERT INTO `t_log` VALUES ('203', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:58');
INSERT INTO `t_log` VALUES ('204', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:31:59');
INSERT INTO `t_log` VALUES ('205', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:32:00');
INSERT INTO `t_log` VALUES ('206', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:32:02');
INSERT INTO `t_log` VALUES ('207', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:32:03');
INSERT INTO `t_log` VALUES ('208', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=col_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:32:04');
INSERT INTO `t_log` VALUES ('209', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:32:06');
INSERT INTO `t_log` VALUES ('210', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:32:16');
INSERT INTO `t_log` VALUES ('211', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:32:28');
INSERT INTO `t_log` VALUES ('212', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:32:39');
INSERT INTO `t_log` VALUES ('213', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:32:46');
INSERT INTO `t_log` VALUES ('214', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:32:49');
INSERT INTO `t_log` VALUES ('215', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:33:00');
INSERT INTO `t_log` VALUES ('216', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:33:01');
INSERT INTO `t_log` VALUES ('217', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:34:05');
INSERT INTO `t_log` VALUES ('218', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:34:06');
INSERT INTO `t_log` VALUES ('219', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:34:13');
INSERT INTO `t_log` VALUES ('220', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:34:24');
INSERT INTO `t_log` VALUES ('221', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:35:31');
INSERT INTO `t_log` VALUES ('222', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:36:02');
INSERT INTO `t_log` VALUES ('223', '', '0', 'special', '', 'album', '?m=special&c=album&a=import', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:37:43');
INSERT INTO `t_log` VALUES ('224', '', '0', 'video', '', 'video', '?m=video&c=video&a=setting', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:37:44');
INSERT INTO `t_log` VALUES ('225', '', '0', 'admin', '', 'googlesitemap', '?m=admin&c=googlesitemap&a=set', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:38:16');
INSERT INTO `t_log` VALUES ('226', '', '0', 'dbsource', '', 'data', '?m=dbsource&c=data&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:38:48');
INSERT INTO `t_log` VALUES ('227', '', '0', 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:39:20');
INSERT INTO `t_log` VALUES ('228', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:39:21');
INSERT INTO `t_log` VALUES ('229', '', '0', 'admin', '', 'googlesitemap', '?m=admin&c=googlesitemap&a=set', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:39:23');
INSERT INTO `t_log` VALUES ('230', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:39:39');
INSERT INTO `t_log` VALUES ('231', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:39:52');
INSERT INTO `t_log` VALUES ('232', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:39:56');
INSERT INTO `t_log` VALUES ('233', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:40:04');
INSERT INTO `t_log` VALUES ('234', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:40:10');
INSERT INTO `t_log` VALUES ('235', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:40:21');
INSERT INTO `t_log` VALUES ('236', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_program_add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:40:33');
INSERT INTO `t_log` VALUES ('237', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_program_add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:41:09');
INSERT INTO `t_log` VALUES ('238', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:41:10');
INSERT INTO `t_log` VALUES ('239', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:41:13');
INSERT INTO `t_log` VALUES ('240', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:41:14');
INSERT INTO `t_log` VALUES ('241', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:41:15');
INSERT INTO `t_log` VALUES ('242', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:41:16');
INSERT INTO `t_log` VALUES ('243', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:42:05');
INSERT INTO `t_log` VALUES ('244', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:42:07');
INSERT INTO `t_log` VALUES ('245', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:42:13');
INSERT INTO `t_log` VALUES ('246', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:42:17');
INSERT INTO `t_log` VALUES ('247', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:42:19');
INSERT INTO `t_log` VALUES ('248', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:42:46');
INSERT INTO `t_log` VALUES ('249', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:45:14');
INSERT INTO `t_log` VALUES ('250', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:45:16');
INSERT INTO `t_log` VALUES ('251', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:45:18');
INSERT INTO `t_log` VALUES ('252', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:45:20');
INSERT INTO `t_log` VALUES ('253', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:46:35');
INSERT INTO `t_log` VALUES ('254', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:46:37');
INSERT INTO `t_log` VALUES ('255', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:46:38');
INSERT INTO `t_log` VALUES ('256', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:46:42');
INSERT INTO `t_log` VALUES ('257', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:46:50');
INSERT INTO `t_log` VALUES ('258', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_program_add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:46:57');
INSERT INTO `t_log` VALUES ('259', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:47:35');
INSERT INTO `t_log` VALUES ('260', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:47:40');
INSERT INTO `t_log` VALUES ('261', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:48:20');
INSERT INTO `t_log` VALUES ('262', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:48:34');
INSERT INTO `t_log` VALUES ('263', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:48:45');
INSERT INTO `t_log` VALUES ('264', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:48:47');
INSERT INTO `t_log` VALUES ('265', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:48:55');
INSERT INTO `t_log` VALUES ('266', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_program_add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:49:02');
INSERT INTO `t_log` VALUES ('267', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_program_add', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:49:23');
INSERT INTO `t_log` VALUES ('268', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:49:25');
INSERT INTO `t_log` VALUES ('269', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:49:26');
INSERT INTO `t_log` VALUES ('270', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=import_content', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:49:28');
INSERT INTO `t_log` VALUES ('271', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:49:31');
INSERT INTO `t_log` VALUES ('272', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=publist', '', '1', 'phpcms', '127.0.0.1', '2017-11-29 21:49:32');
INSERT INTO `t_log` VALUES ('273', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-12-27 21:06:09');
INSERT INTO `t_log` VALUES ('274', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-12-27 21:06:18');
INSERT INTO `t_log` VALUES ('275', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-12-28 17:44:30');
INSERT INTO `t_log` VALUES ('276', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-12-28 17:44:40');
INSERT INTO `t_log` VALUES ('277', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:44:47');
INSERT INTO `t_log` VALUES ('278', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:44:48');
INSERT INTO `t_log` VALUES ('279', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:45:06');
INSERT INTO `t_log` VALUES ('280', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:45:31');
INSERT INTO `t_log` VALUES ('281', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:45:32');
INSERT INTO `t_log` VALUES ('282', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:45:33');
INSERT INTO `t_log` VALUES ('283', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:45:34');
INSERT INTO `t_log` VALUES ('284', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:45:35');
INSERT INTO `t_log` VALUES ('285', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:45:43');
INSERT INTO `t_log` VALUES ('286', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:46:11');
INSERT INTO `t_log` VALUES ('287', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:46:33');
INSERT INTO `t_log` VALUES ('288', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:47:29');
INSERT INTO `t_log` VALUES ('289', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:47:42');
INSERT INTO `t_log` VALUES ('290', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:53:09');
INSERT INTO `t_log` VALUES ('291', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:53:20');
INSERT INTO `t_log` VALUES ('292', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:53:53');
INSERT INTO `t_log` VALUES ('293', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:54:02');
INSERT INTO `t_log` VALUES ('294', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:54:09');
INSERT INTO `t_log` VALUES ('295', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:59:08');
INSERT INTO `t_log` VALUES ('296', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:59:16');
INSERT INTO `t_log` VALUES ('297', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:59:24');
INSERT INTO `t_log` VALUES ('298', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:59:37');
INSERT INTO `t_log` VALUES ('299', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:59:44');
INSERT INTO `t_log` VALUES ('300', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 17:59:56');
INSERT INTO `t_log` VALUES ('301', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 18:00:03');
INSERT INTO `t_log` VALUES ('302', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 18:00:28');
INSERT INTO `t_log` VALUES ('303', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 18:00:47');
INSERT INTO `t_log` VALUES ('304', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 18:01:14');
INSERT INTO `t_log` VALUES ('305', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 18:01:35');
INSERT INTO `t_log` VALUES ('306', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 18:01:49');
INSERT INTO `t_log` VALUES ('307', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 18:02:02');
INSERT INTO `t_log` VALUES ('308', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-28 18:02:24');
INSERT INTO `t_log` VALUES ('309', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-12-29 13:18:55');
INSERT INTO `t_log` VALUES ('310', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-12-29 13:18:55');
INSERT INTO `t_log` VALUES ('311', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-12-29 13:19:04');
INSERT INTO `t_log` VALUES ('312', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:19:14');
INSERT INTO `t_log` VALUES ('313', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:20:38');
INSERT INTO `t_log` VALUES ('314', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:20:41');
INSERT INTO `t_log` VALUES ('315', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:22:26');
INSERT INTO `t_log` VALUES ('316', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:22:29');
INSERT INTO `t_log` VALUES ('317', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:24:22');
INSERT INTO `t_log` VALUES ('318', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:24:26');
INSERT INTO `t_log` VALUES ('319', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:25:35');
INSERT INTO `t_log` VALUES ('320', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:25:37');
INSERT INTO `t_log` VALUES ('321', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:26:50');
INSERT INTO `t_log` VALUES ('322', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:37:18');
INSERT INTO `t_log` VALUES ('323', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:40:58');
INSERT INTO `t_log` VALUES ('324', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:41:21');
INSERT INTO `t_log` VALUES ('325', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:41:29');
INSERT INTO `t_log` VALUES ('326', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:46:49');
INSERT INTO `t_log` VALUES ('327', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:46:59');
INSERT INTO `t_log` VALUES ('328', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:47:11');
INSERT INTO `t_log` VALUES ('329', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:47:13');
INSERT INTO `t_log` VALUES ('330', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:47:13');
INSERT INTO `t_log` VALUES ('331', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:47:13');
INSERT INTO `t_log` VALUES ('332', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:47:18');
INSERT INTO `t_log` VALUES ('333', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:47:49');
INSERT INTO `t_log` VALUES ('334', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:48:07');
INSERT INTO `t_log` VALUES ('335', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:49:29');
INSERT INTO `t_log` VALUES ('336', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:49:35');
INSERT INTO `t_log` VALUES ('337', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:49:49');
INSERT INTO `t_log` VALUES ('338', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:49:53');
INSERT INTO `t_log` VALUES ('339', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:53:07');
INSERT INTO `t_log` VALUES ('340', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:53:08');
INSERT INTO `t_log` VALUES ('341', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:54:16');
INSERT INTO `t_log` VALUES ('342', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:54:49');
INSERT INTO `t_log` VALUES ('343', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:55:10');
INSERT INTO `t_log` VALUES ('344', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:57:33');
INSERT INTO `t_log` VALUES ('345', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:58:03');
INSERT INTO `t_log` VALUES ('346', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:58:19');
INSERT INTO `t_log` VALUES ('347', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:58:27');
INSERT INTO `t_log` VALUES ('348', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:59:02');
INSERT INTO `t_log` VALUES ('349', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 13:59:36');
INSERT INTO `t_log` VALUES ('350', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 14:52:14');
INSERT INTO `t_log` VALUES ('351', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 14:52:32');
INSERT INTO `t_log` VALUES ('352', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 14:52:33');
INSERT INTO `t_log` VALUES ('353', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 14:52:40');
INSERT INTO `t_log` VALUES ('354', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 14:53:18');
INSERT INTO `t_log` VALUES ('355', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 14:57:47');
INSERT INTO `t_log` VALUES ('356', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 14:58:36');
INSERT INTO `t_log` VALUES ('357', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 14:58:39');
INSERT INTO `t_log` VALUES ('358', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 14:59:22');
INSERT INTO `t_log` VALUES ('359', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:00:03');
INSERT INTO `t_log` VALUES ('360', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:00:57');
INSERT INTO `t_log` VALUES ('361', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:08:27');
INSERT INTO `t_log` VALUES ('362', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:08:35');
INSERT INTO `t_log` VALUES ('363', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:13:25');
INSERT INTO `t_log` VALUES ('364', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:14:08');
INSERT INTO `t_log` VALUES ('365', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:14:20');
INSERT INTO `t_log` VALUES ('366', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:17:21');
INSERT INTO `t_log` VALUES ('367', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:18:51');
INSERT INTO `t_log` VALUES ('368', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:19:50');
INSERT INTO `t_log` VALUES ('369', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:20:36');
INSERT INTO `t_log` VALUES ('370', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:20:41');
INSERT INTO `t_log` VALUES ('371', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:20:43');
INSERT INTO `t_log` VALUES ('372', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:22:11');
INSERT INTO `t_log` VALUES ('373', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:33:56');
INSERT INTO `t_log` VALUES ('374', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:34:08');
INSERT INTO `t_log` VALUES ('375', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:34:14');
INSERT INTO `t_log` VALUES ('376', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:34:35');
INSERT INTO `t_log` VALUES ('377', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:35:53');
INSERT INTO `t_log` VALUES ('378', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:36:00');
INSERT INTO `t_log` VALUES ('379', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:36:10');
INSERT INTO `t_log` VALUES ('380', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-12-29 15:48:04');
INSERT INTO `t_log` VALUES ('381', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'phpcms', '127.0.0.1', '2017-12-29 15:48:14');
INSERT INTO `t_log` VALUES ('382', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:49:06');
INSERT INTO `t_log` VALUES ('383', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:51:27');
INSERT INTO `t_log` VALUES ('384', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:51:31');
INSERT INTO `t_log` VALUES ('385', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:51:37');
INSERT INTO `t_log` VALUES ('386', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:51:39');
INSERT INTO `t_log` VALUES ('387', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:52:29');
INSERT INTO `t_log` VALUES ('388', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:53:43');
INSERT INTO `t_log` VALUES ('389', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:55:10');
INSERT INTO `t_log` VALUES ('390', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 15:55:29');
INSERT INTO `t_log` VALUES ('391', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 16:09:26');
INSERT INTO `t_log` VALUES ('392', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 16:10:37');
INSERT INTO `t_log` VALUES ('393', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 16:26:14');
INSERT INTO `t_log` VALUES ('394', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 16:26:23');
INSERT INTO `t_log` VALUES ('395', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 16:38:19');
INSERT INTO `t_log` VALUES ('396', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 16:38:59');
INSERT INTO `t_log` VALUES ('397', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:04:06');
INSERT INTO `t_log` VALUES ('398', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:04:12');
INSERT INTO `t_log` VALUES ('399', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:04:57');
INSERT INTO `t_log` VALUES ('400', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:05:02');
INSERT INTO `t_log` VALUES ('401', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:05:09');
INSERT INTO `t_log` VALUES ('402', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:18:40');
INSERT INTO `t_log` VALUES ('403', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:18:42');
INSERT INTO `t_log` VALUES ('404', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:18:45');
INSERT INTO `t_log` VALUES ('405', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:18:50');
INSERT INTO `t_log` VALUES ('406', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:19:00');
INSERT INTO `t_log` VALUES ('407', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:19:06');
INSERT INTO `t_log` VALUES ('408', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:19:12');
INSERT INTO `t_log` VALUES ('409', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:19:18');
INSERT INTO `t_log` VALUES ('410', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:19:24');
INSERT INTO `t_log` VALUES ('411', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:19:29');
INSERT INTO `t_log` VALUES ('412', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:51:51');
INSERT INTO `t_log` VALUES ('413', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:52:42');
INSERT INTO `t_log` VALUES ('414', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:53:15');
INSERT INTO `t_log` VALUES ('415', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'phpcms', '127.0.0.1', '2017-12-29 17:53:20');

-- ----------------------------
-- Table structure for `t_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES ('1', '1', 'user1', 'f14bb0653bc328939681cef9d0b4e5d0', 'kcazMc', 'dad', '1510670387', '1510670387', '127.0.0.1', '', '0', 'dd@qq.com', '2', '0', '0.00', '0', '10', '0', '0', '0', '0', '1', '', '', '');

-- ----------------------------
-- Table structure for `t_member_bank`
-- ----------------------------
DROP TABLE IF EXISTS `t_member_bank`;
CREATE TABLE `t_member_bank` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `bank` smallint(1) DEFAULT '1' COMMENT '1.支付宝，2微信，3银行卡',
  `bank_num` varchar(255) DEFAULT NULL,
  `bank_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member_bank
-- ----------------------------

-- ----------------------------
-- Table structure for `t_member_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_member_detail`;
CREATE TABLE `t_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member_detail
-- ----------------------------
INSERT INTO `t_member_detail` VALUES ('1', '2017-11-17');

-- ----------------------------
-- Table structure for `t_member_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_member_group`;
CREATE TABLE `t_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member_group
-- ----------------------------
INSERT INTO `t_member_group` VALUES ('8', '游客', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `t_member_group` VALUES ('2', '新手上路', '1', '1', '50', '100', '1', '1', '0', '0', '0', '1', '0', '0', '50.00', '10.00', '1.00', '', '', '', '2', '0');
INSERT INTO `t_member_group` VALUES ('6', '注册会员', '1', '2', '100', '150', '0', '1', '0', '0', '1', '1', '0', '0', '300.00', '30.00', '1.00', '', '', '', '6', '0');
INSERT INTO `t_member_group` VALUES ('4', '中级会员', '1', '3', '150', '500', '1', '1', '0', '1', '1', '1', '0', '0', '500.00', '60.00', '1.00', '', '', '', '4', '0');
INSERT INTO `t_member_group` VALUES ('5', '高级会员', '1', '5', '300', '999', '1', '1', '0', '1', '1', '1', '0', '0', '360.00', '90.00', '5.00', '', '', '', '5', '0');
INSERT INTO `t_member_group` VALUES ('1', '禁止访问', '1', '0', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '0', '0', '0');
INSERT INTO `t_member_group` VALUES ('7', '邮件认证', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', 'images/group/vip.jpg', '#000000', '', '7', '0');

-- ----------------------------
-- Table structure for `t_member_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_member_menu`;
CREATE TABLE `t_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member_menu
-- ----------------------------
INSERT INTO `t_member_menu` VALUES ('1', 'member_init', '0', 'member', 'index', 'init', 't=0', '0', '1', '', '');
INSERT INTO `t_member_menu` VALUES ('2', 'account_manage', '0', 'member', 'index', 'account_manage', 't=1', '0', '1', '', '');
INSERT INTO `t_member_menu` VALUES ('3', 'favorite', '0', 'member', 'index', 'favorite', 't=2', '0', '1', '', '');

-- ----------------------------
-- Table structure for `t_member_money_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_member_money_log`;
CREATE TABLE `t_member_money_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `money` decimal(10,2) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `log_time` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `site_id` int(10) DEFAULT NULL,
  `site_owner_id` int(10) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member_money_log
-- ----------------------------
INSERT INTO `t_member_money_log` VALUES ('1', '121.00', '1', '12131313', '43', '1', '1', 'kime');

-- ----------------------------
-- Table structure for `t_member_tixian`
-- ----------------------------
DROP TABLE IF EXISTS `t_member_tixian`;
CREATE TABLE `t_member_tixian` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `log_time` int(10) DEFAULT NULL,
  `is_deal` tinyint(1) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `deal_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member_tixian
-- ----------------------------

-- ----------------------------
-- Table structure for `t_member_verify`
-- ----------------------------
DROP TABLE IF EXISTS `t_member_verify`;
CREATE TABLE `t_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member_verify
-- ----------------------------

-- ----------------------------
-- Table structure for `t_member_vip`
-- ----------------------------
DROP TABLE IF EXISTS `t_member_vip`;
CREATE TABLE `t_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member_vip
-- ----------------------------

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=1577 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', 'sys_setting', '0', 'admin', 'setting', 'init', '', '1', '1', '0', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('2', 'module', '0', 'admin', 'module', 'init', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('872', 'sync_release_point', '873', 'release', 'index', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('4', 'content', '0', 'content', 'content', 'init', '', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('5', 'members', '0', 'member', 'member', 'init', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('6', 'userinterface', '0', 'template', 'style', 'init', '', '6', '1', '0', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('30', 'correlative_setting', '1', 'admin', 'admin', 'admin', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('31', 'menu_manage', '977', 'admin', 'menu', 'init', '', '8', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('32', 'posid_manage', '975', 'admin', 'position', 'init', '', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('29', 'module_list', '2', 'admin', 'module', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('82', 'module_manage', '2', 'admin', 'module', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('10', 'panel', '0', 'admin', 'index', 'public_main', '', '0', '1', '0', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('35', 'menu_add', '31', 'admin', 'menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('826', 'template_manager', '6', '', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('54', 'admin_manage', '49', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('43', 'category_manage', '975', 'admin', 'category', 'init', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('42', 'add_category', '43', 'admin', 'category', 'add', 's=0', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('44', 'edit_category', '43', 'admin', 'category', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('45', 'badword_manage', '977', 'admin', 'badword', 'init', '', '10', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('46', 'posid_add', '32', 'admin', 'position', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('49', 'admin_setting', '1', 'admin', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('50', 'role_manage', '49', 'admin', 'role', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('51', 'role_add', '50', 'admin', 'role', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('52', 'category_cache', '43', 'admin', 'category', 'public_cache', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('55', 'manage_member', '5', 'member', 'member', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('58', 'admin_add', '54', 'admin', 'admin_manage', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('59', 'model_manage', '975', 'content', 'sitemodel', 'init', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('64', 'site_management', '30', 'admin', 'site', 'init', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('81', 'member_add', '72', 'member', 'member', 'add', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('62', 'add_model', '59', 'content', 'sitemodel', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('65', 'release_point_management', '30', 'admin', 'release_point', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('66', 'badword_export', '45', 'admin', 'badword', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('67', 'add_site', '64', 'admin', 'site', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('68', 'badword_import', '45', 'admin', 'badword', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('812', 'member_group_manage', '76', 'member', 'member_group', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('74', 'member_verify', '55', 'member', 'member_verify', 'manage', 's=0', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('76', 'manage_member_group', '5', 'member', 'member_group', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('77', 'manage_member_model', '5', 'member', 'member_model', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('78', 'member_group_add', '812', 'member', 'member_group', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('79', 'member_model_add', '813', 'member', 'member_model', 'add', '', '1', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('80', 'member_model_import', '77', 'member', 'member_model', 'import', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('72', 'member_manage', '55', 'member', 'member', 'manage', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('813', 'member_model_manage', '77', 'member', 'member_model', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('814', 'site_edit', '64', 'admin', 'site', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('815', 'site_del', '64', 'admin', 'site', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('816', 'release_point_add', '65', 'admin', 'release_point', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('817', 'release_point_del', '65', 'admin', 'release_point', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('818', 'release_point_edit', '65', 'admin', 'release_point', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('821', 'content_publish', '4', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('822', 'content_manage', '821', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('867', 'linkage', '977', 'admin', 'linkage', 'init', '', '13', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('827', 'template_style', '826', 'template', 'style', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('828', 'import_style', '827', 'template', 'style', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('831', 'template_export', '827', 'template', 'style', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('830', 'template_file', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('832', 'template_onoff', '827', 'template', 'style', 'disable', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('833', 'template_updatename', '827', 'template', 'style', 'updatename', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('834', 'member_lock', '72', 'member', 'member', 'lock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('835', 'member_unlock', '72', 'member', 'member', 'unlock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('836', 'member_move', '72', 'member', 'member', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('837', 'member_delete', '72', 'member', 'member', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('842', 'verify_ignore', '74', 'member', 'member_verify', 'manage', 's=2', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('839', 'member_setting', '55', 'member', 'member_setting', 'manage', '', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('841', 'verify_pass', '74', 'member', 'member_verify', 'manage', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('843', 'verify_delete', '74', 'member', 'member_verify', 'manage', 's=3', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('844', 'verify_deny', '74', 'member', 'member_verify', 'manage', 's=4', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('845', 'never_pass', '74', 'member', 'member_verify', 'manage', 's=5', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('846', 'template_file_list', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('847', 'template_file_edit', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('848', 'file_add_file', '827', 'template', 'file', 'add_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('850', 'listorder', '76', 'member', 'member_group', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('852', 'priv_setting', '50', 'admin', 'role', 'priv_setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('853', 'role_priv', '50', 'admin', 'role', 'role_priv', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('857', 'attachment_manage', '821', 'attachment', 'manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('868', 'special', '821', 'special', 'special', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('869', 'template_editor', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('870', 'template_visualization', '827', 'template', 'file', 'visualization', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('871', 'pc_tag_edit', '827', 'template', 'file', 'edit_pc_tag', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('873', 'release_manage', '4', 'release', 'html', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('874', 'type_manage', '975', 'content', 'type_manage', 'init', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('875', 'add_type', '874', 'content', 'type_manage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('876', 'linkageadd', '867', 'admin', 'linkage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('877', 'failure_list', '872', 'release', 'index', 'failed', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('879', 'member_search', '72', 'member', 'member', 'search', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('880', 'queue_del', '872', 'release', 'index', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('881', 'member_model_delete', '813', 'member', 'member_model', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('882', 'member_model_edit', '813', 'member', 'member_model', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('885', 'workflow', '977', 'content', 'workflow', 'init', '', '15', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('888', 'add_workflow', '885', 'content', 'workflow', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('889', 'member_modelfield_add', '813', 'member', 'member_modelfield', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('890', 'member_modelfield_edit', '813', 'member', 'member_modelfield', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('891', 'member_modelfield_delete', '813', 'member', 'member_modelfield', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('892', 'member_modelfield_manage', '813', 'member', 'member_modelfield', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('895', 'sitemodel_import', '59', 'content', 'sitemodel', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('896', 'pay', '29', 'pay', 'payment', 'pay_list', 's=3', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('897', 'payments', '896', 'pay', 'payment', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('898', 'paylist', '896', 'pay', 'payment', 'pay_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('899', 'add_content', '822', 'content', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('900', 'modify_deposit', '896', 'pay', 'payment', 'modify_deposit', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('901', 'check_content', '822', 'content', 'content', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('902', 'dbsource', '29', 'dbsource', 'data', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('905', 'create_content_html', '873', 'content', 'create_html', 'show', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('904', 'external_data_sources', '902', 'dbsource', 'dbsource_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('906', 'update_urls', '873', 'content', 'create_html', 'update_urls', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('960', 'node_add', '957', 'collection', 'node', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('909', 'fulltext_search', '29', 'search', 'search_type', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('910', 'manage_type', '909', 'search', 'search_type', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('911', 'search_setting', '909', 'search', 'search_admin', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('912', 'createindex', '909', 'search', 'search_admin', 'createindex', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('913', 'add_search_type', '909', 'search', 'search_type', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('914', 'database_toos', '977', 'admin', 'database', 'export', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('915', 'database_export', '914', 'admin', 'database', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('916', 'database_import', '914', 'admin', 'database', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('917', 'dbsource_add', '902', 'dbsource', 'dbsource_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('918', 'dbsource_edit', '902', 'dbsource', 'dbsource_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('919', 'dbsource_del', '902', 'dbsource', 'dbsource_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('920', 'dbsource_data_add', '902', 'dbsource', 'data', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('921', 'dbsource_data_edit', '902', 'dbsource', 'data', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('922', 'dbsource_data_del', '902', 'dbsource', 'data', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('926', 'add_special', '868', 'special', 'special', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('927', 'edit_special', '868', 'special', 'special', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('928', 'special_list', '868', 'special', 'special', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('929', 'special_elite', '868', 'special', 'special', 'elite', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('930', 'delete_special', '868', 'special', 'special', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('931', 'badword_add', '45', 'admin', 'badword', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('932', 'badword_edit', '45', 'admin', 'badword', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('933', 'badword_delete', '45', 'admin', 'badword', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('934', 'special_listorder', '868', 'special', 'special', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('935', 'special_content_list', '868', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('936', 'special_content_add', '935', 'special', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('937', 'special_content_list', '935', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('938', 'special_content_edit', '935', 'special', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('939', 'special_content_delete', '935', 'special', 'content', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('940', 'special_content_listorder', '935', 'special', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('941', 'special_content_import', '935', 'special', 'special', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('942', 'history_version', '827', 'template', 'template_bak', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('943', 'restore_version', '827', 'template', 'template_bak', 'restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('944', 'del_history_version', '827', 'template', 'template_bak', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('945', 'block', '821', 'block', 'block_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('946', 'block_add', '945', 'block', 'block_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('950', 'block_edit', '945', 'block', 'block_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('951', 'block_del', '945', 'block', 'block_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('952', 'block_update', '945', 'block', 'block_admin', 'block_update', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('953', 'block_restore', '945', 'block', 'block_admin', 'history_restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('954', 'history_del', '945', 'block', 'block_admin', 'history_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('978', 'urlrule_manage', '977', 'admin', 'urlrule', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('957', 'collection_node', '821', 'collection', 'node', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('979', 'safe_config', '30', 'admin', 'setting', 'init', '&tab=2', '11', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('959', 'basic_config', '30', 'admin', 'setting', 'init', '', '10', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('961', 'position_edit', '32', 'admin', 'position', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('962', 'collection_node_edit', '957', 'collection', 'node', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('963', 'collection_node_delete', '957', 'collection', 'node', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('990', 'col_url_list', '957', 'collection', 'node', 'col_url_list', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('965', 'collection_node_publish', '957', 'collection', 'node', 'publist', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('966', 'collection_node_import', '957', 'collection', 'node', 'node_import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('967', 'collection_node_export', '957', 'collection', 'node', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('968', 'collection_node_collection_content', '957', 'collection', 'node', 'col_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('969', 'googlesitemap', '977', 'admin', 'googlesitemap', 'set', '', '11', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('970', 'admininfo', '10', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('971', 'editpwd', '970', 'admin', 'admin_manage', 'public_edit_pwd', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('972', 'editinfo', '970', 'admin', 'admin_manage', 'public_edit_info', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('973', 'keylink', '977', 'admin', 'keylink', 'init', '', '12', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('974', 'add_keylink', '973', 'admin', 'keylink', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('975', 'content_settings', '4', 'content', 'content_settings', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('7', 'extend', '0', 'admin', 'extend', 'init_extend', '', '7', '1', '0', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('977', 'extend_all', '7', 'admin', 'extend_all', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('980', 'sso_config', '30', 'admin', 'setting', 'init', '&tab=3', '12', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('981', 'email_config', '30', 'admin', 'setting', 'init', '&tab=4', '13', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('982', 'module_manage', '82', 'admin', 'module', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('983', 'ipbanned', '977', 'admin', 'ipbanned', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('984', 'add_ipbanned', '983', 'admin', 'ipbanned', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('993', 'collection_content_import', '957', 'collection', 'node', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('991', 'copy_node', '957', 'collection', 'node', 'copy', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('992', 'content_del', '957', 'collection', 'node', 'content_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('989', 'downsites', '977', 'admin', 'downservers', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('994', 'import_program_add', '957', 'collection', 'node', 'import_program_add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('995', 'import_program_del', '957', 'collection', 'node', 'import_program_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('996', 'import_content', '957', 'collection', 'node', 'import_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('997', 'log', '977', 'admin', 'log', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('998', 'add_page', '43', 'admin', 'category', 'add', 's=1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('999', 'add_cat_link', '43', 'admin', 'category', 'add', 's=2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1000', 'count_items', '43', 'admin', 'category', 'count_items', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1001', 'cache_all', '977', 'admin', 'cache_all', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1002', 'create_list_html', '873', 'content', 'create_html', 'category', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1003', 'create_html_quick', '10', 'content', 'create_html_opt', 'index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1004', 'create_index', '1003', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1005', 'scan', '977', 'scan', 'index', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1006', 'scan_report', '1005', 'scan', 'index', 'scan_report', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1007', 'md5_creat', '1005', 'scan', 'index', 'md5_creat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1008', 'album_import', '868', 'special', 'album', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('8', 'phpsso', '0', 'admin', 'phpsso', 'menu', '', '7', '1', '0', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1011', 'edit_content', '822', 'content', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1012', 'push_to_special', '822', 'content', 'push', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1023', 'delete_log', '997', 'admin', 'log', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1024', 'delete_ip', '983', 'admin', 'ipbanned', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1026', 'delete_keylink', '973', 'admin', 'keylink', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1027', 'edit_keylink', '973', 'admin', 'keylink', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1034', 'operation_pass', '74', 'member', 'member_verify', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1035', 'operation_delete', '74', 'member', 'member_verify', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1039', 'operation_ignore', '74', 'member', 'member_verify', 'ignore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1038', 'settingsave', '30', 'admin', 'setting', 'save', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1040', 'admin_edit', '54', 'admin', 'admin_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1041', 'operation_reject', '74', 'member', 'member_verify', 'reject', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1042', 'admin_delete', '54', 'admin', 'admin_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1043', 'card', '54', 'admin', 'admin_manage', 'card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1044', 'creat_card', '54', 'admin', 'admin_manage', 'creat_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1045', 'remove_card', '54', 'admin', 'admin_manage', 'remove_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1049', 'member_group_edit', '812', 'member', 'member_group', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1048', 'member_edit', '72', 'member', 'member', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1050', 'role_edit', '50', 'admin', 'role', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1051', 'member_group_delete', '812', 'member', 'member_group', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1052', 'member_manage', '50', 'admin', 'role', 'member_manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1053', 'role_delete', '50', 'admin', 'role', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1054', 'member_model_export', '77', 'member', 'member_model', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1055', 'member_model_sort', '77', 'member', 'member_model', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1056', 'member_model_move', '77', 'member', 'member_model', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1057', 'payment_add', '897', 'pay', 'payment', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1058', 'payment_delete', '897', 'pay', 'payment', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1059', 'payment_edit', '897', 'pay', 'payment', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1060', 'spend_record', '896', 'pay', 'spend', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1061', 'pay_stat', '896', 'pay', 'payment', 'pay_stat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1062', 'fields_manage', '59', 'content', 'sitemodel_field', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1063', 'edit_model_content', '59', 'content', 'sitemodel', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1064', 'disabled_model', '59', 'content', 'sitemodel', 'disabled', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1065', 'delete_model', '59', 'content', 'sitemodel', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1066', 'export_model', '59', 'content', 'sitemodel', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1067', 'delete', '874', 'content', 'type_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1068', 'edit', '874', 'content', 'type_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1069', 'add_urlrule', '978', 'admin', 'urlrule', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1070', 'edit_urlrule', '978', 'admin', 'urlrule', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1071', 'delete_urlrule', '978', 'admin', 'urlrule', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1072', 'edit_menu', '31', 'admin', 'menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1073', 'delete_menu', '31', 'admin', 'menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1074', 'edit_workflow', '885', 'content', 'workflow', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1075', 'delete_workflow', '885', 'content', 'workflow', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1076', 'creat_html', '868', 'special', 'special', 'html', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1093', 'connect_config', '30', 'admin', 'setting', 'init', '&tab=5', '14', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1102', 'view_modelinfo', '74', 'member', 'member_verify', 'modelinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1202', 'create_special_list', '868', 'special', 'special', 'create_special_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1240', 'view_memberlinfo', '72', 'member', 'member', 'memberinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1239', 'copyfrom_manage', '977', 'admin', 'copyfrom', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1241', 'move_content', '822', 'content', 'content', 'remove', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1242', 'poster_template', '56', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1243', 'create_index', '873', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1244', 'add_othors', '822', 'content', 'content', 'add_othors', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1295', 'attachment_manager_dir', '857', 'attachment', 'manage', 'dir', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1296', 'attachment_manager_db', '857', 'attachment', 'manage', 'init', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1346', 'attachment_address_replace', '857', 'attachment', 'address', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1347', 'attachment_address_update', '857', 'attachment', 'address', 'update', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1348', 'delete_content', '822', 'content', 'content', 'delete', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1349', 'member_menu_manage', '977', 'member', 'member_menu', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1350', 'member_menu_add', '1349', 'member', 'member_menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1351', 'member_menu_edit', '1349', 'member', 'member_menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1352', 'member_menu_delete', '1349', 'member', 'member_menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1353', 'batch_show', '822', 'content', 'create_html', 'batch_show', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1354', 'pay_delete', '898', 'pay', 'payment', 'pay_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1355', 'pay_cancel', '898', 'pay', 'payment', 'pay_cancel', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1356', 'discount', '898', 'pay', 'payment', 'discount', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1360', 'category_batch_edit', '43', 'admin', 'category', 'batch_edit', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1500', 'listorder', '822', 'content', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1501', 'a_clean_data', '873', 'content', 'content', 'clear_data', '', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `t_menu` VALUES ('1502', 'announce', '29', 'announce', 'admin_announce', 'init', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1503', 'announce_add', '1502', 'announce', 'admin_announce', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1504', 'edit_announce', '1502', 'announce', 'admin_announce', 'edit', 's=1', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1505', 'check_announce', '1502', 'announce', 'admin_announce', 'init', 's=2', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1506', 'overdue', '1502', 'announce', 'admin_announce', 'init', 's=3', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1507', 'del_announce', '1502', 'announce', 'admin_announce', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1508', 'comment', '29', 'comment', 'comment_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1509', 'comment_manage', '821', 'comment', 'comment_admin', 'listinfo', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1510', 'comment_check', '1509', 'comment', 'check', 'checks', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1511', 'comment_list', '1508', 'comment', 'comment_admin', 'lists', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1512', 'link', '29', 'link', 'link', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1513', 'add_link', '1512', 'link', 'link', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1514', 'edit_link', '1512', 'link', 'link', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1515', 'delete_link', '1512', 'link', 'link', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1516', 'link_setting', '1512', 'link', 'link', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1517', 'add_type', '1512', 'link', 'link', 'add_type', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1518', 'list_type', '1512', 'link', 'link', 'list_type', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1519', 'check_register', '1512', 'link', 'link', 'check_register', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1520', 'vote', '29', 'vote', 'vote', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1521', 'add_vote', '1520', 'vote', 'vote', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1522', 'edit_vote', '1520', 'vote', 'vote', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1523', 'delete_vote', '1520', 'vote', 'vote', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1524', 'vote_setting', '1520', 'vote', 'vote', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1525', 'statistics_vote', '1520', 'vote', 'vote', 'statistics', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1526', 'statistics_userlist', '1520', 'vote', 'vote', 'statistics_userlist', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1527', 'create_js', '1520', 'vote', 'vote', 'create_js', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1528', 'message', '29', 'message', 'message', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1529', 'send_one', '1528', 'message', 'message', 'send_one', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1530', 'delete_message', '1528', 'message', 'message', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1531', 'message_send', '1528', 'message', 'message', 'message_send', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1532', 'message_group_manage', '1528', 'message', 'message', 'message_group_manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1533', 'mood', '29', 'mood', 'mood_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1534', 'mood_setting', '1533', 'mood', 'mood_admin', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1535', 'poster', '29', 'poster', 'space', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1536', 'add_space', '1535', 'poster', 'space', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1537', 'edit_space', '1535', 'poster', 'space', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1538', 'del_space', '1535', 'poster', 'space', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1539', 'poster_list', '1535', 'poster', 'poster', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1540', 'add_poster', '1535', 'poster', 'poster', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1541', 'edit_poster', '1535', 'poster', 'poster', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1542', 'del_poster', '1535', 'poster', 'poster', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1543', 'poster_stat', '1535', 'poster', 'poster', 'stat', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1544', 'poster_setting', '1535', 'poster', 'space', 'setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1545', 'create_poster_js', '1535', 'poster', 'space', 'create_js', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1546', 'poster_template', '1535', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1547', 'formguide', '29', 'formguide', 'formguide', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1548', 'formguide_add', '1547', 'formguide', 'formguide', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1549', 'formguide_edit', '1547', 'formguide', 'formguide', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1550', 'form_info_list', '1547', 'formguide', 'formguide_info', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1551', 'formguide_disabled', '1547', 'formguide', 'formguide', 'disabled', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1552', 'formguide_delete', '1547', 'formguide', 'formguide', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1553', 'formguide_stat', '1547', 'formguide', 'formguide', 'stat', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1554', 'add_public_field', '1547', 'formguide', 'formguide_field', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1555', 'list_public_field', '1547', 'formguide', 'formguide_field', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1556', 'module_setting', '1547', 'formguide', 'formguide', 'setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1557', 'wap', '29', 'wap', 'wap_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1558', 'wap_add', '1557', 'wap', 'wap_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1559', 'wap_edit', '1557', 'wap', 'wap_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1560', 'wap_delete', '1557', 'wap', 'wap_admin', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1561', 'wap_type_manage', '1557', 'wap', 'wap_admin', 'type_manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1562', 'wap_type_edit', '1557', 'wap', 'wap_admin', 'type_edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1563', 'wap_type_delete', '1557', 'wap', 'wap_admin', 'type_delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1564', 'upgrade', '977', 'upgrade', 'index', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1565', 'checkfile', '1564', 'upgrade', 'index', 'checkfile', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1566', 'tag', '826', 'tag', 'tag', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1567', 'add_tag', '1566', 'tag', 'tag', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1568', 'edit_tag', '1566', 'tag', 'tag', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1569', 'delete_tag', '1566', 'tag', 'tag', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1570', 'tag_lists', '1566', 'tag', 'tag', 'lists', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1571', 'sms', '29', 'sms', 'sms', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1572', 'sms_setting', '1571', 'sms', 'sms', 'sms_setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1573', 'sms_pay_history', '1571', 'sms', 'sms', 'sms_pay_history', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1574', 'sms_buy_history', '1571', 'sms', 'sms', 'sms_buy_history', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1575', 'sms_api', '1571', 'sms', 'sms', 'sms_api', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('1576', 'sms_sent', '1571', 'sms', 'sms', 'sms_sent', '', '0', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_from_id` char(30) NOT NULL DEFAULT '0',
  `send_to_id` char(30) NOT NULL DEFAULT '0',
  `folder` enum('all','inbox','outbox') NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_time` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  `del_type` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`messageid`),
  KEY `msgtoid` (`send_to_id`,`folder`),
  KEY `replyid` (`replyid`),
  KEY `folder` (`send_from_id`,`folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for `t_message_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_message_data`;
CREATE TABLE `t_message_data` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) NOT NULL,
  `group_message_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message` (`userid`,`group_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message_data
-- ----------------------------

-- ----------------------------
-- Table structure for `t_message_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_message_group`;
CREATE TABLE `t_message_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL COMMENT '内容',
  `inputtime` int(10) unsigned DEFAULT '0',
  `status` tinyint(2) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message_group
-- ----------------------------

-- ----------------------------
-- Table structure for `t_model`
-- ----------------------------
DROP TABLE IF EXISTS `t_model`;
CREATE TABLE `t_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_model
-- ----------------------------
INSERT INTO `t_model` VALUES ('1', '1', '文章模型', '', 'news', '', '0', '0', '1', '0', 'default', 'category', 'list', 'show', '', '', '', '', '0', '0');
INSERT INTO `t_model` VALUES ('2', '1', '下载模型', '', 'download', '', '0', '0', '1', '0', 'default', 'category_download', 'list_download', 'show_download', '', '', '', '', '0', '0');
INSERT INTO `t_model` VALUES ('3', '1', '图片模型', '', 'picture', '', '0', '0', '1', '0', 'default', 'category_picture', 'list_picture', 'show_picture', '', '', '', '', '0', '0');
INSERT INTO `t_model` VALUES ('10', '1', '普通会员', '普通会员', 'member_detail', '', '0', '0', '1', '0', '', '', '', '', '', '', '', '', '0', '2');
INSERT INTO `t_model` VALUES ('11', '1', '视频模型', '', 'video', '', '0', '0', '1', '0', 'default', 'category_video', 'list_video', 'show_video', '', '', '', '', '0', '0');

-- ----------------------------
-- Table structure for `t_model_field`
-- ----------------------------
DROP TABLE IF EXISTS `t_model_field`;
CREATE TABLE `t_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_model_field
-- ----------------------------
INSERT INTO `t_model_field` VALUES ('1', '1', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `t_model_field` VALUES ('2', '1', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `t_model_field` VALUES ('3', '1', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `t_model_field` VALUES ('4', '1', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `t_model_field` VALUES ('5', '1', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `t_model_field` VALUES ('6', '1', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `t_model_field` VALUES ('7', '1', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `t_model_field` VALUES ('8', '1', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `t_model_field` VALUES ('9', '1', '1', 'voteid', '添加投票', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '1', '0', '21', '0', '0');
INSERT INTO `t_model_field` VALUES ('10', '1', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `t_model_field` VALUES ('11', '1', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `t_model_field` VALUES ('12', '1', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `t_model_field` VALUES ('13', '1', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `t_model_field` VALUES ('14', '1', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `t_model_field` VALUES ('15', '1', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `t_model_field` VALUES ('16', '1', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `t_model_field` VALUES ('17', '1', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `t_model_field` VALUES ('18', '1', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `t_model_field` VALUES ('19', '1', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `t_model_field` VALUES ('20', '1', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `t_model_field` VALUES ('21', '1', '1', 'copyfrom', '来源', '', '', '0', '100', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `t_model_field` VALUES ('80', '1', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `t_model_field` VALUES ('22', '2', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `t_model_field` VALUES ('23', '2', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `t_model_field` VALUES ('24', '2', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `t_model_field` VALUES ('25', '2', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `t_model_field` VALUES ('26', '2', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `t_model_field` VALUES ('27', '2', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `t_model_field` VALUES ('28', '2', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `t_model_field` VALUES ('29', '2', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `t_model_field` VALUES ('30', '2', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `t_model_field` VALUES ('31', '2', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `t_model_field` VALUES ('32', '2', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `t_model_field` VALUES ('33', '2', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `t_model_field` VALUES ('34', '2', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `t_model_field` VALUES ('35', '2', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `t_model_field` VALUES ('36', '2', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `t_model_field` VALUES ('37', '2', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `t_model_field` VALUES ('38', '2', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `t_model_field` VALUES ('39', '2', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `t_model_field` VALUES ('40', '2', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `t_model_field` VALUES ('41', '2', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `t_model_field` VALUES ('42', '2', '1', 'downfiles', '本地下载', '', '', '0', '0', '', '', 'downfiles', 'array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `t_model_field` VALUES ('43', '2', '1', 'downfile', '镜像下载', '', '', '0', '0', '', '', 'downfile', 'array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `t_model_field` VALUES ('44', '2', '1', 'systems', '软件平台', '<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>', '', '0', '100', '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `t_model_field` VALUES ('45', '2', '1', 'copytype', '软件授权形式', '', '', '0', '15', '', '', 'box', 'array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '12', '0', '0');
INSERT INTO `t_model_field` VALUES ('46', '2', '1', 'language', '软件语言', '', '', '0', '16', '', '', 'box', 'array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '13', '0', '0');
INSERT INTO `t_model_field` VALUES ('47', '2', '1', 'classtype', '软件类型', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `t_model_field` VALUES ('48', '2', '1', 'version', '版本号', '', '', '0', '20', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `t_model_field` VALUES ('49', '2', '1', 'filesize', '文件大小', '', '', '0', '10', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `t_model_field` VALUES ('50', '2', '1', 'stars', '评分等级', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `t_model_field` VALUES ('51', '3', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `t_model_field` VALUES ('52', '3', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `t_model_field` VALUES ('53', '3', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `t_model_field` VALUES ('54', '3', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `t_model_field` VALUES ('55', '3', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `t_model_field` VALUES ('56', '3', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `t_model_field` VALUES ('57', '3', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `t_model_field` VALUES ('58', '3', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `t_model_field` VALUES ('59', '3', '1', 'relation', '相关组图', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `t_model_field` VALUES ('60', '3', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `t_model_field` VALUES ('61', '3', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '0', '999999', '', '', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `t_model_field` VALUES ('62', '3', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `t_model_field` VALUES ('63', '3', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `t_model_field` VALUES ('64', '3', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `t_model_field` VALUES ('65', '3', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `t_model_field` VALUES ('66', '3', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `t_model_field` VALUES ('67', '3', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `t_model_field` VALUES ('68', '3', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `t_model_field` VALUES ('69', '3', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `t_model_field` VALUES ('70', '3', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `t_model_field` VALUES ('71', '3', '1', 'pictureurls', '组图', '', '', '0', '0', '', '', 'images', 'array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '15', '0', '0');
INSERT INTO `t_model_field` VALUES ('72', '3', '1', 'copyfrom', '来源', '', '', '0', '0', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `t_model_field` VALUES ('73', '1', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `t_model_field` VALUES ('74', '2', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `t_model_field` VALUES ('75', '3', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `t_model_field` VALUES ('83', '10', '1', 'birthday', '生日', '', '', '0', '0', '', '生日格式错误', 'datetime', 'array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0');
INSERT INTO `t_model_field` VALUES ('84', '11', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `t_model_field` VALUES ('85', '11', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `t_model_field` VALUES ('86', '11', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', 'array (\n)', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `t_model_field` VALUES ('87', '11', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `t_model_field` VALUES ('88', '11', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `t_model_field` VALUES ('89', '11', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `t_model_field` VALUES ('90', '11', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '0', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `t_model_field` VALUES ('91', '11', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `t_model_field` VALUES ('92', '11', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `t_model_field` VALUES ('93', '11', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', 'array (\n)', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `t_model_field` VALUES ('94', '11', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `t_model_field` VALUES ('95', '11', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `t_model_field` VALUES ('96', '11', '1', 'groupids_view', '阅读权限', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `t_model_field` VALUES ('97', '11', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `t_model_field` VALUES ('98', '11', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `t_model_field` VALUES ('99', '11', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `t_model_field` VALUES ('100', '11', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `t_model_field` VALUES ('101', '11', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `t_model_field` VALUES ('102', '11', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `t_model_field` VALUES ('103', '11', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `t_model_field` VALUES ('104', '11', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', 'array (\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '0', '0');
INSERT INTO `t_model_field` VALUES ('105', '11', '1', 'video', '视频上传', '', '', '0', '0', '', '', 'video', 'array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `t_model_field` VALUES ('106', '11', '1', 'vision', '画质', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'高清|1\r\n普通|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `t_model_field` VALUES ('107', '11', '1', 'video_category', '视频分类', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `t_model_field` VALUES ('108', '11', '1', 'video_url', '在线视频地址', '', '', '0', '0', '', '', 'text', '{\"size\":\"50\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `t_module`
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_module
-- ----------------------------
INSERT INTO `t_module` VALUES ('admin', 'admin', '', '1', '1.0', '', '{\"admin_email\":\"phpcms@phpcms.cn\",\"maxloginfailedtimes\":\"8\",\"minrefreshtime\":\"2\",\"mail_type\":\"1\",\"mail_server\":\"smtp.qq.com\",\"mail_port\":\"25\",\"category_ajax\":\"0\",\"mail_user\":\"phpcms.cn@foxmail.com\",\"mail_auth\":\"1\",\"mail_from\":\"phpcms.cn@foxmail.com\",\"mail_password\":\"\",\"errorlog_size\":\"20\"}', '0', '0', '2010-10-18', '2010-10-18');
INSERT INTO `t_module` VALUES ('member', '会员', '', '1', '1.0', '', 'array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `t_module` VALUES ('pay', '支付', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `t_module` VALUES ('digg', '顶一下', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `t_module` VALUES ('special', '专题', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `t_module` VALUES ('content', '内容模块', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `t_module` VALUES ('search', '全站搜索', '', '0', '1.0', '', 'array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `t_module` VALUES ('scan', '木马扫描', 'scan', '0', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `t_module` VALUES ('attachment', '附件', 'attachment', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `t_module` VALUES ('block', '碎片', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `t_module` VALUES ('collection', '采集模块', 'collection', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `t_module` VALUES ('dbsource', '数据源', '', '1', '', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `t_module` VALUES ('template', '模板风格', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `t_module` VALUES ('release', '发布点', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `t_module` VALUES ('video', '视频库', '', '0', '1.0', '', '', '0', '0', '2012-09-28', '2012-09-28');
INSERT INTO `t_module` VALUES ('announce', '公告', 'announce/', '0', '1.0', '公告', '', '0', '0', '2017-10-06', '2017-10-06');
INSERT INTO `t_module` VALUES ('comment', '评论', 'comment/', '0', '1.0', '评论', '', '0', '0', '2017-10-06', '2017-10-06');
INSERT INTO `t_module` VALUES ('link', '友情链接', '', '0', '1.0', '', 'array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `t_module` VALUES ('vote', '投票', '', '0', '1.0', '', 'array (\r\n  1 => \r\n  array (\r\n    \'default_style\' => \'default\',\r\n    \'vote_tp_template\' => \'vote_tp\',\r\n    \'allowguest\' => \'1\',\r\n    \'enabled\' => \'1\',\r\n    \'interval\' => \'1\',\r\n    \'credit\' => \'1\',\r\n  ),\r\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `t_module` VALUES ('message', '短消息', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `t_module` VALUES ('mood', '新闻心情', 'mood/', '0', '1.0', '新闻心情', '', '0', '0', '2017-10-06', '2017-10-06');
INSERT INTO `t_module` VALUES ('poster', '广告模块', 'poster/', '0', '1.0', '广告模块', '', '0', '0', '2017-10-06', '2017-10-06');
INSERT INTO `t_module` VALUES ('formguide', '表单向导', 'formguide/', '0', '1.0', 'formguide', 'array (\n  \'allowmultisubmit\' => \'1\',\n  \'interval\' => \'30\',\n  \'allowunreg\' => \'0\',\n  \'mailmessage\' => \'用户向我们提交了表单数据，赶快去看看吧。\',\n)', '0', '0', '2010-10-20', '2010-10-20');
INSERT INTO `t_module` VALUES ('wap', '手机门户', 'wap/', '0', '1.0', '手机门户', '', '0', '0', '2017-10-06', '2017-10-06');
INSERT INTO `t_module` VALUES ('upgrade', '在线升级', '', '0', '1.0', '', '', '0', '0', '2011-05-18', '2011-05-18');
INSERT INTO `t_module` VALUES ('tag', '标签向导', 'tag/', '0', '1.0', '标签向导', '', '0', '0', '2017-10-06', '2017-10-06');
INSERT INTO `t_module` VALUES ('sms', '短信平台', 'sms/', '0', '1.0', '短信平台', '', '0', '0', '2011-09-02', '2011-09-02');

-- ----------------------------
-- Table structure for `t_mood`
-- ----------------------------
DROP TABLE IF EXISTS `t_mood`;
CREATE TABLE `t_mood` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `siteid` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `contentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总数',
  `n1` int(10) unsigned NOT NULL DEFAULT '0',
  `n2` int(10) unsigned NOT NULL DEFAULT '0',
  `n3` int(10) unsigned NOT NULL DEFAULT '0',
  `n4` int(10) unsigned NOT NULL DEFAULT '0',
  `n5` int(10) unsigned NOT NULL DEFAULT '0',
  `n6` int(10) unsigned NOT NULL DEFAULT '0',
  `n7` int(10) unsigned NOT NULL DEFAULT '0',
  `n8` int(10) unsigned NOT NULL DEFAULT '0',
  `n9` int(10) unsigned NOT NULL DEFAULT '0',
  `n10` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `total` (`total`),
  KEY `lastupdate` (`lastupdate`),
  KEY `catid` (`catid`,`siteid`,`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mood
-- ----------------------------

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', '6', '0', '国内新闻', '', '', '新闻', '小树大', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=6&id=1', '0', '99', '1', '0', 'phpcms', '1507301158', '1507301204');
INSERT INTO `t_news` VALUES ('2', '9', '0', '少妇白洁', '', '', '少妇白洁', '少妇白洁', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=9&id=2', '0', '99', '1', '0', 'phpcms', '1507301825', '1507301908');
INSERT INTO `t_news` VALUES ('3', '9', '0', '少妇白洁', '', '', '白洁 少妇', '少妇白洁', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=9&id=3', '0', '99', '1', '0', 'phpcms', '1507301913', '1507301926');
INSERT INTO `t_news` VALUES ('4', '10', '0', '乱伦文学', '', '', '文学', '乱伦文学', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=10&id=4', '0', '99', '1', '0', 'phpcms', '1507301938', '1507301953');
INSERT INTO `t_news` VALUES ('5', '10', '0', '测试下哦', '', 'http://www.test.com/uploadfile/2017/1006/20171006111854939.jpg', '测试下哦', 'daddy', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=10&id=5', '0', '99', '1', '0', 'phpcms', '1507556327', '1507556382');
INSERT INTO `t_news` VALUES ('6', '29', '0', '如何免费创建一个色情网站', '', '', '如何免费创建一个色情网站', '如何免费创建一个色情网站，首先注册小白兔官网，登陆，选择自己喜爱的模板', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=29&id=6', '0', '99', '1', '0', 'phpcms', '1514524754', '1514524838');
INSERT INTO `t_news` VALUES ('7', '29', '0', '网站域名被国内封锁了，如何修改域名？', '', '', '域名 网站', '首先进入个人中心，选择自己的网站，然后再进行修改。', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=29&id=7', '0', '99', '1', '0', 'phpcms', '1514524841', '1514524946');
INSERT INTO `t_news` VALUES ('8', '29', '0', '如何申请提现', '', '', '如何申请提现', '申请提现的前提是，该用户的收入必须满100元，然后再个人中心绑定银行卡，然后再申请中心填写', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=29&id=8', '0', '99', '1', '0', 'phpcms', '1514524949', '1514525062');
INSERT INTO `t_news` VALUES ('9', '29', '0', '如何进行上传自己的视频和图片', '', '', '上传 视频和图片', '如何进行上传自己的视频和图片', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=29&id=9', '0', '99', '1', '0', 'phpcms', '1514525066', '1514525135');
INSERT INTO `t_news` VALUES ('10', '29', '0', '如何导入系统的图片和视频', '', '', '系统 图片 视频', '如何导入系统的图片和视频，首先在系统视频和图片库内选择自己想要导入的视频和图片，选中之后，然后点击导入，就成为了自己的视频和图片', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=29&id=10', '0', '99', '1', '0', 'phpcms', '1514525137', '1514525210');
INSERT INTO `t_news` VALUES ('11', '29', '0', '网站不能正常访问了怎么办', '', '', '网站不能正常访问了怎么办', '如果网站不能正常访问了，请先确定该网站是否已经被国内封掉，如果被封掉的话，就重新申请域名，把新的域名绑定到给定的cname 上，然后修改域名', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=29&id=11', '0', '99', '1', '0', 'phpcms', '1514525838', '1514526089');
INSERT INTO `t_news` VALUES ('12', '30', '0', '如何在QQ群中推广自己网站', '', '', '如何在QQ群中推广该网站', '时下最流行的也是效果最好的网站推广方法便是QQ群推广，因为QQ群里面的用户是实时在线用户并且忠实度很高。一个不错的QQ群能在短时间给网站带来好几十的流量，这在其他平台是难以做到的', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=30&id=12', '0', '99', '1', '0', 'phpcms', '1514526487', '1514526589');
INSERT INTO `t_news` VALUES ('13', '30', '0', '如何在评论中推广网站', '', '', '视频直播 网站', '&lt;p&gt;很多朋友会说，我经常去一些大网站和大型论坛留言评论，但是都没有效果啊。其实在茫茫的大型论坛里面谁会在意你的评论或者论坛签名。那   ', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=30&id=13', '0', '99', '1', '0', 'phpcms', '1514526593', '1514526787');
INSERT INTO `t_news` VALUES ('14', '30', '0', '如何用软文推广自己的网站', '', '', '网站', '​软文推广你没有做过你是不会知道他的威力，不过重点是你的文章要绝对的好。', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=30&id=14', '0', '99', '1', '0', 'phpcms', '1514526788', '1514526856');
INSERT INTO `t_news` VALUES ('15', '30', '0', '选择好记的站名或者关键词', '', '', '选择好记的站名或者关键词', '选择好记的站名或者关键词', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=30&id=15', '0', '99', '1', '0', 'phpcms', '1514526889', '1514526910');
INSERT INTO `t_news` VALUES ('16', '30', '0', '灰色行业在推广上是如何操作的', '', '', '灰色 行业灰色行业', '混迹于站长圈，对灰色行业自然不会陌生：私fu，代yun，六合cai，娱乐cheng，赌ma等，这些行业在国内严格说是禁止的，但是因为法律的漏洞多，加上暴利程度与医疗无异，有一大部分群体参与其', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=30&id=16', '0', '99', '1', '0', 'phpcms', '1514527083', '1514527107');
INSERT INTO `t_news` VALUES ('17', '30', '0', '如何评估及应用一些灰色推广产品', '', '', '灰色 产品', '在互联网广告竞争日益强烈的时代，许多商家都期许自己的产品能在网海中脱颖而出。而昂贵的付费广告让他们可望而不可即，在衡量了价钱之后，很多商家选择了一下灰色推广手段。而专门研', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=30&id=17', '0', '99', '1', '0', 'phpcms', '1514527142', '1514527176');

-- ----------------------------
-- Table structure for `t_news_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_news_data`;
CREATE TABLE `t_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news_data
-- ----------------------------
INSERT INTO `t_news_data` VALUES ('1', '大啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊[page][page]', '0', '', '0', '10000', '', '0', '', '0', '1', '大苏打|0');
INSERT INTO `t_news_data` VALUES ('2', '<span style=\"color: rgb(35, 36, 38); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, tahoma, verdana; font-size: 14px; text-align: center;\">是一位打扮相当时尚的女郎，挑染的波浪卷发随意的披在肩上，身穿褐色收腰皮衣，内着白色紧身高领线衫，下身是褐色短皮裙，露着一段包覆着白色丝袜的秀腿，足蹬一双半高统靴子。身材高挑，秀丽。我情不自禁地望向女郎的面庞，女郎长的非常清秀，眉长，眼细，鼻梁高挺，樱唇微翘，佩戴着一副黑色细框眼镜，但奇怪的是，我觉得女郎脸上自有一股浓的化不开的媚态，也许是因为眼下的小黑痔，也许是两颊的腮红，也许&hellip;&hellip;这个故事发生在上海非典过后的一个普通早上，我很早就出门去接一个朋友。本来以为非典刚过，不会很挤，谁知道刚走到站台，列车就呼啸着来了，一看，如往常的拥挤不堪！我踌躇不前，「等一班吧！」心想，但人流不允其做任何犹豫涌动着将我推入了车厢&hellip;&hellip;</span><br style=\"color: rgb(35, 36, 38); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, tahoma, verdana; font-size: 14px; text-align: center;\" />\r\n<span style=\"color: rgb(35, 36, 38); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, tahoma, verdana; font-size: 14px; text-align: center;\">　　「哎！哎！」我想要后退，可当我目光碰触到几位中年妇女抱怨的眼神时，我放弃了徒劳的动作，算了！忍忍吧！我这样自我安慰&hellip;&hellip;</span><br style=\"color: rgb(35, 36, 38); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, tahoma, verdana; font-size: 14px; text-align: center;\" />\r\n<span style=\"color: rgb(35, 36, 38); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, tahoma, verdana; font-size: 14px; text-align: center;\">　　车厢闷热，空气浑浊，令人昏昏欲睡&hellip;&hellip;我索性缩回拉向扶手的手臂，直接倚在我人身上。</span><br style=\"color: rgb(35, 36, 38); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, tahoma, verdana; font-size: 14px; text-align: center;\" />\r\n<span style=\"color: rgb(35, 36, 38); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, tahoma, verdana; font-size: 14px; text-align: center;\">　　「这样倒也不费什么力气。」我闭起眼睛想稍作休息，可刚合眼身边的人开始挤动起来，看来是有人到站了，瞅准一个空挡，我迅速抢进，挤到了车厢中间，这里的乘客车程叫远，可以安心休息一会，我正自得于自己的挤车经验老道，忽然鼻间涌入一股浓郁但不刺激的香气，在这样的车厢里出现这样的香味，反差极大，我不禁顺香望去&hellip;&hellip;</span><br style=\"color: rgb(35, 36, 38); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, tahoma, verdana; font-size: 14px; text-align: center;\" />\r\n<span style=\"color: rgb(35, 36, 38); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, tahoma, verdana; font-size: 14px; text-align: center;\">　　正当我琢磨着，忽然不期接触到了女郎的眼神，那是种很真挚，很亲切的眼神，似乎眼中含</span>', '0', '', '0', '10000', '', '0', '', '0', '1', '少妇白洁|0');
INSERT INTO `t_news_data` VALUES ('3', '少妇白洁少妇白洁少妇白洁少妇白洁少妇白洁少妇白洁少妇白洁少妇白洁少妇白洁少妇白洁少妇白洁少妇白洁', '0', '', '0', '10000', '', '0', '', '0', '1', '少妇白洁|0');
INSERT INTO `t_news_data` VALUES ('4', '乱伦文学', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `t_news_data` VALUES ('5', '内容啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `t_news_data` VALUES ('6', '如何免费创建一个色情网站，首先注册小白兔官网，登陆，选择自己喜爱的模板', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `t_news_data` VALUES ('7', '首先进入个人中心，选择自己的网站，然后再进行修改。', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `t_news_data` VALUES ('8', '申请提现的前提是，该用户的收入必须满100元，然后再个人中心绑定银行卡，然后再申请中心填写申请的金额，小白兔官网人员看到之后会第一时间把钱打入你的卡内。', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `t_news_data` VALUES ('9', '在内容管理中，选择要上传的栏目，然后添加自己的图片就行。', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `t_news_data` VALUES ('10', '如何导入系统的图片和视频，首先在系统视频和图片库内选择自己想要导入的视频和图片，选中之后，然后点击导入，就成为了自己的视频和图片', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `t_news_data` VALUES ('11', '如果网站不能正常访问了，请先确定该网站是否已经被国内封掉，如果被封掉的话，就重新申请域名，把新的域名绑定到给定的cname 上，然后修改域名。如果该网站是由于程序导致不能访问，请立马联系小白兔客服（首页有小白兔客服的QQ和微信，客服收到信息之后会第一时间回复你）。', '0', '', '0', '10000', '', '0', '', '0', '1', '网站不能正常访问了怎么办|0');
INSERT INTO `t_news_data` VALUES ('12', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">时下最流行的也是效果最好的网站推广方法便是QQ群推广，因为QQ群里面的用户是实时在线用户并且忠实度很高。一个不错的QQ群能在短时间给网站带来好几十的流量，这在其他平台是难以做到的。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">第一、建立QQ群并加人进来</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">创建行业QQ群的方法很简单，只要有一个QQ账号就可以创建群。建群后主要的事情就是推广行业人员进入QQ群，推广的方法很多：</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">（1）可以到别人的QQ群拉人到自己群，这种方法最直接，也很有效果，但是很容易被T。并且由于腾讯的限制，私聊和发好友的人数有很大的限制。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">（2）到其他人群比较集中的地方引导用户，比如贴吧。去跟别人的帖子然后留下群号，很多行业用这种方法效果非常好，例如养殖行业</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">（3）所有能留下群号的地方都可以留。比如</span><a class=\"baidu-highlight\" href=\"https://www.baidu.com/s?wd=%E5%BE%AE%E5%8D%9A&amp;tn=44039180_cpr&amp;fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1Y3nhmvPvcLrj6zuHPWuW6d0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnHnsPWbzrHm4Pjf3P1Ddn1ckrf\" style=\"color: rgb(63, 136, 191); text-decoration-line: none; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" target=\"_blank\">微博</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">、微信、论坛、</span><a class=\"baidu-highlight\" href=\"https://www.baidu.com/s?wd=QQ%E7%A9%BA%E9%97%B4&amp;tn=44039180_cpr&amp;fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1Y3nhmvPvcLrj6zuHPWuW6d0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnHnsPWbzrHm4Pjf3P1Ddn1ckrf\" style=\"color: rgb(63, 136, 191); text-decoration-line: none; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" target=\"_blank\">QQ空间</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">等等。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">第二、活跃群</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">群里有人以后需要活跃气氛，带动大家多聊天，只有群</span><a class=\"baidu-highlight\" href=\"https://www.baidu.com/s?wd=%E6%B4%BB%E8%B7%83%E5%BA%A6&amp;tn=44039180_cpr&amp;fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1Y3nhmvPvcLrj6zuHPWuW6d0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnHnsPWbzrHm4Pjf3P1Ddn1ckrf\" style=\"color: rgb(63, 136, 191); text-decoration-line: none; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" target=\"_blank\">活跃度</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">高才会有更多的群友看群消息，那么你在</span><a class=\"baidu-highlight\" href=\"https://www.baidu.com/s?wd=%E6%8E%A8%E5%B9%BF%E9%93%BE%E6%8E%A5&amp;tn=44039180_cpr&amp;fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1Y3nhmvPvcLrj6zuHPWuW6d0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnHnsPWbzrHm4Pjf3P1Ddn1ckrf\" style=\"color: rgb(63, 136, 191); text-decoration-line: none; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" target=\"_blank\">推广链接</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">引导进入论坛时也会有更多人点击进入。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">（1）帮助群成员解决问题，自己不会的可以百度，也可以把问题发到别的群得到答案。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">（2）分享一些好的资料到群共享</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">（3）不定时的到群里发言，带动大家聊天</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">第三、招管理员</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">一个好的群不是需要你天天在里面活跃，而是你不在的时候也很活跃，你来的时候大家都会围绕你聊天。所以要创建一个良性的</span><a class=\"baidu-highlight\" href=\"https://www.baidu.com/s?wd=%E7%94%9F%E6%80%81%E5%9C%88&amp;tn=44039180_cpr&amp;fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1Y3nhmvPvcLrj6zuHPWuW6d0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnHnsPWbzrHm4Pjf3P1Ddn1ckrf\" style=\"color: rgb(63, 136, 191); text-decoration-line: none; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" target=\"_blank\">生态圈</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">，让群里话题能自给自足，并且还要树立群里其他成员为英雄人物或公主人物。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">（1）互联网上男性总是远远多于女性，所以女生成为了稀缺资源。男女搭配干活不累，所以一定要找一位女生在群里活跃。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">（2）找一位得力的管理。这个管理一定要有行业经验，并且时间比较多，非常忠实于你。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">第四、建立威信</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">建立威信的好处就是一旦你出来发言大家都会听你的，并且非常相信你。只有建立了威信你还可以更好将用户引导进入我们的网站，建立威信的最好办法就是帮助大家解决问题。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">不管是聊天还是解决问题你都要从大局的角度出发，不能跟一小部分人建立很好的关系而忽视另外一部分人。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">第五、引导进入网站</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">最为重要的一点，也是最关键词的一步就是引导进入网站。当已经建立了威信，他们在聊天遇到问题时都会问你在不在，而你可以把网站上关于这个问题的链接发出来@一下那个问问题的人，放心他肯定会去点击查看，而且不仅仅只有一个人会点击。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">除了遇到问题时推广网站，在平时你发现好的内容时也可以发到群里分享给大家。</span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" />\r\n<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">除此之外还可以运用群邮件、</span><a class=\"baidu-highlight\" href=\"https://www.baidu.com/s?wd=QQ%E7%A9%BA%E9%97%B4&amp;tn=44039180_cpr&amp;fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1Y3nhmvPvcLrj6zuHPWuW6d0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnHnsPWbzrHm4Pjf3P1Ddn1ckrf\" style=\"color: rgb(63, 136, 191); text-decoration-line: none; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\" target=\"_blank\">QQ空间</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px;\">等推广。</span>', '0', '', '0', '10000', '', '0', '', '0', '1', '如何在QQ群中推广该网站|0');
INSERT INTO `t_news_data` VALUES ('13', '&lt;p&gt;很多朋友会说，我经常去一些大网站和大型论坛留言评论，但是都没有效果啊。其实在茫茫的大型论坛里面谁会在意你的评论或者论坛签名。那么，评论推广我们要找什么样的比较好，真正有效果的呢。其实找一些和你主题相关的博客去评论，还有一些你目标人群的博客。往往效果会出乎意料的好。因为做博客的90%都是很在意和很好奇你对他的评论的。特别是一下流量少的博客。选择博客评论主要有几个好处，第一;是可以留外链。第二，博主大部分会回访。第三;访客也会注意到你的。目前大部分的博客都是可以留外链的，或者使用 多说 等一些评论框。都是可以留外链的。(使用多说的记得一定要在多说上面设置好你的名称和网址，名称就用你的网站名称就可以了，这样就算他不点也起码曝光了你的站名，加深了印象。)设置多说的时候可以按照这样的方法&lt;/p&gt;', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `t_news_data` VALUES ('14', '软文推广你没有做过你是不会知道他的威力，不过重点是你的文章要绝对的好。垃圾文章只想留个外链的话你就别投稿了，没有用的。软文要做的是要推广你的品牌。为什么怎么多的公司会花几亿几亿的去投央视广告，冠名唱歌比赛。因为他们就是要大家记住他们的品牌。', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `t_news_data` VALUES ('15', '<span style=\"font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; white-space: pre-wrap;\">尽量选用一些好用的站名或者关键词，也可以是你网站的主关键词。但是你要确保这些词你都是排在搜索前面的。如果大的关键词你没有排上去可以选一下你已经排上去的去做软文优化。这些都要在投稿前考虑好，不然你到时又叫人家管理员改的话就显得你不专业了。而且人家会嫌你麻烦。不信的话大家可以问问松松有没有人叫他改过这方面信息的。答案是肯定有的。繁琐的改动让你的用户不但找不到你而且会让别人感觉你不可靠。</span>', '0', '', '0', '10000', '', '0', '', '0', '1', '选择好记的站名或者关键词|0');
INSERT INTO `t_news_data` VALUES ('16', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, simsun, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif; font-size: 14px; text-indent: 28px;\">混迹于站长圈，对灰色行业自然不会陌生：私fu，代yun，六合cai，娱乐cheng，赌ma等，这些行业在国内严格说是禁止的，但是因为法律的漏洞多，加上暴利程度与医疗无异，有一大部分群体参与其中。</span>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &quot;Microsoft YaHei&quot;, simsun, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(51, 51, 51); text-indent: 28px;\">　　搜索引擎当然不会允许这些行业建立的网站关键词能到首页，以此谋取暴利，前两年倒是可以，搜索&ldquo;传奇私fu&rdquo;，你可以看到前十页排的都是主域名。随着搜索引擎的算法愈发完善，以及上头政策的施压，主域名想要在搜索引擎上有灰色词排名，已经是不可能的了。会长简单提一下这种网站前两年seo推广的手法，说到底还是黑帽，批量购买高权重网站的导出链接，力求在最短时间内排名，因为排名有时效性，他们往往不止一个主域做<a href=\"http://www.nestseo.com/news/\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; background: transparent; color: rgb(51, 51, 51); text-decoration-line: none;\">seo推广</a>，随着高权重行业站和新闻站遭到百度的打压，他们把重心又转向了批量入侵挂黑链上。会长会在以后详细描述这些黑帽手法的具体细节，在此打住。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &quot;Microsoft YaHei&quot;, simsun, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(51, 51, 51); text-indent: 28px;\">　　既然搜索引擎对灰色行业打压的如此严重，那这些灰色seo们如何生存?正所谓道高一尺，魔高一丈，搜索引擎只是互联网的一部分，黑帽手法实在太多，主域不上，他们以入侵为主就可以了。虽然现在搜索&ldquo;皇冠cheng&rdquo;你看不到有主域排在前面，但是大批的快照劫持数都数不完，门户站、新闻站被入侵做快照劫持或是直接改标题的比比皆是，由此也看出现在互联网安全问题非常严重。门户网站都经常被黑，更别提现在盛行的开源建站程序，dedecms功能是很好，很强大，但dedecms的安全设置问题不能忽视。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &quot;Microsoft YaHei&quot;, simsun, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(51, 51, 51); text-indent: 28px;\">　　转回正题，灰色行业的利润相当可观，如果你能玩进去，会长认为是极好的，这也是通过互联网赚钱的一种方式。会长的观点一直没变过，不管任何推广手段都有一个范围和界限，只要你能控制的好，把握的准，那么黑帽就是白帽，白帽就是黑帽。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '灰色行业在推广上是如何操作的|0');
INSERT INTO `t_news_data` VALUES ('17', '<span style=\"color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px; text-align: justify; text-indent: 2em;\">在</span><a class=\"keywordlink\" href=\"http://lusongsong.com/tags/hulianwang.html\" style=\"font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px; text-align: justify; text-indent: 2em; margin: 0px; padding: 0px; color: rgb(69, 10, 17);\" target=\"_blank\" title=\"互联网\">互联网</a><span style=\"color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px; text-align: justify; text-indent: 2em;\">广告竞争日益强烈的时代，许多商家都期许自己的产品能在网海中脱颖而出。而昂贵的付费广告让他们可望而不可即，在衡量了价钱之后，很多商家选择了一下灰色推广手段。而</span><a href=\"http://lusongsong.com/reed/1032.html?utm_source=bshare%26utm_campaign=bshare%26utm_medium=qzone%26bsh_bid=404084827\" style=\"font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px; text-align: justify; text-indent: 2em; margin: 0px; padding: 0px; color: rgb(69, 10, 17);\" target=\"_blank\">专门研发灰色推广产品的地下企业</a><span style=\"color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px; text-align: justify; text-indent: 2em;\">也层出不穷，做常见当属黑帽SEO。通过</span><a href=\"http://lusongsong.com/reed/585.html\" style=\"font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px; text-align: justify; text-indent: 2em; margin: 0px; padding: 0px; color: rgb(69, 10, 17);\" target=\"_blank\">搜索引擎作弊</a><span style=\"color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px; text-align: justify; text-indent: 2em;\">，为网站带来不义之流量。</span>\r\n<p style=\"margin: 0px; padding: 10px 0px 20px; line-height: 34.2px; text-indent: 2em; text-align: justify; color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px;\">自从有了白帽seo，就有了黑帽seo。黑白帽的临界点没有标准，就像好人和坏人没有评判的标准。界内有句话，<strong style=\"margin: 0px; padding: 0px;\">顶尖的黑帽客，从来不帮企业做seo</strong>。但反过来却不一定正确，顶级的企业，不一定不用黑帽SEO。当今有敢说自己的<a href=\"http://lusongsong.com/reed/1125.html?\" style=\"margin: 0px; padding: 0px; color: rgb(69, 10, 17);\" target=\"_blank\">第一桶金来得那么正大光明</a>。</p>\r\n<p style=\"margin: 0px; padding: 10px 0px 20px; line-height: 34.2px; text-indent: 2em; text-align: justify; color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px;\">正式进入文章主题，那怎样去评估及应用一些灰色推广产品呢?文章以霸屏代码为例，更多案例会在松松博客跟大家分享。</p>\r\n<p style=\"margin: 0px; padding: 10px 0px 20px; line-height: 34.2px; text-indent: 2em; text-align: justify; color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px;\">最近某家网络服务公司频频call小新，无非就是在推销自家的&ldquo;最新&rdquo;推广神器，&ldquo;<a href=\"http://shop.lusongsong.com/goods-217.html\" style=\"margin: 0px; padding: 0px; color: rgb(69, 10, 17);\" target=\"_blank\">我们的产品啊，能让你的网站流量提高70%</a>。&rdquo;这样的口气，突然想起搞金融培训的那个施总。</p>\r\n<p style=\"margin: 0px; padding: 10px 0px 20px; line-height: 34.2px; text-indent: 2em; text-align: justify; color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px;\">他说我们的新利器用了霸屏代码，半小时后我终于弄明白它到底是人是鬼。</p>\r\n<p style=\"margin: 0px; padding: 10px 0px 20px; line-height: 34.2px; text-indent: 2em; text-align: justify; color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px;\">幽灵附身之后，在搜索端搜索一关键词，找到这个被附于有异于常人力量的网站。点击进去，网站表面很正常，跟一般网站没任何区别。而当你返回搜索端后发现，在我们专注浏览上个网站之时，搜索端页面已悄然发生改变&mdash;&mdash;除竞价区外，其他位置已经被这个网站的收录页面给霸屏。这就是霸屏代码的最终效果。</p>\r\n<p style=\"margin: 0px; padding: 10px 0px 20px; line-height: 34.2px; text-indent: 2em; text-align: justify; color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px;\">作为一名推广员兼业余编程COPYer,肯定是先好好&ldquo;评估&rdquo;一下这玩意的风险性。</p>\r\n<p style=\"margin: 0px; padding: 10px 0px 20px; line-height: 34.2px; text-indent: 2em; text-align: justify; color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px;\">我们重复下刚刚的测试，可以发现，我们点击目标网站后，搜索页已在另一窗口中发生跳转(没弹出新窗口)。跳转到页面http://baidu.com.cnlanshan.com/url/www_网站_com/baidu/，这一页似乎跟<a class=\"keywordlink\" href=\"http://lusongsong.com/tags/baidu.html\" style=\"margin: 0px; padding: 0px; color: rgb(69, 10, 17);\" target=\"_blank\" title=\"百度\">百度</a>的搜索页面没区别，但我们知道这不是百度的网站。此页面3处发生了变化。</p>\r\n<p style=\"margin: 0px; padding: 10px 0px 20px; line-height: 34.2px; text-indent: 2em; text-align: justify; color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px;\">1.此页面是增加了搜索工具的&ldquo;站点内检索&rdquo;的结果(检索&ldquo;网站url&rdquo;)。</p>\r\n<p style=\"margin: 0px; padding: 10px 0px 20px; line-height: 34.2px; text-indent: 2em; text-align: justify; color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px;\">2.除付费推广区外，所有搜索结果都变成该网站的快照。</p>\r\n<p style=\"margin: 0px; padding: 10px 0px 20px; line-height: 34.2px; text-indent: 2em; text-align: justify; color: rgb(42, 42, 42); font-family: Arial, Helvetica, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, sans-serif; font-size: 18px;\">3.底部有一悬浮图片，点击后链接到目标网站。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');

-- ----------------------------
-- Table structure for `t_page`
-- ----------------------------
DROP TABLE IF EXISTS `t_page`;
CREATE TABLE `t_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_page
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pay_account`
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_account`;
CREATE TABLE `t_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pay_account
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pay_payment`
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_payment`;
CREATE TABLE `t_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pay_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pay_spend`
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_spend`;
CREATE TABLE `t_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pay_spend
-- ----------------------------

-- ----------------------------
-- Table structure for `t_picture`
-- ----------------------------
DROP TABLE IF EXISTS `t_picture`;
CREATE TABLE `t_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_picture
-- ----------------------------
INSERT INTO `t_picture` VALUES ('1', '15', '0', 'test', '', '', 'test123', 'sFASDF', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=15&id=1', '0', '99', '1', '0', 'phpcms', '1507303072', '1507303147');
INSERT INTO `t_picture` VALUES ('2', '15', '0', '11111111111', '', '', '121', '1212', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=15&id=2', '0', '99', '1', '0', 'phpcms', '1507557312', '1507557368');
INSERT INTO `t_picture` VALUES ('3', '15', '0', '121', '', '', '121', '1211212', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=15&id=3', '0', '99', '1', '0', 'phpcms', '1507557387', '1507557436');
INSERT INTO `t_picture` VALUES ('4', '15', '0', '大', '', '', '大额分', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=15&id=4', '0', '99', '1', '0', 'phpcms', '1507558325', '1507558334');
INSERT INTO `t_picture` VALUES ('5', '15', '0', '1212', '', '', '121', '121', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=15&id=5', '0', '99', '1', '0', 'phpcms', '1507558507', '1507558542');
INSERT INTO `t_picture` VALUES ('6', '15', '0', '324确认', '', '', '324确认1212', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=15&id=6', '0', '99', '1', '0', 'phpcms', '1507558574', '1507558604');

-- ----------------------------
-- Table structure for `t_picture_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_picture_data`;
CREATE TABLE `t_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_picture_data
-- ----------------------------
INSERT INTO `t_picture_data` VALUES ('1', 'DAFDADF', '0', '', '0', '10000', '', '0', '', '{\"0\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111739809.png\",\"alt\":\"default\"},\"1\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111853508.jpg\",\"alt\":\"1\\u5f85\\u4ed8\\u6b3e\"},\"2\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111854511.jpg\",\"alt\":\"1\\u5f85\\u4ed8\\u6b3e\"},\"3\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111854939.jpg\",\"alt\":\"2-1\\u9000\\u6b3e\\u4e2d\"},\"4\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111855814.jpg\",\"alt\":\"2-2\\u9000\\u6b3e\\u6210\\u529f\"},\"5\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111856696.jpg\",\"alt\":\"2\\u5df2\\u4ed8\\u6b3e\"},\"6\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111857490.jpg\",\"alt\":\"3-1\\u9000\\u8d27\\u4e2d\"},\"7\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111858937.jpg\",\"alt\":\"3-2\\u9000\\u8d27\\u4e2d\\uff08\\u540c\\u610f\\u9000\\u8d27\\u540e\\uff09\"},\"8\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111859820.jpg\",\"alt\":\"3\\u5df2\\u53d1\\u8d27\"},\"9\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111900326.jpg\",\"alt\":\"4\\u4ea4\\u6613\\u5b8c\\u6210\"}}', 'saf|0', '1');
INSERT INTO `t_picture_data` VALUES ('2', '21212', '0', '', '0', '10000', '', '0', '', '', '12112|0', '1');
INSERT INTO `t_picture_data` VALUES ('3', '111111111111', '0', '', '0', '10000', '', '0', '', '{\"0\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111859820.jpg\",\"alt\":\"3\\u5df2\\u53d1\\u8d27\"},\"1\":{\"url\":\"http:\\/\\/www.test.com\\/uploadfile\\/2017\\/1006\\/20171006111858937.jpg\",\"alt\":\"3-2\\u9000\\u8d27\\u4e2d\\uff08\\u540c\\u610f\\u9000\\u8d27\\u540e\\uff09\"}}', '|0', '1');
INSERT INTO `t_picture_data` VALUES ('4', '', '0', '', '0', '10000', '', '0', '', '', '|0', '1');
INSERT INTO `t_picture_data` VALUES ('5', '', '0', '', '0', '10000', '', '0', '', '', '121|0', '1');
INSERT INTO `t_picture_data` VALUES ('6', '', '0', '', '0', '10000', '', '0', '', '', '112|0', '1');

-- ----------------------------
-- Table structure for `t_position`
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_position
-- ----------------------------
INSERT INTO `t_position` VALUES ('1', '0', '0', '首页焦点图推荐', '20', null, '1', '1', '');
INSERT INTO `t_position` VALUES ('2', '0', '0', '首页头条推荐', '20', null, '4', '1', '');
INSERT INTO `t_position` VALUES ('13', '82', '0', '栏目页焦点图', '20', null, '0', '1', '');
INSERT INTO `t_position` VALUES ('5', '69', '0', '推荐下载', '20', null, '0', '1', '');
INSERT INTO `t_position` VALUES ('8', '30', '54', '图片频道首页焦点图', '20', null, '0', '1', '');
INSERT INTO `t_position` VALUES ('9', '0', '0', '网站顶部推荐', '20', null, '0', '1', '');
INSERT INTO `t_position` VALUES ('10', '0', '0', '栏目首页推荐', '20', null, '0', '1', '');
INSERT INTO `t_position` VALUES ('12', '0', '0', '首页图片推荐', '20', null, '0', '1', '');
INSERT INTO `t_position` VALUES ('14', '0', '0', '视频首页焦点图', '20', '', '0', '1', '');
INSERT INTO `t_position` VALUES ('15', '0', '0', '视频首页头条推荐', '20', '', '0', '1', '');
INSERT INTO `t_position` VALUES ('16', '0', '0', '视频首页每日热点', '20', '', '0', '1', '');
INSERT INTO `t_position` VALUES ('17', '0', '0', '视频栏目精彩推荐', '20', '', '0', '1', '');

-- ----------------------------
-- Table structure for `t_position_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_position_data`;
CREATE TABLE `t_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_position_data
-- ----------------------------

-- ----------------------------
-- Table structure for `t_poster`
-- ----------------------------
DROP TABLE IF EXISTS `t_poster`;
CREATE TABLE `t_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_poster
-- ----------------------------
INSERT INTO `t_poster` VALUES ('1', '1', 'banner', '1', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://www.test.com/uploadfile/poster/2.png\',\n    \'alt\' => \'\',\n  ),\n)', '1285813808', '1446249600', '1285813833', '0', '1', '0', '0');
INSERT INTO `t_poster` VALUES ('2', '1', 'phpcmsv9', '2', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://www.test.com/statics/images/v9/ad_login.jpg\',\n    \'alt\' => \'phpcms专业建站系统\',\n  ),\n)', '1285816298', '1446249600', '1285816310', '0', '1', '0', '0');
INSERT INTO `t_poster` VALUES ('3', '1', 'phpcms下载推荐', '3', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://www.test.com/uploadfile/poster/3.png\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)', '1286504815', '1446249600', '1286504865', '0', '1', '0', '0');
INSERT INTO `t_poster` VALUES ('4', '1', 'phpcms广告', '4', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://www.test.com/uploadfile/poster/4.gif\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)', '1286505141', '1446249600', '1286505178', '0', '0', '0', '0');
INSERT INTO `t_poster` VALUES ('5', '1', 'phpcms下载', '5', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://www.test.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)', '1286509363', '1446249600', '1286509401', '0', '0', '0', '0');
INSERT INTO `t_poster` VALUES ('6', '1', 'phpcms下载推荐1', '6', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://www.test.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)', '1286510183', '1446249600', '1286510227', '0', '0', '0', '0');
INSERT INTO `t_poster` VALUES ('7', '1', 'phpcms下载详情', '7', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://www.test.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)', '1286510314', '1446249600', '1286510341', '0', '0', '0', '0');
INSERT INTO `t_poster` VALUES ('8', '1', 'phpcms下载页', '8', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://www.test.com/uploadfile/poster/1.jpg\',\n    \'alt\' => \'官方站\',\n  ),\n)', '1286522084', '1446249600', '1286522125', '0', '0', '0', '0');
INSERT INTO `t_poster` VALUES ('9', '1', 'phpcms v9广告', '9', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://www.test.com/uploadfile/poster/4.gif\',\n    \'alt\' => \'\',\n  ),\n)', '1287041759', '1446249600', '1287041804', '0', '0', '0', '0');
INSERT INTO `t_poster` VALUES ('10', '1', 'phpcms', '10', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://www.test.com/uploadfile/poster/6.jpg\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)', '1289270509', '1446249600', '1289270541', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `t_poster_201710`
-- ----------------------------
DROP TABLE IF EXISTS `t_poster_201710`;
CREATE TABLE `t_poster_201710` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_poster_201710
-- ----------------------------

-- ----------------------------
-- Table structure for `t_poster_201711`
-- ----------------------------
DROP TABLE IF EXISTS `t_poster_201711`;
CREATE TABLE `t_poster_201711` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_poster_201711
-- ----------------------------

-- ----------------------------
-- Table structure for `t_poster_space`
-- ----------------------------
DROP TABLE IF EXISTS `t_poster_space`;
CREATE TABLE `t_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_poster_space
-- ----------------------------
INSERT INTO `t_poster_space` VALUES ('1', '1', '顶部搜索右侧广告位', 'banner', 'poster_js/1.js', '430', '63', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `t_poster_space` VALUES ('2', '1', '会员登陆页广告', 'banner', 'poster_js/2.js', '310', '304', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '会员登陆页广告右侧代替外部通行证广告', '1', '0');
INSERT INTO `t_poster_space` VALUES ('3', '1', '图片频道图片排行下方', 'banner', 'poster_js/3.js', '249', '87', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `t_poster_space` VALUES ('4', '1', '新闻中心推荐链接左侧', 'banner', 'poster_js/4.js', '748', '91', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `t_poster_space` VALUES ('5', '1', '下载列表页右侧顶部', 'banner', 'poster_js/5.js', '248', '162', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `t_poster_space` VALUES ('6', '1', '下载详情页右侧顶部', 'banner', 'poster_js/6.js', '248', '162', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `t_poster_space` VALUES ('7', '1', '下载详情页右侧下部', 'banner', 'poster_js/7.js', '248', '162', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `t_poster_space` VALUES ('8', '1', '下载频道首页', 'banner', 'poster_js/8.js', '698', '80', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `t_poster_space` VALUES ('9', '1', '下载详情页地址列表右侧', 'banner', 'poster_js/12.js', '330', '50', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `t_poster_space` VALUES ('10', '1', '首页关注下方广告', 'banner', 'poster_js/10.js', '307', '60', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');

-- ----------------------------
-- Table structure for `t_queue`
-- ----------------------------
DROP TABLE IF EXISTS `t_queue`;
CREATE TABLE `t_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `t_release_point`
-- ----------------------------
DROP TABLE IF EXISTS `t_release_point`;
CREATE TABLE `t_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_release_point
-- ----------------------------

-- ----------------------------
-- Table structure for `t_search`
-- ----------------------------
DROP TABLE IF EXISTS `t_search`;
CREATE TABLE `t_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_search
-- ----------------------------
INSERT INTO `t_search` VALUES ('1', '1', '1', '1507301158', '国内新闻 新闻 大大 国内', '1');
INSERT INTO `t_search` VALUES ('2', '1', '2', '1507301825', '少妇白洁 少妇白洁 女郎 这样 也许 眼神 一个 休息 白色 非典 眼睛 开始 看来 起来 放弃 身边 直接 自我 有人 动作 空气 令人 身上 正当 极大 似乎 眼中 亲切 接触 出现 可以 客车 这里 中间 一会 自己 刺激 经验 迅速 黑色 非常 眼镜 奇怪 因为 自有 脸上 觉得 身材 时尚 相当 随意 身高 这个 任何 犹豫 不堪 想要 妇女 中年 目光 列车 知道 普通 早上 过后 发生 故事 早就 不会 以为 本来 朋友 抱怨', '1');
INSERT INTO `t_search` VALUES ('3', '1', '3', '1507301913', '少妇白洁 白洁 少妇 ', '1');
INSERT INTO `t_search` VALUES ('4', '1', '4', '1507301938', '乱伦文学 文学 文学', '1');
INSERT INTO `t_search` VALUES ('5', '3', '1', '1507303072', 'test test123 ', '1');
INSERT INTO `t_search` VALUES ('6', '1', '5', '1507556327', '测试下哦 测试下哦 测试 内容', '1');
INSERT INTO `t_search` VALUES ('7', '3', '2', '1507557312', '11111111111 121 ', '1');
INSERT INTO `t_search` VALUES ('8', '3', '3', '1507557387', '121 121 ', '1');
INSERT INTO `t_search` VALUES ('9', '3', '4', '1507558325', '大 大额分 大大', '1');
INSERT INTO `t_search` VALUES ('10', '3', '5', '1507558507', '1212 121 ', '1');
INSERT INTO `t_search` VALUES ('11', '3', '6', '1507558574', '324确认 324确认1212 确认', '1');
INSERT INTO `t_search` VALUES ('12', '0', '1', '0', '妩媚小女人丝袜按摩口暴 网友自拍 - 得爱射在线视频  按摩 女人 妩媚', '1');
INSERT INTO `t_search` VALUES ('13', '0', '2', '0', '偷情18岁女孩差点被她姐姐看到 网友自拍 - 得爱射在线视频  看到 姐姐 女孩', '1');
INSERT INTO `t_search` VALUES ('14', '0', '3', '0', '常年累月我在足疗店的专属技师 网友自拍 - 得爱射在线视频  技师 常年', '1');
INSERT INTO `t_search` VALUES ('15', '0', '4', '0', '宾馆约的小骚货 摸摸就出水 网友自拍 - 得爱射在线视频  宾馆', '1');
INSERT INTO `t_search` VALUES ('16', '0', '6', '0', '农村泡澡推油，另一番风情 网友自拍 - 得爱射在线视频  风情 一番 农村', '1');
INSERT INTO `t_search` VALUES ('17', '0', '7', '0', '紅衣幼師藤浦惠 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('18', '0', '8', '0', '潮吹女王野外露出小树林野战  网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('19', '0', '9', '0', '偷情第二炮老婆查岗 直接就给吓出来了 网友自拍 - 得  出来 直接 老婆 第二', '1');
INSERT INTO `t_search` VALUES ('20', '0', '10', '0', '极品女神酒店阳台大胆深喉口爆 网友自拍 - 得爱射在线视频  大胆 阳台 女神 酒店 极品', '1');
INSERT INTO `t_search` VALUES ('21', '0', '11', '0', '跪下来给我舔 躺着让我操 网友自拍 - 得爱射在线视频  下来', '1');
INSERT INTO `t_search` VALUES ('22', '0', '12', '0', '高颜值混血金融白领 一身骚 网友自拍 - 得爱射在线视频  一身 白领 金融', '1');
INSERT INTO `t_search` VALUES ('23', '0', '13', '0', '口交超大鸡吧根本吞不下去 网友自拍 - 得爱射在线视频  下去 根本 超大', '1');
INSERT INTO `t_search` VALUES ('24', '0', '5', '0', '妩媚小女人丝袜按摩口暴 网友自拍 - 得爱射在线视频  按摩 女人 妩媚', '1');
INSERT INTO `t_search` VALUES ('25', '0', '14', '0', '约炮172CM豪乳性感黑丝模特 网友自拍 - 得爱射在线视频  模特 性感', '1');
INSERT INTO `t_search` VALUES ('26', '0', '15', '0', '卖衣服的足交，技术不熟练 网友自拍 - 得爱射在线视频  熟练 技术 衣服', '1');
INSERT INTO `t_search` VALUES ('27', '0', '16', '0', '偷情18岁女孩差点被她姐姐看到 网友自拍 - 得爱射在线视频  看到 姐姐 女孩', '1');
INSERT INTO `t_search` VALUES ('28', '0', '17', '0', '小骚货高潮胡乱叫喊  网友自拍 - 得爱射在线视频  高潮', '1');
INSERT INTO `t_search` VALUES ('29', '0', '18', '0', '常年累月我在足疗店的专属技师 网友自拍 - 得爱射在线视频  技师 常年', '1');
INSERT INTO `t_search` VALUES ('30', '0', '19', '0', '北京怀念之大胸少妇  网友自拍 - 得爱射在线视频  怀念 北京', '1');
INSERT INTO `t_search` VALUES ('31', '0', '20', '0', '宾馆约的小骚货 摸摸就出水 网友自拍 - 得爱射在线视频  宾馆', '1');
INSERT INTO `t_search` VALUES ('32', '0', '21', '0', '北京怀念之极品黑丝美腿  网友自拍 - 得爱射在线视频  极品 怀念 北京', '1');
INSERT INTO `t_search` VALUES ('33', '0', '22', '0', '农村泡澡推油，另一番风情 网友自拍 - 得爱射在线视频  风情 一番 农村', '1');
INSERT INTO `t_search` VALUES ('34', '0', '23', '0', '东莞会所高挑美女给我做胸推口活按摩服务 网友自拍 -   服务 按摩 美女 会所 东莞', '1');
INSERT INTO `t_search` VALUES ('35', '0', '24', '0', '紅衣幼師藤浦惠 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('36', '0', '25', '0', '98年学妹细长小腿足交 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('37', '0', '26', '0', '潮吹女王野外露出小树林野战  网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('38', '0', '27', '0', '护士制服诱惑自慰潮喷  网友自拍 - 得爱射在线视频  诱惑 护士', '1');
INSERT INTO `t_search` VALUES ('39', '0', '28', '0', '偷情第二炮老婆查岗 直接就给吓出来了 网友自拍 - 得  出来 直接 老婆 第二', '1');
INSERT INTO `t_search` VALUES ('40', '0', '30', '0', '极品女神酒店阳台大胆深喉口爆 网友自拍 - 得爱射在线视频  大胆 阳台 女神 酒店 极品', '1');
INSERT INTO `t_search` VALUES ('41', '0', '31', '0', '跪下来给我舔 躺着让我操 网友自拍 - 得爱射在线视频  下来', '1');
INSERT INTO `t_search` VALUES ('42', '0', '32', '0', '高颜值混血金融白领 一身骚 网友自拍 - 得爱射在线视频  一身 白领 金融', '1');
INSERT INTO `t_search` VALUES ('43', '0', '33', '0', '口交超大鸡吧根本吞不下去 网友自拍 - 得爱射在线视频  下去 根本 超大', '1');
INSERT INTO `t_search` VALUES ('44', '0', '34', '0', '约炮172CM豪乳性感黑丝模特 网友自拍 - 得爱射在线视频  模特 性感', '1');
INSERT INTO `t_search` VALUES ('45', '0', '35', '0', '卖衣服的足交，技术不熟练 网友自拍 - 得爱射在线视频  熟练 技术 衣服', '1');
INSERT INTO `t_search` VALUES ('46', '0', '36', '0', '小骚货高潮胡乱叫喊  网友自拍 - 得爱射在线视频  高潮', '1');
INSERT INTO `t_search` VALUES ('47', '0', '37', '0', '北京怀念之大胸少妇  网友自拍 - 得爱射在线视频  怀念 北京', '1');
INSERT INTO `t_search` VALUES ('48', '0', '38', '0', '北京怀念之极品黑丝美腿  网友自拍 - 得爱射在线视频  极品 怀念 北京', '1');
INSERT INTO `t_search` VALUES ('49', '0', '39', '0', '东莞会所高挑美女给我做胸推口活按摩服务 网友自拍 -   服务 按摩 美女 会所 东莞', '1');
INSERT INTO `t_search` VALUES ('50', '0', '29', '0', '妩媚小女人丝袜按摩口暴 网友自拍 - 得爱射在线视频  按摩 女人 妩媚', '1');
INSERT INTO `t_search` VALUES ('51', '0', '40', '0', '98年学妹细长小腿足交 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('52', '0', '41', '0', '护士制服诱惑自慰潮喷  网友自拍 - 得爱射在线视频  诱惑 护士', '1');
INSERT INTO `t_search` VALUES ('53', '0', '42', '0', '偷情18岁女孩差点被她姐姐看到 网友自拍 - 得爱射在线视频  看到 姐姐 女孩', '1');
INSERT INTO `t_search` VALUES ('54', '0', '43', '0', '常年累月我在足疗店的专属技师 网友自拍 - 得爱射在线视频  技师 常年', '1');
INSERT INTO `t_search` VALUES ('55', '0', '44', '0', '宾馆约的小骚货 摸摸就出水 网友自拍 - 得爱射在线视频  宾馆', '1');
INSERT INTO `t_search` VALUES ('56', '0', '45', '0', '农村泡澡推油，另一番风情 网友自拍 - 得爱射在线视频  风情 一番 农村', '1');
INSERT INTO `t_search` VALUES ('57', '0', '47', '0', '紅衣幼師藤浦惠 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('58', '0', '48', '0', '潮吹女王野外露出小树林野战  网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('59', '0', '49', '0', '偷情第二炮老婆查岗 直接就给吓出来了 网友自拍 - 得  出来 直接 老婆 第二', '1');
INSERT INTO `t_search` VALUES ('60', '0', '50', '0', '极品女神酒店阳台大胆深喉口爆 网友自拍 - 得爱射在线视频  大胆 阳台 女神 酒店 极品', '1');
INSERT INTO `t_search` VALUES ('61', '0', '51', '0', '跪下来给我舔 躺着让我操 网友自拍 - 得爱射在线视频  下来', '1');
INSERT INTO `t_search` VALUES ('62', '0', '52', '0', '高颜值混血金融白领 一身骚 网友自拍 - 得爱射在线视频  一身 白领 金融', '1');
INSERT INTO `t_search` VALUES ('63', '0', '53', '0', '口交超大鸡吧根本吞不下去 网友自拍 - 得爱射在线视频  下去 根本 超大', '1');
INSERT INTO `t_search` VALUES ('64', '0', '54', '0', '约炮172CM豪乳性感黑丝模特 网友自拍 - 得爱射在线视频  模特 性感', '1');
INSERT INTO `t_search` VALUES ('65', '0', '55', '0', '卖衣服的足交，技术不熟练 网友自拍 - 得爱射在线视频  熟练 技术 衣服', '1');
INSERT INTO `t_search` VALUES ('66', '0', '56', '0', '小骚货高潮胡乱叫喊  网友自拍 - 得爱射在线视频  高潮', '1');
INSERT INTO `t_search` VALUES ('67', '0', '57', '0', '北京怀念之大胸少妇  网友自拍 - 得爱射在线视频  怀念 北京', '1');
INSERT INTO `t_search` VALUES ('68', '0', '58', '0', '北京怀念之极品黑丝美腿  网友自拍 - 得爱射在线视频  极品 怀念 北京', '1');
INSERT INTO `t_search` VALUES ('69', '0', '46', '0', '黑絲抱著插 香奈兒  网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('70', '0', '59', '0', '东莞会所高挑美女给我做胸推口活按摩服务 网友自拍 -   服务 按摩 美女 会所 东莞', '1');
INSERT INTO `t_search` VALUES ('71', '0', '60', '0', '98年学妹细长小腿足交 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('72', '0', '61', '0', '护士制服诱惑自慰潮喷  网友自拍 - 得爱射在线视频  诱惑 护士', '1');
INSERT INTO `t_search` VALUES ('73', '0', '62', '0', 'KTV唱歌认识的朋友的朋友晚上去开房 网友自拍 - 得爱  朋友 上去 认识 唱歌', '1');
INSERT INTO `t_search` VALUES ('74', '0', '63', '0', '上海学生妹丝足服务上门 裸足足交 学生妹 很爽 网友  学生 网友 上门 服务', '1');
INSERT INTO `t_search` VALUES ('75', '0', '65', '0', '曾经的前女友 很多年了在见面不说别的先做爱 网友自拍  不说 见面 多年 女友 曾经', '1');
INSERT INTO `t_search` VALUES ('76', '0', '66', '0', '出来约炮别人家的女人什么都愿意配合 网友自拍 - 得爱  配合 愿意 女人 别人 出来', '1');
INSERT INTO `t_search` VALUES ('77', '0', '67', '0', '高端会所一个漂亮的胸推妹子 网友自拍 - 得爱射在线视频  漂亮 一个 会所 高端', '1');
INSERT INTO `t_search` VALUES ('78', '0', '68', '0', '喜欢做爱的美女看过来 百分百满足 网友自拍 - 得爱射  满足 百分 过来 美女 喜欢', '1');
INSERT INTO `t_search` VALUES ('79', '0', '69', '0', '木浴盆大战，你们见过这样的浴盆吗 网友自拍 - 得爱射  这样 你们 大战', '1');
INSERT INTO `t_search` VALUES ('80', '0', '70', '0', '每去一个地方都能找到个有小姐姐的酒店 网友自拍 - 得  酒店 小姐 找到 地方 一个', '1');
INSERT INTO `t_search` VALUES ('81', '0', '71', '0', '骚逼说不洗鸡巴不给我口  网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('82', '0', '72', '0', '滴蜡捆绑轻微SM叫声娇喘 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('83', '0', '73', '0', '青岛 骚货她要自慰给我看 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('84', '0', '74', '0', '高清口交，多体位爆操 网友自拍 - 得爱射在线视频  高清', '1');
INSERT INTO `t_search` VALUES ('85', '0', '75', '0', '换妻俱乐部群P大战一触即发 网友自拍 - 得爱射在线视频  大战 俱乐部', '1');
INSERT INTO `t_search` VALUES ('86', '0', '76', '0', '8合1让你一次撸个够 网友自拍 - 得爱射在线视频  一次', '1');
INSERT INTO `t_search` VALUES ('87', '0', '64', '0', '黑絲抱著插 香奈兒  网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('88', '0', '77', '0', '西安丝袜会所小姐好爽姐撸的我 网友自拍 - 得爱射在线视频  小姐 会所', '1');
INSERT INTO `t_search` VALUES ('89', '0', '78', '0', '情趣嫩B特写内射射太多了一直往外流 网友自拍 - 得爱  一直 情趣', '1');
INSERT INTO `t_search` VALUES ('90', '0', '79', '0', '巨乳妹想啪啪啪了来个哥哥呗 网友自拍 - 得爱射在线视频  哥哥', '1');
INSERT INTO `t_search` VALUES ('91', '0', '80', '0', '舞蹈老师身体柔软姿势万千 网友自拍 - 得爱射在线视频  姿势 老师 身体 舞蹈', '1');
INSERT INTO `t_search` VALUES ('92', '0', '81', '0', 'KTV唱歌认识的朋友的朋友晚上去开房 网友自拍 - 得爱  朋友 上去 认识 唱歌', '1');
INSERT INTO `t_search` VALUES ('93', '0', '82', '0', '乡下理发店大姐推油打飞机 网友自拍 - 得爱射在线视频  飞机', '1');
INSERT INTO `t_search` VALUES ('94', '0', '83', '0', '上海学生妹丝足服务上门 裸足足交 学生妹 很爽 网友  学生 网友 上门 服务', '1');
INSERT INTO `t_search` VALUES ('95', '0', '84', '0', '曾经的前女友 很多年了在见面不说别的先做爱 网友自拍  不说 见面 多年 女友 曾经', '1');
INSERT INTO `t_search` VALUES ('96', '0', '85', '0', '出来约炮别人家的女人什么都愿意配合 网友自拍 - 得爱  配合 愿意 女人 别人 出来', '1');
INSERT INTO `t_search` VALUES ('97', '0', '86', '0', '高端会所一个漂亮的胸推妹子 网友自拍 - 得爱射在线视频  漂亮 一个 会所 高端', '1');
INSERT INTO `t_search` VALUES ('98', '0', '87', '0', '喜欢做爱的美女看过来 百分百满足 网友自拍 - 得爱射  满足 百分 过来 美女 喜欢', '1');
INSERT INTO `t_search` VALUES ('99', '0', '88', '0', '木浴盆大战，你们见过这样的浴盆吗 网友自拍 - 得爱射  这样 你们 大战', '1');
INSERT INTO `t_search` VALUES ('100', '0', '89', '0', '每去一个地方都能找到个有小姐姐的酒店 网友自拍 - 得  酒店 小姐 找到 地方 一个', '1');
INSERT INTO `t_search` VALUES ('101', '0', '90', '0', '骚逼说不洗鸡巴不给我口  网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('102', '0', '91', '0', '滴蜡捆绑轻微SM叫声娇喘 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('103', '0', '92', '0', '青岛 骚货她要自慰给我看 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('104', '0', '93', '0', '高清口交，多体位爆操 网友自拍 - 得爱射在线视频  高清', '1');
INSERT INTO `t_search` VALUES ('105', '0', '94', '0', '换妻俱乐部群P大战一触即发 网友自拍 - 得爱射在线视频  大战 俱乐部', '1');
INSERT INTO `t_search` VALUES ('106', '0', '95', '0', '8合1让你一次撸个够 网友自拍 - 得爱射在线视频  一次', '1');
INSERT INTO `t_search` VALUES ('107', '0', '96', '0', '西安丝袜会所小姐好爽姐撸的我 网友自拍 - 得爱射在线视频  小姐 会所', '1');
INSERT INTO `t_search` VALUES ('108', '0', '97', '0', '情趣嫩B特写内射射太多了一直往外流 网友自拍 - 得爱  一直 情趣', '1');
INSERT INTO `t_search` VALUES ('109', '0', '98', '0', '巨乳妹想啪啪啪了来个哥哥呗 网友自拍 - 得爱射在线视频  哥哥', '1');
INSERT INTO `t_search` VALUES ('110', '0', '99', '0', '舞蹈老师身体柔软姿势万千 网友自拍 - 得爱射在线视频  姿势 老师 身体 舞蹈', '1');
INSERT INTO `t_search` VALUES ('111', '0', '100', '0', '乡下理发店大姐推油打飞机 网友自拍 - 得爱射在线视频  飞机', '1');
INSERT INTO `t_search` VALUES ('112', '0', '101', '0', '妩媚小女人丝袜按摩口暴 网友自拍 - 得爱射在线视频  按摩 妩媚 女人', '1');
INSERT INTO `t_search` VALUES ('113', '0', '102', '0', '偷情18岁女孩差点被她姐姐看到 网友自拍 - 得爱射在线视频  看到 姐姐 女孩', '1');
INSERT INTO `t_search` VALUES ('114', '0', '103', '0', '常年累月我在足疗店的专属技师 网友自拍 - 得爱射在线视频  技师 常年', '1');
INSERT INTO `t_search` VALUES ('115', '0', '104', '0', '宾馆约的小骚货 摸摸就出水 网友自拍 - 得爱射在线视频  宾馆', '1');
INSERT INTO `t_search` VALUES ('116', '0', '105', '0', '农村泡澡推油，另一番风情 网友自拍 - 得爱射在线视频  风情 一番 农村', '1');
INSERT INTO `t_search` VALUES ('117', '0', '106', '0', '紅衣幼師藤浦惠 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('118', '0', '107', '0', '潮吹女王野外露出小树林野战  网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('119', '0', '108', '0', '偷情第二炮老婆查岗 直接就给吓出来了 网友自拍 - 得  出来 直接 老婆 第二', '1');
INSERT INTO `t_search` VALUES ('120', '0', '109', '0', '极品女神酒店阳台大胆深喉口爆 网友自拍 - 得爱射在线视频  大胆 阳台 酒店 极品 女神', '1');
INSERT INTO `t_search` VALUES ('121', '0', '110', '0', '跪下来给我舔 躺着让我操 网友自拍 - 得爱射在线视频  下来', '1');
INSERT INTO `t_search` VALUES ('122', '0', '111', '0', '高颜值混血金融白领 一身骚 网友自拍 - 得爱射在线视频  一身 白领 金融', '1');
INSERT INTO `t_search` VALUES ('123', '0', '112', '0', '口交超大鸡吧根本吞不下去 网友自拍 - 得爱射在线视频  下去 根本 超大', '1');
INSERT INTO `t_search` VALUES ('124', '0', '113', '0', '约炮172CM豪乳性感黑丝模特 网友自拍 - 得爱射在线视频  模特 性感', '1');
INSERT INTO `t_search` VALUES ('125', '0', '114', '0', '卖衣服的足交，技术不熟练 网友自拍 - 得爱射在线视频  熟练 技术 衣服', '1');
INSERT INTO `t_search` VALUES ('126', '0', '115', '0', '小骚货高潮胡乱叫喊  网友自拍 - 得爱射在线视频  高潮', '1');
INSERT INTO `t_search` VALUES ('127', '0', '116', '0', '北京怀念之大胸少妇  网友自拍 - 得爱射在线视频  怀念 北京', '1');
INSERT INTO `t_search` VALUES ('128', '0', '117', '0', '北京怀念之极品黑丝美腿  网友自拍 - 得爱射在线视频  极品 怀念 北京', '1');
INSERT INTO `t_search` VALUES ('129', '0', '118', '0', '东莞会所高挑美女给我做胸推口活按摩服务 网友自拍 -   服务 按摩 美女 东莞 会所', '1');
INSERT INTO `t_search` VALUES ('130', '0', '120', '0', '98年学妹细长小腿足交 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('131', '0', '121', '0', '护士制服诱惑自慰潮喷  网友自拍 - 得爱射在线视频  诱惑 护士', '1');
INSERT INTO `t_search` VALUES ('132', '0', '119', '0', '妩媚小女人丝袜按摩口暴 网友自拍 - 得爱射在线视频  按摩 妩媚 女人', '1');
INSERT INTO `t_search` VALUES ('133', '0', '122', '0', '偷情18岁女孩差点被她姐姐看到 网友自拍 - 得爱射在线视频  看到 姐姐 女孩', '1');
INSERT INTO `t_search` VALUES ('134', '0', '123', '0', '常年累月我在足疗店的专属技师 网友自拍 - 得爱射在线视频  技师 常年', '1');
INSERT INTO `t_search` VALUES ('135', '0', '124', '0', '宾馆约的小骚货 摸摸就出水 网友自拍 - 得爱射在线视频  宾馆', '1');
INSERT INTO `t_search` VALUES ('136', '0', '125', '0', '农村泡澡推油，另一番风情 网友自拍 - 得爱射在线视频  风情 一番 农村', '1');
INSERT INTO `t_search` VALUES ('137', '0', '126', '0', '紅衣幼師藤浦惠 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('138', '0', '127', '0', '潮吹女王野外露出小树林野战  网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('139', '0', '128', '0', '偷情第二炮老婆查岗 直接就给吓出来了 网友自拍 - 得  出来 直接 老婆 第二', '1');
INSERT INTO `t_search` VALUES ('140', '0', '129', '0', '极品女神酒店阳台大胆深喉口爆 网友自拍 - 得爱射在线视频  大胆 阳台 酒店 极品 女神', '1');
INSERT INTO `t_search` VALUES ('141', '0', '130', '0', '跪下来给我舔 躺着让我操 网友自拍 - 得爱射在线视频  下来', '1');
INSERT INTO `t_search` VALUES ('142', '0', '131', '0', '高颜值混血金融白领 一身骚 网友自拍 - 得爱射在线视频  一身 白领 金融', '1');
INSERT INTO `t_search` VALUES ('143', '0', '132', '0', '口交超大鸡吧根本吞不下去 网友自拍 - 得爱射在线视频  下去 根本 超大', '1');
INSERT INTO `t_search` VALUES ('144', '0', '133', '0', '约炮172CM豪乳性感黑丝模特 网友自拍 - 得爱射在线视频  模特 性感', '1');
INSERT INTO `t_search` VALUES ('145', '0', '134', '0', '卖衣服的足交，技术不熟练 网友自拍 - 得爱射在线视频  熟练 技术 衣服', '1');
INSERT INTO `t_search` VALUES ('146', '0', '135', '0', '小骚货高潮胡乱叫喊  网友自拍 - 得爱射在线视频  高潮', '1');
INSERT INTO `t_search` VALUES ('147', '0', '136', '0', '北京怀念之大胸少妇  网友自拍 - 得爱射在线视频  怀念 北京', '1');
INSERT INTO `t_search` VALUES ('148', '0', '137', '0', '北京怀念之极品黑丝美腿  网友自拍 - 得爱射在线视频  极品 怀念 北京', '1');
INSERT INTO `t_search` VALUES ('149', '0', '138', '0', '东莞会所高挑美女给我做胸推口活按摩服务 网友自拍 -   服务 按摩 美女 东莞 会所', '1');
INSERT INTO `t_search` VALUES ('150', '0', '139', '0', '98年学妹细长小腿足交 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('151', '0', '140', '0', '护士制服诱惑自慰潮喷  网友自拍 - 得爱射在线视频  诱惑 护士', '1');
INSERT INTO `t_search` VALUES ('152', '0', '141', '0', '黑絲抱著插 香奈兒  网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('153', '0', '142', '0', 'KTV唱歌认识的朋友的朋友晚上去开房 网友自拍 - 得爱  朋友 上去 认识 唱歌', '1');
INSERT INTO `t_search` VALUES ('154', '0', '143', '0', '上海学生妹丝足服务上门 裸足足交 学生妹 很爽 网友  学生 网友 服务 上门', '1');
INSERT INTO `t_search` VALUES ('155', '0', '144', '0', '曾经的前女友 很多年了在见面不说别的先做爱 网友自拍  不说 见面 多年 曾经 女友', '1');
INSERT INTO `t_search` VALUES ('156', '0', '145', '0', '出来约炮别人家的女人什么都愿意配合 网友自拍 - 得爱  配合 愿意 女人 出来 别人', '1');
INSERT INTO `t_search` VALUES ('157', '0', '146', '0', '高端会所一个漂亮的胸推妹子 网友自拍 - 得爱射在线视频  漂亮 一个 高端 会所', '1');
INSERT INTO `t_search` VALUES ('158', '0', '147', '0', '喜欢做爱的美女看过来 百分百满足 网友自拍 - 得爱射  满足 百分 过来 喜欢 美女', '1');
INSERT INTO `t_search` VALUES ('159', '0', '148', '0', '木浴盆大战，你们见过这样的浴盆吗 网友自拍 - 得爱射  这样 你们 大战', '1');
INSERT INTO `t_search` VALUES ('160', '0', '149', '0', '每去一个地方都能找到个有小姐姐的酒店 网友自拍 - 得  酒店 小姐 找到 一个 地方', '1');
INSERT INTO `t_search` VALUES ('161', '0', '150', '0', '骚逼说不洗鸡巴不给我口  网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('162', '0', '151', '0', '滴蜡捆绑轻微SM叫声娇喘 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('163', '0', '152', '0', '青岛 骚货她要自慰给我看 网友自拍 - 得爱射在线视频  ', '1');
INSERT INTO `t_search` VALUES ('164', '0', '153', '0', '高清口交，多体位爆操 网友自拍 - 得爱射在线视频  高清', '1');
INSERT INTO `t_search` VALUES ('165', '0', '154', '0', '换妻俱乐部群P大战一触即发 网友自拍 - 得爱射在线视频  大战 俱乐部', '1');
INSERT INTO `t_search` VALUES ('166', '0', '155', '0', '8合1让你一次撸个够 网友自拍 - 得爱射在线视频  一次', '1');
INSERT INTO `t_search` VALUES ('167', '0', '156', '0', '西安丝袜会所小姐好爽姐撸的我 网友自拍 - 得爱射在线视频  小姐 会所', '1');
INSERT INTO `t_search` VALUES ('168', '0', '157', '0', '情趣嫩B特写内射射太多了一直往外流 网友自拍 - 得爱  一直 情趣', '1');
INSERT INTO `t_search` VALUES ('169', '0', '158', '0', '巨乳妹想啪啪啪了来个哥哥呗 网友自拍 - 得爱射在线视频  哥哥', '1');
INSERT INTO `t_search` VALUES ('170', '0', '159', '0', '舞蹈老师身体柔软姿势万千 网友自拍 - 得爱射在线视频  姿势 舞蹈 老师 身体', '1');
INSERT INTO `t_search` VALUES ('171', '0', '160', '0', '乡下理发店大姐推油打飞机 网友自拍 - 得爱射在线视频  飞机', '1');
INSERT INTO `t_search` VALUES ('172', '1', '6', '1514524754', '如何免费创建一个色情网站 如何免费创建一个色情网站 网站 如何 一个 色情 创建 免费 自己 喜爱 模板 选择 首先 注册 小白 登陆', '1');
INSERT INTO `t_search` VALUES ('173', '1', '7', '1514524841', '网站域名被国内封锁了，如何修改域名？ 域名 网站 网站 域名 修改 选择 然后 进行 中心 自己 首先 个人 进入 国内 如何', '1');
INSERT INTO `t_search` VALUES ('174', '1', '8', '1514524949', '如何申请提现 如何申请提现 申请 中心 然后 如何 填写 个人 银行卡 必须 用户 前提 的收入 一时 第一 人员 金额 小白 看到 之后', '1');
INSERT INTO `t_search` VALUES ('175', '1', '9', '1514525066', '如何进行上传自己的视频和图片 上传 视频和图片 上传 图片 视频 自己 进行 如何 然后 添加 栏目 内容 管理 选择', '1');
INSERT INTO `t_search` VALUES ('176', '1', '10', '1514525137', '如何导入系统的图片和视频 系统 图片 视频 视频 图片 导入 系统 自己 如何 然后 为了 之后 点击 选择 首先 想要', '1');
INSERT INTO `t_search` VALUES ('177', '1', '11', '1514525838', '网站不能正常访问了怎么办 网站不能正常访问了怎么办 网站 域名 访问 如果 不能 正常 修改 小白 然后 申请 怎么办 是否 确定 已经 国内 重新 信息 之后 回复 一时 第一 收到 首页 由于 程序 导致 联系', '1');
INSERT INTO `t_search` VALUES ('178', '1', '12', '1514526487', '如何在QQ群中推广自己网站 如何在QQ群中推广该网站 宋体 可以 网站 推广 问题 建立 进入 大家 一个 活跃 方法 并且 用户 行业 聊天 引导 就是 其他 效果 只有 非常 创建 解决 所以 时间 最好 自己 忠实 点击 部分 遇到 发到 管理 人物 一定 分享 这个 出来 时候 带动 成员 帮助 更多 需要 如何在 不在 链接 论坛 发言 空间 面的 因为 这种 实时 几十 限制 带来 别人 流量 难以 做到 平台 网站推广 便是 流行 不错 地方 在线 留下 比较 比如 男女 一旦 相信 更好 总是 我们 远远 好处 女性 资源 女生 为了 经验 生成 搭配 办法 稀缺 出发 查看 而且 肯定 放心 关于 那个 不仅仅 除了 运用 邮件 除此之外 内容 平时 发现 他们 已经 不能 一小 男性 角度 还是 关系 忽视 一点 关键词 重要 最为 另外 第五 不管 话题 但是 气氛 以后 有人 第二 容易 直接 事情 那么 消息 主要 等等 由于 帖子 然后 养殖 例如 集中 人群 好友 腾讯 微博 人数 很大 账号 只要 生态 良性 围绕 里面 而是 所有 公主 互联 英雄 树立 还要 天天 不是 百度 得到 不会 第一 简单 进来 答案 一些 第三 管理员 定时 共享 资料 网上', '1');
INSERT INTO `t_search` VALUES ('179', '1', '13', '1514526593', '如何在评论中推广网站 视频直播 网站 评论 论坛 博客 一些 可以 网站 大型 效果 或者 名称 其实 在意 里面 签名 这样 使用 设置 朋友 推广 经常 但是 留言 没有 上面 记得 一定 目前 分会 第三 访客 注意 大部分 按照 时候 大部 方法 印象 加深 就算 起码 曝光 网址 主题 真正 相关 还有 目标 比较 什么样 那么 我们 人群 往往 选择 流量 主要 好处 第一 特别 好奇 如何在 因为 第二', '1');
INSERT INTO `t_search` VALUES ('180', '1', '14', '1514526788', '如何用软文推广自己的网站 网站 ', '1');
INSERT INTO `t_search` VALUES ('181', '1', '15', '1514526889', '选择好记的站名或者关键词 选择好记的站名或者关键词 关键词 或者 可以 选择 上去 而且 这些 人家 没有 大家 麻烦 管理员 专业 显得 答案 不到 不但 别人 感觉 不可 用户 信息 肯定 有的 这方面 已经 尽量 选用 如果 优化 投稿 考虑 面的 搜索 一些 网站 但是 确保 不然', '1');
INSERT INTO `t_search` VALUES ('182', '1', '16', '1514527083', '灰色行业在推广上是如何操作的 灰色 行业灰色行业 行业 灰色 搜索引擎 这些 推广 会长 入侵 他们 现在 互联网 手法 可以 排名 网站 暴利 因为 但是 不会 随着 新闻 域名 站长 自然 娱乐 批量 一个 陌生 就是 搜索 禁止 无异 说是 严格 医疗 法律的 加上 漏洞 程度 大部分 国内 如何 参与 高一 群体 严重 门户网站 由此 非常 安全问题 看出 门户 经常 只是 虽然 实在 为主 看不到 或是 直接 部分 大批 前面 标题 不能 观点 一直 不管 方式 赚钱 通过 任何 手段 控制 把握 只要 界限 所谓 范围 认为 进去 强大 的安全 功能 程序 建站 设置 问题 可观 如果 相当 利润 那么 忽视 盛行 政策 以及 完善 算法 想要 这种 还是 简单 可能 已经 看到 当然 允许 其中 操作 建立 关键词 倒是 传奇 谋取 以此 首页 购买 重心 转向 百度 遭到 以后 详细 既然 如此 细节 具体 描述 时效 往往 有时 时间 链接 力求 不止 生存', '1');
INSERT INTO `t_search` VALUES ('183', '1', '17', '1514527142', '如何评估及应用一些灰色推广产品 灰色 产品 网站 推广 搜索 产品 页面 灰色 我们 广告 商家 自己 评估 付费 点击 互联网 代码 企业 百度 之后 应用 检索 这个 流量 一些 标准 区别 一定 文章 目标 发生 发现 窗口 就是 没有 他们 昂贵 日益 不可 时代 强烈 许多 脱颖而出 竞争 衡量 专门 选择 手段 竞价 幽灵 发生改变 悄然 其他 位置 最终 收录 到底 已经 关键词 任何 返回 进去 表面 力量 专注 找到 一般 浏览 正常 业余 变化 底部 不是 图片 明白 知道 变成 工具 站点 增加了 所有 似乎 肯定 好好 编程 作为 结果 的风险 重复 出新 链接 可以 刚刚 测试 效果 网络 顶尖 评判 人和 当今 第一 不用 顶级 反过来 正确 黑白 自从 研发 产品的 地下 搜索引擎 作弊 带来 通过 常见 来得 那么 提高 最新 无非 推销 这样 那个 利器 小时 培训 金融 突然 想起 频频 进入 主题 怎样 正式 如何 光明 更多 案例 最近 分享 大家 博客 终于', '1');

-- ----------------------------
-- Table structure for `t_search_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `t_search_keyword`;
CREATE TABLE `t_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_search_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for `t_session`
-- ----------------------------
DROP TABLE IF EXISTS `t_session`;
CREATE TABLE `t_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_session
-- ----------------------------
INSERT INTO `t_session` VALUES ('5tub53l6d5vct6e9qqejrv01t6', '1', '127.0.0.1', '1514542959', '1', '0', 'member', 'index', 'register', 'code|s:5:\"nbdah\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"2X2wC3\";lock_screen|i:0;');

-- ----------------------------
-- Table structure for `t_site`
-- ----------------------------
DROP TABLE IF EXISTS `t_site`;
CREATE TABLE `t_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_site
-- ----------------------------
INSERT INTO `t_site` VALUES ('1', '默认站点', '', '', '小白兔建站', '小白兔建站', '小白兔建站', '', 'master', 'master', '{\"QQ\":\"12121\",\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"1\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\/images\\/water\\/\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}', '56235942-aa93-11e7-a96e-fc45968cec44');

-- ----------------------------
-- Table structure for `t_site_list`
-- ----------------------------
DROP TABLE IF EXISTS `t_site_list`;
CREATE TABLE `t_site_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `db_name` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `is_demo` tinyint(1) DEFAULT '0' COMMENT '是否为系统创建的demo',
  `ctime` int(10) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `is_commend` tinyint(1) DEFAULT '0' COMMENT '是否推荐上首页',
  `description` varchar(500) DEFAULT NULL COMMENT '网站描述',
  `moblie_thumb` varchar(500) DEFAULT NULL,
  `also_moblie` tinyint(1) DEFAULT '0' COMMENT '同时也是手机模板',
  `moblie_qr_thumb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_site_list
-- ----------------------------
INSERT INTO `t_site_list` VALUES ('5', 'http://www.test5.com', '0', 'db_a', '演示站点5', '1', null, 'AAEIABACGAAgs-ORzwUouMbs6gQwhgQ4qQQ.jpg', '0', null, 'AAEIABACGAAglbCHzwUotMOk1gIwyAE45AI.jpg', '1', 'mobi_qrcode_005.gif');
INSERT INTO `t_site_list` VALUES ('2', 'http://www.test2.com', '0', 'db_a', '演示站点2', '1', null, 'AAEIABACGAAgs-ORzwUouMbs6gQwhgQ4qQQ.jpg', '0', null, 'AAEIABACGAAglbCHzwUotMOk1gIwyAE45AI.jpg', '1', 'mobi_qrcode_005.gif');
INSERT INTO `t_site_list` VALUES ('3', 'http://www.test3.com', '0', 'db_2', '演示站点3', '1', null, 'AAEIABACGAAg8P6bzwUosKHd3QQwhgQ44go.jpg', '0', null, 'AAEIABACGAAglbCHzwUotMOk1gIwyAE45AI.jpg', '1', 'mobi_qrcode_005.gif');
INSERT INTO `t_site_list` VALUES ('4', 'http://www.test4.com', '0', 'db_3', '演示站点4', '1', null, 'AAEIABACGAAgsNybzwUooK7cuAcwhgQ4swo.jpg', '0', null, 'AAEIABACGAAglbCHzwUotMOk1gIwyAE45AI.jpg', '1', 'mobi_qrcode_005.gif');
INSERT INTO `t_site_list` VALUES ('1', 'http://www.master.com', '0', 'master_com', '主站', '0', null, null, '0', null, null, null, null);
INSERT INTO `t_site_list` VALUES ('6', 'http://www.user2.com', '1', 'db_2', '用户网站1', '0', null, 'AAEIABACGAAgs-ORzwUouMbs6gQwhgQ4qQQ.jpg', '1', '王者荣耀王昭君铭文推荐 超强的控制时间 _ 多玩王者荣耀专区', null, null, null);
INSERT INTO `t_site_list` VALUES ('7', 'http://www.user1.com', '1', 'db_2', '用户网站2', '0', null, 'AAEIABACGAAgs-ORzwUouMbs6gQwhgQ4qQQ.jpg', '1', '王者荣耀王昭君铭文推荐 超强的控制时间 _ 多玩王者荣耀专区', null, null, null);
INSERT INTO `t_site_list` VALUES ('8', 'http://www.user3.com', '1', 'user3_db', '用户网站3', '0', null, 'AAEIABACGAAg8P6bzwUosKHd3QQwhgQ44go.jpg', '1', '王者荣耀王昭君铭文推荐 超强的控制时间 _ 多玩王者荣耀专区', null, null, null);
INSERT INTO `t_site_list` VALUES ('9', 'http://www.test9.com', '0', 'db-3', '演示站点9', '1', null, 'AAEIABACGAAg8P6bzwUosKHd3QQwhgQ44go.jpg', '0', null, 'AAEIABACGAAglbCHzwUotMOk1gIwyAE45AI.jpg', '1', 'mobi_qrcode_005.gif');
INSERT INTO `t_site_list` VALUES ('10', 'http://www.test10.com', '0', 'db_a', '演示站点10', '1', null, 'AAEIABACGAAg8P6bzwUosKHd3QQwhgQ44go.jpg', '0', null, 'AAEIABACGAAglbCHzwUotMOk1gIwyAE45AI.jpg', '1', 'mobi_qrcode_005.gif');
INSERT INTO `t_site_list` VALUES ('11', 'http://www.test11.com', '0', 'db_a', '演示站点11', '1', null, 'AAEIABACGAAg8P6bzwUosKHd3QQwhgQ44go.jpg', '0', null, 'AAEIABACGAAglbCHzwUotMOk1gIwyAE45AI.jpg', '1', 'mobi_qrcode_005.gif');
INSERT INTO `t_site_list` VALUES ('12', 'http://www.test12.com', '0', 'db_a', '演示站点12', '1', null, 'AAEIABACGAAg8P6bzwUosKHd3QQwhgQ44go.jpg', '0', null, 'AAEIABACGAAglbCHzwUotMOk1gIwyAE45AI.jpg', '1', 'mobi_qrcode_005.gif');

-- ----------------------------
-- Table structure for `t_sms_report`
-- ----------------------------
DROP TABLE IF EXISTS `t_sms_report`;
CREATE TABLE `t_sms_report` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `id_code` varchar(10) NOT NULL,
  `msg` varchar(90) NOT NULL,
  `send_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `return_id` varchar(30) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`,`posttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sms_report
-- ----------------------------

-- ----------------------------
-- Table structure for `t_special`
-- ----------------------------
DROP TABLE IF EXISTS `t_special`;
CREATE TABLE `t_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_special
-- ----------------------------

-- ----------------------------
-- Table structure for `t_special_content`
-- ----------------------------
DROP TABLE IF EXISTS `t_special_content`;
CREATE TABLE `t_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_special_content
-- ----------------------------

-- ----------------------------
-- Table structure for `t_special_c_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_special_c_data`;
CREATE TABLE `t_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_special_c_data
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sphinx_counter`
-- ----------------------------
DROP TABLE IF EXISTS `t_sphinx_counter`;
CREATE TABLE `t_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sphinx_counter
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sso_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_sso_admin`;
CREATE TABLE `t_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sso_admin
-- ----------------------------
INSERT INTO `t_sso_admin` VALUES ('1', 'phpcms', '7508ed0ba0064eda4d2749a6811b363c', 'J4SxM9', '1', '1510670126', '127.0.0.1');

-- ----------------------------
-- Table structure for `t_sso_applications`
-- ----------------------------
DROP TABLE IF EXISTS `t_sso_applications`;
CREATE TABLE `t_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'phpsso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sso_applications
-- ----------------------------
INSERT INTO `t_sso_applications` VALUES ('1', 'phpcms_v9', 'phpcms v9', 'http://www.test.com/', 'W7pDgl8KVNVs8fMUGzKLkCQ5M5kenpmL', '', 'api.php?op=phpsso', 'utf-8', '1');

-- ----------------------------
-- Table structure for `t_sso_members`
-- ----------------------------
DROP TABLE IF EXISTS `t_sso_members`;
CREATE TABLE `t_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sso_members
-- ----------------------------
INSERT INTO `t_sso_members` VALUES ('1', 'user1', 'f14bb0653bc328939681cef9d0b4e5d0', 'kcazMc', 'dd@qq.com', '127.0.0.1', '1510670388', '0', '1510670388', 'phpcms v9', 'app', '0', '0');

-- ----------------------------
-- Table structure for `t_sso_messagequeue`
-- ----------------------------
DROP TABLE IF EXISTS `t_sso_messagequeue`;
CREATE TABLE `t_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sso_messagequeue
-- ----------------------------
INSERT INTO `t_sso_messagequeue` VALUES ('1', 'member_add', '0', '1', '{\"username\":\"user1\",\"password\":\"f14bb0653bc328939681cef9d0b4e5d0\",\"email\":\"dd@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1510670388\",\"lastdate\":\"1510670388\",\"appname\":\"phpcms v9\",\"type\":\"app\",\"random\":\"kcazMc\",\"ucuserid\":\"0\",\"uid\":\"1\",\"action\":\"member_add\"}', '1510670388', '{\"1\":1}');

-- ----------------------------
-- Table structure for `t_sso_session`
-- ----------------------------
DROP TABLE IF EXISTS `t_sso_session`;
CREATE TABLE `t_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sso_session
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sso_settings`
-- ----------------------------
DROP TABLE IF EXISTS `t_sso_settings`;
CREATE TABLE `t_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sso_settings
-- ----------------------------
INSERT INTO `t_sso_settings` VALUES ('denyemail', '');
INSERT INTO `t_sso_settings` VALUES ('denyusername', '');
INSERT INTO `t_sso_settings` VALUES ('creditrate', '');
INSERT INTO `t_sso_settings` VALUES ('sp4', '');
INSERT INTO `t_sso_settings` VALUES ('ucenter', '');

-- ----------------------------
-- Table structure for `t_tag`
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `t_template_bak`
-- ----------------------------
DROP TABLE IF EXISTS `t_template_bak`;
CREATE TABLE `t_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_template_bak
-- ----------------------------

-- ----------------------------
-- Table structure for `t_times`
-- ----------------------------
DROP TABLE IF EXISTS `t_times`;
CREATE TABLE `t_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_times
-- ----------------------------

-- ----------------------------
-- Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('52', '1', 'search', '0', '专题', '0', 'special', '', '', '4', '专题');
INSERT INTO `t_type` VALUES ('1', '1', 'search', '1', '新闻', '0', '', '', '', '1', '新闻模型搜索');
INSERT INTO `t_type` VALUES ('2', '1', 'search', '2', '下载', '0', '', '', '', '3', '下载模型搜索');
INSERT INTO `t_type` VALUES ('3', '1', 'search', '3', '图片', '0', '', '', '', '2', '图片模型搜索');

-- ----------------------------
-- Table structure for `t_urlrule`
-- ----------------------------
DROP TABLE IF EXISTS `t_urlrule`;
CREATE TABLE `t_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_urlrule
-- ----------------------------
INSERT INTO `t_urlrule` VALUES ('1', 'content', 'category', '1', '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html', 'news/china/1000.html');
INSERT INTO `t_urlrule` VALUES ('6', 'content', 'category', '0', 'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}', 'index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `t_urlrule` VALUES ('11', 'content', 'show', '1', '{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html', '2010/catdir_0720/1_2.html');
INSERT INTO `t_urlrule` VALUES ('12', 'content', 'show', '1', '{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html', 'it/product/2010/0720/1_2.html');
INSERT INTO `t_urlrule` VALUES ('16', 'content', 'show', '0', 'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}', 'index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `t_urlrule` VALUES ('17', 'content', 'show', '0', 'show-{$catid}-{$id}-{$page}.html', 'show-1-2-1.html');
INSERT INTO `t_urlrule` VALUES ('18', 'content', 'show', '0', 'content-{$catid}-{$id}-{$page}.html', 'content-1-2-1.html');
INSERT INTO `t_urlrule` VALUES ('30', 'content', 'category', '0', 'list-{$catid}-{$page}.html', 'list-1-1.html');

-- ----------------------------
-- Table structure for `t_video`
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_video
-- ----------------------------
INSERT INTO `t_video` VALUES ('1', '23', '0', '妩媚小女人丝袜按摩口暴 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=1', '0', '99', '1', '0', 'phpcms', '1511962300', '1511962300', '', '');
INSERT INTO `t_video` VALUES ('2', '23', '0', '偷情18岁女孩差点被她姐姐看到 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=2', '0', '99', '1', '0', 'phpcms', '1511962300', '1511962300', '', '');
INSERT INTO `t_video` VALUES ('3', '23', '0', '常年累月我在足疗店的专属技师 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=3', '0', '99', '1', '0', 'phpcms', '1511962302', '1511962302', '', '');
INSERT INTO `t_video` VALUES ('4', '23', '0', '宾馆约的小骚货 摸摸就出水 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=4', '0', '99', '1', '0', 'phpcms', '1511962302', '1511962302', '', '');
INSERT INTO `t_video` VALUES ('5', '23', '0', '妩媚小女人丝袜按摩口暴 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=5', '0', '99', '1', '0', 'phpcms', '1511962300', '1511962300', '', '');
INSERT INTO `t_video` VALUES ('6', '23', '0', '农村泡澡推油，另一番风情 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=6', '0', '99', '1', '0', 'phpcms', '1511962304', '1511962304', '', '');
INSERT INTO `t_video` VALUES ('7', '23', '0', '紅衣幼師藤浦惠 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=7', '0', '99', '1', '0', 'phpcms', '1511962304', '1511962304', '', '');
INSERT INTO `t_video` VALUES ('8', '23', '0', '潮吹女王野外露出小树林野战  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=8', '0', '99', '1', '0', 'phpcms', '1511962306', '1511962306', '', '');
INSERT INTO `t_video` VALUES ('9', '23', '0', '偷情第二炮老婆查岗 直接就给吓出来了 网友自拍 - 得', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=9', '0', '99', '1', '0', 'phpcms', '1511962306', '1511962306', '', '');
INSERT INTO `t_video` VALUES ('10', '23', '0', '极品女神酒店阳台大胆深喉口爆 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=10', '0', '99', '1', '0', 'phpcms', '1511962307', '1511962307', '', '');
INSERT INTO `t_video` VALUES ('11', '23', '0', '跪下来给我舔 躺着让我操 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=11', '0', '99', '1', '0', 'phpcms', '1511962307', '1511962307', '', '');
INSERT INTO `t_video` VALUES ('12', '23', '0', '高颜值混血金融白领 一身骚 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=12', '0', '99', '1', '0', 'phpcms', '1511962308', '1511962308', '', '');
INSERT INTO `t_video` VALUES ('13', '23', '0', '口交超大鸡吧根本吞不下去 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=13', '0', '99', '1', '0', 'phpcms', '1511962308', '1511962308', '', '');
INSERT INTO `t_video` VALUES ('14', '23', '0', '约炮172CM豪乳性感黑丝模特 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=14', '0', '99', '1', '0', 'phpcms', '1511962310', '1511962310', '', '');
INSERT INTO `t_video` VALUES ('15', '23', '0', '卖衣服的足交，技术不熟练 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=15', '0', '99', '1', '0', 'phpcms', '1511962310', '1511962310', '', '');
INSERT INTO `t_video` VALUES ('16', '23', '0', '偷情18岁女孩差点被她姐姐看到 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=16', '0', '99', '1', '0', 'phpcms', '1511962300', '1511962300', '', '');
INSERT INTO `t_video` VALUES ('17', '23', '0', '小骚货高潮胡乱叫喊  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=17', '0', '99', '1', '0', 'phpcms', '1511962311', '1511962311', '', '');
INSERT INTO `t_video` VALUES ('18', '23', '0', '常年累月我在足疗店的专属技师 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=18', '0', '99', '1', '0', 'phpcms', '1511962302', '1511962302', '', '');
INSERT INTO `t_video` VALUES ('19', '23', '0', '北京怀念之大胸少妇  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=19', '0', '99', '1', '0', 'phpcms', '1511962311', '1511962311', '', '');
INSERT INTO `t_video` VALUES ('20', '23', '0', '宾馆约的小骚货 摸摸就出水 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=20', '0', '99', '1', '0', 'phpcms', '1511962302', '1511962302', '', '');
INSERT INTO `t_video` VALUES ('21', '23', '0', '北京怀念之极品黑丝美腿  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=21', '0', '99', '1', '0', 'phpcms', '1511962312', '1511962312', '', '');
INSERT INTO `t_video` VALUES ('22', '23', '0', '农村泡澡推油，另一番风情 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=22', '0', '99', '1', '0', 'phpcms', '1511962304', '1511962304', '', '');
INSERT INTO `t_video` VALUES ('23', '23', '0', '东莞会所高挑美女给我做胸推口活按摩服务 网友自拍 -', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=23', '0', '99', '1', '0', 'phpcms', '1511962312', '1511962312', '', '');
INSERT INTO `t_video` VALUES ('24', '23', '0', '紅衣幼師藤浦惠 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=24', '0', '99', '1', '0', 'phpcms', '1511962304', '1511962304', '', '');
INSERT INTO `t_video` VALUES ('25', '23', '0', '98年学妹细长小腿足交 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=25', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('26', '23', '0', '潮吹女王野外露出小树林野战  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=26', '0', '99', '1', '0', 'phpcms', '1511962306', '1511962306', '', '');
INSERT INTO `t_video` VALUES ('27', '23', '0', '护士制服诱惑自慰潮喷  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=27', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('28', '23', '0', '偷情第二炮老婆查岗 直接就给吓出来了 网友自拍 - 得', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=28', '0', '99', '1', '0', 'phpcms', '1511962306', '1511962306', '', '');
INSERT INTO `t_video` VALUES ('29', '23', '0', '妩媚小女人丝袜按摩口暴 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=29', '0', '99', '1', '0', 'phpcms', '1511962300', '1511962300', '', '');
INSERT INTO `t_video` VALUES ('30', '23', '0', '极品女神酒店阳台大胆深喉口爆 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=30', '0', '99', '1', '0', 'phpcms', '1511962307', '1511962307', '', '');
INSERT INTO `t_video` VALUES ('31', '23', '0', '跪下来给我舔 躺着让我操 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=31', '0', '99', '1', '0', 'phpcms', '1511962307', '1511962307', '', '');
INSERT INTO `t_video` VALUES ('32', '23', '0', '高颜值混血金融白领 一身骚 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=32', '0', '99', '1', '0', 'phpcms', '1511962308', '1511962308', '', '');
INSERT INTO `t_video` VALUES ('33', '23', '0', '口交超大鸡吧根本吞不下去 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=33', '0', '99', '1', '0', 'phpcms', '1511962308', '1511962308', '', '');
INSERT INTO `t_video` VALUES ('34', '23', '0', '约炮172CM豪乳性感黑丝模特 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=34', '0', '99', '1', '0', 'phpcms', '1511962310', '1511962310', '', '');
INSERT INTO `t_video` VALUES ('35', '23', '0', '卖衣服的足交，技术不熟练 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=35', '0', '99', '1', '0', 'phpcms', '1511962310', '1511962310', '', '');
INSERT INTO `t_video` VALUES ('36', '23', '0', '小骚货高潮胡乱叫喊  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=36', '0', '99', '1', '0', 'phpcms', '1511962311', '1511962311', '', '');
INSERT INTO `t_video` VALUES ('37', '23', '0', '北京怀念之大胸少妇  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=37', '0', '99', '1', '0', 'phpcms', '1511962311', '1511962311', '', '');
INSERT INTO `t_video` VALUES ('38', '23', '0', '北京怀念之极品黑丝美腿  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=38', '0', '99', '1', '0', 'phpcms', '1511962312', '1511962312', '', '');
INSERT INTO `t_video` VALUES ('39', '23', '0', '东莞会所高挑美女给我做胸推口活按摩服务 网友自拍 -', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=39', '0', '99', '1', '0', 'phpcms', '1511962312', '1511962312', '', '');
INSERT INTO `t_video` VALUES ('40', '23', '0', '98年学妹细长小腿足交 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=40', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('41', '23', '0', '护士制服诱惑自慰潮喷  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=41', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('42', '23', '0', '偷情18岁女孩差点被她姐姐看到 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=42', '0', '99', '1', '0', 'phpcms', '1511962300', '1511962300', '', '');
INSERT INTO `t_video` VALUES ('43', '23', '0', '常年累月我在足疗店的专属技师 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=43', '0', '99', '1', '0', 'phpcms', '1511962302', '1511962302', '', '');
INSERT INTO `t_video` VALUES ('44', '23', '0', '宾馆约的小骚货 摸摸就出水 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=44', '0', '99', '1', '0', 'phpcms', '1511962302', '1511962302', '', '');
INSERT INTO `t_video` VALUES ('45', '23', '0', '农村泡澡推油，另一番风情 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=45', '0', '99', '1', '0', 'phpcms', '1511962304', '1511962304', '', '');
INSERT INTO `t_video` VALUES ('46', '23', '0', '黑絲抱著插 香奈兒  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=46', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('47', '23', '0', '紅衣幼師藤浦惠 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=47', '0', '99', '1', '0', 'phpcms', '1511962304', '1511962304', '', '');
INSERT INTO `t_video` VALUES ('48', '23', '0', '潮吹女王野外露出小树林野战  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=48', '0', '99', '1', '0', 'phpcms', '1511962306', '1511962306', '', '');
INSERT INTO `t_video` VALUES ('49', '23', '0', '偷情第二炮老婆查岗 直接就给吓出来了 网友自拍 - 得', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=49', '0', '99', '1', '0', 'phpcms', '1511962306', '1511962306', '', '');
INSERT INTO `t_video` VALUES ('50', '23', '0', '极品女神酒店阳台大胆深喉口爆 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=50', '0', '99', '1', '0', 'phpcms', '1511962307', '1511962307', '', '');
INSERT INTO `t_video` VALUES ('51', '23', '0', '跪下来给我舔 躺着让我操 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=51', '0', '99', '1', '0', 'phpcms', '1511962307', '1511962307', '', '');
INSERT INTO `t_video` VALUES ('52', '23', '0', '高颜值混血金融白领 一身骚 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=52', '0', '99', '1', '0', 'phpcms', '1511962308', '1511962308', '', '');
INSERT INTO `t_video` VALUES ('53', '23', '0', '口交超大鸡吧根本吞不下去 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=53', '0', '99', '1', '0', 'phpcms', '1511962308', '1511962308', '', '');
INSERT INTO `t_video` VALUES ('54', '23', '0', '约炮172CM豪乳性感黑丝模特 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=54', '0', '99', '1', '0', 'phpcms', '1511962310', '1511962310', '', '');
INSERT INTO `t_video` VALUES ('55', '23', '0', '卖衣服的足交，技术不熟练 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=55', '0', '99', '1', '0', 'phpcms', '1511962310', '1511962310', '', '');
INSERT INTO `t_video` VALUES ('56', '23', '0', '小骚货高潮胡乱叫喊  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=56', '0', '99', '1', '0', 'phpcms', '1511962311', '1511962311', '', '');
INSERT INTO `t_video` VALUES ('57', '23', '0', '北京怀念之大胸少妇  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=57', '0', '99', '1', '0', 'phpcms', '1511962311', '1511962311', '', '');
INSERT INTO `t_video` VALUES ('58', '23', '0', '北京怀念之极品黑丝美腿  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=58', '0', '99', '1', '0', 'phpcms', '1511962312', '1511962312', '', '');
INSERT INTO `t_video` VALUES ('59', '23', '0', '东莞会所高挑美女给我做胸推口活按摩服务 网友自拍 -', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=59', '0', '99', '1', '0', 'phpcms', '1511962312', '1511962312', '', '');
INSERT INTO `t_video` VALUES ('60', '23', '0', '98年学妹细长小腿足交 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=60', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('61', '23', '0', '护士制服诱惑自慰潮喷  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=61', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('62', '23', '0', 'KTV唱歌认识的朋友的朋友晚上去开房 网友自拍 - 得爱', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=62', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('63', '23', '0', '上海学生妹丝足服务上门 裸足足交 学生妹 很爽 网友', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=63', '0', '99', '1', '0', 'phpcms', '1511962314', '1511962314', '', '');
INSERT INTO `t_video` VALUES ('64', '23', '0', '黑絲抱著插 香奈兒  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=64', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('65', '23', '0', '曾经的前女友 很多年了在见面不说别的先做爱 网友自拍', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=65', '0', '99', '1', '0', 'phpcms', '1511962314', '1511962314', '', '');
INSERT INTO `t_video` VALUES ('66', '23', '0', '出来约炮别人家的女人什么都愿意配合 网友自拍 - 得爱', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=66', '0', '99', '1', '0', 'phpcms', '1511962316', '1511962316', '', '');
INSERT INTO `t_video` VALUES ('67', '23', '0', '高端会所一个漂亮的胸推妹子 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=67', '0', '99', '1', '0', 'phpcms', '1511962316', '1511962316', '', '');
INSERT INTO `t_video` VALUES ('68', '23', '0', '喜欢做爱的美女看过来 百分百满足 网友自拍 - 得爱射', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=68', '0', '99', '1', '0', 'phpcms', '1511962317', '1511962317', '', '');
INSERT INTO `t_video` VALUES ('69', '23', '0', '木浴盆大战，你们见过这样的浴盆吗 网友自拍 - 得爱射', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=69', '0', '99', '1', '0', 'phpcms', '1511962317', '1511962317', '', '');
INSERT INTO `t_video` VALUES ('70', '23', '0', '每去一个地方都能找到个有小姐姐的酒店 网友自拍 - 得', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=70', '0', '99', '1', '0', 'phpcms', '1511962318', '1511962318', '', '');
INSERT INTO `t_video` VALUES ('71', '23', '0', '骚逼说不洗鸡巴不给我口  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=71', '0', '99', '1', '0', 'phpcms', '1511962318', '1511962318', '', '');
INSERT INTO `t_video` VALUES ('72', '23', '0', '滴蜡捆绑轻微SM叫声娇喘 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=72', '0', '99', '1', '0', 'phpcms', '1511962319', '1511962319', '', '');
INSERT INTO `t_video` VALUES ('73', '23', '0', '青岛 骚货她要自慰给我看 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=73', '0', '99', '1', '0', 'phpcms', '1511962319', '1511962319', '', '');
INSERT INTO `t_video` VALUES ('74', '23', '0', '高清口交，多体位爆操 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=74', '0', '99', '1', '0', 'phpcms', '1511962320', '1511962320', '', '');
INSERT INTO `t_video` VALUES ('75', '23', '0', '换妻俱乐部群P大战一触即发 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=75', '0', '99', '1', '0', 'phpcms', '1511962320', '1511962320', '', '');
INSERT INTO `t_video` VALUES ('76', '23', '0', '8合1让你一次撸个够 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=76', '0', '99', '1', '0', 'phpcms', '1511962322', '1511962322', '', '');
INSERT INTO `t_video` VALUES ('77', '23', '0', '西安丝袜会所小姐好爽姐撸的我 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=77', '0', '99', '1', '0', 'phpcms', '1511962322', '1511962322', '', '');
INSERT INTO `t_video` VALUES ('78', '23', '0', '情趣嫩B特写内射射太多了一直往外流 网友自拍 - 得爱', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=78', '0', '99', '1', '0', 'phpcms', '1511962323', '1511962323', '', '');
INSERT INTO `t_video` VALUES ('79', '23', '0', '巨乳妹想啪啪啪了来个哥哥呗 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=79', '0', '99', '1', '0', 'phpcms', '1511962323', '1511962323', '', '');
INSERT INTO `t_video` VALUES ('80', '23', '0', '舞蹈老师身体柔软姿势万千 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=80', '0', '99', '1', '0', 'phpcms', '1511962324', '1511962324', '', '');
INSERT INTO `t_video` VALUES ('81', '23', '0', 'KTV唱歌认识的朋友的朋友晚上去开房 网友自拍 - 得爱', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=81', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('82', '23', '0', '乡下理发店大姐推油打飞机 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=82', '0', '99', '1', '0', 'phpcms', '1511962324', '1511962324', '', '');
INSERT INTO `t_video` VALUES ('83', '23', '0', '上海学生妹丝足服务上门 裸足足交 学生妹 很爽 网友', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=83', '0', '99', '1', '0', 'phpcms', '1511962314', '1511962314', '', '');
INSERT INTO `t_video` VALUES ('84', '23', '0', '曾经的前女友 很多年了在见面不说别的先做爱 网友自拍', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=84', '0', '99', '1', '0', 'phpcms', '1511962314', '1511962314', '', '');
INSERT INTO `t_video` VALUES ('85', '23', '0', '出来约炮别人家的女人什么都愿意配合 网友自拍 - 得爱', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=85', '0', '99', '1', '0', 'phpcms', '1511962316', '1511962316', '', '');
INSERT INTO `t_video` VALUES ('86', '23', '0', '高端会所一个漂亮的胸推妹子 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=86', '0', '99', '1', '0', 'phpcms', '1511962316', '1511962316', '', '');
INSERT INTO `t_video` VALUES ('87', '23', '0', '喜欢做爱的美女看过来 百分百满足 网友自拍 - 得爱射', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=87', '0', '99', '1', '0', 'phpcms', '1511962317', '1511962317', '', '');
INSERT INTO `t_video` VALUES ('88', '23', '0', '木浴盆大战，你们见过这样的浴盆吗 网友自拍 - 得爱射', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=88', '0', '99', '1', '0', 'phpcms', '1511962317', '1511962317', '', '');
INSERT INTO `t_video` VALUES ('89', '23', '0', '每去一个地方都能找到个有小姐姐的酒店 网友自拍 - 得', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=89', '0', '99', '1', '0', 'phpcms', '1511962318', '1511962318', '', '');
INSERT INTO `t_video` VALUES ('90', '23', '0', '骚逼说不洗鸡巴不给我口  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=90', '0', '99', '1', '0', 'phpcms', '1511962318', '1511962318', '', '');
INSERT INTO `t_video` VALUES ('91', '23', '0', '滴蜡捆绑轻微SM叫声娇喘 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=91', '0', '99', '1', '0', 'phpcms', '1511962319', '1511962319', '', '');
INSERT INTO `t_video` VALUES ('92', '23', '0', '青岛 骚货她要自慰给我看 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=92', '0', '99', '1', '0', 'phpcms', '1511962319', '1511962319', '', '');
INSERT INTO `t_video` VALUES ('93', '23', '0', '高清口交，多体位爆操 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=93', '0', '99', '1', '0', 'phpcms', '1511962320', '1511962320', '', '');
INSERT INTO `t_video` VALUES ('94', '23', '0', '换妻俱乐部群P大战一触即发 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=94', '0', '99', '1', '0', 'phpcms', '1511962320', '1511962320', '', '');
INSERT INTO `t_video` VALUES ('95', '23', '0', '8合1让你一次撸个够 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=95', '0', '99', '1', '0', 'phpcms', '1511962322', '1511962322', '', '');
INSERT INTO `t_video` VALUES ('96', '23', '0', '西安丝袜会所小姐好爽姐撸的我 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=96', '0', '99', '1', '0', 'phpcms', '1511962322', '1511962322', '', '');
INSERT INTO `t_video` VALUES ('97', '23', '0', '情趣嫩B特写内射射太多了一直往外流 网友自拍 - 得爱', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=97', '0', '99', '1', '0', 'phpcms', '1511962323', '1511962323', '', '');
INSERT INTO `t_video` VALUES ('98', '23', '0', '巨乳妹想啪啪啪了来个哥哥呗 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=98', '0', '99', '1', '0', 'phpcms', '1511962323', '1511962323', '', '');
INSERT INTO `t_video` VALUES ('99', '23', '0', '舞蹈老师身体柔软姿势万千 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=99', '0', '99', '1', '0', 'phpcms', '1511962324', '1511962324', '', '');
INSERT INTO `t_video` VALUES ('100', '23', '0', '乡下理发店大姐推油打飞机 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=23&id=100', '0', '99', '1', '0', 'phpcms', '1511962324', '1511962324', '', '');
INSERT INTO `t_video` VALUES ('101', '24', '0', '妩媚小女人丝袜按摩口暴 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=101', '0', '99', '1', '0', 'phpcms', '1511962300', '1511962300', '', '');
INSERT INTO `t_video` VALUES ('102', '24', '0', '偷情18岁女孩差点被她姐姐看到 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=102', '0', '99', '1', '0', 'phpcms', '1511962300', '1511962300', '', '');
INSERT INTO `t_video` VALUES ('103', '24', '0', '常年累月我在足疗店的专属技师 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=103', '0', '99', '1', '0', 'phpcms', '1511962302', '1511962302', '', '');
INSERT INTO `t_video` VALUES ('104', '24', '0', '宾馆约的小骚货 摸摸就出水 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=104', '0', '99', '1', '0', 'phpcms', '1511962302', '1511962302', '', '');
INSERT INTO `t_video` VALUES ('105', '24', '0', '农村泡澡推油，另一番风情 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=105', '0', '99', '1', '0', 'phpcms', '1511962304', '1511962304', '', '');
INSERT INTO `t_video` VALUES ('106', '24', '0', '紅衣幼師藤浦惠 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=106', '0', '99', '1', '0', 'phpcms', '1511962304', '1511962304', '', '');
INSERT INTO `t_video` VALUES ('107', '24', '0', '潮吹女王野外露出小树林野战  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=107', '0', '99', '1', '0', 'phpcms', '1511962306', '1511962306', '', '');
INSERT INTO `t_video` VALUES ('108', '24', '0', '偷情第二炮老婆查岗 直接就给吓出来了 网友自拍 - 得', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=108', '0', '99', '1', '0', 'phpcms', '1511962306', '1511962306', '', '');
INSERT INTO `t_video` VALUES ('109', '24', '0', '极品女神酒店阳台大胆深喉口爆 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=109', '0', '99', '1', '0', 'phpcms', '1511962307', '1511962307', '', '');
INSERT INTO `t_video` VALUES ('110', '24', '0', '跪下来给我舔 躺着让我操 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=110', '0', '99', '1', '0', 'phpcms', '1511962307', '1511962307', '', '');
INSERT INTO `t_video` VALUES ('111', '24', '0', '高颜值混血金融白领 一身骚 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=111', '0', '99', '1', '0', 'phpcms', '1511962308', '1511962308', '', '');
INSERT INTO `t_video` VALUES ('112', '24', '0', '口交超大鸡吧根本吞不下去 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=112', '0', '99', '1', '0', 'phpcms', '1511962308', '1511962308', '', '');
INSERT INTO `t_video` VALUES ('113', '24', '0', '约炮172CM豪乳性感黑丝模特 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=113', '0', '99', '1', '0', 'phpcms', '1511962310', '1511962310', '', '');
INSERT INTO `t_video` VALUES ('114', '24', '0', '卖衣服的足交，技术不熟练 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=114', '0', '99', '1', '0', 'phpcms', '1511962310', '1511962310', '', '');
INSERT INTO `t_video` VALUES ('115', '24', '0', '小骚货高潮胡乱叫喊  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=115', '0', '99', '1', '0', 'phpcms', '1511962311', '1511962311', '', '');
INSERT INTO `t_video` VALUES ('116', '24', '0', '北京怀念之大胸少妇  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=116', '0', '99', '1', '0', 'phpcms', '1511962311', '1511962311', '', '');
INSERT INTO `t_video` VALUES ('117', '24', '0', '北京怀念之极品黑丝美腿  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=117', '0', '99', '1', '0', 'phpcms', '1511962312', '1511962312', '', '');
INSERT INTO `t_video` VALUES ('118', '24', '0', '东莞会所高挑美女给我做胸推口活按摩服务 网友自拍 -', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=118', '0', '99', '1', '0', 'phpcms', '1511962312', '1511962312', '', '');
INSERT INTO `t_video` VALUES ('119', '24', '0', '妩媚小女人丝袜按摩口暴 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=119', '0', '99', '1', '0', 'phpcms', '1511962300', '1511962300', '', '');
INSERT INTO `t_video` VALUES ('120', '24', '0', '98年学妹细长小腿足交 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=120', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('121', '24', '0', '护士制服诱惑自慰潮喷  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=121', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('122', '24', '0', '偷情18岁女孩差点被她姐姐看到 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=122', '0', '99', '1', '0', 'phpcms', '1511962300', '1511962300', '', '');
INSERT INTO `t_video` VALUES ('123', '24', '0', '常年累月我在足疗店的专属技师 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=123', '0', '99', '1', '0', 'phpcms', '1511962302', '1511962302', '', '');
INSERT INTO `t_video` VALUES ('124', '24', '0', '宾馆约的小骚货 摸摸就出水 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=124', '0', '99', '1', '0', 'phpcms', '1511962302', '1511962302', '', '');
INSERT INTO `t_video` VALUES ('125', '24', '0', '农村泡澡推油，另一番风情 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=125', '0', '99', '1', '0', 'phpcms', '1511962304', '1511962304', '', '');
INSERT INTO `t_video` VALUES ('126', '24', '0', '紅衣幼師藤浦惠 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=126', '0', '99', '1', '0', 'phpcms', '1511962304', '1511962304', '', '');
INSERT INTO `t_video` VALUES ('127', '24', '0', '潮吹女王野外露出小树林野战  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=127', '0', '99', '1', '0', 'phpcms', '1511962306', '1511962306', '', '');
INSERT INTO `t_video` VALUES ('128', '24', '0', '偷情第二炮老婆查岗 直接就给吓出来了 网友自拍 - 得', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=128', '0', '99', '1', '0', 'phpcms', '1511962306', '1511962306', '', '');
INSERT INTO `t_video` VALUES ('129', '24', '0', '极品女神酒店阳台大胆深喉口爆 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=129', '0', '99', '1', '0', 'phpcms', '1511962307', '1511962307', '', '');
INSERT INTO `t_video` VALUES ('130', '24', '0', '跪下来给我舔 躺着让我操 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=130', '0', '99', '1', '0', 'phpcms', '1511962307', '1511962307', '', '');
INSERT INTO `t_video` VALUES ('131', '24', '0', '高颜值混血金融白领 一身骚 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=131', '0', '99', '1', '0', 'phpcms', '1511962308', '1511962308', '', '');
INSERT INTO `t_video` VALUES ('132', '24', '0', '口交超大鸡吧根本吞不下去 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=132', '0', '99', '1', '0', 'phpcms', '1511962308', '1511962308', '', '');
INSERT INTO `t_video` VALUES ('133', '24', '0', '约炮172CM豪乳性感黑丝模特 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=133', '0', '99', '1', '0', 'phpcms', '1511962310', '1511962310', '', '');
INSERT INTO `t_video` VALUES ('134', '24', '0', '卖衣服的足交，技术不熟练 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=134', '0', '99', '1', '0', 'phpcms', '1511962310', '1511962310', '', '');
INSERT INTO `t_video` VALUES ('135', '24', '0', '小骚货高潮胡乱叫喊  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=135', '0', '99', '1', '0', 'phpcms', '1511962311', '1511962311', '', '');
INSERT INTO `t_video` VALUES ('136', '24', '0', '北京怀念之大胸少妇  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=136', '0', '99', '1', '0', 'phpcms', '1511962311', '1511962311', '', '');
INSERT INTO `t_video` VALUES ('137', '24', '0', '北京怀念之极品黑丝美腿  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=137', '0', '99', '1', '0', 'phpcms', '1511962312', '1511962312', '', '');
INSERT INTO `t_video` VALUES ('138', '24', '0', '东莞会所高挑美女给我做胸推口活按摩服务 网友自拍 -', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=138', '0', '99', '1', '0', 'phpcms', '1511962312', '1511962312', '', '');
INSERT INTO `t_video` VALUES ('139', '24', '0', '98年学妹细长小腿足交 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=139', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('140', '24', '0', '护士制服诱惑自慰潮喷  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=140', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('141', '24', '0', '黑絲抱著插 香奈兒  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=141', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('142', '24', '0', 'KTV唱歌认识的朋友的朋友晚上去开房 网友自拍 - 得爱', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=142', '0', '99', '1', '0', 'phpcms', '1511962313', '1511962313', '', '');
INSERT INTO `t_video` VALUES ('143', '24', '0', '上海学生妹丝足服务上门 裸足足交 学生妹 很爽 网友', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=143', '0', '99', '1', '0', 'phpcms', '1511962314', '1511962314', '', '');
INSERT INTO `t_video` VALUES ('144', '24', '0', '曾经的前女友 很多年了在见面不说别的先做爱 网友自拍', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=144', '0', '99', '1', '0', 'phpcms', '1511962314', '1511962314', '', '');
INSERT INTO `t_video` VALUES ('145', '24', '0', '出来约炮别人家的女人什么都愿意配合 网友自拍 - 得爱', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=145', '0', '99', '1', '0', 'phpcms', '1511962316', '1511962316', '', '');
INSERT INTO `t_video` VALUES ('146', '24', '0', '高端会所一个漂亮的胸推妹子 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=146', '0', '99', '1', '0', 'phpcms', '1511962316', '1511962316', '', '');
INSERT INTO `t_video` VALUES ('147', '24', '0', '喜欢做爱的美女看过来 百分百满足 网友自拍 - 得爱射', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=147', '0', '99', '1', '0', 'phpcms', '1511962317', '1511962317', '', '');
INSERT INTO `t_video` VALUES ('148', '24', '0', '木浴盆大战，你们见过这样的浴盆吗 网友自拍 - 得爱射', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=148', '0', '99', '1', '0', 'phpcms', '1511962317', '1511962317', '', '');
INSERT INTO `t_video` VALUES ('149', '24', '0', '每去一个地方都能找到个有小姐姐的酒店 网友自拍 - 得', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=149', '0', '99', '1', '0', 'phpcms', '1511962318', '1511962318', '', '');
INSERT INTO `t_video` VALUES ('150', '24', '0', '骚逼说不洗鸡巴不给我口  网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=150', '0', '99', '1', '0', 'phpcms', '1511962318', '1511962318', '', '');
INSERT INTO `t_video` VALUES ('151', '24', '0', '滴蜡捆绑轻微SM叫声娇喘 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=151', '0', '99', '1', '0', 'phpcms', '1511962319', '1511962319', '', '');
INSERT INTO `t_video` VALUES ('152', '24', '0', '青岛 骚货她要自慰给我看 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=152', '0', '99', '1', '0', 'phpcms', '1511962319', '1511962319', '', '');
INSERT INTO `t_video` VALUES ('153', '24', '0', '高清口交，多体位爆操 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=153', '0', '99', '1', '0', 'phpcms', '1511962320', '1511962320', '', '');
INSERT INTO `t_video` VALUES ('154', '24', '0', '换妻俱乐部群P大战一触即发 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=154', '0', '99', '1', '0', 'phpcms', '1511962320', '1511962320', '', '');
INSERT INTO `t_video` VALUES ('155', '24', '0', '8合1让你一次撸个够 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=155', '0', '99', '1', '0', 'phpcms', '1511962322', '1511962322', '', '');
INSERT INTO `t_video` VALUES ('156', '24', '0', '西安丝袜会所小姐好爽姐撸的我 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=156', '0', '99', '1', '0', 'phpcms', '1511962322', '1511962322', '', '');
INSERT INTO `t_video` VALUES ('157', '24', '0', '情趣嫩B特写内射射太多了一直往外流 网友自拍 - 得爱', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=157', '0', '99', '1', '0', 'phpcms', '1511962323', '1511962323', '', '');
INSERT INTO `t_video` VALUES ('158', '24', '0', '巨乳妹想啪啪啪了来个哥哥呗 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=158', '0', '99', '1', '0', 'phpcms', '1511962323', '1511962323', '', '');
INSERT INTO `t_video` VALUES ('159', '24', '0', '舞蹈老师身体柔软姿势万千 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=159', '0', '99', '1', '0', 'phpcms', '1511962324', '1511962324', '', '');
INSERT INTO `t_video` VALUES ('160', '24', '0', '乡下理发店大姐推油打飞机 网友自拍 - 得爱射在线视频', '', '', '', '', '0', 'http://www.test.com/index.php?m=content&c=index&a=show&catid=24&id=160', '0', '99', '1', '0', 'phpcms', '1511962324', '1511962324', '', '');

-- ----------------------------
-- Table structure for `t_video_content`
-- ----------------------------
DROP TABLE IF EXISTS `t_video_content`;
CREATE TABLE `t_video_content` (
  `contentid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `videoid` (`videoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_video_content
-- ----------------------------

-- ----------------------------
-- Table structure for `t_video_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_video_data`;
CREATE TABLE `t_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `video_url` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_video_data
-- ----------------------------
INSERT INTO `t_video_data` VALUES ('1', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('2', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('3', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('4', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('5', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('6', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('7', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('8', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('9', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('10', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('11', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('12', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('13', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('14', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('15', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('16', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('17', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('18', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('19', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('20', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('21', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('22', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('23', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('24', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('25', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('26', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('27', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('28', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('30', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('29', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('31', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('32', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('33', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('34', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('35', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('36', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('37', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('38', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('39', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('40', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('41', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('42', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('43', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('44', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('45', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('46', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('47', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('48', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('49', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('50', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('51', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('52', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('53', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('54', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('55', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('56', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('57', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('58', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('59', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('60', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('61', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('62', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('63', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('64', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('65', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('66', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('67', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('68', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('69', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('70', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('71', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('72', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('73', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('74', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('75', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('76', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('77', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('78', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('79', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('80', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('81', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('82', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('83', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('84', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('85', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('86', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('87', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('88', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('89', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('90', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('91', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('92', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('93', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('94', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('95', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('96', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('97', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('98', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('99', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('100', '', '0', '', '2', '0', '', '0', '1', '', '0', '');
INSERT INTO `t_video_data` VALUES ('101', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2288.mp4');
INSERT INTO `t_video_data` VALUES ('102', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2287.mp4');
INSERT INTO `t_video_data` VALUES ('103', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2286.mp4');
INSERT INTO `t_video_data` VALUES ('104', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2285.mp4');
INSERT INTO `t_video_data` VALUES ('105', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2284.mp4');
INSERT INTO `t_video_data` VALUES ('106', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2293.mp4');
INSERT INTO `t_video_data` VALUES ('107', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2292.mp4');
INSERT INTO `t_video_data` VALUES ('108', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2291.mp4');
INSERT INTO `t_video_data` VALUES ('109', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2290.mp4');
INSERT INTO `t_video_data` VALUES ('110', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2289.mp4');
INSERT INTO `t_video_data` VALUES ('111', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2298.mp4');
INSERT INTO `t_video_data` VALUES ('112', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2297.mp4');
INSERT INTO `t_video_data` VALUES ('113', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2296.mp4');
INSERT INTO `t_video_data` VALUES ('114', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2295.mp4');
INSERT INTO `t_video_data` VALUES ('115', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2294.mp4');
INSERT INTO `t_video_data` VALUES ('116', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2303.mp4');
INSERT INTO `t_video_data` VALUES ('117', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2302.mp4');
INSERT INTO `t_video_data` VALUES ('118', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2301.mp4');
INSERT INTO `t_video_data` VALUES ('120', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2300.mp4');
INSERT INTO `t_video_data` VALUES ('119', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2288.mp4');
INSERT INTO `t_video_data` VALUES ('121', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2299.mp4');
INSERT INTO `t_video_data` VALUES ('122', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2287.mp4');
INSERT INTO `t_video_data` VALUES ('123', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2286.mp4');
INSERT INTO `t_video_data` VALUES ('124', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2285.mp4');
INSERT INTO `t_video_data` VALUES ('125', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2284.mp4');
INSERT INTO `t_video_data` VALUES ('126', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2293.mp4');
INSERT INTO `t_video_data` VALUES ('127', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2292.mp4');
INSERT INTO `t_video_data` VALUES ('128', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2291.mp4');
INSERT INTO `t_video_data` VALUES ('129', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2290.mp4');
INSERT INTO `t_video_data` VALUES ('130', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2289.mp4');
INSERT INTO `t_video_data` VALUES ('131', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2298.mp4');
INSERT INTO `t_video_data` VALUES ('132', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2297.mp4');
INSERT INTO `t_video_data` VALUES ('133', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2296.mp4');
INSERT INTO `t_video_data` VALUES ('134', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2295.mp4');
INSERT INTO `t_video_data` VALUES ('135', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2294.mp4');
INSERT INTO `t_video_data` VALUES ('136', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2303.mp4');
INSERT INTO `t_video_data` VALUES ('137', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2302.mp4');
INSERT INTO `t_video_data` VALUES ('138', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2301.mp4');
INSERT INTO `t_video_data` VALUES ('139', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2300.mp4');
INSERT INTO `t_video_data` VALUES ('140', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/07/p2299.mp4');
INSERT INTO `t_video_data` VALUES ('141', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2308.mp4');
INSERT INTO `t_video_data` VALUES ('142', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2307.mp4');
INSERT INTO `t_video_data` VALUES ('143', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2306.mp4');
INSERT INTO `t_video_data` VALUES ('144', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2305.mp4');
INSERT INTO `t_video_data` VALUES ('145', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2304.mp4');
INSERT INTO `t_video_data` VALUES ('146', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2313.mp4');
INSERT INTO `t_video_data` VALUES ('147', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2312.mp4');
INSERT INTO `t_video_data` VALUES ('148', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2311.mp4');
INSERT INTO `t_video_data` VALUES ('149', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2310.mp4');
INSERT INTO `t_video_data` VALUES ('150', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2309.mp4');
INSERT INTO `t_video_data` VALUES ('151', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2318.mp4');
INSERT INTO `t_video_data` VALUES ('152', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2317.mp4');
INSERT INTO `t_video_data` VALUES ('153', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2316.mp4');
INSERT INTO `t_video_data` VALUES ('154', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2315.mp4');
INSERT INTO `t_video_data` VALUES ('155', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2314.mp4');
INSERT INTO `t_video_data` VALUES ('156', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2323.mp4');
INSERT INTO `t_video_data` VALUES ('157', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2322.mp4');
INSERT INTO `t_video_data` VALUES ('158', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2321.mp4');
INSERT INTO `t_video_data` VALUES ('159', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2320.mp4');
INSERT INTO `t_video_data` VALUES ('160', '', '0', '', '2', '0', '', '0', '1', '', '0', 'http://v4.pipib.net:8088/08/p2319.mp4');

-- ----------------------------
-- Table structure for `t_video_store`
-- ----------------------------
DROP TABLE IF EXISTS `t_video_store`;
CREATE TABLE `t_video_store` (
  `videoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(60) NOT NULL,
  `vid` char(40) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `picpath` char(120) NOT NULL,
  `size` char(20) NOT NULL,
  `timelen` mediumint(9) NOT NULL DEFAULT '0',
  `userupload` tinyint(1) NOT NULL DEFAULT '0',
  `channelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`videoid`),
  KEY `videoid` (`videoid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_video_store
-- ----------------------------

-- ----------------------------
-- Table structure for `t_vote_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_vote_data`;
CREATE TABLE `t_vote_data` (
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) NOT NULL,
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `data` text NOT NULL,
  `userinfo` text NOT NULL,
  KEY `subjectid` (`subjectid`),
  KEY `userid` (`userid`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vote_data
-- ----------------------------

-- ----------------------------
-- Table structure for `t_vote_option`
-- ----------------------------
DROP TABLE IF EXISTS `t_vote_option`;
CREATE TABLE `t_vote_option` (
  `optionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `listorder` tinyint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`optionid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vote_option
-- ----------------------------

-- ----------------------------
-- Table structure for `t_vote_subject`
-- ----------------------------
DROP TABLE IF EXISTS `t_vote_subject`;
CREATE TABLE `t_vote_subject` (
  `subjectid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subject` char(255) NOT NULL,
  `ismultiple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ischeckbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromdate` date NOT NULL DEFAULT '0000-00-00',
  `todate` date NOT NULL DEFAULT '0000-00-00',
  `interval` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` char(20) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowguest` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maxval` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `minval` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `optionnumber` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `votenumber` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`subjectid`),
  KEY `enabled` (`enabled`),
  KEY `fromdate` (`fromdate`,`todate`),
  KEY `todate` (`todate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vote_subject
-- ----------------------------

-- ----------------------------
-- Table structure for `t_wap`
-- ----------------------------
DROP TABLE IF EXISTS `t_wap`;
CREATE TABLE `t_wap` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `sitename` char(30) NOT NULL,
  `logo` char(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `setting` mediumtext,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wap
-- ----------------------------
INSERT INTO `t_wap` VALUES ('1', 'PHPCMS手机门户', '/statics/images/wap/wlogo.gif', '', 'array (\n  \'listnum\' => \'10\',\n  \'thumb_w\' => \'220\',\n  \'thumb_h\' => \'0\',\n  \'c_num\' => \'1000\',\n  \'index_template\' => \'index\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n)', '0');

-- ----------------------------
-- Table structure for `t_wap_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_wap_type`;
CREATE TABLE `t_wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wap_type
-- ----------------------------

-- ----------------------------
-- Table structure for `t_workflow`
-- ----------------------------
DROP TABLE IF EXISTS `t_workflow`;
CREATE TABLE `t_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_workflow
-- ----------------------------
INSERT INTO `t_workflow` VALUES ('1', '1', '1', '一级审核', '审核一次', '', '0');
INSERT INTO `t_workflow` VALUES ('2', '1', '2', '二级审核', '审核两次', '', '0');
INSERT INTO `t_workflow` VALUES ('3', '1', '3', '三级审核', '审核三次', '', '0');
INSERT INTO `t_workflow` VALUES ('4', '1', '4', '四级审核', '四级审核', '', '0');
