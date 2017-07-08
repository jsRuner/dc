# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: dc
# Generation Time: 2017-07-07 15:45:58 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table dc_ad
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_ad`;

CREATE TABLE `dc_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table dc_asset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_asset`;

CREATE TABLE `dc_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';



# Dump of table dc_auth_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_auth_access`;

CREATE TABLE `dc_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';



# Dump of table dc_auth_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_auth_rule`;

CREATE TABLE `dc_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限规则表';

LOCK TABLES `dc_auth_rule` WRITE;
/*!40000 ALTER TABLE `dc_auth_rule` DISABLE KEYS */;

INSERT INTO `dc_auth_rule` (`id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition`)
VALUES
	(1,'Admin','admin_url','admin/content/default',NULL,'内容管理',1,''),
	(2,'Api','admin_url','api/guestbookadmin/index',NULL,'所有留言',1,''),
	(3,'Api','admin_url','api/guestbookadmin/delete',NULL,'删除网站留言',1,''),
	(4,'Comment','admin_url','comment/commentadmin/index',NULL,'评论管理',1,''),
	(5,'Comment','admin_url','comment/commentadmin/delete',NULL,'删除评论',1,''),
	(6,'Comment','admin_url','comment/commentadmin/check',NULL,'评论审核',1,''),
	(7,'Portal','admin_url','portal/adminpost/index',NULL,'文章管理',1,''),
	(8,'Portal','admin_url','portal/adminpost/listorders',NULL,'文章排序',1,''),
	(9,'Portal','admin_url','portal/adminpost/top',NULL,'文章置顶',1,''),
	(10,'Portal','admin_url','portal/adminpost/recommend',NULL,'文章推荐',1,''),
	(11,'Portal','admin_url','portal/adminpost/move',NULL,'批量移动',1,''),
	(12,'Portal','admin_url','portal/adminpost/check',NULL,'文章审核',1,''),
	(13,'Portal','admin_url','portal/adminpost/delete',NULL,'删除文章',1,''),
	(14,'Portal','admin_url','portal/adminpost/edit',NULL,'编辑文章',1,''),
	(15,'Portal','admin_url','portal/adminpost/edit_post',NULL,'提交编辑',1,''),
	(16,'Portal','admin_url','portal/adminpost/add',NULL,'添加文章',1,''),
	(17,'Portal','admin_url','portal/adminpost/add_post',NULL,'提交添加',1,''),
	(18,'Portal','admin_url','portal/adminterm/index',NULL,'分类管理',1,''),
	(19,'Portal','admin_url','portal/adminterm/listorders',NULL,'文章分类排序',1,''),
	(20,'Portal','admin_url','portal/adminterm/delete',NULL,'删除分类',1,''),
	(21,'Portal','admin_url','portal/adminterm/edit',NULL,'编辑分类',1,''),
	(22,'Portal','admin_url','portal/adminterm/edit_post',NULL,'提交编辑',1,''),
	(23,'Portal','admin_url','portal/adminterm/add',NULL,'添加分类',1,''),
	(24,'Portal','admin_url','portal/adminterm/add_post',NULL,'提交添加',1,''),
	(25,'Portal','admin_url','portal/adminpage/index',NULL,'页面管理',1,''),
	(26,'Portal','admin_url','portal/adminpage/listorders',NULL,'页面排序',1,''),
	(27,'Portal','admin_url','portal/adminpage/delete',NULL,'删除页面',1,''),
	(28,'Portal','admin_url','portal/adminpage/edit',NULL,'编辑页面',1,''),
	(29,'Portal','admin_url','portal/adminpage/edit_post',NULL,'提交编辑',1,''),
	(30,'Portal','admin_url','portal/adminpage/add',NULL,'添加页面',1,''),
	(31,'Portal','admin_url','portal/adminpage/add_post',NULL,'提交添加',1,''),
	(32,'Admin','admin_url','admin/recycle/default',NULL,'回收站',1,''),
	(33,'Portal','admin_url','portal/adminpost/recyclebin',NULL,'文章回收',1,''),
	(34,'Portal','admin_url','portal/adminpost/restore',NULL,'文章还原',1,''),
	(35,'Portal','admin_url','portal/adminpost/clean',NULL,'彻底删除',1,''),
	(36,'Portal','admin_url','portal/adminpage/recyclebin',NULL,'页面回收',1,''),
	(37,'Portal','admin_url','portal/adminpage/clean',NULL,'彻底删除',1,''),
	(38,'Portal','admin_url','portal/adminpage/restore',NULL,'页面还原',1,''),
	(39,'Admin','admin_url','admin/extension/default',NULL,'扩展工具',1,''),
	(40,'Admin','admin_url','admin/backup/default',NULL,'备份管理',1,''),
	(41,'Admin','admin_url','admin/backup/restore',NULL,'数据还原',1,''),
	(42,'Admin','admin_url','admin/backup/index',NULL,'数据备份',1,''),
	(43,'Admin','admin_url','admin/backup/index_post',NULL,'提交数据备份',1,''),
	(44,'Admin','admin_url','admin/backup/download',NULL,'下载备份',1,''),
	(45,'Admin','admin_url','admin/backup/del_backup',NULL,'删除备份',1,''),
	(46,'Admin','admin_url','admin/backup/import',NULL,'数据备份导入',1,''),
	(47,'Admin','admin_url','admin/plugin/index',NULL,'插件管理',1,''),
	(48,'Admin','admin_url','admin/plugin/toggle',NULL,'插件启用切换',1,''),
	(49,'Admin','admin_url','admin/plugin/setting',NULL,'插件设置',1,''),
	(50,'Admin','admin_url','admin/plugin/setting_post',NULL,'插件设置提交',1,''),
	(51,'Admin','admin_url','admin/plugin/install',NULL,'插件安装',1,''),
	(52,'Admin','admin_url','admin/plugin/uninstall',NULL,'插件卸载',1,''),
	(53,'Admin','admin_url','admin/slide/default',NULL,'幻灯片',1,''),
	(54,'Admin','admin_url','admin/slide/index',NULL,'幻灯片管理',1,''),
	(55,'Admin','admin_url','admin/slide/listorders',NULL,'幻灯片排序',1,''),
	(56,'Admin','admin_url','admin/slide/toggle',NULL,'幻灯片显示切换',1,''),
	(57,'Admin','admin_url','admin/slide/delete',NULL,'删除幻灯片',1,''),
	(58,'Admin','admin_url','admin/slide/edit',NULL,'编辑幻灯片',1,''),
	(59,'Admin','admin_url','admin/slide/edit_post',NULL,'提交编辑',1,''),
	(60,'Admin','admin_url','admin/slide/add',NULL,'添加幻灯片',1,''),
	(61,'Admin','admin_url','admin/slide/add_post',NULL,'提交添加',1,''),
	(62,'Admin','admin_url','admin/slidecat/index',NULL,'幻灯片分类',1,''),
	(63,'Admin','admin_url','admin/slidecat/delete',NULL,'删除分类',1,''),
	(64,'Admin','admin_url','admin/slidecat/edit',NULL,'编辑分类',1,''),
	(65,'Admin','admin_url','admin/slidecat/edit_post',NULL,'提交编辑',1,''),
	(66,'Admin','admin_url','admin/slidecat/add',NULL,'添加分类',1,''),
	(67,'Admin','admin_url','admin/slidecat/add_post',NULL,'提交添加',1,''),
	(68,'Admin','admin_url','admin/ad/index',NULL,'网站广告',1,''),
	(69,'Admin','admin_url','admin/ad/toggle',NULL,'广告显示切换',1,''),
	(70,'Admin','admin_url','admin/ad/delete',NULL,'删除广告',1,''),
	(71,'Admin','admin_url','admin/ad/edit',NULL,'编辑广告',1,''),
	(72,'Admin','admin_url','admin/ad/edit_post',NULL,'提交编辑',1,''),
	(73,'Admin','admin_url','admin/ad/add',NULL,'添加广告',1,''),
	(74,'Admin','admin_url','admin/ad/add_post',NULL,'提交添加',1,''),
	(75,'Admin','admin_url','admin/link/index',NULL,'友情链接',1,''),
	(76,'Admin','admin_url','admin/link/listorders',NULL,'友情链接排序',1,''),
	(77,'Admin','admin_url','admin/link/toggle',NULL,'友链显示切换',1,''),
	(78,'Admin','admin_url','admin/link/delete',NULL,'删除友情链接',1,''),
	(79,'Admin','admin_url','admin/link/edit',NULL,'编辑友情链接',1,''),
	(80,'Admin','admin_url','admin/link/edit_post',NULL,'提交编辑',1,''),
	(81,'Admin','admin_url','admin/link/add',NULL,'添加友情链接',1,''),
	(82,'Admin','admin_url','admin/link/add_post',NULL,'提交添加',1,''),
	(83,'Api','admin_url','api/oauthadmin/setting',NULL,'第三方登陆',1,''),
	(84,'Api','admin_url','api/oauthadmin/setting_post',NULL,'提交设置',1,''),
	(85,'Admin','admin_url','admin/menu/default',NULL,'菜单管理',1,''),
	(86,'Admin','admin_url','admin/navcat/default1',NULL,'前台菜单',1,''),
	(87,'Admin','admin_url','admin/nav/index',NULL,'菜单管理',1,''),
	(88,'Admin','admin_url','admin/nav/listorders',NULL,'前台导航排序',1,''),
	(89,'Admin','admin_url','admin/nav/delete',NULL,'删除菜单',1,''),
	(90,'Admin','admin_url','admin/nav/edit',NULL,'编辑菜单',1,''),
	(91,'Admin','admin_url','admin/nav/edit_post',NULL,'提交编辑',1,''),
	(92,'Admin','admin_url','admin/nav/add',NULL,'添加菜单',1,''),
	(93,'Admin','admin_url','admin/nav/add_post',NULL,'提交添加',1,''),
	(94,'Admin','admin_url','admin/navcat/index',NULL,'菜单分类',1,''),
	(95,'Admin','admin_url','admin/navcat/delete',NULL,'删除分类',1,''),
	(96,'Admin','admin_url','admin/navcat/edit',NULL,'编辑分类',1,''),
	(97,'Admin','admin_url','admin/navcat/edit_post',NULL,'提交编辑',1,''),
	(98,'Admin','admin_url','admin/navcat/add',NULL,'添加分类',1,''),
	(99,'Admin','admin_url','admin/navcat/add_post',NULL,'提交添加',1,''),
	(100,'Admin','admin_url','admin/menu/index',NULL,'后台菜单',1,''),
	(101,'Admin','admin_url','admin/menu/add',NULL,'添加菜单',1,''),
	(102,'Admin','admin_url','admin/menu/add_post',NULL,'提交添加',1,''),
	(103,'Admin','admin_url','admin/menu/listorders',NULL,'后台菜单排序',1,''),
	(104,'Admin','admin_url','admin/menu/export_menu',NULL,'菜单备份',1,''),
	(105,'Admin','admin_url','admin/menu/edit',NULL,'编辑菜单',1,''),
	(106,'Admin','admin_url','admin/menu/edit_post',NULL,'提交编辑',1,''),
	(107,'Admin','admin_url','admin/menu/delete',NULL,'删除菜单',1,''),
	(108,'Admin','admin_url','admin/menu/lists',NULL,'所有菜单',1,''),
	(109,'Admin','admin_url','admin/setting/default',NULL,'设置',1,''),
	(110,'Admin','admin_url','admin/setting/userdefault',NULL,'个人信息',1,''),
	(111,'Admin','admin_url','admin/user/userinfo',NULL,'修改信息',1,''),
	(112,'Admin','admin_url','admin/user/userinfo_post',NULL,'修改信息提交',1,''),
	(113,'Admin','admin_url','admin/setting/password',NULL,'修改密码',1,''),
	(114,'Admin','admin_url','admin/setting/password_post',NULL,'提交修改',1,''),
	(115,'Admin','admin_url','admin/setting/site',NULL,'网站信息',1,''),
	(116,'Admin','admin_url','admin/setting/site_post',NULL,'提交修改',1,''),
	(117,'Admin','admin_url','admin/route/index',NULL,'路由列表',1,''),
	(118,'Admin','admin_url','admin/route/add',NULL,'路由添加',1,''),
	(119,'Admin','admin_url','admin/route/add_post',NULL,'路由添加提交',1,''),
	(120,'Admin','admin_url','admin/route/edit',NULL,'路由编辑',1,''),
	(121,'Admin','admin_url','admin/route/edit_post',NULL,'路由编辑提交',1,''),
	(122,'Admin','admin_url','admin/route/delete',NULL,'路由删除',1,''),
	(123,'Admin','admin_url','admin/route/ban',NULL,'路由禁止',1,''),
	(124,'Admin','admin_url','admin/route/open',NULL,'路由启用',1,''),
	(125,'Admin','admin_url','admin/route/listorders',NULL,'路由排序',1,''),
	(126,'Admin','admin_url','admin/mailer/default',NULL,'邮箱配置',1,''),
	(127,'Admin','admin_url','admin/mailer/index',NULL,'SMTP配置',1,''),
	(128,'Admin','admin_url','admin/mailer/index_post',NULL,'提交配置',1,''),
	(129,'Admin','admin_url','admin/mailer/active',NULL,'注册邮件模板',1,''),
	(130,'Admin','admin_url','admin/mailer/active_post',NULL,'提交模板',1,''),
	(131,'Admin','admin_url','admin/setting/clearcache',NULL,'清除缓存',1,''),
	(132,'User','admin_url','user/indexadmin/default',NULL,'用户管理',1,''),
	(133,'User','admin_url','user/indexadmin/default1',NULL,'用户组',1,''),
	(134,'User','admin_url','user/indexadmin/index',NULL,'本站用户',1,''),
	(135,'User','admin_url','user/indexadmin/ban',NULL,'拉黑会员',1,''),
	(136,'User','admin_url','user/indexadmin/cancelban',NULL,'启用会员',1,''),
	(137,'User','admin_url','user/oauthadmin/index',NULL,'第三方用户',1,''),
	(138,'User','admin_url','user/oauthadmin/delete',NULL,'第三方用户解绑',1,''),
	(139,'User','admin_url','user/indexadmin/default3',NULL,'管理组',1,''),
	(140,'Admin','admin_url','admin/rbac/index',NULL,'角色管理',1,''),
	(141,'Admin','admin_url','admin/rbac/member',NULL,'成员管理',1,''),
	(142,'Admin','admin_url','admin/rbac/authorize',NULL,'权限设置',1,''),
	(143,'Admin','admin_url','admin/rbac/authorize_post',NULL,'提交设置',1,''),
	(144,'Admin','admin_url','admin/rbac/roleedit',NULL,'编辑角色',1,''),
	(145,'Admin','admin_url','admin/rbac/roleedit_post',NULL,'提交编辑',1,''),
	(146,'Admin','admin_url','admin/rbac/roledelete',NULL,'删除角色',1,''),
	(147,'Admin','admin_url','admin/rbac/roleadd',NULL,'添加角色',1,''),
	(148,'Admin','admin_url','admin/rbac/roleadd_post',NULL,'提交添加',1,''),
	(149,'Admin','admin_url','admin/user/index',NULL,'管理员',1,''),
	(150,'Admin','admin_url','admin/user/delete',NULL,'删除管理员',1,''),
	(151,'Admin','admin_url','admin/user/edit',NULL,'管理员编辑',1,''),
	(152,'Admin','admin_url','admin/user/edit_post',NULL,'编辑提交',1,''),
	(153,'Admin','admin_url','admin/user/add',NULL,'管理员添加',1,''),
	(154,'Admin','admin_url','admin/user/add_post',NULL,'添加提交',1,''),
	(155,'Admin','admin_url','admin/plugin/update',NULL,'插件更新',1,''),
	(156,'Admin','admin_url','admin/storage/index',NULL,'文件存储',1,''),
	(157,'Admin','admin_url','admin/storage/setting_post',NULL,'文件存储设置提交',1,''),
	(158,'Admin','admin_url','admin/slide/ban',NULL,'禁用幻灯片',1,''),
	(159,'Admin','admin_url','admin/slide/cancelban',NULL,'启用幻灯片',1,''),
	(160,'Admin','admin_url','admin/user/ban',NULL,'禁用管理员',1,''),
	(161,'Admin','admin_url','admin/user/cancelban',NULL,'启用管理员',1,''),
	(162,'Demo','admin_url','demo/adminindex/index',NULL,'',1,''),
	(163,'Demo','admin_url','demo/adminindex/last',NULL,'',1,''),
	(166,'Admin','admin_url','admin/mailer/test',NULL,'测试邮件',1,''),
	(167,'Admin','admin_url','admin/setting/upload',NULL,'上传设置',1,''),
	(168,'Admin','admin_url','admin/setting/upload_post',NULL,'上传设置提交',1,''),
	(169,'Portal','admin_url','portal/adminpost/copy',NULL,'文章批量复制',1,''),
	(170,'Admin','admin_url','admin/menu/backup_menu',NULL,'备份菜单',1,''),
	(171,'Admin','admin_url','admin/menu/export_menu_lang',NULL,'导出后台菜单多语言包',1,''),
	(172,'Admin','admin_url','admin/menu/restore_menu',NULL,'还原菜单',1,''),
	(173,'Admin','admin_url','admin/menu/getactions',NULL,'导入新菜单',1,'');

/*!40000 ALTER TABLE `dc_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_comments`;

CREATE TABLE `dc_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';



# Dump of table dc_common_action_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_common_action_log`;

CREATE TABLE `dc_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';



# Dump of table dc_guestbook
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_guestbook`;

CREATE TABLE `dc_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';



# Dump of table dc_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_links`;

CREATE TABLE `dc_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表';

LOCK TABLES `dc_links` WRITE;
/*!40000 ALTER TABLE `dc_links` DISABLE KEYS */;

INSERT INTO `dc_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder`)
VALUES
	(1,'http://www.thinkcmf.com','ThinkCMF','','_blank','',1,0,'',0);

/*!40000 ALTER TABLE `dc_links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_menu`;

CREATE TABLE `dc_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

LOCK TABLES `dc_menu` WRITE;
/*!40000 ALTER TABLE `dc_menu` DISABLE KEYS */;

INSERT INTO `dc_menu` (`id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder`)
VALUES
	(1,0,'Admin','Content','default','',0,1,'内容管理','th','',30),
	(2,1,'Api','Guestbookadmin','index','',1,1,'所有留言','','',0),
	(3,2,'Api','Guestbookadmin','delete','',1,0,'删除网站留言','','',0),
	(4,1,'Comment','Commentadmin','index','',1,1,'评论管理','','',0),
	(5,4,'Comment','Commentadmin','delete','',1,0,'删除评论','','',0),
	(6,4,'Comment','Commentadmin','check','',1,0,'评论审核','','',0),
	(7,1,'Portal','AdminPost','index','',1,1,'文章管理','','',1),
	(8,7,'Portal','AdminPost','listorders','',1,0,'文章排序','','',0),
	(9,7,'Portal','AdminPost','top','',1,0,'文章置顶','','',0),
	(10,7,'Portal','AdminPost','recommend','',1,0,'文章推荐','','',0),
	(11,7,'Portal','AdminPost','move','',1,0,'批量移动','','',1000),
	(12,7,'Portal','AdminPost','check','',1,0,'文章审核','','',1000),
	(13,7,'Portal','AdminPost','delete','',1,0,'删除文章','','',1000),
	(14,7,'Portal','AdminPost','edit','',1,0,'编辑文章','','',1000),
	(15,14,'Portal','AdminPost','edit_post','',1,0,'提交编辑','','',0),
	(16,7,'Portal','AdminPost','add','',1,0,'添加文章','','',1000),
	(17,16,'Portal','AdminPost','add_post','',1,0,'提交添加','','',0),
	(18,1,'Portal','AdminTerm','index','',0,1,'分类管理','','',2),
	(19,18,'Portal','AdminTerm','listorders','',1,0,'文章分类排序','','',0),
	(20,18,'Portal','AdminTerm','delete','',1,0,'删除分类','','',1000),
	(21,18,'Portal','AdminTerm','edit','',1,0,'编辑分类','','',1000),
	(22,21,'Portal','AdminTerm','edit_post','',1,0,'提交编辑','','',0),
	(23,18,'Portal','AdminTerm','add','',1,0,'添加分类','','',1000),
	(24,23,'Portal','AdminTerm','add_post','',1,0,'提交添加','','',0),
	(25,1,'Portal','AdminPage','index','',1,1,'页面管理','','',3),
	(26,25,'Portal','AdminPage','listorders','',1,0,'页面排序','','',0),
	(27,25,'Portal','AdminPage','delete','',1,0,'删除页面','','',1000),
	(28,25,'Portal','AdminPage','edit','',1,0,'编辑页面','','',1000),
	(29,28,'Portal','AdminPage','edit_post','',1,0,'提交编辑','','',0),
	(30,25,'Portal','AdminPage','add','',1,0,'添加页面','','',1000),
	(31,30,'Portal','AdminPage','add_post','',1,0,'提交添加','','',0),
	(32,1,'Admin','Recycle','default','',1,1,'回收站','','',4),
	(33,32,'Portal','AdminPost','recyclebin','',1,1,'文章回收','','',0),
	(34,33,'Portal','AdminPost','restore','',1,0,'文章还原','','',1000),
	(35,33,'Portal','AdminPost','clean','',1,0,'彻底删除','','',1000),
	(36,32,'Portal','AdminPage','recyclebin','',1,1,'页面回收','','',1),
	(37,36,'Portal','AdminPage','clean','',1,0,'彻底删除','','',1000),
	(38,36,'Portal','AdminPage','restore','',1,0,'页面还原','','',1000),
	(39,0,'Admin','Extension','default','',0,1,'扩展工具','cloud','',40),
	(40,39,'Admin','Backup','default','',1,0,'备份管理','','',0),
	(41,40,'Admin','Backup','restore','',1,1,'数据还原','','',0),
	(42,40,'Admin','Backup','index','',1,1,'数据备份','','',0),
	(43,42,'Admin','Backup','index_post','',1,0,'提交数据备份','','',0),
	(44,40,'Admin','Backup','download','',1,0,'下载备份','','',1000),
	(45,40,'Admin','Backup','del_backup','',1,0,'删除备份','','',1000),
	(46,40,'Admin','Backup','import','',1,0,'数据备份导入','','',1000),
	(47,39,'Admin','Plugin','index','',1,1,'插件管理','','',0),
	(48,47,'Admin','Plugin','toggle','',1,0,'插件启用切换','','',0),
	(49,47,'Admin','Plugin','setting','',1,0,'插件设置','','',0),
	(50,49,'Admin','Plugin','setting_post','',1,0,'插件设置提交','','',0),
	(51,47,'Admin','Plugin','install','',1,0,'插件安装','','',0),
	(52,47,'Admin','Plugin','uninstall','',1,0,'插件卸载','','',0),
	(53,39,'Admin','Slide','default','',1,1,'幻灯片','','',1),
	(54,53,'Admin','Slide','index','',1,1,'幻灯片管理','','',0),
	(55,54,'Admin','Slide','listorders','',1,0,'幻灯片排序','','',0),
	(56,54,'Admin','Slide','toggle','',1,0,'幻灯片显示切换','','',0),
	(57,54,'Admin','Slide','delete','',1,0,'删除幻灯片','','',1000),
	(58,54,'Admin','Slide','edit','',1,0,'编辑幻灯片','','',1000),
	(59,58,'Admin','Slide','edit_post','',1,0,'提交编辑','','',0),
	(60,54,'Admin','Slide','add','',1,0,'添加幻灯片','','',1000),
	(61,60,'Admin','Slide','add_post','',1,0,'提交添加','','',0),
	(62,53,'Admin','Slidecat','index','',1,1,'幻灯片分类','','',0),
	(63,62,'Admin','Slidecat','delete','',1,0,'删除分类','','',1000),
	(64,62,'Admin','Slidecat','edit','',1,0,'编辑分类','','',1000),
	(65,64,'Admin','Slidecat','edit_post','',1,0,'提交编辑','','',0),
	(66,62,'Admin','Slidecat','add','',1,0,'添加分类','','',1000),
	(67,66,'Admin','Slidecat','add_post','',1,0,'提交添加','','',0),
	(68,39,'Admin','Ad','index','',1,1,'网站广告','','',2),
	(69,68,'Admin','Ad','toggle','',1,0,'广告显示切换','','',0),
	(70,68,'Admin','Ad','delete','',1,0,'删除广告','','',1000),
	(71,68,'Admin','Ad','edit','',1,0,'编辑广告','','',1000),
	(72,71,'Admin','Ad','edit_post','',1,0,'提交编辑','','',0),
	(73,68,'Admin','Ad','add','',1,0,'添加广告','','',1000),
	(74,73,'Admin','Ad','add_post','',1,0,'提交添加','','',0),
	(75,39,'Admin','Link','index','',0,1,'友情链接','','',3),
	(76,75,'Admin','Link','listorders','',1,0,'友情链接排序','','',0),
	(77,75,'Admin','Link','toggle','',1,0,'友链显示切换','','',0),
	(78,75,'Admin','Link','delete','',1,0,'删除友情链接','','',1000),
	(79,75,'Admin','Link','edit','',1,0,'编辑友情链接','','',1000),
	(80,79,'Admin','Link','edit_post','',1,0,'提交编辑','','',0),
	(81,75,'Admin','Link','add','',1,0,'添加友情链接','','',1000),
	(82,81,'Admin','Link','add_post','',1,0,'提交添加','','',0),
	(83,39,'Api','Oauthadmin','setting','',1,1,'第三方登陆','leaf','',4),
	(84,83,'Api','Oauthadmin','setting_post','',1,0,'提交设置','','',0),
	(85,0,'Admin','Menu','default','',1,1,'菜单管理','list','',20),
	(86,85,'Admin','Navcat','default1','',1,1,'前台菜单','','',0),
	(87,86,'Admin','Nav','index','',1,1,'菜单管理','','',0),
	(88,87,'Admin','Nav','listorders','',1,0,'前台导航排序','','',0),
	(89,87,'Admin','Nav','delete','',1,0,'删除菜单','','',1000),
	(90,87,'Admin','Nav','edit','',1,0,'编辑菜单','','',1000),
	(91,90,'Admin','Nav','edit_post','',1,0,'提交编辑','','',0),
	(92,87,'Admin','Nav','add','',1,0,'添加菜单','','',1000),
	(93,92,'Admin','Nav','add_post','',1,0,'提交添加','','',0),
	(94,86,'Admin','Navcat','index','',1,1,'菜单分类','','',0),
	(95,94,'Admin','Navcat','delete','',1,0,'删除分类','','',1000),
	(96,94,'Admin','Navcat','edit','',1,0,'编辑分类','','',1000),
	(97,96,'Admin','Navcat','edit_post','',1,0,'提交编辑','','',0),
	(98,94,'Admin','Navcat','add','',1,0,'添加分类','','',1000),
	(99,98,'Admin','Navcat','add_post','',1,0,'提交添加','','',0),
	(100,85,'Admin','Menu','index','',1,1,'后台菜单','','',0),
	(101,100,'Admin','Menu','add','',1,0,'添加菜单','','',0),
	(102,101,'Admin','Menu','add_post','',1,0,'提交添加','','',0),
	(103,100,'Admin','Menu','listorders','',1,0,'后台菜单排序','','',0),
	(104,100,'Admin','Menu','export_menu','',1,0,'菜单备份','','',1000),
	(105,100,'Admin','Menu','edit','',1,0,'编辑菜单','','',1000),
	(106,105,'Admin','Menu','edit_post','',1,0,'提交编辑','','',0),
	(107,100,'Admin','Menu','delete','',1,0,'删除菜单','','',1000),
	(108,100,'Admin','Menu','lists','',1,0,'所有菜单','','',1000),
	(109,0,'Admin','Setting','default','',0,1,'设置','cogs','',0),
	(110,109,'Admin','Setting','userdefault','',0,1,'个人信息','','',0),
	(111,110,'Admin','User','userinfo','',1,1,'修改信息','','',0),
	(112,111,'Admin','User','userinfo_post','',1,0,'修改信息提交','','',0),
	(113,110,'Admin','Setting','password','',1,1,'修改密码','','',0),
	(114,113,'Admin','Setting','password_post','',1,0,'提交修改','','',0),
	(115,109,'Admin','Setting','site','',1,1,'网站信息','','',0),
	(116,115,'Admin','Setting','site_post','',1,0,'提交修改','','',0),
	(117,115,'Admin','Route','index','',1,0,'路由列表','','',0),
	(118,115,'Admin','Route','add','',1,0,'路由添加','','',0),
	(119,118,'Admin','Route','add_post','',1,0,'路由添加提交','','',0),
	(120,115,'Admin','Route','edit','',1,0,'路由编辑','','',0),
	(121,120,'Admin','Route','edit_post','',1,0,'路由编辑提交','','',0),
	(122,115,'Admin','Route','delete','',1,0,'路由删除','','',0),
	(123,115,'Admin','Route','ban','',1,0,'路由禁止','','',0),
	(124,115,'Admin','Route','open','',1,0,'路由启用','','',0),
	(125,115,'Admin','Route','listorders','',1,0,'路由排序','','',0),
	(126,109,'Admin','Mailer','default','',1,1,'邮箱配置','','',0),
	(127,126,'Admin','Mailer','index','',1,1,'SMTP配置','','',0),
	(128,127,'Admin','Mailer','index_post','',1,0,'提交配置','','',0),
	(129,126,'Admin','Mailer','active','',1,1,'注册邮件模板','','',0),
	(130,129,'Admin','Mailer','active_post','',1,0,'提交模板','','',0),
	(131,109,'Admin','Setting','clearcache','',1,1,'清除缓存','','',1),
	(132,0,'User','Indexadmin','default','',1,1,'用户管理','group','',10),
	(133,132,'User','Indexadmin','default1','',1,1,'用户组','','',0),
	(134,133,'User','Indexadmin','index','',1,1,'本站用户','leaf','',0),
	(135,134,'User','Indexadmin','ban','',1,0,'拉黑会员','','',0),
	(136,134,'User','Indexadmin','cancelban','',1,0,'启用会员','','',0),
	(137,133,'User','Oauthadmin','index','',1,1,'第三方用户','leaf','',0),
	(138,137,'User','Oauthadmin','delete','',1,0,'第三方用户解绑','','',0),
	(139,132,'User','Indexadmin','default3','',1,1,'管理组','','',0),
	(140,139,'Admin','Rbac','index','',1,1,'角色管理','','',0),
	(141,140,'Admin','Rbac','member','',1,0,'成员管理','','',1000),
	(142,140,'Admin','Rbac','authorize','',1,0,'权限设置','','',1000),
	(143,142,'Admin','Rbac','authorize_post','',1,0,'提交设置','','',0),
	(144,140,'Admin','Rbac','roleedit','',1,0,'编辑角色','','',1000),
	(145,144,'Admin','Rbac','roleedit_post','',1,0,'提交编辑','','',0),
	(146,140,'Admin','Rbac','roledelete','',1,1,'删除角色','','',1000),
	(147,140,'Admin','Rbac','roleadd','',1,1,'添加角色','','',1000),
	(148,147,'Admin','Rbac','roleadd_post','',1,0,'提交添加','','',0),
	(149,139,'Admin','User','index','',1,1,'管理员','','',0),
	(150,149,'Admin','User','delete','',1,0,'删除管理员','','',1000),
	(151,149,'Admin','User','edit','',1,0,'管理员编辑','','',1000),
	(152,151,'Admin','User','edit_post','',1,0,'编辑提交','','',0),
	(153,149,'Admin','User','add','',1,0,'管理员添加','','',1000),
	(154,153,'Admin','User','add_post','',1,0,'添加提交','','',0),
	(155,47,'Admin','Plugin','update','',1,0,'插件更新','','',0),
	(156,109,'Admin','Storage','index','',1,1,'文件存储','','',0),
	(157,156,'Admin','Storage','setting_post','',1,0,'文件存储设置提交','','',0),
	(158,54,'Admin','Slide','ban','',1,0,'禁用幻灯片','','',0),
	(159,54,'Admin','Slide','cancelban','',1,0,'启用幻灯片','','',0),
	(160,149,'Admin','User','ban','',1,0,'禁用管理员','','',0),
	(161,149,'Admin','User','cancelban','',1,0,'启用管理员','','',0),
	(166,127,'Admin','Mailer','test','',1,0,'测试邮件','','',0),
	(167,109,'Admin','Setting','upload','',1,1,'上传设置','','',0),
	(168,167,'Admin','Setting','upload_post','',1,0,'上传设置提交','','',0),
	(169,7,'Portal','AdminPost','copy','',1,0,'文章批量复制','','',0),
	(174,100,'Admin','Menu','backup_menu','',1,0,'备份菜单','','',0),
	(175,100,'Admin','Menu','export_menu_lang','',1,0,'导出后台菜单多语言包','','',0),
	(176,100,'Admin','Menu','restore_menu','',1,0,'还原菜单','','',0),
	(177,100,'Admin','Menu','getactions','',1,0,'导入新菜单','','',0);

/*!40000 ALTER TABLE `dc_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_nav
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_nav`;

CREATE TABLE `dc_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='前台导航表';

LOCK TABLES `dc_nav` WRITE;
/*!40000 ALTER TABLE `dc_nav` DISABLE KEYS */;

INSERT INTO `dc_nav` (`id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path`)
VALUES
	(1,1,0,'首页','','home','',1,0,'0-1'),
	(5,1,0,'新闻资讯','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"8\";}}','',1,0,'0-5'),
	(4,1,0,'关于我们','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}','',1,0,'0-4'),
	(6,1,0,'公司制度','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"11\";}}','',1,0,'0-6'),
	(7,1,0,'党团工作','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"15\";}}','',1,0,'0-7'),
	(8,1,0,'下载中心','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"18\";}}','',1,0,'0-8');

/*!40000 ALTER TABLE `dc_nav` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_nav_cat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_nav_cat`;

CREATE TABLE `dc_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

LOCK TABLES `dc_nav_cat` WRITE;
/*!40000 ALTER TABLE `dc_nav_cat` DISABLE KEYS */;

INSERT INTO `dc_nav_cat` (`navcid`, `name`, `active`, `remark`)
VALUES
	(1,'主导航',1,'主导航');

/*!40000 ALTER TABLE `dc_nav_cat` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_oauth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_oauth_user`;

CREATE TABLE `dc_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';



# Dump of table dc_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_options`;

CREATE TABLE `dc_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='全站配置表';

LOCK TABLES `dc_options` WRITE;
/*!40000 ALTER TABLE `dc_options` DISABLE KEYS */;

INSERT INTO `dc_options` (`option_id`, `option_name`, `option_value`, `autoload`)
VALUES
	(1,'member_email_active','{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}',1),
	(6,'site_options','            {\n            		\"site_name\":\"淮北平山电厂\",\n            		\"site_host\":\"http://dc.aoyait.dev/\",\n            		\"site_root\":\"\",\n            		\"site_icp\":\"\",\n            		\"site_admin_email\":\"hi_php@163.com\",\n            		\"site_tongji\":\"\",\n            		\"site_copyright\":\"\",\n            		\"site_seo_title\":\"淮北平山电厂\",\n            		\"site_seo_keywords\":\"淮北平山电厂\",\n            		\"site_seo_description\":\"淮北平山电厂\"\n        }',1);

/*!40000 ALTER TABLE `dc_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_plugins`;

CREATE TABLE `dc_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';



# Dump of table dc_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_posts`;

CREATE TABLE `dc_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

LOCK TABLES `dc_posts` WRITE;
/*!40000 ALTER TABLE `dc_posts` DISABLE KEYS */;

INSERT INTO `dc_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`)
VALUES
	(1,1,'公司介绍','公司介绍','2017-07-06 19:22:41','<p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px 0px 5px; font-stretch: normal; font-size: 12px; line-height: 1.8em; font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; color: rgb(149, 149, 149); white-space: normal; background-color: rgb(255, 255, 255);\">申能（集团）有限公司是上海市国资委出资监管的国有独资企业，前身为1987年创立的申能电力开发公司，1996年成立集团公司，注册资本100亿元。</p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px 0px 5px; font-stretch: normal; font-size: 12px; line-height: 1.8em; font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; color: rgb(149, 149, 149); white-space: normal; background-color: rgb(255, 255, 255);\">申能集团目前拥有申能股份有限公司（600642SH）、上海燃气集团等9家控股企业，主要投资参股企业15家，基本形成“电气并举、产融结合”的产业发展格局。截至2012年底，公司总资产逾千亿元，年营业收入约300亿元，连续11年位列中国企业500强。</p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px 0px 5px; font-stretch: normal; font-size: 12px; line-height: 1.8em; font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; color: rgb(149, 149, 149); white-space: normal; background-color: rgb(255, 255, 255);\">申能集团作为上海市重大能源基础设施的投资建设主体和主要的电、气能源产品供应商，先后建成外高桥第二发电厂、外高桥第三发电厂、世博中国馆和主题馆太阳能等数十个重点电源项目，其中外高桥第三发电厂成为全国火力发电企业的标杆，截止2012年底集团权益装机容量达到737万千瓦，控股电厂发电量占到上海市总发电量约三分之一。同时，集团构建形成上海城市“5+1”（西气一线、西气二线、洋山进口LNG、东气、川气和五号沟LNG应急气源）天然气多气源保障体系，形成集燃气生产采购、管网配输、销售供应为一体的完整的城市燃气产业链，2012年天然气供应量达到62.8亿立方米，占到上海市场份额90%以上。此外，申能集团也是东方证券、太保集团的主要股东。</p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px 0px 5px; font-stretch: normal; font-size: 12px; line-height: 1.8em; font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; color: rgb(149, 149, 149); white-space: normal; background-color: rgb(255, 255, 255);\">申能集团承担着保障上海城市能源安全供应和推动全市能源结构调整优化的重任。近年来围绕全市“创新驱动、转型发展”大局，大力推动清洁能源发展和能源产业链拓展，先后涉足风力和太阳能发电、天然气发电、分布式供能、电厂节能科技、能源贸易、新能源创投基金等新业务领域，并通过积极实施电厂脱硫、脱硝改造等举措，在上海城市低碳发展和节能减排方面做出积极贡献。</p><p><span style=\"color: rgb(149, 149, 149); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\">申能集团规划到“十二五”末，电力权益装机容量达到1000万千瓦，天然气年经营规模达到100亿立方米左右，资本证券化率达到60%，发展成为一家主业突出、拥有较强核心竞争力的能源与金融产业投资集团。</span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px 0px 5px; font-stretch: normal; font-size: 12px; line-height: 1.8em; font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; color: rgb(149, 149, 149); white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><h2 style=\"font-stretch: normal; font-size: 16px; line-height: normal; font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; padding: 4px 0px 0px; margin: 0px; color: rgb(89, 89, 89); white-space: normal; background-color: rgb(255, 255, 255);\">经营理念</h2><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px 0px 5px; font-stretch: normal; font-size: 12px; line-height: 1.8em; font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; color: rgb(149, 149, 149); white-space: normal; background-color: rgb(255, 255, 255);\">公司自成立以来，秉持“锐意开拓、稳健运作”的经营理念，坚持以电力、燃气等能源产业投资运营为主，在投融资、资本运作和企业经营管理方面不断创新，现已发展成为一家以资产为纽带，电、气双业并举的大型能源企业集团。公司已连续四年入选全国企业500强。2005年公司的总资产达376亿元，国家所有者权益为179亿元，主营业务收入114亿元，员工总数达1.21万人，实现净利润6.4亿元。</p><h2 style=\"font-stretch: normal; font-size: 16px; line-height: normal; font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; padding: 4px 0px 0px; margin: 0px; color: rgb(89, 89, 89); white-space: normal; background-color: rgb(255, 255, 255);\">规模</h2><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px 0px 5px; font-stretch: normal; font-size: 12px; line-height: 1.8em; font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; color: rgb(149, 149, 149); white-space: normal; background-color: rgb(255, 255, 255);\">在电力产业方面，至2005年底，公司投资建成电力项目12个，权益装机容量达334万千瓦，在建电力项目3个，权益装机容量139万千瓦。2005年，公司投资电厂全口径计算发电量337亿度，为上海电力供应起到了重要的保障作用。2005年12月，上海外高桥电厂三期两台100万千瓦超超临界国产燃煤发电机组工程获得国家发展和改革委员会正式核准。华能上海燃机电厂、浙江桐柏抽水蓄电站、漕泾和临港燃机电厂、安徽淮北、马鞍山煤电厂等一批项目目前正在建设和积极筹划中。</p><p><br/></p>','公司介绍','5月26日，由中国城市燃气协会主办，上海燃气集团承办的第三届中国智慧燃气发展论坛在上海召开,上海燃气集团总经理臧良到会致开幕词',1,1,'2017-07-06 20:57:25',NULL,0,1,'',0,'{\"thumb\":\"https:\\/\\/ss0.bdstatic.com\\/5aV1bjqh_Q23odCf\\/static\\/superman\\/img\\/logo\\/bd_logo1_31bdc765.png\",\"template\":\"\",\"photo\":[{\"url\":\"https:\\/\\/ss0.bdstatic.com\\/5aV1bjqh_Q23odCf\\/static\\/superman\\/img\\/logo\\/bd_logo1_31bdc765.png\",\"alt\":\"undefined\"}]}',33,0,0,0),
	(3,1,'xxxxx','xxxx','2017-07-06 20:21:19','<p>xxxxxxx</p>','xxxxx','xxxx',1,1,'2017-07-07 08:31:09',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170707\\/595ed64b8981c.jpeg\",\"template\":\"\"}',334,0,0,0),
	(4,1,'fff','fff','2017-07-06 20:22:34','<p>fffff</p>','ffff','ffff',1,1,'2017-07-07 08:30:57',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170707\\/595ed63f6ee68.jpeg\",\"template\":\"\"}',444555,0,0,0),
	(5,1,'测试文字','测试文字','2017-07-07 08:06:01','<p>测试文字</p>','测试文字','测试文字',1,1,'2017-07-07 08:08:17',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170707\\/595ed0edd92db.jpeg\",\"template\":\"\"}',1,0,0,0),
	(6,1,'测试文字','测试文字','2017-07-07 08:08:25','<p>测试文字</p>','测试文字','测试文字',1,1,'2017-07-07 08:08:49',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170707\\/595ed10e09b05.jpeg\",\"template\":\"\"}',0,0,0,0),
	(7,1,'测试文字','测试文字','2017-07-07 08:08:58','<p>测试文字</p>','测试文字','测试文字',1,1,'2017-07-07 08:09:20',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170707\\/595ed12e03a4e.jpeg\",\"template\":\"\"}',0,0,0,0),
	(8,1,'测试文字','测试文字','2017-07-07 08:09:23','<p>测试文字</p>','测试文字','测试文字',1,1,'2017-07-07 08:09:48',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170707\\/595ed147e37c6.jpeg\",\"template\":\"\"}',0,0,0,0),
	(9,1,'测试文字','测试文字','2017-07-07 08:09:58','<p>测试文字</p>','测试文字','测试文字',1,1,'2017-07-07 08:10:27',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170707\\/595ed170c4c87.jpeg\",\"template\":\"\"}',0,0,0,0),
	(10,1,'测试文字','测试文字','2017-07-07 08:10:31','<p>测试文字</p>','测试文字','测试文字',1,1,'2017-07-07 08:10:53',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170707\\/595ed18baf5d7.jpeg\",\"template\":\"\"}',0,0,0,0),
	(11,1,'测试文字','测试文字','2017-07-07 08:11:09','<p>测试文字</p>','测试文字','测试文字',1,1,'2017-07-07 08:11:36',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170707\\/595ed1b62d641.jpeg\",\"template\":\"\"}',0,0,0,0),
	(12,1,'测试文字','测试文字','2017-07-07 08:15:28','<p>测试文字</p>','测试文字','测试文字',1,1,'2017-07-07 08:15:51',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170707\\/595ed2b4d0fd9.jpeg\",\"template\":\"\"}',0,0,0,0),
	(13,1,'为提高迎峰度夏期间国家电网公司对重大电网事故的应急处置能力','为提高迎峰度夏期间国家电网公司对重大电网事故的应急处置能力','2017-07-07 08:16:18','<p><span style=\"color: rgb(147, 147, 147); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 13px; text-align: justify; background-color: rgb(255, 255, 255);\">为提高迎峰度夏期间国家电网公司对重大电网事故的应急处置能力</span><span style=\"color: rgb(147, 147, 147); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 13px; text-align: justify; background-color: rgb(255, 255, 255);\">为提高迎峰度夏期间国家电网公司对重大电网事故的应急处置能力</span><span style=\"color: rgb(147, 147, 147); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 13px; text-align: justify; background-color: rgb(255, 255, 255);\">为提高迎峰度夏期间国家电网公司对重大电网事故的应急处置能力</span><span style=\"color: rgb(147, 147, 147); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 13px; text-align: justify; background-color: rgb(255, 255, 255);\">为提高迎峰度夏期间国家电网公司对重大电网事故的应急处置能力</span></p>','为提高迎峰度夏期间国家电网公司对重大电网事故的应急处置能力','为提高迎峰度夏期间国家电网公司对重大电网事故的应急处置能力',1,1,'2017-07-07 08:18:21',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170707\\/595ed2f7a0702.jpeg\",\"template\":\"article\"}',0,0,0,0);

/*!40000 ALTER TABLE `dc_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_role`;

CREATE TABLE `dc_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色表';

LOCK TABLES `dc_role` WRITE;
/*!40000 ALTER TABLE `dc_role` DISABLE KEYS */;

INSERT INTO `dc_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder`)
VALUES
	(1,'超级管理员',0,1,'拥有网站最高管理员权限！',1329633709,1329633709,0);

/*!40000 ALTER TABLE `dc_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_role_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_role_user`;

CREATE TABLE `dc_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';



# Dump of table dc_route
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_route`;

CREATE TABLE `dc_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';



# Dump of table dc_slide
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_slide`;

CREATE TABLE `dc_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

LOCK TABLES `dc_slide` WRITE;
/*!40000 ALTER TABLE `dc_slide` DISABLE KEYS */;

INSERT INTO `dc_slide` (`slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder`)
VALUES
	(1,1,'轮播1','http://dc.aoyait.dev/themes/simplebootx/Public/assets/images/header_images.jpg','#','','轮播',1,0),
	(2,1,'222','http://dc.aoyait.dev/themes/simplebootx/Public/assets/images/header_images.jpg','3333','4444','44444',1,0);

/*!40000 ALTER TABLE `dc_slide` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_slide_cat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_slide_cat`;

CREATE TABLE `dc_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

LOCK TABLES `dc_slide_cat` WRITE;
/*!40000 ALTER TABLE `dc_slide_cat` DISABLE KEYS */;

INSERT INTO `dc_slide_cat` (`cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status`)
VALUES
	(1,'首页轮播','portal_index','',1);

/*!40000 ALTER TABLE `dc_slide_cat` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_term_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_term_relationships`;

CREATE TABLE `dc_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

LOCK TABLES `dc_term_relationships` WRITE;
/*!40000 ALTER TABLE `dc_term_relationships` DISABLE KEYS */;

INSERT INTO `dc_term_relationships` (`tid`, `object_id`, `term_id`, `listorder`, `status`)
VALUES
	(2,1,10,0,1),
	(3,3,10,0,1),
	(4,4,10,0,1),
	(5,5,12,0,1),
	(6,6,12,0,1),
	(7,7,13,0,1),
	(8,8,13,0,1),
	(9,9,16,0,1),
	(10,10,17,0,1),
	(11,11,18,0,1),
	(12,12,18,0,1),
	(13,13,14,0,1);

/*!40000 ALTER TABLE `dc_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_terms`;

CREATE TABLE `dc_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

LOCK TABLES `dc_terms` WRITE;
/*!40000 ALTER TABLE `dc_terms` DISABLE KEYS */;

INSERT INTO `dc_terms` (`term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`)
VALUES
	(4,'公司介绍','','article','',3,0,'0-3-4','','','','list','article',0,1),
	(3,'关于我们','','article','',0,0,'0-3','','','','list','article',0,1),
	(5,'机构设置','','article','',3,0,'0-3-5','','','','list','article',0,1),
	(6,'领导班子','','article','',3,0,'0-3-6','','','','list','article',0,1),
	(7,'联系我们','','article','',3,0,'0-3-7','','','','list','article',0,1),
	(8,'新闻资讯','','article','',0,0,'0-8','','','','list','article',0,1),
	(9,'公司要闻','','article','',8,0,'0-8-9','','','','list','article',0,1),
	(10,'新闻动态','','article','',8,0,'0-8-10','','','','list','article',0,1),
	(11,'公司制度','','article','',0,0,'0-11','','','','list','article',0,1),
	(12,'公司发文','','article','',11,0,'0-11-12','','','','list','article',0,1),
	(13,'公司制度','','article','',11,0,'0-11-13','','','','list','article',0,1),
	(14,'通知公告','','article','',11,0,'0-11-14','','','','list','article',0,1),
	(15,'党团工作','','article','',0,0,'0-15','','','','list','article',0,1),
	(16,'党群在线','','article','',15,0,'0-15-16','','','','list','article',0,1),
	(17,'团情工作','','article','',15,0,'0-15-17','','','','list','article',0,1),
	(18,'下载中心','','article','',0,0,'0-18','','','','list','article',0,1);

/*!40000 ALTER TABLE `dc_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dc_user_favorites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_user_favorites`;

CREATE TABLE `dc_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';



# Dump of table dc_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dc_users`;

CREATE TABLE `dc_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `dc_users` WRITE;
/*!40000 ALTER TABLE `dc_users` DISABLE KEYS */;

INSERT INTO `dc_users` (`id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`)
VALUES
	(1,'admin','###fdb41b412e478f3b6b7c35063ff8162e','admin','hi_php@163.com','',NULL,0,'2000-01-01',NULL,'172.17.0.1','2017-07-07 08:35:51','2017-07-06 06:16:27','',1,0,1,0,'');

/*!40000 ALTER TABLE `dc_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
