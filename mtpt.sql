/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : mtpt

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2013-10-04 01:15:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `adclicks`
-- ----------------------------
DROP TABLE IF EXISTS `adclicks`;
CREATE TABLE `adclicks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `adid` int(11) unsigned default NULL,
  `userid` int(11) unsigned default NULL,
  `added` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adclicks
-- ----------------------------

-- ----------------------------
-- Table structure for `adminpanel`
-- ----------------------------
DROP TABLE IF EXISTS `adminpanel`;
CREATE TABLE `adminpanel` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(128) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `info` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminpanel
-- ----------------------------
INSERT INTO `adminpanel` VALUES ('1', '添加用户', 'adduser.php', '添加一个新用户');
INSERT INTO `adminpanel` VALUES ('3', '重置用户密码', 'reset.php', '当用户申请密码搞忘时重置用户密码');
INSERT INTO `adminpanel` VALUES ('4', '全站发信', 'staffmess.php', '给全站用户发送站内信');
INSERT INTO `adminpanel` VALUES ('6', '查看投票', 'polloverview.php', '查看投票统计信息');
INSERT INTO `adminpanel` VALUES ('7', '被警告用户', 'warned.php', '查看被tracker警告过的用户');
INSERT INTO `adminpanel` VALUES ('8', '免费种子设定', 'freeleech.php', '设定种子为特殊状态');
INSERT INTO `adminpanel` VALUES ('9', 'FAQ 管理', 'faqmanage.php', '编辑FAQ 页面');
INSERT INTO `adminpanel` VALUES ('10', '规则管理', 'modrules.php', '编辑规则页面');
INSERT INTO `adminpanel` VALUES ('11', '分类管理', 'catmanage.php', '管理种子分类');
INSERT INTO `adminpanel` VALUES ('12', '用户搜索', 'searchuser.php', '用户搜索');
INSERT INTO `adminpanel` VALUES ('13', '删除搜索关键字', 'delkeywords.php', '删除用户搜索的关键字记录');
INSERT INTO `adminpanel` VALUES ('14', '增加上传量', 'amountupload.php', '增加上传量');

-- ----------------------------
-- Table structure for `advertisements`
-- ----------------------------
DROP TABLE IF EXISTS `advertisements`;
CREATE TABLE `advertisements` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `enabled` tinyint(1) NOT NULL default '0',
  `type` enum('bbcodes','xhtml','text','image','flash') NOT NULL,
  `position` enum('header','footer','belownav','belowsearchbox','torrentdetail','comment','interoverforums','forumpost','popup','shoutindex','shoutlogin') NOT NULL,
  `displayorder` tinyint(3) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `parameters` text NOT NULL,
  `code` text NOT NULL,
  `starttime` datetime default NULL,
  `endtime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `agent_allowed_exception`
-- ----------------------------
DROP TABLE IF EXISTS `agent_allowed_exception`;
CREATE TABLE `agent_allowed_exception` (
  `family_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(100) NOT NULL default '',
  `peer_id` varchar(20) NOT NULL,
  `agent` varchar(100) NOT NULL,
  `comment` varchar(200) NOT NULL default '',
  KEY `family_id` (`family_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent_allowed_exception
-- ----------------------------
INSERT INTO `agent_allowed_exception` VALUES ('16', 'uTorrent 1.80B (Build 6838)', '-UT180B-', 'uTorrent/180B(6838)', 'buggy build that always seeding bad request');
INSERT INTO `agent_allowed_exception` VALUES ('16', 'uTorrent 1.83', '-UT183B-', 'uTorrent/183B(14809)', 'PTLiar use this agent.');

-- ----------------------------
-- Table structure for `agent_allowed_family`
-- ----------------------------
DROP TABLE IF EXISTS `agent_allowed_family`;
CREATE TABLE `agent_allowed_family` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `family` varchar(50) NOT NULL default '',
  `start_name` varchar(100) NOT NULL default '',
  `peer_id_pattern` varchar(200) NOT NULL,
  `peer_id_match_num` tinyint(3) unsigned NOT NULL,
  `peer_id_matchtype` enum('dec','hex') NOT NULL default 'dec',
  `peer_id_start` varchar(20) NOT NULL,
  `agent_pattern` varchar(200) NOT NULL,
  `agent_match_num` tinyint(3) unsigned NOT NULL,
  `agent_matchtype` enum('dec','hex') NOT NULL default 'dec',
  `agent_start` varchar(100) NOT NULL,
  `exception` enum('yes','no') NOT NULL default 'no',
  `allowhttps` enum('yes','no') NOT NULL default 'no',
  `comment` varchar(200) NOT NULL default '',
  `hits` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent_allowed_family
-- ----------------------------
INSERT INTO `agent_allowed_family` VALUES ('1', 'Azureus 2.5.0.4', 'Azureus 2.5.0.4', '/^-AZ2504-/', '0', 'dec', '-AZ2504-', '/^Azureus 2.5.0.4/', '0', 'dec', 'Azureus 2.5.0.4', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('2', 'Ktorrent 4.0.x', 'Ktorrent 4.0.x', '/^-KT4([0-9])([0-9])([0-9])-/', '0', 'dec', '-KT4000-', '/^KTorrent\\/4\\.([0-9])\\.([0-9])/', '0', 'dec', 'KTorrent/4.0.0', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('3', 'Bittorrent 6.x', 'Bittorrent 6.0.1', '/^M6-([0-9])-([0-9])--/', '2', 'dec', 'M6-0-1--', '/^BitTorrent\\/6([0-9])([0-9])([0-9])/', '3', 'dec', 'BitTorrent/6010', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('4', 'Deluge 0.x', 'Deluge 0.5.8.9', '/^-DE0([0-9])([0-9])([0-9])-/', '3', 'dec', '-DE0589-', '/^Deluge 0\\.([0-9])\\.([0-9])\\.([0-9])/', '3', 'dec', 'Deluge 0.5.8.9', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('5', 'Transmission1.x', 'Transmission 1.06 (build 5136)', '/^-TR1([0-9])([0-9])([0-9])-/', '3', 'dec', '-TR1060-', '/^Transmission\\/1\\.([0-9])([0-9])/', '3', 'dec', 'Transmission/1.06', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('6', 'RTorrent 0.x(with libtorrent 0.x)', 'rTorrent 0.8.0 (with libtorrent 0.12.0)', '/^-lt([0-9A-E])([0-9A-E])([0-9A-E])([0-9A-E])-/', '4', 'hex', '-lt0C00-', '/^rtorrent\\/0\\.([0-9])\\.([0-9])\\/0\\.([1-9][0-9]*)\\.(0|[1-9][0-9]*)/', '4', 'dec', 'rtorrent/0.8.0/0.12.0', 'no', 'no', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('7', 'Rufus 0.x', 'Rufus 0.6.9', '', '0', 'dec', '', '/^Rufus\\/0\\.([0-9])\\.([0-9])/', '2', 'dec', 'Rufus/0.6.9', 'no', 'no', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('8', 'Azureus 3.x', 'Azureus 3.0.5.0', '/^-AZ3([0-9])([0-9])([0-9])-/', '3', 'dec', '-AZ3050-', '/^Azureus 3\\.([0-9])\\.([0-9])\\.([0-9])/', '3', 'dec', 'Azureus 3.0.5.0', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('9', 'uTorrent 1.7.x', 'uTorrent 1.7.5', '/^-UT17([0-9])([0-9])-/', '2', 'dec', '-UT1750-', '/^uTorrent\\/17([0-9])([0-9])/', '2', 'dec', 'uTorrent/1750', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('10', 'BitRocket 0.x', 'BitRocket 0.3.3(32)', '/^-BR0([0-9])([1-9][0-9]*)-/', '2', 'dec', '-BR0332-', '/^BitRocket\\/0\\.([0-9])\\.([0-9])\\(([1-9][0-9]*)\\) libtorrent\\/0\\.([1-9][0-9]*)\\.(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)/', '6', 'dec', 'BitRocket/0.3.3(32) libtorrent/0.13.0.0', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('11', 'MLDonkey 2.9.x', 'MLDonkey 2.9.2', '/^-ML2\\.9\\.([0-9])-/', '1', 'dec', '-ML2.9.2-', '/^MLDonkey\\/2\\.9\\.([0-9])/', '1', 'dec', 'MLDonkey/2.9.2', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('12', 'uTorrent 1.8.x', 'uTorrent 1.8.0', '/^-UT18([0-9])([0-9])-/', '2', 'dec', '-UT1800-', '/^uTorrent\\/18([0-9])([0-9])/', '2', 'dec', 'uTorrent/1800', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('13', 'Azureus 4.x', 'Vuze 4.0.0.2', '/^-AZ4([0-9])([0-9])([0-9])-/', '3', 'dec', '-AZ4002-', '/^Azureus 4\\.([0-9])\\.([0-9])\\.([0-9])/', '3', 'dec', 'Azureus 4.0.0.2', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('14', 'SymTorrent', '', '', '0', 'dec', '', '/^SymTorrent/', '0', 'dec', 'SymTorrent', 'no', 'no', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('15', 'Deluge 1.x', 'Deluge 1.1.6', '/^-DE1([0-9])([0-9])([0-9])-/', '3', 'dec', '-DE1160-', '/^Deluge 1\\.([0-9])\\.([0-9])/', '2', 'dec', 'Deluge 1.1.6', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('16', 'uTorrent 1.8xB', 'uTorrent 1.80 Beta (build 9137)', '/^-UT18([0-9])B-/', '1', 'dec', '-UT180B-', '/^uTorrent\\/18([0-9])B\\(([1-9][0-9]*)\\)/', '2', 'dec', 'uTorrent/180B(9137)', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('17', 'uTorrent 2.x.x', 'uTorrent 2.0(build 17624)', '/^-UT2([0-9])([0-9])([0-9])-/', '3', 'dec', '-UT2000-', '/^uTorrent\\/2([0-9])([0-9])([0-9])/', '3', 'dec', 'uTorrent/2000', 'no', 'yes', '', '1');
INSERT INTO `agent_allowed_family` VALUES ('19', 'uTorrent 3.x', 'uTorrent 3.0', '/^-UT3([0-9])([0-9])([0-9])-/', '3', 'dec', '-UT3000-', '/^uTorrent\\/3([0-9])([0-9])([0-9])/', '3', 'dec', 'uTorrent/3000', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('18', 'uTorrent 3.x.xB', 'uTorrent 3.0 Beta', '/^-UT3([0-9])([0-9])B-/', '2', 'dec', '-UT300B-', '/^uTorrent\\/3([0-9])([0-9])B/', '2', 'dec', 'uTorrent/300B', 'no', 'yes', '', '0');
INSERT INTO `agent_allowed_family` VALUES ('20', 'Transmission2.x', 'Transmission 2.00', '/^-TR2([0-9])([0-9])([0-9])-/', '3', 'dec', '-TR2000-', '/^Transmission\\/2\\.([0-9])([0-9])/', '3', 'dec', 'Transmission/2.00', 'no', 'yes', '', '0');

-- ----------------------------
-- Table structure for `allowedemails`
-- ----------------------------
DROP TABLE IF EXISTS `allowedemails`;
CREATE TABLE `allowedemails` (
  `id` int(10) NOT NULL auto_increment,
  `value` mediumtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `attachments`
-- ----------------------------
DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `width` smallint(6) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `filename` varchar(255) NOT NULL default '',
  `dlkey` char(32) NOT NULL,
  `filetype` varchar(50) NOT NULL default '',
  `filesize` bigint(20) unsigned NOT NULL default '0',
  `location` varchar(255) NOT NULL,
  `downloads` mediumint(8) NOT NULL default '0',
  `isimage` tinyint(1) unsigned NOT NULL default '0',
  `thumb` tinyint(1) unsigned NOT NULL default '0',
  `inuse` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `pid` (`userid`,`id`),
  KEY `dateline` (`added`,`isimage`,`downloads`),
  KEY `dlkey` (`dlkey`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `audiocodecs`
-- ----------------------------
DROP TABLE IF EXISTS `audiocodecs`;
CREATE TABLE `audiocodecs` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of audiocodecs
-- ----------------------------
INSERT INTO `audiocodecs` VALUES ('1', 'FLAC', '', '0');
INSERT INTO `audiocodecs` VALUES ('2', 'APE', '', '0');
INSERT INTO `audiocodecs` VALUES ('3', 'DTS', '', '0');
INSERT INTO `audiocodecs` VALUES ('4', 'MP3', '', '0');
INSERT INTO `audiocodecs` VALUES ('5', 'OGG', '', '0');
INSERT INTO `audiocodecs` VALUES ('6', 'AAC', '', '0');
INSERT INTO `audiocodecs` VALUES ('7', 'Other', '', '0');

-- ----------------------------
-- Table structure for `avps`
-- ----------------------------
DROP TABLE IF EXISTS `avps`;
CREATE TABLE `avps` (
  `arg` varchar(20) NOT NULL default '',
  `value_s` text NOT NULL,
  `value_i` int(11) NOT NULL default '0',
  `value_u` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`arg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of avps
-- ----------------------------
INSERT INTO `avps` VALUES ('lastcleantime', '', '0', '1380819357');
INSERT INTO `avps` VALUES ('lastcleantime2', '', '0', '1380819937');
INSERT INTO `avps` VALUES ('lastcleantime3', '', '0', '1380819937');
INSERT INTO `avps` VALUES ('lastcleantime4', '', '0', '1380819937');
INSERT INTO `avps` VALUES ('lastcleantime5', '', '0', '1380819937');

-- ----------------------------
-- Table structure for `bannedemails`
-- ----------------------------
DROP TABLE IF EXISTS `bannedemails`;
CREATE TABLE `bannedemails` (
  `id` int(10) NOT NULL auto_increment,
  `value` mediumtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bannedemails
-- ----------------------------

-- ----------------------------
-- Table structure for `bans`
-- ----------------------------
DROP TABLE IF EXISTS `bans`;
CREATE TABLE `bans` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `addedby` mediumint(8) unsigned NOT NULL default '0',
  `comment` varchar(255) NOT NULL default '',
  `first` bigint(20) NOT NULL,
  `last` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `first_last` (`first`,`last`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bans
-- ----------------------------

-- ----------------------------
-- Table structure for `bitbucket`
-- ----------------------------
DROP TABLE IF EXISTS `bitbucket`;
CREATE TABLE `bitbucket` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `owner` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `public` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bitbucket
-- ----------------------------

-- ----------------------------
-- Table structure for `blocks`
-- ----------------------------
DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `blockid` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `userfriend` (`userid`,`blockid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blocks
-- ----------------------------

-- ----------------------------
-- Table structure for `bonusapp`
-- ----------------------------
DROP TABLE IF EXISTS `bonusapp`;
CREATE TABLE `bonusapp` (
  `userid` int(10) NOT NULL,
  `namecharge` int(10) NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bonusapp
-- ----------------------------

-- ----------------------------
-- Table structure for `bookmarks`
-- ----------------------------
DROP TABLE IF EXISTS `bookmarks`;
CREATE TABLE `bookmarks` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `torrentid` mediumint(8) unsigned NOT NULL default '0',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `userid_torrentid` (`userid`,`torrentid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookmarks
-- ----------------------------

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `mode` tinyint(3) unsigned NOT NULL default '1',
  `class_name` varchar(255) NOT NULL default '',
  `name` varchar(30) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_index` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mode_sort` (`mode`,`sort_index`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('401', '4', 'c_movies', '电影', 'movies_dvdr.png', '0');
INSERT INTO `categories` VALUES ('402', '4', 'c_tvseries', '剧集', 'tvseries_xvid.png', '1');
INSERT INTO `categories` VALUES ('403', '4', 'c_tvshows', '综艺', 'tvshows.png', '2');
INSERT INTO `categories` VALUES ('404', '4', 'c_doc', '纪录片', 'doc.png', '8');
INSERT INTO `categories` VALUES ('405', '4', 'c_anime', '动漫', 'anime.png', '3');
INSERT INTO `categories` VALUES ('406', '4', 'c_mv', 'MV', 'musicvideos.png', '9');
INSERT INTO `categories` VALUES ('407', '4', 'c_sports', '体育', 'sports.png', '6');
INSERT INTO `categories` VALUES ('408', '4', 'c_hqaudio', '软件', 'appz.png', '9');
INSERT INTO `categories` VALUES ('409', '4', 'c_misc', '其他', 'misc.png', '19');
INSERT INTO `categories` VALUES ('410', '4', 'c_game', '游戏', 'games_pc.png', '10');
INSERT INTO `categories` VALUES ('411', '4', 'c_doucument', '学习', 'study.png', '16');
INSERT INTO `categories` VALUES ('423', '4', '', '原创', 'movies_bd.png', '17');
INSERT INTO `categories` VALUES ('414', '4', '', '音乐', 'music.png', '4');

-- ----------------------------
-- Table structure for `caticons`
-- ----------------------------
DROP TABLE IF EXISTS `caticons`;
CREATE TABLE `caticons` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `folder` varchar(255) NOT NULL,
  `cssfile` varchar(255) NOT NULL default '',
  `multilang` enum('yes','no') NOT NULL default 'no',
  `secondicon` enum('yes','no') NOT NULL default 'no',
  `designer` varchar(50) NOT NULL default '',
  `comment` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caticons
-- ----------------------------
INSERT INTO `caticons` VALUES ('1', '标准', 'scenetorrents/', 'pic/category/chd/scenetorrents/catsprites.css', 'yes', 'no', 'NexusPHP', 'Modified from SceneTorrents');

-- ----------------------------
-- Table structure for `cheaters`
-- ----------------------------
DROP TABLE IF EXISTS `cheaters`;
CREATE TABLE `cheaters` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `torrentid` mediumint(8) unsigned NOT NULL default '0',
  `uploaded` bigint(20) unsigned NOT NULL default '0',
  `downloaded` bigint(20) unsigned NOT NULL default '0',
  `anctime` mediumint(8) unsigned NOT NULL default '0',
  `seeders` mediumint(5) unsigned NOT NULL default '0',
  `leechers` mediumint(8) unsigned NOT NULL default '0',
  `hit` tinyint(3) unsigned NOT NULL default '0',
  `dealtby` mediumint(8) unsigned NOT NULL default '0',
  `dealtwith` tinyint(1) NOT NULL default '0',
  `comment` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cheaters
-- ----------------------------

-- ----------------------------
-- Table structure for `chronicle`
-- ----------------------------
DROP TABLE IF EXISTS `chronicle`;
CREATE TABLE `chronicle` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `txt` text,
  PRIMARY KEY  (`id`),
  KEY `added` (`added`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chronicle
-- ----------------------------

-- ----------------------------
-- Table structure for `codecs`
-- ----------------------------
DROP TABLE IF EXISTS `codecs`;
CREATE TABLE `codecs` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of codecs
-- ----------------------------
INSERT INTO `codecs` VALUES ('1', 'H.264', '0');
INSERT INTO `codecs` VALUES ('2', 'VC-1', '0');
INSERT INTO `codecs` VALUES ('3', 'Xvid', '0');
INSERT INTO `codecs` VALUES ('4', 'MPEG-2', '0');
INSERT INTO `codecs` VALUES ('5', 'Other', '0');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user` mediumint(8) unsigned NOT NULL default '0',
  `torrent` mediumint(8) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `text` text,
  `ori_text` text,
  `editedby` mediumint(8) unsigned NOT NULL default '0',
  `editdate` datetime NOT NULL default '0000-00-00 00:00:00',
  `offer` mediumint(8) unsigned NOT NULL default '0',
  `request` mediumint(9) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `user` (`user`),
  KEY `torrent_id` (`torrent`,`id`),
  KEY `offer_id` (`offer`,`id`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for `countries`
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `flagpic` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('1', 'Sweden', 'sweden.gif');
INSERT INTO `countries` VALUES ('2', 'United States of America', 'usa.gif');
INSERT INTO `countries` VALUES ('3', 'Russia', 'russia.gif');
INSERT INTO `countries` VALUES ('4', 'Finland', 'finland.gif');
INSERT INTO `countries` VALUES ('5', 'Canada', 'canada.gif');
INSERT INTO `countries` VALUES ('6', 'France', 'france.gif');
INSERT INTO `countries` VALUES ('7', 'Germany', 'germany.gif');
INSERT INTO `countries` VALUES ('8', '中国', 'china.gif');
INSERT INTO `countries` VALUES ('9', 'Italy', 'italy.gif');
INSERT INTO `countries` VALUES ('10', 'Denmark', 'denmark.gif');
INSERT INTO `countries` VALUES ('11', 'Norway', 'norway.gif');
INSERT INTO `countries` VALUES ('12', 'United Kingdom', 'uk.gif');
INSERT INTO `countries` VALUES ('13', 'Ireland', 'ireland.gif');
INSERT INTO `countries` VALUES ('14', 'Poland', 'poland.gif');
INSERT INTO `countries` VALUES ('15', 'Netherlands', 'netherlands.gif');
INSERT INTO `countries` VALUES ('16', 'Belgium', 'belgium.gif');
INSERT INTO `countries` VALUES ('17', 'Japan', 'japan.gif');
INSERT INTO `countries` VALUES ('18', 'Brazil', 'brazil.gif');
INSERT INTO `countries` VALUES ('19', 'Argentina', 'argentina.gif');
INSERT INTO `countries` VALUES ('20', 'Australia', 'australia.gif');
INSERT INTO `countries` VALUES ('21', 'New Zealand', 'newzealand.gif');
INSERT INTO `countries` VALUES ('23', 'Spain', 'spain.gif');
INSERT INTO `countries` VALUES ('24', 'Portugal', 'portugal.gif');
INSERT INTO `countries` VALUES ('25', 'Mexico', 'mexico.gif');
INSERT INTO `countries` VALUES ('26', 'Singapore', 'singapore.gif');
INSERT INTO `countries` VALUES ('70', 'India', 'india.gif');
INSERT INTO `countries` VALUES ('65', 'Albania', 'albania.gif');
INSERT INTO `countries` VALUES ('29', 'South Africa', 'southafrica.gif');
INSERT INTO `countries` VALUES ('30', 'South Korea', 'southkorea.gif');
INSERT INTO `countries` VALUES ('31', 'Jamaica', 'jamaica.gif');
INSERT INTO `countries` VALUES ('32', 'Luxembourg', 'luxembourg.gif');
INSERT INTO `countries` VALUES ('34', 'Belize', 'belize.gif');
INSERT INTO `countries` VALUES ('35', 'Algeria', 'algeria.gif');
INSERT INTO `countries` VALUES ('36', 'Angola', 'angola.gif');
INSERT INTO `countries` VALUES ('37', 'Austria', 'austria.gif');
INSERT INTO `countries` VALUES ('38', 'Yugoslavia', 'yugoslavia.gif');
INSERT INTO `countries` VALUES ('39', 'Western Samoa', 'westernsamoa.gif');
INSERT INTO `countries` VALUES ('40', 'Malaysia', 'malaysia.gif');
INSERT INTO `countries` VALUES ('41', 'Dominican Republic', 'dominicanrep.gif');
INSERT INTO `countries` VALUES ('42', 'Greece', 'greece.gif');
INSERT INTO `countries` VALUES ('43', 'Guatemala', 'guatemala.gif');
INSERT INTO `countries` VALUES ('44', 'Israel', 'israel.gif');
INSERT INTO `countries` VALUES ('45', 'Pakistan', 'pakistan.gif');
INSERT INTO `countries` VALUES ('46', 'Czech Republic', 'czechrep.gif');
INSERT INTO `countries` VALUES ('47', 'Serbia', 'serbia.gif');
INSERT INTO `countries` VALUES ('48', 'Seychelles', 'seychelles.gif');
INSERT INTO `countries` VALUES ('50', 'Puerto Rico', 'puertorico.gif');
INSERT INTO `countries` VALUES ('51', 'Chile', 'chile.gif');
INSERT INTO `countries` VALUES ('52', 'Cuba', 'cuba.gif');
INSERT INTO `countries` VALUES ('53', 'Congo', 'congo.gif');
INSERT INTO `countries` VALUES ('54', 'Afghanistan', 'afghanistan.gif');
INSERT INTO `countries` VALUES ('55', 'Turkey', 'turkey.gif');
INSERT INTO `countries` VALUES ('56', 'Uzbekistan', 'uzbekistan.gif');
INSERT INTO `countries` VALUES ('57', 'Switzerland', 'switzerland.gif');
INSERT INTO `countries` VALUES ('58', 'Kiribati', 'kiribati.gif');
INSERT INTO `countries` VALUES ('59', 'Philippines', 'philippines.gif');
INSERT INTO `countries` VALUES ('60', 'Burkina Faso', 'burkinafaso.gif');
INSERT INTO `countries` VALUES ('61', 'Nigeria', 'nigeria.gif');
INSERT INTO `countries` VALUES ('62', 'Iceland', 'iceland.gif');
INSERT INTO `countries` VALUES ('63', 'Nauru', 'nauru.gif');
INSERT INTO `countries` VALUES ('64', 'Slovenia', 'slovenia.gif');
INSERT INTO `countries` VALUES ('66', 'Turkmenistan', 'turkmenistan.gif');
INSERT INTO `countries` VALUES ('67', 'Bosnia Herzegovina', 'bosniaherzegovina.gif');
INSERT INTO `countries` VALUES ('68', 'Andorra', 'andorra.gif');
INSERT INTO `countries` VALUES ('69', 'Lithuania', 'lithuania.gif');
INSERT INTO `countries` VALUES ('71', 'Netherlands Antilles', 'nethantilles.gif');
INSERT INTO `countries` VALUES ('72', 'Ukraine', 'ukraine.gif');
INSERT INTO `countries` VALUES ('73', 'Venezuela', 'venezuela.gif');
INSERT INTO `countries` VALUES ('74', 'Hungary', 'hungary.gif');
INSERT INTO `countries` VALUES ('75', 'Romania', 'romania.gif');
INSERT INTO `countries` VALUES ('76', 'Vanuatu', 'vanuatu.gif');
INSERT INTO `countries` VALUES ('77', 'Vietnam', 'vietnam.gif');
INSERT INTO `countries` VALUES ('78', 'Trinidad & Tobago', 'trinidadandtobago.gif');
INSERT INTO `countries` VALUES ('79', 'Honduras', 'honduras.gif');
INSERT INTO `countries` VALUES ('80', 'Kyrgyzstan', 'kyrgyzstan.gif');
INSERT INTO `countries` VALUES ('81', 'Ecuador', 'ecuador.gif');
INSERT INTO `countries` VALUES ('82', 'Bahamas', 'bahamas.gif');
INSERT INTO `countries` VALUES ('83', 'Peru', 'peru.gif');
INSERT INTO `countries` VALUES ('84', 'Cambodia', 'cambodia.gif');
INSERT INTO `countries` VALUES ('85', 'Barbados', 'barbados.gif');
INSERT INTO `countries` VALUES ('86', 'Bangladesh', 'bangladesh.gif');
INSERT INTO `countries` VALUES ('87', 'Laos', 'laos.gif');
INSERT INTO `countries` VALUES ('88', 'Uruguay', 'uruguay.gif');
INSERT INTO `countries` VALUES ('89', 'Antigua Barbuda', 'antiguabarbuda.gif');
INSERT INTO `countries` VALUES ('90', 'Paraguay', 'paraguay.gif');
INSERT INTO `countries` VALUES ('93', 'Thailand', 'thailand.gif');
INSERT INTO `countries` VALUES ('92', 'Union of Soviet Socialist Republics', 'ussr.gif');
INSERT INTO `countries` VALUES ('94', 'Senegal', 'senegal.gif');
INSERT INTO `countries` VALUES ('95', 'Togo', 'togo.gif');
INSERT INTO `countries` VALUES ('96', 'North Korea', 'northkorea.gif');
INSERT INTO `countries` VALUES ('97', 'Croatia', 'croatia.gif');
INSERT INTO `countries` VALUES ('98', 'Estonia', 'estonia.gif');
INSERT INTO `countries` VALUES ('99', 'Colombia', 'colombia.gif');
INSERT INTO `countries` VALUES ('100', 'Lebanon', 'lebanon.gif');
INSERT INTO `countries` VALUES ('101', 'Latvia', 'latvia.gif');
INSERT INTO `countries` VALUES ('102', 'Costa Rica', 'costarica.gif');
INSERT INTO `countries` VALUES ('103', 'Egypt', 'egypt.gif');
INSERT INTO `countries` VALUES ('104', 'Bulgaria', 'bulgaria.gif');
INSERT INTO `countries` VALUES ('105', 'Isla de Muerte', 'jollyroger.gif');
INSERT INTO `countries` VALUES ('107', 'Pirates', 'jollyroger.gif');

-- ----------------------------
-- Table structure for `downloadspeed`
-- ----------------------------
DROP TABLE IF EXISTS `downloadspeed`;
CREATE TABLE `downloadspeed` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of downloadspeed
-- ----------------------------
INSERT INTO `downloadspeed` VALUES ('4', '512kbps');
INSERT INTO `downloadspeed` VALUES ('5', '768kbps');
INSERT INTO `downloadspeed` VALUES ('6', '1Mbps');
INSERT INTO `downloadspeed` VALUES ('7', '1.5Mbps');
INSERT INTO `downloadspeed` VALUES ('8', '2Mbps');
INSERT INTO `downloadspeed` VALUES ('9', '3Mbps');
INSERT INTO `downloadspeed` VALUES ('10', '4Mbps');
INSERT INTO `downloadspeed` VALUES ('12', '6Mbps');
INSERT INTO `downloadspeed` VALUES ('14', '8Mbps');
INSERT INTO `downloadspeed` VALUES ('16', '10Mbps');
INSERT INTO `downloadspeed` VALUES ('17', '48Mbps');
INSERT INTO `downloadspeed` VALUES ('18', '100Mbit');

-- ----------------------------
-- Table structure for `drawlottery`
-- ----------------------------
DROP TABLE IF EXISTS `drawlottery`;
CREATE TABLE `drawlottery` (
  `id` int(10) NOT NULL auto_increment,
  `num1` int(10) NOT NULL default '0',
  `num2` int(10) NOT NULL default '0',
  `num3` int(10) NOT NULL default '0',
  `num4` int(10) NOT NULL default '0',
  `num5` int(10) NOT NULL default '0',
  `drawtime` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of drawlottery
-- ----------------------------

-- ----------------------------
-- Table structure for `faq`
-- ----------------------------
DROP TABLE IF EXISTS `faq`;
CREATE TABLE `faq` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `link_id` smallint(5) unsigned NOT NULL,
  `lang_id` smallint(5) unsigned NOT NULL default '6',
  `type` enum('categ','item') NOT NULL default 'item',
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL default '1',
  `categ` smallint(5) unsigned NOT NULL default '0',
  `order` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=488 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of faq
-- ----------------------------
INSERT INTO `faq` VALUES ('1', '1', '25', 'categ', '基本问题', '', '1', '0', '1');
INSERT INTO `faq` VALUES ('2', '2', '25', 'categ', '用户信息', '', '1', '0', '2');
INSERT INTO `faq` VALUES ('3', '3', '25', 'categ', '数据统计', '', '1', '0', '3');
INSERT INTO `faq` VALUES ('4', '4', '25', 'categ', '发布', '', '1', '0', '4');
INSERT INTO `faq` VALUES ('5', '5', '25', 'categ', '下载', '', '1', '0', '5');
INSERT INTO `faq` VALUES ('6', '6', '25', 'categ', '我该怎样提升下载速度？', '', '0', '0', '6');
INSERT INTO `faq` VALUES ('7', '7', '25', 'categ', '我的网络提供商（ISP）使用了透明代理。我应该怎么做？', '', '0', '0', '7');
INSERT INTO `faq` VALUES ('8', '8', '25', 'categ', '为什么我连不上？难道我被网站屏蔽了？', '', '0', '0', '8');
INSERT INTO `faq` VALUES ('9', '9', '25', 'categ', '如果从这里找不到我的问题的解答，我该怎么办？', '', '1', '0', '9');
INSERT INTO `faq` VALUES ('10', '10', '25', 'item', '什么是PT？', 'PT（Private Tracker）下载其实也是BT下载的一种，在有限的范围内，下载的用户基本都可以达到自己带宽的上限。PT下载还通过论坛制度的约束机制将BT的设计理念现实化，真正让用户做到下载的过程中努力上传。因此，PT下载的速度很快，能够让用户带宽得到最大程度的使用，而且种子时效长。', '1', '1', '1');
INSERT INTO `faq` VALUES ('11', '11', '25', 'item', '从这里下载的数据需要流量费用么？', '不需要 !!! 当前学校对IPV6的优惠政策是不计费；\r\n另外我们是校园网内下载，所以即便是ipv4也不扣流量费。', '1', '1', '2');
INSERT INTO `faq` VALUES ('13', '13', '25', 'item', '我注册了一个账号但是却没有收到验证邮件！', '这很有可能是Tracker所在的服务器网络出现了问题。你可以填写<a href=\"confirm_resend.php\" class=\"faqlink\">这个表格</a>让服务器重发验证邮件。<br />\r\n通常没有得到确认的注册帐户会在24小时后被删除，所以你可以在第二天重试。需要注意的是，如果你第一次没有收到确认信，第二次有很大的可能仍然无法收到确认信，所以换一个E-mail地址是一个不错的主意。', '0', '2', '1');
INSERT INTO `faq` VALUES ('14', '14', '25', 'item', '我忘记了我的用户名/密码了，能帮我找回来么？', '请填写<a class=\"faqlink\" href=\"recover.php\">这个表单</a>，我们将把登录详情发还给你。', '1', '2', '2');
INSERT INTO `faq` VALUES ('15', '15', '25', 'item', '我可以给我的账号改个名字么？', '我们并不建议给账号改名。\r\n<br />\r\n如果一定需要请阅读此贴<a class=\"faqlink\" href=http://pt.nwsuaf6.edu.cn/forums.php?action=viewtopic&forumid=7&topicid=4245>点击进入</a>', '3', '2', '3');
INSERT INTO `faq` VALUES ('16', '16', '25', 'item', '我已经通过候选上传了一个种子.为什么等级又降回来了?', '通过候选等级提升一天是为了方便用户发布资源</a>\r\n每天系统都会判定一次用户等级</a>\r\n这时候等级依然按照上面的等级规定判定.</a>\r\n所以说通过候选之后等级只是暂时提升一天', '3', '2', '4');
INSERT INTO `faq` VALUES ('17', '17', '25', 'item', '那么，什么是我的分享率（Ratio）？以及如何快速提高分享率?', '就在页面功能分区的下面。<br />\r\n<br />\r\n<img src=\"pic/ratio.png\" alt=\"ratio\" />\r\n<br />\r\n<br />\r\n区分你的整体分享率和独立分享率是很重要的。整体分享率关注的是自从你加入站点以来，账号的整体上传与下载量。而独立分享率则针对每一个你正在下载或做种的文件。\r\n<br />\r\n<br />\r\n你可能看到两种符号来代替数字：\"Inf.\"，这个是无限（Infinity）的缩写，意思是你的下载量为0字节，而上传量则是任意一个非零的值(上传量/下载量=无穷大)；\"---\"，应该被视为“不可用”，这说明了你的下载量和上传量都是0字节。(上传量/下载量=0/0 这是一个不确定的量)。\r\n<br />\r\n<br />\r\n<br />\r\n下载置顶的免费热门种子并保种一段时间是提高分享率的好方法<br />\r\n一般两天内就能从土豆脱离出来<br />\r\n', '3', '2', '5');
INSERT INTO `faq` VALUES ('18', '18', '25', 'item', '为什么我的IP地址显示在我的个人信息页面上？', '只有你自己和网站Moderator及以上的管理员可以看到你的IP地址和Email。普通用户是看不到这些信息的。', '0', '2', '6');
INSERT INTO `faq` VALUES ('21', '21', '25', 'item', '为什么我的“可连接”是“否”？（以及为什么我需要关注这个问题？）', '首先按照以下设置检查你的utorrent客户端是否设置正确：<br />\r\n<br />\r\n<img src=\"pic/utset1.png\" alt=\"ratio\" /><br />\r\n以utorrent2.2为例，打开选项---设置<br />\r\n<br />\r\n<br />\r\n<img src=\"pic/utset2.png\" alt=\"ratio\" /><br />\r\n切换到“任务”标签，取消“启用DHT网络”、“新建时启用DHT”、“启用本地发现”；<br />\r\n勾选“向Tracker查询状态信息”、“启用用户交换”、“启用UDP tracker支持”；<br />\r\n“传出连接”设为“启用”，勾选“允许传入旧式连接”。<br />\r\n<br />\r\n<br />\r\n<img src=\"pic/utset3.png\" alt=\"ratio\" /><br />\r\n<b>切换到“高级”标签，将“net.disable_incoming_ipv6”改为\"*false\"。(有的版本为net.disable_ipv6)</b><br />\r\n<br />\r\n设置好utorrent后如果还为“否”请继续往下看：<br />\r\nTracker服务器认为你在防火墙后，或者在NAT桥接后，并且无法接收其他Peer的连接请求。\r\n<br />\r\n<br />\r\n这意味着其它的大批Peer无法连接到你，只能由你连接到他们。更糟糕的情况是，如果两个Peer都处于这样的状态，他们将完全无法连接到对方。这对于整体速度有着非常不利的影响。\r\n<br />\r\n<br />\r\n对于这个问题，有以下解决方式：对于防火墙，打开用于接收连接的端口（即你在BT客户端中定义的端口）；对于NAT，你需要配置NAT服务器使用Basic NAT方式而不是NAPT（不同的路由有着不同的运行方式。翻阅你的路由文档或客服论坛。你也可以在<a class=\"faqlink\" href=\"http://portforward.com/\">PortForward</a>找到关于此问题的大量信息）。\r\n\r\n\r\n\r\n\r\n\r\n', '2', '2', '9');
INSERT INTO `faq` VALUES ('22', '22', '25', 'item', '不同的用户等级代表了什么含义？', '<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n<td class=\"embedded\" width=\"200\" valign=\"top\">&nbsp; <b class=\"Peasant_Name\">西农土豆(Peasant)</b></td>\r\n<td class=\"embedded\" width=\"5\">&nbsp;</td>\r\n<td class=\"embedded\"> 被降级的用户，他们有30天时间来提升分享率，否则他们会被踢。不能发表趣味盒内容；不能申请友情链接；不能上传字幕。\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"User_Name\">入道新丁(User)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">新用户的默认级别。只能在每周六中午12点至每周日晚上11点59分发布种子。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"PowerUser_Name\">初学乍练(PowerUser)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">可以直接发布种子；可以查看NFO文档；可以查看用户列表； 可以发送邀请； 可以查看排行榜；可以查看其它用户的种子历史(如果用户隐私等级未设置为\"强\")； 可以删除自己上传的字幕。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"EliteUser_Name\">渐入佳境(EliteUse)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\"><b class=\"EliteUser_Name\">渐入佳境</b>及以上用户封存账号后不会被删除;可以请求续种。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"CrazyUser_Name\">炉火纯青(CrazyUser)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">可以在做种/下载/发布的时候选择匿名模式。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"InsaneUser_Name\">自成一派(InsaneUser)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">可以查看普通日志。得到一个邀请名额</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"VeteranUser_Name\">功行圆满(VeteranUse)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">可以查看其它用户的评论、帖子历史。<b class=\"VeteranUser_Name\">功行圆满</b>及以上用户会永远保留账号。得到二个邀请名额</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"ExtremeUser_Name\">登峰造极(ExtremeUser)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">可以更新过期的外部信息；得到二个邀请名额</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"UltimateUser_Name\">出神入化(UltimateUser)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">得到三个邀请名额。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"NexusMaster_Name\">绝世神人(NexusMaster)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">得到五个邀请名额。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\"  valign=\"top\">&nbsp; <img class=\"star\" src=\"pic/trans.gif\" alt=\"Star\" /></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">为网站捐款的主。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"VIP_Name\">贵宾(VIP)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">和<b class=\"NexusMaster_Name\">绝世神人</b>拥有相同权限并被认为是精英成员。免除自动降级。下载种子将不消耗麦粒（上传量和下载量记算不变）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"User_Name\">其它</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">自定义等级。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Retiree_Name\">养老族(Retiree)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">退休后的管理组成员。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Uploader_Name\">发布员(Uploader)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">专注的发布者。免除自动降级；可以查看匿名用户的真实身份。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Downloader_Name\">保种员(Downloader)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">专注的保种者。免除自动降级；可以查看匿名用户的真实身份。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Moderator_Name\">管理员(Moderator)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">可以查看管理组信箱、举报信箱；管理趣味盒内容、投票内容；可以编辑或删除任何发布的种子；可以管理候选；可以查看机密日志；可以删除任何字幕；可以管理日志中的代码、史册；可以查看用户的邀请记录；可以管理用户帐号的一般信息。<b>不能</b>管理友情链接、最近消息、论坛版块；<b>不能</b>查看用户IP或Email等机密信息；不能删除账号。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Administrator_Name\">站长(Administrator)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">除了不可以管理捐赠外，可以做任何事。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"StaffLeader_Name\">主管(Staff Leader)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">网站主管，可以做任何事。</td>\r\n</tr>\r\n</table>', '1', '2', '10');
INSERT INTO `faq` VALUES ('23', '23', '25', 'item', '提升和降级又是怎样被执行的呢？', '<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n<td class=\"embedded\" width=\"200\" valign=\"top\">&nbsp; <b class=\"Peasant_Name\">西农土豆</b></td>\r\n<td class=\"embedded\" width=\"5\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">当以下情况时将被自动降至本级：<br />\r\n1.如果你已经下载了超过50GB，你应该有大于0.4的分享率。<br />\r\n2.如果你已经下载了超过100GB，你应该有大于0.5的分享率。<br />\r\n3.如果你已经下载了超过200GB，你应该有大于0.6的分享率。<br />\r\n4.如果你已经下载了超过400GB，你应该有大于0.7的分享率。<br />\r\n5.如果你已经下载了超过800GB，你应该有大于0.8的分享率。</td>\r\n</tr>\r\n\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"PowerUser_Name\">初学乍练</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必须注册至少1周，并且下载至少10G，分享率大于1.05。<br />\r\n当条件符合时将被自动提升。注意，无论何时，如果你的分享率低于0.95，你将自动降级。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"EliteUser_Name\">渐入佳境</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必须注册至少2周，并且下载至少30G，分享率大于1.55。\r\n<br />\r\n当条件符合时将被自动提升。注意，无论何时，如果你的分享率低于1.45，你将自动降级。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"CrazyUser_Name\">炉火纯青</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必须注册至少4周，并且下载至少60G，分享率大于2.05。\r\n<br />\r\n当条件符合时将被自动提升。注意，无论何时，如果你的分享率低于1.95，你将自动降级。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"InsaneUser_Name\">自成一派</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必须注册至少8周，并且下载至少100G，分享率大于2.55。<br />\r\n当条件符合时将被自动提升。注意，无论何时，如果你的分享率低于2.45，你将自动降级。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"VeteranUser_Name\">功行圆满</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必须注册至少16周，并且下载至少400G，分享率大于3.05。<br />\r\n当条件符合时将被自动提升。注意，无论何时，如果你的分享率低于2.95，你将自动降级。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"ExtremeUser_Name\">登峰造极</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必须注册至少24周，并且下载至少1024G，分享率大于3.55。<br />\r\n当条件符合时将被自动提升。注意，无论何时，如果你的分享率低于3.45，你将自动降级。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"UltimateUser_Name\">出神入化</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必须注册至少36周，并且下载至少1536G，分享率大于4.05。<br />\r\n当条件符合时将被自动提升。注意，无论何时，如果你的分享率低于3.95，你将自动降级。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"NexusMaster_Name\">绝世神人</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必须注册至少52周，并且下载至少3075G，分享率大于4.55。<br />\r\n当条件符合时将被自动提升。注意，无论何时，如果你的分享率低于4.45，你将自动降级。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <img class=\"star\" src=\"pic/trans.gif\" alt=\"Star\" /></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">只需捐款，详见<a class=\"faqlink\" href=\"donate.php\">这里</a>。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"VIP_Name\">贵宾(VIP)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">由管理员仔细斟酌后分配给他们认为对于站点某方面有特殊贡献的用户。<br />\r\n（任何索取贵宾等级的要求将被自动无视）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"User_Name\">其它</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">用户使用魔力值兑换，或由管理员仔细斟酌后授权。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Retiree_Name\">养老族(Retiree)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">由管理员授予。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Uploader_Name\">发布员(Uploader)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">由管理员分配(参见\'发布\'部分以了解详情)。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Downloader_Name\">保种员(Downloader)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">由管理员分配(参见\'发布\'部分以了解详情)。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Moderator_Name\">管理员(Moderator)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">无需多问，我们会找到你的！</td>\r\n</tr>\r\n</table>', '1', '2', '11');
INSERT INTO `faq` VALUES ('25', '25', '25', 'item', '为什么我的朋友不能加入？', '用户数目有所限制（你可以查看“首页-&gt;站点数据-&gt;上限”）。当达到那个数目时，我们会停止接受新成员。<br />\r\n由于非活跃用户(长期不使用账号的用户)引起账号资源浪费，因此我们将清理该部分用户，为其他想加入用户腾出空间。<br />\r\n关于非活跃用户清理规则，参考<a class=\"faqlink\" href=\"rules.php\">规则</a>。', '0', '2', '7');
INSERT INTO `faq` VALUES ('26', '26', '25', 'item', '怎样自定义头像？', '首先，找一个你喜欢的图片，当然了它不能违反我们的<a class=\"faqlink\" href=\"rules.php\">规则</a>。然后你要找一个存放它的地方，比方说我们自己的<a class=\"faqlink\" href=\"bitbucket-upload.php\">上传器</a>。出于服务器负载的考虑，我们更希望你将图片上传到别的网站，然后将其URL粘贴到你的<a class=\"faqlink\" href=\"usercp.php?action=personal\">控制面板</a>的头像URL部分。 <br />\r\n<br />\r\n请不要为了仅仅测试头像而发帖。如果一切顺利，你将在你的详情页面看到它。', '0', '2', '8');
INSERT INTO `faq` VALUES ('27', '27', '25', 'item', '最常见的数据未能得到更新的原因', '<ul>\r\n<li>服务器过载/未响应。只要尝试着保持会话直到服务器恢复响应(不推荐连续手动刷新，这样会加重服务器负载)。</li>\r\n<li>你正在使用不稳定的客户端。如果你想要使用测试版或者CVS版本，你需要自己承担由此带来的风险。</li>\r\n</ul>', '1', '3', '1');
INSERT INTO `faq` VALUES ('28', '28', '25', 'item', '最佳的尝试', '<ul>\r\n<li>如果你当前正下载/上传的种子并不在你的用户详情页面中，你可以等一会或者强制进行手动更新。</li>\r\n<li>确保你正确地关闭了客户端软件，否则Tracker服务器无法收到\"event=completed\"的信号。</li>\r\n<li>如果Tracker服务器挂了，不要停止上传。只要在你退出客户端之前服务器恢复工作，所有的数据都会得到正确地更新。</li>\r\n</ul>', '1', '3', '2');
INSERT INTO `faq` VALUES ('29', '29', '25', 'item', '我可以任意选择Bittorrent客户端软件么？', '根据<a class=\"faqlink\" href=\"aboutnexus.php\">NexusPHP</a>对常见BitTorrent客户端的测试，目前本站Tracker<b>只允许</b>使用以下的BitTorrent客户端软件。<br />\r\n<a class=\"faqlink\" href=\"aboutnexus.php\">NexusPHP</a>的测试报告可<a class=\"faqlink\" href=\"http://www.nexusphp.com/wiki/%E5%AE%A2%E6%88%B7%E7%AB%AF%E6%B5%8B%E8%AF%95%E6%8A%A5%E5%91%8A\">在此查看</a>。\r\n<br />\r\n<b>Windows:</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://azureus.sourceforge.net\">Azureus</a>: 2.5.0.4, 3.0.5.0, 3.0.5.2及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://www.utorrent.com\">uTorrent</a>: 1.6.1, 1.7.5, 1.7.6, 1.7.7, 1.8Beta(Build 10364), 2.0(Build 17624)及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://www.bittorrent.com\">BitTorrent</a>: 6.0.1, 6.0.2, 6.0.3及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://deluge-torrent.org\">Deluge</a>: 0.5.9.1, 1.1.6及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://rufus.sourceforge.net\">Rufus</a>: 0.6.9, 0.7.0及后续版本</li>\r\n</ul>\r\n<b>Linux:</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://azureus.sourceforge.net\">Azureus</a>: 2.5.0.4, 3.0.5.0, 3.0.5.2及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://deluge-torrent.org\">Deluge</a>: 0.5.9.1, 1.1.6及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://rufus.sourceforge.net\">Rufus</a>: 0.6.9, 0.7.0及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://www.transmissionbt.com\">Transmission</a>: 1.21及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://libtorrent.rakshasa.no\">rTorrent</a>: 0.8.0（配合libtorrent 0.12.0或后续版本）及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://www.rahul.net/dholmes/ctorrent/\">Enhanced CTorrent</a>: 3.3.2及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://ktorrent.org/\">KTorrent</a>: 4.0.5及后续版本</li>\r\n</ul>\r\n<b>MacOS X:</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://azureus.sourceforge.net\">Azureus</a>: 2.5.0.4, 3.0.5.0, 3.0.5.2及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://www.transmissionbt.com\">Transmission</a>: 1.21及后续版本</li>\r\n<li><a class=\"faqlink\" href=\"http://sourceforge.net/projects/bitrocket/\">BitRocket</a>: 0.3.3(32)及后续版本</li>\r\n</ul>\r\n<b>Symbian (仅供测试):</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://amorg.aut.bme.hu/projects/symtorrent\">SymTorrent</a>: 1.41及后续版本</li>\r\n</ul>\r\n<br />\r\n\r\n<b>以上客户端在https支持方面</b>\r\n<ul>\r\n<li>uTorrent 1.61: 无法准确解析https的tracker, 同时在使用会将自己标识为uTorrent 1.5</li>\r\n<li>Rufus: 没有https支持, 并且已经几年没有继续开发</li>\r\n<li>rtorrent: 需要手工设置SSL证书, 详细信息请自行查阅其官方网站说明</li>\r\n</ul>\r\n\r\n<br />\r\n\r\n同时请尽量避免使用处于测试期的客户端软件, 如uTorrent 1.8.0B。\r\n\r\n为了从本站得到最好的下载体验,我们高度推荐<a class=\"faqlink\" href=\"http://www.utorrent.com/download.php\">uTorrent</a> 以及<a class=\"faqlink\" href=\"http://azureus.sourceforge.net/download.php\">Azureus</a>这两个软件的最新稳定版。', '3', '5', '3');
INSERT INTO `faq` VALUES ('30', '30', '25', 'item', '为什么我正在下载/做种的一个种子会在我的详情页面中被列出多次？', '如果因为某些原因(比方说死机，客户端失去响应)你的客户端非正常退出并且你又重新打开它，它会被分配到一个全新的Peer ID, 这样它显示为一个全新的种子。而旧的种子将永远不会收到“event=completed”或“event=stopped”的信号，因此将一直被列出直到Tracker清理超时的Peer。 无视了它就可以了，它最后会消失的。', '1', '3', '4');
INSERT INTO `faq` VALUES ('31', '31', '25', 'item', '为什么我已经完成/取消的种子仍然在我的详情页面里？', '有一些客户端，比如说TorrentStorm和Nova Torrent，在取消或者完成一个任务的时候不能向Tracker服务器正确发送信号。在那样的情况下，Tracker服务器将一直保持等待信号的状态（因此会一直列出种子的状态为做种/下载的状态）直到Tracker清理超时的Peer。无视了它就可以了，它最后会消失的。', '0', '3', '5');
INSERT INTO `faq` VALUES ('33', '33', '25', 'item', '多IP（我可以从不同的电脑登录/下载吗？）', '是的，目前Tracker服务器支持单个用户从任意个数的IP地址同时访问/下载。<br />\r\n然而，对于单种是有限制的。对于每个种子，最多允许3个做种的连接，最多只允许1个下载的连接（这意味着，对于某个种子你一次只能在一个地方下载）。', '1', '3', '1');
INSERT INTO `faq` VALUES ('36', '36', '25', 'item', '为什么我不能发布种子？', '初学乍练以上级别能正常发种<br />\r\n土豆及入道新丁请在候选区发布候选.符合规定会很快通过并且提升等级一天\r\n<br />请看<a class=\"faqlink\" href=\"rules.php\">规则</a>。<br />\r\n发种规则请看<a class=\"faqlink\" href=http://pt.nwsuaf6.edu.cn/forums.php?action=viewtopic&forumid=13&topicid=540>点击进入</a>任何不符合规则的种子都会被删除', '3', '4', '1');
INSERT INTO `faq` VALUES ('37', '37', '25', 'item', '我需要满足哪些条件才能加入发布小组呢？', '你所必须满足的条件：\r\n<ul>\r\n<li>具有稳定的资源来源</li>\r\n<li>平均每周资源发布数量不少于5个</li>\r\n</ul>\r\n你必须确保发布的文件符合以下特征:\r\n<ul>\r\n<li>不超过7天之前</li>\r\n<li>你必须要有做种的能力，或者可以确保至少有效供种24小时。</li>\r\n<li>你需要有至少达到2MBit的上传带宽。</li>\r\n</ul>\r\n如果你认为你符合以上条件，那么不要犹豫，<a class=\"faqlink\" href=\"contactstaff.php\">联系管理组</a>吧。<br />\r\n<b>记住！</b> 仔细填写你的申请！确保申请中包含你的上传速度以及你计划发布的内容的类型。<br />\r\n只有仔细填写并且经过慎重考虑的申请才会纳入我们的视野。', '1', '4', '2');
INSERT INTO `faq` VALUES ('38', '38', '25', 'item', '我可以发布你们这里的种子到别的Tracker服务器么？', '不能。我们是一个封闭的、限制用户数的社区。只有注册用户才能够使用我们的Tracker。将我们的种子文件发布到其他Tracker服务器是徒劳的，因为绝大多数试图下载这些文件的人将无法连接到我们的服务器。将我们的种子发布到其他Tracker只让那里的用户恼怒（因为无法下载）并且对我们产生敌对情绪，所以这种行为是我们是不能容忍的。<br />\r\n<br />\r\n如果其他网站的管理员向我们举报我们的种子被发布在他们的站点上，对此负责的用户将因此被移出我们的社区。<br />\r\n<br />\r\n但是对于从我们这里下载得到的文件，你可以随意操控它们（发布者明确说明为<b>独占</b>的资源除外）。你可以制作另一个种子，写入其他Tracker的地址，并发布到你喜欢的站点上。', '1', '4', '3');
INSERT INTO `faq` VALUES ('39', '39', '25', 'item', '下载来的文件该怎么打开？', '在这份<a class=\"faqlink\" href=\"formats.php\">指引</a>里面找找看吧。', '0', '5', '1');
INSERT INTO `faq` VALUES ('40', '40', '25', 'item', '我下载了一部电影，但是不明白CAM/TS/TC/SCR是什么意思?', '在这份<a class=\"faqlink\" href=\"videoformats.php\">指引</a>里面找找看吧。', '0', '5', '2');
INSERT INTO `faq` VALUES ('41', '41', '25', 'item', '为什么一个可用的种子忽然就消失了？', '以下原因都会导致这个现象的出现:<br />\r\n(<b>1</b>) 按照<a class=\"faqlink\" href=\"rules.php\">网站规则</a>，这个种子不符合规则已被删除。\r\n<br />\r\n(<b>2</b>) 发布者因为文件存在问题而删除了它。一般来说，发布者会发布一个替代的版本的。<br />\r\n(<b>3</b>) 在长时间断种后种子被自动删除了。', '1', '5', '3');
INSERT INTO `faq` VALUES ('42', '42', '25', 'item', '续种及辅种教程', '首先，感谢你有想做种跟大家分享你电脑上资源的想法，感谢你对麦田的支持。\r\n  \r\n  众所周知，如果随便发补相同的种子的话，会造成你不必要的浪费及管理员的工作量。辅种或者说补种是说如果你手上有某资源，但是别人已经发布过相同的资源在PT上，那么你就不需要利用UT重新制作种子，只需要“补种”或者“辅种”即可。\r\n  \r\n  这样做和自己发布种子效果是一样的，只是发种人不是你而已，PT的目的是分享，这也是我们的宗旨。\r\n\r\n续种和辅种的步骤都是一样的，具体如下：\r\n<ul>\r\n<li>下载种子文件。</li>\r\n<li>打开种子文件，“保存位置”选文件现在的位置，并勾选“跳过散列检测”</li>\r\n<li>μTorrent的“状态”一栏提示“已检查 ××%”</li>\r\n<li>检查完成，“tracker状态”一栏提示“工作中”，表示操作成功</li>\r\n<li>若没有提示“已检查 ××%”，请确保文件相同，并且位置没有选错。</li>\r\n</ul>\r\n以上步骤的前提是你的资源和已经发布过的资源是否完全相同\r\n<br/><b>也有可能你没开ut的时候....无人做种...别人点了请求续种<br/>\r\n这样的话你只需要打开ut让种子开始做种就行了</b>', '1', '5', '4');
INSERT INTO `faq` VALUES ('43', '43', '25', 'item', '为什么我的下载有时候停在99%?', '你所下载到的片段越多，寻找拥有你所缺少的片段的同伴就将变得越困难。这就是为什么有时候在下载即将完成的时候，速度会变得非常慢，甚至完全停止了。只要耐心等候，或早或晚剩下的部分一定能够下载到的。<br />\r\n偶尔情况下会出现不能下载的状况<br />\r\n可以点击ut面板上的文件<br />\r\n找到红色的.即未下载完成的<br />向发布者私下索要此文件放进去校验', '3', '5', '5');
INSERT INTO `faq` VALUES ('44', '44', '25', 'item', '\"former volume not mounted\"这条信息是什么意思？', '1、请确认文件保存的位置存在。比如保存到了f盘，但是电脑上并没有f盘\r\n<br />2、麦田上配置好的ut会自动把种子文件保存到d盘，请确定电脑上存在d盘，或者更改此选项为别的路径。注意最好保存，否则可能导致无法正常做种\r\n<br />\r\n总之换个地方存试试吧', '3', '5', '6');
INSERT INTO `faq` VALUES ('45', '45', '25', 'item', '100MB大小的种子，我怎么下了120MB的东西回来?', '参见哈希验证失败的那个问题。如果你的客户端收到了错误的数据，那么它将会重新下载这一部分，因此总下载量有可能比种子大小略微大一些。确保“屏蔽发送错误数据的客户端”的那个选项被打开了，这样可以减少额外的下载。', '0', '5', '7');
INSERT INTO `faq` VALUES ('46', '46', '25', 'item', '为什么我的客户端的Tracker服务器状态出现\"Your ratio is too low! You need to wait xx h to start\"的错误？', '在<b>新</b>种子被上传到Tracker服务器之后，有一些用户必须等一些时间才能开始下载。<br>\r\n这个延迟只会影响那些分享率较低且下载量大于10G的用户。<br />\r\n<br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.4</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">延迟</td>\r\n	<td class=\"embedded\" width=\"100\">24小时</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.5</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">延迟</td>\r\n	<td class=\"embedded\" width=\"100\">12小时</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.6</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">延迟</td>\r\n	<td class=\"embedded\" width=\"100\">6小时</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.8</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">延迟</td>\r\n	<td class=\"embedded\" width=\"100\">3小时</td>\r\n</tr>\r\n</table>', '0', '5', '8');
INSERT INTO `faq` VALUES ('47', '47', '25', 'item', '为什么发生了这个错误？ \"Port xxxx is blacklisted\"?', '你的客户端向Tracker服务器报告它正在使用某个默认的BT协议端口(6881-6889)或是任何其他常见P2P端口来作为连接端口。<br />\r\n<br />\r\n本站不允许这些通常被P2P协议默认使用的端口。原因是目前ISP常常对这些端口进行限速。<br />\r\n<br />\r\n被屏蔽的端口如下：<br />\r\n<br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Direct Connect</td>\r\n	<td class=\"embedded\" width=\"100\">411 - 413</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">BitTorrent</td>\r\n	<td class=\"embedded\" width=\"100\">6881 - 6889</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Kazza</td>\r\n	<td class=\"embedded\" width=\"100\">1214</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Gnutella</td>\r\n	<td class=\"embedded\" width=\"100\">6346 - 6347</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Emule</td>\r\n	<td class=\"embedded\" width=\"100\">4662</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">WinMX</td>\r\n	<td class=\"embedded\" width=\"100\">6699</td>\r\n  </tr>\r\n</table>\r\n<br />\r\n要使用我们的Tracker服务器，你必须配置你的客户端使用未在上面列出的端口范围(从49152到65535都是不错的选择，参看<a class=\"faqlink\" href=\"http://www.iana.org/assignments/port-numbers\">IANA</a>)。注意某些客户端，如Azureus 2.0.7.0或更高版本，对所有的种子都使用同一端口。而其他大多数客户端为每一个种子开放一个端口，你在选择端口范围应考虑到这个问题（一般来说端口范围小于10。设置一个过大的范围并不一定有好处，而且可能有安全隐患)。 <br />\r\n<br />\r\n这些端口是用于同伴间通信的，而非用于客户端连接到Tracker服务器。因此这个改动并不会影响你使用其他Tracker服务器（事实上，它甚至可能<i>加快</i>所有Tracker服务器上种子的速度）。你的客户端也仍然能够连接到那些使用默认端口的同伴。如果你的客户端不支持自己自定义端口，那么换一个吧。<br />\r\n<br />\r\n不要向我们询问，或者在论坛里面提问究竟应该选择什么端口。我们的用户选择的端口越随机，ISP就越难以捉摸清楚我们使用的端口，从而无法对我们的端口进行限速。如果我们只是简单地规定一个范围，那么ISP又会很快对那个范围内的端口进行限速的。<br />\r\n<br />\r\n最后还要说的是，记得在你的路由和/或防火墙上打开你选择的端口，如果你有这些东西的话。', '0', '5', '9');
INSERT INTO `faq` VALUES ('48', '48', '25', 'item', '那么这个呢？ “IO错误 - [错误号13] 许可被拒绝”？', '如果你只是想要解决这个问题的话，重新启动你的电脑应该就可以了。否则的话，继续读下去。<br />\r\n<br />\r\nIO错误指的是输入-输出错误，这是一个文件系统错误，而非来自我们的Tracker服务器。当你的客户端由于某些原因不能打开种子中未下载完成的文件时，这个错误就会发生。 通常原因是客户端的两个实例同时在运行：当上一次关闭客户端时因为某种原因它没有被真正关闭，从而始终在后台运行。因此文件被锁定，使得新的实例不能打开这个文件。<br />\r\n<br />\r\n另外一个不常出现的原因是因为老旧的FAT文件系统。某些系统崩溃可能导致未下载完成的文件损坏，接着就出现了这个错误。运行一次scandisk应该可以解决这个问题。注意，只有当你使用Windows 9X操作系统（只支持FAT文件系统）或者在Windows NT/2000/XP中使用FAT文件系统的时候才比较可能出现这个问题。NTFS文件系统要健壮许多，不太可能出现这样的问题。', '1', '5', '10');
INSERT INTO `faq` VALUES ('476', '12', '25', 'item', '为什么我无法下载本站资源？', '在网络通畅的前提下，若做种数为0则说明无人做种因此暂时无法下载.需要做种的人打开ut开始做种的时候才会有速度..可以请求续种或者试试别的资源；若做种数非0还是无法下载说明你的客户端有问题，试试这个客户端吧！<a  class=\"faqlink\" href=uTorrent221.zip>http://pt.nwsuaf6.edu.cn/uTorrent221.zip</a>（右键-“目标另存为”即可下载）。<br /><br />\r\n注意：下载完成后请 不要 立即关闭客户端，这样你在分享他人的资源时别人也可以分享你的资源，同时你的用户等级也会慢慢提升；反之，只知索取却不愿奉献，你将被自动降级直至无法下载任何资源。对待生活亦应如此。\r\n<br />\r\n<br />\r\n请先阅读新手入门<a  class=\"faqlink\" href=http://pt.nwsuaf6.edu.cn/forums.php?action=viewtopic&forumid=13&topicid=1728>点击进入</a><br /><br />第一次下载或者土豆用户下载千万不要右键另存为<br />\r\n点击左键会出现提醒分享率的页面.点击已阅读方可正常下载<br /><br />', '3', '1', '3');
INSERT INTO `faq` VALUES ('481', '77', '25', 'item', '上传下载没有速度or速度很慢', '首先请确定ut右下角显示的是绿色图标.<br />\r\n就在显示上传下载速度附近.绿色会提示网络正常\r\n<br />\r\n黄色或者红色<br />\r\n请关闭系统自带防火墙<br />\r\n并请点击设置->连接->随机端口\r\n<br />\r\n确定并且等待一段时间<br />\r\n\r\n<br />\r\n然后请确定种子有人上传<br />\r\n点击种子详情下方有做种状态<br />\r\n最后请确定上传者可连接<br />\r\n请私信上传者检查第一步<br />\r\n<br />\r\n<br />如果仍然不能解决请加新手群<br /><br />', '3', '5', '20');
INSERT INTO `faq` VALUES ('482', '78', '25', 'item', '土豆将不能下载资源了么?', '土豆用户有30天的时间提高自己的分享率<br />\r\n<br />\r\n请先阅读新手入门<a class=\"faqlink\" href=http://pt.nwsuaf6.edu.cn/forums.php?action=viewtopic&forumid=13&topicid=1728>点击进入</a><br /><br />第一次下载或者土豆用户下载千万不要右键另存为<br />\r\n点击左键会出现提醒分享率的页面.点击已阅读方可正常下载<br /><br />\r\n下载置顶的免费热门种子并保种一段时间是提高分享率的好方法<br />\r\n一般两天内就能从土豆脱离出来<br />\r\n<br />', '3', '5', '21');
INSERT INTO `faq` VALUES ('51', '51', '25', 'item', '限制上传速度', '上传速度将从以下两种方式显著影响下载速度：\r\n<ul>\r\n    <li>Bittorrent的同伴倾向于回馈那些给它们提上传的同伴。这就意味着如果A和B正在同时下载一个文件，而A又在高速向B传送数据，那么B将会尝试着回报A。因此高速上传将导致高速下载。</li>\r\n\r\n    <li>由于TCP协议的工作方式，当A正从B下载某些东西的时候，A必须不停地向B发送成功收到B所发送来的数据的信号（被称为确认──ACK ── 某种“已收到”的信息)。如果A没有发送ACK信号，那么B将暂停向A发送数据并且进入等候状态。如果A正在全速上传，很有可能没有用来发送ACK信号的带宽，因此ACK信号被耽搁。在这种情况下，过高速度的上传导致了低速的下载。</li>\r\n</ul>\r\n实际的效果是以上两个原因的结合。上传速度应该在保证ACK能正常传输的前提下被设得尽量高。 <b>一个很好的实践理论是保持上传速度在理论上限的80%。</b>你也可以细细研究什么是最适合你的速度（同时也请记住高速上传对于你的分享率很有帮助）。<br />\r\n<br />\r\n如果你正在运行一个以上的种子任务，你应该考虑的是全局上传速度。某些客户端能限制了全局上传速度，其他的则能对每一个种子分别进行设置。了解你的客户端。如果你正在使用你的电脑做别的某些应用（比方说上网或者从FTP拖东西），也需考虑一下它们对于全局上传的影响。', '1', '6', '2');
INSERT INTO `faq` VALUES ('52', '52', '25', 'item', '限制同时连接数', '某些操作系统（例如Windows 9X）对于大量连接数支持不完善，甚至有可能因此而崩溃。也有一些家用路由（尤其当运行着NAT以及/或者打开防火墙状态检查服务时）会因大量连接数而变得很慢或者崩溃。对于连接数没有固定的最佳值，你可以试试看60或者100。记住这些连接数是累加的，所以如果你的客户端运行了两个会话，这两个数字要加在一起。', '1', '6', '3');
INSERT INTO `faq` VALUES ('53', '53', '25', 'item', '限制同时上传数', '上传数难道和连接数有什么不一样吗？是的，两者是不同的。连接数限制了你的客户端所能对话以及/或者下载的同伴数。上传数则限制了你的客户端实际能上传的同伴数。理想的数值一般要比连接数低许多，并且与你的物理带宽高度相关。', '1', '6', '4');
INSERT INTO `faq` VALUES ('54', '54', '25', 'item', '那怎么办？等待一会吧', '如我们在上面所解释的，在BT下载过程中一个同伴更加倾向于回报那些上传给它的同伴。当你开始一个新的下载任务时，你没有文件片断提高给其他同伴，因此他们通常会无视你。这使得开始阶段的下载非常缓慢，由其是当你所连接到的同伴只有很少是（或者没有）做种者。一旦你获得了一些能用于共享的文件片断，下载速度会有所改观。', '1', '6', '5');
INSERT INTO `faq` VALUES ('55', '55', '25', 'item', '为什么在我下载的时候浏览网页速度如此之慢？', '你的下载带宽是有限的。如果你正在下载一个速度很快的种子，它几乎肯定将占满你的下载带宽。这是浏览网页显然就会变慢。很多BT客户端允许你限制下载速度，你可以试试。<br />\r\n<br />\r\n浏览网页只是作为举例之一，同样的问题也会出现在游戏，即时通信软件上......', '1', '6', '1');
INSERT INTO `faq` VALUES ('56', '56', '25', 'item', '什么是代理？', '基本上说，代理就是中间人。当你通过代理访问某个站点的时候，你的请求将首先被发送到代理处，然后由代理转发到你所请求的站点，而不是你直接连通到网站。下面是几种典型的代理分类（术语不是那么的规范）：<br />\r\n<br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n <tr>\r\n	<td class=\"embedded\" valign=\"top\" width=\"100\">&nbsp;透明代理</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">透明代理在客户端无需配置。他将自动把80端口的信息重定向到代理(有时候也作为非匿名代理的同义词)；</td>\r\n </tr>\r\n <tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;显式代理</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">浏览器必须经过配置才能使用代理；</td>\r\n </tr>\r\n <tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;匿名代理</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">代理将不会把客户标记发送至服务器端 (HTTP_X_FORWARDED_FOR头标志将不被发送。服务器也因此看不到你的IP)；</td>\r\n </tr>\r\n <tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;高度匿名代理</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">代理将不会把客户标记或代理标记发送至服务器端 (HTTP_X_FORWARDED_FOR和HTTP_VIA and HTTP_PROXY_CONNECTION头标志将不被发送。服务器看不到你的IP，甚至不知道你正在使用代理)；</td>\r\n </tr>\r\n <tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;公用</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">(不言自明了)。</td>\r\n </tr>\r\n</table>\r\n<br />\r\n透明代理可能是匿名的，也可能是非匿名的，且匿名也有相应的等级。', '1', '7', '1');
INSERT INTO `faq` VALUES ('57', '57', '25', 'item', '我该怎样发现自己正处于一个（透明的/匿名的）代理后面？', '试试看<a href=\"http://proxyjudge.org\" class=\"faqlink\">ProxyJudge</a>。它列出了服务器端从你这里所收到的HTTP的头标志。相关的几个标志是HTTP_CLIENT_IP，HTTP_X_FORWARDED_FOR和REMOTE_ADDR。', '1', '7', '2');
INSERT INTO `faq` VALUES ('75', '75', '25', 'item', '我的“可连接”是“否”尽管我并没有NAT或者防火墙？', 'Tracker服务器在寻找你的真实IP方面非常有天赋。但是这需要代理发送HTTP头标志HTTP_X_FORWARDED_FOR。如果你的ISP的代理没有这么做的话，Tracker服务器将把代理的IP当作你的客户端的IP。所以当你登录之后，Tracker服务器尝试连接你的客户端来确信你没有使用NAT/防火墙，服务器实际上将试图连接代理的IP（使用你的BT客户端报告的接收连接端口）。很自然地，代理服务器并没有监听那个端口。如此连接会失败，而Tracker服务器也因此认为你使用了NAT/防火墙。', '1', '7', '3');
INSERT INTO `faq` VALUES ('62', '62', '25', 'item', '也许是因为我的IP地址被列入黑名单了？', '这个网站有屏蔽被禁用户或攻击者的IP地址的功能。该功能在Apache/PHP层面上起作用，且只能屏蔽从这些地址<i>登录</i>网站。这不会阻止你<i>连接</i>到网站，更无法从底层的协议层面进行屏蔽。即便你的地址已经被列入了黑名单，你应该仍能够通过ping/traceroute命令连同服务器。如果你不能连通服务器，那么问题的原因在别处。<br />\r\n<br />\r\n如果你的IP地址因某种原因错误地被我们屏蔽了，请联系我们。', '1', '8', '1');
INSERT INTO `faq` VALUES ('63', '63', '25', 'item', '你的ISP屏蔽了本站的地址', '首先，这一般不像你的ISP的所作所为。DNS域名解析以及/或者网络问题是常见的真凶。\r\n<br />\r\n对此我们无能为力。你应该联系你的ISP（或者换一个）。记住你仍然可以通过代理访问本站，参看此常见问题关于代理的部分。在这种情况下，代理是否匿名或者使用哪个监听端口都不重要了。<br />\r\n<br />\r\n注意，你的“可连接状态”将因此一直被列为“否”，因为此时Tracker服务器无法检查你的BT客户端接收连接的状态。', '1', '8', '2');
INSERT INTO `faq` VALUES ('65', '65', '25', 'item', '不妨试试这个', '论坛同样有很多解决问题的帖子<a  class=\"faqlink\" href=http://pt.nwsuaf6.edu.cn/forums.php?action=viewforum&forumid=13>点击进入</a><br />\r\n用任何手段在<a class=\"faqlink\" href=\"forums.php\">论坛</a>发帖。通常情况下你能得到友善而有用的帮助。这里给你一些基本的指导：<ul>\r\n<li>确保你的问题的确不在这篇FAQ中。这样的发帖导致的结果就是返回这篇FAQ。</li>\r\n<li>在发帖之前，看看置顶。很多时候，还没有被我们的FAQ所收录的最新的信息都可以在那里被找到。</li>\r\n<li>帮助我们也就是帮助你自己。不要仅仅说“嘿我这里出问题了！！”提供一些详情，这样我们就不用猜测或者浪费时间来询问了。你使用的是什么客户端？什么操作系统？怎样的网络设置？如果发生了错误，是什么样的具体错误信息？有问题的种子文件是哪个？你所提供的信息越多，对你的帮助也就越容易，你的帖子也就更加容易得到回复。</li>\r\n<li>不需要说的是：保持礼貌。趾高气扬得命令别人帮助你很少会有用。</li></ul>\r\n<br /><br /><br />\r\n如果均没有解决问题请加麦田新手群.会有人为你解决问题145543216\r\n\r\n请善用论坛的搜索功能<a  class=\"faqlink\" href=http://pt.nwsuaf6.edu.cn/forums.php?action=search>点击进入</a><br />', '3', '9', '1');
INSERT INTO `faq` VALUES ('66', '66', '25', 'item', '什么是\"Your slot limit is reached! You may at most download xx torrents at the same time\"错误？', '这是“最大连接数系统”。最大连接数系统用于限制那些分享率较低且下载量大于10GB的用户的最大同时下载数。<br /><br />\r\n规则如下: <br /><br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.5</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">最大连接数</td>\r\n	<td class=\"embedded\" width=\"40\">1</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.65</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">最大连接数</td>\r\n	<td class=\"embedded\" width=\"40\">2</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.8</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">最大连接数</td>\r\n	<td class=\"embedded\" width=\"40\">3</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.95</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">最大连接数</td>\r\n	<td class=\"embedded\" width=\"40\">4</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率大于</td>\r\n	<td class=\"embedded\" width=\"40\">0.95</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">最大连接数</td>\r\n	<td class=\"embedded\" width=\"40\">无限制</td>\r\n</tr>\r\n</table>\r\n<br />\r\n无论何时，同时的上传数不设限。但是如果你当前的下载数已达到了你的最大连接数，这时开启新的做种任务，你也会收到同样的错误提示。在这种情况下，你必须先关闭一个下载任务，然后开启所有的上传任务，然后继续刚才关闭的下载任务。因为当你的连接数被占满，系统将不加验证直接拒绝任何下载或上传的请求。 <br />\r\n<br /><br />\r\n你可以在任意时间察看自己的连接数，该信息在页面顶端信息栏中被列出。', '0', '5', '12');
INSERT INTO `faq` VALUES ('67', '67', '25', 'item', '什么是密钥系统？它是怎么工作的？什么时候我需要重置我的密钥?', '密钥系统在BT客户端连接Tracker服务器时起到验证身份的作用。每一个用户都有一个系统随机生成的密钥。当用户下载某个种子文件时，他的私人密钥被添加到种子文件的Tracker服务器URL中。通过这种方式，你可以在家中或者办公室使用不同的IP来做种某个文件。\r\n    <ul><li> 如果你的密钥被泄漏，且别的用户正在使用这个密钥（即使用你的帐户）下载文件。在这种情况下，你能在你的详情页面看到你并未下载或上传的种子。</li>\r\n<li>当你的客户端崩溃，或者你的连接并没有正常被终止。在这样的情况下，就算你已经关闭了你的客户端，你仍然在你的详情页面看到正在上传/下载的记录。通常情况下这些“冗余种子”将在30分钟之内被自动清除，但是如果你马上继续你的下载而服务器又提示“You already are downloading the same torrent”的错误，那么你需要重置你的密钥，然后重新下载种子文件，之后继续下载过程。 </li></ul>\r\n\r\n\r\n\r\n', '1', '5', '13');
INSERT INTO `faq` VALUES ('68', '68', '25', 'item', '“Unknown passkey”这错误是咋回事？', '首先，如果你不是我们的注册用户，将会发生这个错误。其次，有可能你没有在登录状态下从我们的网页里下载种子文件。如果是这两种情况，只要注册一个帐号或者登录后下载种子文件就可以了。<br />\r\n另外，当你注册了一个新用户并且开始第一次下载的时候，或者你刚刚重置了你的密钥时，也可能出现这个错误。原因是系统并非实时检查密钥的改变。如果是因为这个原因，那么就让种子任务等一会儿，最后一定能收到Tracker服务器发回的成功信息。', '0', '5', '14');
INSERT INTO `faq` VALUES ('69', '69', '25', 'item', '什么时候我需要重置我的密钥?', '<ul><li> 如果你的密钥被泄漏，且别的用户正在使用这个密钥（即使用你的帐户）下载文件。在这种情况下，你能在你的详情页面看到你并未下载或上传的种子。</li>\r\n<li>当你的客户端崩溃，或者你的连接并没有正常被终止。在这样的情况下，就算你已经关闭了你的客户端，你仍然在你的详情页面看到正在上传/下载的记录。通常情况下这些“冗余种子”将在30分钟之内被自动清除，但是如果你马上继续你的下载而服务器又提示“You already are downloading the same torrent”的错误，那么你需要重置你的密钥，然后重新下载种子文件，之后继续下载过程。 </li></ul>', '1', '5', '15');
INSERT INTO `faq` VALUES ('70', '70', '25', 'item', 'DHT是什么？为什么一定要关闭这个功能？', 'DHT必须从你的客户端被禁止。DHT可能导致你的数据被错误地记录，可以视为一种作弊行为。任何使用DHT的用户将因作弊而被系统禁止。<br />\r\n幸运的是，目前Tracker服务器会自动分析用户上传的种子文件，强制去除DHT的支持。这也是为什么种子发布者必须重新下载种子才能正常做种的原因之一。', '1', '5', '16');
INSERT INTO `faq` VALUES ('74', '74', '25', 'item', '为什么我的磁盘还有充足的空间，却提示“一个或多个文件超出系统文件大小限制，这些文件无法被正确保存”？', '很可能是因为你的磁盘分区的文件系统为FAT32，该文件系统不支持大于4GB的单个文件。如果你使用的是Windows系统，你可以在磁盘的属性中查看其文件系统信息。你可以将磁盘文件系统转换成更高级的NTFS来解决该问题。<br />\r\n你可以在命令行窗口使用convert命令将FAT32无损转成NTFS文件系统格式。<br /><br />\r\n<b>命令说明</b>\r\nCONVERT volume /FS:NTFS [/V] [/CvtArea:filename] [/NoSecurity] [/X]<br />\r\nvolume     指定驱动器号(后面跟一个冒号)、装载点或卷名。<br />\r\n/FS:NTFS   指定要被转换成 NTFS 的卷。<br />\r\n/V       指定 Convert 应该用详述模式运行。<br />\r\n/CvtArea:filename       将根目录中的一个接续文件指定为NTFS 系统文件的占位符。<br />\r\n/NoSecurity       指定每个人都可以访问转换的文件和目录的安全设置。<br />\r\n/X       如果必要，先强行卸载卷。该卷的所有打开的句柄则无效。 <br /><br />\r\n<b>简单说</b><br />：\r\n打开 命令提示符窗口。<br />\r\n在命令提示符窗口，请键入：<br />\r\nconvert drive_letter:/fs:ntfs<br />\r\n例如：转换D盘为NTFS，可输入convert D:/fs:ntfs\r\nPS：win7可能需要以管理员身份运行命令行：开始>>所有程序>>附件>>右击“命令提示符”，“以管理员身份运行”，如果还不懂，联系管理员。', '1', '5', '17');
INSERT INTO `faq` VALUES ('374', '74', '28', 'item', '為什么我的磁碟還有充足的空間，用戶端卻輔助說明磁碟剩餘空間不足？', '很可能是因為你的磁碟割區的檔案系統為FAT32，該檔案系統不支援大于4GB的單個檔案。如果你使用的是Windows系統，你可以在磁碟的屬性中檢視其檔案系統資訊。你可以將磁碟檔案系統轉換成更進階的NTFS來解決該問題。<br />\r\n你可以在指令行視窗使用convert指令將FAT32無損轉成NTFS檔案系統格式。<br /><br />\r\n<b>指令說明</b>\r\nCONVERT volume /FS:NTFS [/V] [/CvtArea:filename] [/NoSecurity] [/X]<br />\r\nvolume     指定磁碟機號(后面跟一個冒號)、裝載點或卷名。<br />\r\n/FS:NTFS   指定要被轉換成 NTFS 的卷。<br />\r\n/V       指定 Convert 應該用詳述型態執行。<br />\r\n/CvtArea:filename       將根目錄中的一個接續檔案指定為NTFS 系統檔案的占位符。<br />\r\n/NoSecurity       指定每個人都可以存取轉換的檔案和目錄的安全設定。<br />\r\n/X       如果必要，先強行卸載卷。該卷的所有開啟的控點則無效。 <br /><br />\r\n<b>簡單說</b><br />：\r\n開啟 指令輔助說明符視窗。<br />\r\n在指令輔助說明符視窗，請鍵入：<br />\r\nconvert drive_letter:/fs:ntfs<br />\r\n例如：轉換D槃為NTFS，可匯入convert D:/fs:ntfs', '1', '5', '17');
INSERT INTO `faq` VALUES ('368', '68', '28', 'item', '“Unknown passkey”這錯誤是咋回事？', '首先，如果你不是我們的註冊用戶，將會發生這個錯誤。其次，有可能你沒有在登入狀態下從我們的網頁裡下載種子檔案。如果是這兩種情況，只要註冊一個帳號或者登入后下載種子檔案就可以了。<br />\r\n另外，當你註冊了一個新用戶并且開始第一次下載的時候，或者你剛剛重置了你的加密鍵時，也可能出現這個錯誤。原因是系統并非實時檢查加密鍵的改變。如果是因為這個原因，那么就讓種子工作等一會兒，最后一定能收到Tracker伺服器發回的成功資訊。', '1', '5', '14');
INSERT INTO `faq` VALUES ('369', '69', '28', 'item', '什么時候我需要重置我的加密鍵?', '<ul><li> 如果你的加密鍵被泄漏，且別的用戶正在使用這個加密鍵（即使用你的帳戶）下載檔案。在這種情況下，你能在你的詳情頁面看到你并未下載或上傳的種子。</li>\r\n<li>當你的用戶端崩潰，或者你的連線并沒有正常被終止。在這樣的情況下，就算你已經關閉了你的用戶端，你仍然在你的詳情頁面看到正在上傳/下載的記錄。通常情況下這些“多餘種子”將在30分鐘之內被自動清除，但是如果你馬上繼續你的下載而伺服器又輔助說明“You already are downloading the same torrent”的錯誤，那么你需要重置你的加密鍵，然后重新下載種子檔案，之后繼續下載過程。 </li></ul>', '1', '5', '15');
INSERT INTO `faq` VALUES ('370', '70', '28', 'item', 'DHT是什么？為什么一定要關閉這個功能？', 'DHT必須從你的用戶端被禁止。DHT可能導致你的資料被錯誤地記錄，可以視為一種作弊行為。任何使用DHT的用戶將因作弊而被系統禁止。<br />\r\n幸運的是，目前Tracker伺服器會自動解析用戶上傳的種子檔案，強制去除DHT的支援。這也是為什么種子發布者必須重新下載種子才能正常做種的原因之一。', '1', '5', '16');
INSERT INTO `faq` VALUES ('372', '72', '28', 'item', 'What skills do I need to do the translation?', 'Translate the site into another language is quite easy. You needn\'t be skilled in PHP or dynamic website design. In fact, all you need is proficient understanding of English (the default site language) and the language you plan to translate into. Maybe some basic knowledge in HTML would help.<br /><br />\r\nMoreover, we give a detailed tutorial on how to do the translation <a href=\"#73\" class=\"faqlink\"><b>HERE</b></a>. And our coders would be more than pleased to answer the questions you may encounter.<br /><br />\r\nTranslate the whole site into another language would take estimated 10 hours. And extra time is needed to maintain the translation when site code is updated.<br /><br />\r\nSo, if you think you could help, feel free to <a class=\"faqlink\" href=\"contactstaff.php\"><b>CONTACT US</b></a>. Needless to say, you would be rewarded.', '1', '71', '1');
INSERT INTO `faq` VALUES ('373', '73', '28', 'item', 'The translation tutorial', '<ul>\r\n<li>How does multi-language work?<br />\r\nCurrently we use language files to store all the static words that a user can see on web pages. <br />\r\nEvery php code file has a corresponding language file for a certain language. And we named the language file \'lang_\' plus the filename of the php code file. i.e. the language file of the php code file \'details.php\' would be \'lang_details.php\'. <br />\r\nWe has some mechanism in php codes to read the exact language files of user\'s preferred language, and you shouldn\'t worry about that.<br /></li>\r\n<li>What\'s in language files?<br />\r\nIn a language file is an array of strings. These strings contain all the static words that a user can see on web pages. When we need to say some words on a php code file, we call for a string in the array. And the output of the php code file, that is what users see on the web pages, would show the value of the string.<br />\r\nSounds dizzying? Well, you need not care about all these. All you gotta do is translate the values of the strings in the language files into another language. <b>Let\'s see an example</b>:<br /><br />\r\nThe following is the content of the English language file \'lang_users.php\', which works for the php code file \'users.php\'. <br /><br />\r\n<img src=\"pic/langfileeng.png\" alt=\"langfileeng\" /><br />\r\nIf you wanna translate it into Simplified Chinese, all you need is edit the file into this:<br />\r\n<img src=\"pic/langfilechs.png\" alt=\"langfilechs\" /><br />\r\nSee, in every line, the left part, that is before <i>=&gt;</i>, is the name of a string, which you shouldn\'t touch. All you need to is translate the right part, after <i>=&gt;</i>, which is the value of the string, into another language.<br />\r\nSometimes you need to look at the corresponding web pages to get the context meaning of some words.<br /></li>\r\n<li>Sounds easy? See what do you need to do.<br />\r\nIf you feel like to help us, <a class=\"faqlink\" href=\"aboutnexus.php#contact\"><b>CONTACT US</b></a> and we will send you a pack of the English language files (or any other available language if you prefer). Received it, you can start translating the value of strings (which is in English), into another language. It should take you several hours to do the whole work. After this, send back the translated language files to us.<br />\r\nIf no bugs or hacking codes are found in testing, we would put the new language into work.<br />\r\nSometimes the language files need to be updated, typically adding new strings, when site codes are updated. If you feel like it, you can help maintain the language files.<br /></li>\r\n<li><font color=\"red\"><b>IMPORTANT</b></font><br />\r\nThe text of language files must be encoded in UTF-8. When saving files, be sure to set the character encoding to UTF-8. Otherwise mojibake may happen.</li></ul>', '1', '71', '2');
INSERT INTO `faq` VALUES ('362', '62', '28', 'item', '也許是因為我的IP位址被列入黑名單了？', '這個網站有屏蔽被禁用戶或攻擊者的IP位址的功能。該功能在Apache/PHP層面上起作用，且只能屏蔽從這些位址<i>登入</i>網站。這不會阻止你<i>連線</i>到網站，更無法從底層的協定層面進行屏蔽。即便你的位址已經被列入了黑名單，你應該仍能夠通過ping/traceroute指令連同伺服器。如果你無法連通伺服器，那么問題的原因在別處。<br />\r\n<br />\r\n如果你的IP位址因某種原因錯誤地被我們屏蔽了，請聯繫我們。', '1', '8', '1');
INSERT INTO `faq` VALUES ('363', '63', '28', 'item', '你的ISP屏蔽了本站的位址', '首先，這一般不像你的ISP的所作所為。DNS域名解析以及/或者網路問題是常見的真凶。\r\n<br />\r\n對此我們無能為力。你應該聯繫你的ISP（或者換一個）。記住你仍然可以通過代理存取本站，參看此常見問題關于代理的部分。在這種情況下，代理是否匿名或者使用哪個監聽通訊埠都不重要了。<br />\r\n<br />\r\n注意，你的“可連線狀態”將因此一直被列為“否”，因為此時Tracker伺服器無法檢查你的BT用戶端接收連線的狀態。', '1', '8', '2');
INSERT INTO `faq` VALUES ('365', '65', '28', 'item', '不妨試試這個', '用任何手段在<a class=\"faqlink\" href=\"forums.php\">論壇</a>發帖。通常情況下你能得到友善而有用的輔助說明。這裡給你一些基本的指導：<ul>\r\n<li>確保你的問題的確不在這篇FAQ中。這樣的發帖導致的結果就是傳回這篇FAQ。</li>\r\n<li>在發帖之前，看看置頂。很多時候，還沒有被我們的FAQ所收錄的最新的資訊都可以在那裡被找到。</li>\r\n<li>輔助說明我們也就是輔助說明你自己。不要僅僅說“嘿我這裡出問題了！！”提供一些詳情，這樣我們就不用猜測或者浪費時間來詢問了。你使用的是什么用戶端？什么作業系統？怎樣的網路設定？如果發生了錯誤，是什么樣的具體錯誤資訊？有問題的種子檔案是哪個？你所提供的資訊越多，對你的輔助說明也就越容易，你的帖子也就更加容易得到回覆。</li>\r\n<li>不需要說的是：保持禮貌。趾高氣揚得指令別人輔助說明你很少會有用。</li></ul>', '1', '9', '1');
INSERT INTO `faq` VALUES ('366', '66', '28', 'item', '什么是\"Your slot limit is reached! You may at most download xx torrents at the same time\"錯誤？', '這是“最大連線數系統”。最大連線數系統用于限制那些分享率較低且下載量大于10GB的用戶的最大同時下載數。<br /><br />\r\n規則如下: <br /><br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.5</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">最大連線數</td>\r\n	<td class=\"embedded\" width=\"40\">1</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.65</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">最大連線數</td>\r\n	<td class=\"embedded\" width=\"40\">2</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.8</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">最大連線數</td>\r\n	<td class=\"embedded\" width=\"40\">3</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.95</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">最大連線數</td>\r\n	<td class=\"embedded\" width=\"40\">4</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率大于</td>\r\n	<td class=\"embedded\" width=\"40\">0.95</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">最大連線數</td>\r\n	<td class=\"embedded\" width=\"40\">無限制</td>\r\n</tr>\r\n</table>\r\n<br />\r\n無論何時，同時的上傳數不設限。但是如果你目前的下載數已達到了你的最大連線數，這時開啟新的做種工作，你也會收到同樣的錯誤輔助說明。在這種情況下，你必須先關閉一個下載工作，然后開啟所有的上傳工作，然后繼續剛才關閉的下載工作。因為當你的連線數被占滿，系統將不加驗證直接拒絕任何下載或上傳的要求。 <br />\r\n<br /><br />\r\n你可以在任意時間察看自己的連線數，該資訊在頁面頂端資訊欄中被列出。', '0', '5', '12');
INSERT INTO `faq` VALUES ('367', '67', '28', 'item', '什么是加密鍵系統？它是怎么工作的？', '加密鍵系統在BT用戶端連線Tracker伺服器時起到驗證身份的作用。每一個用戶都有一個系統隨機生成的加密鍵。當用戶下載某個種子檔案時，他的私人加密鍵被添加到種子檔案的Tracker伺服器URL中。通過這種方式，你可以在家中或者辦公室使用不同的IP來做種某個檔案。\r\n\r\n', '1', '5', '13');
INSERT INTO `faq` VALUES ('301', '1', '28', 'categ', '網站資訊', '', '1', '0', '1');
INSERT INTO `faq` VALUES ('302', '2', '28', 'categ', '用戶資訊', '', '1', '0', '2');
INSERT INTO `faq` VALUES ('303', '3', '28', 'categ', '資料統計', '', '1', '0', '3');
INSERT INTO `faq` VALUES ('304', '4', '28', 'categ', '發布', '', '1', '0', '4');
INSERT INTO `faq` VALUES ('305', '5', '28', 'categ', '下載', '', '1', '0', '5');
INSERT INTO `faq` VALUES ('306', '6', '28', 'categ', '我該怎樣提升下載速度？', '', '1', '0', '6');
INSERT INTO `faq` VALUES ('307', '7', '28', 'categ', '我的網路提供商（ISP）使用了透通代理。我應該怎么做？', '', '1', '0', '7');
INSERT INTO `faq` VALUES ('308', '8', '28', 'categ', '為什么我連不上？難道我被網站屏蔽了？', '', '1', '0', '8');
INSERT INTO `faq` VALUES ('309', '9', '28', 'categ', '如果從這裡找不到我的問題的解答，我該怎么辦？', '', '1', '0', '9');
INSERT INTO `faq` VALUES ('310', '10', '28', 'item', '到底什么是BT（Bittorrent）？我要如何才能弄到這類程式？', '參看<a class=\"faqlink\" href=\"http://www.btfaq.com/\">Brian的BitTorrent FAQ及指導</a>。', '1', '1', '1');
INSERT INTO `faq` VALUES ('311', '11', '28', 'item', '我們捐出來的錢上哪兒去了？', '所有捐助的錢用于維護伺服器的費用。', '1', '1', '2');
INSERT INTO `faq` VALUES ('312', '12', '28', 'item', '我從哪裡可以搞到來源碼的拷貝？', '這個Tracker使用的是NexusPHP的程式碼。程式碼抓取事宜，請看<a class=\"faqlink\" href=\"aboutnexus.php\">這裡</a>。<br />\r\nNexusPHP的程式碼是根據TBSource的源碼改寫的。TBDev網站，Tracker來源碼以及社區論壇都在這裡：<a class=\"faqlink\" href=\"http://www.tbdev.net/\">TBDev.net</a>。', '1', '1', '3');
INSERT INTO `faq` VALUES ('313', '13', '28', 'item', '我註冊了一個賬號但是卻沒有收到驗證郵件！', '這很有可能是Tracker所在的伺服器網路出現了問題。你可以填寫<a href=\"confirm_resend.php\" class=\"faqlink\">這個表格</a>讓伺服器重發驗證郵件。<br />\r\n通常沒有得到確認的註冊帳戶會在24小時后被移除，所以你可以在第二天重試。需要注意的是，如果你第一次沒有收到確認信，第二次有很大的可能仍然無法收到確認信，所以換一個E-mail位址是一個不錯的主意。', '1', '2', '1');
INSERT INTO `faq` VALUES ('314', '14', '28', 'item', '我忘記了我的用戶名/密碼了，能幫我找回來么？', '請填寫<a class=\"faqlink\" href=\"recover.php\">這個表單</a>，我們將把登入詳情發還給你。', '1', '2', '2');
INSERT INTO `faq` VALUES ('315', '15', '28', 'item', '我可以給我的賬號改個名字么？', '我們并不支援給賬號改名。', '1', '2', '3');
INSERT INTO `faq` VALUES ('316', '16', '28', 'item', '你可以移除一個（已確認的）賬號么？', '我們一般不提供該類服務，所以不要要求移除任何一個被你邀請的帳號。', '1', '2', '4');
INSERT INTO `faq` VALUES ('317', '17', '28', 'item', '那么，什么是我的分享率（Ratio）？', '就在頁面功能割區的下面。<br />\r\n<br />\r\n<img src=\"pic/ratio.png\" alt=\"ratio\" />\r\n<br />\r\n<br />\r\n區分你的整體分享率和獨立分享率是很重要的。整體分享率關注的是自從你加入網站以來，賬號的整體上傳與下載量。而獨立分享率則針對每一個你正在下載或做種的檔案。\r\n<br />\r\n<br />\r\n你可能看到兩種象徵式來代替數字：\"Inf.\"，這個是無限（Infinity）的縮寫，意思是你的下載量為0位元組，而上傳量則是任意一個非零的值(上傳量/下載量=無窮大)；\"---\"，應該被視為“不可用”，這說明了你的下載量和上傳量都是0位元組。(上傳量/下載量=0/0 這是一個不確定的量)。\r\n', '1', '2', '5');
INSERT INTO `faq` VALUES ('318', '18', '28', 'item', '為什么我的IP位址察看在我的個人資訊頁面上？', '只有你自己和網站Moderator及以上的管理員可以看到你的IP位址和Email。普通用戶是看不到這些資訊的。', '1', '2', '6');
INSERT INTO `faq` VALUES ('321', '21', '28', 'item', '為什么我的“可連線”是“否”？（以及為什么我需要關注這個問題？）', 'Tracker伺服器認為你在防火牆后，或者在NAT橋接后，并且無法接收其他Peer的連線要求。\r\n<br />\r\n<br />\r\n這意味着其他的大批Peer無法連線到你，只能由你連線到他們。更糟糕的情況是，如果兩個Peer都處于這樣的狀態，他們將完全無法連線到對方。這對于整體速度有着非常不利的影響。\r\n<br />\r\n<br />\r\n對于這個問題，有以下解決方式：對于防火牆，開啟用于接收連線的通訊埠（即你在BT用戶端中定義的通訊埠）；對于NAT，你需要配置NAT伺服器使用Basic NAT方式而不是NAPT（不同的路線有着不同的執行方式。翻閱你的路線文件或客服論壇。你也可以在<a class=\"faqlink\" href=\"http://portforward.com/\">PortForward</a>找到關于此問題的大量資訊）。\r\n\r\n\r\n\r\n\r\n\r\n', '1', '2', '9');
INSERT INTO `faq` VALUES ('322', '22', '28', 'item', '不同的用戶等級代表了什么含義？', '<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n<td class=\"embedded\" width=\"200\" valign=\"top\">&nbsp; <b class=\"Peasant_Name\">Peasant</b></td>\r\n<td class=\"embedded\" width=\"5\">&nbsp;</td>\r\n<td class=\"embedded\"> 被降級的用戶，他們有30天時間來提升分享率，否則他們會被踢。無法發表趣味盒內容；無法申請友情鏈結；無法上傳字幕。\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"User_Name\">User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">新用戶的預設級別。只能在每周六中午12點至每周日晚上11點59分發布種子。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"PowerUser_Name\">Power User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">得到一個邀請名額；可以直接發布種子；可以檢視NFO文件；可以檢視用戶清單；可以要求續種； 可以傳送邀請； 可以檢視排行榜；可以檢視其他用戶的種子曆史(如果用戶隱私等級未設定為\"強\")； 可以移除自己上傳的字幕。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"EliteUser_Name\">Elite User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\"><b class=\"EliteUser_Name\">Elite User</b>及以上用戶封存賬號后不會被移除。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"CrazyUser_Name\">Crazy User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">得到兩個邀請名額；可以在做種/下載/發布的時候選取匿名型態。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"InsaneUser_Name\">Insane User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">可以檢視普通日誌。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"VeteranUser_Name\">Veteran User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">得到三個邀請名額；可以檢視其他用戶的評論、帖子曆史。<b class=\"VeteranUser_Name\">Veteran User</b>及以上用戶會永遠保留賬號。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"ExtremeUser_Name\">Extreme User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">可以更新過期的外部資訊；可以檢視Extreme User論壇。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"UltimateUser_Name\">Ultimate User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">得到五個邀請名額。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"NexusMaster_Name\">Nexus Master</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">得到十個邀請名額。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\"  valign=\"top\">&nbsp; <img class=\"star\" src=\"pic/trans.gif\" alt=\"Star\" /></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">為網站捐款的主。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"VIP_Name\">貴賓(VIP)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">和<b class=\"NexusMaster_Name\">Nexus Master</b>擁有相同許可權并被認為是精英成員。免除自動降級。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"User_Name\">其他</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">自訂等級。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Retiree_Name\">養老族(Retiree)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">退休后的管理組成員。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Uploader_Name\">發布員(Uploader)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">專注的發布者。免除自動降級；可以檢視匿名用戶的真實身份。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Moderator_Name\">總版主(Moderator)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">可以檢視管理組郵箱、舉報郵箱；管理趣味盒內容、投票內容；可以編輯或移除任何發布的種子；可以管理候選；可以管理論壇帖子、用戶評論；可以檢視機密日誌；可以移除任何字幕；可以管理日誌中的程式碼、史冊；可以檢視用戶的邀請記錄；可以管理用戶帳號的一般資訊。<b>無法</b>管理友情鏈結、最近訊息、論壇版塊；<b>無法</b>將種子設為置頂或促銷；<b>無法</b>檢視用戶IP或Email等機密資訊；無法移除賬號。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Administrator_Name\">管理員(Administrator)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">除了無法改變網站設定、管理捐贈外，可以做任何事。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"SysOp_Name\">維護開發員(Sysop)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">網站開發/維護人員，可以改變網站設定，無法管理捐贈。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"StaffLeader_Name\">主管(Staff Leader)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">網站主管，可以做任何事。</td>\r\n</tr>\r\n</table>', '1', '2', '10');
INSERT INTO `faq` VALUES ('323', '23', '28', 'item', '提升和降級又是怎樣被執行的呢？', '<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n<td class=\"embedded\" width=\"200\" valign=\"top\">&nbsp; <b class=\"Peasant_Name\">Peasant</b></td>\r\n<td class=\"embedded\" width=\"5\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">當以下情況時將被自動降至本級：<br />\r\n1.如果你已經下載了超過50GB，你應該有大于0.4的分享率。<br />\r\n2.如果你已經下載了超過100GB，你應該有大于0.5的分享率。<br />\r\n3.如果你已經下載了超過200GB，你應該有大于0.6的分享率。<br />\r\n4.如果你已經下載了超過400GB，你應該有大于0.7的分享率。<br />\r\n5.如果你已經下載了超過800GB，你應該有大于0.8的分享率。</td>\r\n</tr>\r\n\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"PowerUser_Name\">Power User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必須註冊至少4周，并且下載至少50G，分享率大于1.05。<br />\r\n當條件符合時將被自動提升。注意，無論何時，如果你的分享率低于0.95，你將自動降級。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"EliteUser_Name\">Elite User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必須註冊至少8周，并且下載至少120G，分享率大于1.55。\r\n<br />\r\n當條件符合時將被自動提升。注意，無論何時，如果你的分享率低于1.45，你將自動降級。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"CrazyUser_Name\">Crazy User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必須註冊至少15周，并且下載至少300G，分享率大于2.05。\r\n<br />\r\n當條件符合時將被自動提升。注意，無論何時，如果你的分享率低于1.95，你將自動降級。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"InsaneUser_Name\">Insane User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必須註冊至少25周，并且下載至少500G，分享率大于2.55。<br />\r\n當條件符合時將被自動提升。注意，無論何時，如果你的分享率低于2.45，你將自動降級。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"VeteranUser_Name\">Veteran User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必須註冊至少40周，并且下載至少750G，分享率大于3.05。<br />\r\n當條件符合時將被自動提升。注意，無論何時，如果你的分享率低于2.95，你將自動降級。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"ExtremeUser_Name\">Extreme User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必須註冊至少60周，并且下載至少1TB，分享率大于3.55。<br />\r\n當條件符合時將被自動提升。注意，無論何時，如果你的分享率低于3.45，你將自動降級。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"UltimateUser_Name\">Ultimate User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必須註冊至少80周，并且下載至少1.5TB，分享率大于4.05。<br />\r\n當條件符合時將被自動提升。注意，無論何時，如果你的分享率低于3.95，你將自動降級。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"NexusMaster_Name\">Nexus Master</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">必須註冊至少100周，并且下載至少3TB，分享率大于4.55。<br />\r\n當條件符合時將被自動提升。注意，無論何時，如果你的分享率低于4.45，你將自動降級。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <img class=\"star\" src=\"pic/trans.gif\" alt=\"Star\" /></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">只需捐款，詳見<a class=\"faqlink\" href=\"donate.php\">這裡</a>。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"VIP_Name\">貴賓(VIP)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">由管理員仔細斟酌后配置給他們認為對于網站某方面有特殊貢獻的用戶。<br />\r\n（任何索取貴賓等級的要求將被自動無視）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"User_Name\">其他</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">用戶使用魔力值兌換，或由管理員仔細斟酌后授權。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Retiree_Name\">養老族(Retiree)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">由管理員授予。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Uploader_Name\">發布員(Uploader)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">由管理員配置(參見\'發布\'部分以了解詳情)。</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Moderator_Name\">總版主(Moderator)</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">無需多問，我們會找到你的！</td>\r\n</tr>\r\n</table>', '1', '2', '11');
INSERT INTO `faq` VALUES ('325', '25', '28', 'item', '為什么我的朋友無法加入？', '用戶數目有所限制（你可以檢視“首頁-&gt;網站資料-&gt;上限”）。當達到那個數目時，我們會停止接受新成員。<br />\r\n由于非活躍用戶(長期不使用賬號的用戶)引起賬號資源浪費，因此我們將清理該部分用戶，為其他想加入用戶騰出空間。<br />\r\n關于非活躍用戶清理規則，參照<a class=\"faqlink\" href=\"rules.php\">規則</a>。', '1', '2', '1');
INSERT INTO `faq` VALUES ('326', '26', '28', 'item', '怎樣自訂頭像？', '首先，找一個你喜歡的圖片，當然了它無法違反我們的<a class=\"faqlink\" href=\"rules.php\">規則</a>。然后你要找一個存放它的地方，比方說我們自己的<a class=\"faqlink\" href=\"bitbucket-upload.php\">上傳器</a>。出于伺服器負載的考慮，我們更希望你將圖片上傳到別的網站，然后將其URL黏貼到你的<a class=\"faqlink\" href=\"usercp.php?action=personal\">控制面板</a>的頭像URL部分。 <br />\r\n<br />\r\n請不要為了僅僅測試頭像而發帖。如果一切順利，你將在你的詳情頁面看到它。', '1', '2', '1');
INSERT INTO `faq` VALUES ('327', '27', '28', 'item', '最常見的資料未能得到更新的原因', '<ul>\r\n<li>伺服器超載/未回應。只要嘗試着保持階段作業直到伺服器回復回應(不建議連續手動清除，這樣會加重伺服器負載)。</li>\r\n<li>你正在使用不穩定的用戶端。如果你想要使用測試版或者CVS版本，你需要自己承擔由此帶來的風險。</li>\r\n</ul>', '1', '3', '1');
INSERT INTO `faq` VALUES ('328', '28', '28', 'item', '最佳的嘗試', '<ul>\r\n<li>如果你目前正下載/上傳的種子并不在你的用戶詳情頁面中，你可以等一會或者強制進行手動更新。</li>\r\n<li>確保你正確地關閉了用戶端軟體，否則Tracker伺服器無法收到\"event=completed\"的訊號。</li>\r\n<li>如果Tracker伺服器掛了，不要停止上傳。只要在你結束用戶端之前伺服器回復工作，所有的資料都會得到正確地更新。</li>\r\n</ul>', '1', '3', '2');
INSERT INTO `faq` VALUES ('329', '29', '28', 'item', '我可以任意選取Bittorrent用戶端軟體么？', '根據<a class=\"faqlink\" href=\"aboutnexus.php\">NexusPHP</a>對常見BitTorrent用戶端的測試，目前本站Tracker<b>只允許</b>使用以下的BitTorrent用戶端軟體。<br />\r\n<a class=\"faqlink\" href=\"aboutnexus.php\">NexusPHP</a>的測試報告可<a class=\"faqlink\" href=\"http://www.nexusphp.com/wiki/%E5%AE%A2%E6%88%B7%E7%AB%AF%E6%B5%8B%E8%AF%95%E6%8A%A5%E5%91%8A\">在此檢視</a>。\r\n<br />\r\n<b>Windows:</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://azureus.sourceforge.net\">Azureus</a>: 2.5.0.4, 3.0.5.0, 3.0.5.2及后續版本</li>\r\n<li><a class=\"faqlink\" href=\"http://www.utorrent.com\">uTorrent</a>: 1.6.1, 1.7.5, 1.7.6, 1.7.7, 1.8Beta(Build 10364), 2.0(Build 17624)及后續版本</li>\r\n<li><a class=\"faqlink\" href=\"http://www.bittorrent.com\">BitTorrent</a>: 6.0.1, 6.0.2, 6.0.3及后續版本</li>\r\n<li><a class=\"faqlink\" href=\"http://deluge-torrent.org\">Deluge</a>: 0.5.9.1, 1.1.6及后續版本</li>\r\n<li><a class=\"faqlink\" href=\"http://rufus.sourceforge.net\">Rufus</a>: 0.6.9, 0.7.0及后續版本</li>\r\n</ul>\r\n<b>Linux:</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://azureus.sourceforge.net\">Azureus</a>: 2.5.0.4, 3.0.5.0, 3.0.5.2及后續版本</li>\r\n<li><a class=\"faqlink\" href=\"http://deluge-torrent.org\">Deluge</a>: 0.5.9.1, 1.1.6及后續版本</li>\r\n<li><a class=\"faqlink\" href=\"http://rufus.sourceforge.net\">Rufus</a>: 0.6.9, 0.7.0及后續版本</li>\r\n<li><a class=\"faqlink\" href=\"http://www.transmissionbt.com\">Transmission</a>: 1.21及后續版本</li>\r\n<li><a class=\"faqlink\" href=\"http://libtorrent.rakshasa.no\">rTorrent</a>: 0.8.0（配合libtorrent 0.12.0或后續版本）及后續版本</li>\r\n<li><a class=\"faqlink\" href=\"http://www.rahul.net/dholmes/ctorrent/\">Enhanced CTorrent</a>: 3.3.2及后續版本</li>\r\n</ul>\r\n<b>MacOS X:</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://azureus.sourceforge.net\">Azureus</a>: 2.5.0.4, 3.0.5.0, 3.0.5.2及后續版本</li>\r\n<li><a class=\"faqlink\" href=\"http://www.transmissionbt.com\">Transmission</a>: 1.21及后續版本</li>\r\n<li><a class=\"faqlink\" href=\"http://sourceforge.net/projects/bitrocket/\">BitRocket</a>: 0.3.3(32)及后續版本</li>\r\n</ul>\r\n<b>Symbian (僅供測試):</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://amorg.aut.bme.hu/projects/symtorrent\">SymTorrent</a>: 1.41及后續版本</li>\r\n</ul>\r\n<br />\r\n\r\n<b>以上用戶端在https支援方面</b>\r\n<ul>\r\n<li>uTorrent 1.61: 無法准確解析https的tracker, 同時在使用會將自己識別為uTorrent 1.5</li>\r\n<li>Rufus: 沒有https支援, 并且已經几年沒有繼續開發</li>\r\n<li>rtorrent: 需要手工設定SSL證書, 詳細資訊請自行查閱其官方網站說明</li>\r\n</ul>\r\n\r\n<br />\r\n\r\n同時請儘量避免使用處于測試期的用戶端軟體, 如uTorrent 1.8.0B。\r\n\r\n為了從本站得到最好的下載體驗,我們高度建議<a class=\"faqlink\" href=\"http://www.utorrent.com/download.php\">uTorrent</a> 以及<a class=\"faqlink\" href=\"http://azureus.sourceforge.net/download.php\">Azureus</a>這兩個軟體的最新穩定版。', '1', '5', '3');
INSERT INTO `faq` VALUES ('330', '30', '28', 'item', '為什么我正在下載/做種的一個種子會在我的詳情頁面中被列出多次？', '如果因為某些原因(比方說死機，用戶端失去回應)你的用戶端非正常結束并且你又重新開啟它，它會被配置到一個全新的Peer ID, 這樣它察看為一個全新的種子。而舊的種子將永遠不會收到“event=completed”或“event=stopped”的訊號，因此將一直被列出直到Tracker清理逾時的Peer。 無視了它就可以了，它最后會消失的。', '1', '3', '4');
INSERT INTO `faq` VALUES ('331', '31', '28', 'item', '為什么我已經完成/取消的種子仍然在我的詳情頁面裡？', '有一些用戶端，比如說TorrentStorm和Nova Torrent，在取消或者完成一個工作的時候無法向Tracker伺服器正確傳送訊號。在那樣的情況下，Tracker伺服器將一直保持等待訊號的狀態（因此會一直列出種子的狀態為做種/下載的狀態）直到Tracker清理逾時的Peer。無視了它就可以了，它最后會消失的。', '1', '3', '5');
INSERT INTO `faq` VALUES ('333', '33', '28', 'item', '多IP（我可以從不同的電腦登入/下載嗎？）', '是的，目前Tracker伺服器支援單個用戶從任意個數的IP位址同時存取/下載。<br />\r\n然而，對于單種是有限制的。對于每個種子，最多允許3個做種的連線，最多只允許1個下載的連線（這意味着，對于某個種子你一次只能在一個地方下載）。', '1', '3', '1');
INSERT INTO `faq` VALUES ('336', '36', '28', 'item', '為什么我無法發布種子？', '請看<a class=\"faqlink\" href=\"rules.php\">規則</a>。', '1', '4', '1');
INSERT INTO `faq` VALUES ('337', '37', '28', 'item', '我需要滿足哪些條件才能加入發布小組呢？', '你所必須滿足的條件：\r\n<ul>\r\n<li>具有穩定的資源來源</li>\r\n<li>平均每周資源發布數量不少于5個</li>\r\n</ul>\r\n你必須確保發布的檔案符合以下特征:\r\n<ul>\r\n<li>不超過7天之前</li>\r\n<li>你必須要有做種的能力，或者可以確保至少有效供種24小時。</li>\r\n<li>你需要有至少達到2MBit的上傳頻寬。</li>\r\n</ul>\r\n如果你認為你符合以上條件，那么不要猶豫，<a class=\"faqlink\" href=\"contactstaff.php\">聯繫管理組</a>吧。<br />\r\n<b>記住！</b> 仔細填寫你的申請！確保申請中包含你的上傳速度以及你計划發布的內容的類別。<br />\r\n只有仔細填寫并且經過慎重考慮的申請才會納入我們的視野。', '1', '4', '2');
INSERT INTO `faq` VALUES ('338', '38', '28', 'item', '我可以發布你們這裡的種子到別的Tracker伺服器么？', '無法。我們是一個封閉的、限制用戶數的社區。只有註冊用戶才能夠使用我們的Tracker。將我們的種子檔案發布到其他Tracker伺服器是徒勞的，因為絕大多數嘗試下載這些檔案的人將無法連線到我們的伺服器。將我們的種子發布到其他Tracker只讓那裡的用戶惱怒（因為無法下載）并且對我們產生敵對情緒，所以這種行為是我們是無法容忍的。<br />\r\n<br />\r\n如果其他網站的管理員向我們舉報我們的種子被發布在他們的網站上，對此負責的用戶將因此被移出我們的社區。<br />\r\n<br />\r\n但是對于從我們這裡下載得到的檔案，你可以隨意操控它們（發布者明確說明為<b>獨占</b>的資源除外）。你可以制作另一個種子，寫入其他Tracker的位址，并發布到你喜歡的網站上。', '1', '4', '3');
INSERT INTO `faq` VALUES ('339', '39', '28', 'item', '下載來的檔案該怎么開啟？', '在這份<a class=\"faqlink\" href=\"formats.php\">指引</a>裡面找找看吧。', '1', '5', '1');
INSERT INTO `faq` VALUES ('340', '40', '28', 'item', '我下載了一部電影，但是不明白CAM/TS/TC/SCR是什么意思?', '在這份<a class=\"faqlink\" href=\"videoformats.php\">指引</a>裡面找找看吧。', '1', '5', '2');
INSERT INTO `faq` VALUES ('341', '41', '28', 'item', '為什么一個可用的種子忽然就消失了？', '以下原因都會導致這個現象的出現:<br />\r\n(<b>1</b>) 按照<a class=\"faqlink\" href=\"rules.php\">網站規則</a>，這個種子不符合規則已被移除。\r\n<br />\r\n(<b>2</b>) 發布者因為檔案存在問題而移除了它。一般來說，發布者會發布一個交替的版本的。<br />\r\n(<b>3</b>) 在長時間斷種后種子被自動移除了。', '1', '5', '3');
INSERT INTO `faq` VALUES ('342', '42', '28', 'item', '我該怎樣續傳檔案或者給一個檔案續種呢？', '開啟副檔名為.torrent的檔案，當你的用戶端軟體詢問儲存的目錄時，選取已經存在的檔案存放的目錄，它就能夠開始續傳/續種了。', '1', '5', '4');
INSERT INTO `faq` VALUES ('343', '43', '28', 'item', '為什么我的下載有時候停在99%?', '你所下載到的片段越多，搜尋擁有你所缺少的片段的同伴就將變得越困難。這就是為什么有時候在下載即將完成的時候，速度會變得非常慢，甚至完全停止了。只要耐心等候，或早或晚剩餘的部分一定能夠下載到的。', '1', '5', '5');
INSERT INTO `faq` VALUES ('344', '44', '28', 'item', '\"部分哈希驗證出錯\"這條資訊是什么意思？', 'BT的用戶端會檢查它所收到的資料的完整性。如果某一個片段在驗證中出錯，那么這個片段將被重新下載。偶爾的哈希驗證錯誤是非常常見的現象，不用擔心。<br />\r\n<br />\r\n有些用戶端有屏蔽向你傳送錯誤資料的其他用戶端的功能。如果有這個選項，最好開啟它。因為這樣可以保證如果某個同伴經常向你傳送錯誤的資料時，它將會被屏蔽。', '1', '5', '6');
INSERT INTO `faq` VALUES ('345', '45', '28', 'item', '100MB大小的種子，我怎么下了120MB的東西回來?', '參見哈希驗證失敗的那個問題。如果你的用戶端收到了錯誤的資料，那么它將會重新下載這一部分，因此總下載量有可能比種子大小略微大一些。確保“屏蔽傳送錯誤資料的用戶端”的那個選項被開啟了，這樣可以減少其餘的下載。', '1', '5', '7');
INSERT INTO `faq` VALUES ('346', '46', '28', 'item', '為什么我的用戶端的Tracker伺服器狀態出現\"Your ratio is too low! You need to wait xx h to start\"的錯誤？', '在<b>新</b>種子被上傳到Tracker伺服器之后，有一些用戶必須等一些時間才能開始下載。<br>\r\n這個延遲只會影響那些分享率較低且下載量大于10G的用戶。<br />\r\n<br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.4</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">延遲</td>\r\n	<td class=\"embedded\" width=\"100\">24小時</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.5</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">延遲</td>\r\n	<td class=\"embedded\" width=\"100\">12小時</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.6</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">延遲</td>\r\n	<td class=\"embedded\" width=\"100\">6小時</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">分享率低于</td>\r\n	<td class=\"embedded\" width=\"40\">0.8</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">延遲</td>\r\n	<td class=\"embedded\" width=\"100\">3小時</td>\r\n</tr>\r\n</table>', '0', '5', '8');
INSERT INTO `faq` VALUES ('347', '47', '28', 'item', '為什么發生了這個錯誤？ \"Port xxxx is blacklisted\"?', '你的用戶端向Tracker伺服器報告它正在使用某個預設的BT協定通訊埠(6881-6889)或是任何其他常見P2P通訊埠來作為連線通訊埠。<br />\r\n<br />\r\n本站不允許這些通常被P2P協定預設使用的通訊埠。原因是目前ISP常常對這些通訊埠進行限速。<br />\r\n<br />\r\n被屏蔽的通訊埠如下：<br />\r\n<br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Direct Connect</td>\r\n	<td class=\"embedded\" width=\"100\">411 - 413</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">BitTorrent</td>\r\n	<td class=\"embedded\" width=\"100\">6881 - 6889</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Kazza</td>\r\n	<td class=\"embedded\" width=\"100\">1214</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Gnutella</td>\r\n	<td class=\"embedded\" width=\"100\">6346 - 6347</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Emule</td>\r\n	<td class=\"embedded\" width=\"100\">4662</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">WinMX</td>\r\n	<td class=\"embedded\" width=\"100\">6699</td>\r\n  </tr>\r\n</table>\r\n<br />\r\n要使用我們的Tracker伺服器，你必須配置你的用戶端使用未在上面列出的通訊埠範圍(從49152到65535都是不錯的選取，參看<a class=\"faqlink\" href=\"http://www.iana.org/assignments/port-numbers\">IANA</a>)。注意某些用戶端，如Azureus 2.0.7.0或更高版本，對所有的種子都使用同一通訊埠。而其他大多數用戶端為每一個種子開放一個通訊埠，你在選取通訊埠範圍應考慮到這個問題（一般來說通訊埠範圍小于10。設定一個過大的範圍并不一定有好處，而且可能有安全隱患)。 <br />\r\n<br />\r\n這些通訊埠是用于同伴間通訊的，而非用于用戶端連線到Tracker伺服器。因此這個改動并不會影響你使用其他Tracker伺服器（事實上，它甚至可能<i>加快</i>所有Tracker伺服器上種子的速度）。你的用戶端也仍然能夠連線到那些使用預設通訊埠的同伴。如果你的用戶端不支援自己自訂通訊埠，那么換一個吧。<br />\r\n<br />\r\n不要向我們詢問，或者在論壇裡面提問究竟應該選取什么通訊埠。我們的用戶選取的通訊埠越隨機，ISP就越難以捉摸清楚我們使用的通訊埠，從而無法對我們的通訊埠進行限速。如果我們只是簡單地規定一個範圍，那么ISP又會很快對那個範圍內的通訊埠進行限速的。<br />\r\n<br />\r\n最后還要說的是，記得在你的路線和/或防火牆上開啟你選取的通訊埠，如果你有這些東西的話。', '1', '5', '9');
INSERT INTO `faq` VALUES ('348', '48', '28', 'item', '那么這個呢？ “IO錯誤 - [錯誤號13] 許可被拒絕”？', '如果你只是想要解決這個問題的話，重新啟動你的電腦應該就可以了。否則的話，繼續讀下去。<br />\r\n<br />\r\nIO錯誤指的是匯入-匯出錯誤，這是一個檔案系統錯誤，而非來自我們的Tracker伺服器。當你的用戶端由于某些原因無法開啟種子中未下載完成的檔案時，這個錯誤就會發生。 通常原因是用戶端的兩個實例同時在執行：當上一次關閉用戶端時因為某種原因它沒有被真正關閉，從而始終在背景執行。因此檔案被鎖定，使得新的實例無法開啟這個檔案。<br />\r\n<br />\r\n另外一個不常出現的原因是因為老舊的FAT檔案系統。某些系統崩潰可能導致未下載完成的檔案損壞，接着就出現了這個錯誤。執行一次scandisk應該可以解決這個問題。注意，只有當你使用Windows 9X作業系統（只支援FAT檔案系統）或者在Windows NT/2000/XP中使用FAT檔案系統的時候才比對可能出現這個問題。NTFS檔案系統要健壯許多，不太可能出現這樣的問題。', '1', '5', '10');
INSERT INTO `faq` VALUES ('350', '50', '28', 'item', '不要馬上下載新發布的種子', '下載速度主要取決于上傳者/下載者比(SLR)。如果是種子是新發布的且非常受歡迎而SLR又很低的種子，下載速度低是常見的問題。<br />\r\n<br />\r\n請牢記你不喜歡低速下載。所以多<b>上傳</b>讓別人不用忍耐同樣的困擾。\r\n<br />\r\n<br />由其是當你的頻寬較窄時，不要馬上下載新發布的種子。最好的下載速度通常在一個種子生命周期的一半時出現，此時SLR達到最大值（不過，這時下載的缺點是你的上傳量不會很多。究竟如何平衡優點與缺點，取決于你自己)。', '1', '6', '1');
INSERT INTO `faq` VALUES ('351', '51', '28', 'item', '限制上傳速度', '上傳速度將從以下兩種方式顯著影響下載速度：\r\n<ul>\r\n    <li>Bittorrent的同伴傾向于回饋那些給它們提上傳的同伴。這就意味着如果A和B正在同時下載一個檔案，而A又在高速向B傳輸資料，那么B將會嘗試着回報A。因此高速上傳將導致高速下載。</li>\r\n\r\n    <li>由于TCP協定的工作方式，當A正從B下載某些東西的時候，A必須不停地向B傳送成功收到B所傳送來的資料的訊號（被稱為確認──ACK ── 某種“已收到”的資訊)。如果A沒有傳送ACK訊號，那么B將暫停向A傳送資料并且進入等候狀態。如果A正在全速上傳，很有可能沒有用來傳送ACK訊號的頻寬，因此ACK訊號被耽擱。在這種情況下，過高速度的上傳導致了低速的下載。</li>\r\n</ul>\r\n實際的效果是以上兩個原因的結合。上傳速度應該在保證ACK能正常傳送的前提下被設得儘量高。 <b>一個很好的實踐理論是保持上傳速度在理論上限的80%。</b>你也可以細細研究什么是最適合你的速度（同時也請記住高速上傳對于你的分享率很有輔助說明）。<br />\r\n<br />\r\n如果你正在執行一個以上的種子工作，你應該考慮的是全域上傳速度。某些用戶端能限制了全域上傳速度，其他的則能對每一個種子分別進行設定。了解你的用戶端。如果你正在使用你的電腦做別的某些應用（比方說上網或者從FTP拖東西），也需考慮一下它們對于全域上傳的影響。', '1', '6', '2');
INSERT INTO `faq` VALUES ('352', '52', '28', 'item', '限制同時連線數', '某些作業系統（例如Windows 9X）對于大量連線數支援不完善，甚至有可能因此而崩潰。也有一些家用路線（尤其當執行着NAT以及/或者開啟防火牆狀態檢查服務時）會因大量連線數而變得很慢或者崩潰。對于連線數沒有固定的最佳值，你可以試試看60或者100。記住這些連線數是累加的，所以如果你的用戶端執行了兩個階段作業，這兩個數字要加在一起。', '1', '6', '3');
INSERT INTO `faq` VALUES ('353', '53', '28', 'item', '限制同時上傳數', '上傳數難道和連線數有什么不一樣嗎？是的，兩者是不同的。連線數限制了你的用戶端所能對話以及/或者下載的同伴數。上傳數則限制了你的用戶端實際能上傳的同伴數。理想的數值一般要比連線數低許多，并且與你的物理頻寬高度相關。', '1', '6', '4');
INSERT INTO `faq` VALUES ('354', '54', '28', 'item', '那怎么辦？等待一會吧', '如我們在上面所解譯的，在BT下載過程中一個同伴更加傾向于回報那些上傳給它的同伴。當你開始一個新的下載工作時，你沒有檔案片斷提高給其他同伴，因此他們通常會無視你。這使得開始階段的下載非常緩慢，由其是當你所連線到的同伴只有很少是（或者沒有）做種者。一旦你獲得了一些能用于共用的檔案片斷，下載速度會有所改觀。', '1', '6', '5');
INSERT INTO `faq` VALUES ('355', '55', '28', 'item', '為什么在我下載的時候瀏覽網頁速度如此之慢？', '你的下載頻寬是有限的。如果你正在下載一個速度很快的種子，它几乎肯定將占滿你的下載頻寬。這是瀏覽網頁顯然就會變慢。很多BT用戶端允許你限制下載速度，你可以試試。<br />\r\n<br />\r\n瀏覽網頁只是作為舉例之一，同樣的問題也會出現在游戲，即時通訊軟體上......', '1', '6', '6');
INSERT INTO `faq` VALUES ('356', '56', '28', 'item', '什么是代理？', '基本上說，代理就是中間人。當你通過代理存取某個網站的時候，你的要求將首先被傳送到代理處，然后由代理轉寄到你所要求的網站，而不是你直接連通到網站。下面是几種典型的代理分類（朮語不是那么的規格）：<br />\r\n<br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n <tr>\r\n	<td class=\"embedded\" valign=\"top\" width=\"100\">&nbsp;透通代理</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">透通代理在用戶端無需配置。他將自動把80通訊埠的資訊重導到代理(有時候也作為非匿名代理的同義詞)；</td>\r\n </tr>\r\n <tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;顯式代理</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">瀏覽器必須經過配置才能使用代理；</td>\r\n </tr>\r\n <tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;匿名代理</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">代理將不會把用戶記號傳送至伺服器端 (HTTP_X_FORWARDED_FOR頭旗標將不被傳送。伺服器也因此看不到你的IP)；</td>\r\n </tr>\r\n <tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;高度匿名代理</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">代理將不會把用戶記號或代理記號傳送至伺服器端 (HTTP_X_FORWARDED_FOR和HTTP_VIA and HTTP_PROXY_CONNECTION頭旗標將不被傳送。伺服器看不到你的IP，甚至不知道你正在使用代理)；</td>\r\n </tr>\r\n <tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;公用</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">(不言自明了)。</td>\r\n </tr>\r\n</table>\r\n<br />\r\n透通代理可能是匿名的，也可能是非匿名的，且匿名也有相應的等級。', '1', '7', '1');
INSERT INTO `faq` VALUES ('357', '57', '28', 'item', '我該怎樣發現自己正處于一個（透通的/匿名的）代理后面？', '試試看<a href=\"http://proxyjudge.org\" class=\"faqlink\">ProxyJudge</a>。它列出了伺服器端從你這裡所收到的HTTP的頭旗標。相關的几個旗標是HTTP_CLIENT_IP，HTTP_X_FORWARDED_FOR和REMOTE_ADDR。', '1', '7', '2');
INSERT INTO `faq` VALUES ('375', '75', '28', 'item', '我的“可連線”是“否”儘管我并沒有NAT或者防火牆？', 'Tracker伺服器在搜尋你的真實IP方面非常有天賦。但是這需要代理髮送HTTP頭旗標HTTP_X_FORWARDED_FOR。如果你的ISP的代理沒有這么做的話，Tracker伺服器將把代理的IP當作你的用戶端的IP。所以當你登入之后，Tracker伺服器嘗試連線你的用戶端來確信你沒有使用NAT/防火牆，伺服器實際上將嘗試連線代理的IP（使用你的BT用戶端報告的接收連線通訊埠）。很自然地，代理伺服器并沒有監聽那個通訊埠。如此連線會失敗，而Tracker伺服器也因此認為你使用了NAT/防火牆。', '1', '7', '3');
INSERT INTO `faq` VALUES ('401', '1', '6', 'categ', 'Site information', '', '1', '0', '1');
INSERT INTO `faq` VALUES ('402', '2', '6', 'categ', 'User information', '', '1', '0', '2');
INSERT INTO `faq` VALUES ('403', '3', '6', 'categ', 'Stats', '', '1', '0', '3');
INSERT INTO `faq` VALUES ('404', '4', '6', 'categ', 'Uploading', '', '1', '0', '4');
INSERT INTO `faq` VALUES ('405', '5', '6', 'categ', 'Downloading', '', '1', '0', '5');
INSERT INTO `faq` VALUES ('406', '6', '6', 'categ', 'How can I improve my download speed?', '', '1', '0', '6');
INSERT INTO `faq` VALUES ('407', '7', '6', 'categ', 'My ISP uses a transparent proxy. What should I do?', '', '1', '0', '7');
INSERT INTO `faq` VALUES ('408', '8', '6', 'categ', 'Why can\'t I connect? Is the site blocking me?', '', '1', '0', '8');
INSERT INTO `faq` VALUES ('409', '9', '6', 'categ', 'What if I can\'t find the answer to my problem here?', '', '1', '0', '9');
INSERT INTO `faq` VALUES ('410', '10', '6', 'item', 'What is this bittorrent all about anyway? How do I get the files?', 'Check out <a class=\"faqlink\" href=\"http://www.btfaq.com/\">Brian\'s BitTorrent FAQ and Guide</a>.', '1', '1', '1');
INSERT INTO `faq` VALUES ('411', '11', '6', 'item', 'Where does the donated money go?', 'All donated money goes to the cost of server that this tracker is on.', '1', '1', '2');
INSERT INTO `faq` VALUES ('412', '12', '6', 'item', 'Where can I get a copy of the source code?', 'This tracker is powered by NexusPHP. If you like to use NexusPHP to power your tracker, <a class=\"faqlink\" href=\"aboutnexus.php\">Contact Us</a>.<br />\r\nThe first stage of NexusPHP forks from TBSource. You may find more information about TBSource at <a class=\"faqlink\" href=\"http://www.tbdev.net/\">TBDev.net</a>.', '1', '1', '3');
INSERT INTO `faq` VALUES ('413', '13', '6', 'item', 'I registered an account but did not receive the confirmation e-mail!', 'One possible reason may be that the network around the tracker has encountered some problems. You can use <a href=\"confirm_resend.php\" class=\"faqlink\">this form</a> ask the tracker to resend confirmation e-mail.<br />\r\nTypically registered users would be deleted after 24 hours if not confirmed, so you may try again the next day. Note though that if you didn\'t receive the email the first time it will probably not succeed the second time either so you should really try another email address.', '1', '2', '1');
INSERT INTO `faq` VALUES ('414', '14', '6', 'item', 'I\'ve lost my user name or password! Can you send it to me?', 'Please use <a class=\"faqlink\" href=\"recover.php\">this form</a> to have the login details mailed back to you.', '1', '2', '2');
INSERT INTO `faq` VALUES ('415', '15', '6', 'item', 'Can you rename my account? ', 'No, we do not rename accounts. Don\'t ask for it.', '1', '2', '3');
INSERT INTO `faq` VALUES ('416', '16', '6', 'item', 'Can you delete my (confirmed) account?', 'No, we don\'t delete accounts. Don\'t ask for it.', '1', '2', '4');
INSERT INTO `faq` VALUES ('417', '17', '6', 'item', 'So, what\'s MY ratio?', 'It\'s on the left-top of pages.<br />\r\n<br />\r\n<img src=\"pic/ratio.png\" alt=\"ratio\" />\r\n<br />\r\n<br />\r\nIt\'s important to distinguish between your overall ratio and the individual ratio on each torrent you may be seeding or leeching. The overall ratio takes into account the total uploaded and downloaded from your account since you joined the site. The individual ratio takes into account those values for each torrent.\r\n<br />\r\n<br />\r\nYou may see two symbols instead of a number: \"Inf.\", which is just an abbreviation for Infinity, and means that you have downloaded 0 bytes while uploading a non-zero amount (ul/dl becomes infinity); \"---\", which should be read as \"non-available\", and shows up when you have both downloaded and uploaded 0 bytes (ul/dl = 0/0 which is an indeterminate amount).\r\n', '1', '2', '5');
INSERT INTO `faq` VALUES ('418', '18', '6', 'item', 'Why is my IP displayed on my details page?', 'Only you and the site moderators can view your IP address and email. Regular users do not see that information.', '1', '2', '6');
INSERT INTO `faq` VALUES ('421', '21', '6', 'item', 'Why am I listed as not connectable? (And why should I care?)', 'The tracker has determined that you are firewalled or NATed and cannot accept incoming connections. \r\n<br />\r\n<br />\r\nThis means that other peers in the swarm will be unable to connect to you, only you to them. Even worse, if two peers are both in this state they will not be able to connect at all. This has obviously a detrimental effect on the overall speed. \r\n<br />\r\n<br />\r\nThe way to solve the problem involves opening the ports used for incoming connections (the same range you defined in your client) on the firewall and/or configuring your NAT server to use a basic form of NAT for that range instead of NAPT (the actual process differs widely between different router models. Check your router documentation and/or support forum. You will also find lots of information on the subject at <a class=\"faqlink\" href=\"http://portforward.com/\">PortForward</a>).\r\n\r\n\r\n\r\n\r\n\r\n', '1', '2', '9');
INSERT INTO `faq` VALUES ('422', '22', '6', 'item', 'What are the different user classes?', '<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n<td class=\"embedded\" width=\"200\" valign=\"top\">&nbsp; <b class=\"Peasant_Name\">Peasant</b></td>\r\n<td class=\"embedded\" width=\"5\">&nbsp;</td>\r\n<td class=\"embedded\"> Demoted users. They must improve their ratio within 30 days or they will be banned. Cannot post funbox item, apply for links or upload subtitles.\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"User_Name\">User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">The default class of new members. may upload torrents between 12:00, Saturday and 23:59 Sunday of every week.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b  class=\"PowerUser_Name\">Power User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Get a invitation. Can upload torrents, view NFO files, view user list, ask for reseed, send invitation, access Power User and External Trackers forums, view Top 10, view other users\' torrent history (if user\'s privacy level is not set \'strong\'), delete subtitle uploaded by oneself.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"EliteUser_Name\">Elite User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\"><b class=\"EliteUser_Name\">Elite User</b> or above would never be deleted if parked.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"CrazyUser_Name\">Crazy User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Get two invitations. Can be anonymous when seeding/leeching/uploading. </td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"InsaneUser_Name\">Insane User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Can view general logs.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"VeteranUser_Name\">Veteran User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Get three invitations. Can view other users\' history of comments and forum posts. <b class=\"VeteranUser_Name\">Veteran User</b> or above would never be deleted whether parked or not.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b  class=\"ExtremeUser_Name\">Extreme User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Can update outdated external information and access Extreme User forum.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b  class=\"UltimateUser_Name\">Ultimate User</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Get 5 invitations.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"NexusMaster_Name\">Nexus Master</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Get 10 invitations.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <img class=\"star\" src=\"pic/trans.gif\" alt=\"Star\" /></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Has donated money to this tracker.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b  class=\"VIP_Name\">VIP</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">Same privileges as <b class=\"NexusMaster_Name\">Nexus Master</b> and is considered an Elite Member of this tracker. Immune to automatic demotion.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"Retiree_Name\">Retiree</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Former staff members.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b class=\"User_Name\">Other</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Customized title. </td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b  class=\"Uploader_Name\">Uploader</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Dedicated uploader, immune to automatic demotion. Can view who anonymous ones are.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b  class=\"Moderator_Name\">Moderator</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\" valign=\"top\">Can view staffbox and reportbox, manage funbox and polls, edit and delete any uploaded torrent, manage offers, manage forum posts and user comments, view confidential logs, delete any uploaded subtitle, manage code updates and chronicles at logs, view users\' invitation history, change general user account information. <b>Cannot</b> manage links,recent news or forums. <b>Cannot</b> set torrents sticky or on promotion.<b>Cannot</b> view users\' confidential information (e.g. IP address and Email address). <b>Cannot</b> delete user account.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b  class=\"Administrator_Name\">Administrator</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Other than changing site settings and managing donation, can do just about anything.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b  class=\"SysOp_Name\">SysOp</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">Dedicated site developer. Except managing donation, can do anything (including changing site settings)</td>\r\n</tr>\r\n<tr>\r\n<td class=\"embedded\" valign=\"top\">&nbsp; <b  class=\"StaffLeader_Name\">Staff Leader</b></td>\r\n<td class=\"embedded\">&nbsp;</td>\r\n<td class=\"embedded\">The boss. Can do anything.</td>\r\n</tr>\r\n</table>', '1', '2', '10');
INSERT INTO `faq` VALUES ('423', '23', '6', 'item', 'How does this promotion thing work anyway?', '<table cellspacing=\\\\\\\\\\\\\\\"3\\\\\\\\\\\\\\\" cellpadding=\\\\\\\\\\\\\\\"0\\\\\\\\\\\\\\\">\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\"200\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b class=\\\\\\\\\\\\\\\"Peasant_Name\\\\\\\\\\\\\\\">Peasant</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\"5\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">User would be demoted to this class under any of the following circumstances:<br />\r\n1.Downloaded more than 50 GB and with ratio below 0.4<br />\r\n2.Downloaded more than 100 GB and with ratio below 0.5<br />\r\n3.Downloaded more than 200 GB and with ratio below 0.6<br />\r\n4.Downloaded more than 400 GB and with ratio below 0.7<br />\r\n5.Downloaded more than 800 GB and with ratio below 0.8</td>\r\n</tr>\r\n\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b  class=\\\\\\\\\\\\\\\"PowerUser_Name\\\\\\\\\\\\\\\">Power User</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">Must have been a member for at least 4 weeks, have downloaded at least 50GB and have a ratio at or above 1.05. The promotion is automatic when these conditions are met. <br />\r\nNote that you will be automatically demoted from this status if your ratio drops below 0.95 at any time.</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b class=\\\\\\\\\\\\\\\"EliteUser_Name\\\\\\\\\\\\\\\">Elite User</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">Must have been a member for at least 8 weeks, have downloaded at least 120GB and have a ratio at or above 1.55. The promotion is automatic when these conditions are met. <br />\r\nNote that you will be automatically demoted from this status if your ratio drops below 1.45 at any time.</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b class=\\\\\\\\\\\\\\\"CrazyUser_Name\\\\\\\\\\\\\\\">Crazy User</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">Must have been a member for at least 15 weeks, have downloaded at least 300GB and have a ratio at or above 2.05. The promotion is automatic when these conditions are met. <br />\r\nNote that you will be automatically demoted from this status if your ratio drops below 1.95 at any time.</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b class=\\\\\\\\\\\\\\\"InsaneUser_Name\\\\\\\\\\\\\\\">Insane User</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">Must have been a member for at least 25 weeks, have downloaded at least 500GB and have a ratio at or above 2.55. The promotion is automatic when these conditions are met. <br />\r\nNote that you will be automatically demoted from this status if your ratio drops below 2.45 at any time.</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b class=\\\\\\\\\\\\\\\"VeteranUser_Name\\\\\\\\\\\\\\\">Veteran User</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">Must have been a member for at least 40 weeks, have downloaded at least 750GB and have a ratio at or above 3.05. The promotion is automatic when these conditions are met. <br />\r\nNote that you will be automatically demoted from this status if your ratio drops below 2.95 at any time.</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b  class=\\\\\\\\\\\\\\\"ExtremeUser_Name\\\\\\\\\\\\\\\">Extreme User</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">Must have been a member for at least 60 weeks, have downloaded at least 1TB and have a ratio at or above 3.55. The promotion is automatic when these conditions are met. <br />\r\nNote that you will be automatically demoted from this status if your ratio drops below 3.45 at any time.</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b  class=\\\\\\\\\\\\\\\"UltimateUser_Name\\\\\\\\\\\\\\\">Ultimate User</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">Must have been a member for at least 80 weeks, have downloaded at least 1.5TB and have a ratio at or above 4.05. The promotion is automatic when these conditions are met. <br />\r\nNote that you will be automatically demoted from this status if your ratio drops below 3.95 at any time.</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b class=\\\\\\\\\\\\\\\"NexusMaster_Name\\\\\\\\\\\\\\\">Nexus Master</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">Must have been a member for at least 100 weeks, have downloaded at least 3TB and have a ratio at or above 4.55. The promotion is automatic when these conditions are met. <br />\r\nNote that you will be automatically demoted from this status if your ratio drops below 4.45 at any time.</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <img class=\\\\\\\\\\\\\\\"star\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\"pic/trans.gif\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Star\\\\\\\\\\\\\\\" /></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">Just donate, see <a class=\\\\\\\\\\\\\\\"faqlink\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"donate.php\\\\\\\\\\\\\\\">here</a> for the details.</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b  class=\\\\\\\\\\\\\\\"VIP_Name\\\\\\\\\\\\\\\">VIP</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">Assigned by mods at their discretion to users they feel contribute something special to the site. (Anyone begging for VIP status will be automatically disqualified.)</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b class=\\\\\\\\\\\\\\\"User_Name\\\\\\\\\\\\\\\">Other</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">Customized title. Exchanged at bonus system or granted by admins.</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b  class=\\\\\\\\\\\\\\\"Uploader_Name\\\\\\\\\\\\\\\">Uploader</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">Appointed by Admins/SysOp/Staff Leader (see the \\\\\\\\\\\\\\\'Uploading\\\\\\\\\\\\\\\' section for conditions).</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b class=\\\\\\\\\\\\\\\"Retiree_Name\\\\\\\\\\\\\\\">Retiree</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">Granted by Admins/SysOp/Staff Leader</td>\r\n</tr>\r\n<tr>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\" valign=\\\\\\\\\\\\\\\"top\\\\\\\\\\\\\\\">&nbsp; <b  class=\\\\\\\\\\\\\\\"Moderator_Name\\\\\\\\\\\\\\\">Moderator</b></td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">&nbsp;</td>\r\n<td class=\\\\\\\\\\\\\\\"embedded\\\\\\\\\\\\\\\">You don\\\\\\\\\\\\\\\'t ask us, we\\\\\\\\\\\\\\\'ll ask you!</td>\r\n</tr>\r\n</table>', '0', '2', '11');
INSERT INTO `faq` VALUES ('425', '25', '6', 'item', 'Why can\'t my friend become a member?', 'There is a users limit (it is list at Home -&gt; Tracker Statistics -&gt; Limit). When that number is reached we stop accepting new members. Accounts inactive (i.e. not logged in for a long time) are automatically deleted, so keep trying.<br />\r\nWhen are inactive user accounts deleted? See <a class=\"faqlink\" href=\"rules.php\">Rules</a>', '1', '2', '1');
INSERT INTO `faq` VALUES ('426', '26', '6', 'item', 'How do I add an avatar to my profile?', 'First, find an image that you like, and that is within the <a class=\"faqlink\" href=\"rules.php\">rules</a>. Then you will have to find a place to host it, such as our own <a class=\"faqlink\" href=\"bitbucket-upload.php\">BitBucket</a>. To lighten tracker\'s load, we recommend you upload it to other websites and copy the URL you were given when uploading it to the Avatar URL field in <a class=\"faqlink\" href=\"usercp.php?action=personal\">UserCP</a>.<br />\r\n<br />\r\nPlease do not make a post just to test your avatar. If everything is all right you\'ll see it in your details page. ', '1', '2', '1');
INSERT INTO `faq` VALUES ('427', '27', '6', 'item', 'Most common reason for stats not updating', '<ul>\r\n<li>The server is overloaded and unresponsive. Just try to keep the session open until the server responds again. (Flooding the server with consecutive manual updates is not recommended.)</li>\r\n<li>You are using a faulty client. If you want to use an experimental or CVS version you do it at your own risk.</li>\r\n</ul>', '1', '3', '1');
INSERT INTO `faq` VALUES ('428', '28', '6', 'item', 'Best practices', '<ul>\r\n<li>If a torrent you are currently leeching/seeding is not listed on your detail page, just wait or force a manual update.</li>\r\n<li>Make sure you exit your client properly, so that the tracker receives \"event=completed\".</li>\r\n<li>If the tracker is down, do not stop seeding. As long as the tracker is back up before you exit the client the stats should update properly.</li>\r\n</ul>', '1', '3', '2');
INSERT INTO `faq` VALUES ('429', '29', '6', 'item', 'May I use any bittorrent client?', 'No. According to tests of common bittorrent clients by <a class=\"faqlink\" href=\"aboutnexus.php\">NexusPHP</a>, we allowed <b>only</b> the following bittorrent clients.<br />\r\nThe test report by <a class=\"faqlink\" href=\"aboutnexus.php\">NexusPHP</a> is <a class=\"faqlink\" href=\"http://www.nexusphp.com/wiki/%E5%AE%A2%E6%88%B7%E7%AB%AF%E6%B5%8B%E8%AF%95%E6%8A%A5%E5%91%8A\">here</a>. \r\n<br />\r\n<b>Windows:</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://azureus.sourceforge.net\">Azureus</a>: 2.5.0.4, 3.0.5.0, 3.0.5.2 and later versions</li>\r\n<li><a class=\"faqlink\" href=\"http://www.utorrent.com\">uTorrent</a>: 1.6.1, 1.7.5, 1.7.6, 1.7.7, 1.8Beta(Build 10364), 2.0(Build 17624) and later versions</li>\r\n<li><a class=\"faqlink\" href=\"http://www.bittorrent.com\">BitTorrent</a>: 6.0.1, 6.0.2, 6.0.3 and later versions</li>\r\n<li><a class=\"faqlink\" href=\"http://deluge-torrent.org\">Deluge</a>: 0.5.9.1, 1.1.6 and later versions</li>\r\n<li><a class=\"faqlink\" href=\"http://rufus.sourceforge.net\">Rufus</a>: 0.6.9, 0.7.0 and later versions</li>\r\n</ul>\r\n<b>Linux:</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://azureus.sourceforge.net\">Azureus</a>: 2.5.0.4, 3.0.5.0, 3.0.5.2 and later versions</li>\r\n<li><a class=\"faqlink\" href=\"http://deluge-torrent.org\">Deluge</a>: 0.5.9.1, 1.1.6 and later versions</li>\r\n<li><a class=\"faqlink\" href=\"http://rufus.sourceforge.net\">Rufus</a>: 0.6.9, 0.7.0 and later versions</li>\r\n<li><a class=\"faqlink\" href=\"http://www.transmissionbt.com\">Transmission</a>: 1.21 and later versions</li>\r\n<li><a class=\"faqlink\" href=\"http://libtorrent.rakshasa.no\">rTorrent</a>: 0.8.0(with libtorrent 0.12.0 or later) and later versions</li>\r\n<li><a class=\"faqlink\" href=\"http://www.rahul.net/dholmes/ctorrent/\">Enhanced CTorrent</a>: 3.3.2 and later versions</li>\r\n</ul>\r\n<b>MacOS X:</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://azureus.sourceforge.net\">Azureus</a>: 2.5.0.4, 3.0.5.0, 3.0.5.2 and later versions</li>\r\n<li><a class=\"faqlink\" href=\"http://www.transmissionbt.com\">Transmission</a>: 1.21 and later versions</li>\r\n<li><a class=\"faqlink\" href=\"http://sourceforge.net/projects/bitrocket/\">BitRocket</a>: 0.3.3(32) and later versions</li>\r\n</ul>\r\n<b>Symbian (For Testing Only):</b>\r\n<ul>\r\n<li><a class=\"faqlink\" href=\"http://amorg.aut.bme.hu/projects/symtorrent\">SymTorrent</a>: 1.41 and later versions</li>\r\n</ul>\r\n<br />\r\n\r\n<b>Support for https:</b>\r\n<ul>\r\n<li>uTorrent 1.61: cannot parse tracker https url, and marks itself as uTorrent 1.5</li>\r\n<li>Rufus: no support for https, and development ceased for years.</li>\r\n<li>rtorrent: needs to add SSL certification manually, see User Guide at its official site.</li>\r\n</ul>\r\n\r\n<br />\r\n\r\nPlease do not use any beta or testing version of bittorrent clients, e.g. uTorrent 1.8.0B. To get the best downloading experience, we highly recommend latest stable version of <a class=\"faqlink\" href=\"http://www.utorrent.com/download.php\">uTorrent</a> and <a class=\"faqlink\" href=\"http://azureus.sourceforge.net/download.php\">Azureus</a>.', '1', '5', '3');
INSERT INTO `faq` VALUES ('430', '30', '6', 'item', 'Why is a torrent I\'m leeching/seeding listed several times in my profile?', 'If for some reason (e.g. PC crash, or frozen client) your client exits improperly and you restart it, it will have a new peer_id, so it will show as a new torrent. The old one will never receive a \"event=completed\" or \"event=stopped\" and will be listed until some tracker timeout. Just ignore it, it will eventually go away.', '1', '3', '4');
INSERT INTO `faq` VALUES ('431', '31', '6', 'item', 'I\'ve finished or cancelled a torrent. Why is it still listed in my profile?', 'Some clients, notably TorrentStorm and Nova Torrent, do not report properly to the tracker when canceling or finishing a torrent. In that case the tracker will keep waiting for some message - and thus listing the torrent as seeding or leeching - until some timeout occurs. Just ignore it, it will eventually go away.', '1', '3', '5');
INSERT INTO `faq` VALUES ('433', '33', '6', 'item', 'Multiple IPs (Can I login from different computers?)', 'Yes, the tracker is capable of following sessions from different IPs for the same user. You may access the site and seed/leech simultaneously from as many computers as you want with the same account.<br />\r\nHowever, there is a limit for a single torrent. Per torrent 3 simultaneous connections are permitted per user, and in case of leeching only 1, which means you can leech a torrent from one location only at a time.', '1', '3', '1');
INSERT INTO `faq` VALUES ('436', '36', '6', 'item', 'Why can\'t I upload torrents?', 'See <a class=\"faqlink\" href=\"rules.php\">Rules</a>.', '1', '4', '1');
INSERT INTO `faq` VALUES ('437', '37', '6', 'item', 'What criteria must I meet before I can join the Uploader team?', 'You must:\r\n<ul>\r\n<li>have steady access to resources.</li>\r\n<li>upload not less than 5 torrents per week.</li>\r\n</ul>\r\nYou must be able to provide releases that:\r\n<ul>\r\n<li>are not older than 7 days</li>\r\n<li>you\'ll be able to seed, or make sure are well-seeded, for at least 24 hours.</li>\r\n<li>Also, you should have at least 2MBit upload bandwith.</li>\r\n</ul>\r\nIf you think you can match these criteria do not hesitate to <a class=\"faqlink\" href=\"contactstaff.php\">contact the staff</a>.<br />\r\n<b>Remember!</b> Write your application carefully! Be sure to include your upload speed and what kind of stuff you\'re planning to upload.<br />\r\nOnly well written letters with serious intent will be considered.', '1', '4', '2');
INSERT INTO `faq` VALUES ('438', '38', '6', 'item', 'Can I upload your torrents to other trackers?', 'No. We are a closed, limited-membership community. Only registered users can use the tracker. Posting our torrents on other trackers is useless, since most people who attempt to download them will be unable to connect with us. This generates a lot of frustration and bad-will against us, and will therefore not be tolerated.<br />\r\n<br />\r\nComplaints from other sites\' administrative staff about our torrents being posted on their sites will result in the banning of the users responsible.\r\n<br />\r\n<br />\r\nHowever, the files you download from us are yours to do as you please (except those marked as <b>EXCLUSIVE</b> by the uploader). You can always create another torrent, pointing to some other tracker, and upload it to the site of your choice.', '1', '4', '3');
INSERT INTO `faq` VALUES ('439', '39', '6', 'item', 'How do I use the files I\'ve downloaded?', 'Check out <a class=\"faqlink\" href=\"formats.php\">this guide</a>.', '1', '5', '1');
INSERT INTO `faq` VALUES ('440', '40', '6', 'item', 'Downloaded a movie and don\'t know what CAM/TS/TC/SCR means?', 'Check out <a class=\"faqlink\" href=\"videoformats.php\">this guide</a>.', '1', '5', '2');
INSERT INTO `faq` VALUES ('441', '41', '6', 'item', 'Why did an active torrent suddenly disappear?', 'There may be three reasons for this:<br />\r\n(<b>1</b>) The torrent may have been against the site <a class=\"faqlink\" href=\"rules.php\">rules</a>.\r\n<br />\r\n(<b>2</b>) The uploader may have deleted it because it was a bad release. A replacement will probably be uploaded to take its place.<br />\r\n(<b>3</b>) Torrents are automatically deleted after being dead for a long time.', '1', '5', '3');
INSERT INTO `faq` VALUES ('442', '42', '6', 'item', 'How do I resume a broken download or reseed something?', 'Open the .torrent file. When your client asks you for a location, choose the location of the existing file(s) and it will resume/reseed the torrent.', '1', '5', '4');
INSERT INTO `faq` VALUES ('443', '43', '6', 'item', 'Why do my downloads sometimes stall at 99%?', 'The more pieces you have, the harder it becomes to find peers who have pieces you are missing. That is why downloads sometimes slow down or even stall when there are just a few percent remaining. Just be patient and you will, sooner or later, get the remaining pieces.', '1', '5', '5');
INSERT INTO `faq` VALUES ('444', '44', '6', 'item', 'What are these \"a piece has failed a hash check\" messages? ', 'Bittorrent clients check the data they receive for integrity. When a piece fails this check it is automatically re-downloaded. Occasional hash fails are a common occurrence, and you shouldn\'t worry.<br />\r\n<br />\r\nSome clients have an (advanced) option/preference to \'kick/ban clients that send you bad data\' or similar. It should be turned on, since it makes sure that if a peer repeatedly sends you pieces that fail the hash check it will be ignored in the future.', '1', '5', '6');
INSERT INTO `faq` VALUES ('445', '45', '6', 'item', 'The torrent is supposed to be 100MB. How come I downloaded 120MB? ', 'See the hash fails topic. If your client receives bad data it will have to re-download it, therefore the total downloaded may be larger than the torrent size. Make sure the \"kick/ban\" option is turned on to minimize the extra downloads.', '1', '5', '7');
INSERT INTO `faq` VALUES ('446', '46', '6', 'item', 'Why do I get a \"Your ratio is too low! You need to wait xx h to start\" error?', 'From the time that each <b>new</b> torrent is uploaded to the tracker, there is a period of time that some users must wait before they can download it.<br />\r\nThis delay in downloading will only affect users with a low ratio and downloaded amount above 10 GB.<br />\r\n<br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">Ratio below</td>\r\n	<td class=\"embedded\" width=\"40\">0.4</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">delay of</td>\r\n	<td class=\"embedded\" width=\"100\">24h</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">Ratio below</td>\r\n	<td class=\"embedded\" width=\"40\">0.5</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">delay of</td>\r\n	<td class=\"embedded\" width=\"100\">12h</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">Ratio below</td>\r\n	<td class=\"embedded\" width=\"40\">0.6</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">delay of</td>\r\n	<td class=\"embedded\" width=\"100\">6h</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">Ratio below</td>\r\n	<td class=\"embedded\" width=\"40\">0.8</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">delay of</td>\r\n	<td class=\"embedded\" width=\"100\">3h</td>\r\n</tr>\r\n</table>', '0', '5', '8');
INSERT INTO `faq` VALUES ('447', '47', '6', 'item', 'Why do I get a \"Port xxxx is blacklisted\" error?', 'Your client is reporting to the tracker that it uses one of the default bittorrent ports (6881-6889) or any other common p2p port for incoming connections.<br />\r\n<br />\r\nWe does not allow clients to use ports commonly associated with p2p protocols. The reason for this is that it is a common practice for ISPs to throttle those ports (that is, limit the bandwidth, hence the speed). <br />\r\n<br />\r\nThe blocked ports list include the following:<br />\r\n<br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Direct Connect</td>\r\n	<td class=\"embedded\" width=\"100\">411 - 413</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">BitTorrent</td>\r\n	<td class=\"embedded\" width=\"100\">6881 - 6889</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Kazza</td>\r\n	<td class=\"embedded\" width=\"100\">1214</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Gnutella</td>\r\n	<td class=\"embedded\" width=\"100\">6346 - 6347</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">Emule</td>\r\n	<td class=\"embedded\" width=\"100\">4662</td>\r\n  </tr>\r\n  <tr>\r\n	<td class=\"embedded\" width=\"100\">WinMX</td>\r\n	<td class=\"embedded\" width=\"100\">6699</td>\r\n  </tr>\r\n</table>\r\n<br />\r\nIn order to use our tracker you must configure your client to use any port range that does not contain those ports (a range within the region 49152 through 65535 is preferable,\r\ncf. <a class=\"faqlink\" href=\"http://www.iana.org/assignments/port-numbers\">IANA</a>). Notice that some clients, like Azureus 2.0.7.0 or higher, use a single port for all torrents, while most others use one port per open torrent. The size of the range you choose should take this into account (typically less than 10 ports wide. There is no benefit whatsoever in choosing a wide range, and there are possible security implications). <br />\r\n<br />\r\nThese ports are used for connections between peers, not client to tracker. Therefore this change will not interfere with your ability to use other trackers (in fact it should <i>increase</i> your speed with torrents from any tracker, not just ours). Your client will also still be able to connect to peers that are using the standard ports. If your client does not allow custom ports to be used, you will have to switch to one that does.<br />\r\n<br />\r\nDo not ask us, or in the forums, which ports you should choose. The more random the choice is the harder it will be for ISPs to catch on to us and start limiting speeds on the ports we use. If we simply define another range ISPs will start throttling that range also. <br />\r\n<br />\r\nFinally, remember to forward the chosen ports in your router and/or open them in your\r\nfirewall, should you have them.', '1', '5', '9');
INSERT INTO `faq` VALUES ('448', '48', '6', 'item', 'What\'s this \"IOError - [Errno13] Permission denied\" error?', 'If you just want to fix it reboot your computer, it should solve the problem. Otherwise read on.<br />\r\nIOError means Input-Output Error, and that is a file system error, not a tracker one. It shows up when your client is for some reason unable to open the partially downloaded torrent files. The most common cause is two instances of the client to be running simultaneously: the last time the client was closed it somehow didn\'t really close but kept running in the background, and is therefore still locking the files, making it impossible for the new instance to open them.<br />\r\nA more uncommon occurrence is a corrupted FAT. A crash may result in corruption that makes the partially downloaded files unreadable, and the error ensues. Running scandisk should solve the problem. (Note that this may happen only if you\'re running Windows 9x - which only support FAT - or NT/2000/XP with FAT formatted hard drives. NTFS is much more robust and should never permit this problem.)\r\n', '1', '5', '10');
INSERT INTO `faq` VALUES ('450', '50', '6', 'item', 'Do not immediately jump on new torrents', 'The download speed mostly depends on the seeder-to-leecher ratio (SLR). Poor download speed is mainly a problem with new and very popular torrents where the SLR is low.<br />\r\n(Note: make sure you remember that you did not enjoy the low speed. Seed so that others will not endure the same.)<br />\r\n<br />In particular, do not do it if you have a slow connection. The best speeds will be found around the half-life of a torrent, when the SLR will be at its highest. (The downside is that you will not be able to seed so much. It\'s up to you to balance the pros and cons of this.)', '1', '6', '1');
INSERT INTO `faq` VALUES ('451', '51', '6', 'item', 'Limit your upload speed', 'The upload speed affects the download speed in essentially two ways:\r\n<ul>\r\n    <li>Bittorrent peers tend to favour those other peers that upload to them. This means that if A and B are leeching the same torrent and A is sending data to B at high speed then B will try to reciprocate. So due to this effect high upload speeds lead to high download speeds.</li>\r\n\r\n    <li>Due to the way TCP works, when A is downloading something from B it has to keep telling B that it received the data sent to him. (These are called acknowledgements - ACKs -, a sort of \"got it!\" messages). If A fails to do this then B will stop sending data and wait. If A is uploading at full speed there may be no bandwidth left for the ACKs and they will be delayed. So due to this effect excessively high upload speeds lead to low download speeds.</li>\r\n</ul>\r\n\r\nThe full effect is a combination of the two. The upload should be kept as high as possible while allowing the ACKs to get through without delay. <b>A good thumb rule is keeping the upload at about 80% of the theoretical upload speed. </b>You will have to fine tune yours to find out what works best for you. (Remember that keeping the upload high has the additional benefit of helping with your ratio.) <br />\r\n<br />\r\nIf you are running more than one instance of a client it is the overall upload speed that you must take into account. Some clients limit global upload speed, others do it on a per torrent basis. Know your client. The same applies if you are using your connection for anything else (e.g. browsing or ftp), always think of the overall upload speed.', '1', '6', '2');
INSERT INTO `faq` VALUES ('452', '52', '6', 'item', 'Limit the number of simultaneous connections', 'Some operating systems (like Windows 9x) do not deal well with a large number of connections, and may even crash. Also some home routers (particularly when running NAT and/or firewall with stateful inspection services) tend to become slow or crash when having to deal with too many connections. There are no fixed values for this, you may try 60 or 100 and experiment with the value. Note that these numbers are additive, if you have two instances of a client running the numbers add up.', '1', '6', '3');
INSERT INTO `faq` VALUES ('453', '53', '6', 'item', 'Limit the number of simultaneous uploads', 'Isn\'t this the same as above? No. Connections limit the number of peers your client is talking to and/or downloading from. Uploads limit the number of peers your client is actually uploading to. The ideal number is typically much lower than the number of connections, and highly dependent on your (physical) connection.', '1', '6', '4');
INSERT INTO `faq` VALUES ('454', '54', '6', 'item', 'Just give it some time', 'As explained above peers favour other peers that upload to them. When you start leeching a new torrent you have nothing to offer to other peers and they will tend to ignore you. This makes the starts slow, in particular if, by chance, the peers you are connected to include few or no seeders. The download speed should increase as soon as you have some pieces to share.', '1', '6', '5');
INSERT INTO `faq` VALUES ('455', '55', '6', 'item', 'Why is my browsing so slow while leeching?', 'Your download speed is always finite. If you are a peer in a fast torrent it will almost certainly saturate your download bandwidth, and your browsing will suffer. Many clients allows you to limit the download speed and try it.<br />\r\n<br />\r\nBrowsing was used just as an example, the same would apply to gaming, IMing, etc...', '1', '6', '6');
INSERT INTO `faq` VALUES ('456', '56', '6', 'item', 'What is a proxy?', 'Basically a middleman. When you are browsing a site through a proxy your requests are sent to the proxy and the proxy forwards them to the site instead of you connecting directly to the site. There are several classifications (the terminology is far from standard):<br />\r\n<br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n	<td class=\"embedded\" valign=\"top\" width=\"100\">&nbsp;Transparent</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">A transparent proxy is one that needs no configuration on the clients. It works by automatically redirecting all port 80 traffic to the proxy. (Sometimes used as synonymous for non-anonymous.)</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;Explicit/Voluntary</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">Clients must configure their browsers to use them.</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;Anonymous</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">The proxy sends no client identification to the server. (HTTP_X_FORWARDED_FOR header is not sent; the server does not see your IP.)</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;Highly Anonymous</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">The proxy sends no client nor proxy identification to the server. (HTTP_X_FORWARDED_FOR, HTTP_VIA and HTTP_PROXY_CONNECTION headers are not sent; the server doesn\'t see your IP and doesn\'t even know you\'re using a proxy.)</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" valign=\"top\">&nbsp;Public</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" valign=\"top\">(Self explanatory)</td>\r\n</tr>\r\n</table>\r\n<br />\r\nA transparent proxy may or may not be anonymous, and there are several levels of anonymity.', '1', '7', '1');
INSERT INTO `faq` VALUES ('457', '57', '6', 'item', 'How do I find out if I\'m behind a (transparent/anonymous) proxy?', 'Try <a href=\"http://proxyjudge.org\" class=\"faqlink\">ProxyJudge</a>. It lists the HTTP headers that the server where it is running received from you. The relevant ones are HTTP_CLIENT_IP, HTTP_X_FORWARDED_FOR and REMOTE_ADDR.', '1', '7', '2');
INSERT INTO `faq` VALUES ('475', '75', '6', 'item', 'Why am I listed as not connectable even though I\'m not NAT/Firewalled?', 'The tracker is quite smart at finding your real IP, but it does need the proxy to send the HTTP header HTTP_X_FORWARDED_FOR. If your ISP\'s proxy does not then what happens is that the tracker will interpret the proxy\'s IP address as the client\'s IP address. So when you login and the tracker tries to connect to your client to see if you are NAT/firewalled it will actually try to connect to the proxy on the port your client reports to be using for incoming connections. Naturally the proxy will not be listening on that port, the connection will fail and the tracker will think you are NAT/firewalled.', '1', '7', '3');
INSERT INTO `faq` VALUES ('462', '62', '6', 'item', 'Maybe my address is blacklisted?', 'The site keeps a list of blocked IP addresses for banned users or attackers. This works at Apache/PHP level, and only blocks <i>logins</i> from those addresses. It should not stop you from reaching the site. In particular it does not block lower level protocols, you should be able to ping/traceroute the server even if your address is blacklisted. If you cannot then the reason for the problem lies elsewhere.<br />\r\n<br />\r\nIf somehow your address is blocked by mistake, contact us about it.', '1', '8', '1');
INSERT INTO `faq` VALUES ('463', '63', '6', 'item', 'Your ISP blocks the site\'s address', '(In first place, it\'s unlikely your ISP is doing so. DNS name resolution and/or network problems are the usual culprits.) \r\n<br />\r\nThere\'s nothing we can do. You should contact your ISP (or get a new one). Note that you can still visit the site via a proxy, follow the instructions in the relevant section. In this case it doesn\'t matter if the proxy is anonymous or not, or which port it listens to.<br />\r\n<br />\r\nNotice that you will always be listed as an \"unconnectable\" client because the tracker will be unable to check that you\'re capable of accepting incoming connections.', '1', '8', '2');
INSERT INTO `faq` VALUES ('465', '65', '6', 'item', 'You may try this', 'Post in the <a class=\"faqlink\" href=\"forums.php\">Forums</a>, by all means. You\'ll find they are usually a friendly and helpful place, provided you follow a few basic guidelines: <ul>\r\n<li>Make sure your problem is not really in this FAQ. There\'s no point in posting just to be sent back here. </li>\r\n<li>Before posting read the sticky topics (the ones at the top). Many times new information that still hasn\'t been incorporated in the FAQ can be found there.</li>\r\n<li>Help us in helping you. Do not just say \"it doesn\'t work!\". Provide details so that we don\'t have to guess or waste time asking. What client do you use? What\'s your OS? What\'s your network setup? What\'s the exact error message you get, if any? What are the torrents you are having problems with? The more you tell the easiest it will be for us, and the more probable your post will get a reply.</li>\r\n<li>And needless to say: be polite. Demanding help rarely works, asking for it usually does the trick.</li></ul>', '1', '9', '1');
INSERT INTO `faq` VALUES ('466', '66', '6', 'item', 'Why do I get a \"Your slot limit is reached! You may at most download xx torrents at the same time\" error?', 'This is part of the \"Slot System\". The slot system is being used to limit the concurrent downloads for users that have low ratio and downloaded amount above 10 GB<br /><br />\r\nRules: <br />\r\n<table cellspacing=\"3\" cellpadding=\"0\">\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">Ratio below</td>\r\n	<td class=\"embedded\" width=\"40\">0.5</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">available slots</td>\r\n	<td class=\"embedded\" width=\"40\">1</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">Ratio below</td>\r\n	<td class=\"embedded\" width=\"40\">0.65</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">available slots</td>\r\n	<td class=\"embedded\" width=\"100\">2</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">Ratio below</td>\r\n	<td class=\"embedded\" width=\"40\">0.8</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">available slots</td>\r\n	<td class=\"embedded\" width=\"100\">3</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">Ratio below</td>\r\n	<td class=\"embedded\" width=\"40\">0.95</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">available slots</td>\r\n	<td class=\"embedded\" width=\"100\">4</td>\r\n</tr>\r\n<tr>\r\n	<td class=\"embedded\" width=\"100\">Ratio above</td>\r\n	<td class=\"embedded\" width=\"40\">0.95</td>\r\n	<td class=\"embedded\" width=\"10\">&nbsp;</td>\r\n	<td class=\"embedded\" width=\"100\">available slots</td>\r\n	<td class=\"embedded\" width=\"100\">unlimited</td>\r\n</tr>\r\n</table>\r\n<br />\r\nIn all cases the seeding slots are unlimited. However if you have already filled all your available download slots and try to start seeding you will receive the same error. In this case you must free at least one download slot in order to start all your seeds and then start the download. If all your download slots are filled the system will deny any connection before validating if you want to download or seed. So first start your seeds and after that your downloads. <br />\r\n<br /><br />\r\nAny time, you can check your available slots in the member bar on top of the page.', '0', '5', '12');
INSERT INTO `faq` VALUES ('467', '67', '6', 'item', 'What is the passkey System? How does it work?', 'The passkey system is implemented to verify if you are registered with the tracker. Every user has a personal passkey, a random key generated by the system. When a user tries to download a torrent, his personal passkey is imprinted in the tracker URL of the torrent, allowing to the tracker to identify any source connected on it. In this way, you can seed a torrent for example, at home and at your office simultaneously without any problem with the 2 different IPs.\r\n', '1', '5', '13');
INSERT INTO `faq` VALUES ('468', '68', '6', 'item', 'Why do I get an \"Unknown passkey\" error? ', 'You will get this error, firstly if you are not registered on our tracker, or if you haven\'t downloaded the torrent to use from our webpage, when you were logged in. In this case, just register or log in and re-download the torrent.<br />\r\nThere is a chance to get this error also, at the first time you download anything as a new user, or at the first download after you reset your passkey. The reason is simply that the tracker reviews the changes in the passkeys every few minutes and not instantly. For that reason just leave the torrent running for a few minutes, and you will get eventually an OK message from the tracker.', '1', '5', '14');
INSERT INTO `faq` VALUES ('469', '69', '6', 'item', 'When do I need to reset my passkey?', '<ul><li>If your passkey has been leaked and other user(s) uses it to download torrents using your account. In this case, you will see torrents stated in your account that you are not leeching or seeding . </li>\r\n<li>When your clients hangs up or your connection is terminated without pressing the stop button of your client. In this case, in your account you will see that you are still leeching/seeding the torrents even that your client has been closed. Normally these \"ghost peers\" will be cleaned automatically within 30 minutes, but if you want to resume your downloads and the tracker denied that due to the fact that you \"already are downloading the same torrent\" then you should reset your passkey and re-download the torrent, then resume it.  </li></ul>', '1', '5', '15');
INSERT INTO `faq` VALUES ('470', '70', '6', 'item', 'What is DHT? Why must I turn it off and how?', 'DHT must be disabled in your client. DHT can cause your stats to be recorded incorrectly and could be seen as cheating. Anyone using this will be banned for cheating the system.\r\n<br />\r\nFortunately, this tracker would parse uploaded .torrent files and automatically disable DHT. That\'s why you must re-downloaded the torrent before starting seeding.', '1', '5', '16');
INSERT INTO `faq` VALUES ('471', '71', '6', 'categ', 'How can I help translate the site language into my native language?', '', '1', '1', '8');
INSERT INTO `faq` VALUES ('472', '72', '6', 'item', 'What skills do I need to do the translation?', 'Translate the site into another language is quite easy. You needn\'t be skilled in PHP or dynamic website design. In fact, all you need is proficient understanding of English (the default site language) and the language you plan to translate into. Maybe some basic knowledge in HTML would help.<br /><br />\r\nMoreover, we give a detailed tutorial on how to do the translation <a href=\"#73\" class=\"faqlink\"><b>HERE</b></a>. And our coders would be more than pleased to answer the questions you may encounter.<br /><br />\r\nTranslate the whole site into another language would take estimated 10 hours. And extra time is needed to maintain the translation when site code is updated.<br /><br />\r\nSo, if you think you could help, feel free to <a class=\"faqlink\" href=\"contactstaff.php\"><b>CONTACT US</b></a>. Needless to say, you would be rewarded.', '1', '71', '1');
INSERT INTO `faq` VALUES ('474', '74', '6', 'item', 'Why does my client notify me of low disk space even if there is plenty left?', 'Most possible reason is that the file system of your disk partitions is FAT32, which has a maximum file size limit of 4 GB. If your operation system is Windows, consider converting file system to NTFS. Check <a class=\"faqlink\" href=\"http://technet.microsoft.com/en-us/library/bb456984.aspx\">here</a> for details.\r\n', '1', '5', '17');
INSERT INTO `faq` VALUES ('478', '75', '25', 'item', '不能正常使用UT，提示信息：Error opening Windows firewall 0x80070005 拒绝访问', '原因产生是因为μTorrent不能通过windows自带防火墙允许。\r\n解决方法是将μTorrent加入windows自带防火墙例外，或者关掉自带防火墙！\r\n', '1', '5', '18');
INSERT INTO `faq` VALUES ('479', '76', '25', 'item', '如何续种及辅种教程', '首先，感谢你有想做种跟大家分享你电脑上资源的想法，感谢你对麦田的支持。\r\n  \r\n  众所周知，如果随便发补相同的种子的话，会造成你不必要的浪费及管理员的工作量。辅种或者说补种是说如果你手上有某资源，但是别人已经发布过相同的资源在PT上，那么你就不需要利用UT重新制作种子，只需要“补种”或者“辅种”即可。\r\n  \r\n  这样做和自己发布种子效果是一样的，只是发种人不是你而已，PT的目的是分享，这也是我们的宗旨。\r\n\r\n续种和辅种的步骤都是一样的，具体如下：\r\n1.下载种子文件。\r\n2.打开种子文件，“保存位置”选文件现在的位置，并勾选“跳过散列检测”\r\n3.μTorrent的“状态”一栏提示“已检查 ××%”\r\n4.检查完成，“tracker状态”一栏提示“工作中”，表示操作成功\r\n若没有提示“已检查 ××%”，请确保文件相同，并且位置没有选错。\r\n\r\n以上步骤的前提是你的资源和已经发布过的资源是否完全相同', '0', '5', '19');
INSERT INTO `faq` VALUES ('480', '27', '25', 'item', '为什么我下载量和分享率以及注册时间都达到升级标准却没有升级呢？', '这个时候你要做的是多点耐心，第二天早上一觉醒来，你会发现你已然升级，这是因为服务器对用户等级判定每天一次！', '1', '2', '12');
INSERT INTO `faq` VALUES ('483', '79', '25', 'item', 'ut突然变成英文了怎么办?', '变成英文的同学下载这个文件\r\n解压并保存到ut目录下\r\n比如我的ut在D:\\Program Files\\uTorrent\r\n就放这里\r\n然后重启ut即可\r\n<a class=\"faqlink\" href=http://pt.nwsuaf6.edu.cn/getattachment.php?id=41049&dlkey=29c06c826608401ce42d9949b645d6b4>下载的就是这个了</a><br /><br /><a href=http://pt.nwsuaf6.edu.cn/forums.php?action=viewtopic&topicid=3084&page=p39344#pid39344>论坛帖子点这里</a>', '3', '5', '22');
INSERT INTO `faq` VALUES ('484', '39', '25', 'item', '你在搞什么鬼?你上传的不是bencode文件!!', '\r\n<a class=\"faqlink\" href=http://pt.nwsuaf6.edu.cn/forums.php?action=viewtopic&forumid=14&topicid=2980>点击进入论坛查看贴子</a>\r\n请使用稳定版本ut', '3', '4', '4');
INSERT INTO `faq` VALUES ('485', '13', '25', 'item', '为什么我不能用ut下载?', '<a class=\"faqlink\" href=http://pt.nwsuaf6.edu.cn/forums.php?action=viewtopic&forumid=13&topicid=1728>首先请查看此帖，点击进入</a>\r\n\r\n<br/><a class=\"faqlink\" href=http://pt.nwsuaf6.edu.cn/forums.php?action=viewtopic&forumid=13&topicid=1859>如果使用360浏览器请看此帖，点击进入</a>\r\n<br/>', '3', '1', '4');
INSERT INTO `faq` VALUES ('486', '14', '25', 'item', '如何设置ut？', '麦田页面底部提供绿化并且设置过的ut下载，请使用此版本。<br/>\r\n设置范例请看论坛此贴\r\n<a class=\"faqlink\" href=http://pt.nwsuaf6.edu.cn/forums.php?action=viewtopic&forumid=13&topicid=4395>点击进入</a>', '1', '1', '5');
INSERT INTO `faq` VALUES ('487', '15', '25', 'item', '下载下来的种子能删吗？资源能删吗？', '使用ut时，<b>如果按照默认设置</b>，打开种子并下载完成之后，ut会在软件所在的文件夹（比如D:\\UTORRENT）或者用户文档配置目录（非绿色版本）自动复制一个种子文件，供做种用。<color=\'red\'>此处种子文件不可删除，如果删除则不能继续做种。<br /></color>\r\n<b>如果按照设置范例（参见下条）</b>设置过之后，会在所设置的路径文件夹中（目录选项）生成种子文件，此处种子不可删除。其他地方种子如果不需要可以删除<br/>\r\n下载完成的资源如果不想继续做种则可以删除.删除之后不能继续做种.有可能导致分享率过低', '3', '1', '6');

-- ----------------------------
-- Table structure for `files`
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `torrent` mediumint(8) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL default '',
  `size` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `torrent` (`torrent`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of files
-- ----------------------------

-- ----------------------------
-- Table structure for `forummods`
-- ----------------------------
DROP TABLE IF EXISTS `forummods`;
CREATE TABLE `forummods` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `forumid` smallint(5) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `forumid` (`forumid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forummods
-- ----------------------------

-- ----------------------------
-- Table structure for `forums`
-- ----------------------------
DROP TABLE IF EXISTS `forums`;
CREATE TABLE `forums` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `sort` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL default '',
  `minclassread` tinyint(3) unsigned NOT NULL default '0',
  `minclasswrite` tinyint(3) unsigned NOT NULL default '0',
  `postcount` int(10) unsigned NOT NULL default '0',
  `topiccount` int(10) unsigned NOT NULL default '0',
  `minclasscreate` tinyint(3) unsigned NOT NULL default '0',
  `forid` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forums
-- ----------------------------

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL,
  `friendid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `userfriend` (`userid`,`friendid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friends
-- ----------------------------

-- ----------------------------
-- Table structure for `fun`
-- ----------------------------
DROP TABLE IF EXISTS `fun`;
CREATE TABLE `fun` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `body` text,
  `title` varchar(255) NOT NULL default '',
  `status` enum('normal','dull','notfunny','funny','veryfunny','banned') NOT NULL default 'normal',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fun
-- ----------------------------

-- ----------------------------
-- Table structure for `funds`
-- ----------------------------
DROP TABLE IF EXISTS `funds`;
CREATE TABLE `funds` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `usd` decimal(8,2) NOT NULL default '0.00',
  `cny` decimal(8,2) NOT NULL default '0.00',
  `user` mediumint(8) unsigned NOT NULL,
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `memo` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of funds
-- ----------------------------

-- ----------------------------
-- Table structure for `funvotes`
-- ----------------------------
DROP TABLE IF EXISTS `funvotes`;
CREATE TABLE `funvotes` (
  `funid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL,
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote` enum('fun','dull') NOT NULL default 'fun',
  PRIMARY KEY  (`funid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of funvotes
-- ----------------------------

-- ----------------------------
-- Table structure for `givebonus`
-- ----------------------------
DROP TABLE IF EXISTS `givebonus`;
CREATE TABLE `givebonus` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `bonusfromuserid` mediumint(8) unsigned NOT NULL,
  `bonustotorrentid` mediumint(8) unsigned NOT NULL,
  `bonus` decimal(10,1) unsigned NOT NULL,
  `type` int(1) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of givebonus
-- ----------------------------

-- ----------------------------
-- Table structure for `invitebox`
-- ----------------------------
DROP TABLE IF EXISTS `invitebox`;
CREATE TABLE `invitebox` (
  `Id` int(11) NOT NULL auto_increment,
  `username` varchar(20) NOT NULL default '',
  `email` varchar(30) NOT NULL default '',
  `school` varchar(30) default NULL,
  `grade` varchar(20) default NULL,
  `web` varchar(50) default NULL,
  `disk` varchar(50) default NULL,
  `pic` varchar(100) default NULL,
  `self_introduction` varchar(255) default NULL,
  `added` datetime default NULL,
  `dealt_by` varchar(20) NOT NULL default 'no',
  `ip` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invitebox
-- ----------------------------

-- ----------------------------
-- Table structure for `invites`
-- ----------------------------
DROP TABLE IF EXISTS `invites`;
CREATE TABLE `invites` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `inviter` mediumint(8) unsigned NOT NULL default '0',
  `invitee` varchar(80) NOT NULL default '',
  `hash` char(32) NOT NULL,
  `time_invited` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `hash` (`hash`(3))
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invites
-- ----------------------------

-- ----------------------------
-- Table structure for `iplog`
-- ----------------------------
DROP TABLE IF EXISTS `iplog`;
CREATE TABLE `iplog` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `ip` varbinary(64) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL,
  `access` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `isp`
-- ----------------------------
DROP TABLE IF EXISTS `isp`;
CREATE TABLE `isp` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of isp
-- ----------------------------
INSERT INTO `isp` VALUES ('1', '中国电信');
INSERT INTO `isp` VALUES ('2', '中国网通');
INSERT INTO `isp` VALUES ('3', '中国铁通');
INSERT INTO `isp` VALUES ('4', '中国移动');
INSERT INTO `isp` VALUES ('5', '中国联通');
INSERT INTO `isp` VALUES ('6', '中国教育网');
INSERT INTO `isp` VALUES ('20', 'Other');

-- ----------------------------
-- Table structure for `language`
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `lang_name` varchar(50) NOT NULL,
  `flagpic` varchar(255) NOT NULL default '',
  `sub_lang` tinyint(3) unsigned NOT NULL default '1',
  `rule_lang` tinyint(3) unsigned NOT NULL default '0',
  `site_lang` tinyint(3) unsigned NOT NULL default '0',
  `site_lang_folder` varchar(255) NOT NULL default '',
  `trans_state` enum('up-to-date','outdate','incomplete','need-new','unavailable') NOT NULL default 'unavailable',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('1', 'Bulgarian', 'bulgaria.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('2', 'Croatian', 'croatia.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('3', 'Czech', 'czechrep.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('4', 'Danish', 'denmark.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('5', 'Dutch', 'netherlands.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('6', 'English', 'uk.gif', '1', '1', '1', 'en', 'up-to-date');
INSERT INTO `language` VALUES ('7', 'Estonian', 'estonia.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('8', 'Finnish', 'finland.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('9', 'French', 'france.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('10', 'German', 'germany.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('11', 'Greek', 'greece.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('12', 'Hebrew', 'israel.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('13', 'Hungarian', 'hungary.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('14', 'Italian', 'italy.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('15', '日本語', 'japan.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('16', '한국어', 'southkorea.gif', '1', '0', '0', 'ko', 'unavailable');
INSERT INTO `language` VALUES ('17', 'Norwegian', 'norway.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('18', 'Other', 'jollyroger.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('19', 'Polish', 'poland.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('20', 'Portuguese', 'portugal.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('21', 'Romanian', 'romania.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('22', 'Russian', 'russia.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('23', 'Serbian', 'serbia.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('24', 'Slovak', 'slovakia.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('25', '简体中文', 'china.gif', '1', '1', '1', 'chs', 'up-to-date');
INSERT INTO `language` VALUES ('26', 'Spanish', 'spain.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('27', 'Swedish', 'sweden.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('28', '繁體中文', 'hongkong.gif', '1', '1', '1', 'cht', 'up-to-date');
INSERT INTO `language` VALUES ('29', 'Turkish', 'turkey.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('30', 'Slovenian', 'slovenia.gif', '1', '0', '0', '', 'unavailable');
INSERT INTO `language` VALUES ('31', 'Thai', 'thailand.gif', '1', '0', '0', 'th', 'unavailable');

-- ----------------------------
-- Table structure for `links`
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of links
-- ----------------------------

-- ----------------------------
-- Table structure for `locations`
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `location_main` varchar(200) NOT NULL,
  `location_sub` varchar(200) NOT NULL,
  `flagpic` varchar(50) default NULL,
  `start_ip` varchar(20) NOT NULL,
  `end_ip` varchar(20) NOT NULL,
  `theory_upspeed` int(10) unsigned NOT NULL default '10',
  `practical_upspeed` int(10) unsigned NOT NULL default '10',
  `theory_downspeed` int(10) unsigned NOT NULL default '10',
  `practical_downspeed` int(10) unsigned NOT NULL default '10',
  `hit` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of locations
-- ----------------------------

-- ----------------------------
-- Table structure for `loginattempts`
-- ----------------------------
DROP TABLE IF EXISTS `loginattempts`;
CREATE TABLE `loginattempts` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `ip` varchar(64) NOT NULL default '',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `banned` enum('yes','no') NOT NULL default 'no',
  `attempts` smallint(5) unsigned NOT NULL default '0',
  `type` enum('login','recover') NOT NULL default 'login',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loginattempts
-- ----------------------------

-- ----------------------------
-- Table structure for `lottery`
-- ----------------------------
DROP TABLE IF EXISTS `lottery`;
CREATE TABLE `lottery` (
  `id` int(10) NOT NULL auto_increment,
  `ownerid` int(10) default NULL,
  `selfkey` text character set utf8 NOT NULL,
  `drawid` int(10) NOT NULL default '0',
  `num1` int(10) NOT NULL default '0',
  `num2` int(10) NOT NULL default '0',
  `num3` int(10) NOT NULL default '0',
  `num4` int(10) NOT NULL default '0',
  `num5` int(10) NOT NULL default '0',
  `shoptime` date NOT NULL default '0000-00-00',
  `isencase` int(1) NOT NULL default '1',
  `encasetime` date NOT NULL default '0000-00-00',
  `multiple` int(10) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `lotteryowner` (`ownerid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of lottery
-- ----------------------------

-- ----------------------------
-- Table structure for `media`
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` (`id`, `name`, `sort_index`) VALUES
(1, 'Blu-ray', 0),
(2, 'HD DVD', 1),
(4, 'MiniBD', 4),
(5, 'HDTV', 5),
(6, 'DVDR', 6),
(7, 'Encode', 3),
(3, 'Remux', 2),
(8, 'CD', 7),
(9, 'Track', 9);
-- ----------------------------
-- Table structure for `messages`
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `sender` mediumint(8) unsigned NOT NULL default '0',
  `receiver` mediumint(8) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `subject` varchar(128) NOT NULL default '',
  `msg` text,
  `unread` enum('yes','no') NOT NULL default 'yes',
  `location` smallint(6) NOT NULL default '1',
  `saved` enum('no','yes') NOT NULL default 'no',
  `goto` tinyint(1) unsigned zerofill NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `receiver` (`receiver`),
  KEY `sender` (`sender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messages
-- ----------------------------

-- ----------------------------
-- Table structure for `modpanel`
-- ----------------------------
DROP TABLE IF EXISTS `modpanel`;
CREATE TABLE `modpanel` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(128) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `info` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modpanel
-- ----------------------------
INSERT INTO `modpanel` VALUES ('1', '流量异常监控', 'cheaters.php', '查看流量异常的账户');
INSERT INTO `modpanel` VALUES ('2', '重复IP地址检测', 'ipcheck.php', '检查IP地址重复的用户');
INSERT INTO `modpanel` VALUES ('3', '当前在线客户端', 'allagents.php', '查看当前在线（上传/下载/做种）的客户端');
INSERT INTO `modpanel` VALUES ('4', '广告管理', 'admanage.php', '添加站点广告');
INSERT INTO `modpanel` VALUES ('5', '发布员状态', 'uploaders.php', '查看发布员当前状态');
INSERT INTO `modpanel` VALUES ('6', 'Tracker服务器状态', 'stats.php', '查看tracker状态');
INSERT INTO `modpanel` VALUES ('7', 'IP地址检测', 'testip.php', '检测IP是否被禁止锁定');
INSERT INTO `modpanel` VALUES ('8', '添加积分', 'amountbonus.php', '为指定用户或组添加积分');
INSERT INTO `modpanel` VALUES ('9', '清理服务器缓存', 'clearcache.php', '清空memcached的缓存');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `body` text,
  `title` varchar(255) NOT NULL default '',
  `notify` enum('yes','no') NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `added` (`added`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `offers`
-- ----------------------------
DROP TABLE IF EXISTS `offers`;
CREATE TABLE `offers` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(225) NOT NULL,
  `descr` text,
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `allowedtime` datetime NOT NULL default '0000-00-00 00:00:00',
  `yeah` smallint(5) unsigned NOT NULL default '0',
  `against` smallint(5) unsigned NOT NULL default '0',
  `category` smallint(5) unsigned NOT NULL default '0',
  `comments` mediumint(8) unsigned NOT NULL default '0',
  `allowed` enum('allowed','pending','denied') NOT NULL default 'pending',
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of offers
-- ----------------------------

-- ----------------------------
-- Table structure for `offervotes`
-- ----------------------------
DROP TABLE IF EXISTS `offervotes`;
CREATE TABLE `offervotes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `offerid` mediumint(8) unsigned NOT NULL default '0',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `vote` enum('yeah','against') NOT NULL default 'yeah',
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of offervotes
-- ----------------------------

-- ----------------------------
-- Table structure for `overforums`
-- ----------------------------
DROP TABLE IF EXISTS `overforums`;
CREATE TABLE `overforums` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL default '',
  `minclassview` tinyint(3) unsigned NOT NULL default '0',
  `sort` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of overforums
-- ----------------------------

-- ----------------------------
-- Table structure for `peers`
-- ----------------------------
DROP TABLE IF EXISTS `peers`;
CREATE TABLE `peers` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `torrent` mediumint(8) unsigned NOT NULL default '0',
  `peer_id` binary(20) NOT NULL,
  `ip` varbinary(64) NOT NULL default '',
  `port` smallint(5) unsigned NOT NULL default '0',
  `uploaded` bigint(20) unsigned NOT NULL default '0',
  `downloaded` bigint(20) unsigned NOT NULL default '0',
  `to_go` bigint(20) unsigned NOT NULL default '0',
  `seeder` enum('yes','no') NOT NULL default 'no',
  `started` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_action` datetime NOT NULL default '0000-00-00 00:00:00',
  `prev_action` datetime NOT NULL default '0000-00-00 00:00:00',
  `connectable` enum('yes','no') NOT NULL default 'yes',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `agent` varchar(60) NOT NULL default '',
  `finishedat` int(10) unsigned NOT NULL default '0',
  `downloadoffset` bigint(20) unsigned NOT NULL default '0',
  `uploadoffset` bigint(20) unsigned NOT NULL default '0',
  `passkey` char(32) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`),
  KEY `torrent` (`torrent`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of peers
-- ----------------------------

-- ----------------------------
-- Table structure for `pmboxes`
-- ----------------------------
DROP TABLE IF EXISTS `pmboxes`;
CREATE TABLE `pmboxes` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL,
  `boxnumber` tinyint(3) unsigned NOT NULL default '2',
  `name` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pmboxes
-- ----------------------------

-- ----------------------------
-- Table structure for `pollanswers`
-- ----------------------------
DROP TABLE IF EXISTS `pollanswers`;
CREATE TABLE `pollanswers` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pollid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL,
  `selection` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`),
  KEY `selection` (`selection`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pollanswers
-- ----------------------------

-- ----------------------------
-- Table structure for `polls`
-- ----------------------------
DROP TABLE IF EXISTS `polls`;
CREATE TABLE `polls` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `question` varchar(255) NOT NULL default '',
  `option0` varchar(40) NOT NULL default '',
  `option1` varchar(40) NOT NULL default '',
  `option2` varchar(40) NOT NULL default '',
  `option3` varchar(40) NOT NULL default '',
  `option4` varchar(40) NOT NULL default '',
  `option5` varchar(40) NOT NULL default '',
  `option6` varchar(40) NOT NULL default '',
  `option7` varchar(40) NOT NULL default '',
  `option8` varchar(40) NOT NULL default '',
  `option9` varchar(40) NOT NULL default '',
  `option10` varchar(40) NOT NULL default '',
  `option11` varchar(40) NOT NULL default '',
  `option12` varchar(40) NOT NULL default '',
  `option13` varchar(40) NOT NULL default '',
  `option14` varchar(40) NOT NULL default '',
  `option15` varchar(40) NOT NULL default '',
  `option16` varchar(40) NOT NULL default '',
  `option17` varchar(40) NOT NULL default '',
  `option18` varchar(40) NOT NULL default '',
  `option19` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of polls
-- ----------------------------

-- ----------------------------
-- Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `topicid` mediumint(8) unsigned NOT NULL default '0',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `body` text,
  `ori_body` text,
  `editedby` mediumint(8) unsigned NOT NULL default '0',
  `editdate` datetime NOT NULL default '0000-00-00 00:00:00',
  `sendlog` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`),
  KEY `topicid_id` (`topicid`,`id`),
  KEY `added` (`added`),
  FULLTEXT KEY `body` (`body`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts
-- ----------------------------

-- ----------------------------
-- Table structure for `processings`
-- ----------------------------
DROP TABLE IF EXISTS `processings`;
CREATE TABLE `processings` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of processings
-- ----------------------------
INSERT INTO `processings` (`id`, `name`, `sort_index`) VALUES
(1, 'Raw', 0),
(2, 'Encode', 0);
-- ----------------------------
-- Table structure for `prolinkclicks`
-- ----------------------------
DROP TABLE IF EXISTS `prolinkclicks`;
CREATE TABLE `prolinkclicks` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `ip` varchar(64) NOT NULL default '',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prolinkclicks
-- ----------------------------

-- ----------------------------
-- Table structure for `readposts`
-- ----------------------------
DROP TABLE IF EXISTS `readposts`;
CREATE TABLE `readposts` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `topicid` mediumint(8) unsigned NOT NULL default '0',
  `lastpostread` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `topicid` (`topicid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of readposts
-- ----------------------------

-- ----------------------------
-- Table structure for `regimages`
-- ----------------------------
DROP TABLE IF EXISTS `regimages`;
CREATE TABLE `regimages` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `imagehash` varchar(32) NOT NULL default '',
  `imagestring` varchar(8) NOT NULL default '',
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of regimages
-- ----------------------------

-- ----------------------------
-- Table structure for `reports`
-- ----------------------------
DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `addedby` mediumint(8) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `reportid` int(10) unsigned NOT NULL default '0',
  `type` enum('torrent','user','offer','request','post','comment','subtitle') NOT NULL default 'torrent',
  `reason` varchar(255) NOT NULL default '',
  `dealtby` mediumint(8) unsigned NOT NULL default '0',
  `dealtwith` tinyint(1) NOT NULL default '0',
  `reported` mediumint(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reports
-- ----------------------------

-- ----------------------------
-- Table structure for `req`
-- ----------------------------
DROP TABLE IF EXISTS `req`;
CREATE TABLE `req` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '401',
  `name` varchar(255) default NULL,
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `introduce` text,
  `ori_introduce` text,
  `amount` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `ori_amount` int(11) NOT NULL default '0',
  `comments` int(11) NOT NULL default '0',
  `finish` enum('yes','no','cancel') NOT NULL default 'no',
  `finished_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `resetdate` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `finish` (`finish`,`name`,`added`,`amount`,`introduce`(10))
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of req
-- ----------------------------

-- ----------------------------
-- Table structure for `resreq`
-- ----------------------------
DROP TABLE IF EXISTS `resreq`;
CREATE TABLE `resreq` (
  `id` int(11) NOT NULL auto_increment,
  `reqid` int(11) NOT NULL default '0',
  `torrentid` int(11) NOT NULL default '0',
  `chosen` enum('yes','no') NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `reqid` (`reqid`,`chosen`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resreq
-- ----------------------------

-- ----------------------------
-- Table structure for `rules`
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `lang_id` smallint(5) unsigned NOT NULL default '6',
  `title` varchar(255) NOT NULL,
  `text` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES ('1', '25', '总则 - <font class=striking>不遵守这些将导致帐号被封！</font>', '[*]请不要做管理员明文禁止的事情。\r\n[*]不允许发送垃圾信息。\r\n[*]账号保留规则：\r\n              1.[b]Veteran User(功行圆满)[/b]及以上等级用户会永远保留；\r\n              2.[b]Elite User(渐入佳境)[/b]及以上等级用户封存账号（在[url=usercp.php?action=personal]控制面板[/url]）后不会被删除帐号；\r\n              3.封存账号的用户连续400天不登录将被删除帐号；\r\n              4.未封存账号的用户连续120天不登录将被删除帐号；\r\n              5.没有流量的用户（即上传/下载数据都为0）连续30天不登录将被删除帐号。\r\n[*]一切作弊的帐号会被封，请勿心存侥幸。\r\n[*]注册多个[site]账号的用户将被禁止。\r\n[*]不要把本站的种子文件上传到其他Tracker！(具体请看[url=faq.php#38][b]常见问题[/b][/url])\r\n[*]第一次在论坛或服务器中的捣乱行为会受到警告，第二次您将永远无缘[site] 。');
INSERT INTO `rules` VALUES ('2', '25', '违规处罚规则 - <font class=striking>违规将会失去下载权限！</font>', '[*][color=darkred]封禁[/color]\r\n             [*]上传色情，政治敏感话题资源。\r\n             [*]被警告3次自动封禁\r\n[*][color=red]警告[/color]\r\n             [*]群聊区刷屏、发布广告、发布垃圾、发布色情等信息，警告1周。\r\n             [*]发表攻击、挑动他人的言辞﹑多次恶意灌水，警告1周。\r\n             [*]发布不规范种子被删除后不做修改仍然发布不规范种子，警告1周。\r\n             [*]不尊重发布者，警告1周。\r\n             [*]在标题或正文使用脏话﹑多次发表纯表情、沙发等无意义的评论，警告1周。\r\n             [*]对为赚取积分等目的恶意上传不合格字幕的用户，或是恶意举报的用户，警告1周。\r\n             [*]任何形式向管理员挑衅、辱骂管理员，警告2周。\r\n             [*]讨论禁忌、政治敏感或当地法律禁止的话题，警告2周。\r\n             [*]发表攻击、挑动他人的言辞情节严重，警告2周。\r\n             [*]发布资源与标题简介严重不符，弄虚作假，警告一周。\r\n[*][color=darkyellow]删除[/color]\r\n             [*]发布不符合上传规则的资源\r\n                       删除者请注明原因\r\n             [*]发布不符合评论规则的评论\r\n             [*]发布不符合字幕规则的字幕\r\n             [*]群聊区灌水刷屏等违反群聊区规定的内容');
INSERT INTO `rules` VALUES ('57', '25', '<span id=guize>标题命名规则</span>', '    所有种子都应该有描述性的标题，必要的介绍以及其他信息。规范请参阅[size=3]“[url=http://pt.nwsuaf6.edu.cn/forums.php?action=viewtopic&forumid=2&topicid=540]麦田PT做种简易教程---新老用户必看”[/url][/size]\r\n\r\n        [*][b]标题命名总则[/b]\r\n[b][color=Red][size=2][color=Sienna]\r\n       (1)不要使用全角符号标点和数字，如【 】〖 〗『 』１２３等。\r\n       (2)不要出现广告等与种子无关的信息。\r\n       (3)不要在名称中加入个人ID等信息。\r\n       (4)不要出现吸引眼球的文字，符号，噱头，个人评价等。\r\n                    如“超清晰”，\"经典\"，\"不看后悔\"，\"十大必看影片\"，\"好看\", \"同性\"，\"同志\", \"美女\"等词汇。      \r\n       (5)不要包含\"求种\"，\"求置顶\"，“推荐”等词汇。\r\n       (6)不要出现没必要的空格。\r\n       (7)种子名称应该能够让人了解种子的内容。[/color][/color][/b]\r\n       [*][b]标题命名[/b]\r\n\r\n      [color=Blue][size=2][b]一.电影类[/color][/b]\r\n[color=red] 1.命名[/color]\r\n[color=Blue][国别][年份][影片中文名][英文全名][字幕情况][/color][格式][其他信息]\r\n        ps:格式只要求rmvb,avi等非高清打包格式等标注，其他信息可选择放在副标题\r\n[size=2]其中 [英文全名] 包括：\r\n      [英文名][剪辑版本][发布说明][分辨率][来源][音频/视频编码]-[发布组名称]\r\n  [color=Blue]【如果是转载某压制小组的资源，通常只许复制原有英文名字即可，但必须严格保证完整，无法获取以上信息的如rmvb等格式采用第二种命名】[/color]\r\n[size=2]示例：\r\n   [color=Blue]【推荐命名】[/color]     [美国][2010][盗梦空间][Inception.BluRay.DTS.x264-BiTPT][惊悚/科幻/悬疑][中英字幕][MKV]\r\n   [color=Blue]【迫不得已采用】[/color][英国][2010][新福尔摩斯][Sherlock Holmes][英文字幕][RMVB]\r\n[color=Red]2.简介：[/color]\r\n[color=Blue]建议去http://www.verycd.com 搜索简介\r\n海报(必有)+影片资料(必有)+剧情介绍(必有)+截图[/color]\r\n详细请点击：[url=http://pt.nwsuaf6.edu.cn/forums.php?action=viewtopic&topicid=539&page=p3661#pid3661]电影简介模版[/url]\r\n\r\n[color=Blue]       [b]二.纪录片[/b]\r\n[color=Red]1.命名[/color]\r\n[来源][年份][中文名][英文全名][字幕情况][/color][格式][其他信息]\r\n ps:格式只要求rmvb,avi等非高清打包格式等标注，其他信息可选择放在副标题\r\n[size=2]其中，[英文全名]应包括以下全部信息：\r\n   [名称][剪辑版本][发布说明][分辨率][音频/视频编码]\r\n [color=Blue]【如果是转载某压制小组的资源，通常只许复制原有英文名字即可，但必须严格保证完整，无法获取以上信息的如rmvb等格式采用第二种命名】[/color]\r\n[size=2]示例：\r\n      [国家地理][2001][国家地理海豚大军] [National.Geographic.Dolphin.Army.720p.HDTV.x264 ] [中文字幕]\r\n      [其他][2010][文森特凡高全传] [Channel.4.Vincent.The.Full.Story.Complete] [暂无字幕][RMVB]\r\n[color=Red]2.简介[/color]\r\n[color=Blue]发布资源必须有详细介绍，包括图片以及文字；[/color]\r\n请从IMDB中文网或者HDChina、CHDbits等渠道转载详细介绍；\r\n必须添加详细的视频编码信息，包含分辨率、码率等。\r\n请发帖者添加原尺寸截图至少2张（源文件分辨率），以及缩略图（情节串连图）一张，如有BD封面或者是相关海报，请在介绍中加入（一张即可）。\r\n\r\n[size=2][color=Blue]      [b] 三.动漫[/b]\r\n[color=Red]1.命名[/color]\r\n[中文名][英文名][集数][字幕组][完结/连载][其他][/color]\r\nps:格式只要求rmvb,avi等非高清打包格式等标注，其他信息可选择放在副标题\r\n[size=2]示例：\r\n       [银魂][Gintama][235][LAC][MKV][480p][连载][莲蓬篇04]\r\n      [海贼王][One Piece]528][OPFansMaplesnow][480P][rmvb][连载]\r\n[color=red]2.简介[/color]\r\n[color=Blue]海报（必有）【STORY】【STAFF】【CAST】[/color]\r\n\r\n[color=Blue][size=2]       [b]四.电视剧及剧集类：[/b]\r\n[color=Red] 1.命名[/color]\r\n[国别][年份][文件名/英文名][S季度E集数][语言字幕][完结/连载][/color][格式][其他]\r\nps:格式只要求rmvb,avi等非高清打包格式等标注，其他信息可选择放在副标题\r\n【如果是转载某压制小组的资源，通常只许复制原有英文名字即可，但必须严格保证完整，无法获取以上信息的如rmvb等格式采用第二种命名】\r\n[size=2]示例：\r\n     [美剧][2012][生活大爆炸][The.Big.Bang.Theory.S06E06.720p.HDTV.X264-DIMENSION][连载][暂无字幕]\r\n     [大陆][2010][洪武三十二/Relic of an Emissary][30集全][中文字幕][完结][rmvb]\r\n[color=Red]2.简介：[/color]\r\n[color=Blue]海报/截图(必有)+剧集介绍(必有)+种子(必有)[/color]\r\n禁止出现三无帖子，所有剧集必须添加中文剧集名称\r\n[海报/截图]:与资源有关海报或截图（推荐直接使用播放器截图）\r\n[剧集介绍]:禁止无任何介绍，或仅介绍寥寥几句，不允许出现“太有名了就不介绍了”、“请自助百度”等用语.推荐参考verycd相关介绍.\r\n\r\n[size=2][color=Blue]      [b] 五.综艺[/b]\r\n[color=Red]   1.命名[/color]\r\n[具体时间(2011-01-01)][国别][中文/英文名称][/color][格式][其他说明]\r\nps:格式只要求rmvb,avi等非高清打包格式等标注，其他信息可选择放在副标题\r\n【如果是转载某压制小组的资源，通常只许复制原有英文名字即可，但必须严格保证完整，无法获取以上信息的如rmvb等格式采用第二种命名】\r\n[color=Black][size=2]示例：\r\n         [2012-11-02][大陆][天天向上.HNTV.Day.Day.Up.20121102.720p.HDTV.x264-NGB]\r\n         [2011-05-03][大陆][今夜有戏][RMVB][今夜特别企划——相声圈里的那些事儿]\r\n[color=Red]2.简介[/color]\r\n[color=Blue]节目介绍(必有)+截图（必有)[/color]\r\n节目介绍：去网上查询，切勿自己随意编写。\r\n\r\n[color=Blue][size=2]       [b]六.MV[/b]\r\n[color=Red]   1.命名[/color]\r\n[国别][具体发布时间][艺术家][资源名称][类型/风格][文件格式][分辨率][其它介绍][/color]\r\n[size=2]示例：\r\n      [欧美][2009][艾薇儿][Avril Lavigne - Live from The Roxy Theater - HDTVRip][MKV][720P]\r\n      [大陆][2010][孙燕姿][飞跃红馆香港演唱会][AVI]\r\n[color=Red]   2.简介[/color]\r\n[color=Blue]MV介绍(必有)+截图（必有)[/color]\r\n帖中必须含有缩略图、文件信息（尤其是码率、分辨率）等，文件信息的获得可以用播放器软件或者专业的Mediainfo软件\r\n\r\n[color=Blue][size=2]       [b]七.体育类[/b]\r\n[color=Red]   1.命名[/color]\r\n[具体日期][发布内容(体育类型)][节目名称][字幕说明][/color][格式][其他说明]\r\nps:格式只要求rmvb,avi等非高清打包格式等标注，其他信息可选择放在副标题\r\n【如果是转载某压制小组的资源，通常只许复制原有英文名字即可，但必须严格保证完整】\r\n[size=2]示例：\r\n       [2011-05-04][NBA][10-11赛季NBA季后赛ECSF G2 凯尔特人vs热火][英语][MKV]\r\n       [2011-05-05][足球] [欧冠半决赛次回合 曼联 vs 沙尔克04][暂无字幕][RMVB][CCTV5 国语 清晰收藏版] \r\n[color=Red]   2.简介[/color]\r\n[color=blue]节目介绍(必有)+截图（必有)[/color]\r\n\r\n[color=Blue][size=2]       [b]八.音乐类[/b]\r\n[color=Red]1.命名[/color]\r\n[发行时间][艺术家][资源名称][文件格式][文件码率][音乐类型][其他介绍][/color]\r\n[size=2]示例：\r\n      [2004][无][纯音乐-大自然音乐][MP3][192kbps][轻音乐][心灵四季]\r\n      [1995-2005][张学友][56张专辑合集][MP3][320kbps][华语流行系列]\r\n[color=Red]2.简介[/color]\r\n[color=Blue]专辑封面(必有)+专辑介绍(必有)+专辑曲目(必有)+作者意见(自由选择).[/color]\r\n所需信息都可以去verycd等专业网站获取所需要的信息，建议不要用百度。\r\n\r\n[color=Blue][size=2]       [b]九.软件类[/b]\r\n[color=red]1.命名[/color]\r\n[应用平台][软件名称及版本][软件语言][软件格式][软件类型][其他说明][/color]\r\n[color=Black][size=2]示例：\r\n        [WIN][迅雷7.1.8.2298][简体中文][EXE][下载工具][共享软件]\r\n        [LINUX] [Kubuntu.11.04 desktop][英文][ISO][操作系统][x86]\r\n[color=Red]2.简介[/color]\r\n[color=blue]截图（必有)+软件介绍（必要）+使用方法（必有，如需序列号务必给出）[/color]\r\n\r\n[color=Blue][size=2]      [b]十.游戏类[/b]\r\n[color=Red]1.命名[/color]\r\n[游戏中文名][游戏英文名][游戏类型][制作公司][数据格式][版本][其他][/color]\r\n[size=2][游戏类型]：主要按照以下分类：\r\nRCG=赛车游戏  FTG=格斗游戏  SPG=体育游戏\r\nSLG=战略游戏  RPG=角色扮演  ACT=动作游戏\r\nAVG=冒险游戏  STG=射击游戏  TAB=桌面游戏\r\nPUZ=益智游戏  TCG=养成游戏  CAG=卡片游戏\r\nRTS=即时战略游戏   FPS=第一人称射击游戏  ARPG=动作角色扮演游戏 \r\n SRPG=战略角色扮演游戏   MMORPG=在线角色扮演(即wow类网络RPG)\r\nETC=其他种类游戏\r\n其他网络游戏按照上面分类后面加OL，比如SPGOL表示在线的体育游戏，无法确认时使用ETC。  中英文都可以。\r\n[size=2]示例：\r\n         [仙剑奇侠传四][PAL4][SRPG][上海软星][RAR]\r\n         [穿越火线][Crossfire][MMOFPS-OL][腾讯][EXE][v1.0.8]\r\n[color=Blue][size=2]游戏视频\r\n\r\n[color=Red][游戏视频][游戏类型][时间][视频名称][格式][其他]\r\n\r\n[color=Black][size=2]示例：[游戏视频][DOTA视频][2011-05-05][6.72初体验，麦迪文第一视角][rmvb][老党解说]\r\n[color=Red]2.简介[/color]\r\n[color=Blue]游戏封面(必有)+资源介绍+安装信息（选有）+配置需求（选有）+游戏截图（选有）+其他说明（破解注册码等）[/color]\r\n资源介绍必有：中文名称/游戏名称/游戏发行/游戏制作/游戏语言/游戏类型/发行日期/游戏介绍\r\n\r\n[color=Blue][size=2]      [b] 十一.学习[/b]\r\n[color=Red]1.命名[/color]\r\n[类别][发行日期][资料名称][文件类型][其他介绍][/color]\r\n[size=2]\"文件类型\"和\"发行日期\"可以选填\r\n\"类别\" 分为  自然科学  人文社科  外语相关  工程科学  有声读物\r\n                       讲座演讲  考研相关  计算机类   经济管理  其他资料\r\n[size=2]示例：\r\n         [外语相关][2010][四六级资料合集][AVI][听力.阅读.写作]\r\n         [计算机类][2011][Oracle 11g中文版数据库管理][PPT][应用与开发标准教程]\r\n[color=Red]2.简介：[/color]\r\n[color=Blue]资源介绍（必有）+资源目录截图（必有）+（资源如为破解软件，则必有破解方法以及运行截图）[/color]\r\n              \r\n        [*]杂项\r\n                [*]请正确选择资源的类型和质量信息。\r\n\r\n[*]注意事项\r\n       [*]管理员会根据规范对种子信息进行编辑。\r\n       [*]请勿改变或去除管理员对种子信息作出的修改（但上传者可以修正一些错误）。\r\n       [*]种子信息不符合规范的种子可能会被删除，视种子信息的规范程度而定。\r\n       [*]如果资源的原始发布信息基本符合规范，请尽量使用原始发布信息。\r\n规范命名绝对不是增加麻烦。对下载者来说，可以方便查找、下载，更好地实现资源交流。对发种者来说，完整详细命名是种子的重要介绍，有助于吸引大家下载。');
INSERT INTO `rules` VALUES ('4', '25', '论坛总则 - <font class=striking>请遵循以下的守则，违规会受到警告！</font>', '[*]禁止攻击、挑动他人的言辞。\r\n[*]禁止恶意灌水或发布垃圾信息。请勿在论坛非Water Jar版块发布无意义主题或回复（如纯表情）等。\r\n[*]不要为了获取麦粒而大肆灌水。\r\n[*]禁止在标题或正文使用脏话。\r\n[*]不要讨论禁忌、政治敏感或当地法律禁止的话题。\r\n[*]禁止任何基于种族、国家、民族、肤色、宗教、性别、年龄、性取向、身体或精神障碍的歧视性言辞。违规将导致账号永久性禁用。\r\n[*]禁止挖坟（所有挖坟帖都要被删掉）。\r\n[*]禁止重复发帖。\r\n[*]请确保问题发布在相对应的板块。\r\n[*]365天无新回复的主题将被系统自动锁定.\r\n');
INSERT INTO `rules` VALUES ('6', '25', '群聊区版规 - <font class=striking>请尽量遵守以下规则</font>', '[*]论坛总版规均适用于群聊区\r\n[*]群聊区禁止刷屏.刷屏者将会被警告.刷屏内容会被删除而没有提示\r\n[*]群聊区禁止求外站邀请码.求邀请码内容会被删除而没有提示.请去邀请交流区发帖\r\n[*]群聊区禁止求种.求种信息会被删除而没有提示.求种请去求种区\r\n');
INSERT INTO `rules` VALUES ('3', '25', '上传规则 - <font class=striking> 谨记: 违规的种子将不经提醒而直接删除 </font>', '请遵守规则。如果你对规则有任何不清楚或不理解的地方，请[url=contactstaff.php]咨询管理组[/url]。[b]管理组保留裁决的权力。[/b]\r\n\r\n[b]一 上传总则[/b]\r\n       [*]上传者必须对上传的文件拥有合法的传播权。\r\n       [*]上传者必须保证上传速度与做种时间。如果在其他人完成前撤种或做种时间不足24小时，或者故意低速上传，上传者将会被警告甚至取消上传权限。\r\n       [*]对于自己发布的种子，发布者将获得双倍的上传量。\r\n       [*]如果你有一些违规但却有价值的资源，请将详细情况告知管理组，我们可能破例允许其发布。\r\n       [*]请勿夹带种子文件或者广告。尤其是水印严重的视频等\r\n       [*]请勿违反删种规则\r\n\r\n[b][color=blue]二  不允许的资源和文件：[/color][/b]\r\n        [*][color=darkred]违反发布规则的一律删除处理[/color]\r\n        [*][color=red]禁止发布三级片![/color]\r\n            三级片定义为因包含色情或者暴力或者反党反人类剧情而被广电总局禁止播放或上映的影片或动漫或剧集.\r\n            比如肉蒲团.蜜桃成熟时.死亡笔记动漫.颐和园.天与地等等\r\n        [*]所有版块禁止发布xv/qsv等需要专属播放器才能播放的视频文件。\r\n        [*]同一资源(如同一部电影等)已有高清版本发布且非死种,将不允许发布此资源的低质量非高清版本(如rmvb格式资源)。\r\n        [*]某些分类资源高清版发布后,管理员有权力酌情删除其低质量非高清版本。剧集资源合集发布三天后删除单集资源\r\n        [*]【电影】【蓝光】【剧集】【MV】【动漫】【纪录片】版块禁止发布flv、f4v及其相应的自转格式及rar压缩文件。\r\n        [*]【动漫】版块禁止发布猪猪字幕组资源。\r\n        [*]除【软件】【PC游戏】【掌机】【其他】其他版块禁止发布rar压缩包文件。\r\n        [*]【学习板块】在未获得老师许可的情况下不允许上传老师的课件\r\n        [*]标清视频upscale或部分upscale而成的视频文件(包括修改文件名称和格式混淆参数的)；\r\n        [*]采用分卷压缩的游戏或其他资源；\r\n        [*]属于标清级别但质量较差的视频文件，包括CAM等；\r\n        [*]完全无来源和编码信息的影片(如果是你自己压制的，请勇敢的写出自己名字，但请确保质量)；\r\n        [*]RealVideo编码的视频（通常封装于RMVB或RM）、flv文件；[游戏视频等一些特殊文件除外]\r\n        [*]单独的样片（样片请和正片一起上传）；\r\n        [*]无正确cue表单的多轨音频文件；\r\n        [*]涉及禁忌或敏感内容（如色情、敏感政治话题等）的资源；\r\n        [*]损坏的文件，指在读取或回放过程中出现错误的文件；\r\n        [*]垃圾文件，如病毒、木马、网站链接、广告文档、种子中包含的种子文件等，或无关文件。\r\n\r\n[b]三  资源打包（并非打压缩包）规则（暂定）[/b]\r\n   原则上只允许以下资源打包：\r\n       [*]按套装售卖的高清电影合集（如The Ultimate Matrix Collection Blu-ray Box）；\r\n       [*]整季的电视剧/综艺节目/动漫；\r\n       [*]同一专题的纪录片；\r\n       [*]同一艺术家的MV\r\n               [*]标清MV只允许按DVD打包，且不允许单曲MV单独发布；\r\n               [*]分辨率相同的高清MV；\r\n       [*]同一艺术家的音乐\r\n               [*]两年内发售的专辑可以单独发布；\r\n               [*]打包时应剔除站内已有的资源，或者将它们都包括进来；\r\n       [*]分卷发售的动漫剧集、角色歌、广播剧等；\r\n       [*]发布组打包发布的资源。\r\n       打包发布的视频资源必须来源于相同类型的媒介（如蓝光原碟），有相同的分辨率水平（如720p），编码格式一致（如x264），但预告片例外。对于电影合集，发布组也必须统一。打包发布的音频资源必须编码格式一致（如全部为分轨FLAC）。打包发布后，将视情况删除相应单独的种子。\r\n       如果你对资源打包有任何不明确的地方，请发帖至[url=http://pt.nwsuaf6.edu.cn/forums.php?action=viewforum&forumid=2]求助区[/url]询问。管理组保留资源打包相关问题的解释权和处理权。\r\n\r\n');
INSERT INTO `rules` VALUES ('12', '28', '下載規則 - <font class=striking>違規將會失去下載權限！</font> ', '[*]過低的分享率會導致嚴重的后果，包括禁止帳號。詳見[url=faq.php#22]常見問題[/url]。\r\n[*]種子促銷規則：\r\n        [*]隨機促銷（種子上傳後系統自動隨機設為促銷）：\r\n                [*]10%的概率成為“[color=#7c7ff6][b]50%下載[/b][/color]”；\r\n                [*]5%的概率成為“[color=#f0cc00][b]免費[/b][/color]”；\r\n                [*]5%的概率成為“[color=#aaaaaa][b]2x上傳[/b][/color]”；\r\n                [*]3%的概率成為“[color=#7ad6ea][b]50%下載&2x上傳[/b][/color]”；\r\n                [*]1%的概率成為“[color=#99cc66][b]免費&2x上傳[/b][/color]”。\r\n        [*]檔總體積大於20GB的種子將自動成為“[color=#f0cc00][b]免費[/b][/color]”。\r\n        [*]Blu-ray Disk, HD DVD原盤將成為“[color=#f0cc00][b]免費[/b][/color]”。\r\n        [*]電視劇等每季的第一集將成為“[color=#f0cc00][b]免費[/b][/color]”。\r\n        [*]關注度高的種子將被設置為促銷（由管理員定奪）。\r\n        [*]促銷時限：\r\n                [*]除了“[color=#aaaaaa][b]2x上傳[/b][/color]”以外，其餘類型的促銷限時7天（自種子發佈時起）；\r\n                [*]“[color=#aaaaaa][b]2x上傳[/b][/color]”無時限。\r\n        [*]所有種子在發佈1個月後將自動永久成為“[color=#aaaaaa][b]2x上傳[/b][/color]”。            \r\n        [*]我們也將不定期開啟全站[color=#f0cc00][b]免費[/b][/color]，屆時盡情狂歡吧~:mml:  :mml:  :mml:\r\n[*]你只能使用允許的BT客戶端下載本站資源。詳見[url=faq.php#29]常見問題[/url]。');
INSERT INTO `rules` VALUES ('14', '28', '論壇總則 - <font class=striking>請遵循以下的守則，違規會受到警告！</font> ', '[*]禁止攻擊、挑動他人的言辭。\r\n[*]禁止惡意灌水或發布垃圾信息。請勿在論壇非Water Jar版塊發布無意義主題或回復（如純表情）等。\r\n[*]不要為了獲取魔力值而大肆灌水。\r\n[*]禁止在標題或正文使用臟話。\r\n[*]不要討論禁忌、政治敏感或當地法律禁止的話題。\r\n[*]禁止任何基于種族、國家、民族、膚色、宗教、性別、年齡、性取向、身體或精神障礙的歧視性言辭。違規將導致賬號永久性禁用。\r\n[*]禁止挖墳（所有挖墳帖都要被刪掉）。\r\n[*]禁止重復發帖。\r\n[*]請確保問題發布在相對應的板塊。\r\n[*]365天無新回復的主題將被系統自動鎖定。');
INSERT INTO `rules` VALUES ('5', '25', '评论总则 - <font class=striking>永远尊重上传者！</font>', '[*]无论如何，请尊重上传者！\r\n    所有不尊重或者攻击上传者的言论都将会被警告.请点击举报\r\n[*]所有论坛发帖的规则同样适用于评论。\r\n[*]如果你没有下载的意向，请不要随便发表否定性的评论。');
INSERT INTO `rules` VALUES ('16', '28', '頭像使用規定 - <font class=striking>請盡量遵守以下規則</font> ', '[*]允許的格式為.gif， .jpg， 和.png。\r\n[*]圖片大小不能超過150KB，為了統一，系統會調整頭像寬度到150像素大小（瀏覽器會把圖片調整成合適的大小，小圖片將被拉伸，而過大的圖片只會浪費帶寬和CPU) 。\r\n[*]請不要使用可能引起別人反感的圖片，包括色情、宗教、血腥的動物/人類、宣揚某種意識形態的圖片。如果你不確定某張圖片是否合適，請站短管理員。\r\n');
INSERT INTO `rules` VALUES ('11', '28', '總則 - <font class=striking>不遵守這些將導致帳號被封！</font> ', '[*]請不要做管理員明文禁止的事情。\r\n[*]不允許發送垃圾信息。\r\n[*]賬號保留規則：\r\n              1.[b]Veteran User[/b]及以上等級用戶會永遠保留；\r\n              2.[b]Elite User[/b]及以上等級用戶封存賬號（在[url=usercp.php?action=personal]控制面板[/url]）后不會被刪除帳號；\r\n              3.封存賬號的用戶連續400天不登錄將被刪除帳號；\r\n              4.未封存賬號的用戶連續150天不登錄將被刪除帳號；\r\n              5.沒有流量的用戶（即上傳/下載數據都為0）連續100天不登錄將被刪除帳號。\r\n[*]一切作弊的帳號會被封，請勿心存僥幸。\r\n[*]注冊多個[site]賬號的用戶將匾被禁止。\r\n[*]不要把本站的種子文件上傳到其他Tracker！(具體請看 [url=faq.php#38][b]常見問題[/b][/url])\r\n[*]第一次在論壇或服務器中的搗亂行為會受到警告，第二次您將永遠無緣[site] 。');
INSERT INTO `rules` VALUES ('13', '28', '上傳規則 - <font class=striking> 謹記: 違規的種子將不經提醒而直接刪除 </font> ', '請遵守規則。如果你對規則有任何不清楚或不理解的地方，請[url=contactstaff.php]諮詢管理組[/url]。[b]管理組保留裁決的權力。[/b]\r\n\r\n[b]上傳總則[/b]\r\n        [*]上傳者必須對上傳的檔擁有合法的傳播權。\r\n        [*]上傳者必須保證上傳速度與做種時間。如果在其他人完成前撤種或做種時間不足24小時，或者故意低速上傳，上傳者將會被警告甚至取消上傳許可權。\r\n        [*]對於自己發佈的種子，發佈者將獲得雙倍的上傳量。\r\n        [*]如果你有一些違規但卻有價值的資源，請將詳細情況[url=contactstaff.php]告知管理組[/url]，我們可能破例允許其發佈。\r\n\r\n[b]上傳者資格[/b]\r\n        [*]任何人都能發佈資源。\r\n        [*]不過，有些使用者需要先在[url=offers.php]候選區[/url]提交候選。詳見常見問題中的[url=faq.php#22]相關說明[/url]。\r\n        [*]對於遊戲類資源，只有[color=#DC143C][b]上傳員[/b][/color]及以上等級的使用者，或者是管理組特別指定的用戶，才能自由上傳。其他用戶必須先在[url=offers.php]候選區[/url]提交候選。\r\n\r\n[b]允許的資源和檔：[/b]\r\n        [*]高清（HD）視頻，包括\r\n                [*]完整高清媒介，如藍光（Blu-ray）原碟、HD DVD原碟等，或remux，\r\n                [*]HDTV流媒體，\r\n                [*]來源於上述媒介的高清重編碼（至少為720p標準），\r\n                [*]其他高清視頻，如高清DV；\r\n        [*]標清（SD）視頻，只能是\r\n                [*]來源於高清媒介的標清重編碼（至少為480p標準）；\r\n                [*]DVDR/DVDISO，\r\n                [*]DVDRip、CNDVDRip；\r\n        [*]無損音軌（及相應cue表單），如FLAC、Monkey\'s Audio等；\r\n        [*]5.1聲道或以上標準的電影音軌、音樂音軌（DTS、DTSCD鏡像等），評論音軌；\r\n        [*]PC遊戲（必須為原版光碟鏡像）；\r\n        [*]7日內發佈的高清預告片；\r\n        [*]與高清相關的軟體和文檔。\r\n\r\n[b]不允許的資源和檔：[/b]\r\n        [*]總體積小於100MB的資源；\r\n        [*]標清視頻upscale或部分upscale而成的視頻檔；\r\n        [*]屬於標清級別但品質較差的視頻檔，包括CAM、TC、TS、SCR、DVDSCR、R5、R5.Line、HalfCD等；\r\n        [*]RealVideo編碼的視頻（通常封裝於RMVB或RM）、flv檔；\r\n        [*]單獨的樣片（樣片請和正片一起上傳）；\r\n        [*]未達到5.1聲道標準的有損音訊檔，如常見的有損MP3、有損WMA等；\r\n        [*]無正確cue表單的多軌音訊檔；\r\n        [*]硬碟版、高壓版的遊戲資源，非官方製作的遊戲鏡像，協力廠商mod，小遊戲合集，單獨的遊戲破解或補丁；\r\n        [*]RAR等壓縮檔；\r\n        [*]重複（dupe）的資源（判定規則見下文）；\r\n        [*]涉及禁忌或敏感內容（如色情、敏感政治話題等）的資源；\r\n        [*]損壞的檔，指在讀取或重播過程中出現錯誤的檔；\r\n        [*]垃圾檔，如病毒、木馬、網站連結、廣告文檔、種子中包含的種子檔等，或無關檔。\r\n\r\n[b]重複（dupe）判定規則：品質重於數量[/b]\r\n        [*]視頻資源按來源媒介確定優先順序，主要為：Blu-ray/HD DVD > HDTV > DVD > TV。同一視頻高優先順序版本將使低優先順序版本被判定為重複。\r\n        [*]同一視頻的高清版本將使標清版本被判定為重複。\r\n        [*]對於動漫類視頻資源，HDTV版本和DVD版本有相同的優先順序，這是一個特例。\r\n        [*]來源於相同媒介，相同解析度水準的高清視頻重編碼\r\n                [*]參考“[url=forums.php?action=viewtopic&forumid=6&topicid=1520]Scene & Internal, from Group to Quality-Degree. ONLY FOR HD-resources[/url]”按發佈組確定優先順序；\r\n                [*]高優先順序發佈組發佈的版本將使低優先順序或相同優先順序發佈組發佈的其他版本被判定為重複；\r\n                [*]但是，總會保留一個當前最佳畫質的來源經重編碼而成的DVD5大小（即4.38 GB左右）的版本；\r\n                [*]基於無損截圖對比，高品質版本將使低品質版本被視為重複。\r\n        [*]來自其他區域，包含不同配音和/或字幕的blu-ray/HD DVD原盤版本不被視為重複版本。\r\n        [*]每個無損音軌資源原則上只保留一個版本，其餘不同格式的版本將被視為重複。分軌FLAC格式有最高的優先順序。\r\n        [*]對於站內已有的資源，\r\n                [*]如果新版本沒有舊版本中已確認的錯誤/畫質問題，或新版本的來源有更好的品質，新版本允許發佈且舊版本將被視為重複；\r\n                [*]如果舊版本已經連續斷種45日以上或已經發佈18個月以上，發佈新版本將不受重複判定規則約束。\r\n        [*]新版本發佈後，舊的、重複的版本將被保留，直至斷種。\r\n\r\n[b]資源打包規則（試行）[/b]\r\n        原則上只允許以下資源打包：\r\n        [*]按套裝售賣的高清電影合集（如[i]The Ultimate Matrix Collection Blu-ray Box[/i]）；\r\n        [*]整季的電視劇/綜藝節目/動漫；\r\n        [*]同一專題的紀錄片；\r\n        [*]7日內的高清預告片；\r\n        [*]同一藝術家的MV\r\n                [*]標清MV只允許按DVD打包，且不允許單曲MV單獨發佈；\r\n                [*]解析度相同的高清MV；\r\n        [*]同一藝術家的音樂\r\n                [*]5張或5張以上專輯方可打包發佈；\r\n                [*]兩年內發售的專輯可以單獨發佈；\r\n                [*]打包時應剔除站內已有的資源，或者將它們都包括進來；\r\n        [*]分卷發售的動漫劇集、角色歌、廣播劇等；\r\n        [*]發佈組打包發佈的資源。\r\n        打包發佈的視頻資源必須來源於相同類型的媒介（如藍光原碟），有相同的解析度水準（如720p），編碼格式一致（如x264），但預告片例外。對於電影合集，發佈組也必須統一。打包發佈的音訊資源必須編碼格式一致（如全部為分軌FLAC）。打包發佈後，將視情況刪除相應單獨的種子。\r\n        如果你對資源打包有任何不明確的地方，請[url=contactstaff.php]諮詢管理組[/url]。管理組保留資源打包相關問題的解釋權和處理權。\r\n\r\n[b]例外[/b]\r\n        [*]允許發佈來源於TV或是DSR的體育類的標清視頻。\r\n        [*]允許發佈小於100MB的高清相關軟體和文檔。\r\n        [*]允許發佈小於100MB的單曲專輯。\r\n        [*]允許發佈2.0聲道或以上標準的國語/粵語音軌。\r\n        [*]允許在發佈的資源中附帶字幕、遊戲破解與補丁、字體、包裝等的掃描圖。上述幾種檔必須統一打包或統一不打包。\r\n        [*]允許在發佈音軌時附帶附贈DVD的相關檔。\r\n\r\n[b]種子資訊[/b]\r\n        所有種子都應該有描述性的標題，必要的介紹以及其他資訊。以下是一份簡明的規範，完整的、詳盡的規範請參閱“[url=forums.php?action=viewtopic&topicid=3438&page=0#56711]種子資訊填寫規範與指導[/url]”。\r\n        [*]標題\r\n                [*]電影：[i][中文名] 名稱 [年份] [剪輯版本] [發佈說明] 解析度 來源 [音訊/]視頻編碼-發佈組名稱[/i]\r\n                      例：[i]蝙蝠俠:黑暗騎士 The Dark Knight 2008 PROPER 720p BluRay x264-SiNNERS[/i]\r\n                [*]電視劇：[i][中文名] 名稱 [年份] S**E** [發佈說明] 解析度 來源 [音訊/]視頻編碼-發佈組名稱[/i]\r\n                      例：[i]越獄 Prison Break S04E01 PROPER 720p HDTV x264-CTU[/i]\r\n                [*]音軌：[i][中文藝術家名 - 中文專輯名] 藝術家名 - 專輯名 [年份] [版本] [發佈說明] 音訊編碼[-發佈組名稱][/i]\r\n                      例：[i]恩雅 - 冬季降臨 Enya - And Winter Came 2008 FLAC[/i]\r\n                [*]遊戲：[i][中文名] 名稱 [年份] [版本] [發佈說明][-發佈組名稱][/i]\r\n                      例：[i]紅色警戒3:起義時刻 Command And Conquer Red Alert 3 Uprising-RELOADED[/i]\r\n        [*]副標題\r\n                [*]不要包含廣告或求種/續種請求。\r\n        [*]外部資訊\r\n                [*]電影和電視劇必須包含外部資訊連結（如IMDb連接）位址（如果存在的話）。\r\n        [*]簡介\r\n                [*]NFO圖請寫入NFO檔，而不是粘貼到簡介裡。\r\n                [*]電影、電視劇、動漫：\r\n                        [*]必須包含海報、橫幅或BD/HDDVD/DVD封面（如果存在的話）； \r\n                        [*]請盡可能包含畫面截圖或其縮略圖和連結；\r\n                        [*]請盡可能包含檔的詳細情況，包括格式、時長、編碼、碼率、解析度、語言、字幕等；\r\n                        [*]請盡可能包含演職員名單以及劇情概要。\r\n                [*]體育節目：\r\n                        [*]請勿在文字介紹或截圖/檔案名/檔大小/時長中洩漏比賽結果。\r\n                [*]音樂：\r\n                        [*]必須包含專輯封面和曲目列表（如果存在的話）；\r\n                [*]PC遊戲：\r\n                        [*]必須包含海報或BD/HDDVD/DVD封面（如果存在的話）；\r\n                        [*]請盡可能包含畫面截圖或其縮略圖和連結。\r\n        [*]雜項\r\n                [*]請正確選擇資源的類型和品質資訊。\r\n        [*]注意事項\r\n                [*]管理員會根據規範對種子資訊進行編輯。\r\n                [*]請勿改變或去除管理員對種子資訊作出的修改（但上傳者可以修正一些錯誤）。\r\n                [*]種子資訊不符合規範的種子可能會被刪除，視種子資訊的規範程度而定。\r\n                [*]如果資源的原始發佈資訊基本符合規範，請儘量使用原始發佈資訊。\r\n');
INSERT INTO `rules` VALUES ('18', '28', '管理守則 - <font class=striking>請慎用你的權限！</font> ', '[*]最重要的一條：慎用你手中的權限！\r\n[*]對于違規行為不要怕說“不”！\r\n[*]不要公開和其他管理員沖突，一切通過私下溝通解決。\r\n[*]不要太絕情，給違規者一個改過的機會。\r\n[*]不要試圖“打預防針”，等到人們犯錯了再去糾正。\r\n[*]嘗試去改正一個不適當的帖而不是簡單的關閉它。\r\n[*]多嘗試移動帖子到適合的版面而不是簡單地鎖帖。\r\n[*]當處理版聊帖的時候要寬容適度。\r\n[*]鎖帖的時候請給予簡單的操作理由。\r\n[*]在屏蔽某個用戶前請先站短通知他/她, 如果有所積極回應可以考慮再給2周觀察期。\r\n[*]不要禁用一個注冊尚未滿4周的帳戶。\r\n[*]永遠記得以理服人。\r\n');
INSERT INTO `rules` VALUES ('17', '28', '趣味盒規則 - <font class=striking>在娛樂中賺分</font> ', '[*]任何用戶都可在趣味盒中投放笑話、趣圖、搞笑視頻、Flash等有趣的內容，除了色情、禁忌、政治敏感和當地法律禁止的內容。\r\n[*]正常情況下，一條趣味內容在發布24小時后過期。然而，如果獲得的投票數超過20且其中“有趣”的比例低于25%，趣味內容將提前過期。\r\n[*]新的趣味內容[b]只有[/b]在舊的內容過期后才能提交。\r\n[*]若趣味內容被多數用戶投票認為有趣，其發布者將得到以下獎勵：\r\n           [*]票數超過25，其中認為“有趣”比例超過50%，發布者得到5個魔力值。\r\n           [*]票數超過50，其中認為“有趣”比例超過50%，發布者得到另外的5個魔力值。\r\n           [*]票數超過100，其中認為“有趣”比例超過50%，發布者得到另外的5個魔力值。\r\n           [*]票數超過200，其中認為“有趣”比例超過50%，發布者得到另外的5個魔力值。\r\n           [*]票數超過25，其中認為“有趣”比例超過75%，發布者得到10個魔力值。\r\n           [*]票數超過50，其中認為“有趣”比例超過75%，發布者得到另外的10個魔力值。\r\n           [*]票數超過100，其中認為“有趣”比例超過75%，發布者得到另外的10個魔力值。\r\n           [*]票數超過200，其中認為“有趣”比例超過75%，發布者得到另外的10個魔力值。');
INSERT INTO `rules` VALUES ('21', '6', 'General rules - <font class=striking>Breaking these rules can and will get you banned!</font>', '[*]Do not do things we forbid.\r\n[*]Do not spam.\r\n[*]Cherish your user account. Inactive accounts would be deleted based on the following rules:\r\n              1.[b]Veteran User[/b] or above would never be deleted.\r\n              2.[b]Elite User[/b] or above would never be deleted if packed (at [url=usercp.php?action=personal]User CP[/url]).\r\n              3.Packed accounts would be deleted if users have not logged in for more than 400 days in a row.\r\n              4.Unpacked accounts would be deleted if users have not logged in for more than 150 days in a row.\r\n              5.Accounts with both uploaded and downloaded amount being 0 would be deleted if users have not logged in for more than 100 days in a row.\r\n[*]User found cheating would be deleted. Don\'t take chances!\r\n[*]Possession of multiple [site] accounts will result in a ban!\r\n[*]Do not upload our torrents to other trackers! (See the [url=faq.php#38]FAQ[/url] for details.)\r\n[*]Disruptive behavior in the forums or on the server will result in a warning. You will only get [b]one[/b] warning! After that it\'s bye bye Kansas!');
INSERT INTO `rules` VALUES ('15', '28', '評論總則 - <font class=striking>永遠尊重上傳者！</font> ', '[*]無論如何，請尊重上傳者！\r\n[*]所有論壇發帖的規則同樣適用于評論。\r\n[*]如果你沒有下載的意向，請不要隨便發表否定性的評論。');
INSERT INTO `rules` VALUES ('25', '6', 'Commenting Guidelines - <font class=striking>Always respect uploaders no matter what!</font>', '[*]Always respect uploaders no matter what!\r\n[*]All rules of forum posting apply to commenting, too.\r\n[*]Do not post negative comments about torrents that you don\'t plan to download.');
INSERT INTO `rules` VALUES ('27', '6', 'Funbox Rules - <font class=striking>Get bonus with fun!</font>', '[*]Users can submit anything funny (e.g. stories, pictures, flash, video) except things that is pornographic, taboo, political sensitive or forbidden by local laws.\r\n[*]Normally a newly-submitted funbox item would be outdated after 24 hours. However, if there are 20 or more votes on a funbox item, among which votes for \'funny\' is less than 25%, the funbox item would be outdated ahead of its due time.\r\n[*]New funbox item can be submitted [b]only[/b] when the old one is outdated.\r\n[*]User, whose funbox item is voted as [b]funny[/b], would be rewarded based on the following rules:\r\n           [*]More than 25 votes, among which votes for [i]funny[/i] exceed 50%. User gets 5 bonus.\r\n           [*]More than 50 votes, among which votes for [i]funny[/i] exceed 50%. User gets another 5 bonus.\r\n           [*]More than 100 votes, among which votes for [i]funny[/i] exceed 50%. User gets another 5 bonus.\r\n           [*]More than 200 votes, among which votes for [i]funny[/i] exceed 50%. User gets another 5 bonus.\r\n           [*]More than 25 votes, among which votes for [i]funny[/i] exceed 75%. User gets 10 bonus.\r\n           [*]More than 50 votes, among which votes for [i]funny[/i] exceed 75%. User gets another 10 bonus.\r\n           [*]More than 100 votes, among which votes for [i]funny[/i] exceed 75%. User gets another 10 bonus.\r\n           [*]More than 200 votes, among which votes for [i]funny[/i] exceed 75%. User gets another 10 bonus.');
INSERT INTO `rules` VALUES ('22', '6', 'Downloading rules - <font class=striking>By not following these rules you will lose download privileges!</font>', '[*]Low ratios may result in severe consequences, including banning accounts. See [url=faq.php#22]FAQ[/url].\r\n[*]Rules for torrent promotion:\r\n        [*]Random promotion (torrents promoted randomly by system upon uploading):\r\n                [*]10% chance becoming [color=#7c7ff6][b]50% Leech[/b][/color],\r\n                [*]5% chance becoming [color=#f0cc00][b]Free Leech[/b][/color],\r\n                [*]5% chance becoming [color=#aaaaaa][b]2X up[/b][/color],\r\n                [*]3% chance becoming [color=#7ad6ea][b]50% Leech and 2X up[/b][/color],\r\n                [*]1% chance becoming [color=#99cc66][b]Free Leech and 2X up[/b][/color].\r\n        [*]Torrents larger than 20GB will automatically be [color=#f0cc00][b]Free Leech[/b][/color].\r\n        [*]Raw Blu-ray, HD DVD Discs will be [color=#f0cc00][b]Free Leech[/b][/color].\r\n        [*]First episode of every season of TV Series, etc. will be [color=#f0cc00][b]Free Leech[/b][/color].\r\n        [*]Highly popular torrents will be on promotion (decided by admins).\r\n        [*]Promotion timeout:\r\n                [*]Except [color=#aaaaaa][b]2X up[/b][/color], all the other types of promotion will be due after 7 days (counted from the time when the torrent is uploaded).\r\n                [*][color=#aaaaaa][b]2X up[/b][/color] will never become due.\r\n        [*]ALL the torrents will be [color=#aaaaaa][b]2X up[/b][/color] forever when they are on the site for over 1 month.\r\n        [*]On special occasions, we would set the whole site [color=#f0cc00][b]Free Leech[/b][/color]. Grab as much as you can. :mml:  :mml:  :mml:\r\n[*]You may [b]only[/b] use allowed bittorrent clients at [site]. See [url=faq.php#29]FAQ[/url].');
INSERT INTO `rules` VALUES ('24', '6', 'General Forum Guidelines - <font class=stiking>Please follow these guidelines or else you might end up with a warning!</font>', '[*]No aggressive behavior or flaming in the forums.\r\n[*]No trashing of any topics (i.e. SPAM). Do not submit meaningless topics or posts (e.g. smiley only) in any forum except Water Jar.\r\n[*]Do not flood any forum in order to get bonus.\r\n[*]No foul language on title or text.\r\n[*]Do not discuss topics that are taboo, political sensitive or forbidden by local laws.\r\n[*]No language of discrimination based on race, national or ethnic origin, color, religion, gender, age, sexual preference or mental or physical disability. Violating this rule would result in permanent ban.\r\n[*]No bumping... (All bumped threads will be deleted.)\r\n[*]No double posting. \r\n[*]Please ensure all questions are posted in the correct section!\r\n[*]Topics without new reply in 365 days would be locked automatically by system.');
INSERT INTO `rules` VALUES ('26', '6', 'Avatar Guidelines - <font class=striking>Please try to follow these guidelines</font>', '[*]The allowed formats are .gif, .jpg and .png. \r\n[*]Be considerate. Resize your images to a width of 150 px and a size of no more than 150 KB. (Browsers will rescale them anyway: smaller images will be expanded and will not look good; larger images will just waste bandwidth and CPU cycles.)\r\n[*]Do not use potentially offensive material involving porn, religious material, animal / human cruelty or ideologically charged images. Staff members have wide discretion on what is acceptable. If in doubt PM one. ');
INSERT INTO `rules` VALUES ('23', '6', 'Uploading rules - <font class=striking>Torrents violating these rules may be deleted without notice</font>', 'Please respect the rules, and if you have any questions about something unclear or not understandable, please [url=contactstaff.php]consult the staff[/url]. Staff reserves the rights to adjudicate.\r\n\r\n[b]GENERAL[/b]\r\n        [*]You must have legal rights to the file you upload.\r\n        [*]Make sure your torrents are well-seeded. If you fail to seed for at least 24 hours or till someone else completes, or purposely keep a low uploading speed, you can be warned and your privilege to upload can be removed.\r\n        [*]You would get 2 times as much of uploading credit for torrents uploaded by yourself.\r\n        [*]If you have something interesting that somehow violates these rules, [url=contactstaff.php]ask the staff[/url] with a detailed description and we might make an exception.\r\n\r\n[b]PRIVILEGE[/b]\r\n        [*]Everyone can upload.\r\n        [*]However, some must go through the [url=offers.php]Offer section[/url]. See [url=faq.php#22]FAQ[/url] for details.\r\n        [*]ONLY users in the class [color=#DC143C][b]Uploader[/b][/color] or above, or users specified by staff can freely upload games. Others should go through the [url=offers.php]Offer section[/url].\r\n\r\n[b]ALLOWED CONTENTS[/b]\r\n        [*]High Definition (HD) videos, including\r\n                [*]complete HD media, e.g. Blu-ray disc, HD DVD disc, etc. or remux,\r\n                [*]captured HDTV streams,\r\n                [*]encodes from above listed sources in HD resolution (at least 720p),\r\n                [*]other HD videos such as HD DV.\r\n        [*]Standard Definition (SD) videos, only\r\n                [*]SD encodes from HD media (at least 480p),\r\n                [*]DVDR/DVDISO,\r\n                [*]DVDRip, CNDVDRip.\r\n        [*]Lossless audio tracks (and corresponding cue sheets), e.g. FLAC, Monkey\'s Audio, etc.\r\n        [*]5.1-channel (or higher) movie dubs and music tracks (DTS, DTS CD Image, etc.), and commentary tracks.\r\n        [*]PC games (must be original images).\r\n        [*]HD trailers released within 7 days.\r\n        [*]HD-related software and documents.\r\n\r\n[b]NOT ALLOWED CONTENTS[/b]\r\n        [*]Contents less than 100 MB in total.\r\n        [*]Upscaled/partially upscaled in Standard Definition mastered/produced content.\r\n        [*]Videos in SD resolution but with low quality, including CAM, TC, TS, SCR, DVDSCR, R5, R5.Line, HalfCD, etc.\r\n        [*]RealVideo encoded videos (usually contained in RMVB or RM), flv files.\r\n        [*]Individual samples (to be included in the \"Main torrent\").\r\n        [*]Lossy audios that are not 5.1-channel (or higher), e.g. common lossy MP3\'s, lossy WMAs, etc.\r\n        [*]Multi-track audio files without proper cue sheets.\r\n        [*]Installation-free or highly compressed games, unofficial game images, third-party mods, collection of tiny games, individual game cracks or patches.\r\n        [*]RAR, etc. archived files.\r\n        [*]Dupe releases. (see beneath for dupe rules.)\r\n        [*]Taboo or sensitive contents (such as porn or politically sensitive topics).\r\n        [*]Damaged files, i.e. files that are erroneous upon reading or playback.\r\n        [*]Spam files, such as viruses, trojans, website links, advertisements, torrents in torrent, etc., or irrelevant files.\r\n\r\n[b]DUPE RULES: QUALITY OVER QUANTITY[/b]\r\n        [*]Video releases are prioritized according to their source media, and mainly: Blu-ray/HD DVD > HDTV > DVD > TV. High prioritized versions will dupe other versions with low priorities of the same video.\r\n        [*]HD releases will dupe SD releases of the same video.\r\n        [*]For animes, HDTV versions are equal in priority to DVD versions. This is an exception.\r\n        [*]Encodes from the same type of media and in the same resolution \r\n                [*]They are prioritized based on \"[url=forums.php?action=viewtopic&forumid=6&topicid=1520]Scene & Internal, from Group to Quality-Degree. ONLY FOR HD-resources[/url]\".\r\n                [*]Releases from preferred groups will dupe releases from groups with the same or lower priority.\r\n                [*]However, one DVD5 sized (i.e. approx. 4.38 GB) release from the best available source will always be allowed.\r\n                [*]Based on lossless screenshots comparison, releases with higher quality will dupe those with low quality.\r\n        [*]Blu-ray Disk/HD DVD Original Copy releases from another region containing different dubbing and/or subtitle aren\'t considered to be dupe.\r\n        [*]Only one copy of the same lossless audio contents will be preserved, and copies of other formats will be duped. FLAC (in separate tracks) is most preferred.\r\n        [*]For contents already on the site\r\n                [*]If new release doesn\'t contain the confirmed errors/glitches/problems of the old release or is based on a better source, then it\'s allowed to be uploaded and the old release is duped.\r\n                [*]If the old release is dead for 45 days or longer, or exists for 18 months or longer, then the new release is free from the dupe rules.\r\n        [*]After uploading the new release, old releases won\'t be removed until they\'re dead of inactivity.\r\n\r\n[b]PACKING RULES (ON TRIAL)[/b]\r\n        ONLY the following contents are allowed to be packed in principle:\r\n        [*]HD movie collections sold as box set (e.g. [i]The Ultimate Matrix Collection Blu-ray Box[/i]).\r\n        [*]Complete season(s) of TV Series/TV shows/animes.\r\n        [*]Documentaries on the same specific subject matter.\r\n        [*]HD trailers released within 7 days.\r\n        [*]MVs of the same artist\r\n                [*]SD MVs are allowed to be packed according to DVD discs only, and no upload of individual songs is allowed.\r\n                [*]HD MVs in the same resolution.\r\n        [*]Music of the same artist\r\n                [*]Only 5 or more albums can be packed.\r\n                [*]Albums released within 2 years can be individually uploaded.\r\n                [*]Generally, contents that are already on the site should be removed from the pack upon uploading, otherwise include them all together in the pack.\r\n        [*]Animes, character songs, dramas, etc. that are released in separate volumes.\r\n        [*]Contents packed by formal groups.\r\n        Packed video contents must be from media of the same type (e.g. Blu-ray discs), in the same resolution standard (e.g. 720p), and encoded in the same video codec (e.g. x264). However, trailer are exceptions. Moreover, a movie collection should be released from the same group. Packed audio contents must be encoded in the same audio codec (e.g. all in FLAC). Corresponding individual torrents can be removed upon packing, depending on actual situation.\r\n        If you are not clear of anything about packing, please [url=contactstaff.php]consult the staff[/url]. Staff reserve all the rights to interpret and deal with packing-related issues.\r\n\r\n[b]EXCEPTIONS[/b]\r\n        [*]ALLOWED: SD videos from TV/DSR in the category \"Sports\".\r\n        [*]ALLOWED: contents less than 100 MB but related to software and documents.\r\n        [*]ALLOWED: single albums that are less than 100 MB.\r\n        [*]ALLOWED: 2.0-channel (or higher) Mandarin/Cantonese dubs.\r\n        [*]ALLOWED: attached subtitles, game cracks and patches, fonts, scans (of packages, etc.). These files must be all either archived or unarchived.\r\n        [*]ALLOWED: when uploading CD releases, attaching contents from the DVD given with the CD.\r\n\r\n[b]TORRENT INFORMATION[/b]\r\n        All torrents shall have descriptive titles, necessary descriptions and other information. Following is a brief regulation. Please refer to \"[url=forums.php?action=viewtopic&topicid=3438&page=0#56711]Standard and Guidance of Torrent Information[/url]\" (in Chinese) for complete and detailed instructions.\r\n        [*]Title\r\n                [*]Movies: [i]Name [Year] [Cut] [Release Info] Resolution Source [Audio/]Video Codec-Tag[/i]\r\n                      e.g. [i]The Dark Knight 2008 PROPER 720p BluRay x264-SiNNERS[/i]\r\n                [*]TV Series/Mini-serie: [i]Name [Year] S**E** [Release Info] Resolution Source [Audio/]Video Codec-Tag[/i]\r\n                      e.g. [i]Prison Break S04E01 PROPER 720p HDTV x264-CTU[/i]\r\n                [*]Musics: [i]Artist - Album [Year] [Version] [Release Info] Audio Codec[-Tag][/i]\r\n                      e.g. [i]Enya - And Winter Came 2008 FLAC[/i]\r\n                [*]Games: [i]Name [Year] [Version] [Release Info][-Tag][/i]\r\n                      e.g. [i]Command And Conquer Red Alert 3 Uprising-RELOADED[/i]\r\n        [*]Small description\r\n                [*]No advertisements or asking for a reseed/requests.\r\n        [*]External Info\r\n                [*]URL of external info for Movies and TV Series is required (if available).\r\n        [*]Description\r\n                [*]Do not use the description for your NFO-artwork! Limit those artistic expressions to the NFO only.\r\n                [*]For Movies, TV Series/Mini-series and animes:\r\n                        [*]Poster, banner or BD/HDDVD/DVD cover is required (If available).\r\n                        [*]Adding screenshots or thumbnails and links to the screenshots is encouraged.\r\n                        [*]Adding detailed file information regarding format, runtime, codec, bitrate, resolution, language, subtitle, etc. is encouraged.\r\n                        [*]Adding a list of staff and cast and plot outline is encouraged.\r\n                [*]For Sports:\r\n                        [*]Don\'t spoil the results trough text/screenshots/filenames/obvious filesize/detailed runtime.\r\n                [*]For Music:\r\n                        [*]The CD cover and the track list are required (if available).\r\n                [*]For PC Games:\r\n                        [*]Poster, banner or BD/HDDVD/DVD cover is required (If available).\r\n                        [*]Adding screenshots or thumbnails and links to the screenshots is encouraged.\r\n        [*]Misc\r\n                [*]Please correctly specify the category and quality info.\r\n        [*]NOTES\r\n                [*]Moderators will edit the torrent info according to the standard.\r\n                [*]Do NOT remove or alter changes done by the staff (but some mistakes can be fixed by the uploader).\r\n                [*]Torrents without required information can be deleted, depending on how they meet the standard.\r\n                [*]The original torrent information can be used if it basically meets the standard.\r\n');
INSERT INTO `rules` VALUES ('28', '6', 'Moderating Rules - <font class=striking>Use your better judgement!</font>', '[*]The most important rule: Use your better judgment!\r\n[*]Don\'t be afraid to say [b]NO[/b]!\r\n[*]Don\'t defy another staff member in public, instead send a PM or through IM.\r\n[*]Be tolerant! Give the user(s) a chance to reform.\r\n[*]Don\'t act prematurely, let the users make their mistakes and THEN correct them.\r\n[*]Try correcting any \"off topics\" rather then closing a thread.\r\n[*]Move topics rather than locking them.\r\n[*]Be tolerant when moderating the chat section (give them some slack).\r\n[*]If you lock a topic, give a brief explanation as to why you\'re locking it.\r\n[*]Before you disable a user account, send him/her a PM and if they reply, put them on a 2 week trial.\r\n[*]Don\'t disable a user account until he or she has been a member for at least 4 weeks.\r\n[*]Convince people by reasoning rather than authority.');
INSERT INTO `rules` VALUES ('54', '25', '管理组成员退休待遇', '满足以下条件可获得的退休待遇: \r\n[b]对于 [color=#DC143C]上传员 (Uploaders)[/color]: [/b]\r\n成为 [color=#1cc6d5][b]养老族 (Retiree) [/b]: [/color]\r\n      升职一年以上; 上传过200个以上的种子资源 (特殊情况如原碟发布, 0day更新等可以由管理组投票表决; 须被认定为作出过重大及持久的贡献).\r\n成为 [color=#009F00][b]VIP[/b]: [/color]\r\n      升职6个月以上; 上传过100个以上的种子资源 (特殊情况如原碟发布, 0day更新等可以由管理组投票表决).\r\n其他:\r\n      成为 [color=#F88C00][b]Extreme User[/b][/color] (如果你的条件满足 [color=#F88C00][b]Extreme User[/b][/color] 及以上, 则成为 [color=#38ACEC][b]Nexus Master[/b][/color]) .\r\n[b]对于 [color=#6495ED]管理员 (Moderators)[/color]: [/b]\r\n成为 [color=#1cc6d5][b]养老族 (Retiree)[/b]: [/color]\r\n      升职一年以上; 参加过至少2次站务组正式会议; 参与过 规则/答疑 的修订工作.\r\n成为 [color=#009F00][b]VIP[/b]: [/color]\r\n      若不满足成为 [color=#1cc6d5][b]养老族 (Retiree)[/b][/color] 的条件, 你可以[b]无条件[/b]成为 [color=#009F00][b]VIP[/b][/color] .\r\n[b]对于 [color=#4b0082]总管理员 (Administrators)[/color] 及 以上等级: [/b]\r\n      可以[b]直接[/b]成为 [color=#1cc6d5][b]养老族 (Retiree)[/b][/color] .\r\n');
INSERT INTO `rules` VALUES ('55', '28', '管理組成員退休待遇', '滿足以下條件可獲得的退休待遇: \r\n\r\n[b]對於 [color=#DC143C]上傳員 (Uploaders)[/color]: [/b]\r\n成為 [color=#1cc6d5][b]養老族 (Retiree) [/b]: [/color]\r\n      升職一年以上; 上傳過200個以上的種子資源 (特殊情況如原碟發佈, 0day更新等可以由管理組投票表決; 須被認定為作出過重大及持久的貢獻).\r\n成為 [color=#009F00][b]VIP[/b]: [/color]\r\n      升職6個月以上; 上傳過100個以上的種子資源 (特殊情況如原碟發佈, 0day更新等可以由管理組投票表決).\r\n其他:\r\n      成為 [color=#F88C00][b]Extreme User[/b][/color] (如果你的條件滿足 [color=#F88C00][b]Extreme User[/b][/color] 及以上, 則成為 [color=#38ACEC][b]Nexus Master[/b][/color]) .\r\n\r\n\r\n[b]對於 [color=#6495ED]管理員 (Moderators)[/color]: [/b]\r\n成為 [color=#1cc6d5][b]養老族 (Retiree)[/b]: [/color]\r\n      升職一年以上; 參加過至少2次站務組正式會議; 參與過 規則/答疑 的修訂工作.\r\n成為 [color=#009F00][b]VIP[/b]: [/color]\r\n      若不滿足成為 [color=#1cc6d5][b]養老族 (Retiree)[/b][/color] 的條件, 你可以[b]無條件[/b]成為 [color=#009F00][b]VIP[/b][/color] .\r\n\r\n\r\n[b]對於 [color=#4b0082]總管理員 (Administrators)[/color] 及 以上等級: [/b]\r\n      可以[b]直接[/b]成為 [color=#1cc6d5][b]養老族 (Retiree)[/b][/color] .');
INSERT INTO `rules` VALUES ('50', '6', 'Rules for Subtitles - <font class=striking>Subtitles violating these rules will be deleted</font>', '(This text is translated from the Chinese version. In case of discrepancy, the original version in Chinese shall prevail.)\r\n\r\n[b]GENERAL PRINCIPLE:[/b]\r\n    [*]All subtitles uploaded must conform to the rules (i.e. proper or qualified). Unqualified subtitles will be deleted.\r\n    [*]Allowed file formats are srt/ssa/ass/cue/zip/rar.\r\n    [*]If you\'re uploading Vobsub (idx+sub) subtitles or subtitles of other types, or a collection (e.g. subtitles for a season pack of some TV series), please zip/rar them before uploading.\r\n    [*]Cue sheet of audio tracks is allowed as well. If there are several cue sheets, please pack them all.\r\n    [*]Uploading lrc lyrics or other non-subtitle/non-cue files is not permitted. Irrelevant files if uploaded will be directly deleted.\r\n\r\n[b]QUALIFYING SUBTITLE/CUE FILES: improper subtitle/cue files will be directly deleted.[/b]\r\n    In any of the following cases, a subtitle/cue file will be judged as improper:\r\n    [*]Fail to match the corresponding torrent.\r\n    [*]Fail to be in sync with the corresponding video/audio file.\r\n    [*]Packed Improperly.\r\n    [*]Contain irrelevant or spam stuff.\r\n    [*]Encoded incorrectly.\r\n    [*]Wrong cue file.\r\n    [*]Wrong language mark.\r\n    [*]The title is indefinite or contains redundant info/characters.\r\n    [*]Duplicate.\r\n    [*]Reported by several users and confirmed with other problems.\r\n    [b]The staff group reserves rights to judge and deal with improper subtitles.[/b]\r\n    Please refer to [url=http://www.nexushd.org/forums.php?action=viewtopic&forumid=13&topicid=2848][i]this thread[/i][/url] in the forum for detailed regulations on qualifying subtitle/cue files, other notes and suggestions on uploading subtitles, and subtitle naming and entitling guidance.\r\n\r\n[b]IMPLEMENTING REGULATIONS OF REWARDS AND PENALTIES [/b]\r\n    [*]Reporting against improper subtitles and the uploaders who purposely upload improper subtitles is always welcomed. To report an improper subtitle, please click on the [i]REPORT[/i] button of the corresponding subtitle in the subtitle section. To report a user, please click on the [i]REPORT[/i] button at the bottom of the user details page.\r\n    [*]The reporter will be rewarded 50 karma points (delivered in three days) for each case after confirmation.\r\n    [*]Improper subtitles will be deleted and the corresponding uploader will be fined 100 karma points in each case.\r\n    [*]Users who recklessly uploading improper subtitles for karma points or other purposes, or users who maliciously report, will be fined karma points or warned depending on the seriousness of the case.');
INSERT INTO `rules` VALUES ('49', '25', '字幕区规则 - <font class=striking>违规字幕将被删除</font>', '[b]总则：[/b]\r\n    [*]所有上传的字幕必须符合规则（即合格的）。不合格的字幕将被删除。\r\n    [*]允许上传的文件格式为srt/ssa/ass/cue/zip/rar。\r\n    [*]如果你打算上传的字幕是Vobsub格式（idx+sub）或其它格式，或者是合集（如电视剧整季的字幕），请将它们打包为zip/rar后再上传。\r\n    [*]字幕区开放音轨对应cue表单文件的上传。如有多个cue，请将它们打包起来。\r\n    [*]不允许lrc歌词或其它非字幕/cue文件的上传。上传的无关文件将被直接删除。\r\n\r\n[b]不合格字幕/cue文件判定：被判定为不合格的字幕/cue文件将被直接删除。[/b]\r\n    出现以下情况之一的字幕/cue文件将被判定为不合格：\r\n    [*]与相应种子不匹配。\r\n    [*]与相应的视频/音频文件不同步。\r\n    [*]打包错误。\r\n    [*]包含无关文件或垃圾信息。\r\n    [*]编码错误。\r\n    [*]cue文件错误。\r\n    [*]语种标识错误。\r\n    [*]标题命名不明确或包含冗余信息或字符。\r\n    [*]被判定为重复。\r\n    [*]接到多个用户举报并被证实有其它问题的。\r\n    [b]管理组保留裁定和处理不合格字幕的权力。[/b]\r\n    不合格字幕/cue文件判定细则、字幕上传的其它注意事项以及命名指引请参阅论坛的[url=http://www.nexushd.org/forums.php?action=viewtopic&forumid=13&topicid=2848]这个帖子[/url]。\r\n\r\n[b]字幕奖惩：[/b]\r\n    [*]欢迎举报不合格的字幕和恶意发布不合格字幕的用户。举报不合格字幕请在字幕区点击相应字幕的“举报”按钮。举报用户请点击相应用户详细信息页面底部的“举报”按钮。\r\n    [*]对每一例不合格字幕的举报，确认后将奖励举报者50点魔力值（三天内发放）。\r\n    [*]被确定为不合格的字幕将被删除，而在每一例中，相应的字幕上传者将被扣除100点魔力值。\r\n    [*]对为赚取积分等目的恶意上传不合格字幕的用户，或是恶意举报的用户，将视情节轻重扣除额外的魔力值甚至给予警告。\r\n');
INSERT INTO `rules` VALUES ('53', '6', 'Staff\'s retirement benefits', 'You can get retirement benefits when meeting these condition(s) below:\r\n\r\n[b]for [color=#DC143C]Uploaders[/color]: [/b]\r\n\r\nTo join [color=#1cc6d5][b]Retiree[/b]: [/color]\r\n      Been promoted for more than 1 year; have posted 200 or more torrents (special cases can be decided via vote among staffs, like Source-Disc posters, scene-uploaders; should be considered as having made rare and enduring contribution).\r\n\r\nTo join [color=#009F00][b]VIP[/b]: [/color]\r\n      Been promoted for more than 6 months; have posted 100 or more torrents (special cases can be decided via vote among staffs, like Source-Disc posters, scene-uploaders).\r\n\r\nOthers:\r\n      Demoted to [color=#F88C00][b]Extreme User[/b][/color] (if your profile meets the corresponding condition of classes [color=#F88C00][b]Extreme User[/b][/color] and above, then promoted to [color=#38ACEC][b]Nexus Master[/b][/color]).\r\n\r\n\r\n[b]for [color=#6495ED]Moderators[/color]: [/b]\r\n\r\nTo join [color=#1cc6d5][b]Retiree[/b]: [/color]\r\n      Been promoted for more than 1 year; Have participated at least 2 Staff [b]Official[/b] Meetings; Have participated in Rules/FAQ modifying.\r\n\r\nTo join [color=#009F00][b]VIP[/b]: [/color]\r\n      If you don\'t meet the condition of joining [color=#1cc6d5][b]Retiree[/b][/color], you can join [color=#009F00][b]VIP[/b][/color] [b]unconditionally[/b].\r\n\r\n\r\n[b]for [color=#4b0082]Administrators[/color] and above: [/b]\r\n\r\n      You can join [color=#1cc6d5][b]Retiree[/b][/color] [b]unconditionally[/b].');
INSERT INTO `rules` VALUES ('51', '28', '字幕區規則 - <font class=striking>違規字幕將被刪除</font>', '[b]總則：[/b]\r\n    [*]所有上傳的字幕必須符合規則（即合格的）。不合格的字幕將被刪除。\r\n    [*]允許上傳的檔案格式為srt/ssa/ass/cue/zip/rar。\r\n    [*]如果你打算上傳的字幕是Vobsub格式（idx+sub）或其它格式，或者是合集（如電視劇整季的字幕），請將它們打包為zip/rar後再上傳。\r\n    [*]字幕區開放音軌對應cue表單文件的上傳。如有多個cue，請將它們打包起來。\r\n    [*]不允許lrc歌詞或其它非字幕/cue文件的上傳。上傳的無關檔將被直接刪除。\r\n\r\n[b]不合格字幕/cue文件判定：被判定為不合格的字幕/cue檔將被直接刪除。[/b]\r\n    出現以下情況之一的字幕/cue檔將被判定為不合格：\r\n    [*]與相應種子不匹配。\r\n    [*]與相應的視頻/音訊檔不同步。\r\n    [*]打包錯誤。\r\n    [*]包含無關檔或垃圾資訊。\r\n    [*]編碼錯誤。\r\n    [*]cue檔錯誤。\r\n    [*]語種標識錯誤。\r\n    [*]標題命名不明確或包含冗餘資訊或字元。\r\n    [*]被判定為重複。\r\n    [*]接到多個用戶舉報並被證實有其它問題的。\r\n    [b]管理組保留裁定和處理不合格字幕的權力。[/b]\r\n    不合格字幕/cue檔判定細則、字幕上傳的其它注意事項以及命名指引請參閱論壇的[url=http://www.nexushd.org/forums.php?action=viewtopic&forumid=13&topicid=2848]這個帖子[/url]。\r\n\r\n[b]字幕獎懲：[/b]\r\n    [*]歡迎舉報不合格的字幕和惡意發佈不合格字幕的用戶。舉報不合格字幕請在字幕區點擊相應字幕的“舉報”按鈕。舉報使用者請點擊相應使用者詳細資訊頁面底部的“舉報”按鈕。\r\n    [*]對每一例不合格字幕的舉報，確認後將獎勵舉報者50點魔力值（三天內發放）。\r\n    [*]被確定為不合格的字幕將被刪除，而在每一例中，相應的字幕上傳者將被扣除100點魔力值。\r\n    [*]對為賺取積分等目的惡意上傳不合格字幕的用戶，或是惡意舉報的用戶，將視情節輕重扣除額外的魔力值甚至給予警告。\r\n');
INSERT INTO `rules` VALUES ('56', '25', '促销及置顶规则 - <font class=striking>申请促销或置顶请联系管理组</font>', '[*][color=red]下载置顶的免费热门种子并保种是提高分享率的捷径[/color]。\r\n[*][color=darkyellow]种子促销规则：[/color]\r\n      [*] 置顶种子将成为“免费”\r\n      [*] [color=red]随机[/color]促销（种子上传后系统自动随机设为促销）：\r\n               [*]10%的概率成为“50%下载”；\r\n               [*]5%的概率成为“免费”；\r\n               [*]5%的概率成为“2x上传”；\r\n               [*]3%的概率成为“50%下载&2x上传”；\r\n               [*]1%的概率成为“免费&2x上传”。\r\n       [*]文件总体积大于30GB的种子将自动成为“免费”。\r\n       [*]电视剧等每季的第一集将成为“免费”。\r\n       [*]关注度高的种子将被设置为促销（由管理员定夺）。\r\n[*]我们也将不定期开启全站免费，届时尽情狂欢吧~\r\n\r\n\r\n[*][color=darkyellow]种子置顶规则：[/color]\r\n总则：置顶资源要求标题符合规则、格式，介绍详尽、准确。严格按照规范做种\r\n[*]【电影】\r\n              1.最新的电影，格式为mkv且影片质量最低为DVDRip；\r\n              2.最新的电影且IMDB评分在7.0以上；\r\n              3.优秀电影合集；\r\n              4.一些比较经典且不易获取到的电影；\r\n              5.一个月前发的种子且做种数小于3的优秀资源；\r\n符合以上任意一条的，即可置顶，置顶时间由管理员斟酌。\r\n[*]【综艺】\r\n              1.下载量高的资源、周更新资源、优秀晚会典礼、高清资源等给予置顶显示。\r\n              2.完整热门合集资源（且＞30G），由发种人申请或管理员酌情限时置顶，永久免费。\r\n              3.特别优秀、原创或者难收集到的资源，由会员申请，管理员加入置顶。\r\n              3.置顶时间：周更新资源高亮一天；优秀晚会典礼置顶3~5天，热门周更新高清资源（720P等）置顶两天；高清晚会（720P）置顶五天，永久免费。\r\n[*]【剧集】\r\n              1.置顶资源可以为DVD介质，原则上片源要求为HDTV、HD-DVD及Blu-ray。\r\n              2.新剧第一集以及热播新剧，画质720P以上，置顶1天。\r\n              3.画质720P以上的热播电视剧合集由管理员酌情，置顶5天。\r\n              4.经典国产电视剧合集或者IMDB评分7.0以上的合集，由管理员酌情置顶，置顶3-5天。\r\n[*]【动漫】\r\n              1.新番第一集置顶一天，新番合集置顶两天。\r\n              2.高质量经典动漫合集可申请置顶\r\n[*]【音乐】/【MV】\r\n              1.  最新专辑置顶3天\r\n              2.  经典专辑完整合集可申请置顶\r\n[*]【体育】\r\n              1.热门体育联赛的最新比赛，画质720P以上，置顶1天\r\n              2.足球、篮球以外的关注度较高的体育比赛，画质720P以上，管理员酌情置顶。\r\n              3.高清的有纪念意义的经典比赛、比赛精彩镜头剪辑及其他体育节目由管理员酌情置顶\r\n[*]【学习】\r\n       麦田鼓励发布和下载学习类资源\r\n              1.学习类资源原则上均做一定促销\r\n              2.学习类资源由管理员斟酌后选择优秀有意义的置顶\r\n              3.请发布者联系管理员申请\r\n[*]【纪录片】\r\n              1.期待度较高的最新纪录片优先考虑置顶。\r\n              2.各大影视网站评分较高的优先考虑置顶。\r\n              3.内容经典：视角独特、观点新颖、内容真实、客观，较有人文关怀、主题有独到见解，深入挖掘、画面唯美、绚丽、让人赏心悦目的优先考虑置顶。\r\n[*]【软件】、【PC游戏】、【掌机】\r\n              一般不考虑置顶，特殊情况由管理员斟酌。\r\n\r\n[*]资源置顶的决定权、解释权归管理员所有，各版主有权调整置顶内容及时间。\r\n');

-- ----------------------------
-- Table structure for `schools`
-- ----------------------------
DROP TABLE IF EXISTS `schools`;
CREATE TABLE `schools` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `ip` varchar(14) NOT NULL,
  PRIMARY KEY  (`id`),
  FULLTEXT KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=236 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schools
-- ----------------------------
INSERT INTO `schools` VALUES ('1', '清华大学', '2001:DA8:0200');
INSERT INTO `schools` VALUES ('2', '北京大学', '2001:DA8:0201');
INSERT INTO `schools` VALUES ('3', '北京邮电大学', '2001:DA8:0202');
INSERT INTO `schools` VALUES ('4', '北京航天航空大学', '2001:DA8:0203');
INSERT INTO `schools` VALUES ('5', '北京理工大学', '2001:DA8:0204');
INSERT INTO `schools` VALUES ('6', '北京交通大学', '2001:DA8:0205');
INSERT INTO `schools` VALUES ('7', '北京城市学院', '2001:DA8:0206');
INSERT INTO `schools` VALUES ('8', '北京师范大学', '2001:DA8:0207');
INSERT INTO `schools` VALUES ('9', '北京科技大学', '2001:DA8:0208');
INSERT INTO `schools` VALUES ('10', '首都经济贸易大学', '2001:DA8:0209');
INSERT INTO `schools` VALUES ('11', '北方工业大学', '2001:DA8:020A');
INSERT INTO `schools` VALUES ('12', '国家计算机网络应急技术处理协调中心', '2001:DA8:020B');
INSERT INTO `schools` VALUES ('13', '华北电力大学(北京)', '2001:DA8:020C');
INSERT INTO `schools` VALUES ('14', '赛尔网络有限公司IDC部门', '2001:DA8:020D');
INSERT INTO `schools` VALUES ('15', '中国传媒大学', '2001:DA8:020E');
INSERT INTO `schools` VALUES ('16', '北京外国语大学', '2001:DA8:020F');
INSERT INTO `schools` VALUES ('17', '北京机械工业学院', '2001:DA8:0210');
INSERT INTO `schools` VALUES ('18', '北京林业大学', '2001:DA8:0211');
INSERT INTO `schools` VALUES ('19', '北京信息工程学院', '2001:DA8:0212');
INSERT INTO `schools` VALUES ('20', '教育部科技发展中心', '2001:DA8:0213');
INSERT INTO `schools` VALUES ('21', '中国地质大学(北京)', '2001:DA8:0214');
INSERT INTO `schools` VALUES ('22', '北京邮电大学', '2001:DA8:0215');
INSERT INTO `schools` VALUES ('23', '北京工业大学', '2001:DA8:0216');
INSERT INTO `schools` VALUES ('24', 'DRAGONLAB实验室', '2001:DA8:0217');
INSERT INTO `schools` VALUES ('25', '首都师范大学', '2001:DA8:0218');
INSERT INTO `schools` VALUES ('26', '中央民族大学', '2001:DA8:0219');
INSERT INTO `schools` VALUES ('27', '中国人民大学', '2001:DA8:021C');
INSERT INTO `schools` VALUES ('28', '内蒙古大学', '2001:DA8:021D');
INSERT INTO `schools` VALUES ('29', '太原理工大学', '2001:DA8:021E');
INSERT INTO `schools` VALUES ('30', '中国矿业大学', '2001:DA8:0223');
INSERT INTO `schools` VALUES ('31', '中国政法大学', '2001:DA8:0224');
INSERT INTO `schools` VALUES ('32', '清华大学', '2001:DA8:0225');
INSERT INTO `schools` VALUES ('33', '清华大学网络中心网管研究', '2001:DA8:0226');
INSERT INTO `schools` VALUES ('34', '中央音乐学院', '2001:DA8:022B');
INSERT INTO `schools` VALUES ('35', '北京语言大学', '2001:DA8:022D');
INSERT INTO `schools` VALUES ('36', '对外经济贸易大学', '2001:DA8:0230');
INSERT INTO `schools` VALUES ('37', 'CERNET2核心节点-南京', '2001:DA8:1000');
INSERT INTO `schools` VALUES ('38', '江苏省教育和科研计算机网', '2001:DA8:1001');
INSERT INTO `schools` VALUES ('39', '东南大学', '2001:DA8:1002');
INSERT INTO `schools` VALUES ('40', '南京师范大学', '2001:DA8:1003');
INSERT INTO `schools` VALUES ('41', '河海大学', '2001:DA8:1004');
INSERT INTO `schools` VALUES ('42', '南京农业大学', '2001:DA8:1005');
INSERT INTO `schools` VALUES ('43', '南京航空航天大学', '2001:DA8:1006');
INSERT INTO `schools` VALUES ('44', '南京大学', '2001:DA8:1007');
INSERT INTO `schools` VALUES ('45', '江苏工业学院', '2001:DA8:1008');
INSERT INTO `schools` VALUES ('46', '河海大学常州校区', '2001:DA8:1009');
INSERT INTO `schools` VALUES ('47', '苏州大学', '2001:DA8:100A');
INSERT INTO `schools` VALUES ('48', '中国矿业大学', '2001:DA8:100D');
INSERT INTO `schools` VALUES ('49', '南京理工大学', '2001:DA8:100E');
INSERT INTO `schools` VALUES ('50', '江南大学', '2001:DA8:1010');
INSERT INTO `schools` VALUES ('51', '华南理工大学', '2001:DA8:2000');
INSERT INTO `schools` VALUES ('52', '广州市教育局', '2001:DA8:2001');
INSERT INTO `schools` VALUES ('53', '暨南大学', '2001:DA8:2002');
INSERT INTO `schools` VALUES ('54', '华南师范大学', '2001:DA8:200B');
INSERT INTO `schools` VALUES ('55', '华南农业大学', '2001:DA8:2004');
INSERT INTO `schools` VALUES ('56', '华中科技大学', '2001:DA8:3000');
INSERT INTO `schools` VALUES ('57', '华中师范大学', '2001:DA8:3001');
INSERT INTO `schools` VALUES ('58', '华中农业大学', '2001:DA8:3002');
INSERT INTO `schools` VALUES ('59', '华中科技大学同济医学院', '2001:DA8:3008');
INSERT INTO `schools` VALUES ('60', '西安交通大学', '2001:DA8:4000');
INSERT INTO `schools` VALUES ('61', '西安建筑科技大学', '2001:DA8:4003');
INSERT INTO `schools` VALUES ('62', '郑州大学', '2001:DA8:5000');
INSERT INTO `schools` VALUES ('63', '河南财经学院', '2001:DA8:5001');
INSERT INTO `schools` VALUES ('64', '解放军信息工程大学', '2001:DA8:5002');
INSERT INTO `schools` VALUES ('65', '河南省财经学校', '2001:DA8:5003');
INSERT INTO `schools` VALUES ('66', '河南省教育科研网', '2001:DA8:5004');
INSERT INTO `schools` VALUES ('67', '郑州大学西亚斯国际学院', '2001:DA8:5005');
INSERT INTO `schools` VALUES ('68', '电子科技大学', '2001:DA8:6000');
INSERT INTO `schools` VALUES ('69', '四川农业大学', '2001:DA8:6004');
INSERT INTO `schools` VALUES ('70', '山东大学', '2001:DA8:7000');
INSERT INTO `schools` VALUES ('71', '山东大学齐鲁软件学院', '2001:DA8:7001');
INSERT INTO `schools` VALUES ('72', 'CERNET山东省网络中心', '2001:DA8:7002');
INSERT INTO `schools` VALUES ('73', '山东大学', '2001:DA8:7003');
INSERT INTO `schools` VALUES ('74', '山东农业大学', '2001:DA8:7004');
INSERT INTO `schools` VALUES ('75', '济南大学', '2001:DA8:7005');
INSERT INTO `schools` VALUES ('76', '中国石油大学(华东)', '2001:DA8:7006');
INSERT INTO `schools` VALUES ('77', '中国石油大学(华东)青岛校区', '2001:DA8:7007');
INSERT INTO `schools` VALUES ('78', '山东理工大学', '2001:DA8:7008');
INSERT INTO `schools` VALUES ('79', '烟台大学', '2001:DA8:7009');
INSERT INTO `schools` VALUES ('80', '烟台师范学院', '2001:DA8:700A');
INSERT INTO `schools` VALUES ('81', '山东省计算中心', '2001:DA8:700B');
INSERT INTO `schools` VALUES ('82', '山东财政学院', '2001:DA8:700C');
INSERT INTO `schools` VALUES ('83', '中国海洋大学', '2001:DA8:7013');
INSERT INTO `schools` VALUES ('84', '上海交通大学', '2001:DA8:8000');
INSERT INTO `schools` VALUES ('85', '复旦大学', '2001:DA8:8001');
INSERT INTO `schools` VALUES ('86', '同济大学', '2001:DA8:8002');
INSERT INTO `schools` VALUES ('87', '上海交通大学-上海城域网', '2001:DA8:8003');
INSERT INTO `schools` VALUES ('88', '上海理工大学', '2001:DA8:8004');
INSERT INTO `schools` VALUES ('89', '华东师范大学', '2001:DA8:8005');
INSERT INTO `schools` VALUES ('90', '上海大学', '2001:DA8:8006');
INSERT INTO `schools` VALUES ('91', '华东理工大学', '2001:DA8:8007');
INSERT INTO `schools` VALUES ('92', '东华大学', '2001:DA8:8008');
INSERT INTO `schools` VALUES ('93', '上海市教育委员会', '2001:DA8:8009');
INSERT INTO `schools` VALUES ('94', '上海交通大学医学院', '2001:DA8:800A');
INSERT INTO `schools` VALUES ('95', '上海师范大学', '2001:DA8:800B');
INSERT INTO `schools` VALUES ('96', '第二军医大学', '2001:DA8:800C');
INSERT INTO `schools` VALUES ('97', '上海财经大学', '2001:DA8:800D');
INSERT INTO `schools` VALUES ('98', '上海外国语大学', '2001:DA8:800E');
INSERT INTO `schools` VALUES ('99', '上海建桥学院', '2001:DA8:800F');
INSERT INTO `schools` VALUES ('100', '东北大学', '2001:DA8:9000');
INSERT INTO `schools` VALUES ('101', '辽宁大学', '2001:DA8:9001');
INSERT INTO `schools` VALUES ('102', '东北大学', '2001:DA8:900B');
INSERT INTO `schools` VALUES ('103', '天津大学', '2001:DA8:A000');
INSERT INTO `schools` VALUES ('104', '天津理工大学', '2001:DA8:A001');
INSERT INTO `schools` VALUES ('105', '天津医科大学', '2001:DA8:A002');
INSERT INTO `schools` VALUES ('106', '大连理工大学', '2001:DA8:A800');
INSERT INTO `schools` VALUES ('107', '大连海事大学', '2001:DA8:A801');
INSERT INTO `schools` VALUES ('108', '大连轻工业学院', '2001:DA8:A802');
INSERT INTO `schools` VALUES ('109', '吉林大学', '2001:DA8:B000');
INSERT INTO `schools` VALUES ('110', '东北电力学院', '2001:DA8:B001');
INSERT INTO `schools` VALUES ('111', '吉林大学农学部', '2001:DA8:B007');
INSERT INTO `schools` VALUES ('112', '哈尔滨工业大学', '2001:DA8:B800');
INSERT INTO `schools` VALUES ('113', '哈尔滨工业大学', '2001:DA8:B801');
INSERT INTO `schools` VALUES ('114', '兰州大学', '2001:DA8:C000');
INSERT INTO `schools` VALUES ('115', '甘肃省教育和科研计算机网', '2001:DA8:C001');
INSERT INTO `schools` VALUES ('116', '甘肃政法学院', '2001:DA8:C002');
INSERT INTO `schools` VALUES ('117', '西北师范大学', '2001:DA8:C003');
INSERT INTO `schools` VALUES ('118', '重庆大学', '2001:DA8:C800');
INSERT INTO `schools` VALUES ('119', '重庆交通大学', '2001:DA8:C801');
INSERT INTO `schools` VALUES ('120', '重庆师范大学', '2001:DA8:C802');
INSERT INTO `schools` VALUES ('121', '西南大学', '2001:DA8:C803');
INSERT INTO `schools` VALUES ('122', '中南大学', '2001:DA8:D000');
INSERT INTO `schools` VALUES ('123', '湖南师范大学', '2001:DA8:D001');
INSERT INTO `schools` VALUES ('124', '长沙理工大学', '2001:DA8:D002');
INSERT INTO `schools` VALUES ('125', '湖南商学院', '2001:DA8:D003');
INSERT INTO `schools` VALUES ('126', '中国科技大学', '2001:DA8:D800');
INSERT INTO `schools` VALUES ('127', '解放军电子工程学院', '2001:DA8:D801');
INSERT INTO `schools` VALUES ('128', '安徽理工大学', '2001:DA8:D802');
INSERT INTO `schools` VALUES ('129', '安徽中医学院', '2001:DA8:D803');
INSERT INTO `schools` VALUES ('130', '皖南医学院', '2001:DA8:D804');
INSERT INTO `schools` VALUES ('131', '合肥工业大学', '2001:DA8:D805');
INSERT INTO `schools` VALUES ('132', '浙江大学', '2001:DA8:E000');
INSERT INTO `schools` VALUES ('133', '浙江工业大学', '2001:DA8:E001');
INSERT INTO `schools` VALUES ('134', '浙江大学宁波理工学院', '2001:DA8:E002');
INSERT INTO `schools` VALUES ('135', '厦门大学', '2001:DA8:E800');
INSERT INTO `schools` VALUES ('136', '福建农林大学', '2001:DA8:E801');
INSERT INTO `schools` VALUES ('137', '福建师范大学', '2001:DA8:E802');
INSERT INTO `schools` VALUES ('138', '陕西师范', '2001:DA8:4001');
INSERT INTO `schools` VALUES ('139', '西安石油大学', '2001:DA8:4015');
INSERT INTO `schools` VALUES ('140', '清华大学', '2001:250:0200');
INSERT INTO `schools` VALUES ('141', '北京大学', '2001:250:0201');
INSERT INTO `schools` VALUES ('142', '北京交通大学', '2001:250:0202');
INSERT INTO `schools` VALUES ('143', '中国人民大学', '2001:250:0205');
INSERT INTO `schools` VALUES ('144', '北京航空航天大学', '2001:250:0206');
INSERT INTO `schools` VALUES ('145', '北京化工大学', '2001:250:0207');
INSERT INTO `schools` VALUES ('146', '北京大学医学部', '2001:250:0208');
INSERT INTO `schools` VALUES ('147', '中国农业大学', '2001:250:0209');
INSERT INTO `schools` VALUES ('148', '中国矿业大学', '2001:250:020A');
INSERT INTO `schools` VALUES ('149', '北京师范大学', '2001:250:020B');
INSERT INTO `schools` VALUES ('150', '北京科技大学', '2001:250:020E');
INSERT INTO `schools` VALUES ('151', '北京中医药大学', '2001:250:0212');
INSERT INTO `schools` VALUES ('152', '中国传媒大学', '2001:250:0217');
INSERT INTO `schools` VALUES ('153', '北京外国语大学', '2001:250:0218');
INSERT INTO `schools` VALUES ('154', '北京林业大学', '2001:250:021A');
INSERT INTO `schools` VALUES ('155', '北京工业大学', '2001:250:021C');
INSERT INTO `schools` VALUES ('156', '天津大学', '2001:250:0400');
INSERT INTO `schools` VALUES ('157', '南开大学', '2001:250:0401');
INSERT INTO `schools` VALUES ('158', '河北工业大学', '2001:250:0405');
INSERT INTO `schools` VALUES ('159', '华北工学院', '2001:250:0C00');
INSERT INTO `schools` VALUES ('160', '太原理工大学', '2001:250:0C01');
INSERT INTO `schools` VALUES ('161', '内蒙古大学', '2001:250:0E00');
INSERT INTO `schools` VALUES ('162', '内蒙古师范大学', '2001:250:0E02');
INSERT INTO `schools` VALUES ('163', '西安交通大学', '2001:250:1001');
INSERT INTO `schools` VALUES ('164', '西北农林科技大学', '2001:250:1002');
INSERT INTO `schools` VALUES ('165', '西北大学', '2001:250:1003');
INSERT INTO `schools` VALUES ('166', '西北工业大学', '2001:250:1004');
INSERT INTO `schools` VALUES ('167', '长安大学', '2001:250:1005');
INSERT INTO `schools` VALUES ('168', '西安电子科技大学', '2001:250:1006');
INSERT INTO `schools` VALUES ('169', '第四军医大学', '2001:250:1007');
INSERT INTO `schools` VALUES ('170', '兰州大学', '2001:250:1400');
INSERT INTO `schools` VALUES ('171', '兰州理工大学', '2001:250:1401');
INSERT INTO `schools` VALUES ('172', '新疆大学', '2001:250:1800');
INSERT INTO `schools` VALUES ('173', '华南理工大学', '2001:250:1804');
INSERT INTO `schools` VALUES ('174', '华南理工大学', '2001:250:1999');
INSERT INTO `schools` VALUES ('175', '电子科技大学', '2001:250:2000');
INSERT INTO `schools` VALUES ('176', '西南交通大学', '2001:250:2002');
INSERT INTO `schools` VALUES ('177', '四川大学', '2001:250:2003');
INSERT INTO `schools` VALUES ('178', '四川西华大学', '2001:250:2009');
INSERT INTO `schools` VALUES ('179', '云南大学', '2001:250:2800');
INSERT INTO `schools` VALUES ('180', '华南理工大学', '2001:250:3000');
INSERT INTO `schools` VALUES ('181', '中山大学', '2001:250:3002');
INSERT INTO `schools` VALUES ('182', '广西大学', '2001:250:3401');
INSERT INTO `schools` VALUES ('183', '深圳大学', '2001:250:3C00');
INSERT INTO `schools` VALUES ('184', '深圳大学城', '2001:250:3C02');
INSERT INTO `schools` VALUES ('185', '华中科技大学', '2001:250:4000');
INSERT INTO `schools` VALUES ('186', '武汉大学', '2001:250:4001');
INSERT INTO `schools` VALUES ('187', '中国地质大学(武汉)', '2001:250:4002');
INSERT INTO `schools` VALUES ('188', '武汉理工大学', '2001:250:4004');
INSERT INTO `schools` VALUES ('189', '中南大学', '2001:250:4400');
INSERT INTO `schools` VALUES ('190', '国防科学技术大学', '2001:250:4401');
INSERT INTO `schools` VALUES ('191', '湖南大学', '2001:250:4402');
INSERT INTO `schools` VALUES ('192', '郑州大学', '2001:250:4800');
INSERT INTO `schools` VALUES ('193', '郑州大学', '2001:250:480B');
INSERT INTO `schools` VALUES ('194', '解放军信息工程大学', '2001:250:480F');
INSERT INTO `schools` VALUES ('195', '常熟理工学院', '2001:250:5003');
INSERT INTO `schools` VALUES ('196', '南京师范大学', '2001:250:5004');
INSERT INTO `schools` VALUES ('197', '河海大学', '2001:250:5005');
INSERT INTO `schools` VALUES ('198', '南京农业大学', '2001:250:5006');
INSERT INTO `schools` VALUES ('199', '南京航空航天大学', '2001:250:5007');
INSERT INTO `schools` VALUES ('200', '江苏工业学院', '2001:250:5008');
INSERT INTO `schools` VALUES ('201', '河海大学常州校区', '2001:250:5009');
INSERT INTO `schools` VALUES ('202', '中国科学技术大学', '2001:250:5400');
INSERT INTO `schools` VALUES ('203', '安徽大学', '2001:250:5401');
INSERT INTO `schools` VALUES ('204', '山东大学', '2001:250:5800');
INSERT INTO `schools` VALUES ('205', '山东大学', '2001:250:580A');
INSERT INTO `schools` VALUES ('206', '山东大学', '2001:250:5813');
INSERT INTO `schools` VALUES ('207', '中国海洋大学', '2001:250:5806');
INSERT INTO `schools` VALUES ('208', '中国石油大学', '2001:250:5807');
INSERT INTO `schools` VALUES ('209', '中国石油大学（青岛）', '2001:250:5808');
INSERT INTO `schools` VALUES ('210', '上海交通大学', '2001:250:6000');
INSERT INTO `schools` VALUES ('211', '复旦大学', '2001:250:6001');
INSERT INTO `schools` VALUES ('212', '华东理工大学', '2001:250:6003');
INSERT INTO `schools` VALUES ('213', '上海财经大学', '2001:250:6005');
INSERT INTO `schools` VALUES ('214', '同济大学', '2001:250:6006');
INSERT INTO `schools` VALUES ('215', '上海交通大学医学院', '2001:250:6007');
INSERT INTO `schools` VALUES ('216', '上海大学', '2001:250:6008');
INSERT INTO `schools` VALUES ('217', '上海交通大学-上海城域网', '2001:250:600D');
INSERT INTO `schools` VALUES ('218', '上海外国语大学', '2001:250:600F');
INSERT INTO `schools` VALUES ('219', '浙江大学', '2001:250:6400');
INSERT INTO `schools` VALUES ('220', '浙江大学', '2001:250:6405');
INSERT INTO `schools` VALUES ('221', '厦门大学', '2001:250:6800');
INSERT INTO `schools` VALUES ('222', '集美大学', '2001:250:6801');
INSERT INTO `schools` VALUES ('223', '福州大学', '2001:250:6803');
INSERT INTO `schools` VALUES ('224', '南昌大学', '2001:250:6C00');
INSERT INTO `schools` VALUES ('225', '大连理工大学', '2001:250:7000');
INSERT INTO `schools` VALUES ('226', '东北大学', '2001:250:7001');
INSERT INTO `schools` VALUES ('227', '吉林大学', '2001:250:7400');
INSERT INTO `schools` VALUES ('228', '东北师范大学', '2001:250:7401');
INSERT INTO `schools` VALUES ('229', '哈尔滨工程大学', '2001:250:7801');
INSERT INTO `schools` VALUES ('230', '北京邮电大学', '2001:250:9001');
INSERT INTO `schools` VALUES ('231', '华南农业大学', '2001:251:4003');
INSERT INTO `schools` VALUES ('232', '暨南大学', '2001:251:4004');
INSERT INTO `schools` VALUES ('233', '3Tnet网', '2001:256:0100');
INSERT INTO `schools` VALUES ('234', '中科院研究生院', '2001:CC0:2020');
INSERT INTO `schools` VALUES ('235', '华南理工大学', '2001:250:3000');

-- ----------------------------
-- Table structure for `searchbox`
-- ----------------------------
DROP TABLE IF EXISTS `searchbox`;
CREATE TABLE `searchbox` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `showsubcat` tinyint(1) NOT NULL default '0',
  `showsource` tinyint(1) NOT NULL default '0',
  `showmedium` tinyint(1) NOT NULL default '0',
  `showcodec` tinyint(1) NOT NULL default '0',
  `showstandard` tinyint(1) NOT NULL default '0',
  `showprocessing` tinyint(1) NOT NULL default '0',
  `showteam` tinyint(1) NOT NULL default '0',
  `showaudiocodec` tinyint(1) NOT NULL default '0',
  `catsperrow` smallint(5) unsigned NOT NULL default '7',
  `catpadding` smallint(5) unsigned NOT NULL default '25',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of searchbox
-- ----------------------------
INSERT INTO `searchbox` VALUES ('4', 'chd', '1', '1', '0', '0', '0', '0', '0', '0', '14', '13');
INSERT INTO `searchbox` VALUES ('9', 'mt', '1', '1', '0', '0', '0', '0', '0', '0', '8', '3');

-- ----------------------------
-- Table structure for `secondicons`
-- ----------------------------
DROP TABLE IF EXISTS `secondicons`;
CREATE TABLE `secondicons` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `source` tinyint(3) unsigned NOT NULL default '0',
  `medium` tinyint(3) unsigned NOT NULL default '0',
  `codec` tinyint(3) unsigned NOT NULL default '0',
  `standard` tinyint(3) unsigned NOT NULL default '0',
  `processing` tinyint(3) unsigned NOT NULL default '0',
  `team` tinyint(3) unsigned NOT NULL default '0',
  `audiocodec` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(30) NOT NULL,
  `class_name` varchar(255) default NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secondicons
-- ----------------------------
INSERT INTO `secondicons` VALUES ('1', '0', '1', '1', '0', '0', '0', '0', 'Blu-ray/H.264', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('2', '0', '1', '2', '0', '0', '0', '0', 'Blu-ray/VC-1', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('3', '0', '1', '4', '0', '0', '0', '0', 'Blu-ray/MPEG-2', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('4', '0', '2', '1', '0', '0', '0', '0', 'HD DVD/H.264', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('5', '0', '2', '2', '0', '0', '0', '0', 'HD DVD/VC-1', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('6', '0', '2', '4', '0', '0', '0', '0', 'HD DVD/MPEG-2', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('7', '0', '3', '1', '0', '0', '0', '0', 'Remux/H.264', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('8', '0', '3', '2', '0', '0', '0', '0', 'Remux/VC-1', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('9', '0', '3', '4', '0', '0', '0', '0', 'Remux/MPEG-2', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('10', '0', '4', '0', '0', '0', '0', '0', 'AVCHD', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('11', '0', '5', '1', '0', '0', '0', '0', 'HDTV/H.264', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('12', '0', '5', '4', '0', '0', '0', '0', 'HDTV/MPEG-2', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('13', '0', '6', '0', '0', '0', '0', '0', 'DVDR', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('14', '0', '7', '1', '0', '0', '0', '0', 'Rip/H.264', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('15', '0', '7', '3', '0', '0', '0', '0', 'Rip/Xvid', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('16', '0', '8', '5', '0', '0', '0', '0', 'CD/FLAC', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('17', '0', '8', '6', '0', '0', '0', '0', 'CD/APE', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('18', '0', '8', '7', '0', '0', '0', '0', 'CD/DTS', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('19', '0', '8', '9', '0', '0', '0', '0', 'CD/Other', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('20', '0', '9', '5', '0', '0', '0', '0', 'Extract/FLAC', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('21', '0', '9', '7', '0', '0', '0', '0', 'Extract/DTS', null, 'bdh264.png');
INSERT INTO `secondicons` VALUES ('22', '0', '9', '8', '0', '0', '0', '0', 'Extract/AC-3', null, 'bdh264.png');

-- ----------------------------
-- Table structure for `shoutbox`
-- ----------------------------
DROP TABLE IF EXISTS `shoutbox`;
CREATE TABLE `shoutbox` (
  `id` int(10) NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `date` int(10) unsigned NOT NULL default '0',
  `text` text NOT NULL,
  `type` enum('sb','hb') NOT NULL default 'sb',
  `ip` varbinary(64) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `sitelog`
-- ----------------------------
DROP TABLE IF EXISTS `sitelog`;
CREATE TABLE `sitelog` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `txt` text NOT NULL,
  `security_level` enum('normal','mod') NOT NULL default 'normal',
  PRIMARY KEY  (`id`),
  KEY `added` (`added`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `snatched`
-- ----------------------------
DROP TABLE IF EXISTS `snatched`;
CREATE TABLE `snatched` (
  `id` int(10) NOT NULL auto_increment,
  `torrentid` mediumint(8) unsigned NOT NULL default '0',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `ip` varchar(64) NOT NULL default '',
  `port` smallint(5) unsigned NOT NULL default '0',
  `uploaded` bigint(20) unsigned NOT NULL default '0',
  `downloaded` bigint(20) unsigned NOT NULL default '0',
  `to_go` bigint(20) unsigned NOT NULL default '0',
  `seedtime` int(10) unsigned NOT NULL default '0',
  `leechtime` int(10) unsigned NOT NULL default '0',
  `last_action` datetime NOT NULL default '0000-00-00 00:00:00',
  `startdat` datetime NOT NULL default '0000-00-00 00:00:00',
  `completedat` datetime NOT NULL default '0000-00-00 00:00:00',
  `finished` enum('yes','no') NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `torrentid_userid` (`torrentid`,`userid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of snatched
-- ----------------------------

-- ----------------------------
-- Table structure for `sources`
-- ----------------------------
DROP TABLE IF EXISTS `sources`;
CREATE TABLE `sources` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `lid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sources
-- ----------------------------
INSERT INTO `sources` VALUES ('1', '414', '音乐-欧美', '142');
INSERT INTO `sources` VALUES ('2', '414', '音乐-华语', '141');
INSERT INTO `sources` VALUES ('3', '401', '电影-高清', '5');
INSERT INTO `sources` VALUES ('4', '401', '电影-日韩', '8');
INSERT INTO `sources` VALUES ('5', '401', '电影-欧美', '7');
INSERT INTO `sources` VALUES ('6', '401', '电影-国产', '6');
INSERT INTO `sources` VALUES ('9', '414', '音乐-古典', '144');
INSERT INTO `sources` VALUES ('8', '414', '音乐-日韩', '143');
INSERT INTO `sources` VALUES ('7', '401', '电影-rmvb&枪版&预告片&其他', '11');
INSERT INTO `sources` VALUES ('10', '414', '音乐-无损', '140');
INSERT INTO `sources` VALUES ('11', '410', '游戏-单机', '101');
INSERT INTO `sources` VALUES ('12', '410', '游戏-网络', '102');
INSERT INTO `sources` VALUES ('13', '410', '游戏-其他', '104');
INSERT INTO `sources` VALUES ('51', '406', 'MV-单集', '150');
INSERT INTO `sources` VALUES ('15', '403', '综艺-综合', '31');
INSERT INTO `sources` VALUES ('16', '403', '综艺-晚会', '32');
INSERT INTO `sources` VALUES ('17', '403', '综艺-科教', '34');
INSERT INTO `sources` VALUES ('18', '403', '综艺-娱乐', '30');
INSERT INTO `sources` VALUES ('19', '403', '综艺-典礼', '33');
INSERT INTO `sources` VALUES ('20', '407', '体育-篮球', '70');
INSERT INTO `sources` VALUES ('21', '407', '体育-足球', '71');
INSERT INTO `sources` VALUES ('22', '407', '体育-其他', '73');
INSERT INTO `sources` VALUES ('23', '402', '剧集-大陆', '20');
INSERT INTO `sources` VALUES ('24', '402', '剧集-港台', '21');
INSERT INTO `sources` VALUES ('25', '402', '剧集-美剧', '22');
INSERT INTO `sources` VALUES ('26', '402', '剧集-日剧', '23');
INSERT INTO `sources` VALUES ('27', '402', '剧集-韩剧', '24');
INSERT INTO `sources` VALUES ('28', '402', '剧集-合集', '19');
INSERT INTO `sources` VALUES ('29', '411', '专业学科', '110');
INSERT INTO `sources` VALUES ('30', '411', '讲座演讲', '112');
INSERT INTO `sources` VALUES ('31', '411', '期刊书籍', '113');
INSERT INTO `sources` VALUES ('32', '411', '外语学习', '114');
INSERT INTO `sources` VALUES ('50', '408', '软件-Linux', '81');
INSERT INTO `sources` VALUES ('34', '404', '纪录片-国家地理', '41');
INSERT INTO `sources` VALUES ('35', '404', '纪录片-探索频道', '42');
INSERT INTO `sources` VALUES ('37', '404', '纪录片-CCTV', '44');
INSERT INTO `sources` VALUES ('49', '409', '其他-其他', '255');
INSERT INTO `sources` VALUES ('39', '404', '纪录片-BBC', '46');
INSERT INTO `sources` VALUES ('40', '404', '纪录片-历史频道', '43');
INSERT INTO `sources` VALUES ('41', '404', '纪录片-其他', '48');
INSERT INTO `sources` VALUES ('42', '408', '软件-Windows', '80');
INSERT INTO `sources` VALUES ('43', '408', '软件-手机', '83');
INSERT INTO `sources` VALUES ('44', '408', '软件-其他', '84');
INSERT INTO `sources` VALUES ('45', '405', '动漫-连载', '50');
INSERT INTO `sources` VALUES ('46', '405', '动漫-漫画', '53');
INSERT INTO `sources` VALUES ('47', '405', '动漫-其他', '55');
INSERT INTO `sources` VALUES ('52', '410', '游戏-掌机', '103');
INSERT INTO `sources` VALUES ('62', '409', '其他-游戏视频', '252');
INSERT INTO `sources` VALUES ('54', '423', '个人整理合集', '170');
INSERT INTO `sources` VALUES ('55', '401', '电影-蓝光', '9');
INSERT INTO `sources` VALUES ('56', '423', '个人录制视频', '172');
INSERT INTO `sources` VALUES ('57', '401', '电影-合集', '10');
INSERT INTO `sources` VALUES ('58', '411', '考研资料', '111');
INSERT INTO `sources` VALUES ('59', '406', 'MV-合集', '151');
INSERT INTO `sources` VALUES ('60', '406', 'MV-演唱会', '152');
INSERT INTO `sources` VALUES ('63', '409', '其他-电子文档', '250');
INSERT INTO `sources` VALUES ('66', '405', '动漫-完结', '51');
INSERT INTO `sources` VALUES ('65', '414', '音乐-原声', '145');
INSERT INTO `sources` VALUES ('67', '405', '动漫-OVA剧场版', '52');
INSERT INTO `sources` VALUES ('68', '409', '其他-其他视频', '253');
INSERT INTO `sources` VALUES ('70', '402', '剧集-其他', '26');
INSERT INTO `sources` VALUES ('71', '423', '个人原创作品', '171');
INSERT INTO `sources` VALUES ('78', '407', '体育-教学', '72');
INSERT INTO `sources` VALUES ('73', '423', '晚会活动视频', '173');
INSERT INTO `sources` VALUES ('75', '411', '其他', '115');
INSERT INTO `sources` VALUES ('76', '405', '动漫-音乐', '54');
INSERT INTO `sources` VALUES ('77', '404', '纪录片-NHK', '45');

-- ----------------------------
-- Table structure for `staffmessages`
-- ----------------------------
DROP TABLE IF EXISTS `staffmessages`;
CREATE TABLE `staffmessages` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `sender` mediumint(8) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `msg` text,
  `subject` varchar(128) NOT NULL default '',
  `answeredby` mediumint(8) unsigned NOT NULL default '0',
  `answered` tinyint(1) NOT NULL default '0',
  `answer` text,
  `goto` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffmessages
-- ----------------------------

-- ----------------------------
-- Table structure for `standards`
-- ----------------------------
DROP TABLE IF EXISTS `standards`;
CREATE TABLE `standards` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of standards
-- ----------------------------
INSERT INTO `standards` VALUES ('1', '1080p', '0');
INSERT INTO `standards` VALUES ('2', '1080i', '0');
INSERT INTO `standards` VALUES ('3', '720p', '0');
INSERT INTO `standards` VALUES ('4', 'SD', '0');

-- ----------------------------
-- Table structure for `stylesheets`
-- ----------------------------
DROP TABLE IF EXISTS `stylesheets`;
CREATE TABLE `stylesheets` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `uri` varchar(255) NOT NULL default '',
  `name` varchar(64) NOT NULL default '',
  `addicode` text,
  `designer` varchar(50) NOT NULL default '',
  `comment` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stylesheets
-- ----------------------------
INSERT INTO `stylesheets` VALUES ('2', 'styles/BlueGene/', '蓝色基因', '', 'Zantetsu', 'HDBits clone');
INSERT INTO `stylesheets` VALUES ('3', 'styles/BlasphemyOrange/', '橙色', '', 'Zantetsu', 'Bit-HDTV clone');
INSERT INTO `stylesheets` VALUES ('4', 'styles/Classic/', '经典', '', 'Zantetsu', 'TBSource original mod');
INSERT INTO `stylesheets` VALUES ('6', 'styles/DarkPassion/', '黑色激情', '', 'Zantetsu', '');
INSERT INTO `stylesheets` VALUES ('7', 'styles/BambooGreen/', '竹绿', '', 'Xia Zuojie', 'Baidu Hi clone');
INSERT INTO `stylesheets` VALUES ('8', 'styles/NewYear/', '新年', '', '星星', '西农开源社区');
INSERT INTO `stylesheets` VALUES ('9', 'styles/Wheat/', '麦子', null, 'Cide', 'wheat');
INSERT INTO `stylesheets` VALUES ('10', 'styles/Harvest/', 'Harvest', null, 'EI_Nino', 'Harvest Season');
INSERT INTO `stylesheets` VALUES ('11', 'styles/Flower/', 'Flower', null, 'EI_Nino', 'Flower');
INSERT INTO `stylesheets` VALUES ('12', 'styles/MJ/', 'MJ', '', 'EI_Nino', 'Anniversary MJ');

-- ----------------------------
-- Table structure for `subs`
-- ----------------------------
DROP TABLE IF EXISTS `subs`;
CREATE TABLE `subs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `torrent_id` mediumint(8) unsigned NOT NULL,
  `lang_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL default '',
  `filename` varchar(255) NOT NULL default '',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `size` bigint(20) unsigned NOT NULL default '0',
  `uppedby` mediumint(8) unsigned NOT NULL default '0',
  `anonymous` enum('yes','no') NOT NULL default 'no',
  `hits` mediumint(8) unsigned NOT NULL default '0',
  `ext` varchar(10) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `torrentid_langid` (`torrent_id`,`lang_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subs
-- ----------------------------

-- ----------------------------
-- Table structure for `suggest`
-- ----------------------------
DROP TABLE IF EXISTS `suggest`;
CREATE TABLE `suggest` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `keywords` varchar(255) NOT NULL default '',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `adddate` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `keywords` (`keywords`(4)),
  KEY `adddate` (`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suggest
-- ----------------------------

-- ----------------------------
-- Table structure for `sysoppanel`
-- ----------------------------
DROP TABLE IF EXISTS `sysoppanel`;
CREATE TABLE `sysoppanel` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(128) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `info` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysoppanel
-- ----------------------------
INSERT INTO `sysoppanel` VALUES ('1', '删除被禁止用户', 'deletedisabled.php', '删除所有被禁止用户');
INSERT INTO `sysoppanel` VALUES ('2', '论坛管理', 'forummanage.php', '编辑/删除论坛版块');
INSERT INTO `sysoppanel` VALUES ('3', '数据库状态', 'mysql_stats.php', '查看 MySql 状态');
INSERT INTO `sysoppanel` VALUES ('4', '全站发邮件', 'massmail.php', '给全站用户发送邮件');
INSERT INTO `sysoppanel` VALUES ('5', '重置tracker状态', 'docleanup.php', '清理tracker状态');
INSERT INTO `sysoppanel` VALUES ('6', '禁止IP管理', 'bans.php', '设定禁止IP访问');
INSERT INTO `sysoppanel` VALUES ('7', '失败登录记录', 'maxlogin.php', '查看密码错误尝试记录');
INSERT INTO `sysoppanel` VALUES ('8', '用户头像管理', 'bitbucketlog.php', '管理用户上传头像');
INSERT INTO `sysoppanel` VALUES ('9', '禁止注册邮件域', 'bannedemails.php', '限制指定后缀的邮箱不可以注册');
INSERT INTO `sysoppanel` VALUES ('10', '设定允许邮件域', 'allowedemails.php', '允许注册的邮件域范围');
INSERT INTO `sysoppanel` VALUES ('11', 'IP范围限速', 'location.php', '管理指定IP段的下载上传速度');
INSERT INTO `sysoppanel` VALUES ('12', '增加上传量', 'amountupload.php', '给指定用户组增加上传量');
INSERT INTO `sysoppanel` VALUES ('13', '查看服务器状态', 'sysinfo/index.php', '查看web服务器当前的状态信息，如硬盘内存等。');
INSERT INTO `sysoppanel` VALUES ('14', '查看Memcached状态', 'sysinfo/mem.php', '查看Memcached状态');
INSERT INTO `sysoppanel` VALUES ('15', '删除无用的附件文件', 'delattachments.php', '将无用的附件图片等文件删除，清理服务器磁盘空间，会浪费一定执行时间，请定期而不要频繁清理');

-- ----------------------------
-- Table structure for `teams`
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teams
-- ----------------------------
INSERT INTO `teams` VALUES ('1', 'HDS', '0');
INSERT INTO `teams` VALUES ('2', 'CHD', '0');
INSERT INTO `teams` VALUES ('3', 'MySiLU', '0');
INSERT INTO `teams` VALUES ('4', 'WiKi', '0');
INSERT INTO `teams` VALUES ('5', 'Other', '0');

-- ----------------------------
-- Table structure for `thanks`
-- ----------------------------
DROP TABLE IF EXISTS `thanks`;
CREATE TABLE `thanks` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `torrentid` mediumint(8) unsigned NOT NULL default '0',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `bonus` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `torrentid_id` (`torrentid`,`id`),
  KEY `torrentid_userid` (`torrentid`,`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thanks
-- ----------------------------

-- ----------------------------
-- Table structure for `topics`
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `subject` varchar(128) NOT NULL,
  `locked` enum('yes','no') NOT NULL default 'no',
  `forumid` smallint(5) unsigned NOT NULL default '0',
  `firstpost` int(10) unsigned NOT NULL default '0',
  `lastpost` int(10) unsigned NOT NULL default '0',
  `sticky` enum('no','yes') NOT NULL default 'no',
  `hlcolor` tinyint(3) unsigned NOT NULL default '0',
  `views` int(10) unsigned NOT NULL default '0',
  `onlyauthor` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`),
  KEY `subject` (`subject`),
  KEY `forumid_lastpost` (`forumid`,`lastpost`),
  KEY `forumid_sticky_lastpost` (`forumid`,`sticky`,`lastpost`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topics
-- ----------------------------

-- ----------------------------
-- Table structure for `torrents`
-- ----------------------------
DROP TABLE IF EXISTS `torrents`;
CREATE TABLE `torrents` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `info_hash` binary(20) NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `filename` varchar(255) NOT NULL default '',
  `save_as` varchar(255) NOT NULL default '',
  `descr` mediumtext,
  `small_descr` varchar(255) NOT NULL default '',
  `ori_descr` mediumtext,
  `category` smallint(5) unsigned NOT NULL default '0',
  `source` tinyint(3) unsigned NOT NULL default '0',
  `medium` tinyint(3) unsigned NOT NULL default '0',
  `codec` tinyint(3) unsigned NOT NULL default '0',
  `standard` tinyint(3) unsigned NOT NULL default '0',
  `processing` tinyint(3) unsigned NOT NULL default '0',
  `team` tinyint(3) unsigned NOT NULL default '0',
  `audiocodec` tinyint(3) unsigned NOT NULL default '0',
  `size` bigint(20) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `type` enum('single','multi') NOT NULL default 'single',
  `numfiles` smallint(5) unsigned NOT NULL default '0',
  `comments` mediumint(8) unsigned NOT NULL default '0',
  `views` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `times_completed` mediumint(8) unsigned NOT NULL default '0',
  `leechers` mediumint(8) NOT NULL default '0',
  `seeders` mediumint(8) NOT NULL default '0',
  `last_action` datetime NOT NULL default '0000-00-00 00:00:00',
  `visible` enum('yes','no') NOT NULL default 'yes',
  `banned` enum('yes','no') NOT NULL default 'no',
  `owner` mediumint(8) unsigned NOT NULL default '0',
  `nfo` blob,
  `sp_state` tinyint(3) unsigned NOT NULL default '1',
  `promotion_time_type` tinyint(3) unsigned NOT NULL default '0',
  `promotion_until` datetime NOT NULL default '0000-00-00 00:00:00',
  `anonymous` enum('yes','no') NOT NULL default 'no',
  `url` int(10) unsigned default NULL,
  `dburl` int(10) unsigned NOT NULL,
  `pos_state` enum('normal','sticky') NOT NULL default 'normal',
  `cache_stamp` tinyint(3) unsigned NOT NULL default '0',
  `picktype` enum('hot','classic','recommended','normal') NOT NULL default 'normal',
  `picktime` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_reseed` datetime NOT NULL default '0000-00-00 00:00:00',
  `endfree` datetime NOT NULL,
  `endsticky` datetime NOT NULL,
  `status` enum('normal','recycle','candidate') NOT NULL default 'normal',
  `last_status` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `info_hash` (`info_hash`),
  KEY `owner` (`owner`),
  KEY `visible_pos_id` (`visible`,`pos_state`,`id`),
  KEY `url` (`url`),
  KEY `category_visible_banned` (`category`,`visible`,`banned`),
  KEY `visible_banned_pos_id` (`visible`,`banned`,`pos_state`,`id`),
  KEY `endfree` (`endfree`),
  KEY `endsticky` (`endsticky`),
  KEY `pos_state` (`pos_state`),
  KEY `sp_state` (`sp_state`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `descr` (`descr`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of torrents
-- ----------------------------

-- ----------------------------
-- Table structure for `torrents_state`
-- ----------------------------
DROP TABLE IF EXISTS `torrents_state`;
CREATE TABLE `torrents_state` (
  `global_sp_state` tinyint(3) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of torrents_state
-- ----------------------------
INSERT INTO `torrents_state` VALUES ('1');
-- ----------------------------
-- Table structure for `uploadspeed`
-- ----------------------------
DROP TABLE IF EXISTS `uploadspeed`;
CREATE TABLE `uploadspeed` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploadspeed
-- ----------------------------
INSERT INTO `uploadspeed` (`id`, `name`) VALUES
(4, '512kbps'),
(5, '768kbps'),
(6, '1Mbps'),
(7, '1.5Mbps'),
(8, '2Mbps'),
(9, '3Mbps'),
(10, '4Mbps'),
(12, '6Mbps'),
(14, '8Mbps'),
(16, '10Mbps'),
(17, '48Mbps'),
(18, '100Mbit');
-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(40) NOT NULL default '',
  `passhash` varchar(32) NOT NULL default '',
  `secret` varbinary(20) NOT NULL,
  `email` varchar(80) NOT NULL default '',
  `status` enum('pending','confirmed') NOT NULL default 'pending',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_login` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_access` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_home` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_offer` datetime NOT NULL default '0000-00-00 00:00:00',
  `forum_access` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_staffmsg` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_pm` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_comment` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_post` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_browse` int(10) unsigned NOT NULL default '0',
  `last_music` int(10) unsigned NOT NULL default '0',
  `last_catchup` int(10) unsigned NOT NULL default '0',
  `editsecret` varbinary(20) NOT NULL,
  `privacy` enum('strong','normal','low') NOT NULL default 'normal',
  `stylesheet` tinyint(3) unsigned NOT NULL default '1',
  `caticon` tinyint(3) unsigned NOT NULL default '1',
  `fontsize` enum('small','medium','large') NOT NULL default 'medium',
  `info` text,
  `acceptpms` enum('yes','friends','no') NOT NULL default 'yes',
  `commentpm` enum('yes','no') NOT NULL default 'yes',
  `ip` varbinary(64) NOT NULL default '',
  `class` tinyint(3) unsigned NOT NULL default '1',
  `max_class_once` tinyint(3) NOT NULL default '1',
  `avatar` varchar(255) NOT NULL default '',
  `uploaded` bigint(20) unsigned NOT NULL default '0',
  `downloaded` bigint(20) unsigned NOT NULL default '0',
  `seedtime` bigint(20) unsigned NOT NULL default '0',
  `leechtime` bigint(20) unsigned NOT NULL default '0',
  `title` varchar(30) NOT NULL default '',
  `country` smallint(5) unsigned NOT NULL default '107',
  `notifs` varchar(500) default '[incldead=0]',
  `modcomment` text,
  `enabled` enum('yes','no') NOT NULL default 'yes',
  `avatars` enum('yes','no') NOT NULL default 'yes',
  `donor` enum('yes','no') NOT NULL default 'no',
  `donated` decimal(8,2) NOT NULL default '0.00',
  `donated_cny` decimal(8,2) NOT NULL default '0.00',
  `donoruntil` datetime NOT NULL default '0000-00-00 00:00:00',
  `warned` enum('yes','no') NOT NULL default 'no',
  `warneduntil` datetime NOT NULL default '0000-00-00 00:00:00',
  `noad` enum('yes','no') NOT NULL default 'no',
  `noaduntil` datetime NOT NULL default '0000-00-00 00:00:00',
  `torrentsperpage` tinyint(3) unsigned NOT NULL default '0',
  `topicsperpage` tinyint(3) unsigned NOT NULL default '0',
  `postsperpage` tinyint(3) unsigned NOT NULL default '0',
  `clicktopic` enum('firstpage','lastpage') NOT NULL default 'firstpage',
  `deletepms` enum('yes','no') NOT NULL default 'yes',
  `savepms` enum('yes','no') NOT NULL default 'no',
  `showhot` enum('yes','no') NOT NULL default 'yes',
  `showclassic` enum('yes','no') NOT NULL default 'yes',
  `support` enum('yes','no') NOT NULL default 'no',
  `picker` enum('yes','no') NOT NULL default 'no',
  `stafffor` varchar(255) NOT NULL,
  `supportfor` varchar(255) NOT NULL,
  `pickfor` varchar(255) NOT NULL,
  `supportlang` varchar(50) NOT NULL,
  `passkey` varchar(32) NOT NULL default '',
  `promotion_link` varchar(32) default NULL,
  `uploadpos` enum('yes','no') NOT NULL default 'yes',
  `forumpost` enum('yes','no') NOT NULL default 'yes',
  `downloadpos` enum('yes','no') NOT NULL default 'yes',
  `clientselect` tinyint(3) unsigned NOT NULL default '0',
  `signatures` enum('yes','no') NOT NULL default 'yes',
  `signature` varchar(800) NOT NULL default '',
  `lang` smallint(5) unsigned NOT NULL default '6',
  `cheat` smallint(6) NOT NULL default '0',
  `download` int(10) unsigned NOT NULL default '0',
  `upload` int(10) unsigned NOT NULL default '0',
  `isp` tinyint(3) unsigned NOT NULL default '0',
  `invites` smallint(3) unsigned NOT NULL default '0',
  `invited_by` mediumint(8) unsigned NOT NULL default '0',
  `gender` enum('Male','Female','N/A') NOT NULL default 'N/A',
  `vip_added` enum('yes','no') NOT NULL default 'no',
  `vip_until` datetime NOT NULL default '0000-00-00 00:00:00',
  `seedbonus` decimal(20,8) NOT NULL default '0.00000000',
  `charity` decimal(10,1) NOT NULL default '0.0',
  `bonuscomment` text,
  `parked` enum('yes','no') NOT NULL default 'no',
  `leechwarn` enum('yes','no') NOT NULL default 'no',
  `leechwarnuntil` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastwarned` datetime NOT NULL default '0000-00-00 00:00:00',
  `timeswarned` tinyint(3) unsigned NOT NULL default '0',
  `warnedby` mediumint(8) unsigned NOT NULL default '0',
  `sbnum` smallint(5) unsigned NOT NULL default '70',
  `sbrefresh` smallint(5) unsigned NOT NULL default '120',
  `hidehb` enum('yes','no') default 'no',
  `showimdb` enum('yes','no') default 'yes',
  `showdescription` enum('yes','no') default 'yes',
  `showcomment` enum('yes','no') default 'yes',
  `showclienterror` enum('yes','no') NOT NULL default 'no',
  `showdlnotice` tinyint(1) NOT NULL default '1',
  `tooltip` enum('minorimdb','medianimdb','off') NOT NULL default 'off',
  `shownfo` enum('yes','no') default 'yes',
  `timetype` enum('timeadded','timealive') default 'timealive',
  `appendsticky` enum('yes','no') default 'yes',
  `appendnew` enum('yes','no') default 'yes',
  `appendpromotion` enum('highlight','word','icon','off') default 'icon',
  `appendpicked` enum('yes','no') default 'yes',
  `dlicon` enum('yes','no') default 'yes',
  `bmicon` enum('yes','no') default 'yes',
  `showsmalldescr` enum('yes','no') NOT NULL default 'yes',
  `showcomnum` enum('yes','no') default 'yes',
  `showlastcom` enum('yes','no') default 'no',
  `showlastpost` enum('yes','no') NOT NULL default 'no',
  `pmnum` tinyint(3) unsigned NOT NULL default '10',
  `school` smallint(5) unsigned NOT NULL default '35',
  `showfb` enum('yes','no') NOT NULL default 'yes',
  `cardnum` varchar(14) NOT NULL,
  `salarynum` int(11) NOT NULL,
  `salary` date NOT NULL,
  `stealtime` time default NULL,
  `stealstatus` smallint(11) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `status_added` (`status`,`added`),
  KEY `ip` (`ip`),
  KEY `uploaded` (`uploaded`),
  KEY `downloaded` (`downloaded`),
  KEY `country` (`country`),
  KEY `last_access` (`last_access`),
  KEY `enabled` (`enabled`),
  KEY `warned` (`warned`),
  KEY `cheat` (`cheat`),
  KEY `class` (`class`),
  KEY `passkey` (`passkey`(8))
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'afb5d12b8e2c442d63c3d4e8deeae97b', 0x697673776D7872667276786B766F7369766F6978, 'admin@admin.com', 'confirmed', '2013-10-03 15:26:47', '2013-10-04 00:41:16', '2013-10-04 01:09:49', '2013-10-04 01:05:39', '2013-06-02 22:51:01', '2013-10-03 19:29:24', '0000-00-00 00:00:00', '2013-09-05 21:29:36', '2013-09-09 13:45:05', '2013-09-09 13:27:58', '1380818684', '0', '3', '', 'normal', '7', '1', 'medium', '', 'yes', 'yes', 0x3137322E31372E3135362E313937, '16', '1', '', '0', '0', '0', '0', '', '8', '[cat401][cat402][cat403][cat404][cat405][cat406][cat407][cat408][cat409][cat410][cat411][cat414][cat423][incldead=0]', '2013-04-16 - Invite amount changed from 0 to  by .\n', 'yes', 'yes', 'no', '0.00', '0.00', '0000-00-00 00:00:00', 'no', '0000-00-00 00:00:00', 'no', '0000-00-00 00:00:00', '50', '0', '0', 'firstpage', 'yes', 'no', 'yes', 'yes', 'no', 'no', '', '', '', '', 'e8dea5f02fc1ca4db750ba963ed13b10', 'ba6e48750b4938d310d1dcdba3d2c234', 'yes', 'yes', 'yes', '17', 'yes', '', '25', '0', '18', '18', '20', '0', '0', 'Male', 'no', '0000-00-00 00:00:00', '1527000.24000000', '0.0', '2013-10-04 01:05:37---彩票第14 期中获得5 等奖，获得麦粒0\n2013-10-04 01:05:36---花费 100 个麦粒购买了彩票\n2013-10-04 01:05:22---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:26---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:25---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:25---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:24---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:23---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:22---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:21---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:21---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:20---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:19---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:18---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:17---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:16---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:15---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:14---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:13---花费 100 个麦粒购买了彩票\n2013-10-04 01:04:12---花费 100 个麦粒购买了彩票\n2013-10-04 01:03:44---花费 100 个麦粒购买了彩票\n2013-10-04 01:03:41---花费 100 个麦粒购买了彩票\n2013-10-04 01:03:37---花费 100 个麦粒购买了彩票\n2013-10-04 01:03:09---彩票第10 期中获得3 等奖，获得麦粒0\n2013-10-04 01:03:08---花费 100 个麦粒购买了彩票\n2013-10-04 01:03:06---花费 100 个麦粒购买了彩票\n2013-10-04 01:03:05---花费 100 个麦粒购买了彩票\n2013-10-04 01:02:38---花费 100 个麦粒购买了彩票\n2013-10-04 01:02:21---花费 100 个麦粒购买了彩票\n2013-10-04 01:01:12---花费 100 个麦粒购买了彩票\n2013-10-04 01:01:09---花费 100 个麦粒购买了彩票\n2013-10-04 00:58:56---花费 100 个麦粒购买了彩票\n2013-10-01 16:16:07---购买促销 ，花费麦粒40\n2013-10-01 16:15:35---购买促销 ，花费麦粒40\n2013-10-01 16:11:44---购买促销 ，花费麦粒20\n2013-10-01 16:11:35---购买促销 ，花费麦粒20\n2013-10-01 16:11:16---购买促销 ，花费麦粒20\n2013-10-01 16:10:39---购买促销 ，花费麦粒20\n2013-09-24 - 25.0 Points as gift to admin1.\n 2013-09-24 - 25.0 Points as gift to admin1.\n 2013-09-09 - 100.0 Points as gift to admin1.\n 2013-09-08 - 100.0 Points as gift to admin1.\n 2013-09-08 - 100.0 Points as gift to admin1.\n 2013-09-01 11:07:15---成功绑定锐捷账号，系统增加1000麦粒\n2013-06-09 17:07:52---花费 1400 个麦粒购买了 2 个保镖\n2013-06-09 17:07:45----2000；退出游戏之后重新加入，花费了2000个麦粒\n2013-06-09 17:07:35---花费 1400 个麦粒购买了 2 个保镖\n2013-06-02 + 9,500.0 Points (after tax) as a gift from admin1.\n 2013-05-23 12:46:36---在偷麦粒应用中花费 500 *2 个麦粒购贿赂系统\n2013-05-23 12:46:32---在偷麦粒应用中花费 500 *2 个麦粒购贿赂系统\n2013-05-23 12:46:29---在偷麦粒应用中花费 500 *2 个麦粒购贿赂系统\n2013-05-23 12:46:27---在偷麦粒应用中花费 500 *2 个麦粒购贿赂系统\n2013-05-23 12:46:25---在偷麦粒应用中花费 500 *2 个麦粒购贿赂系统\n2013-05-23 12:46:15---在偷麦粒应用中花费 500 *2 个麦粒购贿赂系统\n2013-05-22 10:54:18---在偷麦粒应用中花费 500 *2 个麦粒购贿赂系统\n2013-05-22 10:06:40---在偷麦粒应用中花费 500 *2 个麦粒购贿赂系统\n2013-05-22 09:46:15---被adminyahu偷走 500 个麦粒\n2013-05-22 09:45:13---从adminyahu偷到 400 个麦粒\n2013-05-22 09:21:41---从adminyahu偷到 30 个麦粒\n2013-05-22 09:19:28---偷adminyahu的麦粒反而搭进去 155 个\n2013-05-22 09:19:21---从adminyahu偷到 500 个麦粒\n2013-05-22 09:19:16---偷adminyahu的麦粒反而搭进去 45 个\n2013-05-22 09:07:51---从adminyahu偷到 395 个麦粒\n2013-05-22 09:07:50---从adminyahu偷到 100 个麦粒\n2013-05-22 09:07:50---从adminyahu偷到 255 个麦粒\n2013-05-22 09:07:49---从adminyahu偷到 145 个麦粒\n2013-05-22 09:07:48---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 09:07:48---从adminyahu偷到 190 个麦粒\n2013-05-22 09:07:47---从adminyahu偷到 500 个麦粒\n2013-05-22 09:07:26---从adminyahu偷到 245 个麦粒\n2013-05-22 09:07:25---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 09:07:25---偷adminyahu的麦粒反而搭进去 170 个\n2013-05-22 09:07:24---从adminyahu偷到 500 个麦粒\n2013-05-22 09:07:23---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 09:06:51---从adminyahu偷到 80 个麦粒\n2013-05-22 09:06:50---从adminyahu偷到 205 个麦粒\n2013-05-22 09:06:49---偷adminyahu的麦粒反而搭进去 150 个\n2013-05-22 09:06:49---从adminyahu偷到 360 个麦粒\n2013-05-22 09:06:48---偷adminyahu的麦粒反而搭进去 150 个\n2013-05-22 09:06:48---偷adminyahu的麦粒反而搭进去 45 个\n2013-05-22 09:06:47---从adminyahu偷到 115 个麦粒\n2013-05-22 09:06:33---偷adminyahu的麦粒反而搭进去 115 个\n2013-05-22 09:06:32---偷adminyahu的麦粒反而搭进去 150 个\n2013-05-22 09:06:30---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:41:46---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:21:15---从adminyahu偷到 500 个麦粒\n2013-05-22 08:21:14---从adminyahu偷到 370 个麦粒\n2013-05-22 08:21:14---偷adminyahu的麦粒反而搭进去 120 个\n2013-05-22 08:21:14---从adminyahu偷到 50 个麦粒\n2013-05-22 08:21:13---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:21:13---偷adminyahu的麦粒反而搭进去 230 个\n2013-05-22 08:21:12---偷adminyahu的麦粒反而搭进去 5 个\n2013-05-22 08:21:12---从adminyahu偷到 40 个麦粒\n2013-05-22 08:21:11---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:21:11---从adminyahu偷到 140 个麦粒\n2013-05-22 08:21:11---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:21:10---偷adminyahu的麦粒反而搭进去 90 个\n2013-05-22 08:21:10---从adminyahu偷到 105 个麦粒\n2013-05-22 08:21:09---偷adminyahu的麦粒反而搭进去 170 个\n2013-05-22 08:21:09---偷adminyahu的麦粒反而搭进去 185 个\n2013-05-22 08:21:08---从adminyahu偷到 135 个麦粒\n2013-05-22 08:21:08---从adminyahu偷到 500 个麦粒\n2013-05-22 08:21:07---从adminyahu偷到 500 个麦粒\n2013-05-22 08:21:07---从adminyahu偷到 400 个麦粒\n2013-05-22 08:21:06---偷adminyahu的麦粒反而搭进去 15 个\n2013-05-22 08:21:06---从adminyahu偷到 195 个麦粒\n2013-05-22 08:21:05---从adminyahu偷到 115 个麦粒\n2013-05-22 08:21:05---从adminyahu偷到 75 个麦粒\n2013-05-22 08:21:04---从adminyahu偷到 500 个麦粒\n2013-05-22 08:21:04---偷adminyahu的麦粒反而搭进去 30 个\n2013-05-22 08:21:03---从adminyahu偷到 85 个麦粒\n2013-05-22 08:21:03---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:21:03---从adminyahu偷到 250 个麦粒\n2013-05-22 08:21:02---从adminyahu偷到 145 个麦粒\n2013-05-22 08:21:02---从adminyahu偷到 500 个麦粒\n2013-05-22 08:21:01---偷adminyahu的麦粒反而搭进去 190 个\n2013-05-22 08:21:01---偷adminyahu的麦粒反而搭进去 200 个\n2013-05-22 08:21:00---偷adminyahu的麦粒反而搭进去 105 个\n2013-05-22 08:21:00---偷adminyahu的麦粒反而搭进去 230 个\n2013-05-22 08:20:59---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:20:59---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:58---偷adminyahu的麦粒反而搭进去 235 个\n2013-05-22 08:20:58---从adminyahu偷到 35 个麦粒\n2013-05-22 08:20:57---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:57---偷adminyahu的麦粒反而搭进去 130 个\n2013-05-22 08:20:56---偷adminyahu的麦粒反而搭进去 235 个\n2013-05-22 08:20:56---偷adminyahu的麦粒反而搭进去 5 个\n2013-05-22 08:20:55---从adminyahu偷到 170 个麦粒\n2013-05-22 08:20:55---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:20:54---从adminyahu偷到 395 个麦粒\n2013-05-22 08:20:54---偷adminyahu的麦粒反而搭进去 110 个\n2013-05-22 08:20:53---偷adminyahu的麦粒反而搭进去 110 个\n2013-05-22 08:20:53---从adminyahu偷到 85 个麦粒\n2013-05-22 08:20:52---从adminyahu偷到 335 个麦粒\n2013-05-22 08:20:52---从adminyahu偷到 205 个麦粒\n2013-05-22 08:20:51---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:20:51---从adminyahu偷到 105 个麦粒\n2013-05-22 08:20:50---偷adminyahu的麦粒反而搭进去 20 个\n2013-05-22 08:20:50---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:49---偷adminyahu的麦粒反而搭进去 35 个\n2013-05-22 08:20:49---从adminyahu偷到 315 个麦粒\n2013-05-22 08:20:48---偷adminyahu的麦粒反而搭进去 190 个\n2013-05-22 08:20:48---从adminyahu偷到 165 个麦粒\n2013-05-22 08:20:47---偷adminyahu的麦粒反而搭进去 60 个\n2013-05-22 08:20:47---从adminyahu偷到 225 个麦粒\n2013-05-22 08:20:46---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:46---从adminyahu偷到 340 个麦粒\n2013-05-22 08:20:45---偷adminyahu的麦粒反而搭进去 140 个\n2013-05-22 08:20:45---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:20:44---从adminyahu偷到 135 个麦粒\n2013-05-22 08:20:44---偷adminyahu的麦粒反而搭进去 115 个\n2013-05-22 08:20:43---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:43---从adminyahu偷到 310 个麦粒\n2013-05-22 08:20:42---偷adminyahu的麦粒反而搭进去 110 个\n2013-05-22 08:20:42---从adminyahu偷到 50 个麦粒\n2013-05-22 08:20:41---从adminyahu偷到 240 个麦粒\n2013-05-22 08:20:41---偷adminyahu的麦粒反而搭进去 175 个\n2013-05-22 08:20:40---偷adminyahu的麦粒反而搭进去 90 个\n2013-05-22 08:20:39---从adminyahu偷到 240 个麦粒\n2013-05-22 08:20:39---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:37---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:20:37---偷adminyahu的麦粒反而搭进去 105 个\n2013-05-22 08:20:37---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:20:37---偷adminyahu的麦粒反而搭进去 200 个\n2013-05-22 08:20:36---从adminyahu偷到 280 个麦粒\n2013-05-22 08:20:36---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:20:35---从adminyahu偷到 170 个麦粒\n2013-05-22 08:20:35---从adminyahu偷到 380 个麦粒\n2013-05-22 08:20:35---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:34---从adminyahu偷到 120 个麦粒\n2013-05-22 08:20:33---从adminyahu偷到 400 个麦粒\n2013-05-22 08:20:33---偷adminyahu的麦粒反而搭进去 95 个\n2013-05-22 08:20:33---偷adminyahu的麦粒反而搭进去 135 个\n2013-05-22 08:20:32---从adminyahu偷到 145 个麦粒\n2013-05-22 08:20:32---从adminyahu偷到 10 个麦粒\n2013-05-22 08:20:31---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:31---从adminyahu偷到 50 个麦粒\n2013-05-22 08:20:30---从adminyahu偷到 15 个麦粒\n2013-05-22 08:20:30---偷adminyahu的麦粒反而搭进去 100 个\n2013-05-22 08:20:29---从adminyahu偷到 5 个麦粒\n2013-05-22 08:20:29---偷adminyahu的麦粒反而搭进去 225 个\n2013-05-22 08:20:28---偷adminyahu的麦粒反而搭进去 215 个\n2013-05-22 08:20:28---从adminyahu偷到 135 个麦粒\n2013-05-22 08:20:27---偷adminyahu的麦粒反而搭进去 215 个\n2013-05-22 08:20:26---偷adminyahu的麦粒反而搭进去 240 个\n2013-05-22 08:20:22---偷adminyahu的麦粒反而搭进去 95 个\n2013-05-22 08:20:21---偷adminyahu的麦粒反而搭进去 195 个\n2013-05-22 08:20:19---偷adminyahu的麦粒反而搭进去 145 个\n2013-05-22 08:20:19---从adminyahu偷到 180 个麦粒\n2013-05-22 08:20:18---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:17---偷adminyahu的麦粒反而搭进去 215 个\n2013-05-22 08:20:17---从adminyahu偷到 50 个麦粒\n2013-05-22 08:20:16---从adminyahu偷到 110 个麦粒\n2013-05-22 08:20:16---偷adminyahu的麦粒反而搭进去 65 个\n2013-05-22 08:20:15---从adminyahu偷到 210 个麦粒\n2013-05-22 08:20:15---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:20:14---从adminyahu偷到 260 个麦粒\n2013-05-22 08:20:14---从adminyahu偷到 60 个麦粒\n2013-05-22 08:20:13---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:20:13---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:20:12---从adminyahu偷到 355 个麦粒\n2013-05-22 08:20:12---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:11---从adminyahu偷到 150 个麦粒\n2013-05-22 08:20:10---偷adminyahu的麦粒反而搭进去 25 个\n2013-05-22 08:20:10---偷adminyahu的麦粒反而搭进去 115 个\n2013-05-22 08:20:09---偷adminyahu的麦粒反而搭进去 140 个\n2013-05-22 08:20:09---偷adminyahu的麦粒反而搭进去 30 个\n2013-05-22 08:20:08---从adminyahu偷到 235 个麦粒\n2013-05-22 08:20:07---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:20:07---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:06---从adminyahu偷到 290 个麦粒\n2013-05-22 08:20:06---从adminyahu偷到 220 个麦粒\n2013-05-22 08:20:05---偷adminyahu的麦粒反而搭进去 190 个\n2013-05-22 08:20:04---偷adminyahu的麦粒反而搭进去 230 个\n2013-05-22 08:20:03---从adminyahu偷到 500 个麦粒\n2013-05-22 08:20:02---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:19:53---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:18:33---偷adminyahu的麦粒反而搭进去 215 个\n2013-05-22 08:18:26---从adminyahu偷到 500 个麦粒\n2013-05-22 08:18:17---从adminyahu偷到 500 个麦粒\n2013-05-22 08:17:42---从adminyahu偷到 340 个麦粒\n2013-05-22 08:17:17---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:15:31---从adminyahu偷到 500 个麦粒\n2013-05-22 08:15:30---从adminyahu偷到 500 个麦粒\n2013-05-22 08:15:30---从adminyahu偷到 170 个麦粒\n2013-05-22 08:15:30---偷adminyahu的麦粒反而搭进去 45 个\n2013-05-22 08:15:29---从adminyahu偷到 215 个麦粒\n2013-05-22 08:15:29---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:15:28---从adminyahu偷到 160 个麦粒\n2013-05-22 08:15:28---偷adminyahu的麦粒反而搭进去 205 个\n2013-05-22 08:15:27---偷adminyahu的麦粒反而搭进去 210 个\n2013-05-22 08:15:27---偷adminyahu的麦粒反而搭进去 180 个\n2013-05-22 08:15:26---从adminyahu偷到 95 个麦粒\n2013-05-22 08:15:26---偷adminyahu的麦粒反而搭进去 245 个\n2013-05-22 08:15:25---偷adminyahu的麦粒反而搭进去 150 个\n2013-05-22 08:15:25---从adminyahu偷到 260 个麦粒\n2013-05-22 08:15:24---从adminyahu偷到 265 个麦粒\n2013-05-22 08:15:24---从adminyahu偷到 500 个麦粒\n2013-05-22 08:15:23---从adminyahu偷到 105 个麦粒\n2013-05-22 08:15:21---偷adminyahu的麦粒反而搭进去 110 个\n2013-05-22 08:15:04---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 08:14:39---从adminyahu偷到 310 个麦粒\n2013-05-22 08:14:05---从adminyahu偷到 210 个麦粒\n2013-05-22 08:13:59---从adminyahu偷到 230 个麦粒\n2013-05-22 08:13:18---从adminyahu偷到 500 个麦粒\n2013-05-22 08:13:12---从adminyahu偷到 135 个麦粒\n2013-05-22 08:12:53---偷adminyahu的麦粒反而搭进去 125 个\n2013-05-22 08:12:52---从adminyahu偷到 100 个麦粒\n2013-05-22 08:12:50---偷adminyahu的麦粒反而搭进去 105 个\n2013-05-22 08:12:49---从adminyahu偷到 100 个麦粒\n2013-05-22 08:12:44---偷adminyahu的麦粒反而搭进去 75 个\n2013-05-22 08:12:15---偷adminyahu的麦粒反而搭进去 500 个\n2013-05-22 07:28:56---adminyahu来偷麦粒，反而留下 500 个\n2013-05-22 07:28:55---adminyahu来偷麦粒，反而留下 500 个\n2013-05-22 07:28:54---被adminyahu偷走 105 个麦粒\n2013-05-22 07:28:52---被adminyahu偷走 380 个麦粒\n2013-05-22 07:24:13---adminyahu来偷麦粒，反而留下 250 个\n2013-05-22 07:21:41---被adminyahu偷走 230 个麦粒\n2013-05-22 07:21:36---adminyahu来偷麦粒，反而留下 500 个\n2013-05-22 07:21:33---adminyahu来偷麦粒，反而留下 500 个\n2013-05-22 07:21:26---被adminyahu偷走 100 个麦粒\n2013-05-22 07:21:25---adminyahu来偷麦粒，反而留下 10 个\n2013-05-22 07:21:24---被adminyahu偷走 500 个麦粒\n2013-05-22 07:21:23---被adminyahu偷走 290 个麦粒\n2013-05-22 07:21:22---adminyahu来偷麦粒，反而留下 500 个\n2013-05-22 07:21:20---被adminyahu偷走 400 个麦粒\n2013-05-22 07:18:20---adminyahu来偷麦粒，反而留下 100 个\n2013-05-22 07:18:02---adminyahu来偷麦粒，反而留下 500 个\n2013-05-22 07:17:59---adminyahu来偷麦粒，反而留下 500 个\n2013-05-22 07:13:58---被adminyahu偷走 150 个麦粒\n2013-05-22 07:08:24---被adminyahu偷走 305 个麦粒\n2013-05-22 07:08:23---被adminyahu偷走 290 个麦粒\n2013-05-22 07:08:21---adminyahu来偷麦粒，反而留下 500 个\n2013-05-22 07:08:18---adminyahu来偷麦粒，反而留下 90 个\n2013-05-22 07:08:05---adminyahu来偷麦粒，反而留下 500 个\n2013-05-21 17:15:59---被adminyahu偷走 630 个麦粒\n2013-05-21 17:15:58---被adminyahu偷走 460 个麦粒\n2013-05-21 17:15:57---被adminyahu偷走 580 个麦粒\n2013-05-21 17:15:57---被adminyahu偷走 1000 个麦粒\n2013-05-21 17:15:56---adminyahu来偷麦粒，反而留下 690 个\n2013-05-21 17:15:55---被adminyahu偷走 410 个麦粒\n2013-05-21 17:15:54---adminyahu来偷麦粒，反而留下 1000 个\n2013-05-21 17:15:53---adminyahu来偷麦粒，反而留下 490 个\n2013-05-21 17:15:52---adminyahu来偷麦粒，反而留下 1000 个\n2013-05-21 17:15:51---被adminyahu偷走 310 个麦粒\n2013-05-21 17:15:50---adminyahu来偷麦粒，反而留下 1000 个\n2013-05-21 17:15:49---adminyahu来偷麦粒，反而留下 90 个\n2013-05-21 17:15:48---adminyahu来偷麦粒，反而留下 310 个\n2013-05-21 17:15:47---adminyahu来偷麦粒，反而留下 1000 个\n2013-05-21 17:15:45---adminyahu来偷麦粒，反而留下 1000 个\n2013-05-21 17:15:44---被adminyahu偷走 800 个麦粒\n2013-05-21 17:15:44---被adminyahu偷走 280 个麦粒\n2013-05-21 17:15:43---adminyahu来偷麦粒，反而留下 1000 个\n2013-05-21 17:15:42---被adminyahu偷走 500 个麦粒\n2013-05-21 17:15:41---被adminyahu偷走 1000 个麦粒\n2013-05-21 17:15:40---被adminyahu偷走 1000 个麦粒\n2013-05-21 17:14:58---adminyahu来偷麦粒，反而留下 380 个\n2013-05-21 17:14:57---被adminyahu偷走 700 个麦粒\n2013-05-21 17:14:55---被adminyahu偷走 1000 个麦粒\n2013-05-21 17:14:54---被adminyahu偷走 310 个麦粒\n2013-05-21 17:14:52---adminyahu来偷麦粒，反而留下 1000 个\n2013-05-21 17:14:51---被adminyahu偷走 440 个麦粒\n2013-05-21 17:14:20---被adminyahu偷走 580 个麦粒\n2013-05-21 17:13:37---被adminyahu偷走 400 个麦粒\n2013-05-21 + 9,500.0 Points (after tax) as a gift from adminyahu.\n 2013-05-21 16:54:48---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:44:28---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:44:19---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 + 9,500.0 Points (after tax) as a gift from adminyahu.\n 2013-05-21 16:35:06---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:34:57---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:34:53---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:32:27---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:32:22---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:29:00---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:28:16---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:27:23---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:23:15---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:23:11---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:23:04---偷adminyahu的麦粒被保镖抓了，损失1000个麦粒干掉他一个保镖\n2013-05-21 16:08:05---adminyahu来偷麦粒，反而留下 140 个\n2013-05-21 15:59:37---adminyahu来偷麦粒，反而留下 1000 个\n2013-05-21 15:55:50---被adminyahu偷走 720 个麦粒\n2013-05-21 12:58:14---被adminyahu偷走 300 个麦粒\n2013-05-21 12:57:48---被adminyahu偷走 500 个麦粒\n2013-05-21 12:57:41---被adminyahu偷走 800 个麦粒\n2013-05-21 12:57:30---adminyahu来偷麦粒，反而留下 1000 个\n2013-05-21 12:57:05---adminyahu来偷麦粒，反而留下 500 个\n2013-05-21 12:56:41---adminyahu来偷麦粒，反而留下 1000 个\n2013-05-21 12:56:30---被adminyahu偷走 500 个麦粒\n2013-05-21 12:56:15---被adminyahu偷走 300 个麦粒\n2013-05-21 12:55:59---adminyahu来偷麦粒，反而留下 1000 个\n2013-05-21 12:55:03---被adminyahu偷走 100 个麦粒\n2013-05-21 12:54:36---被adminyahu偷走 200 个麦粒\n2013-05-21 12:52:24---adminyahu来偷麦粒，反而留下 500 个\n2013-05-21 12:52:00---adminyahu来偷麦粒，反而留下 400 个\n2013-05-21 + 9,500.0 Points (after tax) as a gift from adminyahu.\n 2013-05-08 - 1,111.0 Points as gift to admin1.\n 2013-05-08 - 1,111.0 Points as gift to admin1.\n 2013-05-08 - 1,111.0 Points as gift to admin1.\n 2013-05-07 - 30.0 Points as gift to admin1.\n 2013-05-07 + 28.5 Points (after tax) as a gift from admin1.\n 2013-05-07 + 285.0 Points (after tax) as a gift from admin1.\n 2013-05-07 + 105.5 Points (after tax) as a gift from admin1.\n 2013-05-07 + 28.5 Points (after tax) as a gift from admin1.\n 2013-05-07 - 300.0 Points as gift to admin1.\n 2013-05-07 - 30.0 Points as gift to admin1.\n 2013-05-07 - 100.0 Points as gift to admin1.\n 2013-05-07 - 30.0 Points as gift to admin1.\n 2013-05-07 - 30.0 Points as gift to admin1.\n 2013-05-07 - 30.0 Points as gift to admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from adminyahu.\n 2013-05-07 + 105.5 Points (after tax) as a gift from adminyahu.\n 2013-05-07 + 73.2 Points (after tax) as a gift from admin1.\n 2013-05-07 + 52.3 Points (after tax) as a gift from admin1.\n 2013-05-07 + 52.3 Points (after tax) as a gift from admin1.\n 2013-05-07 + 52.3 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 41.8 Points (after tax) as a gift from admin1.\n 2013-05-07 + 31.4 Points (after tax) as a gift from admin1.\n 2013-05-07 + 31.4 Points (after tax) as a gift from admin1.\n 2013-05-07 + 83.6 Points (after tax) as a gift from admin1.\n 2013-05-07 + 83.6 Points (after tax) as a gift from admin1.\n 2013-05-07 + 83.6 Points (after tax) as a gift from admin1.\n 2013-05-07 - 1,000.0 Points as gift to admin2.\n 2013-05-07 - 1,000.0 Points as gift to admin1.\n 2013-05-07 - 123.0 Points as gift to admin1.\n 2013-05-07 - 123.0 Points as gift to admin1.\n 2013-05-07 - 123.0 Points as gift to admin1.\n 2013-05-07 - 33.0 Points as gift to admin1.\n 2013-05-07 - 33.0 Points as gift to admin1.\n 2013-05-07 - 111.0 Points as gift to admin1.\n 2013-05-07 - 111.0 Points as gift to admin1.\n 2013-05-07 - 111.0 Points as gift to admin1.\n 2013-05-07 - 881.0 Points as gift to admin1.\n 2013-05-07 - 88.0 Points as gift to admin1.\n 2013-05-07 - 88.0 Points as gift to admin1.\n 2013-05-07 - 88.0 Points as gift to admin1.\n 2013-05-07 - 88.0 Points as gift to admin1.\n 2013-05-07 - 88.0 Points as gift to admin1.\n 2013-05-07 - 88.0 Points as gift to admin1.\n 2013-05-07 - 88.0 Points as gift to admin1.\n 2013-05-07 - 88.0 Points as gift to admin1.\n 2013-05-07 - 88.0 Points as gift to admin1.\n 2013-05-07 - 222.0 Points as gift to admin1.\n 2013-05-07 - 222.0 Points as gift to admin1.\n 2013-05-07 - 222.0 Points as gift to admin1.\n 2013-05-06 + 95.0 Points (after tax) as a gift from admin1.\n 2013-05-06 - 44.0 Points as gift to admin1.\n 2013-05-06 - 44.0 Points as gift to admin1.\n 2013-05-06 - 44.0 Points as gift to admin1.\n 2013-05-06 - 100.0 Points as gift to admin1.\n 2013-05-06 - 100.0 Points as gift to admin1.\n 2013-05-06 - 100.0 Points as gift to admin1.\n 2013-05-06 - 44.0 Points as gift to admin1.\n 2013-05-06 + 62.7 Points (after tax) as a gift from admin1.\n 2013-05-06 - 33.0 Points as gift to admin1.\n 2013-05-06 - 88.0 Points as gift to admin1.\n 2013-05-06 - 33.0 Points as gift to admin1.\n 2013-05-06 - 33.0 Points as gift to admin1.\n 2013-05-06 - 33.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to adminyahu.\n 2013-05-06 - 1,000.0 Points as gift to admin2.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to adminyahu.\n 2013-05-06 - 1,000.0 Points as gift to admin2.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to adminyahu.\n 2013-05-06 - 1,000.0 Points as gift to admin2.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to adminyahu.\n 2013-05-06 - 1,000.0 Points as gift to admin2.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to adminyahu.\n 2013-05-06 - 1,000.0 Points as gift to admin2.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 100.0 Points as gift to admin2.\n 2013-05-06 - 100.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to admin2.\n 2013-05-06 - 1,000.0 Points as gift to admin2.\n 2013-05-06 - 200.0 Points as gift to admin1.\n 2013-05-06 - 200.0 Points as gift to admin1.\n 2013-05-06 - 200.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 100.0 Points as gift to admin1.\n 2013-05-06 - 50.0 Points as gift to admin1.\n 2013-05-06 - 50.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 - 1,000.0 Points as gift to admin1.\n 2013-05-06 12 Points added by admin.\n2013-05-06 - 1,000.0 Points as gift to \'admin\'.\n 2013-05-06 - 1,000.0 Points as gift to \'admin1\'.\n 2013-05-06 + 950.0 Points (after tax) as a gift from admin.\n 2013-05-06 - 111.0 Points as gift to admin.\n 2013-05-06 + 105.5 Points (after tax) as a gift from admin.\n 2013-05-06 - 111.0 Points as gift to admin.\n 2013-05-06 + 31.4 Points (after tax) as a gift from admin.\n 2013-05-05 + 95.0 Points (after tax) as a gift from admin.\n 2013-05-05 + 105.5 Points (after tax) as a gift from admin.\n 2013-05-05 + 115.9 Points (after tax) as a gift from admin.\n 2013-05-05 + 115.9 Points (after tax) as a gift from admin.\n 2013-05-05 + 2,966.9 Points (after tax) as a gift from admin.\n 2013-05-05 + 2,966.9 Points (after tax) as a gift from admin.\n 2013-05-05 + 116.9 Points (after tax) as a gift from admin.\n 2013-05-05 + 116.9 Points (after tax) as a gift from admin.\n 2013-05-05 + 116.9 Points (after tax) as a gift from admin.\n 2013-05-04 - 2,222.0 Points as gift to admin.\n 2013-05-04 + 116.9 Points (after tax) as a gift from admin.\n 2013-05-04 - 444.0 Points as gift to admin.\n 2013-05-04 + 527.3 Points (after tax) as a gift from admin.\n 2013-05-04 + 116.9 Points (after tax) as a gift from admin.\n 2013-05-04 + 9,500.0 Points (after tax) as a gift from admin.\n 2013-05-04 + 527.3 Points (after tax) as a gift from admin.\n 2013-05-04 - 123.0 Points as gift to admin.\n 2013-05-04 + 210.9 Points (after tax) as a gift from admin.\n 2013-05-04 - 222.0 Points as gift to admin.\n 2013-05-04 + 105.5 Points (after tax) as a gift from admin.\n 2013-05-04 - 111.0 Points as gift to admin.\n 2013-05-04 + 116.9 Points (after tax) as a gift from admin.\n 2013-05-04 + 950.0 Points (after tax) as a gift from admin.\n 2013-05-04 + 115.9 Points (after tax) as a gift from admin.\n 2013-05-04 - 123.0 Points as gift to admin.\n 2013-05-04 - 1,000.0 Points as gift to admin.\n 2013-05-04 + 950.0 Points (after tax) as a gift from admin.\n 4026', 'no', 'no', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '0', '70', '120', 'no', 'yes', 'yes', 'yes', 'no', '0', 'off', 'yes', 'timealive', 'yes', 'yes', 'icon', 'yes', 'yes', 'yes', 'yes', 'yes', 'no', 'no', '50', '0', 'yes', '2010011756', '5', '2013-10-03', '08:05:15', '0');
INSERT INTO `users` VALUES ('11', '机器人', '3076c489152c1715096e93bc82a70e4c', 0x666670776D706E716F76726B7871716971686870, 'email@email.com', 'confirmed', '2013-10-04 00:56:42', '0000-00-00 00:00:00', '2013-10-04 00:56:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '0', '0', '', 'normal', '7', '1', 'medium', null, 'yes', 'yes', '', '1', '1', '', '0', '0', '0', '0', '', '107', '[incldead=0]', null, 'yes', 'yes', 'no', '0.00', '0.00', '0000-00-00 00:00:00', 'no', '0000-00-00 00:00:00', 'no', '0000-00-00 00:00:00', '0', '0', '0', 'firstpage', 'yes', 'no', 'yes', 'yes', 'no', 'no', '', '', '', '', '', null, 'yes', 'yes', 'yes', '0', 'yes', '', '6', '0', '0', '0', '0', '0', '0', 'N/A', 'no', '0000-00-00 00:00:00', '0.00000000', '0.0', null, 'no', 'no', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '0', '70', '120', 'no', 'yes', 'yes', 'yes', 'no', '1', 'off', 'yes', 'timealive', 'yes', 'yes', 'icon', 'yes', 'yes', 'yes', 'yes', 'yes', 'no', 'no', '10', '35', 'yes', '', '0', '0000-00-00', null, '0');

-- ----------------------------
-- Table structure for `users_log`
-- ----------------------------
DROP TABLE IF EXISTS `users_log`;
CREATE TABLE `users_log` (
  `id` int(11) NOT NULL auto_increment,
  `op_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `op` varchar(20) NOT NULL,
  `detail` text NOT NULL,
  `op_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_log
-- ----------------------------
