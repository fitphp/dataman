/*
 Navicat Premium Data Transfer

 Source Server         : mariadb@101.37.203.119
 Source Server Type    : MariaDB
 Source Server Version : 100509
 Source Host           : 101.37.203.119:3306
 Source Schema         : dataman

 Target Server Type    : MariaDB
 Target Server Version : 100509
 File Encoding         : 65001

 Date: 07/07/2021 19:25:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_extension_histories
-- ----------------------------
DROP TABLE IF EXISTS `admin_extension_histories`;
CREATE TABLE `admin_extension_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `admin_extension_histories_name_index` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_extension_histories
-- ----------------------------
BEGIN;
INSERT INTO `admin_extension_histories` VALUES (1, 'dcat-admin.operation-log', 2, '1.0.0', 'create_opration_log_table.php', '2021-01-31 23:15:52', '2021-01-31 23:15:52');
INSERT INTO `admin_extension_histories` VALUES (2, 'dcat-admin.operation-log', 1, '1.0.0', 'Initialize extension.', '2021-01-31 23:15:52', '2021-01-31 23:15:52');
COMMIT;

-- ----------------------------
-- Table structure for admin_extensions
-- ----------------------------
DROP TABLE IF EXISTS `admin_extensions`;
CREATE TABLE `admin_extensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `admin_extensions_name_unique` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_extensions
-- ----------------------------
BEGIN;
INSERT INTO `admin_extensions` VALUES (1, 'dcat-admin.operation-log', '1.0.0', 0, NULL, '2021-01-31 23:15:52', '2021-02-01 23:39:31');
COMMIT;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `show` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_menu` VALUES (1, 0, 1, '首页', 'fa-home', '/', '', 1, '2020-12-21 14:40:07', '2021-01-08 14:43:14');
INSERT INTO `admin_menu` VALUES (2, 0, 2, '系统管理', 'feather icon-settings', NULL, '', 1, '2020-12-21 14:40:07', '2020-12-30 16:10:19');
INSERT INTO `admin_menu` VALUES (3, 2, 3, '管理员', NULL, 'auth/users', '', 1, '2020-12-21 14:40:07', '2020-12-30 16:10:44');
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色', NULL, 'auth/roles', '', 1, '2020-12-21 14:40:07', '2020-12-30 16:11:21');
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限', NULL, 'auth/permissions', '', 1, '2020-12-21 14:40:07', '2021-01-08 14:40:45');
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单', NULL, 'auth/menu', '', 1, '2020-12-21 14:40:07', '2021-01-08 14:41:05');
INSERT INTO `admin_menu` VALUES (7, 2, 7, '扩展', NULL, 'auth/extensions', '', 1, '2020-12-21 14:40:07', '2021-01-08 14:41:25');
INSERT INTO `admin_menu` VALUES (8, 2, 8, '日志', NULL, 'auth/operation-logs', '', 1, '2021-01-24 19:05:30', '2021-01-27 23:28:48');
INSERT INTO `admin_menu` VALUES (9, 0, 9, '数据中心', 'fa-align-justify', NULL, '', 1, '2021-01-27 23:21:33', '2021-01-27 23:33:49');
INSERT INTO `admin_menu` VALUES (10, 9, 10, '字典管理', 'fa-cog', 'dictionary', '', 1, '2021-01-27 23:36:56', '2021-01-27 23:36:56');
INSERT INTO `admin_menu` VALUES (11, 9, 11, '附件管理', 'fa-file-picture-o', 'media', '', 1, '2021-01-27 23:42:57', '2021-01-27 23:42:57');
INSERT INTO `admin_menu` VALUES (12, 9, 12, '中国区域', 'fa-globe', 'region/china', '', 1, '2021-01-24 19:05:30', '2021-01-27 23:28:48');
INSERT INTO `admin_menu` VALUES (13, 9, 13, '分类管理', 'fa-list-ul', 'category', '', 1, '2021-01-24 19:11:15', '2021-01-27 23:28:47');
INSERT INTO `admin_menu` VALUES (14, 0, 14, '广告管理', 'fa-audio-description', 'advert', '', 1, '2021-01-27 23:50:43', '2021-01-27 23:50:43');
INSERT INTO `admin_menu` VALUES (15, 14, 15, '位置管理', 'fa-map-pin', 'advert/position', '', 1, '2021-01-27 23:38:36', '2021-01-27 23:38:36');
INSERT INTO `admin_menu` VALUES (16, 14, 16, '广告管理', 'fa-list', 'advert/data', '', 1, '2021-01-27 23:38:36', '2021-01-27 23:38:36');
INSERT INTO `admin_menu` VALUES (17, 0, 17, '应用中心', 'fa-paper-plane', NULL, '', 1, '2021-01-27 23:28:20', '2021-01-27 23:28:47');
INSERT INTO `admin_menu` VALUES (18, 17, 18, '应用管理', 'fa-paper-plane-o', 'application', '', 1, '2021-01-27 23:44:58', '2021-01-27 23:44:58');
INSERT INTO `admin_menu` VALUES (19, 17, 19, '内容管理', 'fa-copy', 'content', '', 1, '2021-01-27 23:46:49', '2021-01-27 23:46:49');
INSERT INTO `admin_menu` VALUES (20, 17, 20, '通知公告', 'fa-bell', 'notice', '', 1, '2021-01-24 19:05:30', '2021-01-27 23:28:48');
INSERT INTO `admin_menu` VALUES (21, 0, 21, '运营中心', 'fa-modx', NULL, '', 1, '2021-01-24 19:11:15', '2021-01-27 23:28:47');
INSERT INTO `admin_menu` VALUES (22, 9, 22, '平台管理', 'fa-sitemap', 'platform', '', 1, '2021-01-27 23:25:50', '2021-07-07 15:56:53');
INSERT INTO `admin_menu` VALUES (23, 21, 23, '栏目管理', 'feather icon-layers', 'channel', '', 1, '2021-01-27 23:27:33', '2021-01-27 23:28:47');
INSERT INTO `admin_menu` VALUES (24, 21, 24, '布局管理', 'feather icon-layout', 'layout', '', 1, '2021-01-27 23:40:06', '2021-01-27 23:54:19');
INSERT INTO `admin_menu` VALUES (25, 21, 25, '意见反馈', 'fa-bug', 'feedback', '', 1, '2021-01-27 23:40:06', '2021-01-27 23:54:19');
COMMIT;

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `path` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `input` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE `admin_permission_menu` (
  `permission_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_permission_menu_permission_id_menu_id_unique` (`permission_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permission_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_permissions` VALUES (1, '权限管理', 'auth-management', '', '', 1, 0, '2020-12-21 14:40:07', NULL);
INSERT INTO `admin_permissions` VALUES (2, '管理员', 'users', '', '/auth/users*', 2, 1, '2020-12-21 14:40:07', NULL);
INSERT INTO `admin_permissions` VALUES (3, '角色', 'roles', '', '/auth/roles*', 3, 1, '2020-12-21 14:40:07', NULL);
INSERT INTO `admin_permissions` VALUES (4, '权限', 'permissions', '', '/auth/permissions*', 4, 1, '2020-12-21 14:40:07', NULL);
INSERT INTO `admin_permissions` VALUES (5, '菜单', 'menu', '', '/auth/menu*', 5, 1, '2020-12-21 14:40:07', NULL);
INSERT INTO `admin_permissions` VALUES (6, '扩展', 'extension', '', '/auth/extensions*', 6, 1, '2020-12-21 14:40:07', NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_menu_role_id_menu_id_unique` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_permissions_role_id_permission_id_unique` (`role_id`,`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_users_role_id_user_id_unique` (`role_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_users` VALUES (1, 1, '2020-12-21 14:40:07', '2020-12-21 14:40:07');
COMMIT;

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `admin_roles_slug_unique` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `admin_roles` VALUES (1, '超级管理员', 'administrator', '2020-12-21 14:40:07', '2020-12-25 00:01:39');
COMMIT;

-- ----------------------------
-- Table structure for admin_settings
-- ----------------------------
DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE `admin_settings` (
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`slug`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_settings
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `admin_users_username_unique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$NnBZzPbapsOTVShsF2ROQ.wpPNxWJn9E5/UjVWeE3APdmzXUgqgpu', 'Administrator', NULL, 'vuggob5XdkuomhsFAB3IJkpicCc8LU5ZcyH9mkR3oWR8aMSKJi847qwzfVU9', '2020-12-21 14:40:07', '2020-12-21 14:40:07');
COMMIT;

-- ----------------------------
-- Table structure for advert_data
-- ----------------------------
DROP TABLE IF EXISTS `advert_data`;
CREATE TABLE `advert_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `pin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '位置ID',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '描述',
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类型',
  `appid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'AppID',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链接',
  `status` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '状态 0 禁用 1正常',
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '排序',
  `start_at` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_at` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `advert_data_pin_id_normal` (`pin_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of advert_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for advert_position
-- ----------------------------
DROP TABLE IF EXISTS `advert_position`;
CREATE TABLE `advert_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '平台ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '描述',
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of advert_position
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '平台ID',
  `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '标题',
  `subtitle` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '副标题',
  `image` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '图标',
  `category_ids` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '分类ID',
  `type` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'h5' COMMENT 'URL类型',
  `appid` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '应用编号',
  `url` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT 'URL',
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '权重',
  `auth` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '认证级别',
  `status` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '状态',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='应用数据表';

-- ----------------------------
-- Records of application
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分组',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父ID',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图标',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父ID',
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '平台ID',
  `name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '标题',
  `image` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '图标',
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for china_region
-- ----------------------------
DROP TABLE IF EXISTS `china_region`;
CREATE TABLE `china_region` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `level` bigint(20) DEFAULT NULL COMMENT '等级',
  `parent_code` bigint(20) DEFAULT NULL COMMENT '父区域码',
  `area_code` bigint(20) DEFAULT NULL COMMENT '区域码',
  `zip_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `city_code` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '区号',
  `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '名称',
  `short_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '简称',
  `merger_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '全称',
  `pinyin` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '拼音',
  `lng` double DEFAULT NULL COMMENT '经度',
  `lat` double DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `SearchIndex` (`level`,`parent_code`,`name`) USING BTREE COMMENT '搜索索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='中国地区表';

-- ----------------------------
-- Records of china_region
-- ----------------------------
BEGIN;
INSERT INTO `china_region` VALUES (1, 0, 0, 110000000000, '0', NULL, '北京市', '北京', '北京', 'BeiJing', 116.407526, 39.90403);
INSERT INTO `china_region` VALUES (2, 1, 110000000000, 110100000000, '100000', '010', '直辖区', '北京', '北京', 'BeiJing', 116.407526, 39.90403);
INSERT INTO `china_region` VALUES (3, 2, 110100000000, 110101000000, '100000', '010', '东城区', '东城', '北京,东城', 'DongCheng', 116.416357, 39.928353);
INSERT INTO `china_region` VALUES (198, 2, 110100000000, 110102000000, '100000', '010', '西城区', '西城', '北京,西城', 'XiCheng', 116.365868, 39.912289);
INSERT INTO `china_region` VALUES (473, 2, 110100000000, 110105000000, '100000', '010', '朝阳区', '朝阳', '北京,朝阳', 'ZhaoYang', 116.601144, 39.948574);
INSERT INTO `china_region` VALUES (1138, 2, 110100000000, 110106000000, '100000', '010', '丰台区', '丰台', '北京,丰台', 'FengTai', 116.287149, 39.858427);
INSERT INTO `china_region` VALUES (1559, 2, 110100000000, 110107000000, '100000', '010', '石景山区', '石景山', '北京,石景山', 'ShiJingShan', 116.222982, 39.906611);
INSERT INTO `china_region` VALUES (1719, 2, 110100000000, 110108000000, '100000', '010', '海淀区', '海淀', '北京,海淀', 'HaiDian', 116.329519, 39.972134);
INSERT INTO `china_region` VALUES (2413, 2, 110100000000, 110109000000, '102300', '010', '门头沟区', '门头沟', '北京,门头沟', 'MenTouGou', 116.102009, 39.940646);
INSERT INTO `china_region` VALUES (2728, 2, 110100000000, 110111000000, '102400', '010', '房山区', '房山', '北京,房山', 'FangShan', 116.143267, 39.749144);
INSERT INTO `china_region` VALUES (3376, 2, 110100000000, 110112000000, '101100', '010', '通州区', '通州', '北京,通州', 'TongZhou', 116.656435, 39.909946);
INSERT INTO `china_region` VALUES (4000, 2, 110100000000, 110113000000, '101300', '010', '顺义区', '顺义', '北京,顺义', 'ShunYi', 116.654561, 40.130347);
INSERT INTO `china_region` VALUES (4591, 2, 110100000000, 110114000000, '102200', '010', '昌平区', '昌平', '北京,昌平', 'ChangPing', 116.231204, 40.22066);
INSERT INTO `china_region` VALUES (5154, 2, 110100000000, 110115000000, '102600', '010', '大兴区', '大兴', '北京,大兴', 'DaXing', 116.341014, 39.784747);
INSERT INTO `china_region` VALUES (5960, 2, 110100000000, 110116000000, '101400', '010', '怀柔区', '怀柔', '北京,怀柔', 'HuaiRou', 116.642349, 40.315704);
INSERT INTO `china_region` VALUES (6298, 2, 110100000000, 110117000000, '101200', '010', '平谷区', '平谷', '北京,平谷', 'PingGu', 117.121383, 40.140701);
INSERT INTO `china_region` VALUES (6634, 2, 110100000000, 110118000000, '101599', '010', '密云区', '密云', '北京,密云', 'MiYun', 116.843177, 40.376834);
INSERT INTO `china_region` VALUES (7085, 2, 110100000000, 110119000000, '100062', '010', '延庆区', '延庆', '北京,延庆', 'YanQing', 115.974848, 40.456951);
INSERT INTO `china_region` VALUES (7527, 0, 0, 120000000000, '0', NULL, '天津市', '天津', '天津', 'TianJin', 117.200983, 39.084158);
INSERT INTO `china_region` VALUES (7528, 1, 120000000000, 120100000000, '300000', '022', '直辖区', '天津', '天津', 'TianJin', 117.200983, 39.084158);
INSERT INTO `china_region` VALUES (7529, 2, 120100000000, 120101000000, '300000', '022', '和平区', '和平', '天津,和平', 'HePing', 117.208125, 39.118897);
INSERT INTO `china_region` VALUES (7600, 2, 120100000000, 120102000000, '300000', '022', '河东区', '河东', '天津,河东', 'HeDong', 117.251587, 39.128291);
INSERT INTO `china_region` VALUES (7776, 2, 120100000000, 120103000000, '300000', '022', '河西区', '河西', '天津,河西', 'HeXi', 117.223372, 39.109563);
INSERT INTO `china_region` VALUES (7940, 2, 120100000000, 120104000000, '300000', '022', '南开区', '南开', '天津,南开', 'NanKai', 117.150738, 39.138203);
INSERT INTO `china_region` VALUES (8133, 2, 120100000000, 120105000000, '300000', '022', '河北区', '河北', '天津,河北', 'HeBei', 117.196648, 39.147869);
INSERT INTO `china_region` VALUES (8260, 2, 120100000000, 120106000000, '300000', '022', '红桥区', '红桥', '天津,红桥', 'HongQiao', 117.151533, 39.167345);
INSERT INTO `china_region` VALUES (8395, 2, 120100000000, 120110000000, '300000', '022', '东丽区', '东丽', '天津,东丽', 'DongLi', 117.314324, 39.086569);
INSERT INTO `china_region` VALUES (8557, 2, 120100000000, 120111000000, '300000', '022', '西青区', '西青', '天津,西青', 'XiQing', 117.013949, 39.141591);
INSERT INTO `china_region` VALUES (8859, 2, 120100000000, 120112000000, '300000', '022', '津南区', '津南', '天津,津南', 'JinNan', 117.391976, 38.984526);
INSERT INTO `china_region` VALUES (9151, 2, 120100000000, 120113000000, '300000', '022', '北辰区', '北辰', '天津,北辰', 'BeiChen', 117.139343, 39.217817);
INSERT INTO `china_region` VALUES (9437, 2, 120100000000, 120114000000, '301700', '022', '武清区', '武清', '天津,武清', 'WuQing', 117.044388, 39.384119);
INSERT INTO `china_region` VALUES (10199, 2, 120100000000, 120115000000, '301800', '022', '宝坻区', '宝坻', '天津,宝坻', 'BaoDi', 117.309863, 39.717379);
INSERT INTO `china_region` VALUES (11039, 2, 120100000000, 120116000000, '300450', '022', '滨海新区', '滨海', '天津,滨海', 'BinHai', 117.78067, 39.246083);
INSERT INTO `china_region` VALUES (11529, 2, 120100000000, 120117000000, '301599', '022', '宁河区', '宁河', '天津,宁河', 'NingHe', 117.826625, 39.329858);
INSERT INTO `china_region` VALUES (11864, 2, 120100000000, 120118000000, '300459', '022', '静海区', '静海', '天津,静海', 'JingHai', 116.97413, 38.947512);
INSERT INTO `china_region` VALUES (12326, 2, 120100000000, 120119000000, '301811', '022', '蓟州区', '蓟州', '天津,蓟州', 'JiZhou', 117.408307, 40.04606);
INSERT INTO `china_region` VALUES (13336, 0, 0, 130000000000, '0', NULL, '河北省', '河北', '河北', 'HeBei', 114.468664, 38.037057);
INSERT INTO `china_region` VALUES (13337, 1, 130000000000, 130100000000, '050000', '0311', '石家庄市', '石家庄', '河北,石家庄', 'ShiJiaZhuang', 114.514859, 38.042306);
INSERT INTO `china_region` VALUES (13338, 2, 130100000000, 130101000000, '050000', '0311', '市辖区', '石家庄', '河北,石家庄', 'ShiJiaZhuang', 114.514859, 38.042306);
INSERT INTO `china_region` VALUES (13339, 2, 130100000000, 130102000000, '050000', '0311', '长安区', '长安', '河北,石家庄,长安', 'ChangAn', 114.53906, 38.036654);
INSERT INTO `china_region` VALUES (13525, 2, 130100000000, 130104000000, '050000', '0311', '桥西区', '桥西', '河北,石家庄,桥西', 'QiaoXi', 114.461154, 38.004043);
INSERT INTO `china_region` VALUES (13684, 2, 130100000000, 130105000000, '050000', '0311', '新华区', '新华', '河北,石家庄,新华', 'XinHua', 114.463347, 38.05106);
INSERT INTO `china_region` VALUES (13816, 2, 130100000000, 130107000000, '050199', '0311', '井陉矿区', '井陉矿', '河北,石家庄,井陉矿', 'JingXingKuang', 114.514859, 38.042306);
INSERT INTO `china_region` VALUES (13873, 2, 130100000000, 130108000000, '050000', '0311', '裕华区', '裕华', '河北,石家庄,裕华', 'YuHua', 114.531362, 38.006453);
INSERT INTO `china_region` VALUES (13992, 2, 130100000000, 130109000000, '052165', '0311', '藁城区', '藁城', '河北,石家庄,藁城', 'GaoCheng', 114.847075, 38.021567);
INSERT INTO `china_region` VALUES (14245, 2, 130100000000, 130110000000, '050299', '0311', '鹿泉区', '鹿泉', '河北,石家庄,鹿泉', 'LuQuan', 114.313724, 38.085958);
INSERT INTO `china_region` VALUES (14491, 2, 130100000000, 130111000000, '051430', '0311', '栾城区', '栾城', '河北,石家庄,栾城', 'LuanCheng', 114.648318, 37.9002);
INSERT INTO `china_region` VALUES (14676, 2, 130100000000, 130121000000, '050100', '0311', '井陉县', '井陉', '河北,石家庄,井陉', 'JingXing', 114.14524, 38.032148);
INSERT INTO `china_region` VALUES (15016, 2, 130100000000, 130123000000, '050800', '0311', '正定县', '正定', '河北,石家庄,正定', 'ZhengDing', 114.570941, 38.146445);
INSERT INTO `china_region` VALUES (15214, 2, 130100000000, 130125000000, '050600', '0311', '行唐县', '行唐', '河北,石家庄,行唐', 'XingTang', 114.552737, 38.438411);
INSERT INTO `china_region` VALUES (15561, 2, 130100000000, 130126000000, '050500', '0311', '灵寿县', '灵寿', '河北,石家庄,灵寿', 'LingShou', 114.37614, 38.30611);
INSERT INTO `china_region` VALUES (15861, 2, 130100000000, 130127000000, '051330', '0311', '高邑县', '高邑', '河北,石家庄,高邑', 'GaoYi', 114.611433, 37.615159);
INSERT INTO `china_region` VALUES (15974, 2, 130100000000, 130128000000, '052500', '0311', '深泽县', '深泽', '河北,石家庄,深泽', 'ShenZe', 115.20091, 38.184072);
INSERT INTO `china_region` VALUES (16107, 2, 130100000000, 130129000000, '051230', '0311', '赞皇县', '赞皇', '河北,石家庄,赞皇', 'ZanHuang', 114.386155, 37.665576);
INSERT INTO `china_region` VALUES (16332, 2, 130100000000, 130130000000, '052400', '0311', '无极县', '无极', '河北,石家庄,无极', 'WuJi', 114.976337, 38.179141);
INSERT INTO `china_region` VALUES (16561, 2, 130100000000, 130131000000, '050400', '0311', '平山县', '平山', '河北,石家庄,平山', 'PingShan', 114.199134, 38.247144);
INSERT INTO `china_region` VALUES (17302, 2, 130100000000, 130132000000, '051130', '0311', '元氏县', '元氏', '河北,石家庄,元氏', 'YuanShi', 114.52558, 37.766651);
INSERT INTO `china_region` VALUES (17531, 2, 130100000000, 130133000000, '051530', '0311', '赵县', '赵县', '河北,石家庄,赵县', 'ZhaoXian', 114.776187, 37.756498);
INSERT INTO `china_region` VALUES (17824, 2, 130100000000, 130171000000, '050060', '0311', '石家庄高新技术产业开发区', '石家庄高', '河北,石家庄,石家庄高', 'ShiJiaZhuangGao', 114.469069, 38.008101);
INSERT INTO `china_region` VALUES (17874, 2, 130100000000, 130172000000, '050000', '0311', '石家庄循环化工园区', '石家庄循环化工园', '河北,石家庄,石家庄循环化工园', 'ShiJiaZhuangXunHuanHuaGongYuan', 114.69345, 37.99674);
INSERT INTO `china_region` VALUES (17889, 2, 130100000000, 130181000000, '052300', '0311', '辛集市', '辛集', '河北,石家庄,辛集', 'XinJi', 115.218057, 37.943315);
INSERT INTO `china_region` VALUES (18274, 2, 130100000000, 130183000000, '052200', '0311', '晋州市', '晋州', '河北,石家庄,晋州', 'JinZhou', 115.044185, 38.033629);
INSERT INTO `china_region` VALUES (18509, 2, 130100000000, 130184000000, '050700', '0311', '新乐市', '新乐', '河北,石家庄,新乐', 'XinLe', 114.684014, 38.343296);
INSERT INTO `china_region` VALUES (18700, 1, 130000000000, 130200000000, '063000', '0315', '唐山市', '唐山', '河北,唐山', 'TangShan', 118.180193, 39.630867);
INSERT INTO `china_region` VALUES (18701, 2, 130200000000, 130201000000, '063000', '0315', '市辖区', '唐山', '河北,唐山', 'TangShan', 118.180193, 39.630867);
INSERT INTO `china_region` VALUES (18702, 2, 130200000000, 130202000000, '063000', '0315', '路南区', '路南', '河北,唐山,路南', 'LuNan', 118.154354, 39.625059);
INSERT INTO `china_region` VALUES (18873, 2, 130200000000, 130203000000, '063000', '0315', '路北区', '路北', '河北,唐山,路北', 'LuBei', 118.200692, 39.624437);
INSERT INTO `china_region` VALUES (19131, 2, 130200000000, 130204000000, '063100', '0315', '古冶区', '古冶', '河北,唐山,古冶', 'GuYe', 118.447635, 39.733578);
INSERT INTO `china_region` VALUES (19344, 2, 130200000000, 130205000000, '063000', '0315', '开平区', '开平', '河北,唐山,开平', 'KaiPing', 118.261842, 39.671001);
INSERT INTO `china_region` VALUES (19533, 2, 130200000000, 130207000000, '063300', '0315', '丰南区', '丰南', '河北,唐山,丰南', 'FengNan', 118.085169, 39.576031);
INSERT INTO `china_region` VALUES (20034, 2, 130200000000, 130208000000, '063000', '0315', '丰润区', '丰润', '河北,唐山,丰润', 'FengRun', 118.162216, 39.832582);
INSERT INTO `china_region` VALUES (20595, 2, 130200000000, 130209000000, '063200', '0315', '曹妃甸区', '曹妃甸', '河北,唐山,曹妃甸', 'CaoFeiDian', 118.460379, 39.27307);
INSERT INTO `china_region` VALUES (20766, 2, 130200000000, 130224000000, '063500', '0315', '滦南县', '滦南', '河北,唐山,滦南', 'LuanNan', 118.682379, 39.518997);
INSERT INTO `china_region` VALUES (21393, 2, 130200000000, 130225000000, '063600', '0315', '乐亭县', '乐亭', '河北,唐山,乐亭', 'LeTing', 118.912571, 39.425608);
INSERT INTO `china_region` VALUES (21897, 2, 130200000000, 130227000000, '064300', '0315', '迁西县', '迁西', '河北,唐山,迁西', 'QianXi', 118.314715, 40.1415);
INSERT INTO `china_region` VALUES (22345, 2, 130200000000, 130229000000, '064100', '0315', '玉田县', '玉田', '河北,唐山,玉田', 'YuTian', 117.738658, 39.900401);
INSERT INTO `china_region` VALUES (23140, 2, 130200000000, 130271000000, '063299', '0315', '河北唐山芦台经济开发区', '河北唐山芦台经开区', '河北,唐山,唐山芦台经开区', 'HeBeiTangShanLuTaiJingKaiQu', 118.144879, 39.806215);
INSERT INTO `china_region` VALUES (23174, 2, 130200000000, 130272000000, '064303', '0315', '唐山市汉沽管理区', '唐山汉沽管理', '河北,唐山,唐山汉沽管理', 'TangShanHanGuGuanLi', 117.88353, 39.362495);
INSERT INTO `china_region` VALUES (23214, 2, 130200000000, 130273000000, '063799', '0315', '唐山高新技术产业开发区', '唐山高', '河北,唐山,唐山高', 'TangShanGao', 118.180193, 39.630867);
INSERT INTO `china_region` VALUES (23290, 2, 130200000000, 130274000000, '063611', '0315', '河北唐山海港经济开发区', '河北唐山海港经开区', '河北,唐山,唐山海港经开区', 'HeBeiTangShanHaiGangJingKaiQu', 119.003392, 39.231911);
INSERT INTO `china_region` VALUES (23360, 2, 130200000000, 130281000000, '064200', '0315', '遵化市', '遵化', '河北,唐山,遵化', 'ZunHua', 117.965892, 40.189202);
INSERT INTO `china_region` VALUES (24083, 2, 130200000000, 130283000000, '064400', '0315', '迁安市', '迁安', '河北,唐山,迁安', 'QianAn', 118.701144, 39.999175);
INSERT INTO `china_region` VALUES (24689, 2, 130200000000, 130284000000, '063799', '0315', '滦州市', '滦州', '河北,唐山,滦州', 'LuanZhou', 118.689775, 39.74038);
INSERT INTO `china_region` VALUES (25234, 1, 130000000000, 130300000000, '066000', '0335', '秦皇岛市', '秦皇岛', '河北,秦皇岛', 'QinHuangDao', 119.600492, 39.935385);
INSERT INTO `china_region` VALUES (25235, 2, 130300000000, 130301000000, '066000', '0335', '市辖区', '秦皇岛', '河北,秦皇岛', 'QinHuangDao', 119.600492, 39.935385);
INSERT INTO `china_region` VALUES (25236, 2, 130300000000, 130302000000, '066000', '0335', '海港区', '海港', '河北,秦皇岛,海港', 'HaiGang', 119.564962, 39.94756);
INSERT INTO `china_region` VALUES (25634, 2, 130300000000, 130303000000, '066200', '0335', '山海关区', '山海关', '河北,秦皇岛,山海关', 'ShanHaiGuan', 119.775799, 39.978849);
INSERT INTO `china_region` VALUES (25765, 2, 130300000000, 130304000000, '066100', '0335', '北戴河区', '北戴河', '河北,秦皇岛,北戴河', 'BeiDaiHe', 119.488914, 39.834751);
INSERT INTO `china_region` VALUES (25824, 2, 130300000000, 130306000000, '066399', '0335', '抚宁区', '抚宁', '河北,秦皇岛,抚宁', 'FuNing', 119.235739, 39.889241);
INSERT INTO `china_region` VALUES (26205, 2, 130300000000, 130321000000, '066500', '0335', '青龙满族自治县', '青龙', '河北,秦皇岛,青龙', 'QingLong', 118.949684, 40.407578);
INSERT INTO `china_region` VALUES (26638, 2, 130300000000, 130322000000, '066600', '0335', '昌黎县', '昌黎', '河北,秦皇岛,昌黎', 'ChangLi', 119.162694, 39.712813);
INSERT INTO `china_region` VALUES (27096, 2, 130300000000, 130324000000, '066400', '0335', '卢龙县', '卢龙', '河北,秦皇岛,卢龙', 'LuLong', 118.892986, 39.891947);
INSERT INTO `china_region` VALUES (27659, 2, 130300000000, 130371000000, '066000', '0335', '秦皇岛市经济技术开发区', '秦皇岛经开区', '河北,秦皇岛,秦皇岛经开区', 'QinHuangDaoJingKaiQu', 119.463801, 39.931654);
INSERT INTO `china_region` VALUES (27776, 2, 130300000000, 130372000000, '066100', '0335', '北戴河新区', '北戴河', '河北,秦皇岛,北戴河', 'BeiDaiHe', 119.473228, 39.826088);
INSERT INTO `china_region` VALUES (27841, 1, 130000000000, 130400000000, '056000', '0310', '邯郸市', '邯郸', '河北,邯郸', 'HanDan', 114.538961, 36.625657);
INSERT INTO `china_region` VALUES (27842, 2, 130400000000, 130401000000, '056000', '0310', '市辖区', '邯郸', '河北,邯郸', 'HanDan', 114.538961, 36.625657);
INSERT INTO `china_region` VALUES (27843, 2, 130400000000, 130402000000, '056000', '0310', '邯山区', '邯山', '河北,邯郸,邯山', 'HanShan', 114.490431, 36.580358);
INSERT INTO `china_region` VALUES (28049, 2, 130400000000, 130403000000, '056000', '0310', '丛台区', '丛台', '河北,邯郸,丛台', 'CongTai', 114.492897, 36.63641);
INSERT INTO `china_region` VALUES (28252, 2, 130400000000, 130404000000, '056000', '0310', '复兴区', '复兴', '河北,邯郸,复兴', 'FuXing', 114.462058, 36.639022);
INSERT INTO `china_region` VALUES (28378, 2, 130400000000, 130406000000, '056299', '0310', '峰峰矿区', '峰峰矿', '河北,邯郸,峰峰矿', 'FengFengKuang', 114.538961, 36.625657);
INSERT INTO `china_region` VALUES (28588, 2, 130400000000, 130407000000, '057550', '0310', '肥乡区', '肥乡', '河北,邯郸,肥乡', 'FeiXiang', 114.800166, 36.548132);
INSERT INTO `china_region` VALUES (28864, 2, 130400000000, 130408000000, '057150', '0310', '永年区', '永年', '河北,邯郸,永年', 'YongNian', 114.538961, 36.625657);
INSERT INTO `china_region` VALUES (29246, 2, 130400000000, 130423000000, '056600', '0310', '临漳县', '临漳', '河北,邯郸,临漳', 'LinZhang', 114.619544, 36.3353);
INSERT INTO `china_region` VALUES (29686, 2, 130400000000, 130424000000, '056700', '0310', '成安县', '成安', '河北,邯郸,成安', 'ChengAn', 114.670032, 36.444407);
INSERT INTO `china_region` VALUES (29939, 2, 130400000000, 130425000000, '056900', '0310', '大名县', '大名', '河北,邯郸,大名', 'DaMing', 115.147814, 36.285616);
INSERT INTO `china_region` VALUES (30611, 2, 130400000000, 130426000000, '056400', '0310', '涉县', '涉县', '河北,邯郸,涉县', 'SheXian', 113.691401, 36.584995);
INSERT INTO `china_region` VALUES (30943, 2, 130400000000, 130427000000, '056500', '0310', '磁县', '磁县', '河北,邯郸,磁县', 'CiXian', 114.373947, 36.374012);
INSERT INTO `china_region` VALUES (31214, 2, 130400000000, 130430000000, '057450', '0310', '邱县', '邱县', '河北,邯郸,邱县', 'QiuXian', 115.186792, 36.811133);
INSERT INTO `china_region` VALUES (31447, 2, 130400000000, 130431000000, '057350', '0310', '鸡泽县', '鸡泽', '河北,邯郸,鸡泽', 'JiZe', 114.878299, 36.92035);
INSERT INTO `china_region` VALUES (31626, 2, 130400000000, 130432000000, '057650', '0310', '广平县', '广平', '河北,邯郸,广平', 'GuangPing', 114.948607, 36.483484);
INSERT INTO `china_region` VALUES (31805, 2, 130400000000, 130433000000, '057750', '0310', '馆陶县', '馆陶', '河北,邯郸,馆陶', 'GuanTao', 115.282468, 36.547557);
INSERT INTO `china_region` VALUES (32091, 2, 130400000000, 130434000000, '056800', '0310', '魏县', '魏县', '河北,邯郸,魏县', 'WeiXian', 114.938976, 36.359861);
INSERT INTO `china_region` VALUES (32674, 2, 130400000000, 130435000000, '057250', '0310', '曲周县', '曲周', '河北,邯郸,曲周', 'QuZhou', 114.945131, 36.78017);
INSERT INTO `china_region` VALUES (33027, 2, 130400000000, 130471000000, '056000', '0310', '邯郸经济技术开发区', '邯郸经开区', '河北,邯郸,邯郸经开区', 'HanDanJingKaiQu', 114.490431, 36.580358);
INSERT INTO `china_region` VALUES (33144, 2, 130400000000, 130473000000, '056399', '0310', '邯郸冀南新区', '邯郸冀南', '河北,邯郸,邯郸冀南', 'HanDanJiNan', 114.490431, 36.580358);
INSERT INTO `china_region` VALUES (33297, 2, 130400000000, 130481000000, '056300', '0310', '武安市', '武安', '河北,邯郸,武安', 'WuAn', 114.203697, 36.696506);
INSERT INTO `china_region` VALUES (33837, 1, 130000000000, 130500000000, '054000', '0319', '邢台市', '邢台', '河北,邢台', 'XingTai', 114.504844, 37.070589);
INSERT INTO `china_region` VALUES (33838, 2, 130500000000, 130501000000, '054000', '0319', '市辖区', '邢台', '河北,邢台', 'XingTai', 114.504844, 37.070589);
INSERT INTO `china_region` VALUES (33839, 2, 130500000000, 130502000000, '054000', '0319', '桥东区', '桥东', '河北,邢台,桥东', 'QiaoDong', 114.492019, 37.061614);
INSERT INTO `china_region` VALUES (33985, 2, 130500000000, 130503000000, '054000', '0319', '桥西区', '桥西', '河北,邢台,桥西', 'QiaoXi', 114.468435, 37.059882);
INSERT INTO `china_region` VALUES (34116, 2, 130500000000, 130521000000, '054000', '0319', '邢台县', '邢台', '河北,邢台', 'XingTai', 114.507416, 37.072954);
INSERT INTO `china_region` VALUES (34653, 2, 130500000000, 130522000000, '054300', '0319', '临城县', '临城', '河北,邢台,临城', 'LinCheng', 114.498762, 37.444499);
INSERT INTO `china_region` VALUES (34882, 2, 130500000000, 130523000000, '054200', '0319', '内丘县', '内丘', '河北,邢台,内丘', 'NeiQiu', 114.512128, 37.286669);
INSERT INTO `china_region` VALUES (35206, 2, 130500000000, 130524000000, '055450', '0319', '柏乡县', '柏乡', '河北,邢台,柏乡', 'BaiXiang', 114.693426, 37.482423);
INSERT INTO `china_region` VALUES (35335, 2, 130500000000, 130525000000, '055350', '0319', '隆尧县', '隆尧', '河北,邢台,隆尧', 'LongYao', 114.770419, 37.350173);
INSERT INTO `china_region` VALUES (35627, 2, 130500000000, 130526000000, '055150', '0319', '任县', '任县', '河北,邢台,任县', 'RenXian', 114.671936, 37.120983);
INSERT INTO `china_region` VALUES (35831, 2, 130500000000, 130527000000, '054400', '0319', '南和县', '南和', '河北,邢台,南和', 'NanHe', 114.683762, 37.005041);
INSERT INTO `china_region` VALUES (36067, 2, 130500000000, 130528000000, '055550', '0319', '宁晋县', '宁晋', '河北,邢台,宁晋', 'NingJin', 114.919301, 37.619886);
INSERT INTO `china_region` VALUES (36463, 2, 130500000000, 130529000000, '055250', '0319', '巨鹿县', '巨鹿', '河北,邢台,巨鹿', 'JuLu', 115.037478, 37.221112);
INSERT INTO `china_region` VALUES (36765, 2, 130500000000, 130530000000, '051730', '0319', '新河县', '新河', '河北,邢台,新河', 'XinHe', 115.242014, 37.528712);
INSERT INTO `china_region` VALUES (36941, 2, 130500000000, 130531000000, '054600', '0319', '广宗县', '广宗', '河北,邢台,广宗', 'GuangZong', 115.142607, 37.07466);
INSERT INTO `china_region` VALUES (37163, 2, 130500000000, 130532000000, '054500', '0319', '平乡县', '平乡', '河北,邢台,平乡', 'PingXiang', 115.030076, 37.063148);
INSERT INTO `china_region` VALUES (37430, 2, 130500000000, 130533000000, '054700', '0319', '威县', '威县', '河北,邢台,威县', 'WeiXian', 115.266783, 36.975321);
INSERT INTO `china_region` VALUES (37978, 2, 130500000000, 130534000000, '054800', '0319', '清河县', '清河', '河北,邢台,清河', 'QingHe', 115.667576, 37.040087);
INSERT INTO `china_region` VALUES (38316, 2, 130500000000, 130535000000, '054900', '0319', '临西县', '临西', '河北,邢台,临西', 'LinXi', 115.501048, 36.870813);
INSERT INTO `china_region` VALUES (38633, 2, 130500000000, 130571000000, '054702', '0319', '河北邢台经济开发区', '河北邢台经开区', '河北,邢台,邢台经开区', 'HeBeiXingTaiJingKaiQu', 114.565733, 37.06169);
INSERT INTO `china_region` VALUES (38718, 2, 130500000000, 130581000000, '051800', '0319', '南宫市', '南宫', '河北,邢台,南宫', 'NanGong', 115.408748, 37.359264);
INSERT INTO `china_region` VALUES (39199, 2, 130500000000, 130582000000, '054100', '0319', '沙河市', '沙河', '河北,邢台,沙河', 'ShaHe', 114.503335, 36.854922);
INSERT INTO `china_region` VALUES (39476, 1, 130000000000, 130600000000, '071000', '0312', '保定市', '保定', '河北,保定', 'BaoDing', 115.464806, 38.873891);
INSERT INTO `china_region` VALUES (39477, 2, 130600000000, 130601000000, '071000', '0312', '市辖区', '保定', '河北,保定', 'BaoDing', 115.464806, 38.873891);
INSERT INTO `china_region` VALUES (39478, 2, 130600000000, 130602000000, '071023', '0312', '竞秀区', '竞秀', '河北,保定,竞秀', 'JingXiu', 115.458669, 38.877561);
INSERT INTO `china_region` VALUES (39648, 2, 130600000000, 130606000000, '071028', '0312', '莲池区', '莲池', '河北,保定,莲池', 'LianChi', 115.497342, 38.883209);
INSERT INTO `china_region` VALUES (39916, 2, 130600000000, 130607000000, '072150', '0312', '满城区', '满城', '河北,保定,满城', 'ManCheng', 115.322351, 38.948955);
INSERT INTO `china_region` VALUES (40131, 2, 130600000000, 130608000000, '071199', '0312', '清苑区', '清苑', '河北,保定,清苑', 'QingYuan', 115.489968, 38.765041);
INSERT INTO `china_region` VALUES (40429, 2, 130600000000, 130609000000, '072550', '0312', '徐水区', '徐水', '河北,保定,徐水', 'XuShui', 115.62441, 39.026233);
INSERT INTO `china_region` VALUES (40776, 2, 130600000000, 130623000000, '074100', '0312', '涞水县', '涞水', '河北,保定,涞水', 'LaiShui', 115.713905, 39.394317);
INSERT INTO `china_region` VALUES (41085, 2, 130600000000, 130624000000, '073200', '0312', '阜平县', '阜平', '河北,保定,阜平', 'FuPing', 114.195104, 38.849152);
INSERT INTO `china_region` VALUES (41312, 2, 130600000000, 130626000000, '072650', '0312', '定兴县', '定兴', '河北,保定,定兴', 'DingXing', 115.808175, 39.263018);
INSERT INTO `china_region` VALUES (41611, 2, 130600000000, 130627000000, '072350', '0312', '唐县', '唐县', '河北,保定,唐县', 'TangXian', 114.982972, 38.748204);
INSERT INTO `china_region` VALUES (41997, 2, 130600000000, 130628000000, '071500', '0312', '高阳县', '高阳', '河北,保定,高阳', 'GaoYang', 115.778965, 38.700088);
INSERT INTO `china_region` VALUES (42177, 2, 130600000000, 130629000000, '071700', '0312', '容城县', '容城', '河北,保定,容城', 'RongCheng', 115.861657, 39.042784);
INSERT INTO `china_region` VALUES (42313, 2, 130600000000, 130630000000, '074300', '0312', '涞源县', '涞源', '河北,保定,涞源', 'LaiYuan', 114.694284, 39.360247);
INSERT INTO `china_region` VALUES (42626, 2, 130600000000, 130631000000, '072450', '0312', '望都县', '望都', '河北,保定,望都', 'WangDu', 115.154511, 38.695736);
INSERT INTO `china_region` VALUES (42790, 2, 130600000000, 130632000000, '071600', '0312', '安新县', '安新', '河北,保定,安新', 'AnXin', 115.935553, 38.935364);
INSERT INTO `china_region` VALUES (43032, 2, 130600000000, 130633000000, '074200', '0312', '易县', '易县', '河北,保定,易县', 'YiXian', 115.497509, 39.349398);
INSERT INTO `china_region` VALUES (43530, 2, 130600000000, 130634000000, '073100', '0312', '曲阳县', '曲阳', '河北,保定,曲阳', 'QuYang', 114.74497, 38.622242);
INSERT INTO `china_region` VALUES (43927, 2, 130600000000, 130635000000, '071400', '0312', '蠡县', '蠡县', '河北,保定,蠡县', 'LiXian', 115.583855, 38.488056);
INSERT INTO `china_region` VALUES (44179, 2, 130600000000, 130636000000, '072250', '0312', '顺平县', '顺平', '河北,保定,顺平', 'ShunPing', 115.13547, 38.837487);
INSERT INTO `china_region` VALUES (44432, 2, 130600000000, 130637000000, '071300', '0312', '博野县', '博野', '河北,保定,博野', 'BoYe', 115.46438, 38.457364);
INSERT INTO `china_region` VALUES (44578, 2, 130600000000, 130638000000, '071800', '0312', '雄县', '雄县', '河北,保定,雄县', 'XiongXian', 116.10865, 38.99455);
INSERT INTO `china_region` VALUES (44890, 2, 130600000000, 130671000000, '071599', '0312', '保定高新技术产业开发区', '保定高', '河北,保定,保定高', 'BaoDingGao', 115.464806, 38.873891);
INSERT INTO `china_region` VALUES (44932, 2, 130600000000, 130672000000, '074004', '0312', '保定白沟新城', '保定白沟新城', '河北,保定,保定白沟新城', 'BaoDingBaiGouXinCheng', 116.045066, 39.128227);
INSERT INTO `china_region` VALUES (44967, 2, 130600000000, 130681000000, '072750', '0312', '涿州市', '涿州', '河北,保定,涿州', 'ZhuoZhou', 115.974422, 39.485283);
INSERT INTO `china_region` VALUES (45431, 2, 130600000000, 130682000000, '073000', '0312', '定州市', '定州', '河北,保定,定州', 'DingZhou', 114.990159, 38.516174);
INSERT INTO `china_region` VALUES (45999, 2, 130600000000, 130683000000, '071200', '0312', '安国市', '安国', '河北,保定,安国', 'AnGuo', 115.326647, 38.41844);
INSERT INTO `china_region` VALUES (46218, 2, 130600000000, 130684000000, '074000', '0312', '高碑店市', '高碑店', '河北,保定,高碑店', 'GaoBeiDian', 115.873758, 39.326521);
INSERT INTO `china_region` VALUES (46676, 1, 130000000000, 130700000000, '075000', '0313', '张家口市', '张家口', '河北,张家口', 'ZhangJiaKou', 114.887543, 40.824418);
INSERT INTO `china_region` VALUES (46677, 2, 130700000000, 130701000000, '075000', '0313', '市辖区', '张家口', '河北,张家口', 'ZhangJiaKou', 114.887543, 40.824418);
INSERT INTO `china_region` VALUES (46678, 2, 130700000000, 130702000000, '075000', '0313', '桥东区', '桥东', '河北,张家口,桥东', 'QiaoDong', 114.894341, 40.788457);
INSERT INTO `china_region` VALUES (46780, 2, 130700000000, 130703000000, '075000', '0313', '桥西区', '桥西', '河北,张家口,桥西', 'QiaoXi', 114.869407, 40.819564);
INSERT INTO `china_region` VALUES (46850, 2, 130700000000, 130705000000, '075000', '0313', '宣化区', '宣化', '河北,张家口,宣化', 'XuanHua', 115.09951, 40.608726);
INSERT INTO `china_region` VALUES (47241, 2, 130700000000, 130706000000, '075300', '0313', '下花园区', '下花园', '河北,张家口,下花园', 'XiaHuaYuan', 115.287352, 40.502652);
INSERT INTO `china_region` VALUES (47307, 2, 130700000000, 130708000000, '076250', '0313', '万全区', '万全', '河北,张家口,万全', 'WanQuan', 114.74056, 40.766898);
INSERT INTO `china_region` VALUES (47506, 2, 130700000000, 130709000000, '076350', '0313', '崇礼区', '崇礼', '河北,张家口,崇礼', 'ChongLi', 115.282669, 40.974676);
INSERT INTO `china_region` VALUES (47734, 2, 130700000000, 130722000000, '076450', '0313', '张北县', '张北', '河北,张家口,张北', 'ZhangBei', 114.720086, 41.158557);
INSERT INTO `china_region` VALUES (48129, 2, 130700000000, 130723000000, '076650', '0313', '康保县', '康保', '河北,张家口,康保', 'KangBao', 114.600404, 41.852368);
INSERT INTO `china_region` VALUES (48482, 2, 130700000000, 130724000000, '076550', '0313', '沽源县', '沽源', '河北,张家口,沽源', 'GuYuan', 115.688692, 41.669668);
INSERT INTO `china_region` VALUES (48730, 2, 130700000000, 130725000000, '076750', '0313', '尚义县', '尚义', '河北,张家口,尚义', 'ShangYi', 113.969619, 41.076227);
INSERT INTO `china_region` VALUES (48923, 2, 130700000000, 130726000000, '075700', '0313', '蔚县', '蔚县', '河北,张家口,蔚县', 'YuXian', 114.588903, 39.840843);
INSERT INTO `china_region` VALUES (49507, 2, 130700000000, 130727000000, '075800', '0313', '阳原县', '阳原', '河北,张家口,阳原', 'YangYuan', 114.150388, 40.103742);
INSERT INTO `china_region` VALUES (49831, 2, 130700000000, 130728000000, '076150', '0313', '怀安县', '怀安', '河北,张家口,怀安', 'HuaiAn', 114.385791, 40.674193);
INSERT INTO `china_region` VALUES (50126, 2, 130700000000, 130730000000, '075400', '0313', '怀来县', '怀来', '河北,张家口,怀来', 'HuaiLai', 115.517862, 40.415343);
INSERT INTO `china_region` VALUES (50449, 2, 130700000000, 130731000000, '075600', '0313', '涿鹿县', '涿鹿', '河北,张家口,涿鹿', 'ZhuoLu', 115.205345, 40.379563);
INSERT INTO `china_region` VALUES (50849, 2, 130700000000, 130732000000, '075500', '0313', '赤城县', '赤城', '河北,张家口,赤城', 'ChiCheng', 115.831499, 40.912921);
INSERT INTO `china_region` VALUES (51308, 2, 130700000000, 130771000000, '075000', '0313', '张家口经济开发区', '张家口经开区', '河北,张家口,张家口经开区', 'ZhangJiaKouJingKaiQu', 114.897535, 40.825959);
INSERT INTO `china_region` VALUES (51367, 2, 130700000000, 130772000000, '076481', '0313', '张家口市察北管理区', '张家口察北管理', '河北,张家口,张家口察北管理', 'ZhangJiaKouChaBeiGuanLi', 114.943873, 41.405811);
INSERT INTO `china_region` VALUES (51398, 2, 130700000000, 130773000000, '076550', '0313', '张家口市塞北管理区', '张家口塞北管理', '河北,张家口,张家口塞北管理', 'ZhangJiaKouSaiBeiGuanLi', 115.816574, 41.871622);
INSERT INTO `china_region` VALUES (51415, 1, 130000000000, 130800000000, '067000', '0314', '承德市', '承德', '河北,承德', 'ChengDe', 117.96241, 40.954071);
INSERT INTO `china_region` VALUES (51416, 2, 130800000000, 130801000000, '067000', '0314', '市辖区', '承德', '河北,承德', 'ChengDe', 117.96241, 40.954071);
INSERT INTO `china_region` VALUES (51417, 2, 130800000000, 130802000000, '067000', '0314', '双桥区', '双桥', '河北,承德,双桥', 'ShuangQiao', 117.943348, 40.97465);
INSERT INTO `china_region` VALUES (51548, 2, 130800000000, 130803000000, '067000', '0314', '双滦区', '双滦', '河北,承德,双滦', 'ShuangLuan', 117.799912, 40.959196);
INSERT INTO `china_region` VALUES (51652, 2, 130800000000, 130804000000, '067200', '0314', '鹰手营子矿区', '鹰手营子矿', '河北,承德,鹰手营子矿', 'YingShouYingZiKuang', 117.661156, 40.546956);
INSERT INTO `china_region` VALUES (51684, 2, 130800000000, 130821000000, '067400', '0314', '承德县', '承德', '河北,承德', 'ChengDe', 118.173825, 40.768238);
INSERT INTO `china_region` VALUES (52094, 2, 130800000000, 130822000000, '067300', '0314', '兴隆县', '兴隆', '河北,承德,兴隆', 'XingLong', 117.500558, 40.417358);
INSERT INTO `china_region` VALUES (52412, 2, 130800000000, 130824000000, '068250', '0314', '滦平县', '滦平', '河北,承德,滦平', 'LuanPing', 117.332801, 40.941482);
INSERT INTO `china_region` VALUES (52647, 2, 130800000000, 130825000000, '068150', '0314', '隆化县', '隆化', '河北,承德,隆化', 'LongHua', 117.738938, 41.313791);
INSERT INTO `china_region` VALUES (53036, 2, 130800000000, 130826000000, '068350', '0314', '丰宁满族自治县', '丰宁', '河北,承德,丰宁', 'FengNing', 116.645988, 41.208949);
INSERT INTO `china_region` VALUES (53383, 2, 130800000000, 130827000000, '067600', '0314', '宽城满族自治县', '宽城', '河北,承德,宽城', 'KuanCheng', 118.485313, 40.611391);
INSERT INTO `china_region` VALUES (53612, 2, 130800000000, 130828000000, '068450', '0314', '围场满族蒙古族自治县', '围场', '河北,承德,围场', 'WeiChang', 117.760159, 41.938529);
INSERT INTO `china_region` VALUES (53973, 2, 130800000000, 130871000000, '067412', '0314', '承德高新技术产业开发区', '承德高', '河北,承德,承德高', 'ChengDeGao', 118.173825, 40.768238);
INSERT INTO `china_region` VALUES (54027, 2, 130800000000, 130881000000, '067500', '0314', '平泉市', '平泉', '河北,承德,平泉', 'PingQuan', 117.96241, 40.954071);
INSERT INTO `china_region` VALUES (54297, 1, 130000000000, 130900000000, '061000', '0317', '沧州市', '沧州', '河北,沧州', 'CangZhou', 116.838834, 38.304477);
INSERT INTO `china_region` VALUES (54298, 2, 130900000000, 130901000000, '061000', '0317', '市辖区', '沧州', '河北,沧州', 'CangZhou', 116.838834, 38.304477);
INSERT INTO `china_region` VALUES (54299, 2, 130900000000, 130902000000, '061000', '0317', '新华区', '新华', '河北,沧州,新华', 'XinHua', 116.866284, 38.314416);
INSERT INTO `china_region` VALUES (54372, 2, 130900000000, 130903000000, '061000', '0317', '运河区', '运河', '河北,沧州,运河', 'YunHe', 116.832276, 38.310143);
INSERT INTO `china_region` VALUES (54505, 2, 130900000000, 130921000000, '061000', '0317', '沧县', '沧县', '河北,沧州,沧县', 'CangXian', 117.007478, 38.219856);
INSERT INTO `china_region` VALUES (55039, 2, 130900000000, 130922000000, '062650', '0317', '青县', '青县', '河北,沧州,青县', 'QingXian', 116.804306, 38.583021);
INSERT INTO `china_region` VALUES (55414, 2, 130900000000, 130923000000, '061600', '0317', '东光县', '东光', '河北,沧州,东光', 'DongGuang', 116.537067, 37.888248);
INSERT INTO `china_region` VALUES (55881, 2, 130900000000, 130924000000, '061200', '0317', '海兴县', '海兴', '河北,沧州,海兴', 'HaiXing', 117.496606, 38.141582);
INSERT INTO `china_region` VALUES (56096, 2, 130900000000, 130925000000, '061300', '0317', '盐山县', '盐山', '河北,沧州,盐山', 'YanShan', 117.230603, 38.058088);
INSERT INTO `china_region` VALUES (56563, 2, 130900000000, 130926000000, '062350', '0317', '肃宁县', '肃宁', '河北,沧州,肃宁', 'SuNing', 115.829758, 38.422802);
INSERT INTO `china_region` VALUES (56833, 2, 130900000000, 130927000000, '061500', '0317', '南皮县', '南皮', '河北,沧州,南皮', 'NanPi', 116.708104, 38.038584);
INSERT INTO `china_region` VALUES (57161, 2, 130900000000, 130928000000, '061800', '0317', '吴桥县', '吴桥', '河北,沧州,吴桥', 'WuQiao', 116.391508, 37.627661);
INSERT INTO `china_region` VALUES (57655, 2, 130900000000, 130929000000, '062250', '0317', '献县', '献县', '河北,沧州,献县', 'XianXian', 116.122802, 38.190144);
INSERT INTO `china_region` VALUES (58188, 2, 130900000000, 130930000000, '061400', '0317', '孟村回族自治县', '孟村', '河北,沧州,孟村', 'MengCun', 117.104298, 38.053409);
INSERT INTO `china_region` VALUES (58323, 2, 130900000000, 130971000000, '061001', '0317', '河北沧州经济开发区', '河北沧州经开区', '河北,沧州,沧州经开区', 'HeBeiCangZhouJingKaiQu', 116.940938, 38.283015);
INSERT INTO `china_region` VALUES (58333, 2, 130900000000, 130972000000, '061729', '0317', '沧州高新技术产业开发区', '沧州高', '河北,沧州,沧州高', 'CangZhouGao', 116.810775, 38.338224);
INSERT INTO `china_region` VALUES (58343, 2, 130900000000, 130973000000, '061017', '0317', '沧州渤海新区', '沧州渤海', '河北,沧州,沧州渤海', 'CangZhouBoHai', 117.778136, 38.270257);
INSERT INTO `china_region` VALUES (58428, 2, 130900000000, 130981000000, '062150', '0317', '泊头市', '泊头', '河北,沧州,泊头', 'PoTou', 116.578368, 38.083437);
INSERT INTO `china_region` VALUES (59155, 2, 130900000000, 130982000000, '062550', '0317', '任丘市', '任丘', '河北,沧州,任丘', 'RenQiu', 116.082918, 38.683592);
INSERT INTO `china_region` VALUES (59606, 2, 130900000000, 130983000000, '061100', '0317', '黄骅市', '黄骅', '河北,沧州,黄骅', 'HuangHua', 117.330048, 38.371383);
INSERT INTO `china_region` VALUES (59979, 2, 130900000000, 130984000000, '062450', '0317', '河间市', '河间', '河北,沧州,河间', 'HeJian', 116.099518, 38.446624);
INSERT INTO `china_region` VALUES (60642, 1, 130000000000, 131000000000, '065000', '0316', '廊坊市', '廊坊', '河北,廊坊', 'LangFang', 116.683752, 39.538047);
INSERT INTO `china_region` VALUES (60643, 2, 131000000000, 131001000000, '065000', '0316', '市辖区', '廊坊', '河北,廊坊', 'LangFang', 116.683752, 39.538047);
INSERT INTO `china_region` VALUES (60644, 2, 131000000000, 131002000000, '065000', '0316', '安次区', '安次', '河北,廊坊,安次', 'AnCi', 116.694544, 39.502569);
INSERT INTO `china_region` VALUES (60981, 2, 131000000000, 131003000000, '065000', '0316', '广阳区', '广阳', '河北,廊坊,广阳', 'GuangYang', 116.71069, 39.522786);
INSERT INTO `china_region` VALUES (61224, 2, 131000000000, 131022000000, '065500', '0316', '固安县', '固安', '河北,廊坊,固安', 'GuAn', 116.298657, 39.438214);
INSERT INTO `china_region` VALUES (61679, 2, 131000000000, 131023000000, '065600', '0316', '永清县', '永清', '河北,廊坊,永清', 'YongQing', 116.499028, 39.321794);
INSERT INTO `china_region` VALUES (62091, 2, 131000000000, 131024000000, '065400', '0316', '香河县', '香河', '河北,廊坊,香河', 'XiangHe', 117.006093, 39.761424);
INSERT INTO `china_region` VALUES (62418, 2, 131000000000, 131025000000, '065900', '0316', '大城县', '大城', '河北,廊坊,大城', 'DaiCheng', 116.653794, 38.705449);
INSERT INTO `china_region` VALUES (62836, 2, 131000000000, 131026000000, '065800', '0316', '文安县', '文安', '河北,廊坊,文安', 'WenAn', 116.457858, 38.873281);
INSERT INTO `china_region` VALUES (63242, 2, 131000000000, 131028000000, '065300', '0316', '大厂回族自治县', '大厂', '河北,廊坊,大厂', 'DaChang', 116.989574, 39.886547);
INSERT INTO `china_region` VALUES (63371, 2, 131000000000, 131071000000, '065701', '0316', '廊坊经济技术开发区', '廊坊经开区', '河北,廊坊,廊坊经开区', 'LangFangJingKaiQu', 116.758484, 39.566781);
INSERT INTO `china_region` VALUES (63397, 2, 131000000000, 131081000000, '065700', '0316', '霸州市', '霸州', '河北,廊坊,霸州', 'BaZhou', 116.391386, 39.125898);
INSERT INTO `china_region` VALUES (63804, 2, 131000000000, 131082000000, '065200', '0316', '三河市', '三河', '河北,廊坊,三河', 'SanHe', 117.078295, 39.982718);
INSERT INTO `china_region` VALUES (64297, 1, 130000000000, 131100000000, '053000', '0318', '衡水市', '衡水', '河北,衡水', 'HengShui', 115.670177, 37.73892);
INSERT INTO `china_region` VALUES (64298, 2, 131100000000, 131101000000, '053000', '0318', '市辖区', '衡水', '河北,衡水', 'HengShui', 115.670177, 37.73892);
INSERT INTO `china_region` VALUES (64299, 2, 131100000000, 131102000000, '053000', '0318', '桃城区', '桃城', '河北,衡水,桃城', 'TaoCheng', 115.675422, 37.735369);
INSERT INTO `china_region` VALUES (64580, 2, 131100000000, 131103000000, '053299', '0318', '冀州区', '冀州', '河北,衡水,冀州', 'JiZhou', 115.579334, 37.550821);
INSERT INTO `china_region` VALUES (64973, 2, 131100000000, 131121000000, '053100', '0318', '枣强县', '枣强', '河北,衡水,枣强', 'ZaoQiang', 115.72426, 37.513417);
INSERT INTO `china_region` VALUES (65544, 2, 131100000000, 131122000000, '053400', '0318', '武邑县', '武邑', '河北,衡水,武邑', 'WuYi', 115.887655, 37.801658);
INSERT INTO `china_region` VALUES (66076, 2, 131100000000, 131123000000, '053300', '0318', '武强县', '武强', '河北,衡水,武强', 'WuQiang', 115.982461, 38.041368);
INSERT INTO `china_region` VALUES (66324, 2, 131100000000, 131124000000, '053900', '0318', '饶阳县', '饶阳', '河北,衡水,饶阳', 'RaoYang', 115.725833, 38.235892);
INSERT INTO `china_region` VALUES (66532, 2, 131100000000, 131125000000, '053600', '0318', '安平县', '安平', '河北,衡水,安平', 'AnPing', 115.519216, 38.23451);
INSERT INTO `china_region` VALUES (66773, 2, 131100000000, 131126000000, '253800', '0318', '故城县', '故城', '河北,衡水,故城', 'GuCheng', 115.965874, 37.34741);
INSERT INTO `china_region` VALUES (67325, 2, 131100000000, 131127000000, '053500', '0318', '景县', '景县', '河北,衡水,景县', 'JingXian', 116.270648, 37.69229);
INSERT INTO `china_region` VALUES (68199, 2, 131100000000, 131128000000, '053700', '0318', '阜城县', '阜城', '河北,衡水,阜城', 'FuCheng', 116.144418, 37.868872);
INSERT INTO `china_region` VALUES (68820, 2, 131100000000, 131171000000, '053514', '0318', '河北衡水高新技术产业开发区', '河北衡水高', '河北,衡水,衡水高', 'HeBeiHengShuiGao', 115.670177, 37.73892);
INSERT INTO `china_region` VALUES (68948, 2, 131100000000, 131172000000, '053000', '0318', '衡水滨湖新区', '衡水滨湖', '河北,衡水,衡水滨湖', 'HengShuiBinHu', 115.652348, 37.64275);
INSERT INTO `china_region` VALUES (69026, 2, 131100000000, 131182000000, '052800', '0318', '深州市', '深州', '河北,衡水,深州', 'ShenZhou', 115.559574, 38.001536);
INSERT INTO `china_region` VALUES (69516, 0, 0, 140000000000, '0', NULL, '山西省', '山西', '山西', 'ShanXi', 112.562398, 37.873531);
INSERT INTO `china_region` VALUES (69517, 1, 140000000000, 140100000000, '030000', '0351', '太原市', '太原', '山西,太原', 'TaiYuan', 112.548879, 37.87059);
INSERT INTO `china_region` VALUES (69518, 2, 140100000000, 140101000000, '030000', '0351', '市辖区', '太原', '山西,太原', 'TaiYuan', 112.548879, 37.87059);
INSERT INTO `china_region` VALUES (69519, 2, 140100000000, 140105000000, '030000', '0351', '小店区', '小店', '山西,太原,小店', 'XiaoDian', 112.564306, 37.742941);
INSERT INTO `china_region` VALUES (69677, 2, 140100000000, 140106000000, '030000', '0351', '迎泽区', '迎泽', '山西,太原,迎泽', 'YingZe', 112.5634, 37.863451);
INSERT INTO `china_region` VALUES (69799, 2, 140100000000, 140107000000, '030000', '0351', '杏花岭区', '杏花岭', '山西,太原,杏花岭', 'XingHuaLing', 112.570605, 37.893955);
INSERT INTO `china_region` VALUES (69960, 2, 140100000000, 140108000000, '030000', '0351', '尖草坪区', '尖草坪', '山西,太原,尖草坪', 'JianCaoPing', 112.486691, 37.940387);
INSERT INTO `china_region` VALUES (70126, 2, 140100000000, 140109000000, '030000', '0351', '万柏林区', '万柏林', '山西,太原,万柏林', 'WanBoLin', 112.515748, 37.859447);
INSERT INTO `china_region` VALUES (70296, 2, 140100000000, 140110000000, '030000', '0351', '晋源区', '晋源', '山西,太原,晋源', 'JinYuan', 112.47794, 37.715193);
INSERT INTO `china_region` VALUES (70425, 2, 140100000000, 140121000000, '030400', '0351', '清徐县', '清徐', '山西,太原,清徐', 'QingXu', 112.358667, 37.607443);
INSERT INTO `china_region` VALUES (70635, 2, 140100000000, 140122000000, '030100', '0351', '阳曲县', '阳曲', '山西,太原,阳曲', 'YangQu', 112.672953, 38.058489);
INSERT INTO `china_region` VALUES (70774, 2, 140100000000, 140123000000, '030300', '0351', '娄烦县', '娄烦', '山西,太原,娄烦', 'LouFan', 111.797083, 38.067932);
INSERT INTO `china_region` VALUES (70932, 2, 140100000000, 140171000000, '030000', '0351', '山西转型综合改革示范区', '山西示范', '山西,太原,示范', 'ShanXiShiFan', 112.548879, 37.87059);
INSERT INTO `china_region` VALUES (70986, 2, 140100000000, 140181000000, '030200', '0351', '古交市', '古交', '山西,太原,古交', 'GuJiao', 112.175875, 37.907109);
INSERT INTO `china_region` VALUES (71170, 1, 140000000000, 140200000000, '037000', '0352', '大同市', '大同', '山西,大同', 'DaTong', 113.300129, 40.076762);
INSERT INTO `china_region` VALUES (71171, 2, 140200000000, 140201000000, '037300', '0352', '市辖区', '大同', '山西,大同', 'DaTong', 113.61244, 40.040295);
INSERT INTO `china_region` VALUES (71172, 2, 140200000000, 140212000000, '037000', '0352', '新荣区', '新荣', '山西,大同,新荣', 'XinRong', 113.140005, 40.255866);
INSERT INTO `china_region` VALUES (71330, 2, 140200000000, 140213000000, '037599', '0352', '平城区', '平城', '山西,大同,平城', 'PingCheng', 113.61244, 40.040295);
INSERT INTO `china_region` VALUES (71545, 2, 140200000000, 140214000000, '037007', '0352', '云冈区', '云冈', '山西,大同,云冈', 'YunGang', 113.61244, 40.040295);
INSERT INTO `china_region` VALUES (71840, 2, 140200000000, 140215000000, '038399', '0352', '云州区', '云州', '山西,大同,云州', 'YunZhou', 113.61244, 40.040295);
INSERT INTO `china_region` VALUES (72032, 2, 140200000000, 140221000000, '038100', '0352', '阳高县', '阳高', '山西,大同,阳高', 'YangGao', 113.748945, 40.36106);
INSERT INTO `china_region` VALUES (72313, 2, 140200000000, 140222000000, '038200', '0352', '天镇县', '天镇', '山西,大同,天镇', 'TianZhen', 114.090867, 40.420237);
INSERT INTO `china_region` VALUES (72566, 2, 140200000000, 140223000000, '037500', '0352', '广灵县', '广灵', '山西,大同,广灵', 'GuangLing', 114.274025, 39.761749);
INSERT INTO `china_region` VALUES (72731, 2, 140200000000, 140224000000, '034400', '0352', '灵丘县', '灵丘', '山西,大同,灵丘', 'LingQiu', 114.23435, 39.442406);
INSERT INTO `china_region` VALUES (73006, 2, 140200000000, 140225000000, '037400', '0352', '浑源县', '浑源', '山西,大同,浑源', 'HunYuan', 113.699475, 39.693407);
INSERT INTO `china_region` VALUES (73335, 2, 140200000000, 140226000000, '037100', '0352', '左云县', '左云', '山西,大同,左云', 'ZuoYun', 112.703008, 40.013442);
INSERT INTO `china_region` VALUES (73580, 2, 140200000000, 140271000000, '037300', '0352', '山西大同经济开发区', '山西大同经开区', '山西,大同,大同经开区', 'ShanXiDaTongJingKaiQu', 113.39743, 40.073892);
INSERT INTO `china_region` VALUES (73590, 1, 140000000000, 140300000000, '045000', '0353', '阳泉市', '阳泉', '山西,阳泉', 'YangQuan', 113.580519, 37.856971);
INSERT INTO `china_region` VALUES (73591, 2, 140300000000, 140301000000, '045000', '0353', '市辖区', '阳泉', '山西,阳泉', 'YangQuan', 113.580519, 37.856971);
INSERT INTO `china_region` VALUES (73592, 2, 140300000000, 140302000000, '045000', '0353', '城区', '城区', '山西,阳泉,城区', 'ChengQu', 113.60067, 37.847437);
INSERT INTO `china_region` VALUES (73664, 2, 140300000000, 140303000000, '045000', '0353', '矿区', '矿区', '山西,阳泉,矿区', 'KuangQu', 113.580519, 37.856971);
INSERT INTO `china_region` VALUES (73733, 2, 140300000000, 140311000000, '045000', '0353', '郊区', '郊区', '山西,阳泉,郊区', 'JiaoQu', 113.594164, 37.944679);
INSERT INTO `china_region` VALUES (73920, 2, 140300000000, 140321000000, '045200', '0353', '平定县', '平定', '山西,阳泉,平定', 'PingDing', 113.657841, 37.786653);
INSERT INTO `china_region` VALUES (74258, 2, 140300000000, 140322000000, '045100', '0353', '盂县', '盂县', '山西,阳泉,盂县', 'YuXian', 113.41233, 38.085619);
INSERT INTO `china_region` VALUES (74716, 1, 140000000000, 140400000000, '046000', '0355', '长治市', '长治', '山西,长治', 'ChangZhi', 113.116255, 36.195386);
INSERT INTO `china_region` VALUES (74717, 2, 140400000000, 140401000000, '046000', '0355', '市辖区', '长治', '山西,长治', 'ChangZhi', 113.116255, 36.195386);
INSERT INTO `china_region` VALUES (74718, 2, 140400000000, 140403000000, '047599', '0355', '潞州区', '潞州', '山西,长治,潞州', 'LuZhou', 113.116255, 36.195386);
INSERT INTO `china_region` VALUES (74975, 2, 140400000000, 140404000000, '046000', '0355', '上党区', '上党', '山西,长治,上党', 'ShangDang', 113.11121, 36.187185);
INSERT INTO `china_region` VALUES (75252, 2, 140400000000, 140405000000, '046100', '0355', '屯留区', '屯留', '山西,长治,屯留', 'TunLiu', 112.892151, 36.315929);
INSERT INTO `china_region` VALUES (75564, 2, 140400000000, 140406000000, '047500', '0355', '潞城区', '潞城', '山西,长治,潞城', 'LuCheng', 113.228852, 36.334104);
INSERT INTO `china_region` VALUES (75784, 2, 140400000000, 140423000000, '046200', '0355', '襄垣县', '襄垣', '山西,长治,襄垣', 'XiangYuan', 113.051491, 36.535817);
INSERT INTO `china_region` VALUES (76130, 2, 140400000000, 140425000000, '047400', '0355', '平顺县', '平顺', '山西,长治,平顺', 'PingShun', 113.435961, 36.200179);
INSERT INTO `china_region` VALUES (76410, 2, 140400000000, 140426000000, '047600', '0355', '黎城县', '黎城', '山西,长治,黎城', 'LiCheng', 113.386544, 36.503621);
INSERT INTO `china_region` VALUES (76675, 2, 140400000000, 140427000000, '047300', '0355', '壶关县', '壶关', '山西,长治,壶关', 'HuGuan', 113.207049, 36.115449);
INSERT INTO `china_region` VALUES (77081, 2, 140400000000, 140428000000, '046600', '0355', '长子县', '长子', '山西,长治,长子', 'ZhangZi', 112.8779, 36.122334);
INSERT INTO `china_region` VALUES (77502, 2, 140400000000, 140429000000, '046300', '0355', '武乡县', '武乡', '山西,长治,武乡', 'WuXiang', 112.864562, 36.837625);
INSERT INTO `china_region` VALUES (77851, 2, 140400000000, 140430000000, '046400', '0355', '沁县', '沁县', '山西,长治,沁县', 'QinXian', 112.699226, 36.756064);
INSERT INTO `china_region` VALUES (78179, 2, 140400000000, 140431000000, '046500', '0355', '沁源县', '沁源', '山西,长治,沁源', 'QinYuan', 112.337446, 36.5002);
INSERT INTO `china_region` VALUES (78456, 2, 140400000000, 140471000000, '046299', '0355', '山西长治高新技术产业园区', '山西长治高', '山西,长治,长治高', 'ShanXiChangZhiGao', 113.116255, 36.195386);
INSERT INTO `china_region` VALUES (78459, 1, 140000000000, 140500000000, '048000', '0356', '晋城市', '晋城', '山西,晋城', 'JinCheng', 112.851831, 35.490701);
INSERT INTO `china_region` VALUES (78460, 2, 140500000000, 140501000000, '048000', '0356', '市辖区', '晋城', '山西,晋城', 'JinCheng', 112.851831, 35.490701);
INSERT INTO `china_region` VALUES (78461, 2, 140500000000, 140502000000, '048000', '0356', '城区', '城区', '山西,晋城,城区', 'ChengQu', 112.853555, 35.501572);
INSERT INTO `china_region` VALUES (78616, 2, 140500000000, 140521000000, '048200', '0356', '沁水县', '沁水', '山西,晋城,沁水', 'QinShui', 112.186739, 35.690141);
INSERT INTO `china_region` VALUES (78882, 2, 140500000000, 140522000000, '048100', '0356', '阳城县', '阳城', '山西,晋城,阳城', 'YangCheng', 112.414738, 35.486029);
INSERT INTO `china_region` VALUES (79331, 2, 140500000000, 140524000000, '048300', '0356', '陵川县', '陵川', '山西,晋城,陵川', 'LingChuan', 113.280688, 35.775685);
INSERT INTO `china_region` VALUES (79664, 2, 140500000000, 140525000000, '048000', '0356', '泽州县', '泽州', '山西,晋城,泽州', 'ZeZhou', 112.899137, 35.617221);
INSERT INTO `china_region` VALUES (80288, 2, 140500000000, 140581000000, '046700', '0356', '高平市', '高平', '山西,晋城,高平', 'GaoPing', 112.92392, 35.797997);
INSERT INTO `china_region` VALUES (80769, 1, 140000000000, 140600000000, '036000', '0349', '朔州市', '朔州', '山西,朔州', 'ShuoZhou', 112.432825, 39.331595);
INSERT INTO `china_region` VALUES (80770, 2, 140600000000, 140601000000, '036000', '0349', '市辖区', '朔州', '山西,朔州', 'ShuoZhou', 112.432825, 39.331595);
INSERT INTO `china_region` VALUES (80771, 2, 140600000000, 140602000000, '036002', '0349', '朔城区', '朔城', '山西,朔州,朔城', 'ShuoCheng', 112.43225, 39.31894);
INSERT INTO `china_region` VALUES (81120, 2, 140600000000, 140603000000, '036800', '0349', '平鲁区', '平鲁', '山西,朔州,平鲁', 'PingLu', 112.288331, 39.512155);
INSERT INTO `china_region` VALUES (81423, 2, 140600000000, 140621000000, '036900', '0349', '山阴县', '山阴', '山西,朔州,山阴', 'ShanYin', 112.8166, 39.526227);
INSERT INTO `china_region` VALUES (81704, 2, 140600000000, 140622000000, '037600', '0349', '应县', '应县', '山西,朔州,应县', 'YingXian', 113.191099, 39.554247);
INSERT INTO `china_region` VALUES (82010, 2, 140600000000, 140623000000, '037200', '0349', '右玉县', '右玉', '山西,朔州,右玉', 'YouYu', 112.466989, 39.989064);
INSERT INTO `china_region` VALUES (82322, 2, 140600000000, 140671000000, '036000', '0349', '山西朔州经济开发区', '山西朔州经开区', '山西,朔州,朔州经开区', 'ShanXiShuoZhouJingKaiQu', 112.45699, 39.348625);
INSERT INTO `china_region` VALUES (82326, 2, 140600000000, 140681000000, '038300', '0349', '怀仁市', '怀仁', '山西,朔州,怀仁', 'HuaiRen', 113.099958, 39.827916);
INSERT INTO `china_region` VALUES (82525, 1, 140000000000, 140700000000, '030600', '0354', '晋中市', '晋中', '山西,晋中', 'JinZhong', 112.752694, 37.687024);
INSERT INTO `china_region` VALUES (82526, 2, 140700000000, 140701000000, '030600', '0354', '市辖区', '晋中', '山西,晋中', 'JinZhong', 112.752694, 37.687024);
INSERT INTO `china_region` VALUES (82527, 2, 140700000000, 140702000000, '030600', '0354', '榆次区', '榆次', '山西,晋中,榆次', 'YuCi', 112.708241, 37.697792);
INSERT INTO `china_region` VALUES (82892, 2, 140700000000, 140721000000, '031800', '0354', '榆社县', '榆社', '山西,晋中,榆社', 'YuShe', 112.975287, 37.070788);
INSERT INTO `china_region` VALUES (83131, 2, 140700000000, 140722000000, '032600', '0354', '左权县', '左权', '山西,晋中,左权', 'ZuoQuan', 113.379372, 37.082681);
INSERT INTO `china_region` VALUES (83352, 2, 140700000000, 140723000000, '032700', '0354', '和顺县', '和顺', '山西,晋中,和顺', 'HeShun', 113.570438, 37.329664);
INSERT INTO `china_region` VALUES (83608, 2, 140700000000, 140724000000, '045300', '0354', '昔阳县', '昔阳', '山西,晋中,昔阳', 'XiYang', 113.706875, 37.61121);
INSERT INTO `china_region` VALUES (83962, 2, 140700000000, 140725000000, '045400', '0354', '寿阳县', '寿阳', '山西,晋中,寿阳', 'ShouYang', 113.176434, 37.895325);
INSERT INTO `china_region` VALUES (84190, 2, 140700000000, 140726000000, '030800', '0354', '太谷县', '太谷', '山西,晋中,太谷', 'TaiGu', 112.551357, 37.421308);
INSERT INTO `china_region` VALUES (84419, 2, 140700000000, 140727000000, '030900', '0354', '祁县', '祁县', '山西,晋中,祁县', 'QiXian', 112.335297, 37.358317);
INSERT INTO `china_region` VALUES (84599, 2, 140700000000, 140728000000, '031100', '0354', '平遥县', '平遥', '山西,晋中,平遥', 'PingYao', 112.176273, 37.189559);
INSERT INTO `china_region` VALUES (84903, 2, 140700000000, 140729000000, '031300', '0354', '灵石县', '灵石', '山西,晋中,灵石', 'LingShi', 111.778685, 36.84786);
INSERT INTO `china_region` VALUES (85233, 2, 140700000000, 140781000000, '032000', '0354', '介休市', '介休', '山西,晋中,介休', 'JieXiu', 111.916712, 37.026945);
INSERT INTO `china_region` VALUES (85502, 1, 140000000000, 140800000000, '044000', '0359', '运城市', '运城', '山西,运城', 'YunCheng', 111.007528, 35.026412);
INSERT INTO `china_region` VALUES (85503, 2, 140800000000, 140801000000, '044000', '0359', '市辖区', '运城', '山西,运城', 'YunCheng', 111.007528, 35.026412);
INSERT INTO `china_region` VALUES (85504, 2, 140800000000, 140802000000, '044000', '0359', '盐湖区', '盐湖', '山西,运城,盐湖', 'YanHu', 110.998272, 35.015101);
INSERT INTO `china_region` VALUES (85945, 2, 140800000000, 140821000000, '044100', '0359', '临猗县', '临猗', '山西,运城,临猗', 'LinYi', 110.774547, 35.144277);
INSERT INTO `china_region` VALUES (86333, 2, 140800000000, 140822000000, '044200', '0359', '万荣县', '万荣', '山西,运城,万荣', 'WanRong', 110.838024, 35.415254);
INSERT INTO `china_region` VALUES (86627, 2, 140800000000, 140823000000, '043800', '0359', '闻喜县', '闻喜', '山西,运城,闻喜', 'WenXi', 111.22472, 35.356644);
INSERT INTO `china_region` VALUES (86935, 2, 140800000000, 140824000000, '043200', '0359', '稷山县', '稷山', '山西,运城,稷山', 'JiShan', 110.983333, 35.604025);
INSERT INTO `china_region` VALUES (87141, 2, 140800000000, 140825000000, '043100', '0359', '新绛县', '新绛', '山西,运城,新绛', 'XinJiang', 111.224778, 35.616288);
INSERT INTO `china_region` VALUES (87374, 2, 140800000000, 140826000000, '043600', '0359', '绛县', '绛县', '山西,运城,绛县', 'JiangXian', 111.568236, 35.49119);
INSERT INTO `china_region` VALUES (87584, 2, 140800000000, 140827000000, '043700', '0359', '垣曲县', '垣曲', '山西,运城,垣曲', 'YuanQu', 111.669917, 35.29762);
INSERT INTO `china_region` VALUES (87677, 2, 140800000000, 140828000000, '044400', '0359', '夏县', '夏县', '山西,运城,夏县', 'XiaXian', 111.220456, 35.141363);
INSERT INTO `china_region` VALUES (87942, 2, 140800000000, 140829000000, '044300', '0359', '平陆县', '平陆', '山西,运城,平陆', 'PingLu', 111.194133, 34.82926);
INSERT INTO `china_region` VALUES (88175, 2, 140800000000, 140830000000, '044600', '0359', '芮城县', '芮城', '山西,运城,芮城', 'RuiCheng', 110.694369, 34.69358);
INSERT INTO `china_region` VALUES (88362, 2, 140800000000, 140881000000, '044500', '0359', '永济市', '永济', '山西,运城,永济', 'YongJi', 110.447549, 34.86705);
INSERT INTO `china_region` VALUES (88654, 2, 140800000000, 140882000000, '043300', '0359', '河津市', '河津', '山西,运城,河津', 'HeJin', 110.712063, 35.596383);
INSERT INTO `china_region` VALUES (88832, 1, 140000000000, 140900000000, '034000', '0350', '忻州市', '忻州', '山西,忻州', 'XinZhou', 112.734174, 38.416663);
INSERT INTO `china_region` VALUES (88833, 2, 140900000000, 140901000000, '034000', '0350', '市辖区', '忻州', '山西,忻州', 'XinZhou', 112.734174, 38.416663);
INSERT INTO `china_region` VALUES (88834, 2, 140900000000, 140902000000, '034000', '0350', '忻府区', '忻府', '山西,忻州,忻府', 'XinFu', 112.746046, 38.404243);
INSERT INTO `china_region` VALUES (89124, 2, 140900000000, 140921000000, '035400', '0350', '定襄县', '定襄', '山西,忻州,定襄', 'DingXiang', 112.957215, 38.473548);
INSERT INTO `china_region` VALUES (89283, 2, 140900000000, 140922000000, '035500', '0350', '五台县', '五台', '山西,忻州,五台', 'WuTai', 113.255309, 38.728315);
INSERT INTO `china_region` VALUES (89559, 2, 140900000000, 140923000000, '034200', '0350', '代县', '代县', '山西,忻州,代县', 'DaiXian', 112.960282, 39.066917);
INSERT INTO `china_region` VALUES (89891, 2, 140900000000, 140924000000, '034300', '0350', '繁峙县', '繁峙', '山西,忻州,繁峙', 'FanShi', 113.265564, 39.188811);
INSERT INTO `china_region` VALUES (90140, 2, 140900000000, 140925000000, '036000', '0350', '宁武县', '宁武', '山西,忻州,宁武', 'NingWu', 112.304722, 39.001524);
INSERT INTO `china_region` VALUES (90539, 2, 140900000000, 140926000000, '035100', '0350', '静乐县', '静乐', '山西,忻州,静乐', 'JingLe', 111.93944, 38.359036);
INSERT INTO `china_region` VALUES (90915, 2, 140900000000, 140927000000, '036100', '0350', '神池县', '神池', '山西,忻州,神池', 'ShenChi', 112.211297, 39.090553);
INSERT INTO `china_region` VALUES (91053, 2, 140900000000, 140928000000, '036200', '0350', '五寨县', '五寨', '山西,忻州,五寨', 'WuZhai', 111.846905, 38.910726);
INSERT INTO `china_region` VALUES (91181, 2, 140900000000, 140929000000, '036300', '0350', '岢岚县', '岢岚', '山西,忻州,岢岚', 'KeLan', 111.57285, 38.70418);
INSERT INTO `china_region` VALUES (91299, 2, 140900000000, 140930000000, '036500', '0350', '河曲县', '河曲', '山西,忻州,河曲', 'HeQu', 111.138472, 39.384482);
INSERT INTO `china_region` VALUES (91510, 2, 140900000000, 140931000000, '036600', '0350', '保德县', '保德', '山西,忻州,保德', 'BaoDe', 111.086564, 39.022488);
INSERT INTO `china_region` VALUES (91761, 2, 140900000000, 140932000000, '036400', '0350', '偏关县', '偏关', '山西,忻州,偏关', 'PianGuan', 111.508831, 39.436306);
INSERT INTO `china_region` VALUES (92024, 2, 140900000000, 140971000000, '034099', '0350', '五台山风景名胜区', '五台山风景区', '山西,忻州,五台山风景区', 'WuTaiShanFengJingQu', 113.590726, 38.968639);
INSERT INTO `china_region` VALUES (92054, 2, 140900000000, 140981000000, '034100', '0350', '原平市', '原平', '山西,忻州,原平', 'YuanPing', 112.711059, 38.731402);
INSERT INTO `china_region` VALUES (92467, 1, 140000000000, 141000000000, '041000', '0357', '临汾市', '临汾', '山西,临汾', 'LinFen', 111.518976, 36.088005);
INSERT INTO `china_region` VALUES (92468, 2, 141000000000, 141001000000, '041000', '0357', '市辖区', '临汾', '山西,临汾', 'LinFen', 111.518976, 36.088005);
INSERT INTO `china_region` VALUES (92469, 2, 141000000000, 141002000000, '041000', '0357', '尧都区', '尧都', '山西,临汾,尧都', 'YaoDu', 111.579554, 36.078841);
INSERT INTO `china_region` VALUES (92936, 2, 141000000000, 141021000000, '043400', '0357', '曲沃县', '曲沃', '山西,临汾,曲沃', 'QuWo', 111.475861, 35.641087);
INSERT INTO `china_region` VALUES (93094, 2, 141000000000, 141022000000, '043500', '0357', '翼城县', '翼城', '山西,临汾,翼城', 'YiCheng', 111.718951, 35.738576);
INSERT INTO `china_region` VALUES (93313, 2, 141000000000, 141023000000, '041500', '0357', '襄汾县', '襄汾', '山西,临汾,襄汾', 'XiangFen', 111.441725, 35.876293);
INSERT INTO `china_region` VALUES (93666, 2, 141000000000, 141024000000, '031600', '0357', '洪洞县', '洪洞', '山西,临汾,洪洞', 'HongDong', 111.674966, 36.253748);
INSERT INTO `china_region` VALUES (94122, 2, 141000000000, 141025000000, '042400', '0357', '古县', '古县', '山西,临汾,古县', 'GuXian', 111.920466, 36.266914);
INSERT INTO `china_region` VALUES (94229, 2, 141000000000, 141026000000, '042500', '0357', '安泽县', '安泽', '山西,临汾,安泽', 'AnZe', 112.250144, 36.147787);
INSERT INTO `china_region` VALUES (94343, 2, 141000000000, 141027000000, '042600', '0357', '浮山县', '浮山', '山西,临汾,浮山', 'FuShan', 111.848883, 35.968124);
INSERT INTO `china_region` VALUES (94540, 2, 141000000000, 141028000000, '042200', '0357', '吉县', '吉县', '山西,临汾,吉县', 'JiXian', 110.681763, 36.098188);
INSERT INTO `china_region` VALUES (94626, 2, 141000000000, 141029000000, '042100', '0357', '乡宁县', '乡宁', '山西,临汾,乡宁', 'XiangNing', 110.847021, 35.970389);
INSERT INTO `china_region` VALUES (94819, 2, 141000000000, 141030000000, '042300', '0357', '大宁县', '大宁', '山西,临汾,大宁', 'DaNing', 110.752903, 36.465133);
INSERT INTO `china_region` VALUES (94909, 2, 141000000000, 141031000000, '041300', '0357', '隰县', '隰县', '山西,临汾,隰县', 'XiXian', 110.940638, 36.693331);
INSERT INTO `china_region` VALUES (95012, 2, 141000000000, 141032000000, '041400', '0357', '永和县', '永和', '山西,临汾,永和', 'YongHe', 110.632007, 36.759507);
INSERT INTO `china_region` VALUES (95099, 2, 141000000000, 141033000000, '041200', '0357', '蒲县', '蒲县', '山西,临汾,蒲县', 'PuXian', 111.096439, 36.411827);
INSERT INTO `china_region` VALUES (95201, 2, 141000000000, 141034000000, '031500', '0357', '汾西县', '汾西', '山西,临汾,汾西', 'FenXi', 111.563951, 36.652854);
INSERT INTO `china_region` VALUES (95332, 2, 141000000000, 141081000000, '043000', '0357', '侯马市', '侯马', '山西,临汾,侯马', 'HouMa', 111.372002, 35.619105);
INSERT INTO `china_region` VALUES (95447, 2, 141000000000, 141082000000, '031400', '0357', '霍州市', '霍州', '山西,临汾,霍州', 'HuoZhou', 111.755398, 36.568931);
INSERT INTO `china_region` VALUES (95668, 1, 140000000000, 141100000000, '033000', '0358', '吕梁市', '吕梁', '山西,吕梁', 'LyuLiang', 111.144319, 37.518314);
INSERT INTO `china_region` VALUES (95669, 2, 141100000000, 141101000000, '033000', '0358', '市辖区', '吕梁', '山西,吕梁', 'LyuLiang', 111.144319, 37.518314);
INSERT INTO `china_region` VALUES (95670, 2, 141100000000, 141102000000, '033000', '0358', '离石区', '离石', '山西,吕梁,离石', 'LiShi', 111.150733, 37.517641);
INSERT INTO `china_region` VALUES (95936, 2, 141100000000, 141121000000, '032100', '0358', '文水县', '文水', '山西,吕梁,文水', 'WenShui', 112.028866, 37.438102);
INSERT INTO `china_region` VALUES (96159, 2, 141100000000, 141122000000, '030500', '0358', '交城县', '交城', '山西,吕梁,交城', 'JiaoCheng', 112.155841, 37.55197);
INSERT INTO `china_region` VALUES (96309, 2, 141100000000, 141123000000, '035300', '0358', '兴县', '兴县', '山西,吕梁,兴县', 'XingXian', 111.127668, 38.46239);
INSERT INTO `china_region` VALUES (96720, 2, 141100000000, 141124000000, '033200', '0358', '临县', '临县', '山西,吕梁,临县', 'LinXian', 110.992094, 37.950758);
INSERT INTO `china_region` VALUES (97398, 2, 141100000000, 141125000000, '033300', '0358', '柳林县', '柳林', '山西,吕梁,柳林', 'LiuLin', 110.889071, 37.429832);
INSERT INTO `china_region` VALUES (97660, 2, 141100000000, 141126000000, '032500', '0358', '石楼县', '石楼', '山西,吕梁,石楼', 'ShiLou', 110.834561, 36.997412);
INSERT INTO `china_region` VALUES (97790, 2, 141100000000, 141127000000, '035200', '0358', '岚县', '岚县', '山西,吕梁,岚县', 'LanXian', 111.671917, 38.279299);
INSERT INTO `china_region` VALUES (97972, 2, 141100000000, 141128000000, '033100', '0358', '方山县', '方山', '山西,吕梁,方山', 'FangShan', 111.244098, 37.894631);
INSERT INTO `china_region` VALUES (98139, 2, 141100000000, 141129000000, '033400', '0358', '中阳县', '中阳', '山西,吕梁,中阳', 'ZhongYang', 111.179657, 37.357058);
INSERT INTO `china_region` VALUES (98247, 2, 141100000000, 141130000000, '032400', '0358', '交口县', '交口', '山西,吕梁,交口', 'JiaoKou', 111.181151, 36.982186);
INSERT INTO `china_region` VALUES (98351, 2, 141100000000, 141181000000, '032300', '0358', '孝义市', '孝义', '山西,吕梁,孝义', 'XiaoYi', 111.778818, 37.146294);
INSERT INTO `china_region` VALUES (98799, 2, 141100000000, 141182000000, '032200', '0358', '汾阳市', '汾阳', '山西,吕梁,汾阳', 'FenYang', 111.769894, 37.261564);
INSERT INTO `china_region` VALUES (99115, 0, 0, 150000000000, '0', NULL, '内蒙古自治区', '内蒙古', '内蒙古', 'NeiMengGu', 111.765617, 40.817498);
INSERT INTO `china_region` VALUES (99116, 1, 150000000000, 150100000000, '010000', '0471', '呼和浩特市', '呼和浩特', '内蒙古,呼和浩特', 'HuHeHaoTe', 111.74918, 40.842585);
INSERT INTO `china_region` VALUES (99117, 2, 150100000000, 150101000000, '010000', '0471', '市辖区', '呼和浩特', '内蒙古,呼和浩特', 'HuHeHaoTe', 111.74918, 40.842585);
INSERT INTO `china_region` VALUES (99118, 2, 150100000000, 150102000000, '010000', '0471', '新城区', '新城', '内蒙古,呼和浩特,新城', 'XinCheng', 111.665544, 40.858289);
INSERT INTO `china_region` VALUES (99207, 2, 150100000000, 150103000000, '010000', '0471', '回民区', '回民', '内蒙古,呼和浩特,回民', 'HuiMin', 111.623692, 40.808608);
INSERT INTO `china_region` VALUES (99279, 2, 150100000000, 150104000000, '010000', '0471', '玉泉区', '玉泉', '内蒙古,呼和浩特,玉泉', 'YuQuan', 111.673881, 40.753655);
INSERT INTO `china_region` VALUES (99401, 2, 150100000000, 150105000000, '010000', '0471', '赛罕区', '赛罕', '内蒙古,呼和浩特,赛罕', 'SaiHan', 111.701857, 40.792097);
INSERT INTO `china_region` VALUES (99611, 2, 150100000000, 150121000000, '010100', '0471', '土默特左旗', '土默特左旗', '内蒙古,呼和浩特,土默特左旗', 'TuMoTeZuoQi', 111.163902, 40.729573);
INSERT INTO `china_region` VALUES (99958, 2, 150100000000, 150122000000, '010200', '0471', '托克托县', '托克托', '内蒙古,呼和浩特,托克托', 'TuoKeTuo', 111.194313, 40.277431);
INSERT INTO `china_region` VALUES (100102, 2, 150100000000, 150123000000, '011500', '0471', '和林格尔县', '和林格尔', '内蒙古,呼和浩特,和林格尔', 'HeLinGeEr', 111.821843, 40.378787);
INSERT INTO `china_region` VALUES (100272, 2, 150100000000, 150124000000, '011600', '0471', '清水河县', '清水河', '内蒙古,呼和浩特,清水河', 'QingShuiHe', 111.647609, 39.921095);
INSERT INTO `china_region` VALUES (100390, 2, 150100000000, 150125000000, '011700', '0471', '武川县', '武川', '内蒙古,呼和浩特,武川', 'WuChuan', 111.451303, 41.096471);
INSERT INTO `china_region` VALUES (100507, 2, 150100000000, 150171000000, '010050', '0471', '呼和浩特金海工业园区', '呼和浩特金海工业园', '内蒙古,呼和浩特,呼和浩特金海工业园', 'HuHeHaoTeJinHaiGongYeYuan', 111.607531, 40.806702);
INSERT INTO `china_region` VALUES (100510, 2, 150100000000, 150172000000, '010000', '0471', '呼和浩特经济技术开发区', '呼和浩特经开区', '内蒙古,呼和浩特,呼和浩特经开区', 'HuHeHaoTeJingKaiQu', 111.755762, 40.834536);
INSERT INTO `china_region` VALUES (100523, 1, 150000000000, 150200000000, '014000', '0472', '包头市', '包头', '内蒙古,包头', 'BaoTou', 109.840347, 40.657449);
INSERT INTO `china_region` VALUES (100524, 2, 150200000000, 150201000000, '014000', '0472', '市辖区', '包头', '内蒙古,包头', 'BaoTou', 109.840347, 40.657449);
INSERT INTO `china_region` VALUES (100525, 2, 150200000000, 150202000000, '014000', '0472', '东河区', '东河', '内蒙古,包头,东河', 'DongHe', 110.044142, 40.575948);
INSERT INTO `china_region` VALUES (100654, 2, 150200000000, 150203000000, '014010', '0472', '昆都仑区', '昆都仑', '内蒙古,包头,昆都仑', 'KunDuLun', 109.838178, 40.642236);
INSERT INTO `china_region` VALUES (100775, 2, 150200000000, 150204000000, '014000', '0472', '青山区', '青山', '内蒙古,包头,青山', 'QingShan', 109.901572, 40.643246);
INSERT INTO `china_region` VALUES (100863, 2, 150200000000, 150205000000, '014000', '0472', '石拐区', '石拐', '内蒙古,包头,石拐', 'ShiGuai', 110.060686, 40.676645);
INSERT INTO `china_region` VALUES (100896, 2, 150200000000, 150206000000, '014080', '0472', '白云鄂博矿区', '白云鄂博矿', '内蒙古,包头,白云鄂博矿', 'BaiYunEBoKuang', 109.840347, 40.657449);
INSERT INTO `china_region` VALUES (100903, 2, 150200000000, 150207000000, '014060', '0472', '九原区', '九原', '内蒙古,包头,九原', 'JiuYuan', 109.968122, 40.600581);
INSERT INTO `china_region` VALUES (100996, 2, 150200000000, 150221000000, '014100', '0472', '土默特右旗', '土默特右旗', '内蒙古,包头,土默特右旗', 'TuMoTeYouQi', 110.524263, 40.569426);
INSERT INTO `china_region` VALUES (101220, 2, 150200000000, 150222000000, '014200', '0472', '固阳县', '固阳', '内蒙古,包头,固阳', 'GuYang', 110.060514, 41.034106);
INSERT INTO `china_region` VALUES (101310, 2, 150200000000, 150223000000, '014500', '0472', '达尔罕茂明安联合旗', '达尔罕茂明安', '内蒙古,包头,达尔罕茂明安', 'DaErHanMaoMingAn', 110.432626, 41.698992);
INSERT INTO `china_region` VALUES (101408, 2, 150200000000, 150271000000, '014020', '0472', '包头稀土高新技术产业开发区', '包头稀土高', '内蒙古,包头,包头稀土高', 'BaoTouXiTuGao', 109.840347, 40.657449);
INSERT INTO `china_region` VALUES (101463, 1, 150000000000, 150300000000, '016000', '0473', '乌海市', '乌海', '内蒙古,乌海', 'WuHai', 106.794249, 39.655388);
INSERT INTO `china_region` VALUES (101464, 2, 150300000000, 150301000000, '016000', '0473', '市辖区', '乌海', '内蒙古,乌海', 'WuHai', 106.794249, 39.655388);
INSERT INTO `china_region` VALUES (101465, 2, 150300000000, 150302000000, '016000', '0473', '海勃湾区', '海勃湾', '内蒙古,乌海,海勃湾', 'HaiBoWan', 106.822779, 39.691156);
INSERT INTO `china_region` VALUES (101515, 2, 150300000000, 150303000000, '016000', '0473', '海南区', '海南', '内蒙古,乌海,海南', 'HaiNan', 106.891424, 39.441364);
INSERT INTO `china_region` VALUES (101542, 2, 150300000000, 150304000000, '016000', '0473', '乌达区', '乌达', '内蒙古,乌海,乌达', 'WuDa', 106.726099, 39.505925);
INSERT INTO `china_region` VALUES (101576, 1, 150000000000, 150400000000, '024000', '0476', '赤峰市', '赤峰', '内蒙古,赤峰', 'ChiFeng', 118.886856, 42.257817);
INSERT INTO `china_region` VALUES (101577, 2, 150400000000, 150401000000, '024000', '0476', '市辖区', '赤峰', '内蒙古,赤峰', 'ChiFeng', 118.886856, 42.257817);
INSERT INTO `china_region` VALUES (101578, 2, 150400000000, 150402000000, '024000', '0476', '红山区', '红山', '内蒙古,赤峰,红山', 'HongShan', 118.967296, 42.271963);
INSERT INTO `china_region` VALUES (101680, 2, 150400000000, 150403000000, '024000', '0476', '元宝山区', '元宝山', '内蒙古,赤峰,元宝山', 'YuanBaoShan', 119.288611, 42.038902);
INSERT INTO `china_region` VALUES (101809, 2, 150400000000, 150404000000, '024000', '0476', '松山区', '松山', '内蒙古,赤峰,松山', 'SongShan', 118.933235, 42.284008);
INSERT INTO `china_region` VALUES (102142, 2, 150400000000, 150421000000, '025500', '0476', '阿鲁科尔沁旗', '阿鲁科尔沁旗', '内蒙古,赤峰,阿鲁科尔沁旗', 'ALuKeErQinQi', 120.0657, 43.872299);
INSERT INTO `china_region` VALUES (102422, 2, 150400000000, 150422000000, '025450', '0476', '巴林左旗', '巴林左旗', '内蒙古,赤峰,巴林左旗', 'BaLinZuoQi', 119.37949, 43.971126);
INSERT INTO `china_region` VALUES (102628, 2, 150400000000, 150423000000, '025150', '0476', '巴林右旗', '巴林右旗', '内蒙古,赤峰,巴林右旗', 'BaLinYouQi', 118.66518, 43.534414);
INSERT INTO `china_region` VALUES (102812, 2, 150400000000, 150424000000, '025250', '0476', '林西县', '林西', '内蒙古,赤峰,林西', 'LinXi', 118.05545, 43.61812);
INSERT INTO `china_region` VALUES (102940, 2, 150400000000, 150425000000, '025350', '0476', '克什克腾旗', '克什克腾旗', '内蒙古,赤峰,克什克腾旗', 'KeShiKeTengQi', 117.545798, 43.264989);
INSERT INTO `china_region` VALUES (103105, 2, 150400000000, 150426000000, '024500', '0476', '翁牛特旗', '翁牛特旗', '内蒙古,赤峰,翁牛特旗', 'WengNiuTeQi', 119.00658, 42.936188);
INSERT INTO `china_region` VALUES (103367, 2, 150400000000, 150428000000, '024400', '0476', '喀喇沁旗', '喀喇沁旗', '内蒙古,赤峰,喀喇沁旗', 'KaLaQinQi', 118.701938, 41.927364);
INSERT INTO `china_region` VALUES (103555, 2, 150400000000, 150429000000, '024200', '0476', '宁城县', '宁城', '内蒙古,赤峰,宁城', 'NingCheng', 118.557602, 41.415477);
INSERT INTO `china_region` VALUES (103911, 2, 150400000000, 150430000000, '024300', '0476', '敖汉旗', '敖汉旗', '内蒙古,赤峰,敖汉旗', 'AoHanQi', 119.921604, 42.290782);
INSERT INTO `china_region` VALUES (104178, 1, 150000000000, 150500000000, '028000', '0475', '通辽市', '通辽', '内蒙古,通辽', 'TongLiao', 122.243444, 43.65289);
INSERT INTO `china_region` VALUES (104179, 2, 150500000000, 150501000000, '028000', '0475', '市辖区', '通辽', '内蒙古,通辽', 'TongLiao', 122.243444, 43.65289);
INSERT INTO `china_region` VALUES (104180, 2, 150500000000, 150502000000, '028000', '0475', '科尔沁区', '科尔沁', '内蒙古,通辽,科尔沁', 'KeErQin', 122.255675, 43.623077);
INSERT INTO `china_region` VALUES (104677, 2, 150500000000, 150521000000, '029300', '0475', '科尔沁左翼中旗', '科尔沁左翼中旗', '内蒙古,通辽,科尔沁左翼中旗', 'KeErQinZuoYiZhongQi', 123.312265, 44.126626);
INSERT INTO `china_region` VALUES (105254, 2, 150500000000, 150522000000, '028100', '0475', '科尔沁左翼后旗', '科尔沁左翼后旗', '内蒙古,通辽,科尔沁左翼后旗', 'KeErQinZuoYiHouQi', 122.356749, 42.935159);
INSERT INTO `china_region` VALUES (105587, 2, 150500000000, 150523000000, '028400', '0475', '开鲁县', '开鲁', '内蒙古,通辽,开鲁', 'KaiLu', 121.319309, 43.601244);
INSERT INTO `china_region` VALUES (105874, 2, 150500000000, 150524000000, '028200', '0475', '库伦旗', '库伦旗', '内蒙古,通辽,库伦旗', 'KuLunQi', 121.810701, 42.735657);
INSERT INTO `china_region` VALUES (106080, 2, 150500000000, 150525000000, '028300', '0475', '奈曼旗', '奈曼旗', '内蒙古,通辽,奈曼旗', 'NaiManQi', 120.662419, 42.845455);
INSERT INTO `china_region` VALUES (106470, 2, 150500000000, 150526000000, '029100', '0475', '扎鲁特旗', '扎鲁特旗', '内蒙古,通辽,扎鲁特旗', 'ZaLuTeQi', 120.911676, 44.556389);
INSERT INTO `china_region` VALUES (106755, 2, 150500000000, 150571000000, '028000', '0475', '通辽经济技术开发区', '通辽经开区', '内蒙古,通辽,通辽经开区', 'TongLiaoJingKaiQu', 122.248991, 43.651827);
INSERT INTO `china_region` VALUES (106840, 2, 150500000000, 150581000000, '029200', '0475', '霍林郭勒市', '霍林郭勒', '内蒙古,通辽,霍林郭勒', 'HuoLinGuoLe', 119.663534, 45.531726);
INSERT INTO `china_region` VALUES (106872, 1, 150000000000, 150600000000, '017000', '0477', '鄂尔多斯市', '鄂尔多斯', '内蒙古,鄂尔多斯', 'EErDuoSi', 109.781327, 39.608266);
INSERT INTO `china_region` VALUES (106873, 2, 150600000000, 150601000000, '017000', '0477', '市辖区', '鄂尔多斯', '内蒙古,鄂尔多斯', 'EErDuoSi', 109.781327, 39.608266);
INSERT INTO `china_region` VALUES (106874, 2, 150600000000, 150602000000, '017000', '0477', '东胜区', '东胜', '内蒙古,鄂尔多斯,东胜', 'DongSheng', 109.963339, 39.822507);
INSERT INTO `china_region` VALUES (107001, 2, 150600000000, 150603000000, '017010', '0477', '康巴什区', '康巴什', '内蒙古,鄂尔多斯,康巴什', 'KangBaShen', 109.781327, 39.608266);
INSERT INTO `china_region` VALUES (107025, 2, 150600000000, 150621000000, '014300', '0477', '达拉特旗', '达拉特旗', '内蒙古,鄂尔多斯,达拉特旗', 'DaLaTeQi', 110.033833, 40.412438);
INSERT INTO `china_region` VALUES (107203, 2, 150600000000, 150622000000, '017100', '0477', '准格尔旗', '准格尔旗', '内蒙古,鄂尔多斯,准格尔旗', 'ZhunGeErQi', 111.240171, 39.864362);
INSERT INTO `china_region` VALUES (107419, 2, 150600000000, 150623000000, '016200', '0477', '鄂托克前旗', '鄂托克前旗', '内蒙古,鄂尔多斯,鄂托克前旗', 'ETuoKeQianQi', 107.477515, 38.182362);
INSERT INTO `china_region` VALUES (107510, 2, 150600000000, 150624000000, '016100', '0477', '鄂托克旗', '鄂托克旗', '内蒙古,鄂尔多斯,鄂托克旗', 'ETuoKeQi', 107.976161, 39.08965);
INSERT INTO `china_region` VALUES (107618, 2, 150600000000, 150625000000, '017400', '0477', '杭锦旗', '杭锦旗', '内蒙古,鄂尔多斯,杭锦旗', 'HangJinQi', 108.736208, 39.833309);
INSERT INTO `china_region` VALUES (107718, 2, 150600000000, 150626000000, '017300', '0477', '乌审旗', '乌审旗', '内蒙古,鄂尔多斯,乌审旗', 'WuShenQi', 108.817607, 38.604136);
INSERT INTO `china_region` VALUES (107799, 2, 150600000000, 150627000000, '017200', '0477', '伊金霍洛旗', '伊金霍洛旗', '内蒙古,鄂尔多斯,伊金霍洛旗', 'YiJinHuoLuoQi', 109.74774, 39.56466);
INSERT INTO `china_region` VALUES (107983, 1, 150000000000, 150700000000, '021000', '0470', '呼伦贝尔市', '呼伦贝尔', '内蒙古,呼伦贝尔', 'HuLunBeiEr', 119.765744, 49.211574);
INSERT INTO `china_region` VALUES (107984, 2, 150700000000, 150701000000, '021000', '0470', '市辖区', '呼伦贝尔', '内蒙古,呼伦贝尔', 'HuLunBeiEr', 119.765744, 49.211574);
INSERT INTO `china_region` VALUES (107985, 2, 150700000000, 150702000000, '021000', '0470', '海拉尔区', '海拉尔', '内蒙古,呼伦贝尔,海拉尔', 'HaiLaEr', 119.736279, 49.212189);
INSERT INTO `china_region` VALUES (108059, 2, 150700000000, 150703000000, '021410', '0470', '扎赉诺尔区', '扎赉诺尔', '内蒙古,呼伦贝尔,扎赉诺尔', 'ZhaLaiNuoEr', 117.670248, 49.510375);
INSERT INTO `china_region` VALUES (108087, 2, 150700000000, 150721000000, '162750', '0470', '阿荣旗', '阿荣旗', '内蒙古,呼伦贝尔,阿荣旗', 'ARongQi', 123.45905, 48.126585);
INSERT INTO `china_region` VALUES (108277, 2, 150700000000, 150722000000, '162850', '0470', '莫力达瓦达斡尔族自治旗', '莫力达瓦', '内蒙古,呼伦贝尔,莫力达瓦', 'MoLiDaWa', 124.519023, 48.477729);
INSERT INTO `china_region` VALUES (108583, 2, 150700000000, 150723000000, '022450', '0470', '鄂伦春自治旗', '鄂伦春自治旗', '内蒙古,呼伦贝尔,鄂伦春自治旗', 'ELunChunZiZhiQi', 119.765744, 49.211574);
INSERT INTO `china_region` VALUES (108706, 2, 150700000000, 150724000000, '021100', '0470', '鄂温克族自治旗', '鄂温克族自治旗', '内蒙古,呼伦贝尔,鄂温克族自治旗', 'EWenKeZuZiZhiQi', 119.755213, 49.146588);
INSERT INTO `china_region` VALUES (108789, 2, 150700000000, 150725000000, '021500', '0470', '陈巴尔虎旗', '陈巴尔虎旗', '内蒙古,呼伦贝尔,陈巴尔虎旗', 'ChenBaErHuQi', 119.424026, 49.328916);
INSERT INTO `china_region` VALUES (108877, 2, 150700000000, 150726000000, '021200', '0470', '新巴尔虎左旗', '新巴尔虎左旗', '内蒙古,呼伦贝尔,新巴尔虎左旗', 'XinBaErHuZuoQi', 118.26982, 48.218241);
INSERT INTO `china_region` VALUES (108956, 2, 150700000000, 150727000000, '021300', '0470', '新巴尔虎右旗', '新巴尔虎右旗', '内蒙古,呼伦贝尔,新巴尔虎右旗', 'XinBaErHuYouQi', 116.82369, 48.672101);
INSERT INTO `china_region` VALUES (109029, 2, 150700000000, 150781000000, '021400', '0470', '满洲里市', '满洲里', '内蒙古,呼伦贝尔,满洲里', 'ManZhouLi', 117.37853, 49.597841);
INSERT INTO `china_region` VALUES (109070, 2, 150700000000, 150782000000, '022150', '0470', '牙克石市', '牙克石', '内蒙古,呼伦贝尔,牙克石', 'YaKeShi', 120.735775, 49.293222);
INSERT INTO `china_region` VALUES (109170, 2, 150700000000, 150783000000, '162650', '0470', '扎兰屯市', '扎兰屯', '内蒙古,呼伦贝尔,扎兰屯', 'ZhaLanTun', 122.737467, 48.013733);
INSERT INTO `china_region` VALUES (109424, 2, 150700000000, 150784000000, '022250', '0470', '额尔古纳市', '额尔古纳', '内蒙古,呼伦贝尔,额尔古纳', 'EErGuNa', 119.765744, 49.211574);
INSERT INTO `china_region` VALUES (109500, 2, 150700000000, 150785000000, '022350', '0470', '根河市', '根河', '内蒙古,呼伦贝尔,根河', 'GenHe', 119.765744, 49.211574);
INSERT INTO `china_region` VALUES (109535, 1, 150000000000, 150800000000, '015000', '0478', '巴彦淖尔市', '巴彦淖尔', '内蒙古,巴彦淖尔', 'BaYanNaoEr', 107.387657, 40.743213);
INSERT INTO `china_region` VALUES (109536, 2, 150800000000, 150801000000, '015000', '0478', '市辖区', '巴彦淖尔', '内蒙古,巴彦淖尔', 'BaYanNaoEr', 107.387657, 40.743213);
INSERT INTO `china_region` VALUES (109537, 2, 150800000000, 150802000000, '015000', '0478', '临河区', '临河', '内蒙古,巴彦淖尔,临河', 'LinHe', 107.363919, 40.751187);
INSERT INTO `china_region` VALUES (109790, 2, 150800000000, 150821000000, '015100', '0478', '五原县', '五原', '内蒙古,巴彦淖尔,五原', 'WuYuan', 108.267562, 41.088422);
INSERT INTO `china_region` VALUES (109950, 2, 150800000000, 150822000000, '015200', '0478', '磴口县', '磴口', '内蒙古,巴彦淖尔,磴口', 'DengKou', 107.008248, 40.330524);
INSERT INTO `china_region` VALUES (110067, 2, 150800000000, 150823000000, '014400', '0478', '乌拉特前旗', '乌拉特前旗', '内蒙古,巴彦淖尔,乌拉特前旗', 'WuLaTeQianQi', 108.652119, 40.73703);
INSERT INTO `china_region` VALUES (110252, 2, 150800000000, 150824000000, '015300', '0478', '乌拉特中旗', '乌拉特中旗', '内蒙古,巴彦淖尔,乌拉特中旗', 'WuLaTeZhongQi', 108.513645, 41.587732);
INSERT INTO `china_region` VALUES (110371, 2, 150800000000, 150825000000, '015500', '0478', '乌拉特后旗', '乌拉特后旗', '内蒙古,巴彦淖尔,乌拉特后旗', 'WuLaTeHouQi', 107.074621, 41.084283);
INSERT INTO `china_region` VALUES (110438, 2, 150800000000, 150826000000, '015400', '0478', '杭锦后旗', '杭锦后旗', '内蒙古,巴彦淖尔,杭锦后旗', 'HangJinHouQi', 107.150909, 40.885896);
INSERT INTO `china_region` VALUES (110584, 1, 150000000000, 150900000000, '012000', '0474', '乌兰察布市', '乌兰察布', '内蒙古,乌兰察布', 'WuLanChaBu', 113.132585, 40.994785);
INSERT INTO `china_region` VALUES (110585, 2, 150900000000, 150901000000, '012000', '0474', '市辖区', '乌兰察布', '内蒙古,乌兰察布', 'WuLanChaBu', 113.132585, 40.994785);
INSERT INTO `china_region` VALUES (110586, 2, 150900000000, 150902000000, '012000', '0474', '集宁区', '集宁', '内蒙古,乌兰察布,集宁', 'JiNing', 113.123779, 40.990689);
INSERT INTO `china_region` VALUES (110702, 2, 150900000000, 150921000000, '012300', '0474', '卓资县', '卓资', '内蒙古,乌兰察布,卓资', 'ZhuoZi', 112.577528, 40.894692);
INSERT INTO `china_region` VALUES (110831, 2, 150900000000, 150922000000, '013350', '0474', '化德县', '化德', '内蒙古,乌兰察布,化德', 'HuaDe', 114.010438, 41.90456);
INSERT INTO `china_region` VALUES (110935, 2, 150900000000, 150923000000, '013400', '0474', '商都县', '商都', '内蒙古,乌兰察布,商都', 'ShangDu', 113.577816, 41.562113);
INSERT INTO `china_region` VALUES (111179, 2, 150900000000, 150924000000, '013650', '0474', '兴和县', '兴和', '内蒙古,乌兰察布,兴和', 'XingHe', 113.834173, 40.872301);
INSERT INTO `china_region` VALUES (111366, 2, 150900000000, 150925000000, '013750', '0474', '凉城县', '凉城', '内蒙古,乌兰察布,凉城', 'LiangCheng', 112.503971, 40.531555);
INSERT INTO `china_region` VALUES (111519, 2, 150900000000, 150926000000, '012200', '0474', '察哈尔右翼前旗', '察哈尔右翼前旗', '内蒙古,乌兰察布,察哈尔右翼前旗', 'ChaHaErYouYiQianQi', 113.214733, 40.785631);
INSERT INTO `china_region` VALUES (111663, 2, 150900000000, 150927000000, '013500', '0474', '察哈尔右翼中旗', '察哈尔右翼中旗', '内蒙古,乌兰察布,察哈尔右翼中旗', 'ChaHaErYouYiZhongQi', 112.635577, 41.277462);
INSERT INTO `china_region` VALUES (111862, 2, 150900000000, 150928000000, '012400', '0474', '察哈尔右翼后旗', '察哈尔右翼后旗', '内蒙古,乌兰察布,察哈尔右翼后旗', 'ChaHaErYouYiHouQi', 113.191035, 41.436069);
INSERT INTO `china_region` VALUES (111972, 2, 150900000000, 150929000000, '011800', '0474', '四子王旗', '四子王旗', '内蒙古,乌兰察布,四子王旗', 'SiZiWangQi', 111.706618, 41.533462);
INSERT INTO `china_region` VALUES (112123, 2, 150900000000, 150981000000, '012100', '0474', '丰镇市', '丰镇', '内蒙古,乌兰察布,丰镇', 'FengZhen', 113.109892, 40.436983);
INSERT INTO `china_region` VALUES (112249, 1, 150000000000, 152200000000, '010010', '0482', '兴安盟', '兴安', '内蒙古,兴安', 'XingAn', 122.067042, 46.077561);
INSERT INTO `china_region` VALUES (112250, 2, 152200000000, 152201000000, '137400', '0482', '乌兰浩特市', '乌兰浩特', '内蒙古,兴安,乌兰浩特', 'WuLanHaoTe', 122.093123, 46.072732);
INSERT INTO `china_region` VALUES (112392, 2, 152200000000, 152202000000, '137400', '0482', '阿尔山市', '阿尔山', '内蒙古,兴安,阿尔山', 'AErShan', 119.943575, 47.17744);
INSERT INTO `china_region` VALUES (112431, 2, 152200000000, 152221000000, '137400', '0482', '科尔沁右翼前旗', '科尔沁右翼前旗', '内蒙古,兴安,科尔沁右翼前旗', 'KeErQinYouYiQianQi', 121.95255, 46.07981);
INSERT INTO `china_region` VALUES (112750, 2, 152200000000, 152222000000, '137400', '0482', '科尔沁右翼中旗', '科尔沁右翼中旗', '内蒙古,兴安,科尔沁右翼中旗', 'KeErQinYouYiZhongQi', 121.47653, 45.060837);
INSERT INTO `china_region` VALUES (112989, 2, 152200000000, 152223000000, '137600', '0482', '扎赉特旗', '扎赉特旗', '内蒙古,兴安,扎赉特旗', 'ZhaLaiTeQi', 122.899656, 46.723237);
INSERT INTO `china_region` VALUES (113249, 2, 152200000000, 152224000000, '037500', '0482', '突泉县', '突泉', '内蒙古,兴安,突泉', 'TuQuan', 121.593799, 45.38193);
INSERT INTO `china_region` VALUES (113472, 1, 150000000000, 152500000000, '026000', '0479', '锡林郭勒盟', '锡林郭勒', '内蒙古,锡林郭勒', 'XiLinGuoLe', 116.048222, 43.933454);
INSERT INTO `china_region` VALUES (113473, 2, 152500000000, 152501000000, '012600', '0479', '二连浩特市', '二连浩特', '内蒙古,锡林郭勒,二连浩特', 'ErLianHaoTe', 111.977943, 43.65317);
INSERT INTO `china_region` VALUES (113491, 2, 152500000000, 152502000000, '026000', '0479', '锡林浩特市', '锡林浩特', '内蒙古,锡林郭勒,锡林浩特', 'XiLinHaoTe', 116.086032, 43.933411);
INSERT INTO `china_region` VALUES (113611, 2, 152500000000, 152522000000, '026100', '0479', '阿巴嘎旗', '阿巴嘎旗', '内蒙古,锡林郭勒,阿巴嘎旗', 'ABaGaQi', 114.950248, 44.022995);
INSERT INTO `china_region` VALUES (113698, 2, 152500000000, 152523000000, '013100', '0479', '苏尼特左旗', '苏尼特左旗', '内蒙古,锡林郭勒,苏尼特左旗', 'SuNiTeZuoQi', 113.667248, 43.85988);
INSERT INTO `china_region` VALUES (113769, 2, 152500000000, 152524000000, '012500', '0479', '苏尼特右旗', '苏尼特右旗', '内蒙古,锡林郭勒,苏尼特右旗', 'SuNiTeYouQi', 112.641783, 42.742892);
INSERT INTO `china_region` VALUES (113856, 2, 152500000000, 152525000000, '026300', '0479', '东乌珠穆沁旗', '东乌珠穆沁旗', '内蒙古,锡林郭勒,东乌珠穆沁旗', 'DongWuZhuMuQinQi', 116.974494, 45.498221);
INSERT INTO `china_region` VALUES (113947, 2, 152500000000, 152526000000, '026200', '0479', '西乌珠穆沁旗', '西乌珠穆沁旗', '内蒙古,锡林郭勒,西乌珠穆沁旗', 'XiWuZhuMuQinQi', 117.608911, 44.587882);
INSERT INTO `china_region` VALUES (114066, 2, 152500000000, 152527000000, '027000', '0479', '太仆寺旗', '太仆寺旗', '内蒙古,锡林郭勒,太仆寺旗', 'TaiPuSiQi', 115.282986, 41.877136);
INSERT INTO `china_region` VALUES (114265, 2, 152500000000, 152528000000, '013200', '0479', '镶黄旗', '镶黄旗', '内蒙古,锡林郭勒,镶黄旗', 'XiangHuangQi', 113.847287, 42.232371);
INSERT INTO `china_region` VALUES (114336, 2, 152500000000, 152529000000, '026000', '0479', '正镶白旗', '正镶白旗', '内蒙古,锡林郭勒,正镶白旗', 'ZhengXiangBaiQi', 115.029849, 42.287471);
INSERT INTO `china_region` VALUES (114430, 2, 152500000000, 152530000000, '026000', '0479', '正蓝旗', '正蓝旗', '内蒙古,锡林郭勒,正蓝旗', 'ZhengLanQi', 115.99247, 42.241638);
INSERT INTO `china_region` VALUES (114567, 2, 152500000000, 152531000000, '027300', '0479', '多伦县', '多伦', '内蒙古,锡林郭勒,多伦', 'DuoLun', 116.485556, 42.203591);
INSERT INTO `china_region` VALUES (114649, 2, 152500000000, 152571000000, '026399', '0479', '乌拉盖管委会', '乌拉盖', '内蒙古,锡林郭勒,乌拉盖', 'WuLaGai', 118.831727, 45.720515);
INSERT INTO `china_region` VALUES (114677, 1, 150000000000, 152900000000, '750306', '0483', '阿拉善盟', '阿拉善', '内蒙古,阿拉善', 'ALaShan', 105.728969, 38.851892);
INSERT INTO `china_region` VALUES (114678, 2, 152900000000, 152921000000, '750300', '0483', '阿拉善左旗', '阿拉善左旗', '内蒙古,阿拉善,阿拉善左旗', 'ALaShanZuoQi', 105.666293, 38.833411);
INSERT INTO `china_region` VALUES (114870, 2, 152900000000, 152922000000, '750300', '0483', '阿拉善右旗', '阿拉善右旗', '内蒙古,阿拉善,阿拉善右旗', 'ALaShanYouQi', 101.666917, 39.216186);
INSERT INTO `china_region` VALUES (114927, 2, 152900000000, 152923000000, '735400', '0483', '额济纳旗', '额济纳旗', '内蒙古,阿拉善,额济纳旗', 'EJiNaQi', 101.05559, 41.954347);
INSERT INTO `china_region` VALUES (114977, 2, 152900000000, 152971000000, '750300', '0483', '内蒙古阿拉善经济开发区', '内阿拉善经开区', '内蒙古,阿拉善,内阿拉善经开区', 'NeiALaShanJingKaiQu', 106.690507, 39.438209);
INSERT INTO `china_region` VALUES (114983, 0, 0, 210000000000, '0', NULL, '辽宁省', '辽宁', '辽宁', 'LiaoNing', 123.42944, 41.835441);
INSERT INTO `china_region` VALUES (114984, 1, 210000000000, 210100000000, '110000', '024', '沈阳市', '沈阳', '辽宁,沈阳', 'ShenYang', 123.431474, 41.805698);
INSERT INTO `china_region` VALUES (114985, 2, 210100000000, 210101000000, '110000', '024', '市辖区', '沈阳', '辽宁,沈阳', 'ShenYang', 123.431474, 41.805698);
INSERT INTO `china_region` VALUES (114986, 2, 210100000000, 210102000000, '110000', '024', '和平区', '和平', '辽宁,沈阳,和平', 'HePing', 123.39568, 41.78945);
INSERT INTO `china_region` VALUES (115109, 2, 210100000000, 210103000000, '110000', '024', '沈河区', '沈河', '辽宁,沈阳,沈河', 'ShenHe', 123.458897, 41.795655);
INSERT INTO `china_region` VALUES (115236, 2, 210100000000, 210104000000, '110000', '024', '大东区', '大东', '辽宁,沈阳,大东', 'DaDong', 123.508858, 41.81317);
INSERT INTO `china_region` VALUES (115379, 2, 210100000000, 210105000000, '110000', '024', '皇姑区', '皇姑', '辽宁,沈阳,皇姑', 'HuangGu', 123.44197, 41.824796);
INSERT INTO `china_region` VALUES (115519, 2, 210100000000, 210106000000, '110020', '024', '铁西区', '铁西', '辽宁,沈阳,铁西', 'TieXi', 123.376301, 41.802914);
INSERT INTO `china_region` VALUES (115732, 2, 210100000000, 210111000000, '110100', '024', '苏家屯区', '苏家屯', '辽宁,沈阳,苏家屯', 'SuJiaTun', 123.344031, 41.664757);
INSERT INTO `china_region` VALUES (115928, 2, 210100000000, 210112000000, '110117', '024', '浑南区', '浑南', '辽宁,沈阳,浑南', 'HunNan', 123.449715, 41.714914);
INSERT INTO `china_region` VALUES (116203, 2, 210100000000, 210113000000, '110000', '024', '沈北新区', '沈北', '辽宁,沈阳,沈北', 'ShenBei', 123.583197, 41.912487);
INSERT INTO `china_region` VALUES (116415, 2, 210100000000, 210114000000, '110000', '024', '于洪区', '于洪', '辽宁,沈阳,于洪', 'YuHong', 123.308136, 41.793743);
INSERT INTO `china_region` VALUES (116636, 2, 210100000000, 210115000000, '110299', '024', '辽中区', '辽中', '辽宁,沈阳,辽中', 'LiaoZhong', 122.765409, 41.516827);
INSERT INTO `china_region` VALUES (116891, 2, 210100000000, 210123000000, '110500', '024', '康平县', '康平', '辽宁,沈阳,康平', 'KangPing', 123.355701, 42.741005);
INSERT INTO `china_region` VALUES (117085, 2, 210100000000, 210124000000, '110400', '024', '法库县', '法库', '辽宁,沈阳,法库', 'FaKu', 123.440495, 42.50073);
INSERT INTO `china_region` VALUES (117350, 2, 210100000000, 210181000000, '110300', '024', '新民市', '新民', '辽宁,沈阳,新民', 'XinMin', 122.725537, 41.932648);
INSERT INTO `china_region` VALUES (117752, 1, 210000000000, 210200000000, '116000', '0411', '大连市', '大连', '辽宁,大连', 'DaLian', 121.614682, 38.914003);
INSERT INTO `china_region` VALUES (117753, 2, 210200000000, 210201000000, '116000', '0411', '市辖区', '大连', '辽宁,大连', 'DaLian', 121.614682, 38.914003);
INSERT INTO `china_region` VALUES (117754, 2, 210200000000, 210202000000, '116000', '0411', '中山区', '中山', '辽宁,大连,中山', 'ZhongShan', 121.644927, 38.918574);
INSERT INTO `china_region` VALUES (117823, 2, 210200000000, 210203000000, '116000', '0411', '西岗区', '西岗', '辽宁,大连,西岗', 'XiGang', 121.612325, 38.914687);
INSERT INTO `china_region` VALUES (117878, 2, 210200000000, 210204000000, '116000', '0411', '沙河口区', '沙河口', '辽宁,大连,沙河口', 'ShaHeKou', 121.5942, 38.904808);
INSERT INTO `china_region` VALUES (117978, 2, 210200000000, 210211000000, '116000', '0411', '甘井子区', '甘井子', '辽宁,大连,甘井子', 'GanJingZi', 121.525461, 38.953351);
INSERT INTO `china_region` VALUES (118249, 2, 210200000000, 210212000000, '116000', '0411', '旅顺口区', '旅顺口', '辽宁,大连,旅顺口', 'LyuShunKou', 121.261953, 38.851705);
INSERT INTO `china_region` VALUES (118372, 2, 210200000000, 210213000000, '116000', '0411', '金州区', '金州', '辽宁,大连,金州', 'JinZhou', 121.782769, 39.05046);
INSERT INTO `china_region` VALUES (118739, 2, 210200000000, 210214000000, '116299', '0411', '普兰店区', '普兰店', '辽宁,大连,普兰店', 'PuLanDian', 122.26177, 39.741886);
INSERT INTO `china_region` VALUES (118945, 2, 210200000000, 210224000000, '116500', '0411', '长海县', '长海', '辽宁,大连,长海', 'ChangHai', 122.588494, 39.272728);
INSERT INTO `china_region` VALUES (118981, 2, 210200000000, 210281000000, '116300', '0411', '瓦房店市', '瓦房店', '辽宁,大连,瓦房店', 'WaFangDian', 121.979603, 39.627114);
INSERT INTO `china_region` VALUES (119341, 2, 210200000000, 210283000000, '116400', '0411', '庄河市', '庄河', '辽宁,大连,庄河', 'ZhuangHe', 122.967328, 39.680811);
INSERT INTO `china_region` VALUES (119649, 1, 210000000000, 210300000000, '114000', '0412', '鞍山市', '鞍山', '辽宁,鞍山', 'AnShan', 122.994329, 41.108647);
INSERT INTO `china_region` VALUES (119650, 2, 210300000000, 210301000000, '114000', '0412', '市辖区', '鞍山', '辽宁,鞍山', 'AnShan', 122.994329, 41.108647);
INSERT INTO `china_region` VALUES (119651, 2, 210300000000, 210302000000, '114000', '0412', '铁东区', '铁东', '辽宁,鞍山,铁东', 'TieDong', 122.991052, 41.089933);
INSERT INTO `china_region` VALUES (119775, 2, 210300000000, 210303000000, '114000', '0412', '铁西区', '铁西', '辽宁,鞍山,铁西', 'TieXi', 122.96963, 41.119885);
INSERT INTO `china_region` VALUES (119888, 2, 210300000000, 210304000000, '114000', '0412', '立山区', '立山', '辽宁,鞍山,立山', 'LiShan', 123.029091, 41.150401);
INSERT INTO `china_region` VALUES (120023, 2, 210300000000, 210311000000, '114000', '0412', '千山区', '千山', '辽宁,鞍山,千山', 'QianShan', 122.949298, 41.068909);
INSERT INTO `china_region` VALUES (120092, 2, 210300000000, 210321000000, '114100', '0412', '台安县', '台安', '辽宁,鞍山,台安', 'TaiAn', 122.436196, 41.412768);
INSERT INTO `china_region` VALUES (120272, 2, 210300000000, 210323000000, '118400', '0412', '岫岩满族自治县', '岫岩', '辽宁,鞍山,岫岩', 'XiuYan', 123.280935, 40.29088);
INSERT INTO `china_region` VALUES (120504, 2, 210300000000, 210381000000, '114200', '0412', '海城市', '海城', '辽宁,鞍山,海城', 'HaiCheng', 122.685217, 40.882377);
INSERT INTO `china_region` VALUES (120955, 1, 210000000000, 210400000000, '113000', '0413', '抚顺市', '抚顺', '辽宁,抚顺', 'FuShun', 123.957208, 41.880872);
INSERT INTO `china_region` VALUES (120956, 2, 210400000000, 210401000000, '113000', '0413', '市辖区', '抚顺', '辽宁,抚顺', 'FuShun', 123.957208, 41.880872);
INSERT INTO `china_region` VALUES (120957, 2, 210400000000, 210402000000, '113000', '0413', '新抚区', '新抚', '辽宁,抚顺,新抚', 'XinFu', 123.912861, 41.86208);
INSERT INTO `china_region` VALUES (121043, 2, 210400000000, 210403000000, '113000', '0413', '东洲区', '东洲', '辽宁,抚顺,东洲', 'DongZhou', 124.038685, 41.853192);
INSERT INTO `china_region` VALUES (121165, 2, 210400000000, 210404000000, '113000', '0413', '望花区', '望花', '辽宁,抚顺,望花', 'WangHua', 123.784206, 41.853646);
INSERT INTO `china_region` VALUES (121313, 2, 210400000000, 210411000000, '113000', '0413', '顺城区', '顺城', '辽宁,抚顺,顺城', 'ShunCheng', 123.94504, 41.883375);
INSERT INTO `china_region` VALUES (121437, 2, 210400000000, 210421000000, '113100', '0413', '抚顺县', '抚顺', '辽宁,抚顺', 'FuShun', 124.097979, 41.922644);
INSERT INTO `china_region` VALUES (121543, 2, 210400000000, 210422000000, '113200', '0413', '新宾满族自治县', '新宾', '辽宁,抚顺,新宾', 'XinBin', 125.039978, 41.734256);
INSERT INTO `china_region` VALUES (121753, 2, 210400000000, 210423000000, '113300', '0413', '清原满族自治县', '清原', '辽宁,抚顺,清原', 'QingYuan', 124.924083, 42.100539);
INSERT INTO `china_region` VALUES (121977, 1, 210000000000, 210500000000, '117000', '0414', '本溪市', '本溪', '辽宁,本溪', 'BenXi', 123.766485, 41.294175);
INSERT INTO `china_region` VALUES (121978, 2, 210500000000, 210501000000, '117000', '0414', '市辖区', '本溪', '辽宁,本溪', 'BenXi', 123.766485, 41.294175);
INSERT INTO `china_region` VALUES (121979, 2, 210500000000, 210502000000, '117000', '0414', '平山区', '平山', '辽宁,本溪,平山', 'PingShan', 123.768926, 41.299702);
INSERT INTO `china_region` VALUES (122051, 2, 210500000000, 210503000000, '117000', '0414', '溪湖区', '溪湖', '辽宁,本溪,溪湖', 'XiHu', 123.767647, 41.329219);
INSERT INTO `china_region` VALUES (122146, 2, 210500000000, 210504000000, '117000', '0414', '明山区', '明山', '辽宁,本溪,明山', 'MingShan', 123.817212, 41.30871);
INSERT INTO `china_region` VALUES (122238, 2, 210500000000, 210505000000, '117000', '0414', '南芬区', '南芬', '辽宁,本溪,南芬', 'NanFen', 123.744802, 41.100445);
INSERT INTO `china_region` VALUES (122282, 2, 210500000000, 210521000000, '117100', '0414', '本溪满族自治县', '本溪', '辽宁,本溪', 'BenXi', 124.120436, 41.301892);
INSERT INTO `china_region` VALUES (122429, 2, 210500000000, 210522000000, '117200', '0414', '桓仁满族自治县', '桓仁', '辽宁,本溪,桓仁', 'HuanRen', 125.361007, 41.267128);
INSERT INTO `china_region` VALUES (122568, 1, 210000000000, 210600000000, '118000', '0415', '丹东市', '丹东', '辽宁,丹东', 'DanDong', 124.354706, 40.000499);
INSERT INTO `china_region` VALUES (122569, 2, 210600000000, 210601000000, '118000', '0415', '市辖区', '丹东', '辽宁,丹东', 'DanDong', 124.354706, 40.000499);
INSERT INTO `china_region` VALUES (122570, 2, 210600000000, 210602000000, '118000', '0415', '元宝区', '元宝', '辽宁,丹东,元宝', 'YuanBao', 124.395757, 40.13652);
INSERT INTO `china_region` VALUES (122623, 2, 210600000000, 210603000000, '118000', '0415', '振兴区', '振兴', '辽宁,丹东,振兴', 'ZhenXing', 124.360264, 40.105194);
INSERT INTO `china_region` VALUES (122725, 2, 210600000000, 210604000000, '118000', '0415', '振安区', '振安', '辽宁,丹东,振安', 'ZhenAn', 124.428162, 40.158267);
INSERT INTO `china_region` VALUES (122798, 2, 210600000000, 210624000000, '118200', '0415', '宽甸满族自治县', '宽甸', '辽宁,丹东,宽甸', 'KuanDian', 124.78366, 40.731317);
INSERT INTO `china_region` VALUES (123017, 2, 210600000000, 210681000000, '118300', '0415', '东港市', '东港', '辽宁,丹东,东港', 'DongGang', 124.152705, 39.863008);
INSERT INTO `china_region` VALUES (123278, 2, 210600000000, 210682000000, '118100', '0415', '凤城市', '凤城', '辽宁,丹东,凤城', 'FengCheng', 124.066919, 40.452298);
INSERT INTO `china_region` VALUES (123537, 1, 210000000000, 210700000000, '121000', '0416', '锦州市', '锦州', '辽宁,锦州', 'JinZhou', 121.127003, 41.095119);
INSERT INTO `china_region` VALUES (123538, 2, 210700000000, 210701000000, '121000', '0416', '市辖区', '锦州', '辽宁,锦州', 'JinZhou', 121.127003, 41.095119);
INSERT INTO `china_region` VALUES (123539, 2, 210700000000, 210702000000, '121000', '0416', '古塔区', '古塔', '辽宁,锦州,古塔', 'GuTa', 121.128279, 41.117245);
INSERT INTO `china_region` VALUES (123617, 2, 210700000000, 210703000000, '121000', '0416', '凌河区', '凌河', '辽宁,锦州,凌河', 'LingHe', 121.150877, 41.11499);
INSERT INTO `china_region` VALUES (123708, 2, 210700000000, 210711000000, '121000', '0416', '太和区', '太和', '辽宁,锦州,太和', 'TaiHe', 121.103892, 41.109147);
INSERT INTO `china_region` VALUES (123885, 2, 210700000000, 210726000000, '121400', '0416', '黑山县', '黑山', '辽宁,锦州,黑山', 'HeiShan', 122.123443, 41.666028);
INSERT INTO `china_region` VALUES (124234, 2, 210700000000, 210727000000, '121100', '0416', '义县', '义县', '辽宁,锦州,义县', 'YiXian', 121.23908, 41.533087);
INSERT INTO `china_region` VALUES (124506, 2, 210700000000, 210781000000, '121200', '0416', '凌海市', '凌海', '辽宁,锦州,凌海', 'LingHai', 121.35773, 41.1734);
INSERT INTO `china_region` VALUES (124816, 2, 210700000000, 210782000000, '121300', '0416', '北镇市', '北镇', '辽宁,锦州,北镇', 'BeiZhen', 121.795962, 41.598764);
INSERT INTO `china_region` VALUES (125084, 1, 210000000000, 210800000000, '115000', '0417', '营口市', '营口', '辽宁,营口', 'YingKou', 122.235417, 40.667012);
INSERT INTO `china_region` VALUES (125085, 2, 210800000000, 210801000000, '115000', '0417', '市辖区', '营口', '辽宁,营口', 'YingKou', 122.235417, 40.667012);
INSERT INTO `china_region` VALUES (125086, 2, 210800000000, 210802000000, '115000', '0417', '站前区', '站前', '辽宁,营口,站前', 'ZhanQian', 122.258961, 40.67267);
INSERT INTO `china_region` VALUES (125140, 2, 210800000000, 210803000000, '115000', '0417', '西市区', '西市', '辽宁,营口,西市', 'XiShi', 122.206414, 40.666408);
INSERT INTO `china_region` VALUES (125191, 2, 210800000000, 210804000000, '115000', '0417', '鲅鱼圈区', '鲅鱼圈', '辽宁,营口,鲅鱼圈', 'BaYuQuan', 122.107814, 40.230636);
INSERT INTO `china_region` VALUES (125305, 2, 210800000000, 210811000000, '115000', '0417', '老边区', '老边', '辽宁,营口,老边', 'LaoBian', 122.379967, 40.680303);
INSERT INTO `china_region` VALUES (125372, 2, 210800000000, 210881000000, '115200', '0417', '盖州市', '盖州', '辽宁,营口,盖州', 'GaiZhou', 122.348936, 40.400611);
INSERT INTO `china_region` VALUES (125701, 2, 210800000000, 210882000000, '115100', '0417', '大石桥市', '大石桥', '辽宁,营口,大石桥', 'DaShiQiao', 122.509131, 40.644622);
INSERT INTO `china_region` VALUES (126008, 1, 210000000000, 210900000000, '123000', '0418', '阜新市', '阜新', '辽宁,阜新', 'FuXin', 121.670323, 42.021619);
INSERT INTO `china_region` VALUES (126009, 2, 210900000000, 210901000000, '123000', '0418', '市辖区', '阜新', '辽宁,阜新', 'FuXin', 121.670323, 42.021619);
INSERT INTO `china_region` VALUES (126010, 2, 210900000000, 210902000000, '123000', '0418', '海州区', '海州', '辽宁,阜新,海州', 'HaiZhou', 121.656255, 42.013242);
INSERT INTO `china_region` VALUES (126088, 2, 210900000000, 210903000000, '123000', '0418', '新邱区', '新邱', '辽宁,阜新,新邱', 'XinQiu', 121.792535, 42.087632);
INSERT INTO `china_region` VALUES (126116, 2, 210900000000, 210904000000, '123000', '0418', '太平区', '太平', '辽宁,阜新,太平', 'TaiPing', 121.678512, 42.0106);
INSERT INTO `china_region` VALUES (126166, 2, 210900000000, 210905000000, '123000', '0418', '清河门区', '清河门', '辽宁,阜新,清河门', 'QingHeMen', 121.416105, 41.7831);
INSERT INTO `china_region` VALUES (126201, 2, 210900000000, 210911000000, '123000', '0418', '细河区', '细河', '辽宁,阜新,细河', 'XiHe', 121.68054, 42.025495);
INSERT INTO `china_region` VALUES (126269, 2, 210900000000, 210921000000, '123100', '0418', '阜新蒙古族自治县', '阜新', '辽宁,阜新', 'FuXin', 121.757901, 42.065175);
INSERT INTO `china_region` VALUES (126698, 2, 210900000000, 210922000000, '123200', '0418', '彰武县', '彰武', '辽宁,阜新,彰武', 'ZhangWu', 122.538793, 42.386544);
INSERT INTO `china_region` VALUES (126923, 1, 210000000000, 211000000000, '111000', '0419', '辽阳市', '辽阳', '辽宁,辽阳', 'LiaoYang', 123.236944, 41.267244);
INSERT INTO `china_region` VALUES (126924, 2, 211000000000, 211001000000, '111000', '0419', '市辖区', '辽阳', '辽宁,辽阳', 'LiaoYang', 123.236944, 41.267244);
INSERT INTO `china_region` VALUES (126925, 2, 211000000000, 211002000000, '111000', '0419', '白塔区', '白塔', '辽宁,辽阳,白塔', 'BaiTa', 123.174325, 41.270347);
INSERT INTO `china_region` VALUES (127010, 2, 211000000000, 211003000000, '111000', '0419', '文圣区', '文圣', '辽宁,辽阳,文圣', 'WenSheng', 123.185386, 41.262608);
INSERT INTO `china_region` VALUES (127076, 2, 211000000000, 211004000000, '111000', '0419', '宏伟区', '宏伟', '辽宁,辽阳,宏伟', 'HongWei', 123.196672, 41.217649);
INSERT INTO `china_region` VALUES (127125, 2, 211000000000, 211005000000, '111000', '0419', '弓长岭区', '弓长岭', '辽宁,辽阳,弓长岭', 'GongChangLing', 123.419804, 41.151847);
INSERT INTO `china_region` VALUES (127164, 2, 211000000000, 211011000000, '111000', '0419', '太子河区', '太子河', '辽宁,辽阳,太子河', 'TaiZiHe', 123.181782, 41.253277);
INSERT INTO `china_region` VALUES (127245, 2, 211000000000, 211021000000, '111200', '0419', '辽阳县', '辽阳', '辽宁,辽阳', 'LiaoYang', 123.105695, 41.205329);
INSERT INTO `china_region` VALUES (127471, 2, 211000000000, 211081000000, '111300', '0419', '灯塔市', '灯塔', '辽宁,辽阳,灯塔', 'DengTa', 123.339312, 41.426372);
INSERT INTO `china_region` VALUES (127697, 1, 210000000000, 211100000000, '124000', '0427', '盘锦市', '盘锦', '辽宁,盘锦', 'PanJin', 122.070714, 41.119997);
INSERT INTO `china_region` VALUES (127698, 2, 211100000000, 211101000000, '124000', '0427', '市辖区', '盘锦', '辽宁,盘锦', 'PanJin', 122.070714, 41.119997);
INSERT INTO `china_region` VALUES (127699, 2, 211100000000, 211102000000, '124000', '0427', '双台子区', '双台子', '辽宁,盘锦,双台子', 'ShuangTaiZi', 122.060112, 41.190606);
INSERT INTO `china_region` VALUES (127759, 2, 211100000000, 211103000000, '124000', '0427', '兴隆台区', '兴隆台', '辽宁,盘锦,兴隆台', 'XingLongTai', 122.069897, 41.158678);
INSERT INTO `china_region` VALUES (127895, 2, 211100000000, 211104000000, '124200', '0427', '大洼区', '大洼', '辽宁,盘锦,大洼', 'DaWa', 122.070714, 41.119997);
INSERT INTO `china_region` VALUES (128103, 2, 211100000000, 211122000000, '124100', '0427', '盘山县', '盘山', '辽宁,盘锦,盘山', 'PanShan', 121.996499, 41.242873);
INSERT INTO `china_region` VALUES (128294, 1, 210000000000, 211200000000, '112000', '0410', '铁岭市', '铁岭', '辽宁,铁岭', 'TieLing', 123.726166, 42.223769);
INSERT INTO `china_region` VALUES (128295, 2, 211200000000, 211201000000, '112000', '0410', '市辖区', '铁岭', '辽宁,铁岭', 'TieLing', 123.726166, 42.223769);
INSERT INTO `china_region` VALUES (128296, 2, 211200000000, 211202000000, '112000', '0410', '银州区', '银州', '辽宁,铁岭,银州', 'YinZhou', 123.842305, 42.28613);
INSERT INTO `china_region` VALUES (128406, 2, 211200000000, 211204000000, '112000', '0410', '清河区', '清河', '辽宁,铁岭,清河', 'QingHe', 123.726166, 42.223769);
INSERT INTO `china_region` VALUES (128469, 2, 211200000000, 211221000000, '112600', '0410', '铁岭县', '铁岭', '辽宁,铁岭', 'TieLing', 123.729004, 42.223383);
INSERT INTO `china_region` VALUES (128718, 2, 211200000000, 211223000000, '112400', '0410', '西丰县', '西丰', '辽宁,铁岭,西丰', 'XiFeng', 124.727393, 42.73803);
INSERT INTO `china_region` VALUES (128924, 2, 211200000000, 211224000000, '112500', '0410', '昌图县', '昌图', '辽宁,铁岭,昌图', 'ChangTu', 124.1111, 42.785791);
INSERT INTO `china_region` VALUES (129477, 2, 211200000000, 211281000000, '112700', '0410', '调兵山市', '调兵山', '辽宁,铁岭,调兵山', 'DiaoBingShan', 123.567117, 42.467521);
INSERT INTO `china_region` VALUES (129545, 2, 211200000000, 211282000000, '112300', '0410', '开原市', '开原', '辽宁,铁岭,开原', 'KaiYuan', 124.038268, 42.546307);
INSERT INTO `china_region` VALUES (129861, 1, 210000000000, 211300000000, '122000', '0421', '朝阳市', '朝阳', '辽宁,朝阳', 'ZhaoYang', 120.450372, 41.573734);
INSERT INTO `china_region` VALUES (129862, 2, 211300000000, 211301000000, '122000', '0421', '市辖区', '朝阳', '辽宁,朝阳', 'ZhaoYang', 120.389862, 41.497767);
INSERT INTO `china_region` VALUES (129863, 2, 211300000000, 211302000000, '122000', '0421', '双塔区', '双塔', '辽宁,朝阳,双塔', 'ShuangTa', 120.453744, 41.565628);
INSERT INTO `china_region` VALUES (129986, 2, 211300000000, 211303000000, '122000', '0421', '龙城区', '龙城', '辽宁,朝阳,龙城', 'LongCheng', 120.413376, 41.576749);
INSERT INTO `china_region` VALUES (130089, 2, 211300000000, 211321000000, '122000', '0421', '朝阳县', '朝阳', '辽宁,朝阳', 'ZhaoYang', 120.389862, 41.497767);
INSERT INTO `china_region` VALUES (130418, 2, 211300000000, 211322000000, '122400', '0421', '建平县', '建平', '辽宁,朝阳,建平', 'JianPing', 119.64328, 41.403128);
INSERT INTO `china_region` VALUES (130745, 2, 211300000000, 211324000000, '122300', '0421', '喀喇沁左翼蒙古族自治县', '喀喇沁左翼', '辽宁,朝阳,喀喇沁左翼', 'KaLaQinZuoYi', 119.741223, 41.12815);
INSERT INTO `china_region` VALUES (130973, 2, 211300000000, 211381000000, '122100', '0421', '北票市', '北票', '辽宁,朝阳,北票', 'BeiPiao', 120.77073, 41.800684);
INSERT INTO `china_region` VALUES (131309, 2, 211300000000, 211382000000, '122500', '0421', '凌源市', '凌源', '辽宁,朝阳,凌源', 'LingYuan', 119.401574, 41.245445);
INSERT INTO `china_region` VALUES (131623, 1, 210000000000, 211400000000, '125000', '0429', '葫芦岛市', '葫芦岛', '辽宁,葫芦岛', 'HuLuDao', 120.836932, 40.711052);
INSERT INTO `china_region` VALUES (131624, 2, 211400000000, 211401000000, '125000', '0429', '市辖区', '葫芦岛', '辽宁,葫芦岛', 'HuLuDao', 120.836932, 40.711052);
INSERT INTO `china_region` VALUES (131625, 2, 211400000000, 211402000000, '125000', '0429', '连山区', '连山', '辽宁,葫芦岛,连山', 'LianShan', 120.869231, 40.774461);
INSERT INTO `china_region` VALUES (131869, 2, 211400000000, 211403000000, '125000', '0429', '龙港区', '龙港', '辽宁,葫芦岛,龙港', 'LongGang', 120.893786, 40.735519);
INSERT INTO `china_region` VALUES (131970, 2, 211400000000, 211404000000, '125000', '0429', '南票区', '南票', '辽宁,葫芦岛,南票', 'NanPiao', 120.749728, 41.107108);
INSERT INTO `china_region` VALUES (132149, 2, 211400000000, 211421000000, '125200', '0429', '绥中县', '绥中', '辽宁,葫芦岛,绥中', 'SuiZhong', 120.344229, 40.325659);
INSERT INTO `china_region` VALUES (132481, 2, 211400000000, 211422000000, '125300', '0429', '建昌县', '建昌', '辽宁,葫芦岛,建昌', 'JianChang', 119.837124, 40.824368);
INSERT INTO `china_region` VALUES (132808, 2, 211400000000, 211481000000, '125100', '0429', '兴城市', '兴城', '辽宁,葫芦岛,兴城', 'XingCheng', 120.72831, 40.614762);
INSERT INTO `china_region` VALUES (133111, 0, 0, 220000000000, '0', NULL, '吉林省', '吉林', '吉林', 'JiLin', 125.32599, 43.896536);
INSERT INTO `china_region` VALUES (133112, 1, 220000000000, 220100000000, '130000', '0431', '长春市', '长春', '吉林,长春', 'ChangChun', 125.323544, 43.817071);
INSERT INTO `china_region` VALUES (133113, 2, 220100000000, 220101000000, '130000', '0431', '市辖区', '长春', '吉林,长春', 'ChangChun', 125.323544, 43.817071);
INSERT INTO `china_region` VALUES (133114, 2, 220100000000, 220102000000, '130000', '0431', '南关区', '南关', '吉林,长春,南关', 'NanGuan', 125.350173, 43.863989);
INSERT INTO `china_region` VALUES (133194, 2, 220100000000, 220103000000, '130000', '0431', '宽城区', '宽城', '吉林,长春,宽城', 'KuanCheng', 125.326578, 43.943614);
INSERT INTO `china_region` VALUES (133361, 2, 220100000000, 220104000000, '130000', '0431', '朝阳区', '朝阳', '吉林,长春,朝阳', 'ZhaoYang', 125.288319, 43.833513);
INSERT INTO `china_region` VALUES (133451, 2, 220100000000, 220105000000, '130000', '0431', '二道区', '二道', '吉林,长春,二道', 'ErDao', 125.374217, 43.865596);
INSERT INTO `china_region` VALUES (133542, 2, 220100000000, 220106000000, '130000', '0431', '绿园区', '绿园', '吉林,长春,绿园', 'LyuYuan', 125.256136, 43.880975);
INSERT INTO `china_region` VALUES (133636, 2, 220100000000, 220112000000, '130600', '0431', '双阳区', '双阳', '吉林,长春,双阳', 'ShuangYang', 125.664662, 43.525311);
INSERT INTO `china_region` VALUES (133799, 2, 220100000000, 220113000000, '130052', '0431', '九台区', '九台', '吉林,长春,九台', 'JiuTai', 125.839574, 44.151742);
INSERT INTO `china_region` VALUES (134159, 2, 220100000000, 220122000000, '130200', '0431', '农安县', '农安', '吉林,长春,农安', 'NongAn', 125.184742, 44.432889);
INSERT INTO `china_region` VALUES (134570, 2, 220100000000, 220171000000, '130212', '0431', '长春经济技术开发区', '长春经开区', '吉林,长春,长春经开区', 'ChangChunJingKaiQu', 125.427188, 43.879016);
INSERT INTO `china_region` VALUES (134613, 2, 220100000000, 220172000000, '130117', '0431', '长春净月高新技术产业开发区', '长春净月高', '吉林,长春,长春净月高', 'ChangChunJingYueGao', 125.424712, 43.766505);
INSERT INTO `china_region` VALUES (134687, 2, 220100000000, 220173000000, '130212', '0431', '长春高新技术产业开发区', '长春高', '吉林,长春,长春高', 'ChangChunGao', 125.414501, 43.977101);
INSERT INTO `china_region` VALUES (134727, 2, 220100000000, 220174000000, '130011', '0431', '长春汽车经济技术开发区', '长春汽车经开区', '吉林,长春,长春汽车经开区', 'ChangChunQiCheJingKaiQu', 125.244097, 43.874493);
INSERT INTO `china_region` VALUES (134763, 2, 220100000000, 220182000000, '130400', '0431', '榆树市', '榆树', '吉林,长春,榆树', 'YuShu', 126.533146, 44.840288);
INSERT INTO `china_region` VALUES (135196, 2, 220100000000, 220183000000, '130300', '0431', '德惠市', '德惠', '吉林,长春,德惠', 'DeHui', 125.72862, 44.521785);
INSERT INTO `china_region` VALUES (135527, 1, 220000000000, 220200000000, '132000', '0432', '吉林市', '吉林', '吉林', 'JiLin', 126.549576, 43.837883);
INSERT INTO `china_region` VALUES (135528, 2, 220200000000, 220201000000, '130000', '0432', '市辖区', '吉林', '吉林', 'JiLin', 125.32599, 43.896536);
INSERT INTO `china_region` VALUES (135529, 2, 220200000000, 220202000000, '132000', '0432', '昌邑区', '昌邑', '吉林,昌邑', 'ChangYi', 126.57471, 43.881818);
INSERT INTO `china_region` VALUES (135705, 2, 220200000000, 220203000000, '132000', '0432', '龙潭区', '龙潭', '吉林,龙潭', 'LongTan', 126.562197, 43.910803);
INSERT INTO `china_region` VALUES (135898, 2, 220200000000, 220204000000, '132000', '0432', '船营区', '船营', '吉林,船营', 'ChuanYing', 126.540966, 43.833445);
INSERT INTO `china_region` VALUES (136030, 2, 220200000000, 220211000000, '132000', '0432', '丰满区', '丰满', '吉林,丰满', 'FengMan', 126.562274, 43.821601);
INSERT INTO `china_region` VALUES (136132, 2, 220200000000, 220221000000, '132100', '0432', '永吉县', '永吉', '吉林,永吉', 'YongJi', 126.497741, 43.672582);
INSERT INTO `china_region` VALUES (136281, 2, 220200000000, 220271000000, '134099', '0432', '吉林经济开发区', '吉林经开区', '吉林,经开区', 'JiLinJingKaiQu', 126.469228, 43.989961);
INSERT INTO `china_region` VALUES (136323, 2, 220200000000, 220272000000, '737305', '0432', '吉林高新技术产业开发区', '吉林高', '吉林,高', 'JiLinGao', 126.601499, 43.792302);
INSERT INTO `china_region` VALUES (136355, 2, 220200000000, 220273000000, '132399', '0432', '吉林中国新加坡食品区', '吉林中国新加坡食品', '吉林,中国新加坡食品', 'JiLinZhongGuoXinJiaPoShiPin', 125.992012, 43.725565);
INSERT INTO `china_region` VALUES (136376, 2, 220200000000, 220281000000, '132500', '0432', '蛟河市', '蛟河', '吉林,蛟河', 'JiaoHe', 127.344501, 43.723713);
INSERT INTO `china_region` VALUES (136680, 2, 220200000000, 220282000000, '132400', '0432', '桦甸市', '桦甸', '吉林,桦甸', 'HuaDian', 126.74631, 42.972097);
INSERT INTO `china_region` VALUES (136870, 2, 220200000000, 220283000000, '132600', '0432', '舒兰市', '舒兰', '吉林,舒兰', 'ShuLan', 126.965607, 44.406106);
INSERT INTO `china_region` VALUES (137134, 2, 220200000000, 220284000000, '132300', '0432', '磐石市', '磐石', '吉林,磐石', 'PanShi', 126.060427, 42.946285);
INSERT INTO `china_region` VALUES (137451, 1, 220000000000, 220300000000, '136000', '0434', '四平市', '四平', '吉林,四平', 'SiPing', 124.350398, 43.166419);
INSERT INTO `china_region` VALUES (137452, 2, 220300000000, 220301000000, '136000', '0434', '市辖区', '四平', '吉林,四平', 'SiPing', 124.350398, 43.166419);
INSERT INTO `china_region` VALUES (137453, 2, 220300000000, 220302000000, '136000', '0434', '铁西区', '铁西', '吉林,四平,铁西', 'TieXi', 124.345722, 43.146155);
INSERT INTO `china_region` VALUES (137521, 2, 220300000000, 220303000000, '136000', '0434', '铁东区', '铁东', '吉林,四平,铁东', 'TieDong', 124.409622, 43.162048);
INSERT INTO `china_region` VALUES (137632, 2, 220300000000, 220322000000, '136500', '0434', '梨树县', '梨树', '吉林,四平,梨树', 'LiShu', 124.33539, 43.30706);
INSERT INTO `china_region` VALUES (138002, 2, 220300000000, 220323000000, '130700', '0434', '伊通满族自治县', '伊通', '吉林,四平,伊通', 'YiTong', 125.305394, 43.345754);
INSERT INTO `china_region` VALUES (138227, 2, 220300000000, 220381000000, '136100', '0434', '公主岭市', '公主岭', '吉林,四平,公主岭', 'GongZhuLing', 124.82283, 43.504687);
INSERT INTO `china_region` VALUES (138731, 2, 220300000000, 220382000000, '136400', '0434', '双辽市', '双辽', '吉林,四平,双辽', 'ShuangLiao', 123.502724, 43.518302);
INSERT INTO `china_region` VALUES (138976, 1, 220000000000, 220400000000, '136200', '0437', '辽源市', '辽源', '吉林,辽源', 'LiaoYuan', 125.143532, 42.887918);
INSERT INTO `china_region` VALUES (138977, 2, 220400000000, 220401000000, '136200', '0437', '市辖区', '辽源', '吉林,辽源', 'LiaoYuan', 125.143532, 42.887918);
INSERT INTO `china_region` VALUES (138978, 2, 220400000000, 220402000000, '136200', '0437', '龙山区', '龙山', '吉林,辽源,龙山', 'LongShan', 125.136452, 42.901534);
INSERT INTO `china_region` VALUES (139031, 2, 220400000000, 220403000000, '136200', '0437', '西安区', '西安', '吉林,辽源,西安', 'XiAn', 125.149283, 42.927265);
INSERT INTO `china_region` VALUES (139069, 2, 220400000000, 220421000000, '136300', '0437', '东丰县', '东丰', '吉林,辽源,东丰', 'DongFeng', 125.530991, 42.676935);
INSERT INTO `china_region` VALUES (139323, 2, 220400000000, 220422000000, '136600', '0437', '东辽县', '东辽', '吉林,辽源,东辽', 'DongLiao', 124.991521, 42.926331);
INSERT INTO `china_region` VALUES (139589, 1, 220000000000, 220500000000, '134000', '0435', '通化市', '通化', '吉林,通化', 'TongHua', 125.939697, 41.728401);
INSERT INTO `china_region` VALUES (139590, 2, 220500000000, 220501000000, '134000', '0435', '市辖区', '通化', '吉林,通化', 'TongHua', 125.939697, 41.728401);
INSERT INTO `china_region` VALUES (139591, 2, 220500000000, 220502000000, '134000', '0435', '东昌区', '东昌', '吉林,通化,东昌', 'DongChang', 125.955102, 41.728498);
INSERT INTO `china_region` VALUES (139661, 2, 220500000000, 220503000000, '134000', '0435', '二道江区', '二道江', '吉林,通化,二道江', 'ErDaoJiang', 126.042535, 41.774053);
INSERT INTO `china_region` VALUES (139709, 2, 220500000000, 220521000000, '134100', '0435', '通化县', '通化', '吉林,通化', 'TongHua', 125.759259, 41.679808);
INSERT INTO `china_region` VALUES (139905, 2, 220500000000, 220523000000, '135100', '0435', '辉南县', '辉南', '吉林,通化,辉南', 'HuiNan', 126.046912, 42.684993);
INSERT INTO `china_region` VALUES (140083, 2, 220500000000, 220524000000, '135300', '0435', '柳河县', '柳河', '吉林,通化,柳河', 'LiuHe', 125.744735, 42.284606);
INSERT INTO `china_region` VALUES (140343, 2, 220500000000, 220581000000, '135000', '0435', '梅河口市', '梅河口', '吉林,通化,梅河口', 'MeiHeKou', 125.683832, 42.530341);
INSERT INTO `china_region` VALUES (140698, 2, 220500000000, 220582000000, '134200', '0435', '集安市', '集安', '吉林,通化,集安', 'JiAn', 126.194031, 41.125307);
INSERT INTO `china_region` VALUES (140869, 1, 220000000000, 220600000000, '134300', '0439', '白山市', '白山', '吉林,白山', 'BaiShan', 126.423587, 41.939994);
INSERT INTO `china_region` VALUES (140870, 2, 220600000000, 220601000000, '134300', '0439', '市辖区', '白山', '吉林,白山', 'BaiShan', 126.423587, 41.939994);
INSERT INTO `china_region` VALUES (140871, 2, 220600000000, 220602000000, '134399', '0439', '浑江区', '浑江', '吉林,白山,浑江', 'HunJiang', 126.416094, 41.945409);
INSERT INTO `china_region` VALUES (140981, 2, 220600000000, 220605000000, '134700', '0439', '江源区', '江源', '吉林,白山,江源', 'JiangYuan', 126.591144, 42.056773);
INSERT INTO `china_region` VALUES (141083, 2, 220600000000, 220621000000, '134500', '0439', '抚松县', '抚松', '吉林,白山,抚松', 'FuSong', 127.449764, 42.221208);
INSERT INTO `china_region` VALUES (141271, 2, 220600000000, 220622000000, '135200', '0439', '靖宇县', '靖宇', '吉林,白山,靖宇', 'JingYu', 126.813625, 42.38876);
INSERT INTO `china_region` VALUES (141399, 2, 220600000000, 220623000000, '134400', '0439', '长白朝鲜族自治县', '长白', '吉林,白山,长白', 'ChangBai', 128.200789, 41.420018);
INSERT INTO `china_region` VALUES (141495, 2, 220600000000, 220681000000, '134600', '0439', '临江市', '临江', '吉林,白山,临江', 'LinJiang', 126.918087, 41.811979);
INSERT INTO `china_region` VALUES (141617, 1, 220000000000, 220700000000, '138000', '0438', '松原市', '松原', '吉林,松原', 'SongYuan', 124.825117, 45.141789);
INSERT INTO `china_region` VALUES (141618, 2, 220700000000, 220701000000, '138000', '0438', '市辖区', '松原', '吉林,松原', 'SongYuan', 124.825117, 45.141789);
INSERT INTO `china_region` VALUES (141619, 2, 220700000000, 220702000000, '138000', '0438', '宁江区', '宁江', '吉林,松原,宁江', 'NingJiang', 124.817054, 45.171792);
INSERT INTO `china_region` VALUES (141818, 2, 220700000000, 220721000000, '131100', '0438', '前郭尔罗斯蒙古族自治县', '前郭尔罗斯', '吉林,松原,前郭尔罗斯', 'QianGuoErLuoSi', 124.823242, 45.11803);
INSERT INTO `china_region` VALUES (142140, 2, 220700000000, 220722000000, '131500', '0438', '长岭县', '长岭', '吉林,松原,长岭', 'ChangLing', 123.967484, 44.275895);
INSERT INTO `china_region` VALUES (142425, 2, 220700000000, 220723000000, '131400', '0438', '乾安县', '乾安', '吉林,松原,乾安', 'QianAn', 124.041139, 45.003774);
INSERT INTO `china_region` VALUES (142621, 2, 220700000000, 220771000000, '131299', '0438', '吉林松原经济开发区', '吉林松原经开区', '吉林,松原,松原经开区', 'JiLinSongYuanJingKaiQu', 124.825117, 45.141789);
INSERT INTO `china_region` VALUES (142639, 2, 220700000000, 220781000000, '131200', '0438', '扶余市', '扶余', '吉林,松原,扶余', 'FuYu', 126.049774, 44.988449);
INSERT INTO `china_region` VALUES (143072, 1, 220000000000, 220800000000, '137000', '0436', '白城市', '白城', '吉林,白城', 'BaiCheng', 122.839024, 45.619641);
INSERT INTO `china_region` VALUES (143073, 2, 220800000000, 220801000000, '137000', '0436', '市辖区', '白城', '吉林,白城', 'BaiCheng', 122.839024, 45.619641);
INSERT INTO `china_region` VALUES (143074, 2, 220800000000, 220802000000, '137000', '0436', '洮北区', '洮北', '吉林,白城,洮北', 'TaoBei', 122.851029, 45.621716);
INSERT INTO `china_region` VALUES (143307, 2, 220800000000, 220821000000, '137300', '0436', '镇赉县', '镇赉', '吉林,白城,镇赉', 'ZhenLai', 123.19989, 45.847435);
INSERT INTO `china_region` VALUES (143489, 2, 220800000000, 220822000000, '137200', '0436', '通榆县', '通榆', '吉林,白城,通榆', 'TongYu', 123.088239, 44.812911);
INSERT INTO `china_region` VALUES (143712, 2, 220800000000, 220871000000, '137000', '0436', '吉林白城经济开发区', '吉林白城经开区', '吉林,白城,白城经开区', 'JiLinBaiChengJingKaiQu', 122.834166, 45.599918);
INSERT INTO `china_region` VALUES (143739, 2, 220800000000, 220881000000, '137100', '0436', '洮南市', '洮南', '吉林,白城,洮南', 'TaoNan', 122.783779, 45.339113);
INSERT INTO `china_region` VALUES (144010, 2, 220800000000, 220882000000, '131300', '0436', '大安市', '大安', '吉林,白城,大安', 'DaAn', 124.292626, 45.506996);
INSERT INTO `china_region` VALUES (144294, 1, 220000000000, 222400000000, '133000', '1433', '延边朝鲜族自治州', '延边', '吉林,延边', 'YanBian', 129.508946, 42.891253);
INSERT INTO `china_region` VALUES (144295, 2, 222400000000, 222401000000, '133000', '1433', '延吉市', '延吉', '吉林,延边,延吉', 'YanJi', 129.508946, 42.891255);
INSERT INTO `china_region` VALUES (144451, 2, 222400000000, 222402000000, '133100', '1433', '图们市', '图们', '吉林,延边,图们', 'TuMen', 129.84371, 42.968044);
INSERT INTO `china_region` VALUES (144530, 2, 222400000000, 222403000000, '133700', '1433', '敦化市', '敦化', '吉林,延边,敦化', 'DunHua', 128.232013, 43.372413);
INSERT INTO `china_region` VALUES (144971, 2, 222400000000, 222404000000, '133300', '1433', '珲春市', '珲春', '吉林,延边,珲春', 'HuiChun', 130.366036, 42.862821);
INSERT INTO `china_region` VALUES (145150, 2, 222400000000, 222405000000, '133400', '1433', '龙井市', '龙井', '吉林,延边,龙井', 'LongJing', 129.427066, 42.766311);
INSERT INTO `china_region` VALUES (145259, 2, 222400000000, 222406000000, '133500', '1433', '和龙市', '和龙', '吉林,延边,和龙', 'HeLong', 129.010106, 42.546675);
INSERT INTO `china_region` VALUES (145402, 2, 222400000000, 222424000000, '133200', '1433', '汪清县', '汪清', '吉林,延边,汪清', 'WangQing', 129.771607, 43.312522);
INSERT INTO `china_region` VALUES (145681, 2, 222400000000, 222426000000, '133600', '1433', '安图县', '安图', '吉林,延边,安图', 'AnTu', 128.899807, 43.111964);
INSERT INTO `china_region` VALUES (145925, 0, 0, 230000000000, '0', NULL, '黑龙江省', '黑龙江', '黑龙江', 'HeiLongJiang', 126.661669, 45.742347);
INSERT INTO `china_region` VALUES (145926, 1, 230000000000, 230100000000, '150000', '0451', '哈尔滨市', '哈尔滨', '黑龙江,哈尔滨', 'HaErBin', 126.534967, 45.803775);
INSERT INTO `china_region` VALUES (145927, 2, 230100000000, 230101000000, '150000', '0451', '市辖区', '哈尔滨', '黑龙江,哈尔滨', 'HaErBin', 126.534967, 45.803775);
INSERT INTO `china_region` VALUES (145928, 2, 230100000000, 230102000000, '150000', '0451', '道里区', '道里', '黑龙江,哈尔滨,道里', 'DaoLi', 126.616957, 45.755777);
INSERT INTO `china_region` VALUES (146138, 2, 230100000000, 230103000000, '150000', '0451', '南岗区', '南岗', '黑龙江,哈尔滨,南岗', 'NanGang', 126.668788, 45.75997);
INSERT INTO `china_region` VALUES (146356, 2, 230100000000, 230104000000, '150000', '0451', '道外区', '道外', '黑龙江,哈尔滨,道外', 'DaoWai', 126.649451, 45.792113);
INSERT INTO `china_region` VALUES (146552, 2, 230100000000, 230108000000, '150000', '0451', '平房区', '平房', '黑龙江,哈尔滨,平房', 'PingFang', 126.637593, 45.597901);
INSERT INTO `china_region` VALUES (146609, 2, 230100000000, 230109000000, '150000', '0451', '松北区', '松北', '黑龙江,哈尔滨,松北', 'SongBei', 126.510275, 45.802756);
INSERT INTO `china_region` VALUES (146714, 2, 230100000000, 230110000000, '150000', '0451', '香坊区', '香坊', '黑龙江,哈尔滨,香坊', 'XiangFang', 126.662593, 45.707716);
INSERT INTO `china_region` VALUES (146910, 2, 230100000000, 230111000000, '150500', '0451', '呼兰区', '呼兰', '黑龙江,哈尔滨,呼兰', 'HuLan', 126.587709, 45.889427);
INSERT INTO `china_region` VALUES (147182, 2, 230100000000, 230112000000, '150000', '0451', '阿城区', '阿城', '黑龙江,哈尔滨,阿城', 'ACheng', 126.958098, 45.54867);
INSERT INTO `china_region` VALUES (147390, 2, 230100000000, 230113000000, '150100', '0451', '双城区', '双城', '黑龙江,哈尔滨,双城', 'ShuangCheng', 126.312745, 45.383263);
INSERT INTO `china_region` VALUES (147701, 2, 230100000000, 230123000000, '154800', '0451', '依兰县', '依兰', '黑龙江,哈尔滨,依兰', 'YiLan', 129.567985, 46.324534);
INSERT INTO `china_region` VALUES (147880, 2, 230100000000, 230124000000, '150800', '0451', '方正县', '方正', '黑龙江,哈尔滨,方正', 'FangZheng', 128.829536, 45.851695);
INSERT INTO `china_region` VALUES (147980, 2, 230100000000, 230125000000, '150400', '0451', '宾县', '宾县', '黑龙江,哈尔滨,宾县', 'BinXian', 127.466634, 45.745918);
INSERT INTO `china_region` VALUES (148188, 2, 230100000000, 230126000000, '151800', '0451', '巴彦县', '巴彦', '黑龙江,哈尔滨,巴彦', 'BaYan', 127.403182, 46.085379);
INSERT INTO `china_region` VALUES (148344, 2, 230100000000, 230127000000, '151900', '0451', '木兰县', '木兰', '黑龙江,哈尔滨,木兰', 'MuLan', 128.043466, 45.950582);
INSERT INTO `china_region` VALUES (148462, 2, 230100000000, 230128000000, '150900', '0451', '通河县', '通河', '黑龙江,哈尔滨,通河', 'TongHe', 128.749352, 45.972425);
INSERT INTO `china_region` VALUES (148637, 2, 230100000000, 230129000000, '150700', '0451', '延寿县', '延寿', '黑龙江,哈尔滨,延寿', 'YanShou', 128.331644, 45.451897);
INSERT INTO `china_region` VALUES (148788, 2, 230100000000, 230183000000, '150600', '0451', '尚志市', '尚志', '黑龙江,哈尔滨,尚志', 'ShangZhi', 128.009895, 45.209586);
INSERT INTO `china_region` VALUES (149039, 2, 230100000000, 230184000000, '150200', '0451', '五常市', '五常', '黑龙江,哈尔滨,五常', 'WuChang', 127.167619, 44.931992);
INSERT INTO `china_region` VALUES (149365, 1, 230000000000, 230200000000, '161000', '0452', '齐齐哈尔市', '齐齐哈尔', '黑龙江,齐齐哈尔', 'QiQiHaEr', 123.918186, 47.354348);
INSERT INTO `china_region` VALUES (149366, 2, 230200000000, 230201000000, '161000', '0452', '市辖区', '齐齐哈尔', '黑龙江,齐齐哈尔', 'QiQiHaEr', 123.918186, 47.354348);
INSERT INTO `china_region` VALUES (149367, 2, 230200000000, 230202000000, '161000', '0452', '龙沙区', '龙沙', '黑龙江,齐齐哈尔,龙沙', 'LongSha', 123.957531, 47.317309);
INSERT INTO `china_region` VALUES (149416, 2, 230200000000, 230203000000, '161000', '0452', '建华区', '建华', '黑龙江,齐齐哈尔,建华', 'JianHua', 123.955464, 47.354364);
INSERT INTO `china_region` VALUES (149461, 2, 230200000000, 230204000000, '161000', '0452', '铁锋区', '铁锋', '黑龙江,齐齐哈尔,铁锋', 'TieFeng', 123.978293, 47.340518);
INSERT INTO `china_region` VALUES (149519, 2, 230200000000, 230205000000, '161000', '0452', '昂昂溪区', '昂昂溪', '黑龙江,齐齐哈尔,昂昂溪', 'AngAngXi', 123.822401, 47.15516);
INSERT INTO `china_region` VALUES (149554, 2, 230200000000, 230206000000, '161000', '0452', '富拉尔基区', '富拉尔基', '黑龙江,齐齐哈尔,富拉尔基', 'FuLaErJi', 123.62919, 47.208843);
INSERT INTO `china_region` VALUES (149605, 2, 230200000000, 230207000000, '161000', '0452', '碾子山区', '碾子山', '黑龙江,齐齐哈尔,碾子山', 'NianZiShan', 122.887775, 47.516872);
INSERT INTO `china_region` VALUES (149626, 2, 230200000000, 230208000000, '161000', '0452', '梅里斯达斡尔族区', '梅里斯', '黑龙江,齐齐哈尔,梅里斯', 'MeiLiSi', 123.75291, 47.309537);
INSERT INTO `china_region` VALUES (149693, 2, 230200000000, 230221000000, '161100', '0452', '龙江县', '龙江', '黑龙江,齐齐哈尔', 'LongJiang', 123.205323, 47.338665);
INSERT INTO `china_region` VALUES (149878, 2, 230200000000, 230223000000, '161500', '0452', '依安县', '依安', '黑龙江,齐齐哈尔,依安', 'YiAn', 125.306279, 47.893548);
INSERT INTO `china_region` VALUES (150057, 2, 230200000000, 230224000000, '162400', '0452', '泰来县', '泰来', '黑龙江,齐齐哈尔,泰来', 'TaiLai', 123.416631, 46.393694);
INSERT INTO `china_region` VALUES (150186, 2, 230200000000, 230225000000, '162100', '0452', '甘南县', '甘南', '黑龙江,齐齐哈尔,甘南', 'GanNan', 123.507429, 47.922406);
INSERT INTO `china_region` VALUES (150323, 2, 230200000000, 230227000000, '161200', '0452', '富裕县', '富裕', '黑龙江,齐齐哈尔,富裕', 'FuYu', 124.473924, 47.77455);
INSERT INTO `china_region` VALUES (150445, 2, 230200000000, 230229000000, '161600', '0452', '克山县', '克山', '黑龙江,齐齐哈尔,克山', 'KeShan', 125.875705, 48.037031);
INSERT INTO `china_region` VALUES (150619, 2, 230200000000, 230230000000, '164800', '0452', '克东县', '克东', '黑龙江,齐齐哈尔,克东', 'KeDong', 126.248721, 48.04206);
INSERT INTO `china_region` VALUES (150753, 2, 230200000000, 230231000000, '164700', '0452', '拜泉县', '拜泉', '黑龙江,齐齐哈尔,拜泉', 'BaiQuan', 126.100213, 47.595851);
INSERT INTO `china_region` VALUES (150962, 2, 230200000000, 230281000000, '161300', '0452', '讷河市', '讷河', '黑龙江,齐齐哈尔,讷河', 'NeHe', 124.884244, 48.484099);
INSERT INTO `china_region` VALUES (151199, 1, 230000000000, 230300000000, '158100', '0467', '鸡西市', '鸡西', '黑龙江,鸡西', 'JiXi', 130.969333, 45.295075);
INSERT INTO `china_region` VALUES (151200, 2, 230300000000, 230301000000, '158100', '0467', '市辖区', '鸡西', '黑龙江,鸡西', 'JiXi', 130.969333, 45.295075);
INSERT INTO `china_region` VALUES (151201, 2, 230300000000, 230302000000, '158100', '0467', '鸡冠区', '鸡冠', '黑龙江,鸡西,鸡冠', 'JiGuan', 130.980894, 45.304073);
INSERT INTO `china_region` VALUES (151268, 2, 230300000000, 230303000000, '158100', '0467', '恒山区', '恒山', '黑龙江,鸡西,恒山', 'HengShan', 130.904963, 45.210668);
INSERT INTO `china_region` VALUES (151323, 2, 230300000000, 230304000000, '158100', '0467', '滴道区', '滴道', '黑龙江,鸡西,滴道', 'DiDao', 130.843613, 45.348764);
INSERT INTO `china_region` VALUES (151368, 2, 230300000000, 230305000000, '158100', '0467', '梨树区', '梨树', '黑龙江,鸡西,梨树', 'LiShu', 130.69699, 45.092046);
INSERT INTO `china_region` VALUES (151397, 2, 230300000000, 230306000000, '158100', '0467', '城子河区', '城子河', '黑龙江,鸡西,城子河', 'ChengZiHe', 131.011304, 45.33697);
INSERT INTO `china_region` VALUES (151438, 2, 230300000000, 230307000000, '158100', '0467', '麻山区', '麻山', '黑龙江,鸡西,麻山', 'MaShan', 130.478187, 45.212088);
INSERT INTO `china_region` VALUES (151461, 2, 230300000000, 230321000000, '158200', '0467', '鸡东县', '鸡东', '黑龙江,鸡西,鸡东', 'JiDong', 131.12408, 45.260412);
INSERT INTO `china_region` VALUES (151628, 2, 230300000000, 230381000000, '158400', '0467', '虎林市', '虎林', '黑龙江,鸡西,虎林', 'HuLin', 132.93721, 45.762686);
INSERT INTO `china_region` VALUES (151840, 2, 230300000000, 230382000000, '158300', '0467', '密山市', '密山', '黑龙江,鸡西,密山', 'MiShan', 131.846636, 45.529775);
INSERT INTO `china_region` VALUES (152086, 1, 230000000000, 230400000000, '154100', '0468', '鹤岗市', '鹤岗', '黑龙江,鹤岗', 'HeGang', 130.297964, 47.349916);
INSERT INTO `china_region` VALUES (152087, 2, 230400000000, 230401000000, '154100', '0468', '市辖区', '鹤岗', '黑龙江,鹤岗', 'HeGang', 130.297964, 47.349916);
INSERT INTO `china_region` VALUES (152088, 2, 230400000000, 230402000000, '154100', '0468', '向阳区', '向阳', '黑龙江,鹤岗,向阳', 'XiangYang', 130.294309, 47.342478);
INSERT INTO `china_region` VALUES (152111, 2, 230400000000, 230403000000, '154100', '0468', '工农区', '工农', '黑龙江,鹤岗,工农', 'GongNong', 130.274684, 47.318781);
INSERT INTO `china_region` VALUES (152132, 2, 230400000000, 230404000000, '154100', '0468', '南山区', '南山', '黑龙江,鹤岗,南山', 'NanShan', 130.287057, 47.315127);
INSERT INTO `china_region` VALUES (152150, 2, 230400000000, 230405000000, '154100', '0468', '兴安区', '兴安', '黑龙江,鹤岗,兴安', 'XingAn', 130.239245, 47.25285);
INSERT INTO `china_region` VALUES (152175, 2, 230400000000, 230406000000, '154100', '0468', '东山区', '东山', '黑龙江,鹤岗,东山', 'DongShan', 130.317062, 47.338535);
INSERT INTO `china_region` VALUES (152247, 2, 230400000000, 230407000000, '154100', '0468', '兴山区', '兴山', '黑龙江,鹤岗,兴山', 'XingShan', 130.303574, 47.357666);
INSERT INTO `china_region` VALUES (152260, 2, 230400000000, 230421000000, '154200', '0468', '萝北县', '萝北', '黑龙江,鹤岗,萝北', 'LuoBei', 130.828626, 47.577495);
INSERT INTO `china_region` VALUES (152450, 2, 230400000000, 230422000000, '156200', '0468', '绥滨县', '绥滨', '黑龙江,鹤岗,绥滨', 'SuiBin', 131.852759, 47.289116);
INSERT INTO `china_region` VALUES (152626, 1, 230000000000, 230500000000, '155100', '0469', '双鸭山市', '双鸭山', '黑龙江,双鸭山', 'ShuangYaShan', 131.159133, 46.646508);
INSERT INTO `china_region` VALUES (152627, 2, 230500000000, 230501000000, '155100', '0469', '市辖区', '双鸭山', '黑龙江,双鸭山', 'ShuangYaShan', 131.159133, 46.646508);
INSERT INTO `china_region` VALUES (152628, 2, 230500000000, 230502000000, '155100', '0469', '尖山区', '尖山', '黑龙江,双鸭山,尖山', 'JianShan', 131.158416, 46.64635);
INSERT INTO `china_region` VALUES (152683, 2, 230500000000, 230503000000, '155100', '0469', '岭东区', '岭东', '黑龙江,双鸭山,岭东', 'LingDong', 131.164724, 46.592721);
INSERT INTO `china_region` VALUES (152713, 2, 230500000000, 230505000000, '155100', '0469', '四方台区', '四方台', '黑龙江,双鸭山,四方台', 'SiFangTai', 131.334503, 46.594316);
INSERT INTO `china_region` VALUES (152749, 2, 230500000000, 230506000000, '155100', '0469', '宝山区', '宝山', '黑龙江,双鸭山,宝山', 'BaoShan', 131.401589, 46.577167);
INSERT INTO `china_region` VALUES (152795, 2, 230500000000, 230521000000, '155900', '0469', '集贤县', '集贤', '黑龙江,双鸭山,集贤', 'JiXian', 131.140483, 46.728377);
INSERT INTO `china_region` VALUES (153015, 2, 230500000000, 230522000000, '155800', '0469', '友谊县', '友谊', '黑龙江,双鸭山,友谊', 'YouYi', 131.808064, 46.767299);
INSERT INTO `china_region` VALUES (153115, 2, 230500000000, 230523000000, '155600', '0469', '宝清县', '宝清', '黑龙江,双鸭山,宝清', 'BaoQing', 132.197243, 46.326925);
INSERT INTO `china_region` VALUES (153347, 2, 230500000000, 230524000000, '155700', '0469', '饶河县', '饶河', '黑龙江,双鸭山,饶河', 'RaoHe', 134.013872, 46.798164);
INSERT INTO `china_region` VALUES (153527, 1, 230000000000, 230600000000, '163000', '0459', '大庆市', '大庆', '黑龙江,大庆', 'DaQing', 125.103784, 46.589309);
INSERT INTO `china_region` VALUES (153528, 2, 230600000000, 230601000000, '163000', '0459', '市辖区', '大庆', '黑龙江,大庆', 'DaQing', 125.103784, 46.589309);
INSERT INTO `china_region` VALUES (153529, 2, 230600000000, 230602000000, '163000', '0459', '萨尔图区', '萨尔图', '黑龙江,大庆,萨尔图', 'SaErTu', 125.114643, 46.596356);
INSERT INTO `china_region` VALUES (153597, 2, 230600000000, 230603000000, '163000', '0459', '龙凤区', '龙凤', '黑龙江,大庆,龙凤', 'LongFeng', 125.135326, 46.562247);
INSERT INTO `china_region` VALUES (153651, 2, 230600000000, 230604000000, '163000', '0459', '让胡路区', '让胡路', '黑龙江,大庆,让胡路', 'RangHuLu', 124.870597, 46.652358);
INSERT INTO `china_region` VALUES (153741, 2, 230600000000, 230605000000, '163000', '0459', '红岗区', '红岗', '黑龙江,大庆,红岗', 'HongGang', 124.891039, 46.398418);
INSERT INTO `china_region` VALUES (153789, 2, 230600000000, 230606000000, '163000', '0459', '大同区', '大同', '黑龙江,大庆,大同', 'DaTong', 124.812364, 46.039828);
INSERT INTO `china_region` VALUES (153887, 2, 230600000000, 230621000000, '166400', '0459', '肇州县', '肇州', '黑龙江,大庆,肇州', 'ZhaoZhou', 125.268643, 45.699066);
INSERT INTO `china_region` VALUES (154019, 2, 230600000000, 230622000000, '166500', '0459', '肇源县', '肇源', '黑龙江,大庆,肇源', 'ZhaoYuan', 125.078223, 45.51932);
INSERT INTO `china_region` VALUES (154202, 2, 230600000000, 230623000000, '166300', '0459', '林甸县', '林甸', '黑龙江,大庆,林甸', 'LinDian', 124.863603, 47.171717);
INSERT INTO `china_region` VALUES (154310, 2, 230600000000, 230624000000, '166200', '0459', '杜尔伯特蒙古族自治县', '杜尔伯特', '黑龙江,大庆,杜尔伯特', 'DuErBoTe', 124.442572, 46.862817);
INSERT INTO `china_region` VALUES (154429, 2, 230600000000, 230671000000, '163514', '0459', '大庆高新技术产业开发区', '大庆高', '黑龙江,大庆,大庆高', 'DaQingGao', 125.151381, 46.574946);
INSERT INTO `china_region` VALUES (154439, 1, 230000000000, 230700000000, '153000', '0458', '伊春市', '伊春', '黑龙江,伊春', 'YiChun', 128.841147, 47.727536);
INSERT INTO `china_region` VALUES (154440, 2, 230700000000, 230701000000, '153000', '0458', '市辖区', '伊春', '黑龙江,伊春', 'YiChun', 128.841147, 47.727536);
INSERT INTO `china_region` VALUES (154441, 2, 230700000000, 230717000000, '153000', '0458', '伊美区', '伊美', '黑龙江,伊春,伊美', 'YiMei', 128.841147, 47.727536);
INSERT INTO `china_region` VALUES (154513, 2, 230700000000, 230718000000, '153000', '0458', '乌翠区', '乌翠', '黑龙江,伊春,乌翠', 'WuCui', 128.841147, 47.727536);
INSERT INTO `china_region` VALUES (154559, 2, 230700000000, 230719000000, '153000', '0458', '友好区', '友好', '黑龙江,伊春,友好', 'YouHao', 128.84075, 47.853778);
INSERT INTO `china_region` VALUES (154640, 2, 230700000000, 230722000000, '153200', '0458', '嘉荫县', '嘉荫', '黑龙江,伊春,嘉荫', 'JiaYin', 130.403564, 48.889109);
INSERT INTO `china_region` VALUES (154746, 2, 230700000000, 230723000000, '154733', '0458', '汤旺县', '汤旺', '黑龙江,伊春,汤旺', 'TangWang', 128.841147, 47.727536);
INSERT INTO `china_region` VALUES (154821, 2, 230700000000, 230724000000, '153099', '0458', '丰林县', '丰林', '黑龙江,伊春,丰林', 'FengLin', 128.841147, 47.727536);
INSERT INTO `china_region` VALUES (154919, 2, 230700000000, 230725000000, '153212', '0458', '大箐山县', '大箐山', '黑龙江,伊春,大箐山', 'DaQingShan', 128.841147, 47.727536);
INSERT INTO `china_region` VALUES (154988, 2, 230700000000, 230726000000, '153000', '0458', '南岔县', '南岔', '黑龙江,伊春,南岔', 'NanCha', 129.283467, 47.138035);
INSERT INTO `china_region` VALUES (155047, 2, 230700000000, 230751000000, '152041', '0458', '金林区', '金林', '黑龙江,伊春,金林', 'JinLin', 128.841147, 47.727536);
INSERT INTO `china_region` VALUES (155089, 2, 230700000000, 230781000000, '152500', '0458', '铁力市', '铁力', '黑龙江,伊春,铁力', 'TieLi', 128.032422, 46.98664);
INSERT INTO `china_region` VALUES (155239, 1, 230000000000, 230800000000, '154000', '0454', '佳木斯市', '佳木斯', '黑龙江,佳木斯', 'JiaMuSi', 130.318917, 46.799922);
INSERT INTO `china_region` VALUES (155240, 2, 230800000000, 230801000000, '154000', '0454', '市辖区', '佳木斯', '黑龙江,佳木斯', 'JiaMuSi', 130.318917, 46.799922);
INSERT INTO `china_region` VALUES (155241, 2, 230800000000, 230803000000, '154000', '0454', '向阳区', '向阳', '黑龙江,佳木斯,向阳', 'XiangYang', 130.365346, 46.80779);
INSERT INTO `china_region` VALUES (155329, 2, 230800000000, 230804000000, '154000', '0454', '前进区', '前进', '黑龙江,佳木斯,前进', 'QianJin', 130.375063, 46.814103);
INSERT INTO `china_region` VALUES (155354, 2, 230800000000, 230805000000, '154000', '0454', '东风区', '东风', '黑龙江,佳木斯,东风', 'DongFeng', 130.403664, 46.822572);
INSERT INTO `china_region` VALUES (155417, 2, 230800000000, 230811000000, '154000', '0454', '郊区', '郊区', '黑龙江,佳木斯,郊区', 'JiaoQu', 130.327195, 46.810086);
INSERT INTO `china_region` VALUES (155600, 2, 230800000000, 230822000000, '154400', '0454', '桦南县', '桦南', '黑龙江,佳木斯,桦南', 'HuaNan', 130.553343, 46.239185);
INSERT INTO `china_region` VALUES (155876, 2, 230800000000, 230826000000, '154300', '0454', '桦川县', '桦川', '黑龙江,佳木斯,桦川', 'HuaChuan', 130.719081, 47.023001);
INSERT INTO `china_region` VALUES (156018, 2, 230800000000, 230828000000, '154700', '0454', '汤原县', '汤原', '黑龙江,佳木斯,汤原', 'TangYuan', 129.905072, 46.730706);
INSERT INTO `china_region` VALUES (156214, 2, 230800000000, 230881000000, '156400', '0454', '同江市', '同江', '黑龙江,佳木斯,同江', 'TongJiang', 132.510919, 47.642707);
INSERT INTO `china_region` VALUES (156394, 2, 230800000000, 230882000000, '156100', '0454', '富锦市', '富锦', '黑龙江,佳木斯,富锦', 'FuJin', 132.037686, 47.250108);
INSERT INTO `china_region` VALUES (156796, 2, 230800000000, 230883000000, '156500', '0454', '抚远市', '抚远', '黑龙江,佳木斯,抚远', 'FuYuan', 134.307884, 48.364687);
INSERT INTO `china_region` VALUES (156924, 1, 230000000000, 230900000000, '154600', '0464', '七台河市', '七台河', '黑龙江,七台河', 'QiTaiHe', 131.003138, 45.771726);
INSERT INTO `china_region` VALUES (156925, 2, 230900000000, 230901000000, '154600', '0464', '市辖区', '七台河', '黑龙江,七台河', 'QiTaiHe', 131.003138, 45.771726);
INSERT INTO `china_region` VALUES (156926, 2, 230900000000, 230902000000, '154600', '0464', '新兴区', '新兴', '黑龙江,七台河,新兴', 'XinXing', 130.932143, 45.81593);
INSERT INTO `china_region` VALUES (157003, 2, 230900000000, 230903000000, '154600', '0464', '桃山区', '桃山', '黑龙江,七台河,桃山', 'TaoShan', 131.020275, 45.765594);
INSERT INTO `china_region` VALUES (157051, 2, 230900000000, 230904000000, '154600', '0464', '茄子河区', '茄子河', '黑龙江,七台河,茄子河', 'QieZiHe', 131.068075, 45.785215);
INSERT INTO `china_region` VALUES (157155, 2, 230900000000, 230921000000, '154500', '0464', '勃利县', '勃利', '黑龙江,七台河,勃利', 'BoLi', 130.592093, 45.755507);
INSERT INTO `china_region` VALUES (157332, 1, 230000000000, 231000000000, '157000', '0453', '牡丹江市', '牡丹江', '黑龙江,牡丹江', 'MuDanJiang', 129.633168, 44.551653);
INSERT INTO `china_region` VALUES (157333, 2, 231000000000, 231001000000, '157000', '0453', '市辖区', '牡丹江', '黑龙江,牡丹江', 'MuDanJiang', 129.633168, 44.551653);
INSERT INTO `china_region` VALUES (157334, 2, 231000000000, 231002000000, '157000', '0453', '东安区', '东安', '黑龙江,牡丹江,东安', 'DongAn', 129.626642, 44.58136);
INSERT INTO `china_region` VALUES (157386, 2, 231000000000, 231003000000, '157000', '0453', '阳明区', '阳明', '黑龙江,牡丹江,阳明', 'YangMing', 129.635615, 44.596104);
INSERT INTO `china_region` VALUES (157489, 2, 231000000000, 231004000000, '157000', '0453', '爱民区', '爱民', '黑龙江,牡丹江,爱民', 'AiMin', 129.591657, 44.596053);
INSERT INTO `china_region` VALUES (157538, 2, 231000000000, 231005000000, '157000', '0453', '西安区', '西安', '黑龙江,牡丹江,西安', 'XiAn', 129.616121, 44.577625);
INSERT INTO `china_region` VALUES (157613, 2, 231000000000, 231025000000, '157600', '0453', '林口县', '林口', '黑龙江,牡丹江,林口', 'LinKou', 130.284033, 45.278046);
INSERT INTO `china_region` VALUES (157853, 2, 231000000000, 231071000000, '157000', '0453', '牡丹江经济技术开发区', '牡丹江经开区', '黑龙江,牡丹江,牡丹江经开区', 'MuDanJiangJingKaiQu', 129.633168, 44.551653);
INSERT INTO `china_region` VALUES (157856, 2, 231000000000, 231081000000, '157300', '0453', '绥芬河市', '绥芬河', '黑龙江,牡丹江,绥芬河', 'SuiFenHe', 131.152546, 44.412309);
INSERT INTO `china_region` VALUES (157886, 2, 231000000000, 231083000000, '157100', '0453', '海林市', '海林', '黑龙江,牡丹江,海林', 'HaiLin', 129.380482, 44.594213);
INSERT INTO `china_region` VALUES (158120, 2, 231000000000, 231084000000, '157400', '0453', '宁安市', '宁安', '黑龙江,牡丹江,宁安', 'NingAn', 129.482851, 44.34072);
INSERT INTO `china_region` VALUES (158440, 2, 231000000000, 231085000000, '157500', '0453', '穆棱市', '穆棱', '黑龙江,牡丹江,穆棱', 'MuLeng', 130.524437, 44.918813);
INSERT INTO `china_region` VALUES (158677, 2, 231000000000, 231086000000, '157200', '0453', '东宁市', '东宁', '黑龙江,牡丹江,东宁', 'DongNing', 131.122915, 44.087585);
INSERT INTO `china_region` VALUES (158830, 1, 230000000000, 231100000000, '164300', NULL, '黑河市', '黑河', '黑龙江,黑河', 'HeiHe', 0, 0);
INSERT INTO `china_region` VALUES (158831, 2, 231100000000, 231101000000, '164300', NULL, '市辖区', '黑河', '黑龙江,黑河', 'HeiHe', 0, 0);
INSERT INTO `china_region` VALUES (158832, 2, 231100000000, 231102000000, '164300', NULL, '爱辉区', '爱辉', '黑龙江,黑河,爱辉', 'AiHui', 0, 0);
INSERT INTO `china_region` VALUES (159013, 2, 231100000000, 231123000000, '164400', '0456', '逊克县', '逊克', '黑龙江,黑河,逊克', 'XunKe', 128.47875, 49.564252);
INSERT INTO `china_region` VALUES (159132, 2, 231100000000, 231124000000, '164200', '0456', '孙吴县', '孙吴', '黑龙江,黑河,孙吴', 'SunWu', 127.336304, 49.425652);
INSERT INTO `china_region` VALUES (159264, 2, 231100000000, 231181000000, '164000', '0456', '北安市', '北安', '黑龙江,黑河,北安', 'BeiAn', 126.491199, 48.241374);
INSERT INTO `china_region` VALUES (159431, 2, 231100000000, 231182000000, '164100', '0456', '五大连池市', '五大连池', '黑龙江,黑河,五大连池', 'WuDaLianChi', 126.205516, 48.517257);
INSERT INTO `china_region` VALUES (159678, 2, 231100000000, 231183000000, '161400', '0456', '嫩江市', '嫩江', '黑龙江,黑河,嫩江', 'NenJiang', 125.221192, 49.185766);
INSERT INTO `china_region` VALUES (159961, 1, 230000000000, 231200000000, '152000', '0455', '绥化市', '绥化', '黑龙江,绥化', 'SuiHua', 126.968887, 46.653845);
INSERT INTO `china_region` VALUES (159962, 2, 231200000000, 231201000000, '152000', '0455', '市辖区', '绥化', '黑龙江,绥化', 'SuiHua', 126.968887, 46.653845);
INSERT INTO `china_region` VALUES (159963, 2, 231200000000, 231202000000, '152000', '0455', '北林区', '北林', '黑龙江,绥化,北林', 'BeiLin', 126.985593, 46.637344);
INSERT INTO `china_region` VALUES (160193, 2, 231200000000, 231221000000, '152100', '0455', '望奎县', '望奎', '黑龙江,绥化,望奎', 'WangKui', 126.486076, 46.832719);
INSERT INTO `china_region` VALUES (160346, 2, 231200000000, 231222000000, '151500', '0455', '兰西县', '兰西', '黑龙江,绥化,兰西', 'LanXi', 126.288113, 46.252447);
INSERT INTO `china_region` VALUES (160489, 2, 231200000000, 231223000000, '151600', '0455', '青冈县', '青冈', '黑龙江,绥化,青冈', 'QingGang', 126.11386, 46.689671);
INSERT INTO `china_region` VALUES (160696, 2, 231200000000, 231224000000, '152400', '0455', '庆安县', '庆安', '黑龙江,绥化,庆安', 'QingAn', 127.507825, 46.880102);
INSERT INTO `china_region` VALUES (160831, 2, 231200000000, 231225000000, '151700', '0455', '明水县', '明水', '黑龙江,绥化,明水', 'MingShui', 125.906301, 47.173426);
INSERT INTO `china_region` VALUES (160973, 2, 231200000000, 231226000000, '152200', '0455', '绥棱县', '绥棱', '黑龙江,绥化,绥棱', 'SuiLeng', 127.114832, 47.236015);
INSERT INTO `china_region` VALUES (161113, 2, 231200000000, 231281000000, '151400', '0455', '安达市', '安达', '黑龙江,绥化,安达', 'AnDa', 125.352188, 46.423508);
INSERT INTO `china_region` VALUES (161283, 2, 231200000000, 231282000000, '151100', '0455', '肇东市', '肇东', '黑龙江,绥化,肇东', 'ZhaoDong', 125.961814, 46.051126);
INSERT INTO `china_region` VALUES (161535, 2, 231200000000, 231283000000, '152300', '0455', '海伦市', '海伦', '黑龙江,绥化,海伦', 'HaiLun', 126.973143, 47.461971);
INSERT INTO `china_region` VALUES (161860, 1, 230000000000, 232700000000, '165000', NULL, '大兴安岭地区', '大兴安岭', '黑龙江,大兴安岭', 'DaXingAnLing', 0, 0);
INSERT INTO `china_region` VALUES (161861, 2, 232700000000, 232701000000, '165100', NULL, '漠河市', '漠河', '黑龙江,大兴安岭,漠河', 'MoHe', 0, 0);
INSERT INTO `china_region` VALUES (161884, 2, 232700000000, 232721000000, '165000', NULL, '呼玛县', '呼玛', '黑龙江,大兴安岭,呼玛', 'HuMa', 0, 0);
INSERT INTO `china_region` VALUES (161951, 2, 232700000000, 232722000000, '165200', NULL, '塔河县', '塔河', '黑龙江,大兴安岭,塔河', 'TaHe', 0, 0);
INSERT INTO `china_region` VALUES (161977, 2, 232700000000, 232761000000, '165100', NULL, '加格达奇区', '加格达奇', '黑龙江,大兴安岭,加格达奇', 'JiaGeDaQi', 0, 0);
INSERT INTO `china_region` VALUES (162010, 2, 232700000000, 232762000000, '165100', NULL, '松岭区', '松岭', '黑龙江,大兴安岭,松岭', 'SongLing', 0, 0);
INSERT INTO `china_region` VALUES (162020, 2, 232700000000, 232763000000, '165100', NULL, '新林区', '新林', '黑龙江,大兴安岭,新林', 'XinLin', 0, 0);
INSERT INTO `china_region` VALUES (162036, 2, 232700000000, 232764000000, '165100', NULL, '呼中区', '呼中', '黑龙江,大兴安岭,呼中', 'HuZhong', 0, 0);
INSERT INTO `china_region` VALUES (162046, 0, 0, 310000000000, '0', NULL, '上海市', '上海', '上海', 'ShangHai', 121.473701, 31.230416);
INSERT INTO `china_region` VALUES (162047, 1, 310000000000, 310100000000, '200000', '021', '直辖区', '上海', '上海', 'ShangHai', 121.473701, 31.230416);
INSERT INTO `china_region` VALUES (162048, 2, 310100000000, 310101000000, '200000', '021', '黄浦区', '黄浦', '上海,黄浦', 'HuangPu', 121.46924, 31.22986);
INSERT INTO `china_region` VALUES (162236, 2, 310100000000, 310104000000, '200000', '021', '徐汇区', '徐汇', '上海,徐汇', 'XuHui', 121.437866, 31.19919);
INSERT INTO `china_region` VALUES (162556, 2, 310100000000, 310105000000, '200000', '021', '长宁区', '长宁', '上海,长宁', 'ChangNing', 121.424624, 31.220367);
INSERT INTO `china_region` VALUES (162752, 2, 310100000000, 310106000000, '200000', '021', '静安区', '静安', '上海,静安', 'JingAn', 121.459384, 31.247105);
INSERT INTO `china_region` VALUES (163035, 2, 310100000000, 310107000000, '200333', '021', '普陀区', '普陀', '上海,普陀', 'PuTuo', 121.395555, 31.24984);
INSERT INTO `china_region` VALUES (163313, 2, 310100000000, 310109000000, '200000', '021', '虹口区', '虹口', '上海,虹口', 'HongKou', 121.505133, 31.2646);
INSERT INTO `china_region` VALUES (163528, 2, 310100000000, 310110000000, '200000', '021', '杨浦区', '杨浦', '上海,杨浦', 'YangPu', 121.526077, 31.259541);
INSERT INTO `china_region` VALUES (163855, 2, 310100000000, 310112000000, '201100', '021', '闵行区', '闵行', '上海,闵行', 'MinXing', 121.381709, 31.112813);
INSERT INTO `china_region` VALUES (164439, 2, 310100000000, 310113000000, '201900', '021', '宝山区', '宝山', '上海,宝山', 'BaoShan', 121.489612, 31.405457);
INSERT INTO `china_region` VALUES (164947, 2, 310100000000, 310114000000, '201800', '021', '嘉定区', '嘉定', '上海,嘉定', 'JiaDing', 121.2653, 31.375602);
INSERT INTO `china_region` VALUES (165335, 2, 310100000000, 310115000000, '200120', '021', '浦东新区', '浦东', '上海,浦东', 'PuDong', 121.544379, 31.221517);
INSERT INTO `china_region` VALUES (166738, 2, 310100000000, 310116000000, '201500', '021', '金山区', '金山', '上海,金山', 'JinShan', 121.34197, 30.741991);
INSERT INTO `china_region` VALUES (166981, 2, 310100000000, 310117000000, '201600', '021', '松江区', '松江', '上海,松江', 'SongJiang', 121.227747, 31.032243);
INSERT INTO `china_region` VALUES (167358, 2, 310100000000, 310118000000, '201700', '021', '青浦区', '青浦', '上海,青浦', 'QingPu', 121.124178, 31.150681);
INSERT INTO `china_region` VALUES (167696, 2, 310100000000, 310120000000, '201400', '021', '奉贤区', '奉贤', '上海,奉贤', 'FengXian', 121.474042, 30.917795);
INSERT INTO `china_region` VALUES (168012, 2, 310100000000, 310151000000, '202164', '021', '崇明区', '崇明', '上海,崇明', 'ChongMing', 121.397417, 31.623587);
INSERT INTO `china_region` VALUES (168387, 0, 0, 320000000000, '0', NULL, '江苏省', '江苏', '江苏', 'JiangSu', 118.763232, 32.061707);
INSERT INTO `china_region` VALUES (168388, 1, 320000000000, 320100000000, '210000', '025', '南京市', '南京', '江苏,南京', 'NanJing', 118.796877, 32.060255);
INSERT INTO `china_region` VALUES (168389, 2, 320100000000, 320101000000, '210000', '025', '市辖区', '南京', '江苏,南京', 'NanJing', 118.796877, 32.060255);
INSERT INTO `china_region` VALUES (168390, 2, 320100000000, 320102000000, '210000', '025', '玄武区', '玄武', '江苏,南京,玄武', 'XuanWu', 118.797861, 32.048687);
INSERT INTO `china_region` VALUES (168459, 2, 320100000000, 320104000000, '210000', '025', '秦淮区', '秦淮', '江苏,南京,秦淮', 'QinHuai', 118.794744, 32.039133);
INSERT INTO `china_region` VALUES (168587, 2, 320100000000, 320105000000, '210000', '025', '建邺区', '建邺', '江苏,南京,建邺', 'JianYe', 118.731694, 32.003552);
INSERT INTO `china_region` VALUES (168663, 2, 320100000000, 320106000000, '210000', '025', '鼓楼区', '鼓楼', '江苏,南京,鼓楼', 'GuLou', 118.76979, 32.066336);
INSERT INTO `china_region` VALUES (168800, 2, 320100000000, 320111000000, '210000', '025', '浦口区', '浦口', '江苏,南京,浦口', 'PuKou', 118.627895, 32.059093);
INSERT INTO `china_region` VALUES (168945, 2, 320100000000, 320113000000, '210000', '025', '栖霞区', '栖霞', '江苏,南京,栖霞', 'QiXia', 118.909246, 32.096228);
INSERT INTO `china_region` VALUES (169098, 2, 320100000000, 320114000000, '210000', '025', '雨花台区', '雨花台', '江苏,南京,雨花台', 'YuHuaTai', 118.779073, 31.991347);
INSERT INTO `china_region` VALUES (169205, 2, 320100000000, 320115000000, '211100', '025', '江宁区', '江宁', '江苏,南京,江宁', 'JiangNing', 118.839685, 31.953702);
INSERT INTO `china_region` VALUES (169427, 2, 320100000000, 320116000000, '211500', '025', '六合区', '六合', '江苏,南京,六合', 'LiuHe', 118.821401, 32.322247);
INSERT INTO `china_region` VALUES (169600, 2, 320100000000, 320117000000, '211299', '025', '溧水区', '溧水', '江苏,南京,溧水', 'LiShui', 119.02828, 31.651133);
INSERT INTO `china_region` VALUES (169722, 2, 320100000000, 320118000000, '211301', '025', '高淳区', '高淳', '江苏,南京,高淳', 'GaoChun', 118.892085, 31.328471);
INSERT INTO `china_region` VALUES (169884, 1, 320000000000, 320200000000, '214000', '0510', '无锡市', '无锡', '江苏,无锡', 'WuXi', 120.31191, 31.491169);
INSERT INTO `china_region` VALUES (169885, 2, 320200000000, 320201000000, '214000', '0510', '市辖区', '无锡', '江苏,无锡', 'WuXi', 120.31191, 31.491169);
INSERT INTO `china_region` VALUES (169886, 2, 320200000000, 320205000000, '214000', '0510', '锡山区', '锡山', '江苏,无锡,锡山', 'XiShan', 120.357858, 31.589715);
INSERT INTO `china_region` VALUES (170021, 2, 320200000000, 320206000000, '214000', '0510', '惠山区', '惠山', '江苏,无锡,惠山', 'HuiShan', 120.2985, 31.681012);
INSERT INTO `china_region` VALUES (170148, 2, 320200000000, 320211000000, '214000', '0510', '滨湖区', '滨湖', '江苏,无锡,滨湖', 'BinHu', 120.27175, 31.470483);
INSERT INTO `china_region` VALUES (170276, 2, 320200000000, 320213000000, '214061', '0510', '梁溪区', '梁溪', '江苏,无锡,梁溪', 'LiangXi', 120.296591, 31.575719);
INSERT INTO `china_region` VALUES (170451, 2, 320200000000, 320214000000, '215321', '0510', '新吴区', '新吴', '江苏,无锡,新吴', 'XinWu', 120.352778, 31.550957);
INSERT INTO `china_region` VALUES (170596, 2, 320200000000, 320281000000, '214400', '0510', '江阴市', '江阴', '江苏,无锡,江阴', 'JiangYin', 120.284939, 31.920658);
INSERT INTO `china_region` VALUES (170925, 2, 320200000000, 320282000000, '214200', '0510', '宜兴市', '宜兴', '江苏,无锡,宜兴', 'YiXing', 119.823308, 31.340637);
INSERT INTO `china_region` VALUES (171256, 1, 320000000000, 320300000000, '221000', '0516', '徐州市', '徐州', '江苏,徐州', 'XuZhou', 117.284124, 34.205768);
INSERT INTO `china_region` VALUES (171257, 2, 320300000000, 320301000000, '221000', '0516', '市辖区', '徐州', '江苏,徐州', 'XuZhou', 117.284124, 34.205768);
INSERT INTO `china_region` VALUES (171258, 2, 320300000000, 320302000000, '221000', '0516', '鼓楼区', '鼓楼', '江苏,徐州,鼓楼', 'GuLou', 117.185591, 34.288511);
INSERT INTO `china_region` VALUES (171334, 2, 320300000000, 320303000000, '221000', '0516', '云龙区', '云龙', '江苏,徐州,云龙', 'YunLong', 117.25156, 34.253167);
INSERT INTO `china_region` VALUES (171425, 2, 320300000000, 320305000000, '221000', '0516', '贾汪区', '贾汪', '江苏,徐州,贾汪', 'JiaWang', 117.466687, 34.435506);
INSERT INTO `china_region` VALUES (171589, 2, 320300000000, 320311000000, '221000', '0516', '泉山区', '泉山', '江苏,徐州,泉山', 'QuanShan', 117.193805, 34.244258);
INSERT INTO `china_region` VALUES (171731, 2, 320300000000, 320312000000, '221113', '0516', '铜山区', '铜山', '江苏,徐州,铜山', 'TongShan', 117.169421, 34.1807);
INSERT INTO `china_region` VALUES (172087, 2, 320300000000, 320321000000, '221700', '0516', '丰县', '丰县', '江苏,徐州,丰县', 'FengXian', 116.595391, 34.693906);
INSERT INTO `china_region` VALUES (172516, 2, 320300000000, 320322000000, '221600', '0516', '沛县', '沛县', '江苏,徐州,沛县', 'PeiXian', 116.937532, 34.721656);
INSERT INTO `china_region` VALUES (172931, 2, 320300000000, 320324000000, '221200', '0516', '睢宁县', '睢宁', '江苏,徐州,睢宁', 'SuiNing', 117.941563, 33.912598);
INSERT INTO `china_region` VALUES (173354, 2, 320300000000, 320371000000, '221001', '0516', '徐州经济技术开发区', '徐州经开区', '江苏,徐州,徐州经开区', 'XuZhouJingKaiQu', 117.245962, 34.288576);
INSERT INTO `china_region` VALUES (173443, 2, 320300000000, 320381000000, '221400', '0516', '新沂市', '新沂', '江苏,徐州,新沂', 'XinYi', 118.354537, 34.36958);
INSERT INTO `china_region` VALUES (173751, 2, 320300000000, 320382000000, '221300', '0516', '邳州市', '邳州', '江苏,徐州,邳州', 'PiZhou', 118.012531, 34.338888);
INSERT INTO `china_region` VALUES (174288, 1, 320000000000, 320400000000, '213000', '0519', '常州市', '常州', '江苏,常州', 'ChangZhou', 119.973987, 31.810689);
INSERT INTO `china_region` VALUES (174289, 2, 320400000000, 320401000000, '213000', '0519', '市辖区', '常州', '江苏,常州', 'ChangZhou', 119.973987, 31.810689);
INSERT INTO `china_region` VALUES (174290, 2, 320400000000, 320402000000, '213000', '0519', '天宁区', '天宁', '江苏,常州,天宁', 'TianNing', 119.974991, 31.779619);
INSERT INTO `china_region` VALUES (174429, 2, 320400000000, 320404000000, '213000', '0519', '钟楼区', '钟楼', '江苏,常州,钟楼', 'ZhongLou', 119.902112, 31.802192);
INSERT INTO `china_region` VALUES (174533, 2, 320400000000, 320411000000, '213002', '0519', '新北区', '新北', '江苏,常州,新北', 'XinBei', 119.972182, 31.830641);
INSERT INTO `china_region` VALUES (174685, 2, 320400000000, 320412000000, '213100', '0519', '武进区', '武进', '江苏,常州,武进', 'WuJin', 119.942437, 31.701188);
INSERT INTO `china_region` VALUES (175001, 2, 320400000000, 320413000000, '213299', '0519', '金坛区', '金坛', '江苏,常州,金坛', 'JinTan', 119.597897, 31.723247);
INSERT INTO `china_region` VALUES (175163, 2, 320400000000, 320481000000, '213300', '0519', '溧阳市', '溧阳', '江苏,常州,溧阳', 'LiYang', 119.484211, 31.416911);
INSERT INTO `china_region` VALUES (175419, 1, 320000000000, 320500000000, '215000', '0512', '苏州市', '苏州', '江苏,苏州', 'SuZhou', 120.585315, 31.298886);
INSERT INTO `china_region` VALUES (175420, 2, 320500000000, 320501000000, '215000', '0512', '市辖区', '苏州', '江苏,苏州', 'SuZhou', 120.585315, 31.298886);
INSERT INTO `china_region` VALUES (175421, 2, 320500000000, 320505000000, '215000', '0512', '虎丘区', '虎丘', '江苏,苏州,虎丘', 'HuQiu', 120.566833, 31.294845);
INSERT INTO `china_region` VALUES (175526, 2, 320500000000, 320506000000, '215100', '0512', '吴中区', '吴中', '江苏,苏州,吴中', 'WuZhong', 120.631898, 31.264212);
INSERT INTO `china_region` VALUES (175744, 2, 320500000000, 320507000000, '215100', '0512', '相城区', '相城', '江苏,苏州,相城', 'XiangCheng', 120.642663, 31.369088);
INSERT INTO `china_region` VALUES (175899, 2, 320500000000, 320508000000, '215101', '0512', '姑苏区', '姑苏', '江苏,苏州,姑苏', 'GuSu', 120.617296, 31.336392);
INSERT INTO `china_region` VALUES (176082, 2, 320500000000, 320509000000, '215211', '0512', '吴江区', '吴江', '江苏,苏州,吴江', 'WuJiang', 120.645158, 31.138677);
INSERT INTO `china_region` VALUES (176420, 2, 320500000000, 320571000000, '215164', '0512', '苏州工业园区', '苏州工业园', '江苏,苏州,苏州工业园', 'SuZhouGongYeYuan', 120.80712, 31.351219);
INSERT INTO `china_region` VALUES (176583, 2, 320500000000, 320581000000, '215500', '0512', '常熟市', '常熟', '江苏,苏州,常熟', 'ChangShu', 120.752481, 31.654376);
INSERT INTO `china_region` VALUES (176952, 2, 320500000000, 320582000000, '215600', '0512', '张家港市', '张家港', '江苏,苏州,张家港', 'ZhangJiaGang', 120.479033, 31.899861);
INSERT INTO `china_region` VALUES (177242, 2, 320500000000, 320583000000, '215300', '0512', '昆山市', '昆山', '江苏,苏州,昆山', 'KunShan', 120.980737, 31.385598);
INSERT INTO `china_region` VALUES (177619, 2, 320500000000, 320585000000, '215400', '0512', '太仓市', '太仓', '江苏,苏州,太仓', 'TaiCang', 121.13055, 31.457735);
INSERT INTO `china_region` VALUES (177783, 1, 320000000000, 320600000000, '226000', '0513', '南通市', '南通', '江苏,南通', 'NanTong', 120.894291, 31.980171);
INSERT INTO `china_region` VALUES (177784, 2, 320600000000, 320601000000, '226000', '0513', '市辖区', '南通', '江苏,南通', 'NanTong', 120.894291, 31.980171);
INSERT INTO `china_region` VALUES (177785, 2, 320600000000, 320602000000, '226000', '0513', '崇川区', '崇川', '江苏,南通,崇川', 'ChongChuan', 120.857434, 32.009875);
INSERT INTO `china_region` VALUES (177906, 2, 320600000000, 320611000000, '226000', '0513', '港闸区', '港闸', '江苏,南通,港闸', 'GangZha', 120.818527, 32.032442);
INSERT INTO `china_region` VALUES (177992, 2, 320600000000, 320612000000, '226399', '0513', '通州区', '通州', '江苏,南通,通州', 'TongZhou', 121.075087, 32.064161);
INSERT INTO `china_region` VALUES (178288, 2, 320600000000, 320623000000, '226400', '0513', '如东县', '如东', '江苏,南通,如东', 'RuDong', 121.185201, 32.331766);
INSERT INTO `china_region` VALUES (178572, 2, 320600000000, 320671000000, '226002', '0513', '南通经济技术开发区', '南通经开区', '江苏,南通,南通经开区', 'NanTongJingKaiQu', 120.928985, 31.923182);
INSERT INTO `china_region` VALUES (178626, 2, 320600000000, 320681000000, '226200', '0513', '启东市', '启东', '江苏,南通,启东', 'QiDong', 121.657441, 31.808026);
INSERT INTO `china_region` VALUES (178972, 2, 320600000000, 320682000000, '226500', '0513', '如皋市', '如皋', '江苏,南通,如皋', 'RuGao', 120.574946, 32.370557);
INSERT INTO `china_region` VALUES (179350, 2, 320600000000, 320684000000, '226100', '0513', '海门市', '海门', '江苏,南通,海门', 'HaiMen', 121.181615, 31.871173);
INSERT INTO `china_region` VALUES (179682, 2, 320600000000, 320685000000, '226600', '0513', '海安市', '海安', '江苏,南通,海安', 'HaiAn', 120.46737, 32.533549);
INSERT INTO `china_region` VALUES (179931, 1, 320000000000, 320700000000, '222000', '0518', '连云港市', '连云港', '江苏,连云港', 'LianYunGang', 119.221611, 34.596653);
INSERT INTO `china_region` VALUES (179932, 2, 320700000000, 320701000000, '222000', '0518', '市辖区', '连云港', '江苏,连云港', 'LianYunGang', 119.221611, 34.596653);
INSERT INTO `china_region` VALUES (179933, 2, 320700000000, 320703000000, '222000', '0518', '连云区', '连云', '江苏,连云港', 'LianYun', 119.338788, 34.760249);
INSERT INTO `china_region` VALUES (180018, 2, 320700000000, 320706000000, '222000', '0518', '海州区', '海州', '江苏,连云港,海州', 'HaiZhou', 119.19371, 34.606756);
INSERT INTO `china_region` VALUES (180235, 2, 320700000000, 320707000000, '222100', '0518', '赣榆区', '赣榆', '江苏,连云港,赣榆', 'GanYu', 119.173331, 34.841349);
INSERT INTO `china_region` VALUES (180720, 2, 320700000000, 320722000000, '222300', '0518', '东海县', '东海', '江苏,连云港,东海', 'DongHai', 118.752842, 34.542309);
INSERT INTO `china_region` VALUES (181105, 2, 320700000000, 320723000000, '222200', '0518', '灌云县', '灌云', '江苏,连云港,灌云', 'GuanYun', 119.239381, 34.284381);
INSERT INTO `china_region` VALUES (181462, 2, 320700000000, 320724000000, '223500', '0518', '灌南县', '灌南', '江苏,连云港,灌南', 'GuanNan', 119.315651, 34.087135);
INSERT INTO `china_region` VALUES (181712, 2, 320700000000, 320771000000, '222299', '0518', '连云港经济技术开发区', '连云港经开区', '江苏,连云港,连云港经开区', 'LianYunGangJingKaiQu', 119.347013, 34.696647);
INSERT INTO `china_region` VALUES (181753, 2, 320700000000, 320772000000, '222006', '0518', '连云港高新技术产业开发区', '连云港高', '江苏,连云港,连云港高', 'LianYunGangGao', 118.703543, 34.507296);
INSERT INTO `china_region` VALUES (181784, 1, 320000000000, 320800000000, '223001', '0517', '淮安市', '淮安', '江苏,淮安', 'HuaiAn', 119.015285, 33.610353);
INSERT INTO `china_region` VALUES (181785, 2, 320800000000, 320801000000, '223001', '0517', '市辖区', '淮安', '江苏,淮安', 'HuaiAn', 119.015285, 33.610353);
INSERT INTO `china_region` VALUES (181786, 2, 320800000000, 320803000000, '223300', '0517', '淮安区', '淮安', '江苏,淮安', 'HuaiAn', 119.141099, 33.502869);
INSERT INTO `china_region` VALUES (182147, 2, 320800000000, 320804000000, '223300', '0517', '淮阴区', '淮阴', '江苏,淮安,淮阴', 'HuaiYin', 119.034725, 33.631893);
INSERT INTO `china_region` VALUES (182423, 2, 320800000000, 320812000000, '223021', '0517', '清江浦区', '清江浦', '江苏,淮安,清江浦', 'QingJiangPu', 119.015285, 33.610353);
INSERT INTO `china_region` VALUES (182566, 2, 320800000000, 320813000000, '223113', '0517', '洪泽区', '洪泽', '江苏,淮安,洪泽', 'HongZe', 118.873138, 33.294223);
INSERT INTO `china_region` VALUES (182700, 2, 320800000000, 320826000000, '223400', '0517', '涟水县', '涟水', '江苏,淮安,涟水', 'LianShui', 119.260335, 33.78096);
INSERT INTO `china_region` VALUES (183096, 2, 320800000000, 320830000000, '211700', '0517', '盱眙县', '盱眙', '江苏,淮安,盱眙', 'XuYi', 118.54436, 33.011971);
INSERT INTO `china_region` VALUES (183369, 2, 320800000000, 320831000000, '211600', '0517', '金湖县', '金湖', '江苏,淮安,金湖', 'JinHu', 119.020585, 33.025433);
INSERT INTO `china_region` VALUES (183533, 2, 320800000000, 320871000000, '223232', '0517', '淮安经济技术开发区', '淮安经开区', '江苏,淮安,淮安经开区', 'HuaiAnJingKaiQu', 119.187535, 33.653154);
INSERT INTO `china_region` VALUES (183622, 1, 320000000000, 320900000000, '224000', '0515', '盐城市', '盐城', '江苏,盐城', 'YanCheng', 120.163561, 33.347382);
INSERT INTO `china_region` VALUES (183623, 2, 320900000000, 320901000000, '224000', '0515', '市辖区', '盐城', '江苏,盐城', 'YanCheng', 120.163561, 33.347382);
INSERT INTO `china_region` VALUES (183624, 2, 320900000000, 320902000000, '224600', '0515', '亭湖区', '亭湖', '江苏,盐城,亭湖', 'TingHu', 120.197358, 33.390536);
INSERT INTO `china_region` VALUES (183846, 2, 320900000000, 320903000000, '224000', '0515', '盐都区', '盐都', '江苏,盐城,盐都', 'YanDu', 120.153898, 33.338094);
INSERT INTO `china_region` VALUES (184132, 2, 320900000000, 320904000000, '224199', '0515', '大丰区', '大丰', '江苏,盐城,大丰', 'DaFeng', 120.500858, 33.200331);
INSERT INTO `china_region` VALUES (184419, 2, 320900000000, 320921000000, '224600', '0515', '响水县', '响水', '江苏,盐城,响水', 'XiangShui', 119.578364, 34.199479);
INSERT INTO `china_region` VALUES (184595, 2, 320900000000, 320922000000, '224000', '0515', '滨海县', '滨海', '江苏,盐城,滨海', 'BinHai', 119.820831, 33.990334);
INSERT INTO `china_region` VALUES (184919, 2, 320900000000, 320923000000, '224400', '0515', '阜宁县', '阜宁', '江苏,盐城,阜宁', 'FuNing', 119.802527, 33.759325);
INSERT INTO `china_region` VALUES (185278, 2, 320900000000, 320924000000, '224300', '0515', '射阳县', '射阳', '江苏,盐城,射阳', 'SheYang', 120.258053, 33.774806);
INSERT INTO `china_region` VALUES (185572, 2, 320900000000, 320925000000, '224700', '0515', '建湖县', '建湖', '江苏,盐城,建湖', 'JianHu', 119.798581, 33.464204);
INSERT INTO `china_region` VALUES (185835, 2, 320900000000, 320971000000, '224799', '0515', '盐城经济技术开发区', '盐城经开区', '江苏,盐城,盐城经开区', 'YanChengJingKaiQu', 120.249847, 33.354301);
INSERT INTO `china_region` VALUES (185872, 2, 320900000000, 320981000000, '224200', '0515', '东台市', '东台', '江苏,盐城,东台', 'DongTai', 120.320331, 32.86844);
INSERT INTO `china_region` VALUES (186310, 1, 320000000000, 321000000000, '225000', '0514', '扬州市', '扬州', '江苏,扬州', 'YangZhou', 119.412966, 32.39421);
INSERT INTO `china_region` VALUES (186311, 2, 321000000000, 321001000000, '225000', '0514', '市辖区', '扬州', '江苏,扬州', 'YangZhou', 119.412966, 32.39421);
INSERT INTO `china_region` VALUES (186312, 2, 321000000000, 321002000000, '225000', '0514', '广陵区', '广陵', '江苏,扬州,广陵', 'GuangLing', 119.431849, 32.39472);
INSERT INTO `china_region` VALUES (186470, 2, 321000000000, 321003000000, '225100', '0514', '邗江区', '邗江', '江苏,扬州,邗江', 'HanJiang', 119.398015, 32.377528);
INSERT INTO `china_region` VALUES (186670, 2, 321000000000, 321012000000, '225003', '0514', '江都区', '江都', '江苏,扬州,江都', 'JiangDu', 119.569989, 32.434672);
INSERT INTO `china_region` VALUES (187023, 2, 321000000000, 321023000000, '225800', '0514', '宝应县', '宝应', '江苏,扬州,宝应', 'BaoYing', 119.360729, 33.240392);
INSERT INTO `china_region` VALUES (187321, 2, 321000000000, 321071000000, '225008', '0514', '扬州经济技术开发区', '扬州经开区', '江苏,扬州,扬州经开区', 'YangZhouJingKaiQu', 119.412947, 32.367906);
INSERT INTO `china_region` VALUES (187385, 2, 321000000000, 321081000000, '211400', '0514', '仪征市', '仪征', '江苏,扬州,仪征', 'YiZheng', 119.184766, 32.272258);
INSERT INTO `china_region` VALUES (187602, 2, 321000000000, 321084000000, '225600', '0514', '高邮市', '高邮', '江苏,扬州,高邮', 'GaoYou', 119.459161, 32.781659);
INSERT INTO `china_region` VALUES (187841, 1, 320000000000, 321100000000, '212000', '0511', '镇江市', '镇江', '江苏,镇江', 'ZhenJiang', 119.425836, 32.187849);
INSERT INTO `china_region` VALUES (187842, 2, 321100000000, 321101000000, '212000', '0511', '市辖区', '镇江', '江苏,镇江', 'ZhenJiang', 119.425836, 32.187849);
INSERT INTO `china_region` VALUES (187843, 2, 321100000000, 321102000000, '212000', '0511', '京口区', '京口', '江苏,镇江,京口', 'JingKou', 119.47016, 32.19828);
INSERT INTO `china_region` VALUES (187918, 2, 321100000000, 321111000000, '212000', '0511', '润州区', '润州', '江苏,镇江,润州', 'RunZhou', 119.411945, 32.195333);
INSERT INTO `china_region` VALUES (188000, 2, 321100000000, 321112000000, '212100', '0511', '丹徒区', '丹徒', '江苏,镇江,丹徒', 'DanTu', 119.433854, 32.131962);
INSERT INTO `china_region` VALUES (188100, 2, 321100000000, 321171000000, '212000', '0511', '镇江新区', '镇江', '江苏,镇江', 'ZhenJiang', 119.425836, 32.187849);
INSERT INTO `china_region` VALUES (188163, 2, 321100000000, 321181000000, '212300', '0511', '丹阳市', '丹阳', '江苏,镇江,丹阳', 'DanYang', 119.606536, 32.010117);
INSERT INTO `china_region` VALUES (188398, 2, 321100000000, 321182000000, '212200', '0511', '扬中市', '扬中', '江苏,镇江,扬中', 'YangZhong', 119.797635, 32.234831);
INSERT INTO `china_region` VALUES (188485, 2, 321100000000, 321183000000, '212400', '0511', '句容市', '句容', '江苏,镇江,句容', 'JuRong', 119.168695, 31.944999);
INSERT INTO `china_region` VALUES (188690, 1, 320000000000, 321200000000, '225300', '0523', '泰州市', '泰州', '江苏,泰州', 'TaiZhou', 119.923116, 32.455778);
INSERT INTO `china_region` VALUES (188691, 2, 321200000000, 321201000000, '225300', '0523', '市辖区', '泰州', '江苏,泰州', 'TaiZhou', 119.923116, 32.455778);
INSERT INTO `china_region` VALUES (188692, 2, 321200000000, 321202000000, '225300', '0523', '海陵区', '海陵', '江苏,泰州,海陵', 'HaiLing', 119.919425, 32.491016);
INSERT INTO `china_region` VALUES (188868, 2, 321200000000, 321203000000, '225300', '0523', '高港区', '高港', '江苏,泰州,高港', 'GaoGang', 119.881717, 32.318822);
INSERT INTO `china_region` VALUES (188969, 2, 321200000000, 321204000000, '225599', '0523', '姜堰区', '姜堰', '江苏,泰州,姜堰', 'JiangYan', 120.127934, 32.509155);
INSERT INTO `china_region` VALUES (189289, 2, 321200000000, 321271000000, '225316', '0523', '泰州医药高新技术产业开发区', '泰州医药高', '江苏,泰州,泰州医药高', 'TaiZhouYiYaoGao', 119.923116, 32.455778);
INSERT INTO `china_region` VALUES (189361, 2, 321200000000, 321281000000, '225700', '0523', '兴化市', '兴化', '江苏,泰州,兴化', 'XingHua', 119.852541, 32.910459);
INSERT INTO `china_region` VALUES (189927, 2, 321200000000, 321282000000, '214500', '0523', '靖江市', '靖江', '江苏,泰州,靖江', 'JingJiang', 120.277138, 31.982751);
INSERT INTO `china_region` VALUES (190205, 2, 321200000000, 321283000000, '225400', '0523', '泰兴市', '泰兴', '江苏,泰州,泰兴', 'TaiXing', 120.051744, 32.171854);
INSERT INTO `china_region` VALUES (190584, 1, 320000000000, 321300000000, '223800', '0527', '宿迁市', '宿迁', '江苏,宿迁', 'SuQian', 118.275198, 33.963232);
INSERT INTO `china_region` VALUES (190585, 2, 321300000000, 321301000000, '223800', '0527', '市辖区', '宿迁', '江苏,宿迁', 'SuQian', 118.275198, 33.963232);
INSERT INTO `china_region` VALUES (190586, 2, 321300000000, 321302000000, '223800', '0527', '宿城区', '宿城', '江苏,宿迁,宿城', 'SuCheng', 118.242534, 33.963029);
INSERT INTO `china_region` VALUES (190817, 2, 321300000000, 321311000000, '223800', '0527', '宿豫区', '宿豫', '江苏,宿迁,宿豫', 'SuYu', 118.330782, 33.946822);
INSERT INTO `china_region` VALUES (191026, 2, 321300000000, 321322000000, '223600', '0527', '沭阳县', '沭阳', '江苏,宿迁,沭阳', 'ShuYang', 118.804784, 34.111022);
INSERT INTO `china_region` VALUES (191554, 2, 321300000000, 321323000000, '223700', '0527', '泗阳县', '泗阳', '江苏,宿迁,泗阳', 'SiYang', 118.703038, 33.72314);
INSERT INTO `china_region` VALUES (191817, 2, 321300000000, 321324000000, '223900', '0527', '泗洪县', '泗洪', '江苏,宿迁,泗洪', 'SiHong', 118.223591, 33.476051);
INSERT INTO `china_region` VALUES (192193, 2, 321300000000, 321371000000, '223814', '0527', '宿迁经济技术开发区', '宿迁经开区', '江苏,宿迁,宿迁经开区', 'SuQianJingKaiQu', 118.267378, 33.892135);
INSERT INTO `china_region` VALUES (192230, 0, 0, 330000000000, '0', NULL, '浙江省', '浙江', '浙江', 'ZheJiang', 120.152791, 30.267446);
INSERT INTO `china_region` VALUES (192231, 1, 330000000000, 330100000000, '310000', '0571', '杭州市', '杭州', '浙江,杭州', 'HangZhou', 120.15507, 30.274084);
INSERT INTO `china_region` VALUES (192232, 2, 330100000000, 330101000000, '310000', '0571', '市辖区', '杭州', '浙江,杭州', 'HangZhou', 120.15507, 30.274084);
INSERT INTO `china_region` VALUES (192233, 2, 330100000000, 330102000000, '310000', '0571', '上城区', '上城', '浙江,杭州,上城', 'ShangCheng', 120.184349, 30.25446);
INSERT INTO `china_region` VALUES (192294, 2, 330100000000, 330103000000, '310000', '0571', '下城区', '下城', '浙江,杭州,下城', 'XiaCheng', 120.180895, 30.281714);
INSERT INTO `china_region` VALUES (192377, 2, 330100000000, 330104000000, '310000', '0571', '江干区', '江干', '浙江,杭州,江干', 'JiangGan', 120.213843, 30.262661);
INSERT INTO `china_region` VALUES (192577, 2, 330100000000, 330105000000, '310000', '0571', '拱墅区', '拱墅', '浙江,杭州,拱墅', 'GongShu', 120.141406, 30.319037);
INSERT INTO `china_region` VALUES (192687, 2, 330100000000, 330106000000, '310000', '0571', '西湖区', '西湖', '浙江,杭州,西湖', 'XiHu', 120.130203, 30.259324);
INSERT INTO `china_region` VALUES (192910, 2, 330100000000, 330108000000, '310000', '0571', '滨江区', '滨江', '浙江,杭州,滨江', 'BinJiang', 120.146505, 30.16245);
INSERT INTO `china_region` VALUES (192974, 2, 330100000000, 330109000000, '311200', '0571', '萧山区', '萧山', '浙江,杭州,萧山', 'XiaoShan', 120.493286, 30.28333);
INSERT INTO `china_region` VALUES (193629, 2, 330100000000, 330110000000, '311100', '0571', '余杭区', '余杭', '浙江,杭州,余杭', 'YuHang', 120.245433, 30.409974);
INSERT INTO `china_region` VALUES (194017, 2, 330100000000, 330111000000, '311401', '0571', '富阳区', '富阳', '浙江,杭州,富阳', 'FuYang', 119.960076, 30.048692);
INSERT INTO `china_region` VALUES (194371, 2, 330100000000, 330112000000, '310006', '0571', '临安区', '临安', '浙江,杭州,临安', 'LinAn', 119.724733, 30.233873);
INSERT INTO `china_region` VALUES (194698, 2, 330100000000, 330122000000, '311500', '0571', '桐庐县', '桐庐', '浙江,杭州,桐庐', 'TongLu', 119.691434, 29.793535);
INSERT INTO `china_region` VALUES (194916, 2, 330100000000, 330127000000, '311700', '0571', '淳安县', '淳安', '浙江,杭州,淳安', 'ChunAn', 119.041864, 29.608772);
INSERT INTO `china_region` VALUES (195379, 2, 330100000000, 330182000000, '311600', '0571', '建德市', '建德', '浙江,杭州,建德', 'JianDe', 119.281213, 29.474884);
INSERT INTO `china_region` VALUES (195667, 1, 330000000000, 330200000000, '315000', '0574', '宁波市', '宁波', '浙江,宁波', 'NingBo', 121.550357, 29.874556);
INSERT INTO `china_region` VALUES (195668, 2, 330200000000, 330201000000, '315000', '0574', '市辖区', '宁波', '浙江,宁波', 'NingBo', 121.550357, 29.874556);
INSERT INTO `china_region` VALUES (195669, 2, 330200000000, 330203000000, '315000', '0574', '海曙区', '海曙', '浙江,宁波,海曙', 'HaiShu', 121.551066, 29.859772);
INSERT INTO `china_region` VALUES (195963, 2, 330200000000, 330205000000, '315000', '0574', '江北区', '江北', '浙江,宁波,江北', 'JiangBei', 121.555227, 29.886757);
INSERT INTO `china_region` VALUES (196132, 2, 330200000000, 330206000000, '315800', '0574', '北仑区', '北仑', '浙江,宁波,北仑', 'BeiLun', 121.844618, 29.899044);
INSERT INTO `china_region` VALUES (196411, 2, 330200000000, 330211000000, '315200', '0574', '镇海区', '镇海', '浙江,宁波,镇海', 'ZhenHai', 121.71654, 29.948998);
INSERT INTO `china_region` VALUES (196518, 2, 330200000000, 330212000000, '315100', '0574', '鄞州区', '鄞州', '浙江,宁波,鄞州', 'YinZhou', 121.546603, 29.816511);
INSERT INTO `china_region` VALUES (196960, 2, 330200000000, 330213000000, '315511', '0574', '奉化区', '奉化', '浙江,宁波,奉化', 'FengHua', 121.517574, 29.569578);
INSERT INTO `china_region` VALUES (197370, 2, 330200000000, 330225000000, '315700', '0574', '象山县', '象山', '浙江,宁波,象山', 'XiangShan', 121.869339, 29.476705);
INSERT INTO `china_region` VALUES (197931, 2, 330200000000, 330226000000, '315600', '0574', '宁海县', '宁海', '浙江,宁波,宁海', 'NingHai', 121.429477, 29.287939);
INSERT INTO `china_region` VALUES (198360, 2, 330200000000, 330281000000, '315400', '0574', '余姚市', '余姚', '浙江,宁波,余姚', 'YuYao', 121.154594, 30.037858);
INSERT INTO `china_region` VALUES (198708, 2, 330200000000, 330282000000, '315300', '0574', '慈溪市', '慈溪', '浙江,宁波,慈溪', 'CiXi', 121.266579, 30.169665);
INSERT INTO `china_region` VALUES (199123, 1, 330000000000, 330300000000, '325000', '0577', '温州市', '温州', '浙江,温州', 'WenZhou', 120.699366, 27.994267);
INSERT INTO `china_region` VALUES (199124, 2, 330300000000, 330301000000, '325000', '0577', '市辖区', '温州', '浙江,温州', 'WenZhou', 120.699366, 27.994267);
INSERT INTO `china_region` VALUES (199125, 2, 330300000000, 330302000000, '325000', '0577', '鹿城区', '鹿城', '浙江,温州,鹿城', 'LuCheng', 120.655135, 28.015455);
INSERT INTO `china_region` VALUES (199308, 2, 330300000000, 330303000000, '325000', '0577', '龙湾区', '龙湾', '浙江,温州,龙湾', 'LongWan', 120.811213, 27.932747);
INSERT INTO `china_region` VALUES (199390, 2, 330300000000, 330304000000, '325000', '0577', '瓯海区', '瓯海', '浙江,温州,瓯海', 'OuHai', 120.708827, 27.914241);
INSERT INTO `china_region` VALUES (199609, 2, 330300000000, 330305000000, '325799', '0577', '洞头区', '洞头', '浙江,温州,洞头', 'DongTou', 121.157249, 27.836154);
INSERT INTO `china_region` VALUES (199710, 2, 330300000000, 330324000000, '325100', '0577', '永嘉县', '永嘉', '浙江,温州,永嘉', 'YongJia', 120.682144, 28.150591);
INSERT INTO `china_region` VALUES (200283, 2, 330300000000, 330326000000, '325400', '0577', '平阳县', '平阳', '浙江,温州,平阳', 'PingYang', 120.565793, 27.661918);
INSERT INTO `china_region` VALUES (200757, 2, 330300000000, 330327000000, '325800', '0577', '苍南县', '苍南', '浙江,温州,苍南', 'CangNan', 120.425766, 27.51828);
INSERT INTO `china_region` VALUES (201207, 2, 330300000000, 330328000000, '325300', '0577', '文成县', '文成', '浙江,温州,文成', 'WenCheng', 120.091498, 27.786996);
INSERT INTO `china_region` VALUES (201471, 2, 330300000000, 330329000000, '325500', '0577', '泰顺县', '泰顺', '浙江,温州,泰顺', 'TaiShun', 119.717649, 27.556884);
INSERT INTO `china_region` VALUES (201783, 2, 330300000000, 330371000000, '325011', '0577', '温州经济技术开发区', '温州经开区', '浙江,温州,温州经开区', 'WenZhouJingKaiQu', 120.818233, 27.874078);
INSERT INTO `china_region` VALUES (201837, 2, 330300000000, 330381000000, '325200', '0577', '瑞安市', '瑞安', '浙江,温州,瑞安', 'RuiAn', 120.655148, 27.778657);
INSERT INTO `china_region` VALUES (202383, 2, 330300000000, 330382000000, '325600', '0577', '乐清市', '乐清', '浙江,温州,乐清', 'YueQing', 120.967147, 28.116083);
INSERT INTO `china_region` VALUES (202923, 2, 330300000000, 330383000000, '325802', '0577', '龙港市', '龙港', '浙江,温州,龙港', 'LongGang', 120.537832, 27.561541);
INSERT INTO `china_region` VALUES (203029, 1, 330000000000, 330400000000, '314000', '0573', '嘉兴市', '嘉兴', '浙江,嘉兴', 'JiaXing', 120.755486, 30.746129);
INSERT INTO `china_region` VALUES (203030, 2, 330400000000, 330401000000, '314000', '0573', '市辖区', '嘉兴', '浙江,嘉兴', 'JiaXing', 120.755486, 30.746129);
INSERT INTO `china_region` VALUES (203031, 2, 330400000000, 330402000000, '314000', '0573', '南湖区', '南湖', '浙江,嘉兴,南湖', 'NanHu', 120.783025, 30.747842);
INSERT INTO `china_region` VALUES (203180, 2, 330400000000, 330411000000, '314000', '0573', '秀洲区', '秀洲', '浙江,嘉兴,秀洲', 'XiuZhou', 120.709018, 30.765168);
INSERT INTO `china_region` VALUES (203352, 2, 330400000000, 330421000000, '314100', '0573', '嘉善县', '嘉善', '浙江,嘉兴,嘉善', 'JiaShan', 120.92585, 30.830898);
INSERT INTO `china_region` VALUES (203524, 2, 330400000000, 330424000000, '314300', '0573', '海盐县', '海盐', '浙江,嘉兴,海盐', 'HaiYan', 120.946263, 30.526436);
INSERT INTO `china_region` VALUES (203663, 2, 330400000000, 330481000000, '314400', '0573', '海宁市', '海宁', '浙江,嘉兴,海宁', 'HaiNing', 120.680757, 30.510659);
INSERT INTO `china_region` VALUES (203906, 2, 330400000000, 330482000000, '314200', '0573', '平湖市', '平湖', '浙江,嘉兴,平湖', 'PingHu', 121.015142, 30.677233);
INSERT INTO `china_region` VALUES (204050, 2, 330400000000, 330483000000, '314500', '0573', '桐乡市', '桐乡', '浙江,嘉兴,桐乡', 'TongXiang', 120.565099, 30.630173);
INSERT INTO `china_region` VALUES (204273, 1, 330000000000, 330500000000, '313000', '0572', '湖州市', '湖州', '浙江,湖州', 'HuZhou', 120.086823, 30.894348);
INSERT INTO `china_region` VALUES (204274, 2, 330500000000, 330501000000, '313000', '0572', '市辖区', '湖州', '浙江,湖州', 'HuZhou', 120.086823, 30.894348);
INSERT INTO `china_region` VALUES (204275, 2, 330500000000, 330502000000, '313000', '0572', '吴兴区', '吴兴', '浙江,湖州,吴兴', 'WuXing', 120.185838, 30.857151);
INSERT INTO `china_region` VALUES (204641, 2, 330500000000, 330503000000, '313000', '0572', '南浔区', '南浔', '浙江,湖州,南浔', 'NanXun', 120.418512, 30.84969);
INSERT INTO `china_region` VALUES (204909, 2, 330500000000, 330521000000, '313200', '0572', '德清县', '德清', '浙江,湖州,德清', 'DeQing', 119.977401, 30.54251);
INSERT INTO `china_region` VALUES (205097, 2, 330500000000, 330522000000, '313100', '0572', '长兴县', '长兴', '浙江,湖州,长兴', 'ChangXing', 119.910952, 31.026666);
INSERT INTO `china_region` VALUES (205387, 2, 330500000000, 330523000000, '313300', '0572', '安吉县', '安吉', '浙江,湖州,安吉', 'AnJi', 119.680353, 30.638675);
INSERT INTO `china_region` VALUES (205613, 1, 330000000000, 330600000000, '312000', '0575', '绍兴市', '绍兴', '浙江,绍兴', 'ShaoXing', 120.580232, 30.029752);
INSERT INTO `china_region` VALUES (205614, 2, 330600000000, 330601000000, '312000', '0575', '市辖区', '绍兴', '浙江,绍兴', 'ShaoXing', 120.580232, 30.029752);
INSERT INTO `china_region` VALUES (205615, 2, 330600000000, 330602000000, '312000', '0575', '越城区', '越城', '浙江,绍兴,越城', 'YueCheng', 120.582633, 29.988245);
INSERT INTO `china_region` VALUES (205991, 2, 330600000000, 330603000000, '312030', '0575', '柯桥区', '柯桥', '浙江,绍兴,柯桥', 'KeQiao', 120.495065, 30.081942);
INSERT INTO `china_region` VALUES (206351, 2, 330600000000, 330604000000, '312363', '0575', '上虞区', '上虞', '浙江,绍兴,上虞', 'ShangYu', 120.868122, 30.033121);
INSERT INTO `china_region` VALUES (206766, 2, 330600000000, 330624000000, '312500', '0575', '新昌县', '新昌', '浙江,绍兴,新昌', 'XinChang', 120.903866, 29.499832);
INSERT INTO `china_region` VALUES (207072, 2, 330600000000, 330681000000, '311800', '0575', '诸暨市', '诸暨', '浙江,绍兴,诸暨', 'ZhuJi', 120.246863, 29.708692);
INSERT INTO `china_region` VALUES (207622, 2, 330600000000, 330683000000, '312400', '0575', '嵊州市', '嵊州', '浙江,绍兴,嵊州', 'ShengZhou', 120.831025, 29.56141);
INSERT INTO `china_region` VALUES (207924, 1, 330000000000, 330700000000, '321000', '0579', '金华市', '金华', '浙江,金华', 'JinHua', 119.647444, 29.079059);
INSERT INTO `china_region` VALUES (207925, 2, 330700000000, 330701000000, '321000', '0579', '市辖区', '金华', '浙江,金华', 'JinHua', 119.647444, 29.079059);
INSERT INTO `china_region` VALUES (207926, 2, 330700000000, 330702000000, '321000', '0579', '婺城区', '婺城', '浙江,金华,婺城', 'WuCheng', 119.571633, 29.086221);
INSERT INTO `china_region` VALUES (208383, 2, 330700000000, 330703000000, '321000', '0579', '金东区', '金东', '浙江,金华,金东', 'JinDong', 119.692862, 29.099122);
INSERT INTO `china_region` VALUES (208750, 2, 330700000000, 330723000000, '321200', '0579', '武义县', '武义', '浙江,金华,武义', 'WuYi', 119.816318, 28.892721);
INSERT INTO `china_region` VALUES (209048, 2, 330700000000, 330726000000, '322200', '0579', '浦江县', '浦江', '浙江,金华,浦江', 'PuJiang', 119.892222, 29.452477);
INSERT INTO `china_region` VALUES (209308, 2, 330700000000, 330727000000, '322300', '0579', '磐安县', '磐安', '浙江,金华,磐安', 'PanAn', 120.450178, 29.054048);
INSERT INTO `china_region` VALUES (209559, 2, 330700000000, 330781000000, '321100', '0579', '兰溪市', '兰溪', '浙江,金华,兰溪', 'LanXi', 119.460526, 29.208919);
INSERT INTO `china_region` VALUES (209933, 2, 330700000000, 330782000000, '322000', '0579', '义乌市', '义乌', '浙江,金华,义乌', 'YiWu', 120.075058, 29.306841);
INSERT INTO `china_region` VALUES (210492, 2, 330700000000, 330783000000, '322100', '0579', '东阳市', '东阳', '浙江,金华,东阳', 'DongYang', 120.241566, 29.289648);
INSERT INTO `china_region` VALUES (210899, 2, 330700000000, 330784000000, '321300', '0579', '永康市', '永康', '浙江,金华,永康', 'YongKang', 119.647444, 29.079059);
INSERT INTO `china_region` VALUES (211367, 1, 330000000000, 330800000000, '324000', '0570', '衢州市', '衢州', '浙江,衢州', 'QuZhou', 118.859457, 28.970079);
INSERT INTO `china_region` VALUES (211368, 2, 330800000000, 330801000000, '324000', '0570', '市辖区', '衢州', '浙江,衢州', 'QuZhou', 118.859457, 28.970079);
INSERT INTO `china_region` VALUES (211369, 2, 330800000000, 330802000000, '324000', '0570', '柯城区', '柯城', '浙江,衢州,柯城', 'KeCheng', 118.871333, 28.968504);
INSERT INTO `china_region` VALUES (211659, 2, 330800000000, 330803000000, '324000', '0570', '衢江区', '衢江', '浙江,衢州,衢江', 'QuJiang', 118.95946, 28.97978);
INSERT INTO `china_region` VALUES (211966, 2, 330800000000, 330822000000, '324200', '0570', '常山县', '常山', '浙江,衢州,常山', 'ChangShan', 118.511249, 28.901463);
INSERT INTO `china_region` VALUES (212175, 2, 330800000000, 330824000000, '324300', '0570', '开化县', '开化', '浙江,衢州,开化', 'KaiHua', 118.415495, 29.137337);
INSERT INTO `china_region` VALUES (212456, 2, 330800000000, 330825000000, '324400', '0570', '龙游县', '龙游', '浙江,衢州,龙游', 'LongYou', 119.172304, 29.028319);
INSERT INTO `china_region` VALUES (212748, 2, 330800000000, 330881000000, '324100', '0570', '江山市', '江山', '浙江,衢州,江山', 'JiangShan', 118.626926, 28.737245);
INSERT INTO `china_region` VALUES (213079, 1, 330000000000, 330900000000, '316000', '0580', '舟山市', '舟山', '浙江,舟山', 'ZhouShan', 122.207215, 29.985295);
INSERT INTO `china_region` VALUES (213080, 2, 330900000000, 330901000000, '316000', '0580', '市辖区', '舟山', '浙江,舟山', 'ZhouShan', 122.207215, 29.985295);
INSERT INTO `china_region` VALUES (213081, 2, 330900000000, 330902000000, '316000', '0580', '定海区', '定海', '浙江,舟山,定海', 'DingHai', 122.106773, 30.019858);
INSERT INTO `china_region` VALUES (213254, 2, 330900000000, 330903000000, '316100', '0580', '普陀区', '普陀', '浙江,舟山,普陀', 'PuTuo', 122.323867, 29.97176);
INSERT INTO `china_region` VALUES (213392, 2, 330900000000, 330921000000, '316200', '0580', '岱山县', '岱山', '浙江,舟山,岱山', 'DaiShan', 122.226237, 30.264139);
INSERT INTO `china_region` VALUES (213487, 2, 330900000000, 330922000000, '202450', '0580', '嵊泗县', '嵊泗', '浙江,舟山,嵊泗', 'ShengSi', 122.451382, 30.725686);
INSERT INTO `china_region` VALUES (213533, 1, 330000000000, 331000000000, '318000', '0576', '台州市', '台州', '浙江,台州', 'TaiZhou', 121.420757, 28.656386);
INSERT INTO `china_region` VALUES (213534, 2, 331000000000, 331001000000, '318000', '0576', '市辖区', '台州', '浙江,台州', 'TaiZhou', 121.420757, 28.656386);
INSERT INTO `china_region` VALUES (213535, 2, 331000000000, 331002000000, '317700', '0576', '椒江区', '椒江', '浙江,台州,椒江', 'JiaoJiang', 121.442676, 28.673726);
INSERT INTO `china_region` VALUES (213819, 2, 331000000000, 331003000000, '318020', '0576', '黄岩区', '黄岩', '浙江,台州,黄岩', 'HuangYan', 121.261893, 28.650117);
INSERT INTO `china_region` VALUES (214189, 2, 331000000000, 331004000000, '318000', '0576', '路桥区', '路桥', '浙江,台州,路桥', 'LuQiao', 121.365123, 28.582655);
INSERT INTO `china_region` VALUES (214433, 2, 331000000000, 331022000000, '317100', '0576', '三门县', '三门', '浙江,台州,三门', 'SanMen', 121.395777, 29.104873);
INSERT INTO `china_region` VALUES (214734, 2, 331000000000, 331023000000, '317200', '0576', '天台县', '天台', '浙江,台州,天台', 'TianTai', 121.006725, 29.144079);
INSERT INTO `china_region` VALUES (215145, 2, 331000000000, 331024000000, '317300', '0576', '仙居县', '仙居', '浙江,台州,仙居', 'XianJu', 120.735081, 28.849213);
INSERT INTO `china_region` VALUES (215506, 2, 331000000000, 331081000000, '317500', '0576', '温岭市', '温岭', '浙江,台州,温岭', 'WenLing', 121.385604, 28.372506);
INSERT INTO `china_region` VALUES (216194, 2, 331000000000, 331082000000, '317000', '0576', '临海市', '临海', '浙江,台州,临海', 'LinHai', 121.145047, 28.858457);
INSERT INTO `china_region` VALUES (216887, 2, 331000000000, 331083000000, '317600', '0576', '玉环市', '玉环', '浙江,台州,玉环', 'YuHuan', 121.231805, 28.13593);
INSERT INTO `china_region` VALUES (217122, 1, 330000000000, 331100000000, '323000', '0578', '丽水市', '丽水', '浙江,丽水', 'LiShui', 119.922796, 28.46763);
INSERT INTO `china_region` VALUES (217123, 2, 331100000000, 331101000000, '323000', '0578', '市辖区', '丽水', '浙江,丽水', 'LiShui', 119.922796, 28.46763);
INSERT INTO `china_region` VALUES (217124, 2, 331100000000, 331102000000, '323000', '0578', '莲都区', '莲都', '浙江,丽水,莲都', 'LianDu', 119.912612, 28.445836);
INSERT INTO `china_region` VALUES (217419, 2, 331100000000, 331121000000, '323900', '0578', '青田县', '青田', '浙江,丽水,青田', 'QingTian', 120.289598, 28.13906);
INSERT INTO `china_region` VALUES (217847, 2, 331100000000, 331122000000, '321400', '0578', '缙云县', '缙云', '浙江,丽水,缙云', 'JinYun', 120.091573, 28.659279);
INSERT INTO `china_region` VALUES (218125, 2, 331100000000, 331123000000, '323300', '0578', '遂昌县', '遂昌', '浙江,丽水,遂昌', 'SuiChang', 119.276104, 28.592119);
INSERT INTO `china_region` VALUES (218357, 2, 331100000000, 331124000000, '323400', '0578', '松阳县', '松阳', '浙江,丽水,松阳', 'SongYang', 119.482015, 28.449171);
INSERT INTO `china_region` VALUES (218593, 2, 331100000000, 331125000000, '323600', '0578', '云和县', '云和', '浙江,丽水,云和', 'YunHe', 119.573397, 28.11579);
INSERT INTO `china_region` VALUES (218691, 2, 331100000000, 331126000000, '323800', '0578', '庆元县', '庆元', '浙江,丽水,庆元', 'QingYuan', 119.06259, 27.61922);
INSERT INTO `china_region` VALUES (218911, 2, 331100000000, 331127000000, '323500', '0578', '景宁畲族自治县', '景宁', '浙江,丽水,景宁', 'JingNing', 119.635697, 27.973312);
INSERT INTO `china_region` VALUES (219080, 2, 331100000000, 331181000000, '323700', '0578', '龙泉市', '龙泉', '浙江,丽水,龙泉', 'LongQuan', 119.141461, 28.074623);
INSERT INTO `china_region` VALUES (219349, 0, 0, 340000000000, '0', NULL, '安徽省', '安徽', '安徽', 'AnHui', 117.284922, 31.861184);
INSERT INTO `china_region` VALUES (219350, 1, 340000000000, 340100000000, '230000', '0551', '合肥市', '合肥', '安徽,合肥', 'HeFei', 117.227239, 31.820586);
INSERT INTO `china_region` VALUES (219351, 2, 340100000000, 340101000000, '230000', '0551', '市辖区', '合肥', '安徽,合肥', 'HeFei', 117.227239, 31.820586);
INSERT INTO `china_region` VALUES (219352, 2, 340100000000, 340102000000, '230000', '0551', '瑶海区', '瑶海', '安徽,合肥,瑶海', 'YaoHai', 117.309229, 31.858048);
INSERT INTO `china_region` VALUES (219456, 2, 340100000000, 340103000000, '230000', '0551', '庐阳区', '庐阳', '安徽,合肥,庐阳', 'LuYang', 117.264595, 31.878641);
INSERT INTO `china_region` VALUES (219540, 2, 340100000000, 340104000000, '230000', '0551', '蜀山区', '蜀山', '安徽,合肥,蜀山', 'ShuShan', 117.260536, 31.851158);
INSERT INTO `china_region` VALUES (219648, 2, 340100000000, 340111000000, '230000', '0551', '包河区', '包河', '安徽,合肥,包河', 'BaoHe', 117.309658, 31.793093);
INSERT INTO `china_region` VALUES (219774, 2, 340100000000, 340121000000, '231100', '0551', '长丰县', '长丰', '安徽,合肥,长丰', 'ChangFeng', 117.167564, 32.478018);
INSERT INTO `china_region` VALUES (220067, 2, 340100000000, 340122000000, '230000', '0551', '肥东县', '肥东', '安徽,合肥,肥东', 'FeiDong', 117.469383, 31.88794);
INSERT INTO `china_region` VALUES (220423, 2, 340100000000, 340123000000, '231200', '0551', '肥西县', '肥西', '安徽,合肥,肥西', 'FeiXi', 117.157981, 31.70681);
INSERT INTO `china_region` VALUES (220716, 2, 340100000000, 340124000000, '230001', '0551', '庐江县', '庐江', '安徽,合肥,庐江', 'LuJiang', 117.2878, 31.25555);
INSERT INTO `china_region` VALUES (220966, 2, 340100000000, 340171000000, '230012', '0551', '合肥高新技术产业开发区', '合肥高', '安徽,合肥,合肥高', 'HeFeiGao', 117.136168, 31.833331);
INSERT INTO `china_region` VALUES (220997, 2, 340100000000, 340172000000, '230092', '0551', '合肥经济技术开发区', '合肥经开区', '安徽,合肥,合肥经开区', 'HeFeiJingKaiQu', 117.197482, 31.785186);
INSERT INTO `china_region` VALUES (221062, 2, 340100000000, 340173000000, '231633', '0551', '合肥新站高新技术产业开发区', '合肥新站高', '安徽,合肥,合肥新站高', 'HeFeiXinZhanGao', 117.377451, 31.940098);
INSERT INTO `china_region` VALUES (221120, 2, 340100000000, 340181000000, '230002', '0551', '巢湖市', '巢湖', '安徽,合肥,巢湖', 'ChaoHu', 117.8618, 31.598628);
INSERT INTO `china_region` VALUES (221332, 1, 340000000000, 340200000000, '241000', '0553', '芜湖市', '芜湖', '安徽,芜湖', 'WuHu', 118.432941, 31.352859);
INSERT INTO `china_region` VALUES (221333, 2, 340200000000, 340201000000, '241000', '0553', '市辖区', '芜湖', '安徽,芜湖', 'WuHu', 118.432941, 31.352859);
INSERT INTO `china_region` VALUES (221334, 2, 340200000000, 340202000000, '241000', '0553', '镜湖区', '镜湖', '安徽,芜湖,镜湖', 'JingHu', 118.385146, 31.340404);
INSERT INTO `china_region` VALUES (221412, 2, 340200000000, 340203000000, '241000', '0553', '弋江区', '弋江', '安徽,芜湖,弋江', 'YiJiang', 118.372655, 31.311757);
INSERT INTO `china_region` VALUES (221471, 2, 340200000000, 340207000000, '241000', '0553', '鸠江区', '鸠江', '安徽,芜湖,鸠江', 'JiuJiang', 118.391734, 31.369373);
INSERT INTO `china_region` VALUES (221594, 2, 340200000000, 340208000000, '241000', '0553', '三山区', '三山', '安徽,芜湖,三山', 'SanShan', 118.268101, 31.219568);
INSERT INTO `china_region` VALUES (221645, 2, 340200000000, 340221000000, '241100', '0553', '芜湖县', '芜湖', '安徽,芜湖', 'WuHu', 118.576124, 31.134809);
INSERT INTO `china_region` VALUES (221739, 2, 340200000000, 340222000000, '241200', '0553', '繁昌县', '繁昌', '安徽,芜湖,繁昌', 'FanChang', 118.201349, 31.080896);
INSERT INTO `china_region` VALUES (221843, 2, 340200000000, 340223000000, '242400', '0553', '南陵县', '南陵', '安徽,芜湖,南陵', 'NanLing', 118.33436, 30.914923);
INSERT INTO `china_region` VALUES (222026, 2, 340200000000, 340225000000, '238312', '0553', '无为县', '无为', '安徽,芜湖,无为', 'WuWei', 117.902366, 31.303168);
INSERT INTO `china_region` VALUES (222325, 2, 340200000000, 340271000000, '241199', '0553', '芜湖经济技术开发区', '芜湖经开区', '安徽,芜湖,芜湖经开区', 'WuHuJingKaiQu', 118.576124, 31.134809);
INSERT INTO `china_region` VALUES (222351, 2, 340200000000, 340272000000, '241007', '0553', '安徽芜湖长江大桥经济开发区', '安徽芜湖长江大桥经开区', '安徽,芜湖,芜湖长江大桥经开区', 'AnHuiWuHuChangJiangDaQiaoJingK', 118.341074, 31.385737);
INSERT INTO `china_region` VALUES (222360, 1, 340000000000, 340300000000, '233000', '0552', '蚌埠市', '蚌埠', '安徽,蚌埠', 'BengBu', 117.389719, 32.916287);
INSERT INTO `china_region` VALUES (222361, 2, 340300000000, 340301000000, '233000', '0552', '市辖区', '蚌埠', '安徽,蚌埠', 'BengBu', 117.389719, 32.916287);
INSERT INTO `china_region` VALUES (222362, 2, 340300000000, 340302000000, '233000', '0552', '龙子湖区', '龙子湖', '安徽,蚌埠,龙子湖', 'LongZiHu', 117.39379, 32.943014);
INSERT INTO `china_region` VALUES (222429, 2, 340300000000, 340303000000, '233000', '0552', '蚌山区', '蚌山', '安徽,蚌埠,蚌山', 'BengShan', 117.367614, 32.944198);
INSERT INTO `china_region` VALUES (222477, 2, 340300000000, 340304000000, '233000', '0552', '禹会区', '禹会', '安徽,蚌埠,禹会', 'YuHui', 117.342451, 32.929711);
INSERT INTO `china_region` VALUES (222553, 2, 340300000000, 340311000000, '233000', '0552', '淮上区', '淮上', '安徽,蚌埠,淮上', 'HuaiShang', 117.359331, 32.965435);
INSERT INTO `china_region` VALUES (222643, 2, 340300000000, 340321000000, '233400', '0552', '怀远县', '怀远', '安徽,蚌埠,怀远', 'HuaiYuan', 117.205234, 32.970031);
INSERT INTO `china_region` VALUES (223028, 2, 340300000000, 340322000000, '233300', '0552', '五河县', '五河', '安徽,蚌埠,五河', 'WuHe', 117.879486, 33.127823);
INSERT INTO `china_region` VALUES (223262, 2, 340300000000, 340323000000, '233700', '0552', '固镇县', '固镇', '安徽,蚌埠,固镇', 'GuZhen', 117.316955, 33.316899);
INSERT INTO `china_region` VALUES (223504, 2, 340300000000, 340371000000, '233000', '0552', '蚌埠市高新技术开发区', '蚌埠高', '安徽,蚌埠,蚌埠高', 'BengBuGao', 117.325987, 32.918471);
INSERT INTO `china_region` VALUES (223512, 2, 340300000000, 340372000000, '233100', '0552', '蚌埠市经济开发区', '蚌埠经开区', '安徽,蚌埠,蚌埠经开区', 'BengBuJingKaiQu', 117.375267, 32.93151);
INSERT INTO `china_region` VALUES (223560, 1, 340000000000, 340400000000, '232000', '0554', '淮南市', '淮南', '安徽,淮南', 'HuaiNan', 116.999932, 32.625478);
INSERT INTO `china_region` VALUES (223561, 2, 340400000000, 340401000000, '232000', '0554', '市辖区', '淮南', '安徽,淮南', 'HuaiNan', 116.999932, 32.625478);
INSERT INTO `china_region` VALUES (223562, 2, 340400000000, 340402000000, '232000', '0554', '大通区', '大通', '安徽,淮南,大通', 'DaTong', 117.053273, 32.631533);
INSERT INTO `china_region` VALUES (223640, 2, 340400000000, 340403000000, '232000', '0554', '田家庵区', '田家庵', '安徽,淮南,田家庵', 'TianJiaAn', 117.017409, 32.647155);
INSERT INTO `china_region` VALUES (223795, 2, 340400000000, 340404000000, '232000', '0554', '谢家集区', '谢家集', '安徽,淮南,谢家集', 'XieJiaJi', 116.859048, 32.599901);
INSERT INTO `china_region` VALUES (223902, 2, 340400000000, 340405000000, '232052', '0554', '八公山区', '八公山', '安徽,淮南,八公山', 'BaGongShan', 116.83349, 32.631379);
INSERT INTO `china_region` VALUES (223953, 2, 340400000000, 340406000000, '232000', '0554', '潘集区', '潘集', '安徽,淮南,潘集', 'PanJi', 116.834716, 32.77208);
INSERT INTO `china_region` VALUES (224146, 2, 340400000000, 340421000000, '232100', '0554', '凤台县', '凤台', '安徽,淮南,凤台', 'FengTai', 116.711051, 32.709445);
INSERT INTO `china_region` VALUES (224469, 2, 340400000000, 340422000000, '232200', '0554', '寿县', '寿县', '安徽,淮南,寿县', 'ShouXian', 116.787141, 32.573306);
INSERT INTO `china_region` VALUES (224783, 1, 340000000000, 340500000000, '243000', '0555', '马鞍山市', '马鞍山', '安徽,马鞍山', 'MaAnShan', 118.506759, 31.670452);
INSERT INTO `china_region` VALUES (224784, 2, 340500000000, 340501000000, '243000', '0555', '市辖区', '马鞍山', '安徽,马鞍山', 'MaAnShan', 118.506759, 31.670452);
INSERT INTO `china_region` VALUES (224785, 2, 340500000000, 340503000000, '243000', '0555', '花山区', '花山', '安徽,马鞍山,花山', 'HuaShan', 118.492562, 31.71971);
INSERT INTO `china_region` VALUES (224863, 2, 340500000000, 340504000000, '243000', '0555', '雨山区', '雨山', '安徽,马鞍山,雨山', 'YuShan', 118.49856, 31.682208);
INSERT INTO `china_region` VALUES (224938, 2, 340500000000, 340506000000, '243131', '0555', '博望区', '博望', '安徽,马鞍山,博望', 'BoWang', 118.844538, 31.558471);
INSERT INTO `china_region` VALUES (224987, 2, 340500000000, 340521000000, '243100', '0555', '当涂县', '当涂', '安徽,马鞍山,当涂', 'DangTu', 118.497972, 31.571213);
INSERT INTO `china_region` VALUES (225159, 2, 340500000000, 340522000000, '238100', '0555', '含山县', '含山', '安徽,马鞍山,含山', 'HanShan', 118.101421, 31.735599);
INSERT INTO `china_region` VALUES (225289, 2, 340500000000, 340523000000, '238200', '0555', '和县', '和县', '安徽,马鞍山,和县', 'HeXian', 118.351405, 31.741794);
INSERT INTO `china_region` VALUES (225420, 1, 340000000000, 340600000000, '235000', '0561', '淮北市', '淮北', '安徽,淮北', 'HuaiBei', 116.798265, 33.955844);
INSERT INTO `china_region` VALUES (225421, 2, 340600000000, 340601000000, '235000', '0561', '市辖区', '淮北', '安徽,淮北', 'HuaiBei', 116.798265, 33.955844);
INSERT INTO `china_region` VALUES (225422, 2, 340600000000, 340602000000, '235000', '0561', '杜集区', '杜集', '安徽,淮北,杜集', 'DuJi', 116.828134, 33.991451);
INSERT INTO `china_region` VALUES (225483, 2, 340600000000, 340603000000, '235000', '0561', '相山区', '相山', '安徽,淮北,相山', 'XiangShan', 116.794345, 33.959893);
INSERT INTO `china_region` VALUES (225582, 2, 340600000000, 340604000000, '235000', '0561', '烈山区', '烈山', '安徽,淮北,烈山', 'LieShan', 116.813042, 33.895139);
INSERT INTO `china_region` VALUES (225654, 2, 340600000000, 340621000000, '235100', '0561', '濉溪县', '濉溪', '安徽,淮北,濉溪', 'SuiXi', 116.766299, 33.915477);
INSERT INTO `china_region` VALUES (225913, 1, 340000000000, 340700000000, '244000', '0562', '铜陵市', '铜陵', '安徽,铜陵', 'TongLing', 117.812079, 30.945429);
INSERT INTO `china_region` VALUES (225914, 2, 340700000000, 340701000000, '244000', '0562', '市辖区', '铜陵', '安徽,铜陵', 'TongLing', 117.812079, 30.945429);
INSERT INTO `china_region` VALUES (225915, 2, 340700000000, 340705000000, '244000', '0562', '铜官区', '铜官', '安徽,铜陵,铜官', 'TongGuan', 117.816174, 30.927608);
INSERT INTO `china_region` VALUES (225980, 2, 340700000000, 340706000000, '244099', '0562', '义安区', '义安', '安徽,铜陵,义安', 'YiAn', 117.812079, 30.945429);
INSERT INTO `china_region` VALUES (226107, 2, 340700000000, 340711000000, '244000', '0562', '郊区', '郊区', '安徽,铜陵,郊区', 'JiaoQu', 117.80707, 30.908927);
INSERT INTO `china_region` VALUES (226199, 2, 340700000000, 340722000000, '246700', '0562', '枞阳县', '枞阳', '安徽,铜陵,枞阳', 'ZongYang', 117.250622, 30.705963);
INSERT INTO `china_region` VALUES (226434, 1, 340000000000, 340800000000, '246000', '0556', '安庆市', '安庆', '安徽,安庆', 'AnQing', 117.063754, 30.543494);
INSERT INTO `china_region` VALUES (226435, 2, 340800000000, 340801000000, '246000', '0556', '市辖区', '安庆', '安徽,安庆', 'AnQing', 117.063754, 30.543494);
INSERT INTO `china_region` VALUES (226436, 2, 340800000000, 340802000000, '246000', '0556', '迎江区', '迎江', '安徽,安庆,迎江', 'YingJiang', 117.09115, 30.511548);
INSERT INTO `china_region` VALUES (226493, 2, 340800000000, 340803000000, '246000', '0556', '大观区', '大观', '安徽,安庆,大观', 'DaGuan', 117.02167, 30.553957);
INSERT INTO `china_region` VALUES (226566, 2, 340800000000, 340811000000, '246001', '0556', '宜秀区', '宜秀', '安徽,安庆,宜秀', 'YiXiu', 117.070003, 30.541323);
INSERT INTO `china_region` VALUES (226633, 2, 340800000000, 340822000000, '246100', '0556', '怀宁县', '怀宁', '安徽,安庆,怀宁', 'HuaiNing', 116.829475, 30.733825);
INSERT INTO `china_region` VALUES (226897, 2, 340800000000, 340825000000, '246400', '0556', '太湖县', '太湖', '安徽,安庆,太湖', 'TaiHu', 116.308795, 30.45422);
INSERT INTO `china_region` VALUES (227103, 2, 340800000000, 340826000000, '246500', '0556', '宿松县', '宿松', '安徽,安庆,宿松', 'SuSong', 116.129105, 30.153746);
INSERT INTO `china_region` VALUES (227349, 2, 340800000000, 340827000000, '246200', '0556', '望江县', '望江', '安徽,安庆,望江', 'WangJiang', 116.694183, 30.124428);
INSERT INTO `china_region` VALUES (227499, 2, 340800000000, 340828000000, '246600', '0556', '岳西县', '岳西', '安徽,安庆,岳西', 'YueXi', 116.359921, 30.849442);
INSERT INTO `china_region` VALUES (227714, 2, 340800000000, 340871000000, '246001', '0556', '安徽安庆经济开发区', '安徽安庆经开区', '安徽,安庆,安庆经开区', 'AnHuiAnQingJingKaiQu', 117.068488, 30.547182);
INSERT INTO `china_region` VALUES (227743, 2, 340800000000, 340881000000, '231400', '0556', '桐城市', '桐城', '安徽,安庆,桐城', 'TongCheng', 116.97412, 31.0358);
INSERT INTO `china_region` VALUES (227985, 2, 340800000000, 340882000000, '246300', '0556', '潜山市', '潜山', '安徽,安庆,潜山', 'QianShan', 116.58127, 30.631129);
INSERT INTO `china_region` VALUES (228188, 1, 340000000000, 341000000000, '242700', '0559', '黄山市', '黄山', '安徽,黄山', 'HuangShan', 118.337481, 29.714655);
INSERT INTO `china_region` VALUES (228189, 2, 341000000000, 341001000000, '242700', '0559', '市辖区', '黄山', '安徽,黄山', 'HuangShan', 118.337481, 29.714655);
INSERT INTO `china_region` VALUES (228190, 2, 341000000000, 341002000000, '245000', '0559', '屯溪区', '屯溪', '安徽,黄山,屯溪', 'TunXi', 118.315329, 29.696109);
INSERT INTO `china_region` VALUES (228276, 2, 341000000000, 341003000000, '242700', '0559', '黄山区', '黄山', '安徽,黄山', 'HuangShan', 118.141568, 30.272942);
INSERT INTO `china_region` VALUES (228378, 2, 341000000000, 341004000000, '245061', '0559', '徽州区', '徽州', '安徽,黄山,徽州', 'HuiZhou', 118.336751, 29.827279);
INSERT INTO `china_region` VALUES (228442, 2, 341000000000, 341021000000, '245200', '0559', '歙县', '歙县', '安徽,黄山,歙县', 'SheXian', 118.415356, 29.861308);
INSERT INTO `china_region` VALUES (228668, 2, 341000000000, 341022000000, '245400', '0559', '休宁县', '休宁', '安徽,黄山,休宁', 'XiuNing', 118.199179, 29.789095);
INSERT INTO `china_region` VALUES (228848, 2, 341000000000, 341023000000, '245500', '0559', '黟县', '黟县', '安徽,黄山,黟县', 'YiXian', 117.938373, 29.924805);
INSERT INTO `china_region` VALUES (228927, 2, 341000000000, 341024000000, '245600', '0559', '祁门县', '祁门', '安徽,黄山,祁门', 'QiMen', 117.717396, 29.854055);
INSERT INTO `china_region` VALUES (229064, 1, 340000000000, 341100000000, '239000', '0550', '滁州市', '滁州', '安徽,滁州', 'ChuZhou', 118.317106, 32.301556);
INSERT INTO `china_region` VALUES (229065, 2, 341100000000, 341101000000, '239000', '0550', '市辖区', '滁州', '安徽,滁州', 'ChuZhou', 118.317106, 32.301556);
INSERT INTO `china_region` VALUES (229066, 2, 341100000000, 341102000000, '239000', '0550', '琅琊区', '琅琊', '安徽,滁州,琅琊', 'LangYa', 118.305843, 32.29453);
INSERT INTO `china_region` VALUES (229130, 2, 341100000000, 341103000000, '239000', '0550', '南谯区', '南谯', '安徽,滁州,南谯', 'NanQiao', 118.296955, 32.329842);
INSERT INTO `china_region` VALUES (229234, 2, 341100000000, 341122000000, '239200', '0550', '来安县', '来安', '安徽,滁州,来安', 'LaiAn', 118.435749, 32.452167);
INSERT INTO `china_region` VALUES (229395, 2, 341100000000, 341124000000, '239500', '0550', '全椒县', '全椒', '安徽,滁州,全椒', 'QuanJiao', 118.27309, 32.085407);
INSERT INTO `china_region` VALUES (229521, 2, 341100000000, 341125000000, '233200', '0550', '定远县', '定远', '安徽,滁州,定远', 'DingYuan', 117.698563, 32.530982);
INSERT INTO `china_region` VALUES (229808, 2, 341100000000, 341126000000, '233100', '0550', '凤阳县', '凤阳', '安徽,滁州,凤阳', 'FengYang', 117.531623, 32.874735);
INSERT INTO `china_region` VALUES (230072, 2, 341100000000, 341171000000, '233280', '0550', '苏滁现代产业园', '苏滁现代产业园', '安徽,滁州,苏滁现代产业园', 'SuChuXianDaiChanYeYuan', 118.377963, 32.29277);
INSERT INTO `china_region` VALUES (230078, 2, 341100000000, 341172000000, '239399', '0550', '滁州经济技术开发区', '滁州经开区', '安徽,滁州,滁州经开区', 'ChuZhouJingKaiQu', 118.317106, 32.301556);
INSERT INTO `china_region` VALUES (230097, 2, 341100000000, 341181000000, '239300', '0550', '天长市', '天长', '安徽,滁州,天长', 'TianChang', 119.004817, 32.667571);
INSERT INTO `china_region` VALUES (230287, 2, 341100000000, 341182000000, '239400', '0550', '明光市', '明光', '安徽,滁州,明光', 'MingGuang', 118.018276, 32.781995);
INSERT INTO `china_region` VALUES (230462, 1, 340000000000, 341200000000, '236000', '1558', '阜阳市', '阜阳', '安徽,阜阳', 'FuYang', 115.814204, 32.890124);
INSERT INTO `china_region` VALUES (230463, 2, 341200000000, 341201000000, '236000', '1558', '市辖区', '阜阳', '安徽,阜阳', 'FuYang', 115.814204, 32.890124);
INSERT INTO `china_region` VALUES (230464, 2, 341200000000, 341202000000, '236000', '1558', '颍州区', '颍州', '安徽,阜阳,颍州', 'YingZhou', 115.806942, 32.883468);
INSERT INTO `china_region` VALUES (230626, 2, 341200000000, 341203000000, '236000', '1558', '颍东区', '颍东', '安徽,阜阳,颍东', 'YingDong', 115.856735, 32.91248);
INSERT INTO `china_region` VALUES (230756, 2, 341200000000, 341204000000, '236000', '1558', '颍泉区', '颍泉', '安徽,阜阳,颍泉', 'YingQuan', 115.808327, 32.924918);
INSERT INTO `china_region` VALUES (230887, 2, 341200000000, 341221000000, '236400', '1558', '临泉县', '临泉', '安徽,阜阳,临泉', 'LinQuan', 115.261473, 33.040261);
INSERT INTO `china_region` VALUES (231311, 2, 341200000000, 341222000000, '236600', '1558', '太和县', '太和', '安徽,阜阳,太和', 'TaiHe', 115.621934, 33.160326);
INSERT INTO `china_region` VALUES (231654, 2, 341200000000, 341225000000, '236300', '1558', '阜南县', '阜南', '安徽,阜阳,阜南', 'FuNan', 115.595644, 32.658297);
INSERT INTO `china_region` VALUES (232015, 2, 341200000000, 341226000000, '236200', '1558', '颍上县', '颍上', '安徽,阜阳,颍上', 'YingShang', 116.256789, 32.653255);
INSERT INTO `china_region` VALUES (232397, 2, 341200000000, 341271000000, '230041', '1558', '阜阳合肥现代产业园区', '阜阳合肥现代产业园', '安徽,阜阳,阜阳合肥现代产业园', 'FuYangHeFeiXianDaiChanYeYuan', 115.904746, 32.809592);
INSERT INTO `china_region` VALUES (232408, 2, 341200000000, 341272000000, '236072', '1558', '阜阳经济技术开发区', '阜阳经开区', '安徽,阜阳,阜阳经开区', 'FuYangJingKaiQu', 115.857371, 32.865142);
INSERT INTO `china_region` VALUES (232426, 2, 341200000000, 341282000000, '236500', '1558', '界首市', '界首', '安徽,阜阳,界首', 'JieShou', 115.374564, 33.257013);
INSERT INTO `china_region` VALUES (232604, 1, 340000000000, 341300000000, '234000', '0557', '宿州市', '宿州', '安徽,宿州', 'SuZhou', 116.964356, 33.646373);
INSERT INTO `china_region` VALUES (232605, 2, 341300000000, 341301000000, '234000', '0557', '市辖区', '宿州', '安徽,宿州', 'SuZhou', 116.964356, 33.646373);
INSERT INTO `china_region` VALUES (232606, 2, 341300000000, 341302000000, '234000', '0557', '埇桥区', '埇桥', '安徽,宿州,埇桥', 'YongQiao', 116.977463, 33.640061);
INSERT INTO `china_region` VALUES (233023, 2, 341300000000, 341321000000, '235300', '0557', '砀山县', '砀山', '安徽,宿州,砀山', 'DangShan', 116.367095, 34.442561);
INSERT INTO `china_region` VALUES (233207, 2, 341300000000, 341322000000, '235200', '0557', '萧县', '萧县', '安徽,宿州,萧县', 'XiaoXian', 116.94729, 34.188728);
INSERT INTO `china_region` VALUES (233506, 2, 341300000000, 341323000000, '234200', '0557', '灵璧县', '灵璧', '安徽,宿州,灵璧', 'LingBi', 117.552462, 33.552998);
INSERT INTO `china_region` VALUES (233837, 2, 341300000000, 341324000000, '234300', '0557', '泗县', '泗县', '安徽,宿州,泗县', 'SiXian', 117.910629, 33.482982);
INSERT INTO `china_region` VALUES (234049, 2, 341300000000, 341371000000, '234000', '0557', '宿州马鞍山现代产业园区', '宿州马鞍山现代产业园', '安徽,宿州,宿州马鞍山现代产业园', 'SuZhouMaAnShanXianDaiChanYeYua', 118.00507, 33.607941);
INSERT INTO `china_region` VALUES (234062, 2, 341300000000, 341372000000, '234000', '0557', '宿州经济技术开发区', '宿州经开区', '安徽,宿州,宿州经开区', 'SuZhouJingKaiQu', 116.964356, 33.646373);
INSERT INTO `china_region` VALUES (234073, 1, 340000000000, 341500000000, '237000', '0564', '六安市', '六安', '安徽,六安', 'LuAn', 116.521854, 31.733699);
INSERT INTO `china_region` VALUES (234074, 2, 341500000000, 341501000000, '237000', '0564', '市辖区', '六安', '安徽,六安', 'LuAn', 116.521854, 31.733699);
INSERT INTO `china_region` VALUES (234075, 2, 341500000000, 341502000000, '237000', '0564', '金安区', '金安', '安徽,六安,金安', 'JinAn', 116.539679, 31.749265);
INSERT INTO `china_region` VALUES (234441, 2, 341500000000, 341503000000, '237000', '0564', '裕安区', '裕安', '安徽,六安,裕安', 'YuAn', 116.47992, 31.737813);
INSERT INTO `china_region` VALUES (234775, 2, 341500000000, 341504000000, '237431', '0564', '叶集区', '叶集', '安徽,六安,叶集', 'YeJi', 115.908504, 31.849165);
INSERT INTO `china_region` VALUES (234859, 2, 341500000000, 341522000000, '237400', '0564', '霍邱县', '霍邱', '安徽,六安,霍邱', 'HuoQiu', 116.277912, 32.353038);
INSERT INTO `china_region` VALUES (235305, 2, 341500000000, 341523000000, '231300', '0564', '舒城县', '舒城', '安徽,六安,舒城', 'ShuCheng', 116.948623, 31.462027);
INSERT INTO `china_region` VALUES (235754, 2, 341500000000, 341524000000, '237300', '0564', '金寨县', '金寨', '安徽,六安,金寨', 'JinZhai', 115.934366, 31.72717);
INSERT INTO `china_region` VALUES (236008, 2, 341500000000, 341525000000, '237200', '0564', '霍山县', '霍山', '安徽,六安,霍山', 'HuoShan', 116.332951, 31.392786);
INSERT INTO `china_region` VALUES (236172, 1, 340000000000, 341600000000, '236000', '0558', '亳州市', '亳州', '安徽,亳州', 'BoZhou', 115.778676, 33.844582);
INSERT INTO `china_region` VALUES (236173, 2, 341600000000, 341601000000, '236000', '0558', '市辖区', '亳州', '安徽,亳州', 'BoZhou', 115.778676, 33.844582);
INSERT INTO `china_region` VALUES (236174, 2, 341600000000, 341602000000, '236800', '0558', '谯城区', '谯城', '安徽,亳州,谯城', 'QiaoCheng', 115.779025, 33.876235);
INSERT INTO `china_region` VALUES (236514, 2, 341600000000, 341621000000, '233600', '0558', '涡阳县', '涡阳', '安徽,亳州,涡阳', 'GuoYang', 116.215665, 33.492921);
INSERT INTO `china_region` VALUES (236922, 2, 341600000000, 341622000000, '233500', '0558', '蒙城县', '蒙城', '安徽,亳州,蒙城', 'MengCheng', 116.564248, 33.265831);
INSERT INTO `china_region` VALUES (237234, 2, 341600000000, 341623000000, '236700', '0558', '利辛县', '利辛', '安徽,亳州,利辛', 'LiXin', 116.208635, 33.144724);
INSERT INTO `china_region` VALUES (237621, 1, 340000000000, 341700000000, '247100', '0566', '池州市', '池州', '安徽,池州', 'ChiZhou', 117.491568, 30.6648);
INSERT INTO `china_region` VALUES (237622, 2, 341700000000, 341701000000, '247100', '0566', '市辖区', '池州', '安徽,池州', 'ChiZhou', 117.491568, 30.6648);
INSERT INTO `china_region` VALUES (237623, 2, 341700000000, 341702000000, '247100', '0566', '贵池区', '贵池', '安徽,池州,贵池', 'GuiChi', 117.567379, 30.687181);
INSERT INTO `china_region` VALUES (237876, 2, 341700000000, 341721000000, '247200', '0566', '东至县', '东至', '安徽,池州,东至', 'DongZhi', 117.027533, 30.111182);
INSERT INTO `china_region` VALUES (238147, 2, 341700000000, 341722000000, '245100', '0566', '石台县', '石台', '安徽,池州,石台', 'ShiTai', 117.486306, 30.210313);
INSERT INTO `china_region` VALUES (238242, 2, 341700000000, 341723000000, '242800', '0566', '青阳县', '青阳', '安徽,池州,青阳', 'QingYang', 117.847362, 30.63923);
INSERT INTO `china_region` VALUES (238387, 1, 340000000000, 341800000000, '242000', '0563', '宣城市', '宣城', '安徽,宣城', 'XuanCheng', 118.758816, 30.940718);
INSERT INTO `china_region` VALUES (238388, 2, 341800000000, 341801000000, '242000', '0563', '市辖区', '宣城', '安徽,宣城', 'XuanCheng', 118.758816, 30.940718);
INSERT INTO `china_region` VALUES (238389, 2, 341800000000, 341802000000, '242000', '0563', '宣州区', '宣州', '安徽,宣城,宣州', 'XuanZhou', 118.756328, 30.946319);
INSERT INTO `china_region` VALUES (238624, 2, 341800000000, 341821000000, '242100', '0563', '郎溪县', '郎溪', '安徽,宣城,郎溪', 'LangXi', 119.179657, 31.126412);
INSERT INTO `china_region` VALUES (238742, 2, 341800000000, 341823000000, '242500', '0563', '泾县', '泾县', '安徽,宣城,泾县', 'JingXian', 118.419864, 30.688578);
INSERT INTO `china_region` VALUES (238898, 2, 341800000000, 341824000000, '245300', '0563', '绩溪县', '绩溪', '安徽,宣城,绩溪', 'JiXi', 118.578519, 30.067533);
INSERT INTO `china_region` VALUES (238993, 2, 341800000000, 341825000000, '242600', '0563', '旌德县', '旌德', '安徽,宣城,旌德', 'JingDe', 118.540487, 30.28635);
INSERT INTO `china_region` VALUES (239072, 2, 341800000000, 341871000000, '242199', '0563', '宣城市经济开发区', '宣城经开区', '安徽,宣城,宣城经开区', 'XuanChengJingKaiQu', 118.758816, 30.940718);
INSERT INTO `china_region` VALUES (239097, 2, 341800000000, 341881000000, '242300', '0563', '宁国市', '宁国', '安徽,宣城,宁国', 'NingGuo', 118.982915, 30.633571);
INSERT INTO `china_region` VALUES (239234, 2, 341800000000, 341882000000, '242200', '0563', '广德市', '广德', '安徽,宣城,广德', 'GuangDe', 119.420935, 30.877555);
INSERT INTO `china_region` VALUES (239384, 0, 0, 350000000000, '0', NULL, '福建省', '福建', '福建', 'FuJian', 119.295144, 26.100779);
INSERT INTO `china_region` VALUES (239385, 1, 350000000000, 350100000000, '350000', '0591', '福州市', '福州', '福建,福州', 'FuZhou', 119.296494, 26.074507);
INSERT INTO `china_region` VALUES (239386, 2, 350100000000, 350101000000, '350000', '0591', '市辖区', '福州', '福建,福州', 'FuZhou', 119.296494, 26.074507);
INSERT INTO `china_region` VALUES (239387, 2, 350100000000, 350102000000, '350000', '0591', '鼓楼区', '鼓楼', '福建,福州,鼓楼', 'GuLou', 119.303822, 26.082294);
INSERT INTO `china_region` VALUES (239467, 2, 350100000000, 350103000000, '350000', '0591', '台江区', '台江', '福建,福州,台江', 'TaiJiang', 119.314054, 26.052842);
INSERT INTO `china_region` VALUES (239530, 2, 350100000000, 350104000000, '350000', '0591', '仓山区', '仓山', '福建,福州,仓山', 'CangShan', 119.273546, 26.046744);
INSERT INTO `china_region` VALUES (239726, 2, 350100000000, 350105000000, '350000', '0591', '马尾区', '马尾', '福建,福州,马尾', 'MaYi', 119.455589, 25.9895);
INSERT INTO `china_region` VALUES (239807, 2, 350100000000, 350111000000, '350000', '0591', '晋安区', '晋安', '福建,福州,晋安', 'JinAn', 119.328515, 26.082105);
INSERT INTO `china_region` VALUES (240011, 2, 350100000000, 350112000000, '350005', '0591', '长乐区', '长乐', '福建,福州,长乐', 'ChangLe', 119.523266, 25.962888);
INSERT INTO `china_region` VALUES (240291, 2, 350100000000, 350121000000, '350100', '0591', '闽侯县', '闽侯', '福建,福州,闽侯', 'MinHou', 119.131725, 26.150047);
INSERT INTO `china_region` VALUES (240637, 2, 350100000000, 350122000000, '350500', '0591', '连江县', '连江', '福建,福州,连江', 'LianJiang', 119.539704, 26.197364);
INSERT INTO `china_region` VALUES (240944, 2, 350100000000, 350123000000, '350600', '0591', '罗源县', '罗源', '福建,福州,罗源', 'LuoYuan', 119.549776, 26.489559);
INSERT INTO `china_region` VALUES (241159, 2, 350100000000, 350124000000, '350800', '0591', '闽清县', '闽清', '福建,福州,闽清', 'MinQing', 118.863361, 26.221198);
INSERT INTO `china_region` VALUES (241468, 2, 350100000000, 350125000000, '350700', '0591', '永泰县', '永泰', '福建,福州,永泰', 'YongTai', 118.932592, 25.866695);
INSERT INTO `china_region` VALUES (241757, 2, 350100000000, 350128000000, '350400', '0591', '平潭县', '平潭', '福建,福州,平潭', 'PingTan', 119.790168, 25.49872);
INSERT INTO `china_region` VALUES (241992, 2, 350100000000, 350181000000, '350300', '0591', '福清市', '福清', '福建,福州,福清', 'FuQing', 119.384334, 25.721143);
INSERT INTO `china_region` VALUES (242531, 1, 350000000000, 350200000000, '361000', '0592', '厦门市', '厦门', '福建,厦门', 'XiaMen', 118.089425, 24.479833);
INSERT INTO `china_region` VALUES (242532, 2, 350200000000, 350201000000, '361000', '0592', '市辖区', '厦门', '福建,厦门', 'XiaMen', 118.089425, 24.479833);
INSERT INTO `china_region` VALUES (242533, 2, 350200000000, 350203000000, '361000', '0592', '思明区', '思明', '福建,厦门,思明', 'SiMing', 118.082658, 24.445567);
INSERT INTO `china_region` VALUES (242643, 2, 350200000000, 350205000000, '361000', '0592', '海沧区', '海沧', '福建,厦门,海沧', 'HaiCang', 118.032818, 24.484503);
INSERT INTO `china_region` VALUES (242695, 2, 350200000000, 350206000000, '361000', '0592', '湖里区', '湖里', '福建,厦门,湖里', 'HuLi', 118.146769, 24.512905);
INSERT INTO `china_region` VALUES (242761, 2, 350200000000, 350211000000, '361000', '0592', '集美区', '集美', '福建,厦门,集美', 'JiMei', 118.097337, 24.57597);
INSERT INTO `china_region` VALUES (242843, 2, 350200000000, 350212000000, '361100', '0592', '同安区', '同安', '福建,厦门,同安', 'TongAn', 118.152149, 24.722747);
INSERT INTO `china_region` VALUES (242993, 2, 350200000000, 350213000000, '361100', '0592', '翔安区', '翔安', '福建,厦门,翔安', 'XiangAn', 118.248034, 24.618544);
INSERT INTO `china_region` VALUES (243121, 1, 350000000000, 350300000000, '351100', '0594', '莆田市', '莆田', '福建,莆田', 'PuTian', 119.007777, 25.454084);
INSERT INTO `china_region` VALUES (243122, 2, 350300000000, 350301000000, '351100', '0594', '市辖区', '莆田', '福建,莆田', 'PuTian', 119.007777, 25.454084);
INSERT INTO `china_region` VALUES (243123, 2, 350300000000, 350302000000, '351100', '0594', '城厢区', '城厢', '福建,莆田,城厢', 'ChengXiang', 118.993885, 25.419319);
INSERT INTO `china_region` VALUES (243251, 2, 350300000000, 350303000000, '351100', '0594', '涵江区', '涵江', '福建,莆田,涵江', 'HanJiang', 119.11629, 25.45872);
INSERT INTO `china_region` VALUES (243465, 2, 350300000000, 350304000000, '351100', '0594', '荔城区', '荔城', '福建,莆田,荔城', 'LiCheng', 119.015123, 25.431979);
INSERT INTO `china_region` VALUES (243602, 2, 350300000000, 350305000000, '351100', '0594', '秀屿区', '秀屿', '福建,莆田,秀屿', 'XiuYu', 119.105528, 25.318672);
INSERT INTO `china_region` VALUES (243816, 2, 350300000000, 350322000000, '351200', '0594', '仙游县', '仙游', '福建,莆田,仙游', 'XianYou', 118.691601, 25.362094);
INSERT INTO `china_region` VALUES (244162, 1, 350000000000, 350400000000, '365000', '0598', '三明市', '三明', '福建,三明', 'SanMing', 117.638678, 26.263406);
INSERT INTO `china_region` VALUES (244163, 2, 350400000000, 350401000000, '365000', '0598', '市辖区', '三明', '福建,三明', 'SanMing', 117.638678, 26.263406);
INSERT INTO `china_region` VALUES (244164, 2, 350400000000, 350402000000, '365000', '0598', '梅列区', '梅列', '福建,三明,梅列', 'MeiLie', 117.645856, 26.271711);
INSERT INTO `china_region` VALUES (244223, 2, 350400000000, 350403000000, '365000', '0598', '三元区', '三元', '福建,三明,三元', 'SanYuan', 117.608045, 26.23402);
INSERT INTO `china_region` VALUES (244312, 2, 350400000000, 350421000000, '365200', '0598', '明溪县', '明溪', '福建,三明,明溪', 'MingXi', 117.201847, 26.357379);
INSERT INTO `china_region` VALUES (244418, 2, 350400000000, 350423000000, '365300', '0598', '清流县', '清流', '福建,三明,清流', 'QingLiu', 116.816909, 26.177797);
INSERT INTO `china_region` VALUES (244552, 2, 350400000000, 350424000000, '365400', '0598', '宁化县', '宁化', '福建,三明,宁化', 'NingHua', 116.654365, 26.261754);
INSERT INTO `china_region` VALUES (244798, 2, 350400000000, 350425000000, '366100', '0598', '大田县', '大田', '福建,三明,大田', 'DaTian', 117.847115, 25.692699);
INSERT INTO `china_region` VALUES (245097, 2, 350400000000, 350426000000, '365100', '0598', '尤溪县', '尤溪', '福建,三明,尤溪', 'YouXi', 118.190467, 26.170171);
INSERT INTO `china_region` VALUES (245381, 2, 350400000000, 350427000000, '365500', '0598', '沙县', '沙县', '福建,三明,沙县', 'ShaXian', 117.79245, 26.3973);
INSERT INTO `china_region` VALUES (245587, 2, 350400000000, 350428000000, '353300', '0598', '将乐县', '将乐', '福建,三明,将乐', 'JiangLe', 117.471373, 26.728953);
INSERT INTO `china_region` VALUES (245755, 2, 350400000000, 350429000000, '354400', '0598', '泰宁县', '泰宁', '福建,三明,泰宁', 'TaiNing', 117.17574, 26.900259);
INSERT INTO `china_region` VALUES (245884, 2, 350400000000, 350430000000, '354500', '0598', '建宁县', '建宁', '福建,三明,建宁', 'JianNing', 116.846084, 26.830902);
INSERT INTO `china_region` VALUES (245995, 2, 350400000000, 350481000000, '366000', '0598', '永安市', '永安', '福建,三明,永安', 'YongAn', 117.374461, 25.976394);
INSERT INTO `china_region` VALUES (246273, 1, 350000000000, 350500000000, '362000', '0595', '泉州市', '泉州', '福建,泉州', 'QuanZhou', 118.675675, 24.874132);
INSERT INTO `china_region` VALUES (246274, 2, 350500000000, 350501000000, '362000', '0595', '市辖区', '泉州', '福建,泉州', 'QuanZhou', 118.675675, 24.874132);
INSERT INTO `china_region` VALUES (246275, 2, 350500000000, 350502000000, '362000', '0595', '鲤城区', '鲤城', '福建,泉州,鲤城', 'LiCheng', 118.586884, 24.907581);
INSERT INTO `china_region` VALUES (246368, 2, 350500000000, 350503000000, '362000', '0595', '丰泽区', '丰泽', '福建,泉州,丰泽', 'FengZe', 118.668527, 24.871018);
INSERT INTO `china_region` VALUES (246457, 2, 350500000000, 350504000000, '362000', '0595', '洛江区', '洛江', '福建,泉州,洛江', 'LuoJiang', 118.671193, 24.939751);
INSERT INTO `china_region` VALUES (246551, 2, 350500000000, 350505000000, '362100', '0595', '泉港区', '泉港', '福建,泉州,泉港', 'QuanGang', 118.916309, 25.119815);
INSERT INTO `china_region` VALUES (246661, 2, 350500000000, 350521000000, '362100', '0595', '惠安县', '惠安', '福建,泉州,惠安', 'HuiAn', 118.796605, 25.030781);
INSERT INTO `china_region` VALUES (246978, 2, 350500000000, 350524000000, '362400', '0595', '安溪县', '安溪', '福建,泉州,安溪', 'AnXi', 118.186289, 25.055955);
INSERT INTO `china_region` VALUES (247494, 2, 350500000000, 350525000000, '362600', '0595', '永春县', '永春', '福建,泉州,永春', 'YongChun', 118.675675, 24.874132);
INSERT INTO `china_region` VALUES (247753, 2, 350500000000, 350526000000, '362500', '0595', '德化县', '德化', '福建,泉州,德化', 'DeHua', 118.241094, 25.491494);
INSERT INTO `china_region` VALUES (247986, 2, 350500000000, 350527000000, '362000', '0595', '金门县', '金门', '福建,泉州,金门', 'JinMen', 118.317089, 24.432706);
INSERT INTO `china_region` VALUES (247987, 2, 350500000000, 350581000000, '362700', '0595', '石狮市', '石狮', '福建,泉州,石狮', 'ShiShi', 118.648066, 24.732204);
INSERT INTO `china_region` VALUES (248125, 2, 350500000000, 350582000000, '362200', '0595', '晋江市', '晋江', '福建,泉州,晋江', 'JinJiang', 118.552365, 24.781681);
INSERT INTO `china_region` VALUES (248549, 2, 350500000000, 350583000000, '362300', '0595', '南安市', '南安', '福建,泉州,南安', 'NanAn', 118.386279, 24.960385);
INSERT INTO `china_region` VALUES (249003, 1, 350000000000, 350600000000, '363000', '0596', '漳州市', '漳州', '福建,漳州', 'ZhangZhou', 117.647481, 24.512948);
INSERT INTO `china_region` VALUES (249004, 2, 350600000000, 350601000000, '363000', '0596', '市辖区', '漳州', '福建,漳州', 'ZhangZhou', 117.647481, 24.512948);
INSERT INTO `china_region` VALUES (249005, 2, 350600000000, 350602000000, '363000', '0596', '芗城区', '芗城', '福建,漳州,芗城', 'XiangCheng', 117.653975, 24.5109);
INSERT INTO `china_region` VALUES (249196, 2, 350600000000, 350603000000, '363000', '0596', '龙文区', '龙文', '福建,漳州,龙文', 'LongWen', 117.709755, 24.503113);
INSERT INTO `china_region` VALUES (249281, 2, 350600000000, 350622000000, '363300', '0596', '云霄县', '云霄', '福建,漳州,云霄', 'YunXiao', 117.339573, 23.957936);
INSERT INTO `china_region` VALUES (249503, 2, 350600000000, 350623000000, '363200', '0596', '漳浦县', '漳浦', '福建,漳州,漳浦', 'ZhangPu', 117.613808, 24.117102);
INSERT INTO `china_region` VALUES (249880, 2, 350600000000, 350624000000, '363500', '0596', '诏安县', '诏安', '福建,漳州,诏安', 'ZhaoAn', 117.175185, 23.711579);
INSERT INTO `china_region` VALUES (250156, 2, 350600000000, 350625000000, '363900', '0596', '长泰县', '长泰', '福建,漳州,长泰', 'ChangTai', 117.759153, 24.625449);
INSERT INTO `china_region` VALUES (250250, 2, 350600000000, 350626000000, '363400', '0596', '东山县', '东山', '福建,漳州,东山', 'DongShan', 117.430061, 23.701262);
INSERT INTO `china_region` VALUES (250338, 2, 350600000000, 350627000000, '363600', '0596', '南靖县', '南靖', '福建,漳州,南靖', 'NanJing', 117.357321, 24.514654);
INSERT INTO `china_region` VALUES (250552, 2, 350600000000, 350628000000, '363700', '0596', '平和县', '平和', '福建,漳州,平和', 'PingHe', 117.314891, 24.363437);
INSERT INTO `china_region` VALUES (250832, 2, 350600000000, 350629000000, '363800', '0596', '华安县', '华安', '福建,漳州,华安', 'HuaAn', 117.534103, 25.004425);
INSERT INTO `china_region` VALUES (250944, 2, 350600000000, 350681000000, '363100', '0596', '龙海市', '龙海', '福建,漳州,龙海', 'LongHai', 117.818197, 24.446706);
INSERT INTO `china_region` VALUES (251268, 1, 350000000000, 350700000000, '353000', '0599', '南平市', '南平', '福建,南平', 'NanPing', 118.177708, 26.641768);
INSERT INTO `china_region` VALUES (251269, 2, 350700000000, 350701000000, '353000', '0599', '市辖区', '南平', '福建,南平', 'NanPing', 118.177708, 26.641768);
INSERT INTO `china_region` VALUES (251270, 2, 350700000000, 350702000000, '353000', '0599', '延平区', '延平', '福建,南平,延平', 'YanPing', 118.181894, 26.637457);
INSERT INTO `china_region` VALUES (251609, 2, 350700000000, 350703000000, '354200', '0599', '建阳区', '建阳', '福建,南平,建阳', 'JianYang', 118.120464, 27.331876);
INSERT INTO `china_region` VALUES (251847, 2, 350700000000, 350721000000, '353200', '0599', '顺昌县', '顺昌', '福建,南平,顺昌', 'ShunChang', 117.810357, 26.793288);
INSERT INTO `china_region` VALUES (252010, 2, 350700000000, 350722000000, '353400', '0599', '浦城县', '浦城', '福建,南平,浦城', 'PuCheng', 118.541256, 27.917263);
INSERT INTO `china_region` VALUES (252338, 2, 350700000000, 350723000000, '354100', '0599', '光泽县', '光泽', '福建,南平,光泽', 'GuangZe', 117.334106, 27.540988);
INSERT INTO `china_region` VALUES (252450, 2, 350700000000, 350724000000, '353500', '0599', '松溪县', '松溪', '福建,南平,松溪', 'SongXi', 118.785468, 27.526232);
INSERT INTO `china_region` VALUES (252569, 2, 350700000000, 350725000000, '353600', '0599', '政和县', '政和', '福建,南平,政和', 'ZhengHe', 118.857642, 27.366104);
INSERT INTO `china_region` VALUES (252717, 2, 350700000000, 350781000000, '354000', '0599', '邵武市', '邵武', '福建,南平,邵武', 'ShaoWu', 117.492534, 27.340327);
INSERT INTO `china_region` VALUES (252918, 2, 350700000000, 350782000000, '354300', '0599', '武夷山市', '武夷山', '福建,南平,武夷山', 'WuYiShan', 118.03531, 27.756648);
INSERT INTO `china_region` VALUES (253071, 2, 350700000000, 350783000000, '353100', '0599', '建瓯市', '建瓯', '福建,南平,建瓯', 'JianOu', 118.304988, 27.022727);
INSERT INTO `china_region` VALUES (253346, 1, 350000000000, 350800000000, '364000', '0597', '龙岩市', '龙岩', '福建,龙岩', 'LongYan', 117.017536, 25.075123);
INSERT INTO `china_region` VALUES (253347, 2, 350800000000, 350801000000, '364000', '0597', '市辖区', '龙岩', '福建,龙岩', 'LongYan', 117.017536, 25.075123);
INSERT INTO `china_region` VALUES (253348, 2, 350800000000, 350802000000, '364000', '0597', '新罗区', '新罗', '福建,龙岩,新罗', 'XinLuo', 117.037264, 25.098292);
INSERT INTO `china_region` VALUES (253712, 2, 350800000000, 350803000000, '364100', '0597', '永定区', '永定', '福建,龙岩,永定', 'YongDing', 116.732092, 24.723962);
INSERT INTO `china_region` VALUES (254019, 2, 350800000000, 350821000000, '366300', '0597', '长汀县', '长汀', '福建,龙岩,长汀', 'ChangTing', 116.357581, 25.833531);
INSERT INTO `china_region` VALUES (254339, 2, 350800000000, 350823000000, '364200', '0597', '上杭县', '上杭', '福建,龙岩,上杭', 'ShangHang', 116.420099, 25.049518);
INSERT INTO `china_region` VALUES (254707, 2, 350800000000, 350824000000, '364300', '0597', '武平县', '武平', '福建,龙岩,武平', 'WuPing', 116.100408, 25.095298);
INSERT INTO `china_region` VALUES (254950, 2, 350800000000, 350825000000, '366200', '0597', '连城县', '连城', '福建,龙岩,连城', 'LianCheng', 116.754473, 25.710539);
INSERT INTO `china_region` VALUES (255216, 2, 350800000000, 350881000000, '364400', '0597', '漳平市', '漳平', '福建,龙岩,漳平', 'ZhangPing', 117.419998, 25.290185);
INSERT INTO `china_region` VALUES (255425, 1, 350000000000, 350900000000, '352000', '0593', '宁德市', '宁德', '福建,宁德', 'NingDe', 119.547932, 26.665617);
INSERT INTO `china_region` VALUES (255426, 2, 350900000000, 350901000000, '352000', '0593', '市辖区', '宁德', '福建,宁德', 'NingDe', 119.547932, 26.665617);
INSERT INTO `china_region` VALUES (255427, 2, 350900000000, 350902000000, '352000', '0593', '蕉城区', '蕉城', '福建,宁德,蕉城', 'JiaoCheng', 119.526299, 26.660611);
INSERT INTO `china_region` VALUES (255775, 2, 350900000000, 350921000000, '355100', '0593', '霞浦县', '霞浦', '福建,宁德,霞浦', 'XiaPu', 120.005643, 26.885204);
INSERT INTO `china_region` VALUES (256110, 2, 350900000000, 350922000000, '352200', '0593', '古田县', '古田', '福建,宁德,古田', 'GuTian', 118.746284, 26.577837);
INSERT INTO `china_region` VALUES (256417, 2, 350900000000, 350923000000, '352300', '0593', '屏南县', '屏南', '福建,宁德,屏南', 'PingNan', 118.985895, 26.908276);
INSERT INTO `china_region` VALUES (256588, 2, 350900000000, 350924000000, '355500', '0593', '寿宁县', '寿宁', '福建,宁德,寿宁', 'ShouNing', 119.514987, 27.454479);
INSERT INTO `china_region` VALUES (256808, 2, 350900000000, 350925000000, '355400', '0593', '周宁县', '周宁', '福建,宁德,周宁', 'ZhouNing', 119.339025, 27.104591);
INSERT INTO `china_region` VALUES (256965, 2, 350900000000, 350926000000, '355300', '0593', '柘荣县', '柘荣', '福建,宁德,柘荣', 'ZheRong', 119.900609, 27.233933);
INSERT INTO `china_region` VALUES (257091, 2, 350900000000, 350981000000, '355000', '0593', '福安市', '福安', '福建,宁德,福安', 'FuAn', 119.652171, 27.087184);
INSERT INTO `china_region` VALUES (257602, 2, 350900000000, 350982000000, '355200', '0593', '福鼎市', '福鼎', '福建,宁德,福鼎', 'FuDing', 120.216978, 27.324479);
INSERT INTO `china_region` VALUES (257906, 0, 0, 360000000000, '0', NULL, '江西省', '江西', '江西', 'JiangXi', 115.909228, 28.675696);
INSERT INTO `china_region` VALUES (257907, 1, 360000000000, 360100000000, '330000', '0791', '南昌市', '南昌', '江西,南昌', 'NanChang', 115.858197, 28.682892);
INSERT INTO `china_region` VALUES (257908, 2, 360100000000, 360101000000, '330000', '0791', '市辖区', '南昌', '江西,南昌', 'NanChang', 115.858197, 28.682892);
INSERT INTO `china_region` VALUES (257909, 2, 360100000000, 360102000000, '330000', '0791', '东湖区', '东湖', '江西,南昌,东湖', 'DongHu', 115.899262, 28.685085);
INSERT INTO `china_region` VALUES (258103, 2, 360100000000, 360103000000, '330000', '0791', '西湖区', '西湖', '江西,南昌,西湖', 'XiHu', 115.877233, 28.657595);
INSERT INTO `china_region` VALUES (258277, 2, 360100000000, 360104000000, '330000', '0791', '青云谱区', '青云谱', '江西,南昌,青云谱', 'QingYunPu', 115.925749, 28.621169);
INSERT INTO `china_region` VALUES (258376, 2, 360100000000, 360105000000, '330000', '0791', '湾里区', '湾里', '江西,南昌,湾里', 'WanLi', 115.730847, 28.714796);
INSERT INTO `china_region` VALUES (258442, 2, 360100000000, 360111000000, '330046', '0791', '青山湖区', '青山湖', '江西,南昌,青山湖', 'QingShanHu', 115.962144, 28.682985);
INSERT INTO `china_region` VALUES (258753, 2, 360100000000, 360112000000, '330100', '0791', '新建区', '新建', '江西,南昌,新建', 'XinJian', 115.815278, 28.692864);
INSERT INTO `china_region` VALUES (259223, 2, 360100000000, 360121000000, '330200', '0791', '南昌县', '南昌', '江西,南昌', 'NanChang', 115.944304, 28.545602);
INSERT INTO `china_region` VALUES (259673, 2, 360100000000, 360123000000, '330500', '0791', '安义县', '安义', '江西,南昌,安义', 'AnYi', 115.549247, 28.844507);
INSERT INTO `china_region` VALUES (259818, 2, 360100000000, 360124000000, '331700', '0791', '进贤县', '进贤', '江西,南昌,进贤', 'JinXian', 116.26948, 28.366913);
INSERT INTO `china_region` VALUES (260175, 1, 360000000000, 360200000000, '333000', '0798', '景德镇市', '景德镇', '江西,景德镇', 'JingDeZhen', 117.178419, 29.268835);
INSERT INTO `china_region` VALUES (260176, 2, 360200000000, 360201000000, '333000', '0798', '市辖区', '景德镇', '江西,景德镇', 'JingDeZhen', 117.178419, 29.268835);
INSERT INTO `china_region` VALUES (260177, 2, 360200000000, 360202000000, '333000', '0798', '昌江区', '昌江', '江西,景德镇,昌江', 'ChangJiang', 117.183748, 29.273435);
INSERT INTO `china_region` VALUES (260271, 2, 360200000000, 360203000000, '333000', '0798', '珠山区', '珠山', '江西,景德镇,珠山', 'ZhuShan', 117.202893, 29.299923);
INSERT INTO `china_region` VALUES (260352, 2, 360200000000, 360222000000, '333400', '0798', '浮梁县', '浮梁', '江西,景德镇,浮梁', 'FuLiang', 117.215086, 29.351681);
INSERT INTO `china_region` VALUES (260566, 2, 360200000000, 360281000000, '333300', '0798', '乐平市', '乐平', '江西,景德镇,乐平', 'LePing', 117.151796, 28.97844);
INSERT INTO `china_region` VALUES (260949, 1, 360000000000, 360300000000, '337000', '0799', '萍乡市', '萍乡', '江西,萍乡', 'PingXiang', 113.854556, 27.622768);
INSERT INTO `china_region` VALUES (260950, 2, 360300000000, 360301000000, '337000', '0799', '市辖区', '萍乡', '江西,萍乡', 'PingXiang', 113.854556, 27.622768);
INSERT INTO `china_region` VALUES (260951, 2, 360300000000, 360302000000, '337000', '0799', '安源区', '安源', '江西,萍乡,安源', 'AnYuan', 113.87073, 27.615202);
INSERT INTO `china_region` VALUES (261101, 2, 360300000000, 360313000000, '337000', '0799', '湘东区', '湘东', '江西,萍乡,湘东', 'XiangDong', 113.733047, 27.640075);
INSERT INTO `china_region` VALUES (261269, 2, 360300000000, 360321000000, '337100', '0799', '莲花县', '莲花', '江西,萍乡,莲花', 'LianHua', 113.961516, 27.127658);
INSERT INTO `china_region` VALUES (261446, 2, 360300000000, 360322000000, '337000', '0799', '上栗县', '上栗', '江西,萍乡,上栗', 'ShangLi', 113.795311, 27.880302);
INSERT INTO `china_region` VALUES (261631, 2, 360300000000, 360323000000, '337000', '0799', '芦溪县', '芦溪', '江西,萍乡,芦溪', 'LuXi', 114.029828, 27.630806);
INSERT INTO `china_region` VALUES (261798, 1, 360000000000, 360400000000, '332000', '0792', '九江市', '九江', '江西,九江', 'JiuJiang', 116.00193, 29.705077);
INSERT INTO `china_region` VALUES (261799, 2, 360400000000, 360401000000, '332000', '0792', '市辖区', '九江', '江西,九江', 'JiuJiang', 116.00193, 29.705077);
INSERT INTO `china_region` VALUES (261800, 2, 360400000000, 360402000000, '332001', '0792', '濂溪区', '濂溪', '江西,九江,濂溪', 'LianXi', 115.989197, 29.671694);
INSERT INTO `china_region` VALUES (261944, 2, 360400000000, 360403000000, '332000', '0792', '浔阳区', '浔阳', '江西,九江,浔阳', 'XunYang', 115.990301, 29.727593);
INSERT INTO `china_region` VALUES (262056, 2, 360400000000, 360404000000, '332001', '0792', '柴桑区', '柴桑', '江西,九江,柴桑', 'ChaiSang', 115.911323, 29.608431);
INSERT INTO `china_region` VALUES (262221, 2, 360400000000, 360423000000, '332300', '0792', '武宁县', '武宁', '江西,九江,武宁', 'WuNing', 115.100578, 29.256323);
INSERT INTO `china_region` VALUES (262448, 2, 360400000000, 360424000000, '332400', '0792', '修水县', '修水', '江西,九江,修水', 'XiuShui', 114.546702, 29.026022);
INSERT INTO `china_region` VALUES (262895, 2, 360400000000, 360425000000, '330300', '0792', '永修县', '永修', '江西,九江,永修', 'YongXiu', 115.832453, 29.012297);
INSERT INTO `china_region` VALUES (263150, 2, 360400000000, 360426000000, '330400', '0792', '德安县', '德安', '江西,九江,德安', 'DeAn', 115.767484, 29.298738);
INSERT INTO `china_region` VALUES (263264, 2, 360400000000, 360428000000, '332600', '0792', '都昌县', '都昌', '江西,九江,都昌', 'DuChang', 116.204099, 29.273194);
INSERT INTO `china_region` VALUES (263600, 2, 360400000000, 360429000000, '332500', '0792', '湖口县', '湖口', '江西,九江,湖口', 'HuKou', 116.251947, 29.731101);
INSERT INTO `china_region` VALUES (263766, 2, 360400000000, 360430000000, '332700', '0792', '彭泽县', '彭泽', '江西,九江,彭泽', 'PengZe', 116.549359, 29.896061);
INSERT INTO `china_region` VALUES (263977, 2, 360400000000, 360481000000, '332200', '0792', '瑞昌市', '瑞昌', '江西,九江,瑞昌', 'RuiChang', 115.681337, 29.675874);
INSERT INTO `china_region` VALUES (264222, 2, 360400000000, 360482000000, '332020', '0792', '共青城市', '共青城', '江西,九江,共青城', 'GongQingCheng', 115.808844, 29.248317);
INSERT INTO `china_region` VALUES (264295, 2, 360400000000, 360483000000, '332900', '0792', '庐山市', '庐山', '江西,九江,庐山', 'LuShan', 116.04506, 29.448128);
INSERT INTO `china_region` VALUES (264410, 1, 360000000000, 360500000000, '338000', '0790', '新余市', '新余', '江西,新余', 'XinYu', 114.917346, 27.817808);
INSERT INTO `china_region` VALUES (264411, 2, 360500000000, 360501000000, '338000', '0790', '市辖区', '新余', '江西,新余', 'XinYu', 114.917346, 27.817808);
INSERT INTO `china_region` VALUES (264412, 2, 360500000000, 360502000000, '338000', '0790', '渝水区', '渝水', '江西,新余,渝水', 'YuShui', 114.944646, 27.800387);
INSERT INTO `china_region` VALUES (264768, 2, 360500000000, 360521000000, '336600', '0790', '分宜县', '分宜', '江西,新余,分宜', 'FenYi', 114.69205, 27.814758);
INSERT INTO `china_region` VALUES (264960, 1, 360000000000, 360600000000, '335000', '0701', '鹰潭市', '鹰潭', '江西,鹰潭', 'YingTan', 117.069202, 28.260189);
INSERT INTO `china_region` VALUES (264961, 2, 360600000000, 360601000000, '335000', '0701', '市辖区', '鹰潭', '江西,鹰潭', 'YingTan', 117.069202, 28.260189);
INSERT INTO `china_region` VALUES (264962, 2, 360600000000, 360602000000, '335000', '0701', '月湖区', '月湖', '江西,鹰潭,月湖', 'YueHu', 117.037137, 28.239153);
INSERT INTO `china_region` VALUES (265056, 2, 360600000000, 360603000000, '335200', '0701', '余江区', '余江', '江西,鹰潭,余江', 'YuJiang', 116.822763, 28.206177);
INSERT INTO `china_region` VALUES (265253, 2, 360600000000, 360681000000, '335400', '0701', '贵溪市', '贵溪', '江西,鹰潭,贵溪', 'GuiXi', 117.245497, 28.292519);
INSERT INTO `china_region` VALUES (265539, 1, 360000000000, 360700000000, '341000', '0797', '赣州市', '赣州', '江西,赣州', 'GanZhou', 114.935029, 25.831829);
INSERT INTO `china_region` VALUES (265540, 2, 360700000000, 360701000000, '341000', '0797', '市辖区', '赣州', '江西,赣州', 'GanZhou', 114.935029, 25.831829);
INSERT INTO `china_region` VALUES (265541, 2, 360700000000, 360702000000, '341000', '0797', '章贡区', '章贡', '江西,赣州,章贡', 'ZhangGong', 114.921171, 25.817816);
INSERT INTO `china_region` VALUES (265771, 2, 360700000000, 360703000000, '341400', '0797', '南康区', '南康', '江西,赣州,南康', 'NanKang', 114.935029, 25.831829);
INSERT INTO `china_region` VALUES (266122, 2, 360700000000, 360704000000, '341100', '0797', '赣县区', '赣县', '江西,赣州,赣县', 'GanXian', 114.935029, 25.831829);
INSERT INTO `china_region` VALUES (266444, 2, 360700000000, 360722000000, '341600', '0797', '信丰县', '信丰', '江西,赣州,信丰', 'XinFeng', 114.92283, 25.386704);
INSERT INTO `china_region` VALUES (266768, 2, 360700000000, 360723000000, '341500', '0797', '大余县', '大余', '江西,赣州,大余', 'DaYu', 114.362112, 25.401314);
INSERT INTO `china_region` VALUES (266901, 2, 360700000000, 360724000000, '341200', '0797', '上犹县', '上犹', '江西,赣州,上犹', 'ShangYou', 114.551138, 25.785172);
INSERT INTO `china_region` VALUES (267065, 2, 360700000000, 360725000000, '341300', '0797', '崇义县', '崇义', '江西,赣州,崇义', 'ChongYi', 114.308267, 25.681784);
INSERT INTO `china_region` VALUES (267216, 2, 360700000000, 360726000000, '342100', '0797', '安远县', '安远', '江西,赣州,安远', 'AnYuan', 115.393922, 25.136927);
INSERT INTO `china_region` VALUES (267404, 2, 360700000000, 360727000000, '341700', '0797', '龙南县', '龙南', '江西,赣州,龙南', 'LongNan', 114.789873, 24.911069);
INSERT INTO `china_region` VALUES (267529, 2, 360700000000, 360728000000, '341900', '0797', '定南县', '定南', '江西,赣州,定南', 'DingNan', 115.027845, 24.78441);
INSERT INTO `china_region` VALUES (267676, 2, 360700000000, 360729000000, '341800', '0797', '全南县', '全南', '江西,赣州,全南', 'QuanNan', 114.530125, 24.742403);
INSERT INTO `china_region` VALUES (267784, 2, 360700000000, 360730000000, '342800', '0797', '宁都县', '宁都', '江西,赣州,宁都', 'NingDu', 116.013621, 26.470996);
INSERT INTO `china_region` VALUES (268145, 2, 360700000000, 360731000000, '342300', '0797', '于都县', '于都', '江西,赣州,于都', 'YuDu', 115.415508, 25.952069);
INSERT INTO `china_region` VALUES (268562, 2, 360700000000, 360732000000, '342400', '0797', '兴国县', '兴国', '江西,赣州,兴国', 'XingGuo', 115.36319, 26.337937);
INSERT INTO `china_region` VALUES (268907, 2, 360700000000, 360733000000, '342600', '0797', '会昌县', '会昌', '江西,赣州,会昌', 'HuiChang', 115.786057, 25.600272);
INSERT INTO `china_region` VALUES (269204, 2, 360700000000, 360734000000, '342200', '0797', '寻乌县', '寻乌', '江西,赣州,寻乌', 'XunWu', 115.646636, 24.963371);
INSERT INTO `china_region` VALUES (269404, 2, 360700000000, 360735000000, '342700', '0797', '石城县', '石城', '江西,赣州,石城', 'ShiCheng', 116.346995, 26.314775);
INSERT INTO `china_region` VALUES (269571, 2, 360700000000, 360781000000, '342500', '0797', '瑞金市', '瑞金', '江西,赣州,瑞金', 'RuiJin', 116.027135, 25.885555);
INSERT INTO `china_region` VALUES (269831, 1, 360000000000, 360800000000, '343000', '0796', '吉安市', '吉安', '江西,吉安', 'JiAn', 114.992509, 27.113443);
INSERT INTO `china_region` VALUES (269832, 2, 360800000000, 360801000000, '343000', '0796', '市辖区', '吉安', '江西,吉安', 'JiAn', 114.992509, 27.113443);
INSERT INTO `china_region` VALUES (269833, 2, 360800000000, 360802000000, '343000', '0796', '吉州区', '吉州', '江西,吉安,吉州', 'JiZhou', 114.994764, 27.143801);
INSERT INTO `china_region` VALUES (269981, 2, 360800000000, 360803000000, '343000', '0796', '青原区', '青原', '江西,吉安,青原', 'QingYuan', 115.014812, 27.081977);
INSERT INTO `china_region` VALUES (270126, 2, 360800000000, 360821000000, '343100', '0796', '吉安县', '吉安', '江西,吉安', 'JiAn', 114.907733, 27.03989);
INSERT INTO `china_region` VALUES (270501, 2, 360800000000, 360822000000, '331600', '0796', '吉水县', '吉水', '江西,吉安,吉水', 'JiShui', 115.135507, 27.229632);
INSERT INTO `china_region` VALUES (270805, 2, 360800000000, 360823000000, '331400', '0796', '峡江县', '峡江', '江西,吉安,峡江', 'XiaJiang', 115.316566, 27.582901);
INSERT INTO `china_region` VALUES (270911, 2, 360800000000, 360824000000, '331300', '0796', '新干县', '新干', '江西,吉安,新干', 'XinGan', 115.387052, 27.740192);
INSERT INTO `china_region` VALUES (271094, 2, 360800000000, 360825000000, '331500', '0796', '永丰县', '永丰', '江西,吉安,永丰', 'YongFeng', 115.44432, 27.318852);
INSERT INTO `china_region` VALUES (271364, 2, 360800000000, 360826000000, '343700', '0796', '泰和县', '泰和', '江西,吉安,泰和', 'TaiHe', 114.908869, 26.78996);
INSERT INTO `china_region` VALUES (271739, 2, 360800000000, 360827000000, '343900', '0796', '遂川县', '遂川', '江西,吉安,遂川', 'SuiChuan', 114.520537, 26.313737);
INSERT INTO `china_region` VALUES (272111, 2, 360800000000, 360828000000, '343800', '0796', '万安县', '万安', '江西,吉安,万安', 'WanAn', 114.786182, 26.458254);
INSERT INTO `china_region` VALUES (272288, 2, 360800000000, 360829000000, '343200', '0796', '安福县', '安福', '江西,吉安,安福', 'AnFu', 114.619893, 27.392874);
INSERT INTO `china_region` VALUES (272584, 2, 360800000000, 360830000000, '343400', '0796', '永新县', '永新', '江西,吉安,永新', 'YongXin', 114.243096, 26.945002);
INSERT INTO `china_region` VALUES (272878, 2, 360800000000, 360881000000, '343600', '0796', '井冈山市', '井冈山', '江西,吉安,井冈山', 'JingGangShan', 114.289228, 26.748081);
INSERT INTO `china_region` VALUES (273036, 1, 360000000000, 360900000000, '336000', '0795', '宜春市', '宜春', '江西,宜春', 'YiChun', 114.416778, 27.815619);
INSERT INTO `china_region` VALUES (273037, 2, 360900000000, 360901000000, '336000', '0795', '市辖区', '宜春', '江西,宜春', 'YiChun', 114.416778, 27.815619);
INSERT INTO `china_region` VALUES (273038, 2, 360900000000, 360902000000, '336000', '0795', '袁州区', '袁州', '江西,宜春,袁州', 'YuanZhou', 114.424657, 27.798846);
INSERT INTO `china_region` VALUES (273462, 2, 360900000000, 360921000000, '330700', '0795', '奉新县', '奉新', '江西,宜春,奉新', 'FengXin', 115.400491, 28.688423);
INSERT INTO `china_region` VALUES (273679, 2, 360900000000, 360922000000, '336100', '0795', '万载县', '万载', '江西,宜春,万载', 'WanZai', 114.445523, 28.106004);
INSERT INTO `china_region` VALUES (273906, 2, 360900000000, 360923000000, '336400', '0795', '上高县', '上高', '江西,宜春,上高', 'ShangGao', 114.947831, 28.238876);
INSERT INTO `china_region` VALUES (274151, 2, 360900000000, 360924000000, '336300', '0795', '宜丰县', '宜丰', '江西,宜春,宜丰', 'YiFeng', 114.803515, 28.393666);
INSERT INTO `china_region` VALUES (274415, 2, 360900000000, 360925000000, '330600', '0795', '靖安县', '靖安', '江西,宜春,靖安', 'JingAn', 115.362629, 28.861479);
INSERT INTO `china_region` VALUES (274536, 2, 360900000000, 360926000000, '336200', '0795', '铜鼓县', '铜鼓', '江西,宜春,铜鼓', 'TongGu', 114.371172, 28.52077);
INSERT INTO `china_region` VALUES (274662, 2, 360900000000, 360981000000, '331100', '0795', '丰城市', '丰城', '江西,宜春,丰城', 'FengCheng', 115.771094, 28.159142);
INSERT INTO `china_region` VALUES (275304, 2, 360900000000, 360982000000, '331200', '0795', '樟树市', '樟树', '江西,宜春,樟树', 'ZhangShu', 115.546385, 28.054814);
INSERT INTO `china_region` VALUES (275633, 2, 360900000000, 360983000000, '330800', '0795', '高安市', '高安', '江西,宜春,高安', 'GaoAn', 115.375616, 28.417255);
INSERT INTO `china_region` VALUES (276040, 1, 360000000000, 361000000000, '344000', '0794', '抚州市', '抚州', '江西,抚州', 'FuZhou', 116.358181, 27.949217);
INSERT INTO `china_region` VALUES (276041, 2, 361000000000, 361001000000, '344000', '0794', '市辖区', '抚州', '江西,抚州', 'FuZhou', 116.358181, 27.949217);
INSERT INTO `china_region` VALUES (276042, 2, 361000000000, 361002000000, '344100', '0794', '临川区', '临川', '江西,抚州,临川', 'LinChuan', 116.371066, 27.970596);
INSERT INTO `china_region` VALUES (276584, 2, 361000000000, 361003000000, '344000', '0794', '东乡区', '东乡区', '江西,抚州', 'DongXiangQu', 115.909228, 28.675696);
INSERT INTO `china_region` VALUES (276786, 2, 361000000000, 361021000000, '344700', '0794', '南城县', '南城', '江西,抚州,南城', 'NanCheng', 116.63704, 27.569678);
INSERT INTO `china_region` VALUES (276974, 2, 361000000000, 361022000000, '344600', '0794', '黎川县', '黎川', '江西,抚州,黎川', 'LiChuan', 116.907681, 27.282333);
INSERT INTO `china_region` VALUES (277133, 2, 361000000000, 361023000000, '344500', '0794', '南丰县', '南丰', '江西,抚州,南丰', 'NanFeng', 116.525725, 27.218445);
INSERT INTO `china_region` VALUES (277335, 2, 361000000000, 361024000000, '344200', '0794', '崇仁县', '崇仁', '江西,抚州,崇仁', 'ChongRen', 116.061101, 27.764394);
INSERT INTO `china_region` VALUES (277522, 2, 361000000000, 361025000000, '344300', '0794', '乐安县', '乐安', '江西,抚州,乐安', 'LeAn', 115.830481, 27.428765);
INSERT INTO `china_region` VALUES (277732, 2, 361000000000, 361026000000, '344400', '0794', '宜黄县', '宜黄', '江西,抚州,宜黄', 'YiHuang', 116.222128, 27.546146);
INSERT INTO `china_region` VALUES (277903, 2, 361000000000, 361027000000, '344800', '0794', '金溪县', '金溪', '江西,抚州,金溪', 'JinXi', 116.755058, 27.918959);
INSERT INTO `china_region` VALUES (278090, 2, 361000000000, 361028000000, '335300', '0794', '资溪县', '资溪', '江西,抚州,资溪', 'ZiXi', 117.060264, 27.706102);
INSERT INTO `china_region` VALUES (278181, 2, 361000000000, 361030000000, '344900', '0794', '广昌县', '广昌', '江西,抚州,广昌', 'GuangChang', 116.325757, 26.837267);
INSERT INTO `china_region` VALUES (278340, 1, 360000000000, 361100000000, '334000', '0793', '上饶市', '上饶', '江西,上饶', 'ShangRao', 117.943433, 28.454862);
INSERT INTO `china_region` VALUES (278341, 2, 361100000000, 361101000000, '334000', '0793', '市辖区', '上饶', '江西,上饶', 'ShangRao', 117.943433, 28.454862);
INSERT INTO `china_region` VALUES (278342, 2, 361100000000, 361102000000, '334000', '0793', '信州区', '信州', '江西,上饶,信州', 'XinZhou', 117.96646, 28.431002);
INSERT INTO `china_region` VALUES (278483, 2, 361100000000, 361103000000, '334099', '0793', '广丰区', '广丰', '江西,上饶,广丰', 'GuangFeng', 118.19124, 28.436286);
INSERT INTO `china_region` VALUES (278747, 2, 361100000000, 361104000000, '334099', '0793', '广信区', '广信', '江西,上饶,广信', 'GuangXin', 117.943433, 28.454862);
INSERT INTO `china_region` VALUES (279032, 2, 361100000000, 361123000000, '334700', '0793', '玉山县', '玉山', '江西,上饶,玉山', 'YuShan', 118.245124, 28.682055);
INSERT INTO `china_region` VALUES (279290, 2, 361100000000, 361124000000, '334500', '0793', '铅山县', '铅山', '江西,上饶,铅山', 'YanShan', 117.709451, 28.315217);
INSERT INTO `china_region` VALUES (279494, 2, 361100000000, 361125000000, '334300', '0793', '横峰县', '横峰', '江西,上饶,横峰', 'HengFeng', 117.596452, 28.407118);
INSERT INTO `china_region` VALUES (279589, 2, 361100000000, 361126000000, '334400', '0793', '弋阳县', '弋阳', '江西,上饶,弋阳', 'YiYang', 117.449588, 28.378044);
INSERT INTO `china_region` VALUES (279764, 2, 361100000000, 361127000000, '335100', '0793', '余干县', '余干', '江西,上饶,余干', 'YuGan', 116.695647, 28.702302);
INSERT INTO `china_region` VALUES (280235, 2, 361100000000, 361128000000, '333100', '0793', '鄱阳县', '鄱阳', '江西,上饶,鄱阳', 'PoYang', 116.699746, 29.011699);
INSERT INTO `china_region` VALUES (280848, 2, 361100000000, 361129000000, '335500', '0793', '万年县', '万年', '江西,上饶,万年', 'WanNian', 117.058445, 28.694582);
INSERT INTO `china_region` VALUES (281024, 2, 361100000000, 361130000000, '333200', '0793', '婺源县', '婺源', '江西,上饶,婺源', 'WuYuan', 117.861798, 29.248086);
INSERT INTO `china_region` VALUES (281248, 2, 361100000000, 361181000000, '334200', '0793', '德兴市', '德兴', '江西,上饶,德兴', 'DeXing', 117.578713, 28.946464);
INSERT INTO `china_region` VALUES (281410, 0, 0, 370000000000, '0', NULL, '山东省', '山东', '山东', 'ShanDong', 117.020359, 36.66853);
INSERT INTO `china_region` VALUES (281411, 1, 370000000000, 370100000000, '250000', '0531', '济南市', '济南', '山东,济南', 'JiNan', 117.119999, 36.651216);
INSERT INTO `china_region` VALUES (281412, 2, 370100000000, 370101000000, '250000', '0531', '市辖区', '济南', '山东,济南', 'JiNan', 117.119999, 36.651216);
INSERT INTO `china_region` VALUES (281413, 2, 370100000000, 370102000000, '250000', '0531', '历下区', '历下', '山东,济南,历下', 'LiXia', 117.076455, 36.666412);
INSERT INTO `china_region` VALUES (281547, 2, 370100000000, 370103000000, '250000', '0531', '市中区', '市中', '山东,济南,市中', 'ShiZhong', 116.997777, 36.651474);
INSERT INTO `china_region` VALUES (281770, 2, 370100000000, 370104000000, '250000', '0531', '槐荫区', '槐荫', '山东,济南,槐荫', 'HuaiYin', 116.901224, 36.651441);
INSERT INTO `china_region` VALUES (281974, 2, 370100000000, 370105000000, '250000', '0531', '天桥区', '天桥', '山东,济南,天桥', 'TianQiao', 116.987492, 36.678016);
INSERT INTO `china_region` VALUES (282253, 2, 370100000000, 370112000000, '250100', '0531', '历城区', '历城', '山东,济南,历城', 'LiCheng', 117.065237, 36.680017);
INSERT INTO `china_region` VALUES (282872, 2, 370100000000, 370113000000, '250300', '0531', '长清区', '长清', '山东,济南,长清', 'ChangQing', 116.751937, 36.553571);
INSERT INTO `china_region` VALUES (283522, 2, 370100000000, 370114000000, '250209', '0531', '章丘区', '章丘', '山东,济南,章丘', 'ZhangQiu', 117.526228, 36.681259);
INSERT INTO `china_region` VALUES (284468, 2, 370100000000, 370115000000, '251400', '0531', '济阳区', '济阳', '山东,济南,济阳', 'JiYang', 117.173525, 36.978537);
INSERT INTO `china_region` VALUES (285337, 2, 370100000000, 370116000000, '271100', '0531', '莱芜区', '莱芜', '山东,济南,莱芜', 'LaiWu', 117.119999, 36.651216);
INSERT INTO `china_region` VALUES (286193, 2, 370100000000, 370117000000, '271100', '0531', '钢城区', '钢城', '山东,济南,钢城', 'GangCheng', 117.119999, 36.651216);
INSERT INTO `china_region` VALUES (286436, 2, 370100000000, 370124000000, '250400', '0531', '平阴县', '平阴', '山东,济南,平阴', 'PingYin', 116.456187, 36.289265);
INSERT INTO `china_region` VALUES (286802, 2, 370100000000, 370126000000, '251600', '0531', '商河县', '商河', '山东,济南,商河', 'ShangHe', 117.157207, 37.30905);
INSERT INTO `china_region` VALUES (287778, 2, 370100000000, 370171000000, '250011', '0531', '济南高新技术产业开发区', '济南高', '山东,济南,济南高', 'JiNanGao', 117.119999, 36.651216);
INSERT INTO `china_region` VALUES (287978, 1, 370000000000, 370200000000, '266000', '0532', '青岛市', '青岛', '山东,青岛', 'QingDao', 120.382639, 36.067082);
INSERT INTO `china_region` VALUES (287979, 2, 370200000000, 370201000000, '266000', '0532', '市辖区', '青岛', '山东,青岛', 'QingDao', 120.382639, 36.067082);
INSERT INTO `china_region` VALUES (287980, 2, 370200000000, 370202000000, '266000', '0532', '市南区', '市南', '山东,青岛,市南', 'ShiNan', 120.385649, 36.080305);
INSERT INTO `china_region` VALUES (288042, 2, 370200000000, 370203000000, '266000', '0532', '市北区', '市北', '山东,青岛,市北', 'ShiBei', 120.374731, 36.087609);
INSERT INTO `china_region` VALUES (288202, 2, 370200000000, 370211000000, '266000', '0532', '黄岛区', '黄岛', '山东,青岛,黄岛', 'HuangDao', 120.04619, 35.872664);
INSERT INTO `china_region` VALUES (289459, 2, 370200000000, 370212000000, '266100', '0532', '崂山区', '崂山', '山东,青岛,崂山', 'LaoShan', 120.468956, 36.107538);
INSERT INTO `china_region` VALUES (289627, 2, 370200000000, 370213000000, '266000', '0532', '李沧区', '李沧', '山东,青岛,李沧', 'LiCang', 120.432697, 36.145463);
INSERT INTO `china_region` VALUES (289755, 2, 370200000000, 370214000000, '266000', '0532', '城阳区', '城阳', '山东,青岛,城阳', 'ChengYang', 120.39631, 36.307064);
INSERT INTO `china_region` VALUES (289990, 2, 370200000000, 370215000000, '266221', '0532', '即墨区', '即墨', '山东,青岛,即墨', 'JiMo', 120.447128, 36.389639);
INSERT INTO `china_region` VALUES (291116, 2, 370200000000, 370271000000, '266012', '0532', '青岛高新技术产业开发区', '青岛高', '山东,青岛,青岛高', 'QingDaoGao', 120.317449, 36.298712);
INSERT INTO `china_region` VALUES (291156, 2, 370200000000, 370281000000, '266300', '0532', '胶州市', '胶州', '山东,青岛,胶州', 'JiaoZhou', 120.033382, 36.26468);
INSERT INTO `china_region` VALUES (292072, 2, 370200000000, 370283000000, '266700', '0532', '平度市', '平度', '山东,青岛,平度', 'PingDu', 119.988454, 36.776875);
INSERT INTO `china_region` VALUES (293947, 2, 370200000000, 370285000000, '266600', '0532', '莱西市', '莱西', '山东,青岛,莱西', 'LaiXi', 120.51769, 36.889084);
INSERT INTO `china_region` VALUES (294856, 1, 370000000000, 370300000000, '255000', '0533', '淄博市', '淄博', '山东,淄博', 'ZiBo', 118.054927, 36.813487);
INSERT INTO `china_region` VALUES (294857, 2, 370300000000, 370301000000, '255000', '0533', '市辖区', '淄博', '山东,淄博', 'ZiBo', 118.054927, 36.813487);
INSERT INTO `china_region` VALUES (294858, 2, 370300000000, 370302000000, '255100', '0533', '淄川区', '淄川', '山东,淄博,淄川', 'ZiChuan', 117.966723, 36.643452);
INSERT INTO `china_region` VALUES (295342, 2, 370300000000, 370303000000, '255000', '0533', '张店区', '张店', '山东,淄博,张店', 'ZhangDian', 118.017913, 36.806674);
INSERT INTO `china_region` VALUES (295662, 2, 370300000000, 370304000000, '255200', '0533', '博山区', '博山', '山东,淄博,博山', 'BoShan', 117.861677, 36.494721);
INSERT INTO `china_region` VALUES (295971, 2, 370300000000, 370305000000, '255400', '0533', '临淄区', '临淄', '山东,淄博,临淄', 'LinZi', 118.309118, 36.826981);
INSERT INTO `china_region` VALUES (296457, 2, 370300000000, 370306000000, '255300', '0533', '周村区', '周村', '山东,淄博,周村', 'ZhouCun', 117.869886, 36.803072);
INSERT INTO `china_region` VALUES (296724, 2, 370300000000, 370321000000, '256400', '0533', '桓台县', '桓台', '山东,淄博,桓台', 'HuanTai', 118.097923, 36.959804);
INSERT INTO `china_region` VALUES (297084, 2, 370300000000, 370322000000, '256300', '0533', '高青县', '高青', '山东,淄博,高青', 'GaoQing', 117.826916, 37.171063);
INSERT INTO `china_region` VALUES (297412, 2, 370300000000, 370323000000, '256100', '0533', '沂源县', '沂源', '山东,淄博,沂源', 'YiYuan', 118.170856, 36.185038);
INSERT INTO `china_region` VALUES (298068, 1, 370000000000, 370400000000, '277000', '0632', '枣庄市', '枣庄', '山东,枣庄', 'ZaoZhuang', 117.323725, 34.810487);
INSERT INTO `china_region` VALUES (298069, 2, 370400000000, 370401000000, '277000', '0632', '市辖区', '枣庄', '山东,枣庄', 'ZaoZhuang', 117.323725, 34.810487);
INSERT INTO `china_region` VALUES (298070, 2, 370400000000, 370402000000, '277000', '0632', '市中区', '市中', '山东,枣庄,市中', 'ShiZhong', 117.556123, 34.864114);
INSERT INTO `china_region` VALUES (298252, 2, 370400000000, 370403000000, '277000', '0632', '薛城区', '薛城', '山东,枣庄,薛城', 'XueCheng', 117.263164, 34.795063);
INSERT INTO `china_region` VALUES (298549, 2, 370400000000, 370404000000, '277300', '0632', '峄城区', '峄城', '山东,枣庄,峄城', 'YiCheng', 117.590816, 34.773263);
INSERT INTO `china_region` VALUES (298894, 2, 370400000000, 370405000000, '277400', '0632', '台儿庄区', '台儿庄', '山东,枣庄,台儿庄', 'TaiErZhuang', 117.733832, 34.562528);
INSERT INTO `china_region` VALUES (299112, 2, 370400000000, 370406000000, '277200', '0632', '山亭区', '山亭', '山东,枣庄,山亭', 'ShanTing', 117.461517, 35.099528);
INSERT INTO `china_region` VALUES (299400, 2, 370400000000, 370481000000, '277599', '0632', '滕州市', '滕州', '山东,枣庄,滕州', 'TengZhou', 117.165824, 35.114156);
INSERT INTO `china_region` VALUES (300672, 1, 370000000000, 370500000000, '257000', '0546', '东营市', '东营', '山东,东营', 'DongYing', 118.674767, 37.434751);
INSERT INTO `china_region` VALUES (300673, 2, 370500000000, 370501000000, '257000', '0546', '市辖区', '东营', '山东,东营', 'DongYing', 118.674767, 37.434751);
INSERT INTO `china_region` VALUES (300674, 2, 370500000000, 370502000000, '257100', '0546', '东营区', '东营', '山东,东营', 'DongYing', 118.582184, 37.448963);
INSERT INTO `china_region` VALUES (301079, 2, 370500000000, 370503000000, '257200', '0546', '河口区', '河口', '山东,东营,河口', 'HeKou', 118.525543, 37.886162);
INSERT INTO `china_region` VALUES (301282, 2, 370500000000, 370505000000, '257500', '0546', '垦利区', '垦利', '山东,东营,垦利', 'KenLi', 118.674767, 37.434751);
INSERT INTO `china_region` VALUES (301653, 2, 370500000000, 370522000000, '257400', '0546', '利津县', '利津', '山东,东营,利津', 'LiJin', 118.255273, 37.49026);
INSERT INTO `china_region` VALUES (302192, 2, 370500000000, 370523000000, '257300', '0546', '广饶县', '广饶', '山东,东营,广饶', 'GuangRao', 118.407107, 37.053555);
INSERT INTO `china_region` VALUES (302784, 2, 370500000000, 370571000000, '257503', '0546', '东营经济技术开发区', '东营经开区', '山东,东营,东营经开区', 'DongYingJingKaiQu', 118.582184, 37.448963);
INSERT INTO `china_region` VALUES (302792, 2, 370500000000, 370572000000, '257100', '0546', '东营港经济开发区', '东营港经开区', '山东,东营,东营港经开区', 'DongYingGangJingKaiQu', 118.878014, 38.053115);
INSERT INTO `china_region` VALUES (302796, 1, 370000000000, 370600000000, '264000', '0535', '烟台市', '烟台', '山东,烟台', 'YanTai', 121.447935, 37.463822);
INSERT INTO `china_region` VALUES (302797, 2, 370600000000, 370601000000, '264000', '0535', '市辖区', '烟台', '山东,烟台', 'YanTai', 121.447935, 37.463822);
INSERT INTO `china_region` VALUES (302798, 2, 370600000000, 370602000000, '264000', '0535', '芝罘区', '芝罘', '山东,烟台,芝罘', 'ZhiFu', 121.400031, 37.540687);
INSERT INTO `china_region` VALUES (302959, 2, 370600000000, 370611000000, '265500', '0535', '福山区', '福山', '山东,烟台,福山', 'FuShan', 121.267741, 37.498246);
INSERT INTO `china_region` VALUES (303221, 2, 370600000000, 370612000000, '264100', '0535', '牟平区', '牟平', '山东,烟台,牟平', 'MuPing', 121.600512, 37.386901);
INSERT INTO `china_region` VALUES (303826, 2, 370600000000, 370613000000, '264000', '0535', '莱山区', '莱山', '山东,烟台,莱山', 'LaiShan', 121.445151, 37.511361);
INSERT INTO `china_region` VALUES (303959, 2, 370600000000, 370634000000, '265800', '0535', '长岛县', '长岛', '山东,烟台,长岛', 'ChangDao', 120.73658, 37.921368);
INSERT INTO `china_region` VALUES (304008, 2, 370600000000, 370671000000, '265703', '0535', '烟台高新技术产业开发区', '烟台高', '山东,烟台,烟台高', 'YanTaiGao', 121.447935, 37.463822);
INSERT INTO `china_region` VALUES (304031, 2, 370600000000, 370672000000, '264005', '0535', '烟台经济技术开发区', '烟台经开区', '山东,烟台,烟台经开区', 'YanTaiJingKaiQu', 121.269383, 37.566517);
INSERT INTO `china_region` VALUES (304169, 2, 370600000000, 370681000000, '265700', '0535', '龙口市', '龙口', '山东,烟台,龙口', 'LongKou', 120.477813, 37.646108);
INSERT INTO `china_region` VALUES (304779, 2, 370600000000, 370682000000, '265200', '0535', '莱阳市', '莱阳', '山东,烟台,莱阳', 'LaiYang', 120.711673, 36.978941);
INSERT INTO `china_region` VALUES (305592, 2, 370600000000, 370683000000, '261400', '0535', '莱州市', '莱州', '山东,烟台,莱州', 'LaiZhou', 119.942327, 37.177017);
INSERT INTO `china_region` VALUES (306624, 2, 370600000000, 370684000000, '265600', '0535', '蓬莱市', '蓬莱', '山东,烟台,蓬莱', 'PengLai', 120.758848, 37.810661);
INSERT INTO `china_region` VALUES (307225, 2, 370600000000, 370685000000, '265400', '0535', '招远市', '招远', '山东,烟台,招远', 'ZhaoYuan', 120.434072, 37.355469);
INSERT INTO `china_region` VALUES (307986, 2, 370600000000, 370686000000, '265300', '0535', '栖霞市', '栖霞', '山东,烟台,栖霞', 'QiXia', 120.849675, 37.335123);
INSERT INTO `china_region` VALUES (308956, 2, 370600000000, 370687000000, '265100', '0535', '海阳市', '海阳', '山东,烟台,海阳', 'HaiYang', 121.158434, 36.776378);
INSERT INTO `china_region` VALUES (309707, 1, 370000000000, 370700000000, '261000', '0536', '潍坊市', '潍坊', '山东,潍坊', 'WeiFang', 119.161755, 36.706774);
INSERT INTO `china_region` VALUES (309708, 2, 370700000000, 370701000000, '261000', '0536', '市辖区', '潍坊', '山东,潍坊', 'WeiFang', 119.161755, 36.706774);
INSERT INTO `china_region` VALUES (309709, 2, 370700000000, 370702000000, '261000', '0536', '潍城区', '潍城', '山东,潍坊,潍城', 'WeiCheng', 119.024836, 36.7281);
INSERT INTO `china_region` VALUES (309972, 2, 370700000000, 370703000000, '261100', '0536', '寒亭区', '寒亭', '山东,潍坊,寒亭', 'HanTing', 119.219734, 36.775491);
INSERT INTO `china_region` VALUES (310351, 2, 370700000000, 370704000000, '261200', '0536', '坊子区', '坊子', '山东,潍坊,坊子', 'FangZi', 119.166485, 36.654448);
INSERT INTO `china_region` VALUES (310938, 2, 370700000000, 370705000000, '261000', '0536', '奎文区', '奎文', '山东,潍坊,奎文', 'KuiWen', 119.132486, 36.707676);
INSERT INTO `china_region` VALUES (311178, 2, 370700000000, 370724000000, '262600', '0536', '临朐县', '临朐', '山东,潍坊,临朐', 'LinQu', 118.542982, 36.512506);
INSERT INTO `china_region` VALUES (311539, 2, 370700000000, 370725000000, '262400', '0536', '昌乐县', '昌乐', '山东,潍坊,昌乐', 'ChangLe', 118.829996, 36.706938);
INSERT INTO `china_region` VALUES (311918, 2, 370700000000, 370772000000, '262737', '0536', '潍坊滨海经济技术开发区', '潍坊滨海经开区', '山东,潍坊,潍坊滨海经开区', 'WeiFangBinHaiJingKaiQu', 118.994423, 37.116289);
INSERT INTO `china_region` VALUES (311971, 2, 370700000000, 370781000000, '262500', '0536', '青州市', '青州', '山东,潍坊,青州', 'QingZhou', 118.479636, 36.6846);
INSERT INTO `china_region` VALUES (313063, 2, 370700000000, 370782000000, '262200', '0536', '诸城市', '诸城', '山东,潍坊,诸城', 'ZhuCheng', 119.410103, 35.995654);
INSERT INTO `china_region` VALUES (313335, 2, 370700000000, 370783000000, '262700', '0536', '寿光市', '寿光', '山东,潍坊,寿光', 'ShouGuang', 118.790652, 36.85548);
INSERT INTO `china_region` VALUES (314363, 2, 370700000000, 370784000000, '262100', '0536', '安丘市', '安丘', '山东,潍坊,安丘', 'AnQiu', 119.218843, 36.478494);
INSERT INTO `china_region` VALUES (315242, 2, 370700000000, 370785000000, '261500', '0536', '高密市', '高密', '山东,潍坊,高密', 'GaoMi', 119.755597, 36.382595);
INSERT INTO `china_region` VALUES (316201, 2, 370700000000, 370786000000, '261300', '0536', '昌邑市', '昌邑', '山东,潍坊,昌邑', 'ChangYi', 119.398525, 36.85882);
INSERT INTO `china_region` VALUES (316902, 1, 370000000000, 370800000000, '272000', '0537', '济宁市', '济宁', '山东,济宁', 'JiNing', 116.587098, 35.414921);
INSERT INTO `china_region` VALUES (316903, 2, 370800000000, 370801000000, '272000', '0537', '市辖区', '济宁', '山东,济宁', 'JiNing', 116.587098, 35.414921);
INSERT INTO `china_region` VALUES (316904, 2, 370800000000, 370811000000, '272000', '0537', '任城区', '任城', '山东,济宁,任城', 'RenCheng', 116.59505, 35.406596);
INSERT INTO `china_region` VALUES (317517, 2, 370800000000, 370812000000, '272106', '0537', '兖州区', '兖州', '山东,济宁,兖州', 'YanZhou', 116.783834, 35.553144);
INSERT INTO `china_region` VALUES (317971, 2, 370800000000, 370826000000, '277600', '0537', '微山县', '微山', '山东,济宁,微山', 'WeiShan', 117.128828, 34.806554);
INSERT INTO `china_region` VALUES (318529, 2, 370800000000, 370827000000, '272300', '0537', '鱼台县', '鱼台', '山东,济宁,鱼台', 'YuTai', 116.650608, 35.012749);
INSERT INTO `china_region` VALUES (318934, 2, 370800000000, 370828000000, '272200', '0537', '金乡县', '金乡', '山东,济宁,金乡', 'JinXiang', 116.311532, 35.06662);
INSERT INTO `china_region` VALUES (319595, 2, 370800000000, 370829000000, '272400', '0537', '嘉祥县', '嘉祥', '山东,济宁,嘉祥', 'JiaXiang', 116.342442, 35.407829);
INSERT INTO `china_region` VALUES (320300, 2, 370800000000, 370830000000, '272500', '0537', '汶上县', '汶上', '山东,济宁,汶上', 'WenShang', 116.489043, 35.732799);
INSERT INTO `china_region` VALUES (320818, 2, 370800000000, 370831000000, '273200', '0537', '泗水县', '泗水', '山东,济宁,泗水', 'SiShui', 117.251195, 35.664323);
INSERT INTO `china_region` VALUES (321428, 2, 370800000000, 370832000000, '272600', '0537', '梁山县', '梁山', '山东,济宁,梁山', 'LiangShan', 116.096044, 35.802306);
INSERT INTO `china_region` VALUES (322078, 2, 370800000000, 370871000000, '273507', '0537', '济宁高新技术产业开发区', '济宁高', '山东,济宁,济宁高', 'JiNingGao', 116.660909, 35.410549);
INSERT INTO `china_region` VALUES (322275, 2, 370800000000, 370881000000, '273100', '0537', '曲阜市', '曲阜', '山东,济宁,曲阜', 'QuFu', 116.986503, 35.580996);
INSERT INTO `china_region` VALUES (322746, 2, 370800000000, 370883000000, '273500', '0537', '邹城市', '邹城', '山东,济宁,邹城', 'ZouCheng', 117.003743, 35.405185);
INSERT INTO `china_region` VALUES (323663, 1, 370000000000, 370900000000, '271000', '0538', '泰安市', '泰安', '山东,泰安', 'TaiAn', 117.087614, 36.200252);
INSERT INTO `china_region` VALUES (323664, 2, 370900000000, 370901000000, '271000', '0538', '市辖区', '泰安', '山东,泰安', 'TaiAn', 117.087614, 36.200252);
INSERT INTO `china_region` VALUES (323665, 2, 370900000000, 370902000000, '271000', '0538', '泰山区', '泰山', '山东,泰安,泰山', 'TaiShan', 117.135354, 36.192084);
INSERT INTO `china_region` VALUES (323883, 2, 370900000000, 370911000000, '271000', '0538', '岱岳区', '岱岳', '山东,泰安,岱岳', 'DaiYue', 117.041582, 36.18799);
INSERT INTO `china_region` VALUES (324612, 2, 370900000000, 370921000000, '271400', '0538', '宁阳县', '宁阳', '山东,泰安,宁阳', 'NingYang', 116.805797, 35.758787);
INSERT INTO `china_region` VALUES (325188, 2, 370900000000, 370923000000, '271500', '0538', '东平县', '东平', '山东,泰安,东平', 'DongPing', 116.470304, 35.937102);
INSERT INTO `china_region` VALUES (325919, 2, 370900000000, 370982000000, '271200', '0538', '新泰市', '新泰', '山东,泰安,新泰', 'XinTai', 117.767953, 35.909032);
INSERT INTO `china_region` VALUES (326854, 2, 370900000000, 370983000000, '271600', '0538', '肥城市', '肥城', '山东,泰安,肥城', 'FeiCheng', 116.768358, 36.182572);
INSERT INTO `china_region` VALUES (327502, 1, 370000000000, 371000000000, '264200', '0631', '威海市', '威海', '山东,威海', 'WeiHai', 122.120419, 37.513068);
INSERT INTO `china_region` VALUES (327503, 2, 371000000000, 371001000000, '264200', '0631', '市辖区', '威海', '山东,威海', 'WeiHai', 122.120419, 37.513068);
INSERT INTO `china_region` VALUES (327504, 2, 371000000000, 371002000000, '264200', '0631', '环翠区', '环翠', '山东,威海,环翠', 'HuanCui', 122.123444, 37.501991);
INSERT INTO `china_region` VALUES (327679, 2, 371000000000, 371003000000, '264400', '0631', '文登区', '文登', '山东,威海,文登', 'WenDeng', 122.057941, 37.193886);
INSERT INTO `china_region` VALUES (328467, 2, 371000000000, 371071000000, '264203', '0631', '威海火炬高技术产业开发区', '威海火炬高', '山东,威海,威海火炬高', 'WeiHaiHuoJuGao', 122.034254, 37.52177);
INSERT INTO `china_region` VALUES (328558, 2, 371000000000, 371072000000, '264205', '0631', '威海经济技术开发区', '威海经开区', '山东,威海,威海经开区', 'WeiHaiJingKaiQu', 122.171488, 37.404255);
INSERT INTO `china_region` VALUES (328709, 2, 371000000000, 371073000000, '264211', '0631', '威海临港经济技术开发区', '威海临港经开区', '山东,威海,威海临港经开区', 'WeiHaiLinGangJingKaiQu', 122.14386, 37.342257);
INSERT INTO `china_region` VALUES (328881, 2, 371000000000, 371082000000, '264300', '0631', '荣成市', '荣成', '山东,威海,荣成', 'RongCheng', 122.486658, 37.16516);
INSERT INTO `china_region` VALUES (329841, 2, 371000000000, 371083000000, '264500', '0631', '乳山市', '乳山', '山东,威海,乳山', 'RuShan', 121.539765, 36.919816);
INSERT INTO `china_region` VALUES (330485, 1, 370000000000, 371100000000, '276800', '0633', '日照市', '日照', '山东,日照', 'RiZhao', 119.526888, 35.416377);
INSERT INTO `china_region` VALUES (330486, 2, 371100000000, 371101000000, '276800', '0633', '市辖区', '日照', '山东,日照', 'RiZhao', 119.526888, 35.416377);
INSERT INTO `china_region` VALUES (330487, 2, 371100000000, 371102000000, '276800', '0633', '东港区', '东港', '山东,日照,东港', 'DongGang', 119.462249, 35.42547);
INSERT INTO `china_region` VALUES (331132, 2, 371100000000, 371103000000, '276800', '0633', '岚山区', '岚山', '山东,日照,岚山', 'LanShan', 119.318929, 35.121884);
INSERT INTO `china_region` VALUES (331412, 2, 371100000000, 371121000000, '262300', '0633', '五莲县', '五莲', '山东,日照,五莲', 'WuLian', 119.206763, 35.751927);
INSERT INTO `china_region` VALUES (331978, 2, 371100000000, 371122000000, '276500', '0633', '莒县', '莒县', '山东,日照,莒县', 'JuXian', 118.837064, 35.579868);
INSERT INTO `china_region` VALUES (332164, 2, 371100000000, 371171000000, '276801', '0633', '日照经济技术开发区', '日照经开区', '山东,日照,日照经开区', 'RiZhaoJingKaiQu', 119.521673, 35.39018);
INSERT INTO `china_region` VALUES (332256, 1, 370000000000, 371300000000, '276000', '0539', '临沂市', '临沂', '山东,临沂', 'LinYi', 118.356448, 35.104672);
INSERT INTO `china_region` VALUES (332257, 2, 371300000000, 371301000000, '276000', '0539', '市辖区', '临沂', '山东,临沂', 'LinYi', 118.356448, 35.104672);
INSERT INTO `china_region` VALUES (332258, 2, 371300000000, 371302000000, '276000', '0539', '兰山区', '兰山', '山东,临沂,兰山', 'LanShan', 118.347731, 35.051734);
INSERT INTO `china_region` VALUES (332591, 2, 371300000000, 371311000000, '276000', '0539', '罗庄区', '罗庄', '山东,临沂,罗庄', 'LuoZhuang', 118.284786, 34.996741);
INSERT INTO `china_region` VALUES (332728, 2, 371300000000, 371312000000, '276000', '0539', '河东区', '河东', '山东,临沂,河东', 'HeDong', 118.402893, 35.089917);
INSERT INTO `china_region` VALUES (332927, 2, 371300000000, 371321000000, '276300', '0539', '沂南县', '沂南', '山东,临沂,沂南', 'YiNan', 118.465213, 35.549976);
INSERT INTO `china_region` VALUES (333239, 2, 371300000000, 371322000000, '276100', '0539', '郯城县', '郯城', '山东,临沂,郯城', 'TanCheng', 118.367263, 34.613557);
INSERT INTO `china_region` VALUES (333379, 2, 371300000000, 371323000000, '276400', '0539', '沂水县', '沂水', '山东,临沂,沂水', 'YiShui', 118.627918, 35.79045);
INSERT INTO `china_region` VALUES (333780, 2, 371300000000, 371324000000, '277731', '0539', '兰陵县', '兰陵', '山东,临沂,兰陵', 'LanLing', 118.07065, 34.857149);
INSERT INTO `china_region` VALUES (334400, 2, 371300000000, 371325000000, '273400', '0539', '费县', '费县', '山东,临沂,费县', 'FeiXian', 117.977325, 35.265961);
INSERT INTO `china_region` VALUES (334840, 2, 371300000000, 371326000000, '273300', '0539', '平邑县', '平邑', '山东,临沂,平邑', 'PingYi', 117.640352, 35.505943);
INSERT INTO `china_region` VALUES (335435, 2, 371300000000, 371327000000, '276600', '0539', '莒南县', '莒南', '山东,临沂,莒南', 'JuNan', 118.835163, 35.174846);
INSERT INTO `china_region` VALUES (335687, 2, 371300000000, 371328000000, '276200', '0539', '蒙阴县', '蒙阴', '山东,临沂,蒙阴', 'MengYin', 117.945085, 35.710032);
INSERT INTO `china_region` VALUES (336062, 2, 371300000000, 371329000000, '276700', '0539', '临沭县', '临沭', '山东,临沂,临沭', 'LinShu', 118.650782, 34.919852);
INSERT INTO `china_region` VALUES (336308, 2, 371300000000, 371371000000, '276125', '0539', '临沂高新技术产业开发区', '临沂高', '山东,临沂,临沂高', 'LinYiGao', 118.264459, 34.985575);
INSERT INTO `china_region` VALUES (336350, 2, 371300000000, 371372000000, '276000', '0539', '临沂经济技术开发区', '临沂经开区', '山东,临沂,临沂经开区', 'LinYiJingKaiQu', 118.410215, 35.023135);
INSERT INTO `china_region` VALUES (336425, 2, 371300000000, 371373000000, '276000', '0539', '临沂临港经济开发区', '临沂临港经开区', '山东,临沂,临沂临港经开区', 'LinYiLinGangJingKaiQu', 119.146777, 35.257706);
INSERT INTO `china_region` VALUES (336457, 1, 370000000000, 371400000000, '253000', '0534', '德州市', '德州', '山东,德州', 'DeZhou', 116.357464, 37.434092);
INSERT INTO `china_region` VALUES (336458, 2, 371400000000, 371401000000, '253000', '0534', '市辖区', '德州', '山东,德州', 'DeZhou', 116.357464, 37.434092);
INSERT INTO `china_region` VALUES (336459, 2, 371400000000, 371402000000, '253000', '0534', '德城区', '德城', '山东,德州,德城', 'DeCheng', 116.299471, 37.450805);
INSERT INTO `china_region` VALUES (336569, 2, 371400000000, 371403000000, '253500', '0534', '陵城区', '陵城', '山东,德州,陵城', 'LingCheng', 116.576092, 37.335794);
INSERT INTO `china_region` VALUES (337551, 2, 371400000000, 371422000000, '253400', '0534', '宁津县', '宁津', '山东,德州,宁津', 'NingJin', 116.800306, 37.65219);
INSERT INTO `china_region` VALUES (338428, 2, 371400000000, 371423000000, '253700', '0534', '庆云县', '庆云', '山东,德州,庆云', 'QingYun', 117.385257, 37.77535);
INSERT INTO `china_region` VALUES (338821, 2, 371400000000, 371424000000, '251500', '0534', '临邑县', '临邑', '山东,德州,临邑', 'LinYi', 116.8668, 37.189798);
INSERT INTO `china_region` VALUES (339718, 2, 371400000000, 371425000000, '251100', '0534', '齐河县', '齐河', '山东,德州,齐河', 'QiHe', 116.76281, 36.783415);
INSERT INTO `china_region` VALUES (340726, 2, 371400000000, 371426000000, '253100', '0534', '平原县', '平原', '山东,德州,平原', 'PingYuan', 116.434056, 37.165314);
INSERT INTO `china_region` VALUES (341600, 2, 371400000000, 371427000000, '253200', '0534', '夏津县', '夏津', '山东,德州,夏津', 'XiaJin', 116.001726, 36.948371);
INSERT INTO `china_region` VALUES (342130, 2, 371400000000, 371428000000, '253300', '0534', '武城县', '武城', '山东,德州,武城', 'WuCheng', 116.069302, 37.213311);
INSERT INTO `china_region` VALUES (342538, 2, 371400000000, 371471000000, '253000', '0534', '德州经济技术开发区', '德州经开区', '山东,德州,德州经开区', 'DeZhouJingKaiQu', 116.369847, 37.462488);
INSERT INTO `china_region` VALUES (342756, 2, 371400000000, 371472000000, '253006', '0534', '德州运河经济开发区', '德州运河经开区', '山东,德州,德州运河经开区', 'DeZhouYunHeJingKaiQu', 116.104918, 37.207097);
INSERT INTO `china_region` VALUES (342783, 2, 371400000000, 371481000000, '253600', '0534', '乐陵市', '乐陵', '山东,德州,乐陵', 'LeLing', 117.231935, 37.729907);
INSERT INTO `china_region` VALUES (343852, 2, 371400000000, 371482000000, '251200', '0534', '禹城市', '禹城', '山东,德州,禹城', 'YuCheng', 116.638327, 36.933812);
INSERT INTO `china_region` VALUES (344761, 1, 370000000000, 371500000000, '252000', '0635', '聊城市', '聊城', '山东,聊城', 'LiaoCheng', 115.985371, 36.456703);
INSERT INTO `china_region` VALUES (344762, 2, 371500000000, 371501000000, '252000', '0635', '市辖区', '聊城', '山东,聊城', 'LiaoCheng', 115.985371, 36.456703);
INSERT INTO `china_region` VALUES (344763, 2, 371500000000, 371502000000, '252000', '0635', '东昌府区', '东昌府', '山东,聊城,东昌府', 'DongChangFu', 115.988491, 36.434645);
INSERT INTO `china_region` VALUES (345922, 2, 371500000000, 371503000000, '252100', '0635', '茌平区', '茌平', '山东,聊城,茌平', 'ChiPing', 116.25527, 36.580689);
INSERT INTO `china_region` VALUES (346669, 2, 371500000000, 371521000000, '252300', '0635', '阳谷县', '阳谷', '山东,聊城,阳谷', 'YangGu', 115.79182, 36.114392);
INSERT INTO `china_region` VALUES (347561, 2, 371500000000, 371522000000, '252400', '0635', '莘县', '莘县', '山东,聊城,莘县', 'ShenXian', 115.671191, 36.233598);
INSERT INTO `china_region` VALUES (348712, 2, 371500000000, 371524000000, '252200', '0635', '东阿县', '东阿', '山东,聊城,东阿', 'DongE', 116.24758, 36.334917);
INSERT INTO `china_region` VALUES (349243, 2, 371500000000, 371525000000, '252500', '0635', '冠县', '冠县', '山东,聊城,冠县', 'GuanXian', 115.44274, 36.484009);
INSERT INTO `china_region` VALUES (350026, 2, 371500000000, 371526000000, '252800', '0635', '高唐县', '高唐', '山东,聊城,高唐', 'GaoTang', 116.230158, 36.846755);
INSERT INTO `china_region` VALUES (350684, 2, 371500000000, 371581000000, '252600', '0635', '临清市', '临清', '山东,聊城,临清', 'LinQing', 115.704881, 36.838277);
INSERT INTO `china_region` VALUES (351270, 1, 370000000000, 371600000000, '256600', '0543', '滨州市', '滨州', '山东,滨州', 'BinZhou', 117.970703, 37.38199);
INSERT INTO `china_region` VALUES (351271, 2, 371600000000, 371601000000, '256600', '0543', '市辖区', '滨州', '山东,滨州', 'BinZhou', 117.970703, 37.38199);
INSERT INTO `china_region` VALUES (351272, 2, 371600000000, 371602000000, '256600', '0543', '滨城区', '滨城', '山东,滨州,滨城', 'BinCheng', 118.019326, 37.430724);
INSERT INTO `china_region` VALUES (352122, 2, 371600000000, 371603000000, '256815', '0543', '沾化区', '沾化', '山东,滨州,沾化', 'ZhanHua', 118.098902, 37.69926);
INSERT INTO `china_region` VALUES (352582, 2, 371600000000, 371621000000, '251700', '0543', '惠民县', '惠民', '山东,滨州,惠民', 'HuiMin', 117.509921, 37.489877);
INSERT INTO `china_region` VALUES (352706, 2, 371600000000, 371622000000, '251800', '0543', '阳信县', '阳信', '山东,滨州,阳信', 'YangXin', 117.578262, 37.641106);
INSERT INTO `china_region` VALUES (353574, 2, 371600000000, 371623000000, '251900', '0543', '无棣县', '无棣', '山东,滨州,无棣', 'WuDi', 117.625696, 37.77026);
INSERT INTO `china_region` VALUES (354185, 2, 371600000000, 371625000000, '256500', '0543', '博兴县', '博兴', '山东,滨州,博兴', 'BoXing', 118.131815, 37.150226);
INSERT INTO `china_region` VALUES (354645, 2, 371600000000, 371681000000, '256200', '0543', '邹平市', '邹平', '山东,滨州,邹平', 'ZouPing', 117.743109, 36.862989);
INSERT INTO `china_region` VALUES (355521, 1, 370000000000, 371700000000, '274000', '0530', '菏泽市', '菏泽', '山东,菏泽', 'HeZe', 115.480656, 35.23375);
INSERT INTO `china_region` VALUES (355522, 2, 371700000000, 371701000000, '274000', '0530', '市辖区', '菏泽', '山东,菏泽', 'HeZe', 115.480656, 35.23375);
INSERT INTO `china_region` VALUES (355523, 2, 371700000000, 371702000000, '274000', '0530', '牡丹区', '牡丹', '山东,菏泽,牡丹', 'MuDan', 115.417827, 35.252512);
INSERT INTO `china_region` VALUES (356134, 2, 371700000000, 371703000000, '274003', '0530', '定陶区', '定陶', '山东,菏泽,定陶', 'DingTao', 115.569619, 35.072701);
INSERT INTO `china_region` VALUES (356514, 2, 371700000000, 371721000000, '274400', '0530', '曹县', '曹县', '山东,菏泽,曹县', 'CaoXian', 115.542328, 34.825508);
INSERT INTO `china_region` VALUES (357349, 2, 371700000000, 371722000000, '274300', '0530', '单县', '单县', '山东,菏泽,单县', 'ShanXian', 116.107428, 34.778808);
INSERT INTO `china_region` VALUES (357880, 2, 371700000000, 371723000000, '274200', '0530', '成武县', '成武', '山东,菏泽,成武', 'ChengWu', 115.889765, 34.952459);
INSERT INTO `china_region` VALUES (358379, 2, 371700000000, 371724000000, '274900', '0530', '巨野县', '巨野', '山东,菏泽,巨野', 'JuYe', 116.065396, 35.387374);
INSERT INTO `china_region` VALUES (359031, 2, 371700000000, 371725000000, '274700', '0530', '郓城县', '郓城', '山东,菏泽,郓城', 'YunCheng', 115.943613, 35.599758);
INSERT INTO `china_region` VALUES (359745, 2, 371700000000, 371726000000, '274600', '0530', '鄄城县', '鄄城', '山东,菏泽,鄄城', 'JuanCheng', 115.510193, 35.563408);
INSERT INTO `china_region` VALUES (360154, 2, 371700000000, 371728000000, '274500', '0530', '东明县', '东明', '山东,菏泽,东明', 'DongMing', 115.089905, 35.289368);
INSERT INTO `china_region` VALUES (360578, 2, 371700000000, 371771000000, '274002', '0530', '菏泽经济技术开发区', '菏泽经开区', '山东,菏泽,菏泽经开区', 'HeZeJingKaiQu', 115.495083, 35.23618);
INSERT INTO `china_region` VALUES (360691, 2, 371700000000, 371772000000, '274319', '0530', '菏泽高新技术开发区', '菏泽高', '山东,菏泽,菏泽高', 'HeZeGao', 115.480656, 35.23375);
INSERT INTO `china_region` VALUES (360760, 0, 0, 410000000000, '0', NULL, '河南省', '河南', '河南', 'HeNan', 113.753602, 34.765515);
INSERT INTO `china_region` VALUES (360761, 1, 410000000000, 410100000000, '450000', '0371', '郑州市', '郑州', '河南,郑州', 'ZhengZhou', 113.625368, 34.746599);
INSERT INTO `china_region` VALUES (360762, 2, 410100000000, 410101000000, '450000', '0371', '市辖区', '郑州', '河南,郑州', 'ZhengZhou', 113.625368, 34.746599);
INSERT INTO `china_region` VALUES (360763, 2, 410100000000, 410102000000, '450000', '0371', '中原区', '中原', '河南,郑州,中原', 'ZhongYuan', 113.61285, 34.748257);
INSERT INTO `china_region` VALUES (360924, 2, 410100000000, 410103000000, '450000', '0371', '二七区', '二七', '河南,郑州,二七', 'ErQi', 113.640179, 34.72393);
INSERT INTO `china_region` VALUES (361117, 2, 410100000000, 410104000000, '450000', '0371', '管城回族区', '管城', '河南,郑州,管城', 'GuanCheng', 113.677548, 34.7545);
INSERT INTO `china_region` VALUES (361265, 2, 410100000000, 410105000000, '450000', '0371', '金水区', '金水', '河南,郑州,金水', 'JinShui', 113.660555, 34.800156);
INSERT INTO `china_region` VALUES (361551, 2, 410100000000, 410106000000, '450041', '0371', '上街区', '上街', '河南,郑州,上街', 'ShangJie', 113.308961, 34.80278);
INSERT INTO `china_region` VALUES (361617, 2, 410100000000, 410108000000, '450000', '0371', '惠济区', '惠济', '河南,郑州,惠济', 'HuiJi', 113.616901, 34.867458);
INSERT INTO `china_region` VALUES (361701, 2, 410100000000, 410122000000, '451450', '0371', '中牟县', '中牟', '河南,郑州,中牟', 'ZhongMu', 113.976181, 34.71895);
INSERT INTO `china_region` VALUES (362055, 2, 410100000000, 410171000000, '450003', '0371', '郑州经济技术开发区', '郑州经开区', '河南,郑州,郑州经开区', 'ZhengZhouJingKaiQu', 113.743251, 34.721775);
INSERT INTO `china_region` VALUES (362126, 2, 410100000000, 410172000000, '450001', '0371', '郑州高新技术产业开发区', '郑州高', '河南,郑州,郑州高', 'ZhengZhouGao', 113.56343, 34.801278);
INSERT INTO `china_region` VALUES (362202, 2, 410100000000, 410173000000, '450005', '0371', '郑州航空港经济综合实验区', '郑州航空港经开区', '河南,郑州,郑州航空港经开区', 'ZhengZhouHangKongGangJingKaiQu', 113.625368, 34.746599);
INSERT INTO `china_region` VALUES (362388, 2, 410100000000, 410181000000, '451200', '0371', '巩义市', '巩义', '河南,郑州,巩义', 'GongYi', 113.022497, 34.747834);
INSERT INTO `china_region` VALUES (362729, 2, 410100000000, 410182000000, '450100', '0371', '荥阳市', '荥阳', '河南,郑州,荥阳', 'XingYang', 113.440457, 34.745585);
INSERT INTO `china_region` VALUES (363058, 2, 410100000000, 410183000000, '452370', '0371', '新密市', '新密', '河南,郑州,新密', 'XinMi', 113.390891, 34.539443);
INSERT INTO `china_region` VALUES (363429, 2, 410100000000, 410184000000, '451100', '0371', '新郑市', '新郑', '河南,郑州,新郑', 'XinZheng', 113.740529, 34.395562);
INSERT INTO `china_region` VALUES (363728, 2, 410100000000, 410185000000, '452470', '0371', '登封市', '登封', '河南,郑州,登封', 'DengFeng', 113.050492, 34.453667);
INSERT INTO `china_region` VALUES (364069, 1, 410000000000, 410200000000, '475000', '0378', '开封市', '开封', '河南,开封', 'KaiFeng', 114.307581, 34.797239);
INSERT INTO `china_region` VALUES (364070, 2, 410200000000, 410201000000, '475000', '0378', '市辖区', '开封', '河南,开封', 'KaiFeng', 114.307581, 34.797239);
INSERT INTO `china_region` VALUES (364071, 2, 410200000000, 410202000000, '475000', '0378', '龙亭区', '龙亭', '河南,开封,龙亭', 'LongTing', 114.35473, 34.815784);
INSERT INTO `china_region` VALUES (364243, 2, 410200000000, 410203000000, '475000', '0378', '顺河回族区', '顺河', '河南,开封,顺河', 'ShunHe', 114.364875, 34.800459);
INSERT INTO `china_region` VALUES (364322, 2, 410200000000, 410204000000, '475000', '0378', '鼓楼区', '鼓楼', '河南,开封,鼓楼', 'GuLou', 114.348307, 34.788561);
INSERT INTO `china_region` VALUES (364373, 2, 410200000000, 410205000000, '475000', '0378', '禹王台区', '禹王台', '河南,开封,禹王台', 'YuWangTai', 114.34817, 34.777104);
INSERT INTO `china_region` VALUES (364430, 2, 410200000000, 410212000000, '475199', '0378', '祥符区', '祥符', '河南,开封,祥符', 'XiangFu', 114.441327, 34.756921);
INSERT INTO `china_region` VALUES (364792, 2, 410200000000, 410221000000, '475200', '0378', '杞县', '杞县', '河南,开封,杞县', 'QiXian', 114.783041, 34.549166);
INSERT INTO `china_region` VALUES (365415, 2, 410200000000, 410222000000, '475400', '0378', '通许县', '通许', '河南,开封,通许', 'TongXu', 114.467467, 34.480433);
INSERT INTO `china_region` VALUES (365737, 2, 410200000000, 410223000000, '475500', '0378', '尉氏县', '尉氏', '河南,开封,尉氏', 'WeiShi', 114.193081, 34.411494);
INSERT INTO `china_region` VALUES (366276, 2, 410200000000, 410225000000, '475300', '0378', '兰考县', '兰考', '河南,开封,兰考', 'LanKao', 114.821348, 34.822211);
INSERT INTO `china_region` VALUES (366761, 1, 410000000000, 410300000000, '471000', '0379', '洛阳市', '洛阳', '河南,洛阳', 'LuoYang', 112.45404, 34.619682);
INSERT INTO `china_region` VALUES (366762, 2, 410300000000, 410301000000, '471000', '0379', '市辖区', '洛阳', '河南,洛阳', 'LuoYang', 112.45404, 34.619682);
INSERT INTO `china_region` VALUES (366763, 2, 410300000000, 410302000000, '471000', '0379', '老城区', '老城', '河南,洛阳,老城', 'LaoCheng', 112.469024, 34.683646);
INSERT INTO `china_region` VALUES (366821, 2, 410300000000, 410303000000, '471000', '0379', '西工区', '西工', '河南,洛阳,西工', 'XiGong', 112.428413, 34.6599);
INSERT INTO `china_region` VALUES (366896, 2, 410300000000, 410304000000, '471002', '0379', '瀍河回族区', '瀍河', '河南,洛阳,瀍河', 'ChanHe', 112.500205, 34.67985);
INSERT INTO `china_region` VALUES (366937, 2, 410300000000, 410305000000, '471000', '0379', '涧西区', '涧西', '河南,洛阳,涧西', 'JianXi', 112.395756, 34.658034);
INSERT INTO `china_region` VALUES (367023, 2, 410300000000, 410306000000, '471000', '0379', '吉利区', '吉利', '河南,洛阳,吉利', 'JiLi', 112.589052, 34.900889);
INSERT INTO `china_region` VALUES (367066, 2, 410300000000, 410311000000, '471000', '0379', '洛龙区', '洛龙', '河南,洛阳,洛龙', 'LuoLong', 112.464173, 34.619404);
INSERT INTO `china_region` VALUES (367369, 2, 410300000000, 410322000000, '471100', '0379', '孟津县', '孟津', '河南,洛阳,孟津', 'MengJin', 112.445252, 34.825307);
INSERT INTO `china_region` VALUES (367614, 2, 410300000000, 410323000000, '471800', '0379', '新安县', '新安', '河南,洛阳,新安', 'XinAn', 112.132488, 34.728584);
INSERT INTO `china_region` VALUES (367937, 2, 410300000000, 410324000000, '471500', '0379', '栾川县', '栾川', '河南,洛阳,栾川', 'LuanChuan', 111.615769, 33.785698);
INSERT INTO `china_region` VALUES (368165, 2, 410300000000, 410325000000, '471400', '0379', '嵩县', '嵩县', '河南,洛阳,嵩县', 'SongXian', 112.085634, 34.134517);
INSERT INTO `china_region` VALUES (368510, 2, 410300000000, 410326000000, '471200', '0379', '汝阳县', '汝阳', '河南,洛阳,汝阳', 'RuYang', 112.473139, 34.15394);
INSERT INTO `china_region` VALUES (368745, 2, 410300000000, 410327000000, '471600', '0379', '宜阳县', '宜阳', '河南,洛阳,宜阳', 'YiYang', 112.179238, 34.514645);
INSERT INTO `china_region` VALUES (369124, 2, 410300000000, 410328000000, '471700', '0379', '洛宁县', '洛宁', '河南,洛阳,洛宁', 'LuoNing', 111.653039, 34.389414);
INSERT INTO `china_region` VALUES (369533, 2, 410300000000, 410329000000, '471300', '0379', '伊川县', '伊川', '河南,洛阳,伊川', 'YiChuan', 112.425651, 34.42146);
INSERT INTO `china_region` VALUES (369919, 2, 410300000000, 410371000000, '471411', '0379', '洛阳高新技术产业开发区', '洛阳高', '河南,洛阳,洛阳高', 'LuoYangGao', 112.45404, 34.619682);
INSERT INTO `china_region` VALUES (369960, 2, 410300000000, 410381000000, '471900', '0379', '偃师市', '偃师', '河南,洛阳,偃师', 'YanShi', 112.789535, 34.72722);
INSERT INTO `china_region` VALUES (370206, 1, 410000000000, 410400000000, '467000', '0375', '平顶山市', '平顶山', '河南,平顶山', 'PingDingShan', 113.192661, 33.766169);
INSERT INTO `china_region` VALUES (370207, 2, 410400000000, 410401000000, '467000', '0375', '市辖区', '平顶山', '河南,平顶山', 'PingDingShan', 113.192661, 33.766169);
INSERT INTO `china_region` VALUES (370208, 2, 410400000000, 410402000000, '467000', '0375', '新华区', '新华', '河南,平顶山,新华', 'XinHua', 113.293999, 33.737365);
INSERT INTO `china_region` VALUES (370286, 2, 410400000000, 410403000000, '467000', '0375', '卫东区', '卫东', '河南,平顶山,卫东', 'WeiDong', 113.335193, 33.734707);
INSERT INTO `china_region` VALUES (370357, 2, 410400000000, 410404000000, '467000', '0375', '石龙区', '石龙', '河南,平顶山,石龙', 'ShiLong', 112.898818, 33.898713);
INSERT INTO `china_region` VALUES (370388, 2, 410400000000, 410411000000, '467000', '0375', '湛河区', '湛河', '河南,平顶山,湛河', 'ZhanHe', 113.320873, 33.725681);
INSERT INTO `china_region` VALUES (370502, 2, 410400000000, 410421000000, '467400', '0375', '宝丰县', '宝丰', '河南,平顶山,宝丰', 'BaoFeng', 113.054754, 33.868441);
INSERT INTO `china_region` VALUES (370836, 2, 410400000000, 410422000000, '467200', '0375', '叶县', '叶县', '河南,平顶山,叶县', 'YeXian', 113.357239, 33.626731);
INSERT INTO `china_region` VALUES (371409, 2, 410400000000, 410423000000, '467300', '0375', '鲁山县', '鲁山', '河南,平顶山,鲁山', 'LuShan', 112.908023, 33.738518);
INSERT INTO `china_region` VALUES (371990, 2, 410400000000, 410425000000, '467100', '0375', '郏县', '郏县', '河南,平顶山,郏县', 'JiaXian', 113.212609, 33.971787);
INSERT INTO `china_region` VALUES (372383, 2, 410400000000, 410471000000, '467013', '0375', '平顶山高新技术产业开发区', '平顶山高', '河南,平顶山,平顶山高', 'PingDingShanGao', 113.387607, 33.732271);
INSERT INTO `china_region` VALUES (372416, 2, 410400000000, 410472000000, '467000', '0375', '平顶山市城乡一体化示范区', '平顶山示范', '河南,平顶山,平顶山示范', 'PingDingShanShiFan', 113.192661, 33.766169);
INSERT INTO `china_region` VALUES (372468, 2, 410400000000, 410481000000, '462500', '0375', '舞钢市', '舞钢', '河南,平顶山,舞钢', 'WuGang', 113.524794, 33.307776);
INSERT INTO `china_region` VALUES (372703, 2, 410400000000, 410482000000, '467500', '0375', '汝州市', '汝州', '河南,平顶山,汝州', 'RuZhou', 112.844517, 34.16703);
INSERT INTO `china_region` VALUES (373191, 1, 410000000000, 410500000000, '455000', '0372', '安阳市', '安阳', '河南,安阳', 'AnYang', 114.392392, 36.097577);
INSERT INTO `china_region` VALUES (373192, 2, 410500000000, 410501000000, '455000', '0372', '市辖区', '安阳', '河南,安阳', 'AnYang', 114.392392, 36.097577);
INSERT INTO `china_region` VALUES (373193, 2, 410500000000, 410502000000, '455000', '0372', '文峰区', '文峰', '河南,安阳,文峰', 'WenFeng', 114.357082, 36.090468);
INSERT INTO `china_region` VALUES (373322, 2, 410500000000, 410503000000, '455000', '0372', '北关区', '北关', '河南,安阳,北关', 'BeiGuan', 114.355822, 36.107255);
INSERT INTO `china_region` VALUES (373449, 2, 410500000000, 410505000000, '455000', '0372', '殷都区', '殷都', '河南,安阳,殷都', 'YinDu', 114.30341, 36.10989);
INSERT INTO `china_region` VALUES (373545, 2, 410500000000, 410506000000, '455000', '0372', '龙安区', '龙安', '河南,安阳,龙安', 'LongAn', 114.323522, 36.095568);
INSERT INTO `china_region` VALUES (373752, 2, 410500000000, 410522000000, '455100', '0372', '安阳县', '安阳', '河南,安阳', 'AnYang', 114.130207, 36.130585);
INSERT INTO `china_region` VALUES (374325, 2, 410500000000, 410523000000, '456150', '0372', '汤阴县', '汤阴', '河南,安阳,汤阴', 'TangYin', 114.357763, 35.924515);
INSERT INTO `china_region` VALUES (374642, 2, 410500000000, 410526000000, '456400', '0372', '滑县', '滑县', '河南,安阳,滑县', 'HuaXian', 114.518997, 35.575002);
INSERT INTO `china_region` VALUES (375675, 2, 410500000000, 410527000000, '456300', '0372', '内黄县', '内黄', '河南,安阳,内黄', 'NeiHuang', 114.901492, 35.971653);
INSERT INTO `china_region` VALUES (376225, 2, 410500000000, 410571000000, '455111', '0372', '安阳高新技术产业开发区', '安阳高', '河南,安阳,安阳高', 'AnYangGao', 114.130207, 36.130585);
INSERT INTO `china_region` VALUES (376262, 2, 410500000000, 410581000000, '456500', '0372', '林州市', '林州', '河南,安阳,林州', 'LinZhou', 113.82013, 36.083047);
INSERT INTO `china_region` VALUES (376868, 1, 410000000000, 410600000000, '458000', '0392', '鹤壁市', '鹤壁', '河南,鹤壁', 'HeBi', 114.297272, 35.747225);
INSERT INTO `china_region` VALUES (376869, 2, 410600000000, 410601000000, '458000', '0392', '市辖区', '鹤壁', '河南,鹤壁', 'HeBi', 114.297272, 35.747225);
INSERT INTO `china_region` VALUES (376870, 2, 410600000000, 410602000000, '458000', '0392', '鹤山区', '鹤山', '河南,鹤壁,鹤山', 'HeShan', 114.163367, 35.954582);
INSERT INTO `china_region` VALUES (376959, 2, 410600000000, 410603000000, '458000', '0392', '山城区', '山城', '河南,鹤壁,山城', 'ShanCheng', 114.184428, 35.897703);
INSERT INTO `china_region` VALUES (377069, 2, 410600000000, 410611000000, '458000', '0392', '淇滨区', '淇滨', '河南,鹤壁,淇滨', 'QiBin', 114.298694, 35.741296);
INSERT INTO `china_region` VALUES (377235, 2, 410600000000, 410621000000, '456250', '0392', '浚县', '浚县', '河南,鹤壁,浚县', 'JunXian', 114.550813, 35.67624);
INSERT INTO `china_region` VALUES (377716, 2, 410600000000, 410622000000, '456750', '0392', '淇县', '淇县', '河南,鹤壁,淇县', 'QiXian', 114.197651, 35.607762);
INSERT INTO `china_region` VALUES (377902, 2, 410600000000, 410671000000, '458010', '0392', '鹤壁经济技术开发区', '鹤壁经开区', '河南,鹤壁,鹤壁经开区', 'HeBiJingKaiQu', 114.309668, 35.760805);
INSERT INTO `china_region` VALUES (377920, 1, 410000000000, 410700000000, '453000', '0373', '新乡市', '新乡', '河南,新乡', 'XinXiang', 113.9268, 35.303004);
INSERT INTO `china_region` VALUES (377921, 2, 410700000000, 410701000000, '453000', '0373', '市辖区', '新乡', '河南,新乡', 'XinXiang', 113.9268, 35.303004);
INSERT INTO `china_region` VALUES (377922, 2, 410700000000, 410702000000, '453000', '0373', '红旗区', '红旗', '河南,新乡,红旗', 'HongQi', 113.875245, 35.303851);
INSERT INTO `china_region` VALUES (378009, 2, 410700000000, 410703000000, '453000', '0373', '卫滨区', '卫滨', '河南,新乡,卫滨', 'WeiBin', 113.86578, 35.302117);
INSERT INTO `china_region` VALUES (378072, 2, 410700000000, 410704000000, '453011', '0373', '凤泉区', '凤泉', '河南,新乡,凤泉', 'FengQuan', 113.915184, 35.383978);
INSERT INTO `china_region` VALUES (378124, 2, 410700000000, 410711000000, '453000', '0373', '牧野区', '牧野', '河南,新乡,牧野', 'MuYe', 113.908772, 35.315039);
INSERT INTO `china_region` VALUES (378231, 2, 410700000000, 410721000000, '453700', '0373', '新乡县', '新乡', '河南,新乡', 'XinXiang', 113.805205, 35.190836);
INSERT INTO `china_region` VALUES (378419, 2, 410700000000, 410724000000, '453800', '0373', '获嘉县', '获嘉', '河南,新乡,获嘉', 'HuoJia', 113.657433, 35.259808);
INSERT INTO `china_region` VALUES (378661, 2, 410700000000, 410725000000, '453500', '0373', '原阳县', '原阳', '河南,新乡,原阳', 'YuanYang', 113.940115, 35.065587);
INSERT INTO `china_region` VALUES (379134, 2, 410700000000, 410726000000, '453200', '0373', '延津县', '延津', '河南,新乡,延津', 'YanJin', 114.205197, 35.141956);
INSERT INTO `china_region` VALUES (379495, 2, 410700000000, 410727000000, '453300', '0373', '封丘县', '封丘', '河南,新乡,封丘', 'FengQiu', 114.418882, 35.041198);
INSERT INTO `china_region` VALUES (380123, 2, 410700000000, 410771000000, '453799', '0373', '新乡高新技术产业开发区', '新乡高', '河南,新乡,新乡高', 'XinXiangGao', 113.805205, 35.190836);
INSERT INTO `china_region` VALUES (380153, 2, 410700000000, 410772000000, '453400', '0373', '新乡经济技术开发区', '新乡经开区', '河南,新乡,新乡经开区', 'XinXiangJingKaiQu', 113.805205, 35.190836);
INSERT INTO `china_region` VALUES (380172, 2, 410700000000, 410773000000, '453003', '0373', '新乡市平原城乡一体化示范区', '新乡平原示范', '河南,新乡,新乡平原示范', 'XinXiangPingYuanShiFan', 113.9268, 35.303004);
INSERT INTO `china_region` VALUES (380311, 2, 410700000000, 410781000000, '453100', '0373', '卫辉市', '卫辉', '河南,新乡,卫辉', 'WeiHui', 114.064907, 35.398494);
INSERT INTO `china_region` VALUES (380692, 2, 410700000000, 410782000000, '453600', '0373', '辉县市', '辉县', '河南,新乡,辉县', 'HuiXian', 113.805468, 35.462313);
INSERT INTO `china_region` VALUES (381274, 2, 410700000000, 410783000000, '453400', '0373', '长垣市', '长垣', '河南,新乡,长垣', 'ChangYuan', 114.668936, 35.201548);
INSERT INTO `china_region` VALUES (381910, 1, 410000000000, 410800000000, '454150', '0391', '焦作市', '焦作', '河南,焦作', 'JiaoZuo', 113.241823, 35.215892);
INSERT INTO `china_region` VALUES (381911, 2, 410800000000, 410801000000, '454150', '0391', '市辖区', '焦作', '河南,焦作', 'JiaoZuo', 113.241823, 35.215892);
INSERT INTO `china_region` VALUES (381912, 2, 410800000000, 410802000000, '454150', '0391', '解放区', '解放', '河南,焦作,解放', 'JieFang', 113.230817, 35.240282);
INSERT INTO `china_region` VALUES (381979, 2, 410800000000, 410803000000, '454150', '0391', '中站区', '中站', '河南,焦作,中站', 'ZhongZhan', 113.182946, 35.23682);
INSERT INTO `china_region` VALUES (382039, 2, 410800000000, 410804000000, '454150', '0391', '马村区', '马村', '河南,焦作,马村', 'MaCun', 113.322332, 35.256108);
INSERT INTO `china_region` VALUES (382125, 2, 410800000000, 410811000000, '454150', '0391', '山阳区', '山阳', '河南,焦作,山阳', 'ShanYang', 113.254881, 35.214507);
INSERT INTO `china_region` VALUES (382189, 2, 410800000000, 410821000000, '454350', '0391', '修武县', '修武', '河南,焦作,修武', 'XiuWu', 113.447755, 35.223514);
INSERT INTO `china_region` VALUES (382392, 2, 410800000000, 410822000000, '454450', '0391', '博爱县', '博爱', '河南,焦作,博爱', 'BoAi', 113.069211, 35.166061);
INSERT INTO `china_region` VALUES (382620, 2, 410800000000, 410823000000, '454950', '0391', '武陟县', '武陟', '河南,焦作,武陟', 'WuZhi', 113.401679, 35.099378);
INSERT INTO `china_region` VALUES (382988, 2, 410800000000, 410825000000, '454850', '0391', '温县', '温县', '河南,焦作,温县', 'WenXian', 113.08053, 34.940189);
INSERT INTO `china_region` VALUES (383269, 2, 410800000000, 410871000000, '454150', '0391', '焦作城乡一体化示范区', '焦作示范', '河南,焦作,焦作示范', 'JiaoZuoShiFan', 113.253203, 35.175621);
INSERT INTO `china_region` VALUES (383380, 2, 410800000000, 410882000000, '454550', '0391', '沁阳市', '沁阳', '河南,焦作,沁阳', 'QinYang', 112.943069, 35.090604);
INSERT INTO `china_region` VALUES (383734, 2, 410800000000, 410883000000, '454750', '0391', '孟州市', '孟州', '河南,焦作,孟州', 'MengZhou', 112.789612, 34.90797);
INSERT INTO `china_region` VALUES (384035, 1, 410000000000, 410900000000, '457000', '0393', '濮阳市', '濮阳', '河南,濮阳', 'PuYang', 115.029215, 35.761829);
INSERT INTO `china_region` VALUES (384036, 2, 410900000000, 410901000000, '457000', '0393', '市辖区', '濮阳', '河南,濮阳', 'PuYang', 115.029215, 35.761829);
INSERT INTO `china_region` VALUES (384037, 2, 410900000000, 410902000000, '457006', '0393', '华龙区', '华龙', '河南,濮阳,华龙', 'HuaLong', 115.074151, 35.777346);
INSERT INTO `china_region` VALUES (384200, 2, 410900000000, 410922000000, '457300', '0393', '清丰县', '清丰', '河南,濮阳,清丰', 'QingFeng', 115.104389, 35.88518);
INSERT INTO `china_region` VALUES (384727, 2, 410900000000, 410923000000, '457400', '0393', '南乐县', '南乐', '河南,濮阳,南乐', 'NanLe', 115.204752, 36.069664);
INSERT INTO `china_region` VALUES (385069, 2, 410900000000, 410926000000, '457500', '0393', '范县', '范县', '河南,濮阳,范县', 'FanXian', 115.504201, 35.851907);
INSERT INTO `china_region` VALUES (385665, 2, 410900000000, 410927000000, '457600', '0393', '台前县', '台前', '河南,濮阳,台前', 'TaiQian', 115.871906, 35.96939);
INSERT INTO `china_region` VALUES (386052, 2, 410900000000, 410928000000, '457100', '0393', '濮阳县', '濮阳', '河南,濮阳', 'PuYang', 115.029078, 35.712193);
INSERT INTO `china_region` VALUES (387059, 2, 410900000000, 410971000000, '457161', '0393', '河南濮阳工业园区', '河南濮阳工业园', '河南,濮阳,濮阳工业园', 'HeNanPuYangGongYeYuan', 115.176861, 35.752109);
INSERT INTO `china_region` VALUES (387084, 2, 410900000000, 410972000000, '457100', '0393', '濮阳经济技术开发区', '濮阳经开区', '河南,濮阳,濮阳经开区', 'PuYangJingKaiQu', 115.029078, 35.712193);
INSERT INTO `china_region` VALUES (387258, 1, 410000000000, 411000000000, '461000', '0374', '许昌市', '许昌', '河南,许昌', 'XuChang', 113.85264, 34.035506);
INSERT INTO `china_region` VALUES (387259, 2, 411000000000, 411001000000, '461000', '0374', '市辖区', '许昌', '河南,许昌', 'XuChang', 113.85264, 34.035506);
INSERT INTO `china_region` VALUES (387260, 2, 411000000000, 411002000000, '461000', '0374', '魏都区', '魏都', '河南,许昌,魏都', 'WeiDu', 113.822647, 34.025342);
INSERT INTO `china_region` VALUES (387371, 2, 411000000000, 411003000000, '461002', '0374', '建安区', '建安', '河南,许昌,建安', 'JianAn', 113.822989, 34.124669);
INSERT INTO `china_region` VALUES (387837, 2, 411000000000, 411024000000, '461200', '0374', '鄢陵县', '鄢陵', '河南,许昌,鄢陵', 'YanLing', 114.1774, 34.102332);
INSERT INTO `china_region` VALUES (388236, 2, 411000000000, 411025000000, '452670', '0374', '襄城县', '襄城', '河南,许昌,襄城', 'XiangCheng', 113.488847, 33.866442);
INSERT INTO `china_region` VALUES (388701, 2, 411000000000, 411071000000, '461002', '0374', '许昌经济技术开发区', '许昌经开区', '河南,许昌,许昌经开区', 'XuChangJingKaiQu', 113.833268, 34.018521);
INSERT INTO `china_region` VALUES (388729, 2, 411000000000, 411081000000, '461670', '0374', '禹州市', '禹州', '河南,许昌,禹州', 'YuZhou', 113.488478, 34.140701);
INSERT INTO `china_region` VALUES (389435, 2, 411000000000, 411082000000, '461500', '0374', '长葛市', '长葛', '河南,许昌,长葛', 'ChangGe', 113.819888, 34.194136);
INSERT INTO `china_region` VALUES (389826, 1, 410000000000, 411100000000, '462000', '0395', '漯河市', '漯河', '河南,漯河', 'TaHe', 114.016539, 33.581412);
INSERT INTO `china_region` VALUES (389827, 2, 411100000000, 411101000000, '462000', '0395', '市辖区', '漯河', '河南,漯河', 'TaHe', 114.016539, 33.581412);
INSERT INTO `china_region` VALUES (389828, 2, 411100000000, 411102000000, '462000', '0395', '源汇区', '源汇', '河南,漯河,源汇', 'YuanHui', 113.91071, 33.58219);
INSERT INTO `china_region` VALUES (389966, 2, 411100000000, 411103000000, '462300', '0395', '郾城区', '郾城', '河南,漯河,郾城', 'YanCheng', 114.006944, 33.587409);
INSERT INTO `china_region` VALUES (390176, 2, 411100000000, 411104000000, '462300', '0395', '召陵区', '召陵', '河南,漯河,召陵', 'ShaoLing', 114.093902, 33.586565);
INSERT INTO `china_region` VALUES (390391, 2, 411100000000, 411121000000, '462400', '0395', '舞阳县', '舞阳', '河南,漯河,舞阳', 'WuYang', 113.609286, 33.437877);
INSERT INTO `china_region` VALUES (390803, 2, 411100000000, 411122000000, '462600', '0395', '临颍县', '临颍', '河南,漯河,临颍', 'LinYing', 113.931203, 33.827304);
INSERT INTO `china_region` VALUES (391187, 2, 411100000000, 411171000000, '462005', '0395', '漯河经济技术开发区', '漯河经开区', '河南,漯河,漯河经开区', 'TaHeJingKaiQu', 114.049827, 33.550795);
INSERT INTO `china_region` VALUES (391222, 1, 410000000000, 411200000000, '472000', '0398', '三门峡市', '三门峡', '河南,三门峡', 'SanMenXia', 111.200135, 34.772493);
INSERT INTO `china_region` VALUES (391223, 2, 411200000000, 411201000000, '472000', '0398', '市辖区', '三门峡', '河南,三门峡', 'SanMenXia', 111.200135, 34.772493);
INSERT INTO `china_region` VALUES (391224, 2, 411200000000, 411202000000, '472000', '0398', '湖滨区', '湖滨', '河南,三门峡,湖滨', 'HuBin', 111.188398, 34.770886);
INSERT INTO `china_region` VALUES (391321, 2, 411200000000, 411203000000, '472001', '0398', '陕州区', '陕州', '河南,三门峡,陕州', 'ShanZhou', 111.103563, 34.720548);
INSERT INTO `china_region` VALUES (391610, 2, 411200000000, 411221000000, '472400', '0398', '渑池县', '渑池', '河南,三门峡,渑池', 'MianChi', 111.761504, 34.767244);
INSERT INTO `china_region` VALUES (391872, 2, 411200000000, 411224000000, '472200', '0398', '卢氏县', '卢氏', '河南,三门峡,卢氏', 'LuShi', 111.047858, 34.054324);
INSERT INTO `china_region` VALUES (392180, 2, 411200000000, 411271000000, '472001', '0398', '河南三门峡经济开发区', '河南三门峡经开区', '河南,三门峡,三门峡经开区', 'HeNanSanMenXiaJingKaiQu', 111.175283, 34.796888);
INSERT INTO `china_region` VALUES (392188, 2, 411200000000, 411281000000, '472300', '0398', '义马市', '义马', '河南,三门峡,义马', 'YiMa', 111.874393, 34.747129);
INSERT INTO `china_region` VALUES (392231, 2, 411200000000, 411282000000, '472500', '0398', '灵宝市', '灵宝', '河南,三门峡,灵宝', 'LingBao', 110.89422, 34.516828);
INSERT INTO `china_region` VALUES (392715, 1, 410000000000, 411300000000, '473000', '0377', '南阳市', '南阳', '河南,南阳', 'NanYang', 112.528321, 32.990833);
INSERT INTO `china_region` VALUES (392716, 2, 411300000000, 411301000000, '473000', '0377', '市辖区', '南阳', '河南,南阳', 'NanYang', 112.528321, 32.990833);
INSERT INTO `china_region` VALUES (392717, 2, 411300000000, 411302000000, '473000', '0377', '宛城区', '宛城', '河南,南阳,宛城', 'WanCheng', 112.539559, 33.003784);
INSERT INTO `china_region` VALUES (392980, 2, 411300000000, 411303000000, '473000', '0377', '卧龙区', '卧龙', '河南,南阳,卧龙', 'WoLong', 112.528789, 32.989877);
INSERT INTO `china_region` VALUES (393295, 2, 411300000000, 411321000000, '474650', '0377', '南召县', '南召', '河南,南阳,南召', 'NanZhao', 112.429133, 33.489877);
INSERT INTO `china_region` VALUES (393665, 2, 411300000000, 411322000000, '473200', '0377', '方城县', '方城', '河南,南阳,方城', 'FangCheng', 113.012494, 33.254391);
INSERT INTO `china_region` VALUES (394255, 2, 411300000000, 411323000000, '474550', '0377', '西峡县', '西峡', '河南,南阳,西峡', 'XiXia', 111.47353, 33.307294);
INSERT INTO `china_region` VALUES (394574, 2, 411300000000, 411324000000, '474250', '0377', '镇平县', '镇平', '河南,南阳,镇平', 'ZhenPing', 112.234698, 33.034111);
INSERT INTO `china_region` VALUES (395029, 2, 411300000000, 411325000000, '474350', '0377', '内乡县', '内乡', '河南,南阳,内乡', 'NeiXiang', 111.849392, 33.044865);
INSERT INTO `china_region` VALUES (395342, 2, 411300000000, 411326000000, '474450', '0377', '淅川县', '淅川', '河南,南阳,淅川', 'XiChuan', 111.490964, 33.13782);
INSERT INTO `china_region` VALUES (395874, 2, 411300000000, 411327000000, '473300', '0377', '社旗县', '社旗', '河南,南阳,社旗', 'SheQi', 112.948245, 33.056109);
INSERT INTO `china_region` VALUES (396148, 2, 411300000000, 411328000000, '473400', '0377', '唐河县', '唐河', '河南,南阳,唐河', 'TangHe', 112.807637, 32.681335);
INSERT INTO `china_region` VALUES (396712, 2, 411300000000, 411329000000, '473500', '0377', '新野县', '新野', '河南,南阳,新野', 'XinYe', 112.360026, 32.520805);
INSERT INTO `china_region` VALUES (397000, 2, 411300000000, 411330000000, '474750', '0377', '桐柏县', '桐柏', '河南,南阳,桐柏', 'TongBai', 113.428287, 32.380073);
INSERT INTO `china_region` VALUES (397236, 2, 411300000000, 411371000000, '473021', '0377', '南阳高新技术产业开发区', '南阳高', '河南,南阳,南阳高', 'NanYangGao', 112.528321, 32.990833);
INSERT INTO `china_region` VALUES (397257, 2, 411300000000, 411372000000, '473132', '0377', '南阳市城乡一体化示范区', '南阳示范', '河南,南阳,南阳示范', 'NanYangShiFan', 112.581668, 32.975043);
INSERT INTO `china_region` VALUES (397320, 2, 411300000000, 411381000000, '474150', '0377', '邓州市', '邓州', '河南,南阳,邓州', 'DengZhou', 112.087278, 32.687938);
INSERT INTO `china_region` VALUES (397982, 1, 410000000000, 411400000000, '476000', '0370', '商丘市', '商丘', '河南,商丘', 'ShangQiu', 115.65637, 34.414172);
INSERT INTO `china_region` VALUES (397983, 2, 411400000000, 411401000000, '476000', '0370', '市辖区', '商丘', '河南,商丘', 'ShangQiu', 115.65637, 34.414172);
INSERT INTO `china_region` VALUES (397984, 2, 411400000000, 411402000000, '476000', '0370', '梁园区', '梁园', '河南,商丘,梁园', 'LiangYuan', 115.613965, 34.443893);
INSERT INTO `china_region` VALUES (398248, 2, 411400000000, 411403000000, '476000', '0370', '睢阳区', '睢阳', '河南,商丘,睢阳', 'SuiYang', 115.653302, 34.38839);
INSERT INTO `china_region` VALUES (398624, 2, 411400000000, 411421000000, '476800', '0370', '民权县', '民权', '河南,商丘,民权', 'MinQuan', 115.179594, 34.647758);
INSERT INTO `china_region` VALUES (399203, 2, 411400000000, 411422000000, '476900', '0370', '睢县', '睢县', '河南,商丘,睢县', 'SuiXian', 115.071879, 34.445656);
INSERT INTO `china_region` VALUES (399776, 2, 411400000000, 411423000000, '476700', '0370', '宁陵县', '宁陵', '河南,商丘,宁陵', 'NingLing', 115.31369, 34.460232);
INSERT INTO `china_region` VALUES (400156, 2, 411400000000, 411424000000, '476200', '0370', '柘城县', '柘城', '河南,商丘,柘城', 'ZheCheng', 115.305843, 34.091045);
INSERT INTO `china_region` VALUES (400687, 2, 411400000000, 411425000000, '476300', '0370', '虞城县', '虞城', '河南,商丘,虞城', 'YuCheng', 115.840511, 34.402512);
INSERT INTO `china_region` VALUES (401335, 2, 411400000000, 411426000000, '476400', '0370', '夏邑县', '夏邑', '河南,商丘,夏邑', 'XiaYi', 116.131447, 34.237554);
INSERT INTO `china_region` VALUES (402103, 2, 411400000000, 411471000000, '476000', '0370', '豫东综合物流产业聚集区', '豫东综合物流产业聚集', '河南,商丘,豫东综合物流产业聚集', 'YuDongZongHeWuLiuChanYeJuJi', 115.65637, 34.414172);
INSERT INTO `china_region` VALUES (402176, 2, 411400000000, 411472000000, '476932', '0370', '河南商丘经济开发区', '河南商丘经开区', '河南,商丘,商丘经开区', 'HeNanShangQiuJingKaiQu', 115.691909, 34.401679);
INSERT INTO `china_region` VALUES (402220, 2, 411400000000, 411481000000, '476600', '0370', '永城市', '永城', '河南,商丘,永城', 'YongCheng', 116.4495, 33.929291);
INSERT INTO `china_region` VALUES (403022, 1, 410000000000, 411500000000, '464000', '0376', '信阳市', '信阳', '河南,信阳', 'XinYang', 114.091023, 32.146983);
INSERT INTO `china_region` VALUES (403023, 2, 411500000000, 411501000000, '464000', '0376', '市辖区', '信阳', '河南,信阳', 'XinYang', 114.091023, 32.146983);
INSERT INTO `china_region` VALUES (403024, 2, 411500000000, 411502000000, '464031', '0376', '浉河区', '浉河', '河南,信阳,浉河', 'ShiHe', 114.058713, 32.116803);
INSERT INTO `china_region` VALUES (403312, 2, 411500000000, 411503000000, '464000', '0376', '平桥区', '平桥', '河南,信阳,平桥', 'PingQiao', 114.125656, 32.101031);
INSERT INTO `china_region` VALUES (403663, 2, 411500000000, 411521000000, '464200', '0376', '罗山县', '罗山', '河南,信阳,罗山', 'LuoShan', 114.513012, 32.203073);
INSERT INTO `china_region` VALUES (403991, 2, 411500000000, 411522000000, '465450', '0376', '光山县', '光山', '河南,信阳,光山', 'GuangShan', 114.919033, 32.011103);
INSERT INTO `china_region` VALUES (404371, 2, 411500000000, 411523000000, '465500', '0376', '新县', '新县', '河南,信阳,新县', 'XinXian', 114.879239, 31.643918);
INSERT INTO `china_region` VALUES (404594, 2, 411500000000, 411524000000, '465350', '0376', '商城县', '商城', '河南,信阳,商城', 'ShangCheng', 115.406862, 31.798378);
INSERT INTO `china_region` VALUES (404989, 2, 411500000000, 411525000000, '465200', '0376', '固始县', '固始', '河南,信阳,固始', 'GuShi', 115.654482, 32.168137);
INSERT INTO `china_region` VALUES (405679, 2, 411500000000, 411526000000, '465150', '0376', '潢川县', '潢川', '河南,信阳,潢川', 'HuangChuan', 115.051808, 32.131383);
INSERT INTO `china_region` VALUES (405996, 2, 411500000000, 411527000000, '464400', '0376', '淮滨县', '淮滨', '河南,信阳,淮滨', 'HuaiBin', 115.419538, 32.473258);
INSERT INTO `china_region` VALUES (406311, 2, 411500000000, 411528000000, '464300', '0376', '息县', '息县', '河南,信阳,息县', 'XiXian', 114.740456, 32.342792);
INSERT INTO `china_region` VALUES (406695, 2, 411500000000, 411571000000, '464044', '0376', '信阳高新技术产业开发区', '信阳高', '河南,信阳,信阳高', 'XinYangGao', 114.200063, 32.136468);
INSERT INTO `china_region` VALUES (406707, 1, 410000000000, 411600000000, '466000', '0394', '周口市', '周口', '河南,周口', 'ZhouKou', 114.696951, 33.626149);
INSERT INTO `china_region` VALUES (406708, 2, 411600000000, 411601000000, '466000', '0394', '市辖区', '周口', '河南,周口', 'ZhouKou', 114.696951, 33.626149);
INSERT INTO `china_region` VALUES (406709, 2, 411600000000, 411602000000, '466000', '0394', '川汇区', '川汇', '河南,周口,川汇', 'ChuanHui', 114.650628, 33.647598);
INSERT INTO `china_region` VALUES (406880, 2, 411600000000, 411603000000, '466700', '0394', '淮阳区', '淮阳', '河南,周口,淮阳', 'HuaiYang', 114.886154, 33.731561);
INSERT INTO `china_region` VALUES (407374, 2, 411600000000, 411621000000, '461300', '0394', '扶沟县', '扶沟', '河南,周口,扶沟', 'FuGou', 114.394915, 34.059862);
INSERT INTO `china_region` VALUES (407802, 2, 411600000000, 411622000000, '466600', '0394', '西华县', '西华', '河南,周口,西华', 'XiHua', 114.425451, 33.808682);
INSERT INTO `china_region` VALUES (408306, 2, 411600000000, 411623000000, '466100', '0394', '商水县', '商水', '河南,周口,商水', 'ShangShui', 114.611596, 33.54248);
INSERT INTO `china_region` VALUES (408926, 2, 411600000000, 411624000000, '466300', '0394', '沈丘县', '沈丘', '河南,周口,沈丘', 'ShenQiu', 115.098583, 33.409369);
INSERT INTO `china_region` VALUES (409522, 2, 411600000000, 411625000000, '477150', '0394', '郸城县', '郸城', '河南,周口,郸城', 'DanCheng', 115.177189, 33.644743);
INSERT INTO `china_region` VALUES (410068, 2, 411600000000, 411627000000, '475400', '0394', '太康县', '太康', '河南,周口,太康', 'TaiKang', 114.837887, 34.063798);
INSERT INTO `china_region` VALUES (410866, 2, 411600000000, 411628000000, '477200', '0394', '鹿邑县', '鹿邑', '河南,周口,鹿邑', 'LuYi', 115.484454, 33.86);
INSERT INTO `china_region` VALUES (411447, 2, 411600000000, 411671000000, '477163', '0394', '河南周口经济开发区', '河南周口经开区', '河南,周口,周口经开区', 'HeNanZhouKouJingKaiQu', 114.700242, 33.579163);
INSERT INTO `china_region` VALUES (411471, 2, 411600000000, 411681000000, '466200', '0394', '项城市', '项城', '河南,周口,项城', 'XiangCheng', 114.875333, 33.465838);
INSERT INTO `china_region` VALUES (411994, 1, 410000000000, 411700000000, '463000', '0396', '驻马店市', '驻马店', '河南,驻马店', 'ZhuMaDian', 114.022298, 33.011529);
INSERT INTO `china_region` VALUES (411995, 2, 411700000000, 411701000000, '463000', '0396', '市辖区', '驻马店', '河南,驻马店', 'ZhuMaDian', 114.022298, 33.011529);
INSERT INTO `china_region` VALUES (411996, 2, 411700000000, 411702000000, '463000', '0396', '驿城区', '驿城', '河南,驻马店,驿城', 'YiCheng', 113.993914, 32.973054);
INSERT INTO `china_region` VALUES (412223, 2, 411700000000, 411721000000, '463900', '0396', '西平县', '西平', '河南,驻马店,西平', 'XiPing', 114.021539, 33.387685);
INSERT INTO `china_region` VALUES (412530, 2, 411700000000, 411722000000, '463800', '0396', '上蔡县', '上蔡', '河南,驻马店,上蔡', 'ShangCai', 114.264381, 33.262439);
INSERT INTO `china_region` VALUES (413017, 2, 411700000000, 411723000000, '463400', '0396', '平舆县', '平舆', '河南,驻马店,平舆', 'PingYu', 114.619159, 32.96271);
INSERT INTO `china_region` VALUES (413261, 2, 411700000000, 411724000000, '463600', '0396', '正阳县', '正阳', '河南,驻马店,正阳', 'ZhengYang', 114.392774, 32.605697);
INSERT INTO `china_region` VALUES (413577, 2, 411700000000, 411725000000, '463200', '0396', '确山县', '确山', '河南,驻马店,确山', 'QueShan', 114.02643, 32.802065);
INSERT INTO `china_region` VALUES (413793, 2, 411700000000, 411726000000, '463700', '0396', '泌阳县', '泌阳', '河南,驻马店,泌阳', 'BiYang', 113.327144, 32.723975);
INSERT INTO `china_region` VALUES (414174, 2, 411700000000, 411727000000, '463300', '0396', '汝南县', '汝南', '河南,驻马店,汝南', 'RuNan', 114.362379, 33.006729);
INSERT INTO `china_region` VALUES (414474, 2, 411700000000, 411728000000, '463100', '0396', '遂平县', '遂平', '河南,驻马店,遂平', 'SuiPing', 114.013182, 33.145649);
INSERT INTO `china_region` VALUES (414697, 2, 411700000000, 411729000000, '463500', '0396', '新蔡县', '新蔡', '河南,驻马店,新蔡', 'XinCai', 114.920983, 32.81148);
INSERT INTO `china_region` VALUES (415080, 2, 411700000000, 411771000000, '463000', '0396', '河南驻马店经济开发区', '河南驻马店经开区', '河南,驻马店,驻马店经开区', 'HeNanZhuMaDianJingKaiQu', 114.022298, 33.011529);
INSERT INTO `china_region` VALUES (415109, 1, 410000000000, 419000000000, '450000', NULL, '直辖县', '河南', '河南', 'HeNan', 113.753602, 34.765515);
INSERT INTO `china_region` VALUES (415110, 2, 419000000000, 419001000000, '454650', NULL, '济源市', '济源', '河南,济源', 'JiYuan', 112.602344, 35.06903);
INSERT INTO `china_region` VALUES (415678, 0, 0, 420000000000, '0', NULL, '湖北省', '湖北', '湖北', 'HuBei', 114.341861, 30.546498);
INSERT INTO `china_region` VALUES (415679, 1, 420000000000, 420100000000, '430000', '027', '武汉市', '武汉', '湖北,武汉', 'WuHan', 114.305392, 30.593098);
INSERT INTO `china_region` VALUES (415680, 2, 420100000000, 420101000000, '430000', '027', '市辖区', '武汉', '湖北,武汉', 'WuHan', 114.305392, 30.593098);
INSERT INTO `china_region` VALUES (415681, 2, 420100000000, 420102000000, '430014', '027', '江岸区', '江岸', '湖北,武汉,江岸', 'JiangAn', 114.27876, 30.592688);
INSERT INTO `china_region` VALUES (415853, 2, 420100000000, 420103000000, '430000', '027', '江汉区', '江汉', '湖北,武汉,江汉', 'JiangHan', 114.270871, 30.60143);
INSERT INTO `china_region` VALUES (415980, 2, 420100000000, 420104000000, '430000', '027', '硚口区', '硚口', '湖北,武汉,硚口', 'QiaoKou', 114.26583, 30.571236);
INSERT INTO `china_region` VALUES (416133, 2, 420100000000, 420105000000, '430050', '027', '汉阳区', '汉阳', '湖北,武汉,汉阳', 'HanYang', 114.218724, 30.553905);
INSERT INTO `china_region` VALUES (416261, 2, 420100000000, 420106000000, '430000', '027', '武昌区', '武昌', '湖北,武汉,武昌', 'WuChang', 114.316223, 30.554235);
INSERT INTO `china_region` VALUES (416421, 2, 420100000000, 420107000000, '430080', '027', '青山区', '青山', '湖北,武汉,青山', 'QingShan', 114.385539, 30.63963);
INSERT INTO `china_region` VALUES (416540, 2, 420100000000, 420111000000, '430070', '027', '洪山区', '洪山', '湖北,武汉,洪山', 'HongShan', 114.343913, 30.500317);
INSERT INTO `china_region` VALUES (416872, 2, 420100000000, 420112000000, '430040', '027', '东西湖区', '东西湖', '湖北,武汉,东西湖', 'DongXiHu', 114.136886, 30.62002);
INSERT INTO `china_region` VALUES (417048, 2, 420100000000, 420113000000, '430090', '027', '汉南区', '汉南', '湖北,武汉,汉南', 'HanNan', 114.084445, 30.308856);
INSERT INTO `china_region` VALUES (417122, 2, 420100000000, 420114000000, '430100', '027', '蔡甸区', '蔡甸', '湖北,武汉,蔡甸', 'CaiDian', 114.029328, 30.582271);
INSERT INTO `china_region` VALUES (417546, 2, 420100000000, 420115000000, '430200', '027', '江夏区', '江夏', '湖北,武汉,江夏', 'JiangXia', 114.321551, 30.375748);
INSERT INTO `china_region` VALUES (417995, 2, 420100000000, 420116000000, '432200', '027', '黄陂区', '黄陂', '湖北,武汉,黄陂', 'HuangPo', 114.375743, 30.882557);
INSERT INTO `china_region` VALUES (418706, 2, 420100000000, 420117000000, '431400', '027', '新洲区', '新洲', '湖北,武汉,新洲', 'XinZhou', 114.801107, 30.841544);
INSERT INTO `china_region` VALUES (419384, 1, 420000000000, 420200000000, '435000', '0714', '黄石市', '黄石', '湖北,黄石', 'HuangShi', 115.03852, 30.199652);
INSERT INTO `china_region` VALUES (419385, 2, 420200000000, 420201000000, '435000', '0714', '市辖区', '黄石', '湖北,黄石', 'HuangShi', 115.03852, 30.199652);
INSERT INTO `china_region` VALUES (419386, 2, 420200000000, 420202000000, '435000', '0714', '黄石港区', '黄石港', '湖北,黄石,黄石港', 'HuangShiGang', 115.065978, 30.223003);
INSERT INTO `china_region` VALUES (419425, 2, 420200000000, 420203000000, '435000', '0714', '西塞山区', '西塞山', '湖北,黄石,西塞山', 'XiSaiShan', 115.109955, 30.204924);
INSERT INTO `china_region` VALUES (419470, 2, 420200000000, 420204000000, '435000', '0714', '下陆区', '下陆', '湖北,黄石,下陆', 'XiaLu', 114.961327, 30.173913);
INSERT INTO `china_region` VALUES (419514, 2, 420200000000, 420205000000, '435000', '0714', '铁山区', '铁山', '湖北,黄石,铁山', 'TieShan', 114.901412, 30.206592);
INSERT INTO `china_region` VALUES (419530, 2, 420200000000, 420222000000, '435200', '0714', '阳新县', '阳新', '湖北,黄石,阳新', 'YangXin', 115.215227, 29.830258);
INSERT INTO `china_region` VALUES (420024, 2, 420200000000, 420281000000, '435100', '0714', '大冶市', '大冶', '湖北,黄石,大冶', 'DaYe', 114.979875, 30.095643);
INSERT INTO `china_region` VALUES (420466, 1, 420000000000, 420300000000, '442000', '0719', '十堰市', '十堰', '湖北,十堰', 'ShiYan', 110.79799, 32.629397);
INSERT INTO `china_region` VALUES (420467, 2, 420300000000, 420301000000, '442000', '0719', '市辖区', '十堰', '湖北,十堰', 'ShiYan', 110.79799, 32.629397);
INSERT INTO `china_region` VALUES (420468, 2, 420300000000, 420302000000, '442000', '0719', '茅箭区', '茅箭', '湖北,十堰,茅箭', 'MaoJian', 110.813621, 32.591929);
INSERT INTO `china_region` VALUES (420556, 2, 420300000000, 420303000000, '442000', '0719', '张湾区', '张湾', '湖北,十堰,张湾', 'ZhangWan', 110.769133, 32.652297);
INSERT INTO `china_region` VALUES (420675, 2, 420300000000, 420304000000, '442599', '0719', '郧阳区', '郧阳', '湖北,十堰,郧阳', 'YunYang', 110.812044, 32.834802);
INSERT INTO `china_region` VALUES (421046, 2, 420300000000, 420322000000, '442600', '0719', '郧西县', '郧西', '湖北,十堰,郧西', 'YunXi', 110.425983, 32.993182);
INSERT INTO `china_region` VALUES (421353, 2, 420300000000, 420323000000, '442200', '0719', '竹山县', '竹山', '湖北,十堰,竹山', 'ZhuShan', 110.228694, 32.224875);
INSERT INTO `china_region` VALUES (421615, 2, 420300000000, 420324000000, '442300', '0719', '竹溪县', '竹溪', '湖北,十堰,竹溪', 'ZhuXi', 109.715304, 32.318255);
INSERT INTO `china_region` VALUES (421989, 2, 420300000000, 420325000000, '442100', '0719', '房县', '房县', '湖北,十堰,房县', 'FangXian', 110.72667, 32.040085);
INSERT INTO `china_region` VALUES (422315, 2, 420300000000, 420381000000, '442700', '0719', '丹江口市', '丹江口', '湖北,十堰,丹江口', 'DanJiangKou', 111.513127, 32.540157);
INSERT INTO `china_region` VALUES (422607, 1, 420000000000, 420500000000, '443000', '0717', '宜昌市', '宜昌', '湖北,宜昌', 'YiChang', 111.286471, 30.691967);
INSERT INTO `china_region` VALUES (422608, 2, 420500000000, 420501000000, '443000', '0717', '市辖区', '宜昌', '湖北,宜昌', 'YiChang', 111.286471, 30.691967);
INSERT INTO `china_region` VALUES (422609, 2, 420500000000, 420502000000, '443000', '0717', '西陵区', '西陵', '湖北,宜昌,西陵', 'XiLing', 111.285646, 30.710782);
INSERT INTO `china_region` VALUES (422717, 2, 420500000000, 420503000000, '443000', '0717', '伍家岗区', '伍家岗', '湖北,宜昌,伍家岗', 'WuJiaGang', 111.361037, 30.644334);
INSERT INTO `china_region` VALUES (422784, 2, 420500000000, 420504000000, '443000', '0717', '点军区', '点军', '湖北,宜昌,点军', 'DianJun', 111.26812, 30.693247);
INSERT INTO `china_region` VALUES (422843, 2, 420500000000, 420505000000, '443000', '0717', '猇亭区', '猇亭', '湖北,宜昌,猇亭', 'XiaoTing', 111.43462, 30.530903);
INSERT INTO `china_region` VALUES (422873, 2, 420500000000, 420506000000, '443100', '0717', '夷陵区', '夷陵', '湖北,宜昌,夷陵', 'YiLing', 111.32638, 30.770006);
INSERT INTO `china_region` VALUES (423092, 2, 420500000000, 420525000000, '444200', '0717', '远安县', '远安', '湖北,宜昌,远安', 'YuanAn', 111.640508, 31.060869);
INSERT INTO `china_region` VALUES (423217, 2, 420500000000, 420526000000, '443700', '0717', '兴山县', '兴山', '湖北,宜昌,兴山', 'XingShan', 110.746805, 31.348196);
INSERT INTO `china_region` VALUES (423322, 2, 420500000000, 420527000000, '443600', '0717', '秭归县', '秭归', '湖北,宜昌,秭归', 'ZiGui', 110.977711, 30.825897);
INSERT INTO `china_region` VALUES (423529, 2, 420500000000, 420528000000, '443500', '0717', '长阳土家族自治县', '长阳', '湖北,宜昌,长阳', 'ChangYang', 111.207242, 30.472763);
INSERT INTO `china_region` VALUES (423706, 2, 420500000000, 420529000000, '443400', '0717', '五峰土家族自治县', '五峰', '湖北,宜昌,五峰', 'WuFeng', 110.674706, 30.199688);
INSERT INTO `china_region` VALUES (423823, 2, 420500000000, 420581000000, '443000', '0717', '宜都市', '宜都', '湖北,宜昌,宜都', 'YiDu', 111.450006, 30.378327);
INSERT INTO `china_region` VALUES (423990, 2, 420500000000, 420582000000, '444100', '0717', '当阳市', '当阳', '湖北,宜昌,当阳', 'DangYang', 111.788312, 30.821266);
INSERT INTO `china_region` VALUES (424174, 2, 420500000000, 420583000000, '443200', '0717', '枝江市', '枝江', '湖北,宜昌,枝江', 'ZhiJiang', 111.76053, 30.42594);
INSERT INTO `china_region` VALUES (424402, 1, 420000000000, 420600000000, '441000', '0710', '襄阳市', '襄阳', '湖北,襄阳', 'XiangYang', 112.122414, 32.008986);
INSERT INTO `china_region` VALUES (424403, 2, 420600000000, 420601000000, '441000', '0710', '市辖区', '襄阳', '湖北,襄阳', 'XiangYang', 112.122414, 32.008986);
INSERT INTO `china_region` VALUES (424404, 2, 420600000000, 420602000000, '441000', '0710', '襄城区', '襄城', '湖北,襄阳,襄城', 'XiangCheng', 112.133974, 32.010351);
INSERT INTO `china_region` VALUES (424588, 2, 420600000000, 420606000000, '441000', '0710', '樊城区', '樊城', '湖北,襄阳,樊城', 'FanCheng', 112.135684, 32.044833);
INSERT INTO `china_region` VALUES (424815, 2, 420600000000, 420607000000, '441108', '0710', '襄州区', '襄州', '湖北,襄阳,襄州', 'XiangZhou', 112.211899, 32.087298);
INSERT INTO `china_region` VALUES (425315, 2, 420600000000, 420624000000, '441500', '0710', '南漳县', '南漳', '湖北,襄阳,南漳', 'NanZhang', 111.838905, 31.774636);
INSERT INTO `china_region` VALUES (425630, 2, 420600000000, 420625000000, '441700', '0710', '谷城县', '谷城', '湖北,襄阳,谷城', 'GuCheng', 111.652982, 32.263849);
INSERT INTO `china_region` VALUES (425932, 2, 420600000000, 420626000000, '441600', '0710', '保康县', '保康', '湖北,襄阳,保康', 'BaoKang', 111.261309, 31.87831);
INSERT INTO `china_region` VALUES (426222, 2, 420600000000, 420682000000, '441800', '0710', '老河口市', '老河口', '湖北,襄阳,老河口', 'LaoHeKou', 111.683861, 32.359068);
INSERT INTO `china_region` VALUES (426495, 2, 420600000000, 420683000000, '441200', '0710', '枣阳市', '枣阳', '湖北,襄阳,枣阳', 'ZaoYang', 112.771959, 32.128818);
INSERT INTO `china_region` VALUES (427073, 2, 420600000000, 420684000000, '441400', '0710', '宜城市', '宜城', '湖北,襄阳,宜城', 'YiCheng', 112.257788, 31.719806);
INSERT INTO `china_region` VALUES (427329, 1, 420000000000, 420700000000, '436000', '0711', '鄂州市', '鄂州', '湖北,鄂州', 'EZhou', 114.894843, 30.39194);
INSERT INTO `china_region` VALUES (427330, 2, 420700000000, 420701000000, '436000', '0711', '市辖区', '鄂州', '湖北,鄂州', 'EZhou', 114.894843, 30.39194);
INSERT INTO `china_region` VALUES (427331, 2, 420700000000, 420702000000, '436000', '0711', '梁子湖区', '梁子湖', '湖北,鄂州,梁子湖', 'LiangZiHu', 114.684731, 30.100141);
INSERT INTO `china_region` VALUES (427425, 2, 420700000000, 420703000000, '436000', '0711', '华容区', '华容', '湖北,鄂州,华容', 'HuaRong', 114.729878, 30.53431);
INSERT INTO `china_region` VALUES (427545, 2, 420700000000, 420704000000, '436000', '0711', '鄂城区', '鄂城', '湖北,鄂州,鄂城', 'ECheng', 114.891615, 30.400572);
INSERT INTO `china_region` VALUES (427728, 1, 420000000000, 420800000000, '448000', '0724', '荆门市', '荆门', '湖北,荆门', 'JingMen', 112.199265, 31.035423);
INSERT INTO `china_region` VALUES (427729, 2, 420800000000, 420801000000, '448000', '0724', '市辖区', '荆门', '湖北,荆门', 'JingMen', 112.199265, 31.035423);
INSERT INTO `china_region` VALUES (427730, 2, 420800000000, 420802000000, '448000', '0724', '东宝区', '东宝', '湖北,荆门,东宝', 'DongBao', 112.201493, 31.051852);
INSERT INTO `china_region` VALUES (427951, 2, 420800000000, 420804000000, '448000', '0724', '掇刀区', '掇刀', '湖北,荆门,掇刀', 'DuoDao', 112.207833, 30.973431);
INSERT INTO `china_region` VALUES (428087, 2, 420800000000, 420822000000, '448200', '0724', '沙洋县', '沙洋', '湖北,荆门,沙洋', 'ShaYang', 112.588581, 30.709221);
INSERT INTO `china_region` VALUES (428397, 2, 420800000000, 420881000000, '431900', '0724', '钟祥市', '钟祥', '湖北,荆门,钟祥', 'ZhongXiang', 112.588121, 31.16782);
INSERT INTO `china_region` VALUES (429003, 2, 420800000000, 420882000000, '431800', '0724', '京山市', '京山', '湖北,荆门,京山', 'JingShan', 113.119566, 31.018457);
INSERT INTO `china_region` VALUES (429445, 1, 420000000000, 420900000000, '432000', '0712', '孝感市', '孝感', '湖北,孝感', 'XiaoGan', 113.916902, 30.924568);
INSERT INTO `china_region` VALUES (429446, 2, 420900000000, 420901000000, '432000', '0712', '市辖区', '孝感', '湖北,孝感', 'XiaoGan', 113.916902, 30.924568);
INSERT INTO `china_region` VALUES (429447, 2, 420900000000, 420902000000, '432100', '0712', '孝南区', '孝南', '湖北,孝感,孝南', 'XiaoNan', 113.910958, 30.916874);
INSERT INTO `china_region` VALUES (429778, 2, 420900000000, 420921000000, '432900', '0712', '孝昌县', '孝昌', '湖北,孝感,孝昌', 'XiaoChang', 113.99801, 31.258159);
INSERT INTO `china_region` VALUES (430250, 2, 420900000000, 420922000000, '432800', '0712', '大悟县', '大悟', '湖北,孝感,大悟', 'DaWu', 114.127022, 31.561165);
INSERT INTO `china_region` VALUES (430642, 2, 420900000000, 420923000000, '432500', '0712', '云梦县', '云梦', '湖北,孝感,云梦', 'YunMeng', 113.753554, 31.020983);
INSERT INTO `china_region` VALUES (430952, 2, 420900000000, 420981000000, '432400', '0712', '应城市', '应城', '湖北,孝感,应城', 'YingCheng', 113.562806, 30.940176);
INSERT INTO `china_region` VALUES (431386, 2, 420900000000, 420982000000, '432600', '0712', '安陆市', '安陆', '湖北,孝感,安陆', 'AnLu', 113.688941, 31.25561);
INSERT INTO `china_region` VALUES (431799, 2, 420900000000, 420984000000, '432300', '0712', '汉川市', '汉川', '湖北,孝感,汉川', 'HanChuan', 113.839149, 30.661244);
INSERT INTO `china_region` VALUES (432363, 1, 420000000000, 421000000000, '434000', '0716', '荆州市', '荆州', '湖北,荆州', 'JingZhou', 112.239741, 30.335165);
INSERT INTO `china_region` VALUES (432364, 2, 421000000000, 421001000000, '434000', '0716', '市辖区', '荆州', '湖北,荆州', 'JingZhou', 112.239741, 30.335165);
INSERT INTO `china_region` VALUES (432365, 2, 421000000000, 421002000000, '434000', '0716', '沙市区', '沙市', '湖北,荆州,沙市', 'ShaShi', 112.255583, 30.311056);
INSERT INTO `china_region` VALUES (432483, 2, 421000000000, 421003000000, '434020', '0716', '荆州区', '荆州', '湖北,荆州', 'JingZhou', 112.190185, 30.352832);
INSERT INTO `china_region` VALUES (432671, 2, 421000000000, 421022000000, '434300', '0716', '公安县', '公安', '湖北,荆州,公安', 'GongAn', 112.229648, 30.058336);
INSERT INTO `china_region` VALUES (433011, 2, 421000000000, 421023000000, '433300', '0716', '监利县', '监利', '湖北,荆州,监利', 'JianLi', 112.897465, 29.811574);
INSERT INTO `china_region` VALUES (433440, 2, 421000000000, 421024000000, '434100', '0716', '江陵县', '江陵', '湖北,荆州,江陵', 'JiangLing', 112.424664, 30.041822);
INSERT INTO `china_region` VALUES (433588, 2, 421000000000, 421071000000, '433213', '0716', '荆州经济技术开发区', '荆州经开区', '湖北,荆州,荆州经开区', 'JingZhouJingKaiQu', 112.190185, 30.352832);
INSERT INTO `china_region` VALUES (433657, 2, 421000000000, 421081000000, '434400', '0716', '石首市', '石首', '湖北,荆州,石首', 'ShiShou', 112.425454, 29.720938);
INSERT INTO `china_region` VALUES (433877, 2, 421000000000, 421083000000, '433200', '0716', '洪湖市', '洪湖', '湖北,荆州,洪湖', 'HongHu', 113.47598, 29.825458);
INSERT INTO `china_region` VALUES (434198, 2, 421000000000, 421087000000, '434200', '0716', '松滋市', '松滋', '湖北,荆州,松滋', 'SongZi', 111.756773, 30.174522);
INSERT INTO `china_region` VALUES (434493, 1, 420000000000, 421100000000, '438000', '0713', '黄冈市', '黄冈', '湖北,黄冈', 'HuangGang', 114.872316, 30.453905);
INSERT INTO `china_region` VALUES (434494, 2, 421100000000, 421101000000, '438000', '0713', '市辖区', '黄冈', '湖北,黄冈', 'HuangGang', 114.872316, 30.453905);
INSERT INTO `china_region` VALUES (434495, 2, 421100000000, 421102000000, '438000', '0713', '黄州区', '黄州', '湖北,黄冈,黄州', 'HuangZhou', 114.879398, 30.43405);
INSERT INTO `china_region` VALUES (434651, 2, 421100000000, 421121000000, '438000', '0713', '团风县', '团风', '湖北,黄冈,团风', 'TuanFeng', 114.872191, 30.643569);
INSERT INTO `china_region` VALUES (434964, 2, 421100000000, 421122000000, '438400', '0713', '红安县', '红安', '湖北,黄冈,红安', 'HongAn', 114.618236, 31.288153);
INSERT INTO `china_region` VALUES (435404, 2, 421100000000, 421123000000, '438600', '0713', '罗田县', '罗田', '湖北,黄冈,罗田', 'LuoTian', 115.399492, 30.7831);
INSERT INTO `china_region` VALUES (435877, 2, 421100000000, 421124000000, '438700', '0713', '英山县', '英山', '湖北,黄冈,英山', 'YingShan', 115.681259, 30.734959);
INSERT INTO `china_region` VALUES (436214, 2, 421100000000, 421125000000, '438200', '0713', '浠水县', '浠水', '湖北,黄冈,浠水', 'XiShui', 115.265535, 30.451867);
INSERT INTO `china_region` VALUES (436903, 2, 421100000000, 421126000000, '435300', '0713', '蕲春县', '蕲春', '湖北,黄冈,蕲春', 'QiChun', 115.437008, 30.225964);
INSERT INTO `china_region` VALUES (437508, 2, 421100000000, 421127000000, '435500', '0713', '黄梅县', '黄梅', '湖北,黄冈,黄梅', 'HuangMei', 115.944219, 30.070454);
INSERT INTO `china_region` VALUES (438035, 2, 421100000000, 421171000000, '435503', '0713', '龙感湖管理区', '龙感湖管理', '湖北,黄冈,龙感湖管理', 'LongGanHuGuanLi', 115.11924, 30.24825);
INSERT INTO `china_region` VALUES (438106, 2, 421100000000, 421181000000, '438300', '0713', '麻城市', '麻城', '湖北,黄冈,麻城', 'MaCheng', 115.008163, 31.17274);
INSERT INTO `china_region` VALUES (438604, 2, 421100000000, 421182000000, '435400', '0713', '武穴市', '武穴', '湖北,黄冈,武穴', 'WuXue', 115.561217, 29.844107);
INSERT INTO `china_region` VALUES (438960, 1, 420000000000, 421200000000, '437000', '0715', '咸宁市', '咸宁', '湖北,咸宁', 'XianNing', 114.322492, 29.841443);
INSERT INTO `china_region` VALUES (438961, 2, 421200000000, 421201000000, '437000', '0715', '市辖区', '咸宁', '湖北,咸宁', 'XianNing', 114.322492, 29.841443);
INSERT INTO `china_region` VALUES (438962, 2, 421200000000, 421202000000, '437000', '0715', '咸安区', '咸安', '湖北,咸宁,咸安', 'XianAn', 114.298711, 29.852892);
INSERT INTO `china_region` VALUES (439175, 2, 421200000000, 421221000000, '437200', '0715', '嘉鱼县', '嘉鱼', '湖北,咸宁,嘉鱼', 'JiaYu', 113.939277, 29.970737);
INSERT INTO `china_region` VALUES (439290, 2, 421200000000, 421222000000, '437400', '0715', '通城县', '通城', '湖北,咸宁,通城', 'TongCheng', 113.816966, 29.245269);
INSERT INTO `china_region` VALUES (439496, 2, 421200000000, 421223000000, '437500', '0715', '崇阳县', '崇阳', '湖北,咸宁,崇阳', 'ChongYang', 114.039828, 29.555605);
INSERT INTO `china_region` VALUES (439716, 2, 421200000000, 421224000000, '437600', '0715', '通山县', '通山', '湖北,咸宁,通山', 'TongShan', 114.482606, 29.605376);
INSERT INTO `china_region` VALUES (439937, 2, 421200000000, 421281000000, '437300', '0715', '赤壁市', '赤壁', '湖北,咸宁,赤壁', 'ChiBi', 113.900628, 29.724692);
INSERT INTO `china_region` VALUES (440142, 1, 420000000000, 421300000000, '441300', '0722', '随州市', '随州', '湖北,随州', 'SuiZhou', 113.382458, 31.690215);
INSERT INTO `china_region` VALUES (440143, 2, 421300000000, 421301000000, '441300', '0722', '市辖区', '随州', '湖北,随州', 'SuiZhou', 113.382458, 31.690215);
INSERT INTO `china_region` VALUES (440144, 2, 421300000000, 421303000000, '441300', '0722', '曾都区', '曾都', '湖北,随州,曾都', 'ZengDu', 113.371121, 31.71628);
INSERT INTO `china_region` VALUES (440363, 2, 421300000000, 421321000000, '441304', '0722', '随县', '随县', '湖北,随州,随县', 'SuiXian', 113.299528, 31.853833);
INSERT INTO `china_region` VALUES (440777, 2, 421300000000, 421381000000, '432700', '0722', '广水市', '广水', '湖北,随州,广水', 'GuangShui', 113.82589, 31.616854);
INSERT INTO `china_region` VALUES (441199, 1, 420000000000, 422800000000, '445000', '0718', '恩施土家族苗族自治州', '恩施', '湖北,恩施', 'EnShi', 109.488172, 30.272156);
INSERT INTO `china_region` VALUES (441200, 2, 422800000000, 422801000000, '445000', '0718', '恩施市', '恩施', '湖北,恩施', 'EnShi', 109.488172, 30.272156);
INSERT INTO `china_region` VALUES (441426, 2, 422800000000, 422802000000, '445400', '0718', '利川市', '利川', '湖北,恩施,利川', 'LiChuan', 108.909996, 30.210981);
INSERT INTO `china_region` VALUES (442026, 2, 422800000000, 422822000000, '445300', '0718', '建始县', '建始', '湖北,恩施,建始', 'JianShi', 109.718202, 30.596727);
INSERT INTO `china_region` VALUES (442447, 2, 422800000000, 422823000000, '444300', '0718', '巴东县', '巴东', '湖北,恩施,巴东', 'BaDong', 110.340756, 31.042324);
INSERT INTO `china_region` VALUES (442782, 2, 422800000000, 422825000000, '445500', '0718', '宣恩县', '宣恩', '湖北,恩施,宣恩', 'XuanEn', 109.491485, 29.986899);
INSERT INTO `china_region` VALUES (443076, 2, 422800000000, 422826000000, '445600', '0718', '咸丰县', '咸丰', '湖北,恩施,咸丰', 'XianFeng', 109.139726, 29.665203);
INSERT INTO `china_region` VALUES (443366, 2, 422800000000, 422827000000, '445700', '0718', '来凤县', '来凤', '湖北,恩施,来凤', 'LaiFeng', 109.407828, 29.493485);
INSERT INTO `china_region` VALUES (443571, 2, 422800000000, 422828000000, '445800', '0718', '鹤峰县', '鹤峰', '湖北,恩施,鹤峰', 'HeFeng', 110.033662, 29.890171);
INSERT INTO `china_region` VALUES (443799, 1, 420000000000, 429000000000, '430000', NULL, '直辖县', '湖北', '湖北', 'HuBei', 114.341861, 30.546498);
INSERT INTO `china_region` VALUES (443800, 2, 429000000000, 429004000000, '433000', NULL, '仙桃市', '仙桃', '湖北,仙桃', 'XianTao', 113.442973, 30.328407);
INSERT INTO `china_region` VALUES (444586, 2, 429000000000, 429005000000, '433100', NULL, '潜江市', '潜江', '湖北,潜江', 'QianJiang', 112.900287, 30.401947);
INSERT INTO `china_region` VALUES (445085, 2, 429000000000, 429006000000, '431700', NULL, '天门市', '天门', '湖北,天门', 'TianMen', 113.166558, 30.66372);
INSERT INTO `china_region` VALUES (445746, 2, 429000000000, 429021000000, '442400', NULL, '神农架林区', '神农架林', '湖北,神农架林', 'ShenNongJiaLin', 110.675757, 31.744897);
INSERT INTO `china_region` VALUES (445835, 0, 0, 430000000000, '0', NULL, '湖南省', '湖南', '湖南', 'HuNan', 112.98381, 28.112444);
INSERT INTO `china_region` VALUES (445836, 1, 430000000000, 430100000000, '410000', '0731', '长沙市', '长沙', '湖南,长沙', 'ChangSha', 112.938814, 28.228209);
INSERT INTO `china_region` VALUES (445837, 2, 430100000000, 430101000000, '410000', '0731', '市辖区', '长沙', '湖南,长沙', 'ChangSha', 112.938814, 28.228209);
INSERT INTO `china_region` VALUES (445838, 2, 430100000000, 430102000000, '410000', '0731', '芙蓉区', '芙蓉', '湖南,长沙,芙蓉', 'FuRong', 113.032539, 28.185386);
INSERT INTO `china_region` VALUES (445935, 2, 430100000000, 430103000000, '410000', '0731', '天心区', '天心', '湖南,长沙,天心', 'TianXin', 112.989855, 28.112525);
INSERT INTO `china_region` VALUES (446043, 2, 430100000000, 430104000000, '410000', '0731', '岳麓区', '岳麓', '湖南,长沙,岳麓', 'YueLu', 112.93142, 28.235193);
INSERT INTO `china_region` VALUES (446242, 2, 430100000000, 430105000000, '410000', '0731', '开福区', '开福', '湖南,长沙,开福', 'KaiFu', 112.9842, 28.205628);
INSERT INTO `china_region` VALUES (446366, 2, 430100000000, 430111000000, '410116', '0731', '雨花区', '雨花', '湖南,长沙,雨花', 'YuHua', 113.038017, 28.13771);
INSERT INTO `china_region` VALUES (446537, 2, 430100000000, 430112000000, '410205', '0731', '望城区', '望城', '湖南,长沙,望城', 'WangCheng', 112.819549, 28.347458);
INSERT INTO `china_region` VALUES (446703, 2, 430100000000, 430121000000, '410100', '0731', '长沙县', '长沙', '湖南,长沙', 'ChangSha', 113.08081, 28.24615);
INSERT INTO `china_region` VALUES (446925, 2, 430100000000, 430181000000, '410300', '0731', '浏阳市', '浏阳', '湖南,长沙,浏阳', 'LiuYang', 113.643076, 28.162833);
INSERT INTO `china_region` VALUES (447281, 2, 430100000000, 430182000000, '410600', '0731', '宁乡市', '宁乡', '湖南,长沙,宁乡', 'NingXiang', 112.551885, 28.277483);
INSERT INTO `china_region` VALUES (447589, 1, 430000000000, 430200000000, '412000', '0733', '株洲市', '株洲', '湖南,株洲', 'ZhuZhou', 113.134002, 27.82755);
INSERT INTO `china_region` VALUES (447590, 2, 430200000000, 430201000000, '412000', '0733', '市辖区', '株洲', '湖南,株洲', 'ZhuZhou', 113.134002, 27.82755);
INSERT INTO `china_region` VALUES (447591, 2, 430200000000, 430202000000, '412000', '0733', '荷塘区', '荷塘', '湖南,株洲,荷塘', 'HeTang', 113.173487, 27.855929);
INSERT INTO `china_region` VALUES (447659, 2, 430200000000, 430203000000, '412000', '0733', '芦淞区', '芦淞', '湖南,株洲,芦淞', 'LuSong', 113.152724, 27.78507);
INSERT INTO `china_region` VALUES (447748, 2, 430200000000, 430204000000, '412000', '0733', '石峰区', '石峰', '湖南,株洲,石峰', 'ShiFeng', 113.117732, 27.875445);
INSERT INTO `china_region` VALUES (447799, 2, 430200000000, 430211000000, '412000', '0733', '天元区', '天元', '湖南,株洲,天元', 'TianYuan', 113.082216, 27.826867);
INSERT INTO `china_region` VALUES (447907, 2, 430200000000, 430212000000, '412199', '0733', '渌口区', '渌口', '湖南,株洲,渌口', 'LuKou', 113.139967, 27.702526);
INSERT INTO `china_region` VALUES (448055, 2, 430200000000, 430223000000, '412300', '0733', '攸县', '攸县', '湖南,株洲,攸县', 'YouXian', 113.396404, 27.014607);
INSERT INTO `china_region` VALUES (448374, 2, 430200000000, 430224000000, '412400', '0733', '茶陵县', '茶陵', '湖南,株洲,茶陵', 'ChaLing', 113.53928, 26.777492);
INSERT INTO `china_region` VALUES (448639, 2, 430200000000, 430225000000, '412500', '0733', '炎陵县', '炎陵', '湖南,株洲,炎陵', 'YanLing', 113.772655, 26.489902);
INSERT INTO `china_region` VALUES (448783, 2, 430200000000, 430271000000, '411228', '0733', '云龙示范区', '云龙示范', '湖南,株洲,云龙示范', 'YunLongShiFan', 113.160642, 27.903426);
INSERT INTO `china_region` VALUES (448809, 2, 430200000000, 430281000000, '412200', '0733', '醴陵市', '醴陵', '湖南,株洲,醴陵', 'LiLing', 113.496894, 27.64613);
INSERT INTO `china_region` VALUES (449105, 1, 430000000000, 430300000000, '411100', '0732', '湘潭市', '湘潭', '湖南,湘潭', 'XiangTan', 112.944049, 27.829738);
INSERT INTO `china_region` VALUES (449106, 2, 430300000000, 430301000000, '411100', '0732', '市辖区', '湘潭', '湖南,湘潭', 'XiangTan', 112.944049, 27.829738);
INSERT INTO `china_region` VALUES (449107, 2, 430300000000, 430302000000, '411100', '0732', '雨湖区', '雨湖', '湖南,湘潭,雨湖', 'YuHu', 112.903317, 27.854705);
INSERT INTO `china_region` VALUES (449230, 2, 430300000000, 430304000000, '411100', '0732', '岳塘区', '岳塘', '湖南,湘潭,岳塘', 'YueTang', 112.925371, 27.808646);
INSERT INTO `china_region` VALUES (449301, 2, 430300000000, 430321000000, '411200', '0732', '湘潭县', '湘潭', '湖南,湘潭', 'XiangTan', 112.950781, 27.778947);
INSERT INTO `china_region` VALUES (449674, 2, 430300000000, 430371000000, '411218', '0732', '湖南湘潭高新技术产业园区', '湖南湘潭高', '湖南,湘潭,湘潭高', 'HuNanXiangTanGao', 112.930823, 27.837866);
INSERT INTO `china_region` VALUES (449695, 2, 430300000000, 430372000000, '411103', '0732', '湘潭昭山示范区', '湘潭昭山示范', '湖南,湘潭,湘潭昭山示范', 'XiangTanZhaoShanShiFan', 113.027582, 27.951734);
INSERT INTO `china_region` VALUES (449712, 2, 430300000000, 430373000000, '411201', '0732', '湘潭九华示范区', '湘潭九华示范', '湖南,湘潭,湘潭九华示范', 'XiangTanJiuHuaShiFan', 112.938824, 27.933767);
INSERT INTO `china_region` VALUES (449742, 2, 430300000000, 430381000000, '411400', '0732', '湘乡市', '湘乡', '湖南,湘潭,湘乡', 'XiangXiang', 112.550581, 27.718313);
INSERT INTO `china_region` VALUES (450113, 2, 430300000000, 430382000000, '411300', '0732', '韶山市', '韶山', '湖南,湘潭,韶山', 'ShaoShan', 112.52667, 27.914958);
INSERT INTO `china_region` VALUES (450156, 1, 430000000000, 430400000000, '421000', '0734', '衡阳市', '衡阳', '湖南,衡阳', 'HengYang', 112.571997, 26.89323);
INSERT INTO `china_region` VALUES (450157, 2, 430400000000, 430401000000, '421000', '0734', '市辖区', '衡阳', '湖南,衡阳', 'HengYang', 112.571997, 26.89323);
INSERT INTO `china_region` VALUES (450158, 2, 430400000000, 430405000000, '421000', '0734', '珠晖区', '珠晖', '湖南,衡阳,珠晖', 'ZhuHui', 112.620112, 26.894657);
INSERT INTO `china_region` VALUES (450243, 2, 430400000000, 430406000000, '421000', '0734', '雁峰区', '雁峰', '湖南,衡阳,雁峰', 'YanFeng', 112.571997, 26.89323);
INSERT INTO `china_region` VALUES (450302, 2, 430400000000, 430407000000, '421000', '0734', '石鼓区', '石鼓', '湖南,衡阳,石鼓', 'ShiGu', 112.598089, 26.943215);
INSERT INTO `china_region` VALUES (450358, 2, 430400000000, 430408000000, '421000', '0734', '蒸湘区', '蒸湘', '湖南,衡阳,蒸湘', 'ZhengXiang', 112.567064, 26.911404);
INSERT INTO `china_region` VALUES (450416, 2, 430400000000, 430412000000, '421000', '0734', '南岳区', '南岳', '湖南,衡阳,南岳', 'NanYue', 112.738604, 27.232444);
INSERT INTO `china_region` VALUES (450445, 2, 430400000000, 430421000000, '421200', '0734', '衡阳县', '衡阳', '湖南,衡阳', 'HengYang', 112.370532, 26.969635);
INSERT INTO `china_region` VALUES (450962, 2, 430400000000, 430422000000, '421100', '0734', '衡南县', '衡南', '湖南,衡阳,衡南', 'HengNan', 112.677877, 26.738248);
INSERT INTO `china_region` VALUES (451433, 2, 430400000000, 430423000000, '421300', '0734', '衡山县', '衡山', '湖南,衡阳,衡山', 'HengShan', 112.868268, 27.230291);
INSERT INTO `china_region` VALUES (451599, 2, 430400000000, 430424000000, '421400', '0734', '衡东县', '衡东', '湖南,衡阳,衡东', 'HengDong', 112.953168, 27.08117);
INSERT INTO `china_region` VALUES (451875, 2, 430400000000, 430426000000, '421600', '0734', '祁东县', '祁东', '湖南,衡阳,祁东', 'QiDong', 112.090357, 26.799896);
INSERT INTO `china_region` VALUES (452267, 2, 430400000000, 430471000000, '421522', '0734', '衡阳综合保税区', '衡阳保税', '湖南,衡阳,衡阳保税', 'HengYangBaoShui', 112.370532, 26.969635);
INSERT INTO `china_region` VALUES (452272, 2, 430400000000, 430472000000, '421238', '0734', '湖南衡阳高新技术产业园区', '湖南衡阳高', '湖南,衡阳,衡阳高', 'HuNanHengYangGao', 112.571997, 26.89323);
INSERT INTO `china_region` VALUES (452294, 2, 430400000000, 430473000000, '421241', '0734', '湖南衡阳松木经济开发区', '湖南衡阳松木经开区', '湖南,衡阳,衡阳松木经开区', 'HuNanHengYangSongMuJingKaiQu', 112.622443, 26.963646);
INSERT INTO `china_region` VALUES (452303, 2, 430400000000, 430481000000, '421800', '0734', '耒阳市', '耒阳', '湖南,衡阳,耒阳', 'LeiYang', 112.859795, 26.422275);
INSERT INTO `china_region` VALUES (452712, 2, 430400000000, 430482000000, '421500', '0734', '常宁市', '常宁', '湖南,衡阳,常宁', 'ChangNing', 112.399995, 26.420932);
INSERT INTO `china_region` VALUES (453143, 1, 430000000000, 430500000000, '422000', '0739', '邵阳市', '邵阳', '湖南,邵阳', 'ShaoYang', 111.467791, 27.238892);
INSERT INTO `china_region` VALUES (453144, 2, 430500000000, 430501000000, '422000', '0739', '市辖区', '邵阳', '湖南,邵阳', 'ShaoYang', 111.467791, 27.238892);
INSERT INTO `china_region` VALUES (453145, 2, 430500000000, 430502000000, '422000', '0739', '双清区', '双清', '湖南,邵阳,双清', 'ShuangQing', 111.496341, 27.232708);
INSERT INTO `china_region` VALUES (453249, 2, 430500000000, 430503000000, '422000', '0739', '大祥区', '大祥', '湖南,邵阳,大祥', 'DaXiang', 111.439091, 27.221452);
INSERT INTO `china_region` VALUES (453362, 2, 430500000000, 430511000000, '422000', '0739', '北塔区', '北塔', '湖南,邵阳,北塔', 'BeiTa', 111.452197, 27.246489);
INSERT INTO `china_region` VALUES (453409, 2, 430500000000, 430522000000, '422900', '0739', '新邵县', '新邵', '湖南,邵阳,新邵', 'XinShao', 111.458657, 27.320918);
INSERT INTO `china_region` VALUES (453842, 2, 430500000000, 430523000000, '422100', '0739', '邵阳县', '邵阳', '湖南,邵阳', 'ShaoYang', 111.273806, 26.990637);
INSERT INTO `china_region` VALUES (454299, 2, 430500000000, 430524000000, '422200', '0739', '隆回县', '隆回', '湖南,邵阳,隆回', 'LongHui', 111.032438, 27.113978);
INSERT INTO `china_region` VALUES (454897, 2, 430500000000, 430525000000, '422300', '0739', '洞口县', '洞口', '湖南,邵阳,洞口', 'DongKou', 110.575846, 27.060321);
INSERT INTO `china_region` VALUES (455286, 2, 430500000000, 430527000000, '422600', '0739', '绥宁县', '绥宁', '湖南,邵阳,绥宁', 'SuiNing', 110.155655, 26.581955);
INSERT INTO `china_region` VALUES (455546, 2, 430500000000, 430528000000, '422700', '0739', '新宁县', '新宁', '湖南,邵阳,新宁', 'XinNing', 110.856623, 26.433418);
INSERT INTO `china_region` VALUES (455889, 2, 430500000000, 430529000000, '422500', '0739', '城步苗族自治县', '城步', '湖南,邵阳,城步', 'ChengBu', 110.32224, 26.390598);
INSERT INTO `china_region` VALUES (456096, 2, 430500000000, 430581000000, '422400', '0739', '武冈市', '武冈', '湖南,邵阳,武冈', 'WuGang', 110.631884, 26.726599);
INSERT INTO `china_region` VALUES (456430, 2, 430500000000, 430582000000, '422800', '0739', '邵东市', '邵东', '湖南,邵阳,邵东', 'ShaoDong', 111.744258, 27.258942);
INSERT INTO `china_region` VALUES (457035, 1, 430000000000, 430600000000, '414000', '0730', '岳阳市', '岳阳', '湖南,岳阳', 'YueYang', 113.128958, 29.357104);
INSERT INTO `china_region` VALUES (457036, 2, 430600000000, 430601000000, '414000', '0730', '市辖区', '岳阳', '湖南,岳阳', 'YueYang', 113.128958, 29.357104);
INSERT INTO `china_region` VALUES (457037, 2, 430600000000, 430602000000, '414000', '0730', '岳阳楼区', '岳阳楼', '湖南,岳阳,岳阳楼', 'YueYangLou', 113.129702, 29.371903);
INSERT INTO `china_region` VALUES (457239, 2, 430600000000, 430603000000, '414000', '0730', '云溪区', '云溪', '湖南,岳阳,云溪', 'YunXi', 113.272313, 29.472746);
INSERT INTO `china_region` VALUES (457304, 2, 430600000000, 430611000000, '414000', '0730', '君山区', '君山', '湖南,岳阳,君山', 'JunShan', 113.006435, 29.461106);
INSERT INTO `china_region` VALUES (457396, 2, 430600000000, 430621000000, '414100', '0730', '岳阳县', '岳阳', '湖南,岳阳', 'YueYang', 113.116418, 29.144067);
INSERT INTO `china_region` VALUES (457614, 2, 430600000000, 430623000000, '414200', '0730', '华容县', '华容', '湖南,岳阳,华容', 'HuaRong', 112.540463, 29.531057);
INSERT INTO `china_region` VALUES (457854, 2, 430600000000, 430624000000, '410500', '0730', '湘阴县', '湘阴', '湖南,岳阳,湘阴', 'XiangYin', 112.909426, 28.689105);
INSERT INTO `china_region` VALUES (458089, 2, 430600000000, 430626000000, '410400', '0730', '平江县', '平江', '湖南,岳阳,平江', 'PingJiang', 113.581234, 28.701868);
INSERT INTO `china_region` VALUES (458658, 2, 430600000000, 430671000000, '414499', '0730', '岳阳市屈原管理区', '岳阳屈原管理', '湖南,岳阳,岳阳屈原管理', 'YueYangQuYuanGuanLi', 112.917469, 28.85797);
INSERT INTO `china_region` VALUES (458695, 2, 430600000000, 430681000000, '414400', '0730', '汨罗市', '汨罗', '湖南,岳阳,汨罗', 'MiLuo', 113.067259, 28.80689);
INSERT INTO `china_region` VALUES (458897, 2, 430600000000, 430682000000, '414300', '0730', '临湘市', '临湘', '湖南,岳阳,临湘', 'LinXiang', 113.450423, 29.476849);
INSERT INTO `china_region` VALUES (459073, 1, 430000000000, 430700000000, '415000', '0736', '常德市', '常德', '湖南,常德', 'ChangDe', 111.698497, 29.031673);
INSERT INTO `china_region` VALUES (459074, 2, 430700000000, 430701000000, '415000', '0736', '市辖区', '常德', '湖南,常德', 'ChangDe', 111.698497, 29.031673);
INSERT INTO `china_region` VALUES (459075, 2, 430700000000, 430702000000, '415000', '0736', '武陵区', '武陵', '湖南,常德,武陵', 'WuLing', 111.683153, 29.055163);
INSERT INTO `china_region` VALUES (459263, 2, 430700000000, 430703000000, '415100', '0736', '鼎城区', '鼎城', '湖南,常德,鼎城', 'DingCheng', 111.680783, 29.018593);
INSERT INTO `china_region` VALUES (459622, 2, 430700000000, 430721000000, '415600', '0736', '安乡县', '安乡', '湖南,常德,安乡', 'AnXiang', 112.171131, 29.411309);
INSERT INTO `china_region` VALUES (459807, 2, 430700000000, 430722000000, '415900', '0736', '汉寿县', '汉寿', '湖南,常德,汉寿', 'HanShou', 111.970514, 28.906107);
INSERT INTO `china_region` VALUES (460136, 2, 430700000000, 430723000000, '415500', '0736', '澧县', '澧县', '湖南,常德,澧县', 'LiXian', 111.758702, 29.633237);
INSERT INTO `china_region` VALUES (460447, 2, 430700000000, 430724000000, '415200', '0736', '临澧县', '临澧', '湖南,常德,临澧', 'LinLi', 111.647518, 29.440793);
INSERT INTO `china_region` VALUES (460619, 2, 430700000000, 430725000000, '415700', '0736', '桃源县', '桃源', '湖南,常德,桃源', 'TaoYuan', 111.488925, 28.902503);
INSERT INTO `china_region` VALUES (461079, 2, 430700000000, 430726000000, '415300', '0736', '石门县', '石门', '湖南,常德,石门', 'ShiMen', 111.380014, 29.584293);
INSERT INTO `china_region` VALUES (461438, 2, 430700000000, 430771000000, '415137', '0736', '常德市西洞庭管理区', '常德西洞庭管理', '湖南,常德,常德西洞庭管理', 'ChangDeXiDongTingGuanLi', 112.013714, 29.220702);
INSERT INTO `china_region` VALUES (461460, 2, 430700000000, 430781000000, '415400', '0736', '津市市', '津市市', '湖南,常德,津', 'JinShiShi', 111.877499, 29.60548);
INSERT INTO `china_region` VALUES (461549, 1, 430000000000, 430800000000, '427000', '0744', '张家界市', '张家界', '湖南,张家界', 'ZhangJiaJie', 110.479191, 29.117096);
INSERT INTO `china_region` VALUES (461550, 2, 430800000000, 430801000000, '427000', '0744', '市辖区', '张家界', '湖南,张家界', 'ZhangJiaJie', 110.479191, 29.117096);
INSERT INTO `china_region` VALUES (461551, 2, 430800000000, 430802000000, '427000', '0744', '永定区', '永定', '湖南,张家界,永定', 'YongDing', 110.537138, 29.119856);
INSERT INTO `china_region` VALUES (461828, 2, 430800000000, 430811000000, '427400', '0744', '武陵源区', '武陵源', '湖南,张家界,武陵源', 'WuLingYuan', 110.550434, 29.34573);
INSERT INTO `china_region` VALUES (461868, 2, 430800000000, 430821000000, '427200', '0744', '慈利县', '慈利', '湖南,张家界,慈利', 'CiLi', 111.139711, 29.429972);
INSERT INTO `china_region` VALUES (462324, 2, 430800000000, 430822000000, '427100', '0744', '桑植县', '桑植', '湖南,张家界,桑植', 'SangZhi', 110.204911, 29.414264);
INSERT INTO `china_region` VALUES (462646, 1, 430000000000, 430900000000, '413000', '0737', '益阳市', '益阳', '湖南,益阳', 'YiYang', 112.35518, 28.55386);
INSERT INTO `china_region` VALUES (462647, 2, 430900000000, 430901000000, '413000', '0737', '市辖区', '益阳', '湖南,益阳', 'YiYang', 112.35518, 28.55386);
INSERT INTO `china_region` VALUES (462648, 2, 430900000000, 430902000000, '413000', '0737', '资阳区', '资阳', '湖南,益阳,资阳', 'ZiYang', 112.324322, 28.590966);
INSERT INTO `china_region` VALUES (462782, 2, 430900000000, 430903000000, '413000', '0737', '赫山区', '赫山', '湖南,益阳,赫山', 'HeShan', 112.374024, 28.579343);
INSERT INTO `china_region` VALUES (463015, 2, 430900000000, 430921000000, '413200', '0737', '南县', '南县', '湖南,益阳,南县', 'NanXian', 112.396241, 29.361338);
INSERT INTO `china_region` VALUES (463192, 2, 430900000000, 430922000000, '413400', '0737', '桃江县', '桃江', '湖南,益阳,桃江', 'TaoJiang', 112.155822, 28.518085);
INSERT INTO `china_region` VALUES (463455, 2, 430900000000, 430923000000, '413500', '0737', '安化县', '安化', '湖南,益阳,安化', 'AnHua', 111.212846, 28.374107);
INSERT INTO `china_region` VALUES (463912, 2, 430900000000, 430971000000, '413207', '0737', '益阳市大通湖管理区', '益阳大通湖管理', '湖南,益阳,益阳大通湖管理', 'YiYangDaTongHuGuanLi', 112.67515, 29.09686);
INSERT INTO `china_region` VALUES (463957, 2, 430900000000, 430972000000, '413502', '0737', '湖南益阳高新技术产业园区', '湖南益阳高', '湖南,益阳,益阳高', 'HuNanYiYangGao', 112.35518, 28.55386);
INSERT INTO `china_region` VALUES (463988, 2, 430900000000, 430981000000, '413100', '0737', '沅江市', '沅江', '湖南,益阳,沅江', 'YuanJiang', 112.354661, 28.845837);
INSERT INTO `china_region` VALUES (464202, 1, 430000000000, 431000000000, '423000', '0735', '郴州市', '郴州', '湖南,郴州', 'ChenZhou', 113.014717, 25.770509);
INSERT INTO `china_region` VALUES (464203, 2, 431000000000, 431001000000, '423000', '0735', '市辖区', '郴州', '湖南,郴州', 'ChenZhou', 113.014717, 25.770509);
INSERT INTO `china_region` VALUES (464204, 2, 431000000000, 431002000000, '423000', '0735', '北湖区', '北湖', '湖南,郴州,北湖', 'BeiHu', 113.011035, 25.784054);
INSERT INTO `china_region` VALUES (464386, 2, 431000000000, 431003000000, '423000', '0735', '苏仙区', '苏仙', '湖南,郴州,苏仙', 'SuXian', 113.042441, 25.80037);
INSERT INTO `china_region` VALUES (464587, 2, 431000000000, 431021000000, '424400', '0735', '桂阳县', '桂阳', '湖南,郴州,桂阳', 'GuiYang', 112.734176, 25.754167);
INSERT INTO `china_region` VALUES (464981, 2, 431000000000, 431022000000, '424200', '0735', '宜章县', '宜章', '湖南,郴州,宜章', 'YiZhang', 112.948811, 25.400222);
INSERT INTO `china_region` VALUES (465267, 2, 431000000000, 431023000000, '423300', '0735', '永兴县', '永兴', '湖南,郴州,永兴', 'YongXing', 113.116528, 26.127151);
INSERT INTO `china_region` VALUES (465561, 2, 431000000000, 431024000000, '424500', '0735', '嘉禾县', '嘉禾', '湖南,郴州,嘉禾', 'JiaHe', 112.369021, 25.58752);
INSERT INTO `china_region` VALUES (465773, 2, 431000000000, 431025000000, '424300', '0735', '临武县', '临武', '湖南,郴州,临武', 'LinWu', 112.563456, 25.27556);
INSERT INTO `china_region` VALUES (465996, 2, 431000000000, 431026000000, '424100', '0735', '汝城县', '汝城', '湖南,郴州,汝城', 'RuCheng', 113.684727, 25.532816);
INSERT INTO `china_region` VALUES (466263, 2, 431000000000, 431027000000, '423500', '0735', '桂东县', '桂东', '湖南,郴州,桂东', 'GuiDong', 113.944614, 26.077616);
INSERT INTO `china_region` VALUES (466390, 2, 431000000000, 431028000000, '423600', '0735', '安仁县', '安仁', '湖南,郴州,安仁', 'AnRen', 113.269396, 26.709056);
INSERT INTO `china_region` VALUES (466566, 2, 431000000000, 431081000000, '423400', '0735', '资兴市', '资兴', '湖南,郴州,资兴', 'ZiXing', 113.236146, 25.976243);
INSERT INTO `china_region` VALUES (466796, 1, 430000000000, 431100000000, '425000', '0746', '永州市', '永州', '湖南,永州', 'YongZhou', 111.613445, 26.420394);
INSERT INTO `china_region` VALUES (466797, 2, 431100000000, 431101000000, '425000', '0746', '市辖区', '永州', '湖南,永州', 'YongZhou', 111.613445, 26.420394);
INSERT INTO `china_region` VALUES (466798, 2, 431100000000, 431102000000, '425000', '0746', '零陵区', '零陵', '湖南,永州,零陵', 'LingLing', 111.631109, 26.221936);
INSERT INTO `china_region` VALUES (467149, 2, 431100000000, 431103000000, '425000', '0746', '冷水滩区', '冷水滩', '湖南,永州,冷水滩', 'LengShuiTan', 111.592143, 26.461077);
INSERT INTO `china_region` VALUES (467371, 2, 431100000000, 431121000000, '426100', '0746', '祁阳县', '祁阳', '湖南,永州,祁阳', 'QiYang', 111.840657, 26.58012);
INSERT INTO `china_region` VALUES (467958, 2, 431100000000, 431122000000, '425900', '0746', '东安县', '东安', '湖南,永州,东安', 'DongAn', 111.314117, 26.394404);
INSERT INTO `china_region` VALUES (468320, 2, 431100000000, 431123000000, '425200', '0746', '双牌县', '双牌', '湖南,永州,双牌', 'ShuangPai', 111.659967, 25.96191);
INSERT INTO `china_region` VALUES (468454, 2, 431100000000, 431124000000, '425300', '0746', '道县', '道县', '湖南,永州,道县', 'DaoXian', 111.600796, 25.526438);
INSERT INTO `china_region` VALUES (468848, 2, 431100000000, 431125000000, '425400', '0746', '江永县', '江永', '湖南,永州,江永', 'JiangYong', 111.343911, 25.273539);
INSERT INTO `china_region` VALUES (468970, 2, 431100000000, 431126000000, '425600', '0746', '宁远县', '宁远', '湖南,永州,宁远', 'NingYuan', 111.945805, 25.570976);
INSERT INTO `china_region` VALUES (469413, 2, 431100000000, 431127000000, '425800', '0746', '蓝山县', '蓝山', '湖南,永州,蓝山', 'LanShan', 112.196731, 25.369898);
INSERT INTO `china_region` VALUES (469661, 2, 431100000000, 431128000000, '425700', '0746', '新田县', '新田', '湖南,永州,新田', 'XinTian', 112.203287, 25.904305);
INSERT INTO `china_region` VALUES (469906, 2, 431100000000, 431129000000, '425500', '0746', '江华瑶族自治县', '江华', '湖南,永州,江华', 'JiangHua', 111.579305, 25.18559);
INSERT INTO `china_region` VALUES (470242, 2, 431100000000, 431171000000, '425099', '0746', '永州经济技术开发区', '永州经开区', '湖南,永州,永州经开区', 'YongZhouJingKaiQu', 111.590591, 26.412891);
INSERT INTO `china_region` VALUES (470261, 2, 431100000000, 431172000000, '426191', '0746', '永州市金洞管理区', '永州金洞管理', '湖南,永州,永州金洞管理', 'YongZhouJinDongGuanLi', 112.09219, 26.29095);
INSERT INTO `china_region` VALUES (470311, 2, 431100000000, 431173000000, '425406', '0746', '永州市回龙圩管理区', '永州回龙圩管理', '湖南,永州,永州回龙圩管理', 'YongZhouHuiLongWeiGuanLi', 111.613445, 26.420394);
INSERT INTO `china_region` VALUES (470324, 1, 430000000000, 431200000000, '418000', '0745', '怀化市', '怀化', '湖南,怀化', 'HuaiHua', 109.998488, 27.554978);
INSERT INTO `china_region` VALUES (470325, 2, 431200000000, 431201000000, '418000', '0745', '市辖区', '怀化', '湖南,怀化', 'HuaiHua', 109.998488, 27.554978);
INSERT INTO `china_region` VALUES (470326, 2, 431200000000, 431202000000, '418000', '0745', '鹤城区', '鹤城', '湖南,怀化,鹤城', 'HeCheng', 110.040315, 27.578926);
INSERT INTO `china_region` VALUES (470466, 2, 431200000000, 431221000000, '418000', '0745', '中方县', '中方', '湖南,怀化,中方', 'ZhongFang', 109.944712, 27.440139);
INSERT INTO `china_region` VALUES (470628, 2, 431200000000, 431222000000, '419600', '0745', '沅陵县', '沅陵', '湖南,怀化,沅陵', 'YuanLing', 110.393844, 28.452686);
INSERT INTO `china_region` VALUES (471054, 2, 431200000000, 431223000000, '419500', '0745', '辰溪县', '辰溪', '湖南,怀化,辰溪', 'ChenXi', 110.183917, 28.006336);
INSERT INTO `china_region` VALUES (471372, 2, 431200000000, 431224000000, '419300', '0745', '溆浦县', '溆浦', '湖南,怀化,溆浦', 'XuPu', 110.594972, 27.908316);
INSERT INTO `china_region` VALUES (471814, 2, 431200000000, 431225000000, '418300', '0745', '会同县', '会同', '湖南,怀化,会同', 'HuiTong', 109.735661, 26.887239);
INSERT INTO `china_region` VALUES (472076, 2, 431200000000, 431226000000, '419400', '0745', '麻阳苗族自治县', '麻阳', '湖南,怀化,麻阳', 'MaYang', 109.802587, 27.865548);
INSERT INTO `china_region` VALUES (472317, 2, 431200000000, 431227000000, '419200', '0745', '新晃侗族自治县', '新晃', '湖南,怀化,新晃', 'XinHuang', 109.174932, 27.352673);
INSERT INTO `china_region` VALUES (472480, 2, 431200000000, 431228000000, '419100', '0745', '芷江侗族自治县', '芷江', '湖南,怀化,芷江', 'ZhiJiang', 109.684629, 27.443499);
INSERT INTO `china_region` VALUES (472717, 2, 431200000000, 431229000000, '418400', '0745', '靖州苗族侗族自治县', '靖州', '湖南,怀化,靖州', 'JingZhou', 109.696311, 26.575052);
INSERT INTO `china_region` VALUES (472867, 2, 431200000000, 431230000000, '418500', '0745', '通道侗族自治县', '通道', '湖南,怀化,通道', 'TongDao', 109.784412, 26.158054);
INSERT INTO `china_region` VALUES (473045, 2, 431200000000, 431271000000, '418200', '0745', '怀化市洪江管理区', '怀化洪江管理', '湖南,怀化,怀化洪江管理', 'HuaiHuaHongJiangGuanLi', 109.836669, 27.208609);
INSERT INTO `china_region` VALUES (473085, 2, 431200000000, 431281000000, '418200', '0745', '洪江市', '洪江', '湖南,怀化,洪江', 'HongJiang', 109.836669, 27.208609);
INSERT INTO `china_region` VALUES (473324, 1, 430000000000, 431300000000, '417000', '0738', '娄底市', '娄底', '湖南,娄底', 'LouDi', 111.993497, 27.700062);
INSERT INTO `china_region` VALUES (473325, 2, 431300000000, 431301000000, '417000', '0738', '市辖区', '娄底', '湖南,娄底', 'LouDi', 111.993497, 27.700062);
INSERT INTO `china_region` VALUES (473326, 2, 431300000000, 431302000000, '417000', '0738', '娄星区', '娄星', '湖南,娄底,娄星', 'LouXing', 112.001937, 27.729907);
INSERT INTO `china_region` VALUES (473572, 2, 431300000000, 431321000000, '417700', '0738', '双峰县', '双峰', '湖南,娄底,双峰', 'ShuangFeng', 112.175246, 27.456658);
INSERT INTO `china_region` VALUES (474113, 2, 431300000000, 431322000000, '417600', '0738', '新化县', '新化', '湖南,娄底,新化', 'XinHua', 111.327412, 27.726515);
INSERT INTO `china_region` VALUES (474831, 2, 431300000000, 431381000000, '417500', '0738', '冷水江市', '冷水江', '湖南,娄底,冷水江', 'LengShuiJiang', 111.435623, 27.68585);
INSERT INTO `china_region` VALUES (474992, 2, 431300000000, 431382000000, '417100', '0738', '涟源市', '涟源', '湖南,娄底,涟源', 'LianYuan', 111.664316, 27.692542);
INSERT INTO `china_region` VALUES (475516, 1, 430000000000, 433100000000, '416000', '0743', '湘西土家族苗族自治州', '湘西', '湖南,湘西', 'XiangXi', 109.739172, 28.311947);
INSERT INTO `china_region` VALUES (475517, 2, 433100000000, 433101000000, '416000', '0743', '吉首市', '吉首', '湖南,湘西,吉首', 'JiShou', 109.926773, 28.297201);
INSERT INTO `china_region` VALUES (475680, 2, 433100000000, 433122000000, '416100', '0743', '泸溪县', '泸溪', '湖南,湘西,泸溪', 'LuXi', 110.21961, 28.216641);
INSERT INTO `china_region` VALUES (475841, 2, 433100000000, 433123000000, '416200', '0743', '凤凰县', '凤凰', '湖南,湘西,凤凰', 'FengHuang', 109.581072, 27.958062);
INSERT INTO `china_region` VALUES (476141, 2, 433100000000, 433124000000, '416400', '0743', '花垣县', '花垣', '湖南,湘西,花垣', 'HuaYuan', 109.482078, 28.57203);
INSERT INTO `china_region` VALUES (476395, 2, 433100000000, 433125000000, '416500', '0743', '保靖县', '保靖', '湖南,湘西,保靖', 'BaoJing', 109.660577, 28.699774);
INSERT INTO `china_region` VALUES (476586, 2, 433100000000, 433126000000, '416300', '0743', '古丈县', '古丈', '湖南,湘西,古丈', 'GuZhang', 109.950728, 28.616935);
INSERT INTO `china_region` VALUES (476715, 2, 433100000000, 433127000000, '416700', '0743', '永顺县', '永顺', '湖南,湘西,永顺', 'YongShun', 109.851254, 29.00144);
INSERT INTO `china_region` VALUES (477040, 2, 433100000000, 433130000000, '416800', '0743', '龙山县', '龙山', '湖南,湘西,龙山', 'LongShan', 109.443939, 29.457663);
INSERT INTO `china_region` VALUES (477459, 2, 433100000000, 433173000000, '416700', '0743', '湖南永顺经济开发区', '湖南永顺经开区', '湖南,湘西,永顺经开区', 'HuNanYongShunJingKaiQu', 109.739172, 28.311947);
INSERT INTO `china_region` VALUES (477463, 0, 0, 440000000000, '0', NULL, '广东省', '广东', '广东', 'GuangDong', 113.26653, 23.132191);
INSERT INTO `china_region` VALUES (477464, 1, 440000000000, 440100000000, '510000', '020', '广州市', '广州', '广东,广州', 'GuangZhou', 113.264434, 23.129162);
INSERT INTO `china_region` VALUES (477465, 2, 440100000000, 440101000000, '510000', '020', '市辖区', '广州', '广东,广州', 'GuangZhou', 113.264434, 23.129162);
INSERT INTO `china_region` VALUES (477466, 2, 440100000000, 440103000000, '510000', '020', '荔湾区', '荔湾', '广东,广州,荔湾', 'LiWan', 113.244261, 23.125981);
INSERT INTO `china_region` VALUES (477680, 2, 440100000000, 440104000000, '510000', '020', '越秀区', '越秀', '广东,广州,越秀', 'YueXiu', 113.266841, 23.128524);
INSERT INTO `china_region` VALUES (477921, 2, 440100000000, 440105000000, '510000', '020', '海珠区', '海珠', '广东,广州,海珠', 'HaiZhu', 113.317388, 23.083801);
INSERT INTO `china_region` VALUES (478205, 2, 440100000000, 440106000000, '510000', '020', '天河区', '天河', '广东,广州,天河', 'TianHe', 113.3612, 23.12468);
INSERT INTO `china_region` VALUES (478447, 2, 440100000000, 440111000000, '510000', '020', '白云区', '白云', '广东,广州,白云', 'BaiYun', 113.273289, 23.15729);
INSERT INTO `china_region` VALUES (478872, 2, 440100000000, 440112000000, '510700', '020', '黄埔区', '黄埔', '广东,广州,黄埔', 'HuangPu', 113.459749, 23.106402);
INSERT INTO `china_region` VALUES (479045, 2, 440100000000, 440113000000, '511400', '020', '番禺区', '番禺', '广东,广州,番禺', 'PanYu', 113.384129, 22.937244);
INSERT INTO `china_region` VALUES (479338, 2, 440100000000, 440114000000, '510800', '020', '花都区', '花都', '广东,广州,花都', 'HuaDu', 113.220218, 23.404165);
INSERT INTO `china_region` VALUES (479601, 2, 440100000000, 440115000000, '511400', '020', '南沙区', '南沙', '广东,广州,南沙', 'NanSha', 113.525165, 22.801624);
INSERT INTO `china_region` VALUES (479783, 2, 440100000000, 440117000000, '510900', '020', '从化区', '从化', '广东,广州,从化', 'CongHua', 113.586605, 23.548852);
INSERT INTO `china_region` VALUES (480070, 2, 440100000000, 440118000000, '511300', '020', '增城区', '增城', '广东,广州,增城', 'ZengCheng', 113.81086, 23.261141);
INSERT INTO `china_region` VALUES (480430, 1, 440000000000, 440200000000, '512000', '0751', '韶关市', '韶关', '广东,韶关', 'ShaoGuan', 113.597522, 24.810403);
INSERT INTO `china_region` VALUES (480431, 2, 440200000000, 440201000000, '512000', '0751', '市辖区', '韶关', '广东,韶关', 'ShaoGuan', 113.597522, 24.810403);
INSERT INTO `china_region` VALUES (480432, 2, 440200000000, 440203000000, '512000', '0751', '武江区', '武江', '广东,韶关,武江', 'WuJiang', 113.587774, 24.792924);
INSERT INTO `china_region` VALUES (480527, 2, 440200000000, 440204000000, '512000', '0751', '浈江区', '浈江', '广东,韶关,浈江', 'ZhenJiang', 113.611098, 24.804381);
INSERT INTO `china_region` VALUES (480651, 2, 440200000000, 440205000000, '512100', '0751', '曲江区', '曲江', '广东,韶关,曲江', 'QuJiang', 113.604549, 24.682728);
INSERT INTO `china_region` VALUES (480772, 2, 440200000000, 440222000000, '512500', '0751', '始兴县', '始兴', '广东,韶关,始兴', 'ShiXing', 114.061789, 24.952977);
INSERT INTO `china_region` VALUES (480912, 2, 440200000000, 440224000000, '512300', '0751', '仁化县', '仁化', '广东,韶关,仁化', 'RenHua', 113.749027, 25.085621);
INSERT INTO `china_region` VALUES (481049, 2, 440200000000, 440229000000, '512600', '0751', '翁源县', '翁源', '广东,韶关,翁源', 'WengYuan', 114.130342, 24.350347);
INSERT INTO `china_region` VALUES (481232, 2, 440200000000, 440232000000, '512600', '0751', '乳源瑶族自治县', '乳源', '广东,韶关,乳源', 'RuYuan', 113.275883, 24.776078);
INSERT INTO `china_region` VALUES (481361, 2, 440200000000, 440233000000, '511100', '0751', '新丰县', '新丰', '广东,韶关,新丰', 'XinFeng', 114.206867, 24.05976);
INSERT INTO `china_region` VALUES (481526, 2, 440200000000, 440281000000, '512200', '0751', '乐昌市', '乐昌', '广东,韶关,乐昌', 'LeChang', 113.347519, 25.130136);
INSERT INTO `china_region` VALUES (481771, 2, 440200000000, 440282000000, '512400', '0751', '南雄市', '南雄', '广东,韶关,南雄', 'NanXiong', 114.311982, 25.117753);
INSERT INTO `china_region` VALUES (482024, 1, 440000000000, 440300000000, '518000', '0755', '深圳市', '深圳', '广东,深圳', 'ShenZhen', 114.057868, 22.543099);
INSERT INTO `china_region` VALUES (482025, 2, 440300000000, 440301000000, '518000', '0755', '市辖区', '深圳', '广东,深圳', 'ShenZhen', 114.057868, 22.543099);
INSERT INTO `china_region` VALUES (482026, 2, 440300000000, 440303000000, '518000', '0755', '罗湖区', '罗湖', '广东,深圳,罗湖', 'LuoHu', 114.131764, 22.548171);
INSERT INTO `china_region` VALUES (482149, 2, 440300000000, 440304000000, '518000', '0755', '福田区', '福田', '广东,深圳,福田', 'FuTian', 114.055036, 22.52153);
INSERT INTO `china_region` VALUES (482277, 2, 440300000000, 440305000000, '518000', '0755', '南山区', '南山', '广东,深圳,南山', 'NanShan', 113.923552, 22.528499);
INSERT INTO `china_region` VALUES (482395, 2, 440300000000, 440306000000, '518100', '0755', '宝安区', '宝安', '广东,深圳,宝安', 'BaoAn', 113.88402, 22.555259);
INSERT INTO `china_region` VALUES (482548, 2, 440300000000, 440307000000, '518100', '0755', '龙岗区', '龙岗', '广东,深圳,龙岗', 'LongGang', 114.246899, 22.720968);
INSERT INTO `china_region` VALUES (482707, 2, 440300000000, 440308000000, '518000', '0755', '盐田区', '盐田', '广东,深圳,盐田', 'YanTian', 114.236875, 22.556499);
INSERT INTO `china_region` VALUES (482739, 2, 440300000000, 440309000000, '518109', '0755', '龙华区', '龙华', '广东,深圳,龙华', 'LongHua', 114.057868, 22.543099);
INSERT INTO `china_region` VALUES (482854, 2, 440300000000, 440310000000, '518118', '0755', '坪山区', '坪山', '广东,深圳,坪山', 'PingShan', 114.057868, 22.543099);
INSERT INTO `china_region` VALUES (482886, 2, 440300000000, 440311000000, '518107', '0755', '光明区', '光明', '广东,深圳,光明', 'GuangMing', 114.057868, 22.543099);
INSERT INTO `china_region` VALUES (482924, 1, 440000000000, 440400000000, '519000', '0756', '珠海市', '珠海', '广东,珠海', 'ZhuHai', 113.576726, 22.270715);
INSERT INTO `china_region` VALUES (482925, 2, 440400000000, 440401000000, '519000', '0756', '市辖区', '珠海', '广东,珠海', 'ZhuHai', 113.576726, 22.270715);
INSERT INTO `china_region` VALUES (482926, 2, 440400000000, 440402000000, '519000', '0756', '香洲区', '香洲', '广东,珠海,香洲', 'XiangZhou', 113.543785, 22.265811);
INSERT INTO `china_region` VALUES (483102, 2, 440400000000, 440403000000, '519100', '0756', '斗门区', '斗门', '广东,珠海,斗门', 'DouMen', 113.296467, 22.2092);
INSERT INTO `china_region` VALUES (483240, 2, 440400000000, 440404000000, '519090', '0756', '金湾区', '金湾', '广东,珠海,金湾', 'JinWan', 113.363393, 22.146874);
INSERT INTO `china_region` VALUES (483289, 1, 440000000000, 440500000000, '515000', '0754', '汕头市', '汕头', '广东,汕头', 'ShanTou', 116.681972, 23.354091);
INSERT INTO `china_region` VALUES (483290, 2, 440500000000, 440501000000, '515000', '0754', '市辖区', '汕头', '广东,汕头', 'ShanTou', 116.681972, 23.354091);
INSERT INTO `china_region` VALUES (483291, 2, 440500000000, 440507000000, '515000', '0754', '龙湖区', '龙湖', '广东,汕头,龙湖', 'LongHu', 116.716534, 23.371476);
INSERT INTO `china_region` VALUES (483420, 2, 440500000000, 440511000000, '515000', '0754', '金平区', '金平', '广东,汕头,金平', 'JinPing', 116.703426, 23.365613);
INSERT INTO `china_region` VALUES (483604, 2, 440500000000, 440512000000, '515000', '0754', '濠江区', '濠江', '广东,汕头,濠江', 'HaoJiang', 116.726973, 23.286079);
INSERT INTO `china_region` VALUES (483672, 2, 440500000000, 440513000000, '515100', '0754', '潮阳区', '潮阳', '广东,汕头,潮阳', 'ChaoYang', 116.601515, 23.264936);
INSERT INTO `china_region` VALUES (483959, 2, 440500000000, 440514000000, '515100', '0754', '潮南区', '潮南', '广东,汕头,潮南', 'ChaoNan', 116.433017, 23.250425);
INSERT INTO `china_region` VALUES (484203, 2, 440500000000, 440515000000, '515800', '0754', '澄海区', '澄海', '广东,汕头,澄海', 'ChengHai', 116.756092, 23.46596);
INSERT INTO `china_region` VALUES (484399, 2, 440500000000, 440523000000, '515900', '0754', '南澳县', '南澳', '广东,汕头,南澳', 'NanAo', 117.023374, 23.421724);
INSERT INTO `china_region` VALUES (484449, 1, 440000000000, 440600000000, '528000', '0757', '佛山市', '佛山', '广东,佛山', 'FoShan', 113.121416, 23.021548);
INSERT INTO `china_region` VALUES (484450, 2, 440600000000, 440601000000, '528000', '0757', '市辖区', '佛山', '广东,佛山', 'FoShan', 113.121416, 23.021548);
INSERT INTO `china_region` VALUES (484451, 2, 440600000000, 440604000000, '528000', '0757', '禅城区', '禅城', '广东,佛山,禅城', 'ChanCheng', 113.12244, 23.009505);
INSERT INTO `china_region` VALUES (484601, 2, 440600000000, 440605000000, '528200', '0757', '南海区', '南海', '广东,佛山,南海', 'NanHai', 113.147759, 23.025412);
INSERT INTO `china_region` VALUES (484919, 2, 440600000000, 440606000000, '528000', '0757', '顺德区', '顺德', '广东,佛山,顺德', 'ShunDe', 113.293359, 22.80524);
INSERT INTO `china_region` VALUES (485135, 2, 440600000000, 440607000000, '528100', '0757', '三水区', '三水', '广东,佛山,三水', 'SanShui', 112.896668, 23.156065);
INSERT INTO `china_region` VALUES (485224, 2, 440600000000, 440608000000, '528500', '0757', '高明区', '高明', '广东,佛山,高明', 'GaoMing', 112.892578, 22.900182);
INSERT INTO `china_region` VALUES (485314, 1, 440000000000, 440700000000, '529000', '0750', '江门市', '江门', '广东,江门', 'JiangMen', 113.081901, 22.578738);
INSERT INTO `china_region` VALUES (485315, 2, 440700000000, 440701000000, '529000', '0750', '市辖区', '江门', '广东,江门', 'JiangMen', 113.081901, 22.578738);
INSERT INTO `china_region` VALUES (485316, 2, 440700000000, 440703000000, '529000', '0750', '蓬江区', '蓬江', '广东,江门,蓬江', 'PengJiang', 113.078521, 22.595149);
INSERT INTO `china_region` VALUES (485457, 2, 440700000000, 440704000000, '529000', '0750', '江海区', '江海', '广东,江门,江海', 'JiangHai', 113.111612, 22.560474);
INSERT INTO `china_region` VALUES (485523, 2, 440700000000, 440705000000, '529100', '0750', '新会区', '新会', '广东,江门,新会', 'XinHui', 113.034187, 22.4583);
INSERT INTO `china_region` VALUES (485769, 2, 440700000000, 440781000000, '529200', '0750', '台山市', '台山', '广东,江门,台山', 'TaiShan', 112.79597, 22.251596);
INSERT INTO `china_region` VALUES (486100, 2, 440700000000, 440783000000, '529300', '0750', '开平市', '开平', '广东,江门,开平', 'KaiPing', 112.698545, 22.376395);
INSERT INTO `china_region` VALUES (486388, 2, 440700000000, 440784000000, '529700', '0750', '鹤山市', '鹤山', '广东,江门,鹤山', 'HeShan', 112.964446, 22.765392);
INSERT INTO `china_region` VALUES (486541, 2, 440700000000, 440785000000, '529400', '0750', '恩平市', '恩平', '广东,江门,恩平', 'EnPing', 112.305145, 22.183206);
INSERT INTO `china_region` VALUES (486729, 1, 440000000000, 440800000000, '524000', '0759', '湛江市', '湛江', '广东,湛江', 'ZhanJiang', 110.359377, 21.270707);
INSERT INTO `china_region` VALUES (486730, 2, 440800000000, 440801000000, '524000', '0759', '市辖区', '湛江', '广东,湛江', 'ZhanJiang', 110.359377, 21.270707);
INSERT INTO `china_region` VALUES (486731, 2, 440800000000, 440802000000, '524000', '0759', '赤坎区', '赤坎', '广东,湛江,赤坎', 'ChiKan', 110.3659, 21.266119);
INSERT INTO `china_region` VALUES (486787, 2, 440800000000, 440803000000, '524000', '0759', '霞山区', '霞山', '广东,湛江,霞山', 'XiaShan', 110.39807, 21.19172);
INSERT INTO `china_region` VALUES (486879, 2, 440800000000, 440804000000, '524000', '0759', '坡头区', '坡头', '广东,湛江,坡头', 'PoTou', 110.455332, 21.244721);
INSERT INTO `china_region` VALUES (486958, 2, 440800000000, 440811000000, '524000', '0759', '麻章区', '麻章', '广东,湛江,麻章', 'MaZhang', 110.334387, 21.263443);
INSERT INTO `china_region` VALUES (487109, 2, 440800000000, 440823000000, '524300', '0759', '遂溪县', '遂溪', '广东,湛江,遂溪', 'SuiXi', 110.250124, 21.377246);
INSERT INTO `china_region` VALUES (487479, 2, 440800000000, 440825000000, '524100', '0759', '徐闻县', '徐闻', '广东,湛江,徐闻', 'XuWen', 110.17675, 20.325489);
INSERT INTO `china_region` VALUES (487700, 2, 440800000000, 440881000000, '524400', '0759', '廉江市', '廉江', '广东,湛江,廉江', 'LianJiang', 110.286209, 21.6097);
INSERT INTO `china_region` VALUES (488125, 2, 440800000000, 440882000000, '524200', '0759', '雷州市', '雷州', '广东,湛江,雷州', 'LeiZhou', 110.096749, 20.914278);
INSERT INTO `china_region` VALUES (488633, 2, 440800000000, 440883000000, '524500', '0759', '吴川市', '吴川', '广东,湛江,吴川', 'WuChuan', 110.778411, 21.441808);
INSERT INTO `china_region` VALUES (488845, 1, 440000000000, 440900000000, '525000', '0668', '茂名市', '茂名', '广东,茂名', 'MaoMing', 110.925456, 21.662999);
INSERT INTO `china_region` VALUES (488846, 2, 440900000000, 440901000000, '525000', '0668', '市辖区', '茂名', '广东,茂名', 'MaoMing', 110.925456, 21.662999);
INSERT INTO `china_region` VALUES (488847, 2, 440900000000, 440902000000, '525000', '0668', '茂南区', '茂南', '广东,茂名,茂南', 'MaoNan', 110.918026, 21.641337);
INSERT INTO `china_region` VALUES (489104, 2, 440900000000, 440904000000, '525434', '0668', '电白区', '电白', '广东,茂名,电白', 'DianBai', 111.013556, 21.514164);
INSERT INTO `china_region` VALUES (489541, 2, 440900000000, 440981000000, '525200', '0668', '高州市', '高州', '广东,茂名,高州', 'GaoZhou', 110.853302, 21.917982);
INSERT INTO `china_region` VALUES (490064, 2, 440900000000, 440982000000, '525100', '0668', '化州市', '化州', '广东,茂名,化州', 'HuaZhou', 110.639569, 21.664044);
INSERT INTO `china_region` VALUES (490469, 2, 440900000000, 440983000000, '525300', '0668', '信宜市', '信宜', '广东,茂名,信宜', 'XinYi', 110.947044, 22.354385);
INSERT INTO `china_region` VALUES (490893, 1, 440000000000, 441200000000, '526000', '0758', '肇庆市', '肇庆', '广东,肇庆', 'ZhaoQing', 112.465091, 23.047191);
INSERT INTO `china_region` VALUES (490894, 2, 441200000000, 441201000000, '526000', '0758', '市辖区', '肇庆', '广东,肇庆', 'ZhaoQing', 112.465091, 23.047191);
INSERT INTO `china_region` VALUES (490895, 2, 441200000000, 441202000000, '526000', '0758', '端州区', '端州', '广东,肇庆,端州', 'DuanZhou', 112.484848, 23.052101);
INSERT INTO `china_region` VALUES (490960, 2, 441200000000, 441203000000, '526000', '0758', '鼎湖区', '鼎湖', '广东,肇庆,鼎湖', 'DingHu', 112.567588, 23.158447);
INSERT INTO `china_region` VALUES (491049, 2, 441200000000, 441204000000, '526105', '0758', '高要区', '高要', '广东,肇庆,高要', 'GaoYao', 112.457771, 23.025668);
INSERT INTO `china_region` VALUES (491419, 2, 441200000000, 441223000000, '526300', '0758', '广宁县', '广宁', '广东,肇庆,广宁', 'GuangNing', 112.44069, 23.634676);
INSERT INTO `china_region` VALUES (491613, 2, 441200000000, 441224000000, '526400', '0758', '怀集县', '怀集', '广东,肇庆,怀集', 'HuaiJi', 112.184652, 23.911899);
INSERT INTO `china_region` VALUES (491959, 2, 441200000000, 441225000000, '526500', '0758', '封开县', '封开', '广东,肇庆,封开', 'FengKai', 111.512343, 23.424033);
INSERT INTO `china_region` VALUES (492175, 2, 441200000000, 441226000000, '526600', '0758', '德庆县', '德庆', '广东,肇庆,德庆', 'DeQing', 111.785937, 23.143722);
INSERT INTO `china_region` VALUES (492382, 2, 441200000000, 441284000000, '526200', '0758', '四会市', '四会', '广东,肇庆,四会', 'SiHui', 112.733773, 23.326504);
INSERT INTO `china_region` VALUES (492562, 1, 440000000000, 441300000000, '516000', '0752', '惠州市', '惠州', '广东,惠州', 'HuiZhou', 114.416196, 23.111847);
INSERT INTO `china_region` VALUES (492563, 2, 441300000000, 441301000000, '516000', '0752', '市辖区', '惠州', '广东,惠州', 'HuiZhou', 114.416196, 23.111847);
INSERT INTO `china_region` VALUES (492564, 2, 441300000000, 441302000000, '516000', '0752', '惠城区', '惠城', '广东,惠州,惠城', 'HuiCheng', 114.382485, 23.084109);
INSERT INTO `china_region` VALUES (492858, 2, 441300000000, 441303000000, '516200', '0752', '惠阳区', '惠阳', '广东,惠州,惠阳', 'HuiYang', 114.456696, 22.788734);
INSERT INTO `china_region` VALUES (493059, 2, 441300000000, 441322000000, '516100', '0752', '博罗县', '博罗', '广东,惠州,博罗', 'BoLuo', 114.289496, 23.172899);
INSERT INTO `china_region` VALUES (493459, 2, 441300000000, 441323000000, '516300', '0752', '惠东县', '惠东', '广东,惠州,惠东', 'HuiDong', 114.720079, 22.984975);
INSERT INTO `china_region` VALUES (493776, 2, 441300000000, 441324000000, '516800', '0752', '龙门县', '龙门', '广东,惠州,龙门', 'LongMen', 114.254913, 23.727732);
INSERT INTO `china_region` VALUES (493974, 1, 440000000000, 441400000000, '514000', '0753', '梅州市', '梅州', '广东,梅州', 'MeiZhou', 116.122238, 24.288615);
INSERT INTO `china_region` VALUES (493975, 2, 441400000000, 441401000000, '514000', '0753', '市辖区', '梅州', '广东,梅州', 'MeiZhou', 116.122238, 24.288615);
INSERT INTO `china_region` VALUES (493976, 2, 441400000000, 441402000000, '514000', '0753', '梅江区', '梅江', '广东,梅州,梅江', 'MeiJiang', 116.116616, 24.310384);
INSERT INTO `china_region` VALUES (494112, 2, 441400000000, 441403000000, '514755', '0753', '梅县区', '梅县', '广东,梅州,梅县', 'MeiXian', 116.082183, 24.265312);
INSERT INTO `china_region` VALUES (494524, 2, 441400000000, 441422000000, '514200', '0753', '大埔县', '大埔', '广东,梅州,大埔', 'DaBu', 116.695195, 24.347783);
INSERT INTO `china_region` VALUES (494800, 2, 441400000000, 441423000000, '514300', '0753', '丰顺县', '丰顺', '广东,梅州,丰顺', 'FengShun', 116.182299, 23.739526);
INSERT INTO `china_region` VALUES (495100, 2, 441400000000, 441424000000, '514400', '0753', '五华县', '五华', '广东,梅州,五华', 'WuHua', 115.776983, 23.930769);
INSERT INTO `china_region` VALUES (495565, 2, 441400000000, 441426000000, '514600', '0753', '平远县', '平远', '广东,梅州,平远', 'PingYuan', 115.891638, 24.567262);
INSERT INTO `china_region` VALUES (495721, 2, 441400000000, 441427000000, '514100', '0753', '蕉岭县', '蕉岭', '广东,梅州,蕉岭', 'JiaoLing', 116.171356, 24.6587);
INSERT INTO `china_region` VALUES (495842, 2, 441400000000, 441481000000, '514500', '0753', '兴宁市', '兴宁', '广东,梅州,兴宁', 'XingNing', 115.723805, 24.126159);
INSERT INTO `china_region` VALUES (496358, 1, 440000000000, 441500000000, '516600', '0660', '汕尾市', '汕尾', '广东,汕尾', 'ShanWei', 115.375278, 22.786211);
INSERT INTO `china_region` VALUES (496359, 2, 441500000000, 441501000000, '516600', '0660', '市辖区', '汕尾', '广东,汕尾', 'ShanWei', 115.375278, 22.786211);
INSERT INTO `china_region` VALUES (496360, 2, 441500000000, 441502000000, '516600', '0660', '城区', '城区', '广东,汕尾,城区', 'ChengQu', 115.365029, 22.778699);
INSERT INTO `china_region` VALUES (496494, 2, 441500000000, 441521000000, '516400', '0660', '海丰县', '海丰', '广东,汕尾,海丰', 'HaiFeng', 115.323436, 22.966586);
INSERT INTO `china_region` VALUES (496795, 2, 441500000000, 441523000000, '516700', '0660', '陆河县', '陆河', '广东,汕尾,陆河', 'LuHe', 115.660143, 23.301617);
INSERT INTO `china_region` VALUES (496931, 2, 441500000000, 441581000000, '516500', '0660', '陆丰市', '陆丰', '广东,汕尾,陆丰', 'LuFeng', 115.65226, 22.917576);
INSERT INTO `china_region` VALUES (497321, 1, 440000000000, 441600000000, '517000', '0762', '河源市', '河源', '广东,河源', 'HeYuan', 114.700447, 23.743538);
INSERT INTO `china_region` VALUES (497322, 2, 441600000000, 441601000000, '517000', '0762', '市辖区', '河源', '广东,河源', 'HeYuan', 114.700447, 23.743538);
INSERT INTO `china_region` VALUES (497323, 2, 441600000000, 441602000000, '517000', '0762', '源城区', '源城', '广东,河源,源城', 'YuanCheng', 114.702517, 23.733969);
INSERT INTO `china_region` VALUES (497408, 2, 441600000000, 441621000000, '517400', '0762', '紫金县', '紫金', '广东,河源,紫金', 'ZiJin', 115.184061, 23.635271);
INSERT INTO `china_region` VALUES (497727, 2, 441600000000, 441622000000, '517300', '0762', '龙川县', '龙川', '广东,河源,龙川', 'LongChuan', 115.259872, 24.100066);
INSERT INTO `china_region` VALUES (498109, 2, 441600000000, 441623000000, '517100', '0762', '连平县', '连平', '广东,河源,连平', 'LianPing', 114.488714, 24.369588);
INSERT INTO `china_region` VALUES (498298, 2, 441600000000, 441624000000, '517200', '0762', '和平县', '和平', '广东,河源,和平', 'HePing', 114.938684, 24.44218);
INSERT INTO `china_region` VALUES (498561, 2, 441600000000, 441625000000, '517500', '0762', '东源县', '东源', '广东,河源,东源', 'DongYuan', 114.74638, 23.788393);
INSERT INTO `china_region` VALUES (498869, 1, 440000000000, 441700000000, '529500', '0662', '阳江市', '阳江', '广东,阳江', 'YangJiang', 111.982232, 21.857958);
INSERT INTO `china_region` VALUES (498870, 2, 441700000000, 441701000000, '529500', '0662', '市辖区', '阳江', '广东,阳江', 'YangJiang', 111.982232, 21.857958);
INSERT INTO `china_region` VALUES (498871, 2, 441700000000, 441702000000, '529500', '0662', '江城区', '江城', '广东,阳江,江城', 'JiangCheng', 111.955059, 21.861787);
INSERT INTO `china_region` VALUES (499051, 2, 441700000000, 441704000000, '529933', '0662', '阳东区', '阳东', '广东,阳江,阳东', 'YangDong', 112.006338, 21.868358);
INSERT INTO `china_region` VALUES (499249, 2, 441700000000, 441721000000, '529800', '0662', '阳西县', '阳西', '广东,阳江,阳西', 'YangXi', 111.617849, 21.752396);
INSERT INTO `china_region` VALUES (499410, 2, 441700000000, 441781000000, '529600', '0662', '阳春市', '阳春', '广东,阳江,阳春', 'YangChun', 111.791539, 22.170438);
INSERT INTO `china_region` VALUES (499802, 1, 440000000000, 441800000000, '511500', '0763', '清远市', '清远', '广东,清远', 'QingYuan', 113.056031, 23.681763);
INSERT INTO `china_region` VALUES (499803, 2, 441800000000, 441801000000, '511500', '0763', '市辖区', '清远', '广东,清远', 'QingYuan', 113.056031, 23.681763);
INSERT INTO `china_region` VALUES (499804, 2, 441800000000, 441802000000, '511500', '0763', '清城区', '清城', '广东,清远,清城', 'QingCheng', 113.062692, 23.697899);
INSERT INTO `china_region` VALUES (499977, 2, 441800000000, 441803000000, '511800', '0763', '清新区', '清新', '广东,清远,清新', 'QingXin', 113.017749, 23.734673);
INSERT INTO `china_region` VALUES (500196, 2, 441800000000, 441821000000, '511600', '0763', '佛冈县', '佛冈', '广东,清远,佛冈', 'FoGang', 113.531607, 23.879192);
INSERT INTO `china_region` VALUES (500293, 2, 441800000000, 441823000000, '513100', '0763', '阳山县', '阳山', '广东,清远,阳山', 'YangShan', 112.641363, 24.465359);
INSERT INTO `china_region` VALUES (500474, 2, 441800000000, 441825000000, '513200', '0763', '连山壮族瑶族自治县', '连山', '广东,清远,连山', 'LianShan', 112.093617, 24.570491);
INSERT INTO `china_region` VALUES (500538, 2, 441800000000, 441826000000, '513300', '0763', '连南瑶族自治县', '连南', '广东,清远,连南', 'LianNan', 112.287012, 24.726017);
INSERT INTO `china_region` VALUES (500617, 2, 441800000000, 441881000000, '513000', '0763', '英德市', '英德', '广东,清远,英德', 'YingDe', 113.402376, 24.205024);
INSERT INTO `china_region` VALUES (500941, 2, 441800000000, 441882000000, '513400', '0763', '连州市', '连州', '广东,清远,连州', 'LianZhou', 112.377361, 24.780966);
INSERT INTO `china_region` VALUES (501127, 1, 440000000000, 441900000000, '523000', '0769', '东莞市', '东莞', '广东,东莞', 'DongGuan', 113.751765, 23.020536);
INSERT INTO `china_region` VALUES (501128, 2, 441900000000, 441900003000, '523108', '0769', '东城街道', '东城街道', '广东,东莞,东城街道', 'DongChengJieDao', 113.783327, 23.028053);
INSERT INTO `china_region` VALUES (501154, 2, 441900000000, 441900004000, '529500', '0769', '南城街道', '南城街道', '广东,东莞,南城街道', 'NanChengJieDao', 113.743811, 23.018534);
INSERT INTO `china_region` VALUES (501173, 2, 441900000000, 441900005000, '523039', '0769', '万江街道', '万江街道', '广东,东莞,万江街道', 'WanJiangJieDao', 113.738543, 23.047104);
INSERT INTO `china_region` VALUES (501203, 2, 441900000000, 441900006000, '523119', '0769', '莞城街道', '莞城街道', '广东,东莞,莞城街道', 'GuanChengJieDao', 113.749234, 23.038629);
INSERT INTO `china_region` VALUES (501212, 2, 441900000000, 441900101000, '523290', '0769', '石碣镇', '石碣', '广东,东莞,石碣', 'ShiJie', 113.813099, 23.09964);
INSERT INTO `china_region` VALUES (501228, 2, 441900000000, 441900102000, '523326', '0769', '石龙镇', '石龙', '广东,东莞,石龙', 'ShiLong', 113.874378, 23.10591);
INSERT INTO `china_region` VALUES (501239, 2, 441900000000, 441900103000, '523378', '0769', '茶山镇', '茶山', '广东,东莞,茶山', 'ChaShan', 113.869639, 23.076753);
INSERT INTO `china_region` VALUES (501258, 2, 441900000000, 441900104000, '523330', '0769', '石排镇', '石排', '广东,东莞,石排', 'ShiPai', 113.940312, 23.090291);
INSERT INTO `china_region` VALUES (501278, 2, 441900000000, 441900105000, '523499', '0769', '企石镇', '企石', '广东,东莞,企石', 'QiShi', 114.022023, 23.072874);
INSERT INTO `china_region` VALUES (501299, 2, 441900000000, 441900106000, '523460', '0769', '横沥镇', '横沥', '广东,东莞,横沥', 'HengLi', 113.965587, 23.018472);
INSERT INTO `china_region` VALUES (501317, 2, 441900000000, 441900107000, '523539', '0769', '桥头镇', '桥头', '广东,东莞,桥头', 'QiaoTou', 114.103188, 23.024052);
INSERT INTO `china_region` VALUES (501335, 2, 441900000000, 441900108000, '523590', '0769', '谢岗镇', '谢岗', '广东,东莞,谢岗', 'XieGang', 114.148739, 22.961616);
INSERT INTO `china_region` VALUES (501348, 2, 441900000000, 441900109000, '523445', '0769', '东坑镇', '东坑', '广东,东莞,东坑', 'DongKeng', 113.933874, 22.995837);
INSERT INTO `china_region` VALUES (501365, 2, 441900000000, 441900110000, '523570', '0769', '常平镇', '常平', '广东,东莞,常平', 'ChangPing', 114.024762, 22.963709);
INSERT INTO `china_region` VALUES (501399, 2, 441900000000, 441900111000, '523401', '0769', '寮步镇', '寮步', '广东,东莞,寮步', 'LiaoBu', 113.874871, 22.997358);
INSERT INTO `china_region` VALUES (501430, 2, 441900000000, 441900112000, '523622', '0769', '樟木头镇', '樟木', '广东,东莞,樟木', 'ZhangMu', 114.083278, 22.914909);
INSERT INTO `china_region` VALUES (501442, 2, 441900000000, 441900113000, '523770', '0769', '大朗镇', '大朗', '广东,东莞,大朗', 'DaLang', 113.947142, 22.960522);
INSERT INTO `china_region` VALUES (501471, 2, 441900000000, 441900114000, '523750', '0769', '黄江镇', '黄江', '广东,东莞,黄江', 'HuangJiang', 114.003606, 22.915269);
INSERT INTO `china_region` VALUES (501479, 2, 441900000000, 441900115000, '523660', '0769', '清溪镇', '清溪', '广东,东莞,清溪', 'QingXi', 114.16433, 22.844557);
INSERT INTO `china_region` VALUES (501502, 2, 441900000000, 441900116000, '523710', '0769', '塘厦镇', '塘厦', '广东,东莞,塘厦', 'TangSha', 114.072521, 22.806924);
INSERT INTO `china_region` VALUES (501526, 2, 441900000000, 441900117000, '523690', '0769', '凤岗镇', '凤岗', '广东,东莞,凤岗', 'FengGang', 114.136944, 22.74695);
INSERT INTO `china_region` VALUES (501539, 2, 441900000000, 441900118000, '523820', '0769', '大岭山镇', '大岭', '广东,东莞,大岭', 'DaLing', 113.842223, 22.899965);
INSERT INTO `china_region` VALUES (501563, 2, 441900000000, 441900119000, '523846', '0769', '长安镇', '长安', '广东,东莞,长安', 'ChangAn', 113.802491, 22.815256);
INSERT INTO `china_region` VALUES (501577, 2, 441900000000, 441900121000, '523899', '0769', '虎门镇', '虎门', '广东,东莞,虎门', 'HuMen', 113.672552, 22.814835);
INSERT INTO `china_region` VALUES (501610, 2, 441900000000, 441900122000, '523960', '0769', '厚街镇', '厚街', '广东,东莞,厚街', 'HouJie', 113.670858, 22.936359);
INSERT INTO `china_region` VALUES (501635, 2, 441900000000, 441900123000, '523981', '0769', '沙田镇', '沙田', '广东,东莞,沙田', 'ShaTian', 113.618216, 22.919769);
INSERT INTO `china_region` VALUES (501654, 2, 441900000000, 441900124000, '523170', '0769', '道滘镇', '道滘', '广东,东莞,道滘', 'DaoJiao', 113.675232, 23.004362);
INSERT INTO `china_region` VALUES (501669, 2, 441900000000, 441900125000, '523160', '0769', '洪梅镇', '洪梅', '广东,东莞,洪梅', 'HongMei', 113.608904, 22.994717);
INSERT INTO `china_region` VALUES (501680, 2, 441900000000, 441900126000, '523131', '0769', '麻涌镇', '麻涌', '广东,东莞,麻涌', 'MaYong', 113.581134, 23.051137);
INSERT INTO `china_region` VALUES (501696, 2, 441900000000, 441900127000, '523208', '0769', '望牛墩镇', '望牛', '广东,东莞,望牛', 'WangNiu', 113.656243, 23.055331);
INSERT INTO `china_region` VALUES (501719, 2, 441900000000, 441900128000, '523220', '0769', '中堂镇', '中堂', '广东,东莞,中堂', 'ZhongTang', 113.656917, 23.092609);
INSERT INTO `china_region` VALUES (501740, 2, 441900000000, 441900129000, '523287', '0769', '高埗镇', '高埗', '广东,东莞,高埗', 'GaoBu', 113.745782, 23.091326);
INSERT INTO `china_region` VALUES (501760, 2, 441900000000, 441900401000, '523808', '0769', '松山湖', '松山湖', '广东,东莞,松山湖', 'SongShanHu', 113.887817, 22.944498);
INSERT INTO `china_region` VALUES (501762, 2, 441900000000, 441900402000, '523147', '0769', '东莞港', '东莞港', '广东,东莞,东莞港', 'DongGuanGang', 113.751765, 23.020536);
INSERT INTO `china_region` VALUES (501764, 2, 441900000000, 441900403000, '523460', '0769', '东莞生态园', '东莞生态园', '广东,东莞,东莞生态园', 'DongGuanShengTaiYuan', 113.923542, 23.02338);
INSERT INTO `china_region` VALUES (501766, 1, 440000000000, 442000000000, '528400', '0760', '中山市', '中山', '广东,中山', 'ZhongShan', 113.392782, 22.517645);
INSERT INTO `china_region` VALUES (501767, 2, 442000000000, 442000001000, '528305', '0760', '石岐街道', '石岐街道', '广东,中山,石岐街道', 'ShiQiJieDao', 113.392782, 22.517645);
INSERT INTO `china_region` VALUES (501787, 2, 442000000000, 442000002000, '521041', '0760', '东区街道', '东街道', '广东,中山,东街道', 'DongJieDao', 113.398578, 22.513701);
INSERT INTO `china_region` VALUES (501798, 2, 442000000000, 442000003000, '528436', '0760', '中山港街道', '中山港街道', '广东,中山,中山港街道', 'ZhongShanGangJieDao', 113.47457, 22.560023);
INSERT INTO `china_region` VALUES (501806, 2, 442000000000, 442000004000, '521021', '0760', '西区街道', '西街道', '广东,中山,西街道', 'XiJieDao', 113.358988, 22.520088);
INSERT INTO `china_region` VALUES (501816, 2, 442000000000, 442000005000, '515061', '0760', '南区街道', '南街道', '广东,中山,南街道', 'NanJieDao', 113.41359, 22.433286);
INSERT INTO `china_region` VALUES (501821, 2, 442000000000, 442000006000, '528458', '0760', '五桂山街道', '五桂山街道', '广东,中山,五桂山街道', 'WuGuiShanJieDao', 113.402421, 22.446247);
INSERT INTO `china_region` VALUES (501827, 2, 442000000000, 442000100000, '528415', '0760', '小榄镇', '小榄', '广东,中山,小榄', 'XiaoLan', 113.250897, 22.672099);
INSERT INTO `china_region` VALUES (501843, 2, 442000000000, 442000101000, '528429', '0760', '黄圃镇', '黄圃', '广东,中山,黄圃', 'HuangPu', 113.339081, 22.711324);
INSERT INTO `china_region` VALUES (501860, 2, 442000000000, 442000102000, '528441', '0760', '民众镇', '民众', '广东,中山,民众', 'MinZhong', 113.493841, 22.621555);
INSERT INTO `china_region` VALUES (501880, 2, 442000000000, 442000103000, '528425', '0760', '东凤镇', '东凤', '广东,中山,东凤', 'DongFeng', 113.256963, 22.702452);
INSERT INTO `china_region` VALUES (501895, 2, 442000000000, 442000104000, '528414', '0760', '东升镇', '东升', '广东,中山,东升', 'DongSheng', 113.291471, 22.622846);
INSERT INTO `china_region` VALUES (501910, 2, 442000000000, 442000105000, '528421', '0760', '古镇镇', '古镇', '广东,中山,古镇', 'GuZhen', 113.190869, 22.613406);
INSERT INTO `china_region` VALUES (501924, 2, 442000000000, 442000106000, '528471', '0760', '沙溪镇', '沙溪', '广东,中山,沙溪', 'ShaXi', 113.321321, 22.508984);
INSERT INTO `china_region` VALUES (501941, 2, 442000000000, 442000107000, '528467', '0760', '坦洲镇', '坦洲', '广东,中山,坦洲', 'TanZhou', 113.48529, 22.265661);
INSERT INTO `china_region` VALUES (501956, 2, 442000000000, 442000108000, '528447', '0760', '港口镇', '港口', '广东,中山,港口', 'GangKou', 113.385893, 22.585266);
INSERT INTO `china_region` VALUES (501966, 2, 442000000000, 442000109000, '528445', '0760', '三角镇', '三角', '广东,中山,三角', 'SanJiao', 113.418173, 22.67658);
INSERT INTO `china_region` VALUES (501975, 2, 442000000000, 442000110000, '528478', '0760', '横栏镇', '横栏', '广东,中山,横栏', 'HengLan', 113.249104, 22.534847);
INSERT INTO `china_region` VALUES (501987, 2, 442000000000, 442000111000, '528427', '0760', '南头镇', '南头', '广东,中山,南头', 'NanTou', 113.291622, 22.717796);
INSERT INTO `china_region` VALUES (501994, 2, 442000000000, 442000112000, '528434', '0760', '阜沙镇', '阜沙', '广东,中山,阜沙', 'FuSha', 113.349928, 22.667309);
INSERT INTO `china_region` VALUES (502004, 2, 442000000000, 442000113000, '528449', '0760', '南朗镇', '南朗', '广东,中山,南朗', 'NanLang', 113.530998, 22.498612);
INSERT INTO `china_region` VALUES (502020, 2, 442000000000, 442000114000, '528463', '0760', '三乡镇', '三乡', '广东,中山,三乡', 'SanXiang', 113.441608, 22.357768);
INSERT INTO `china_region` VALUES (502037, 2, 442000000000, 442000115000, '528459', '0760', '板芙镇', '板芙', '广东,中山,板芙', 'BanFu', 113.337964, 22.393741);
INSERT INTO `china_region` VALUES (502049, 2, 442000000000, 442000116000, '528476', '0760', '大涌镇', '大涌', '广东,中山,大涌', 'DaYong', 113.300377, 22.465302);
INSERT INTO `china_region` VALUES (502061, 2, 442000000000, 442000117000, '528462', '0760', '神湾镇', '神湾', '广东,中山,神湾', 'ShenWan', 113.363817, 22.302496);
INSERT INTO `china_region` VALUES (502068, 1, 440000000000, 445100000000, '521000', '0768', '潮州市', '潮州', '广东,潮州', 'ChaoZhou', 116.622603, 23.65695);
INSERT INTO `china_region` VALUES (502069, 2, 445100000000, 445101000000, '521000', '0768', '市辖区', '潮州', '广东,潮州', 'ChaoZhou', 116.622603, 23.65695);
INSERT INTO `china_region` VALUES (502070, 2, 445100000000, 445102000000, '521000', '0768', '湘桥区', '湘桥', '广东,潮州,湘桥', 'XiangQiao', 116.628632, 23.674536);
INSERT INTO `china_region` VALUES (502263, 2, 445100000000, 445103000000, '515653', '0768', '潮安区', '潮安', '广东,潮州,潮安', 'ChaoAn', 116.678204, 23.462613);
INSERT INTO `china_region` VALUES (502738, 2, 445100000000, 445122000000, '515700', '0768', '饶平县', '饶平', '广东,潮州,饶平', 'RaoPing', 117.0039, 23.663824);
INSERT INTO `china_region` VALUES (503164, 1, 440000000000, 445200000000, '522000', '0663', '揭阳市', '揭阳', '广东,揭阳', 'JieYang', 116.372831, 23.549993);
INSERT INTO `china_region` VALUES (503165, 2, 445200000000, 445201000000, '522000', '0663', '市辖区', '揭阳', '广东,揭阳', 'JieYang', 116.372831, 23.549993);
INSERT INTO `china_region` VALUES (503166, 2, 445200000000, 445202000000, '522000', '0663', '榕城区', '榕城', '广东,揭阳,榕城', 'RongCheng', 116.367035, 23.525229);
INSERT INTO `china_region` VALUES (503379, 2, 445200000000, 445203000000, '515525', '0663', '揭东区', '揭东', '广东,揭阳,揭东', 'JieDong', 116.412015, 23.566127);
INSERT INTO `china_region` VALUES (503617, 2, 445200000000, 445222000000, '515400', '0663', '揭西县', '揭西', '广东,揭阳,揭西', 'JieXi', 115.841838, 23.431294);
INSERT INTO `china_region` VALUES (503965, 2, 445200000000, 445224000000, '515200', '0663', '惠来县', '惠来', '广东,揭阳,惠来', 'HuiLai', 116.29515, 23.033267);
INSERT INTO `china_region` VALUES (504312, 2, 445200000000, 445281000000, '515300', '0663', '普宁市', '普宁', '广东,揭阳,普宁', 'PuNing', 116.166004, 23.297642);
INSERT INTO `china_region` VALUES (504924, 1, 440000000000, 445300000000, '510530', '0766', '云浮市', '云浮', '广东,云浮', 'YunFu', 112.044491, 22.915094);
INSERT INTO `china_region` VALUES (504925, 2, 445300000000, 445301000000, '527300', '0766', '市辖区', '云浮', '广东,云浮', 'YunFu', 112.044491, 22.915094);
INSERT INTO `china_region` VALUES (504926, 2, 445300000000, 445302000000, '527300', '0766', '云城区', '云城', '广东,云浮,云城', 'YunCheng', 112.043832, 22.928097);
INSERT INTO `china_region` VALUES (505052, 2, 445300000000, 445303000000, '527523', '0766', '云安区', '云安', '广东,云浮,云安', 'YunAn', 112.003209, 23.07102);
INSERT INTO `china_region` VALUES (505176, 2, 445300000000, 445321000000, '527400', '0766', '新兴县', '新兴', '广东,云浮,新兴', 'XinXing', 112.225335, 22.69569);
INSERT INTO `china_region` VALUES (505394, 2, 445300000000, 445322000000, '527100', '0766', '郁南县', '郁南', '广东,云浮,郁南', 'YuNan', 111.535249, 23.234627);
INSERT INTO `china_region` VALUES (505618, 2, 445300000000, 445381000000, '527200', '0766', '罗定市', '罗定', '广东,云浮,罗定', 'LuoDing', 111.569667, 22.768939);
INSERT INTO `china_region` VALUES (505978, 0, 0, 450000000000, '0', NULL, '广西壮族自治区', '广西', '广西', 'GuangXi', 108.327546, 22.815478);
INSERT INTO `china_region` VALUES (505979, 1, 450000000000, 450100000000, '530000', '0771', '南宁市', '南宁', '广西,南宁', 'NanNing', 108.366543, 22.817002);
INSERT INTO `china_region` VALUES (505980, 2, 450100000000, 450101000000, '530000', '0771', '市辖区', '南宁', '广西,南宁', 'NanNing', 108.366543, 22.817002);
INSERT INTO `china_region` VALUES (505981, 2, 450100000000, 450102000000, '530000', '0771', '兴宁区', '兴宁', '广西,南宁,兴宁', 'XingNing', 108.368871, 22.854021);
INSERT INTO `china_region` VALUES (506063, 2, 450100000000, 450103000000, '530000', '0771', '青秀区', '青秀', '广西,南宁,青秀', 'QingXiu', 108.494024, 22.785879);
INSERT INTO `china_region` VALUES (506180, 2, 450100000000, 450105000000, '530000', '0771', '江南区', '江南', '广西,南宁,江南', 'JiangNan', 108.273158, 22.781632);
INSERT INTO `china_region` VALUES (506310, 2, 450100000000, 450107000000, '530000', '0771', '西乡塘区', '西乡塘', '广西,南宁,西乡塘', 'XiXiangTang', 108.306886, 22.83277);
INSERT INTO `china_region` VALUES (506480, 2, 450100000000, 450108000000, '530200', '0771', '良庆区', '良庆', '广西,南宁,良庆', 'LiangQing', 108.322102, 22.75909);
INSERT INTO `china_region` VALUES (506568, 2, 450100000000, 450109000000, '530200', '0771', '邕宁区', '邕宁', '广西,南宁,邕宁', 'YongNing', 108.487369, 22.75839);
INSERT INTO `china_region` VALUES (506649, 2, 450100000000, 450110000000, '530100', '0771', '武鸣区', '武鸣', '广西,南宁,武鸣', 'WuMing', 108.274712, 23.158693);
INSERT INTO `china_region` VALUES (506894, 2, 450100000000, 450123000000, '532700', '0771', '隆安县', '隆安', '广西,南宁,隆安', 'LongAn', 107.696153, 23.166028);
INSERT INTO `china_region` VALUES (507044, 2, 450100000000, 450124000000, '530600', '0771', '马山县', '马山', '广西,南宁,马山', 'MaShan', 108.176979, 23.708192);
INSERT INTO `china_region` VALUES (507212, 2, 450100000000, 450125000000, '530500', '0771', '上林县', '上林', '广西,南宁,上林', 'ShangLin', 108.604921, 23.431936);
INSERT INTO `china_region` VALUES (507358, 2, 450100000000, 450126000000, '530400', '0771', '宾阳县', '宾阳', '广西,南宁,宾阳', 'BinYang', 108.810326, 23.217832);
INSERT INTO `china_region` VALUES (507611, 2, 450100000000, 450127000000, '530300', '0771', '横县', '横县', '广西,南宁,横县', 'HengXian', 109.261384, 22.679932);
INSERT INTO `china_region` VALUES (507941, 1, 450000000000, 450200000000, '545000', '0772', '柳州市', '柳州', '广西,柳州', 'LiuZhou', 109.415953, 24.325502);
INSERT INTO `china_region` VALUES (507942, 2, 450200000000, 450201000000, '545000', '0772', '市辖区', '柳州', '广西,柳州', 'LiuZhou', 109.415953, 24.325502);
INSERT INTO `china_region` VALUES (507943, 2, 450200000000, 450202000000, '545000', '0772', '城中区', '城中', '广西,柳州,城中', 'ChengZhong', 109.410736, 24.315602);
INSERT INTO `china_region` VALUES (507984, 2, 450200000000, 450203000000, '545000', '0772', '鱼峰区', '鱼峰', '广西,柳州,鱼峰', 'YuFeng', 109.452442, 24.318517);
INSERT INTO `china_region` VALUES (508092, 2, 450200000000, 450204000000, '545000', '0772', '柳南区', '柳南', '广西,柳州,柳南', 'LiuNan', 109.385519, 24.336229);
INSERT INTO `china_region` VALUES (508202, 2, 450200000000, 450205000000, '545000', '0772', '柳北区', '柳北', '广西,柳州,柳北', 'LiuBei', 109.40205, 24.362691);
INSERT INTO `china_region` VALUES (508313, 2, 450200000000, 450206000000, '545100', '0772', '柳江区', '柳江', '广西,柳州,柳江', 'LiuJiang', 109.32638, 24.254892);
INSERT INTO `china_region` VALUES (508440, 2, 450200000000, 450222000000, '545200', '0772', '柳城县', '柳城', '广西,柳州,柳城', 'LiuCheng', 109.24473, 24.651518);
INSERT INTO `china_region` VALUES (508593, 2, 450200000000, 450223000000, '545600', '0772', '鹿寨县', '鹿寨', '广西,柳州,鹿寨', 'LuZhai', 109.750638, 24.472897);
INSERT INTO `china_region` VALUES (508721, 2, 450200000000, 450224000000, '545400', '0772', '融安县', '融安', '广西,柳州,融安', 'RongAn', 109.397538, 25.22455);
INSERT INTO `china_region` VALUES (508883, 2, 450200000000, 450225000000, '545300', '0772', '融水苗族自治县', '融水', '广西,柳州,融水', 'RongShui', 109.256334, 25.065934);
INSERT INTO `china_region` VALUES (509111, 2, 450200000000, 450226000000, '545500', '0772', '三江侗族自治县', '三江', '广西,柳州,三江', 'SanJiang', 109.607675, 25.783198);
INSERT INTO `china_region` VALUES (509297, 1, 450000000000, 450300000000, '541000', '0773', '桂林市', '桂林', '广西,桂林', 'GuiLin', 110.290194, 25.273566);
INSERT INTO `china_region` VALUES (509298, 2, 450300000000, 450301000000, '541000', '0773', '市辖区', '桂林', '广西,桂林', 'GuiLin', 110.290194, 25.273566);
INSERT INTO `china_region` VALUES (509299, 2, 450300000000, 450302000000, '541000', '0773', '秀峰区', '秀峰', '广西,桂林,秀峰', 'XiuFeng', 110.264183, 25.273625);
INSERT INTO `china_region` VALUES (509331, 2, 450300000000, 450303000000, '541000', '0773', '叠彩区', '叠彩', '广西,桂林,叠彩', 'DieCai', 110.301723, 25.314001);
INSERT INTO `china_region` VALUES (509371, 2, 450300000000, 450304000000, '541000', '0773', '象山区', '象山', '广西,桂林,象山', 'XiangShan', 110.281082, 25.261687);
INSERT INTO `china_region` VALUES (509420, 2, 450300000000, 450305000000, '541000', '0773', '七星区', '七星', '广西,桂林,七星', 'QiXing', 110.317826, 25.252701);
INSERT INTO `china_region` VALUES (509477, 2, 450300000000, 450311000000, '541000', '0773', '雁山区', '雁山', '广西,桂林,雁山', 'YanShan', 110.28669, 25.101935);
INSERT INTO `china_region` VALUES (509525, 2, 450300000000, 450312000000, '541100', '0773', '临桂区', '临桂', '广西,桂林,临桂', 'LinGui', 110.212463, 25.238628);
INSERT INTO `china_region` VALUES (509708, 2, 450300000000, 450321000000, '541900', '0773', '阳朔县', '阳朔', '广西,桂林,阳朔', 'YangShuo', 110.496593, 24.778481);
INSERT INTO `china_region` VALUES (509832, 2, 450300000000, 450323000000, '541200', '0773', '灵川县', '灵川', '广西,桂林,灵川', 'LingChuan', 110.325636, 25.409747);
INSERT INTO `china_region` VALUES (509994, 2, 450300000000, 450324000000, '541500', '0773', '全州县', '全州', '广西,桂林,全州', 'QuanZhou', 111.072926, 25.928617);
INSERT INTO `china_region` VALUES (510299, 2, 450300000000, 450325000000, '541300', '0773', '兴安县', '兴安', '广西,桂林,兴安', 'XingAn', 110.67167, 25.611705);
INSERT INTO `china_region` VALUES (510435, 2, 450300000000, 450326000000, '541800', '0773', '永福县', '永福', '广西,桂林,永福', 'YongFu', 109.983076, 24.979856);
INSERT INTO `china_region` VALUES (510544, 2, 450300000000, 450327000000, '541600', '0773', '灌阳县', '灌阳', '广西,桂林,灌阳', 'GuanYang', 111.160851, 25.489383);
INSERT INTO `china_region` VALUES (510696, 2, 450300000000, 450328000000, '541700', '0773', '龙胜各族自治县', '龙胜各族', '广西,桂林,龙胜各族', 'LongShengGeZu', 110.011238, 25.797931);
INSERT INTO `china_region` VALUES (510835, 2, 450300000000, 450329000000, '541400', '0773', '资源县', '资源', '广西,桂林,资源', 'ZiYuan', 110.6527, 26.042443);
INSERT INTO `china_region` VALUES (510917, 2, 450300000000, 450330000000, '542400', '0773', '平乐县', '平乐', '广西,桂林,平乐', 'PingLe', 110.643305, 24.633362);
INSERT INTO `china_region` VALUES (511083, 2, 450300000000, 450332000000, '542500', '0773', '恭城瑶族自治县', '恭城', '广西,桂林,恭城', 'GongCheng', 110.82841, 24.831682);
INSERT INTO `china_region` VALUES (511220, 2, 450300000000, 450381000000, '546600', '0773', '荔浦市', '荔浦', '广西,桂林,荔浦', 'LiPu', 110.395287, 24.487824);
INSERT INTO `china_region` VALUES (511378, 1, 450000000000, 450400000000, '543000', '0774', '梧州市', '梧州', '广西,梧州', 'WuZhou', 111.279115, 23.476962);
INSERT INTO `china_region` VALUES (511379, 2, 450400000000, 450401000000, '543000', '0774', '市辖区', '梧州', '广西,梧州', 'WuZhou', 111.279115, 23.476962);
INSERT INTO `china_region` VALUES (511380, 2, 450400000000, 450403000000, '543000', '0774', '万秀区', '万秀', '广西,梧州,万秀', 'WanXiu', 111.320542, 23.472962);
INSERT INTO `china_region` VALUES (511452, 2, 450400000000, 450405000000, '543000', '0774', '长洲区', '长洲', '广西,梧州,长洲', 'ChangZhou', 111.274777, 23.485695);
INSERT INTO `china_region` VALUES (511503, 2, 450400000000, 450406000000, '543199', '0774', '龙圩区', '龙圩', '广西,梧州,龙圩', 'LongWei', 111.246035, 23.40996);
INSERT INTO `china_region` VALUES (511587, 2, 450400000000, 450421000000, '543100', '0774', '苍梧县', '苍梧', '广西,梧州,苍梧', 'CangWu', 111.544008, 23.845097);
INSERT INTO `china_region` VALUES (511743, 2, 450400000000, 450422000000, '543300', '0774', '藤县', '藤县', '广西,梧州,藤县', 'TengXian', 110.914849, 23.374984);
INSERT INTO `china_region` VALUES (512059, 2, 450400000000, 450423000000, '546700', '0774', '蒙山县', '蒙山', '广西,梧州,蒙山', 'MengShan', 110.525003, 24.19357);
INSERT INTO `china_region` VALUES (512153, 2, 450400000000, 450481000000, '543200', '0774', '岑溪市', '岑溪', '广西,梧州,岑溪', 'CenXi', 110.994913, 22.91835);
INSERT INTO `china_region` VALUES (512450, 1, 450000000000, 450500000000, '536000', '0779', '北海市', '北海', '广西,北海', 'BeiHai', 109.119927, 21.481254);
INSERT INTO `china_region` VALUES (512451, 2, 450500000000, 450501000000, '536000', '0779', '市辖区', '北海', '广西,北海', 'BeiHai', 109.119927, 21.481254);
INSERT INTO `china_region` VALUES (512452, 2, 450500000000, 450502000000, '536000', '0779', '海城区', '海城', '广西,北海,海城', 'HaiCheng', 109.11721, 21.475005);
INSERT INTO `china_region` VALUES (512525, 2, 450500000000, 450503000000, '536000', '0779', '银海区', '银海', '广西,北海,银海', 'YinHai', 109.13999, 21.449219);
INSERT INTO `china_region` VALUES (512583, 2, 450500000000, 450512000000, '536000', '0779', '铁山港区', '铁山港', '广西,北海,铁山港', 'TieShanGang', 109.421581, 21.529128);
INSERT INTO `china_region` VALUES (512630, 2, 450500000000, 450521000000, '536100', '0779', '合浦县', '合浦', '广西,北海,合浦', 'HePu', 109.207336, 21.660936);
INSERT INTO `china_region` VALUES (512922, 1, 450000000000, 450600000000, '538000', '0770', '防城港市', '防城港', '广西,防城港', 'FangChengGang', 108.353846, 21.68686);
INSERT INTO `china_region` VALUES (512923, 2, 450600000000, 450601000000, '538000', '0770', '市辖区', '防城港', '广西,防城港', 'FangChengGang', 108.353846, 21.68686);
INSERT INTO `china_region` VALUES (512924, 2, 450600000000, 450602000000, '538000', '0770', '港口区', '港口', '广西,防城港,港口', 'GangKou', 108.380144, 21.643384);
INSERT INTO `china_region` VALUES (512972, 2, 450600000000, 450603000000, '538000', '0770', '防城区', '防城', '广西,防城港', 'FangCheng', 108.353499, 21.769212);
INSERT INTO `china_region` VALUES (513155, 2, 450600000000, 450621000000, '535500', '0770', '上思县', '上思', '广西,防城港,上思', 'ShangSi', 107.983626, 22.153672);
INSERT INTO `china_region` VALUES (513258, 2, 450600000000, 450681000000, '538100', '0770', '东兴市', '东兴', '广西,防城港,东兴', 'DongXing', 107.971826, 21.547822);
INSERT INTO `china_region` VALUES (513304, 1, 450000000000, 450700000000, '535000', '0777', '钦州市', '钦州', '广西,钦州', 'QinZhou', 108.654146, 21.979933);
INSERT INTO `china_region` VALUES (513305, 2, 450700000000, 450701000000, '535000', '0777', '市辖区', '钦州', '广西,钦州', 'QinZhou', 108.654146, 21.979933);
INSERT INTO `china_region` VALUES (513306, 2, 450700000000, 450702000000, '535000', '0777', '钦南区', '钦南', '广西,钦州,钦南', 'QinNan', 108.65721, 21.93886);
INSERT INTO `china_region` VALUES (513499, 2, 450700000000, 450703000000, '535000', '0777', '钦北区', '钦北', '广西,钦州,钦北', 'QinBei', 108.44911, 22.132761);
INSERT INTO `china_region` VALUES (513697, 2, 450700000000, 450721000000, '535400', '0777', '灵山县', '灵山', '广西,钦州,灵山', 'LingShan', 109.291007, 22.416537);
INSERT INTO `china_region` VALUES (514131, 2, 450700000000, 450722000000, '535300', '0777', '浦北县', '浦北', '广西,钦州,浦北', 'PuBei', 109.556953, 22.271651);
INSERT INTO `china_region` VALUES (514423, 1, 450000000000, 450800000000, '537000', '1755', '贵港市', '贵港', '广西,贵港', 'GuiGang', 109.598926, 23.11153);
INSERT INTO `china_region` VALUES (514424, 2, 450800000000, 450801000000, '537000', '1755', '市辖区', '贵港', '广西,贵港', 'GuiGang', 109.598926, 23.11153);
INSERT INTO `china_region` VALUES (514425, 2, 450800000000, 450802000000, '537100', '1755', '港北区', '港北', '广西,贵港,港北', 'GangBei', 109.57224, 23.111531);
INSERT INTO `china_region` VALUES (514558, 2, 450800000000, 450803000000, '537100', '1755', '港南区', '港南', '广西,贵港,港南', 'GangNan', 109.599557, 23.075573);
INSERT INTO `china_region` VALUES (514735, 2, 450800000000, 450804000000, '537100', '1755', '覃塘区', '覃塘', '广西,贵港,覃塘', 'TanTang', 109.452662, 23.127149);
INSERT INTO `china_region` VALUES (514892, 2, 450800000000, 450821000000, '537300', '1755', '平南县', '平南', '广西,贵港,平南', 'PingNan', 110.392168, 23.539127);
INSERT INTO `china_region` VALUES (515210, 2, 450800000000, 450881000000, '537200', '1755', '桂平市', '桂平', '广西,贵港,桂平', 'GuiPing', 110.079379, 23.394326);
INSERT INTO `china_region` VALUES (515674, 1, 450000000000, 450900000000, '537000', '0775', '玉林市', '玉林', '广西,玉林', 'YuLin', 110.164756, 22.636379);
INSERT INTO `china_region` VALUES (515675, 2, 450900000000, 450901000000, '537000', '0775', '市辖区', '玉林', '广西,玉林', 'YuLin', 110.164756, 22.636379);
INSERT INTO `china_region` VALUES (515676, 2, 450900000000, 450902000000, '537000', '0775', '玉州区', '玉州', '广西,玉林,玉州', 'YuZhou', 110.151088, 22.628062);
INSERT INTO `china_region` VALUES (515794, 2, 450900000000, 450903000000, '537023', '0775', '福绵区', '福绵', '广西,玉林,福绵', 'FuMian', 110.059439, 22.585557);
INSERT INTO `china_region` VALUES (515917, 2, 450900000000, 450921000000, '537500', '0775', '容县', '容县', '广西,玉林,容县', 'RongXian', 110.557874, 22.857823);
INSERT INTO `china_region` VALUES (516160, 2, 450900000000, 450922000000, '537700', '0775', '陆川县', '陆川', '广西,玉林,陆川', 'LuChuan', 110.264052, 22.321048);
INSERT INTO `china_region` VALUES (516340, 2, 450900000000, 450923000000, '537600', '0775', '博白县', '博白', '广西,玉林,博白', 'BoBai', 109.975985, 22.273048);
INSERT INTO `china_region` VALUES (516728, 2, 450900000000, 450924000000, '537800', '0775', '兴业县', '兴业', '广西,玉林,兴业', 'XingYe', 109.876855, 22.820746);
INSERT INTO `china_region` VALUES (516957, 2, 450900000000, 450981000000, '537400', '0775', '北流市', '北流', '广西,玉林,北流', 'BeiLiu', 110.354215, 22.708311);
INSERT INTO `china_region` VALUES (517298, 1, 450000000000, 451000000000, '533000', '0776', '百色市', '百色', '广西,百色', 'BaiSe', 106.618201, 23.902333);
INSERT INTO `china_region` VALUES (517299, 2, 451000000000, 451001000000, '533000', '0776', '市辖区', '百色', '广西,百色', 'BaiSe', 106.618201, 23.902333);
INSERT INTO `china_region` VALUES (517300, 2, 451000000000, 451002000000, '533000', '0776', '右江区', '右江', '广西,百色,右江', 'YouJiang', 106.618645, 23.901383);
INSERT INTO `china_region` VALUES (517431, 2, 451000000000, 451003000000, '533600', '0776', '田阳区', '田阳', '广西,百色,田阳', 'TianYang', 106.915418, 23.735682);
INSERT INTO `china_region` VALUES (517599, 2, 451000000000, 451022000000, '531500', '0776', '田东县', '田东', '广西,百色,田东', 'TianDong', 107.126081, 23.597194);
INSERT INTO `china_region` VALUES (517782, 2, 451000000000, 451023000000, '531400', '0776', '平果县', '平果', '广西,百色,平果', 'PingGuo', 107.58981, 23.329376);
INSERT INTO `china_region` VALUES (517980, 2, 451000000000, 451024000000, '533700', '0776', '德保县', '德保', '广西,百色,德保', 'DeBao', 106.615374, 23.32345);
INSERT INTO `china_region` VALUES (518180, 2, 451000000000, 451026000000, '533900', '0776', '那坡县', '那坡', '广西,百色,那坡', 'NaPo', 105.83253, 23.387441);
INSERT INTO `china_region` VALUES (518320, 2, 451000000000, 451027000000, '533100', '0776', '凌云县', '凌云', '广西,百色,凌云', 'LingYun', 106.56131, 24.347557);
INSERT INTO `china_region` VALUES (518439, 2, 451000000000, 451028000000, '533200', '0776', '乐业县', '乐业', '广西,百色,乐业', 'LeYe', 106.556519, 24.776827);
INSERT INTO `china_region` VALUES (518536, 2, 451000000000, 451029000000, '533300', '0776', '田林县', '田林', '广西,百色,田林', 'TianLin', 106.228538, 24.294488);
INSERT INTO `china_region` VALUES (518719, 2, 451000000000, 451030000000, '533500', '0776', '西林县', '西林', '广西,百色,西林', 'XiLin', 105.093837, 24.48981);
INSERT INTO `china_region` VALUES (518825, 2, 451000000000, 451031000000, '533500', '0776', '隆林各族自治县', '隆林各族', '广西,百色,隆林各族', 'LongLinGeZu', 105.34404, 24.770896);
INSERT INTO `china_region` VALUES (519021, 2, 451000000000, 451081000000, '533800', '0776', '靖西市', '靖西', '广西,百色,靖西', 'JingXi', 106.417549, 23.134766);
INSERT INTO `china_region` VALUES (519334, 1, 450000000000, 451100000000, '542800', '1774', '贺州市', '贺州', '广西,贺州', 'HeZhou', 111.566694, 24.403582);
INSERT INTO `china_region` VALUES (519335, 2, 451100000000, 451101000000, '542800', '1774', '市辖区', '贺州', '广西,贺州', 'HeZhou', 111.566694, 24.403582);
INSERT INTO `china_region` VALUES (519336, 2, 451100000000, 451102000000, '542800', '1774', '八步区', '八步', '广西,贺州,八步', 'BaBu', 111.552077, 24.411811);
INSERT INTO `china_region` VALUES (519556, 2, 451100000000, 451103000000, '542827', '1774', '平桂区', '平桂', '广西,贺州,平桂', 'PingGui', 111.566694, 24.403582);
INSERT INTO `china_region` VALUES (519690, 2, 451100000000, 451121000000, '546800', '1774', '昭平县', '昭平', '广西,贺州,昭平', 'ZhaoPing', 110.811287, 24.16948);
INSERT INTO `china_region` VALUES (519862, 2, 451100000000, 451122000000, '542600', '1774', '钟山县', '钟山', '广西,贺州,钟山', 'ZhongShan', 111.303111, 24.526022);
INSERT INTO `china_region` VALUES (519991, 2, 451100000000, 451123000000, '542700', '1774', '富川瑶族自治县', '富川', '广西,贺州,富川', 'FuChuan', 111.277389, 24.814444);
INSERT INTO `china_region` VALUES (520160, 1, 450000000000, 451200000000, '547000', '0778', '河池市', '河池', '广西,河池', 'HeChi', 108.085261, 24.692931);
INSERT INTO `china_region` VALUES (520161, 2, 451200000000, 451201000000, '547000', '0778', '市辖区', '河池', '广西,河池', 'HeChi', 108.085261, 24.692931);
INSERT INTO `china_region` VALUES (520162, 2, 451200000000, 451202000000, '547000', '0778', '金城江区', '金城江', '广西,河池,金城江', 'JinChengJiang', 108.037277, 24.689703);
INSERT INTO `china_region` VALUES (520320, 2, 451200000000, 451203000000, '546300', '0778', '宜州区', '宜州', '广西,河池,宜州', 'YiZhou', 108.085261, 24.692931);
INSERT INTO `china_region` VALUES (520547, 2, 451200000000, 451221000000, '547200', '0778', '南丹县', '南丹', '广西,河池,南丹', 'NanDan', 107.540722, 24.974486);
INSERT INTO `china_region` VALUES (520714, 2, 451200000000, 451222000000, '547300', '0778', '天峨县', '天峨', '广西,河池,天峨', 'TianE', 107.173802, 24.999108);
INSERT INTO `china_region` VALUES (520819, 2, 451200000000, 451223000000, '547600', '0778', '凤山县', '凤山', '广西,河池,凤山', 'FengShan', 107.042191, 24.546876);
INSERT INTO `china_region` VALUES (520927, 2, 451200000000, 451224000000, '547400', '0778', '东兰县', '东兰', '广西,河池,东兰', 'DongLan', 107.374294, 24.510842);
INSERT INTO `china_region` VALUES (521091, 2, 451200000000, 451225000000, '546400', '0778', '罗城仫佬族自治县', '罗城', '广西,河池,罗城', 'LuoCheng', 108.904761, 24.777421);
INSERT INTO `china_region` VALUES (521247, 2, 451200000000, 451226000000, '547100', '0778', '环江毛南族自治县', '环江', '广西,河池,环江', 'HuanJiang', 108.258028, 24.825664);
INSERT INTO `china_region` VALUES (521407, 2, 451200000000, 451227000000, '547500', '0778', '巴马瑶族自治县', '巴马', '广西,河池,巴马', 'BaMa', 107.258588, 24.142299);
INSERT INTO `china_region` VALUES (521527, 2, 451200000000, 451228000000, '530700', '0778', '都安瑶族自治县', '都安', '广西,河池,都安', 'DuAn', 108.105312, 23.932675);
INSERT INTO `china_region` VALUES (521801, 2, 451200000000, 451229000000, '530800', '0778', '大化瑶族自治县', '大化', '广西,河池,大化', 'DaHua', 107.99815, 23.736457);
INSERT INTO `china_region` VALUES (521978, 1, 450000000000, 451300000000, '546100', '1772', '来宾市', '来宾', '广西,来宾', 'LaiBin', 109.221465, 23.750306);
INSERT INTO `china_region` VALUES (521979, 2, 451300000000, 451301000000, '546100', '1772', '市辖区', '来宾', '广西,来宾', 'LaiBin', 109.221465, 23.750306);
INSERT INTO `china_region` VALUES (521980, 2, 451300000000, 451302000000, '546100', '1772', '兴宾区', '兴宾', '广西,来宾,兴宾', 'XingBin', 109.233247, 23.736153);
INSERT INTO `china_region` VALUES (522302, 2, 451300000000, 451321000000, '546200', '1772', '忻城县', '忻城', '广西,来宾,忻城', 'XinCheng', 108.665666, 24.066235);
INSERT INTO `china_region` VALUES (522447, 2, 451300000000, 451322000000, '545800', '1772', '象州县', '象州', '广西,来宾,象州', 'XiangZhou', 109.683985, 23.958528);
INSERT INTO `china_region` VALUES (522585, 2, 451300000000, 451323000000, '545900', '1772', '武宣县', '武宣', '广西,来宾,武宣', 'WuXuan', 109.663207, 23.59411);
INSERT INTO `china_region` VALUES (522748, 2, 451300000000, 451324000000, '545700', '1772', '金秀瑶族自治县', '金秀', '广西,来宾,金秀', 'JinXiu', 110.189462, 24.130374);
INSERT INTO `china_region` VALUES (522842, 2, 451300000000, 451381000000, '546500', '1772', '合山市', '合山', '广西,来宾,合山', 'HeShan', 108.886082, 23.806536);
INSERT INTO `china_region` VALUES (522882, 1, 450000000000, 451400000000, '532200', '1771', '崇左市', '崇左', '广西,崇左', 'ChongZuo', 107.364711, 22.376532);
INSERT INTO `china_region` VALUES (522883, 2, 451400000000, 451401000000, '532200', '1771', '市辖区', '崇左', '广西,崇左', 'ChongZuo', 107.364711, 22.376532);
INSERT INTO `china_region` VALUES (522884, 2, 451400000000, 451402000000, '532203', '1771', '江州区', '江州', '广西,崇左,江州', 'JiangZhou', 107.353437, 22.405325);
INSERT INTO `china_region` VALUES (523041, 2, 451400000000, 451421000000, '543200', '1771', '扶绥县', '扶绥', '广西,崇左,扶绥', 'FuSui', 107.904187, 22.635013);
INSERT INTO `china_region` VALUES (523189, 2, 451400000000, 451422000000, '532500', '1771', '宁明县', '宁明', '广西,崇左,宁明', 'NingMing', 107.076457, 22.140192);
INSERT INTO `china_region` VALUES (523387, 2, 451400000000, 451423000000, '532400', '1771', '龙州县', '龙州', '广西,崇左,龙州', 'LongZhou', 106.854451, 22.342797);
INSERT INTO `china_region` VALUES (523534, 2, 451400000000, 451424000000, '532300', '1771', '大新县', '大新', '广西,崇左,大新', 'DaXin', 107.200654, 22.829288);
INSERT INTO `china_region` VALUES (523707, 2, 451400000000, 451425000000, '532800', '1771', '天等县', '天等', '广西,崇左,天等', 'TianDeng', 107.143433, 23.081394);
INSERT INTO `china_region` VALUES (523846, 2, 451400000000, 451481000000, '532600', '1771', '凭祥市', '凭祥', '广西,崇左,凭祥', 'PingXiang', 106.766293, 22.094485);
INSERT INTO `china_region` VALUES (523893, 0, 0, 460000000000, '0', NULL, '海南省', '海南', '海南', 'HaiNan', 110.349228, 20.017377);
INSERT INTO `china_region` VALUES (523894, 1, 460000000000, 460100000000, '570100', '0898', '海口市', '海口', '海南,海口', 'HaiKou', 110.198293, 20.044001);
INSERT INTO `china_region` VALUES (523895, 2, 460100000000, 460101000000, '570100', '0898', '市辖区', '海口', '海南,海口', 'HaiKou', 110.198293, 20.044001);
INSERT INTO `china_region` VALUES (523896, 2, 460100000000, 460105000000, '570100', '0898', '秀英区', '秀英', '海南,海口,秀英', 'XiuYing', 110.293561, 20.007969);
INSERT INTO `china_region` VALUES (524000, 2, 460100000000, 460106000000, '570100', '0898', '龙华区', '龙华', '海南,海口,龙华', 'LongHua', 110.328492, 20.031007);
INSERT INTO `china_region` VALUES (524141, 2, 460100000000, 460107000000, '571100', '0898', '琼山区', '琼山', '海南,海口,琼山', 'QiongShan', 110.353972, 20.00317);
INSERT INTO `china_region` VALUES (524273, 2, 460100000000, 460108000000, '570100', '0898', '美兰区', '美兰', '海南,海口,美兰', 'MeiLan', 110.366357, 20.029083);
INSERT INTO `china_region` VALUES (524413, 1, 460000000000, 460200000000, '572000', '0899', '三亚市', '三亚', '海南,三亚', 'SanYa', 109.511909, 18.252847);
INSERT INTO `china_region` VALUES (524414, 2, 460200000000, 460201000000, '572000', '0899', '市辖区', '三亚', '海南,三亚', 'SanYa', 109.511909, 18.252847);
INSERT INTO `china_region` VALUES (524415, 2, 460200000000, 460202000000, '572024', '0899', '海棠区', '海棠', '海南,三亚,海棠', 'HaiTang', 109.760778, 18.407516);
INSERT INTO `china_region` VALUES (524440, 2, 460200000000, 460203000000, '572011', '0899', '吉阳区', '吉阳', '海南,三亚,吉阳', 'JiYang', 109.57833, 18.281397);
INSERT INTO `china_region` VALUES (524481, 2, 460200000000, 460204000000, '572029', '0899', '天涯区', '天涯', '海南,三亚,天涯', 'TianYa', 109.506357, 18.24734);
INSERT INTO `china_region` VALUES (524539, 2, 460200000000, 460205000000, '571763', '0899', '崖州区', '崖州', '海南,三亚,崖州', 'YaZhou', 109.174313, 18.352212);
INSERT INTO `china_region` VALUES (524573, 1, 460000000000, 460300000000, '573100', '2898', '三沙市', '三沙', '海南,三沙', 'SanSha', 112.338695, 16.831839);
INSERT INTO `china_region` VALUES (524574, 2, 460300000000, 460321000000, '572000', '2898', '西沙群岛', '西沙', '海南,三沙,西沙', 'XiSha', 112.026538, 16.330358);
INSERT INTO `china_region` VALUES (524586, 2, 460300000000, 460322000000, '570206', '2898', '南沙群岛', '南沙', '海南,三沙,南沙', 'NanSha', 112.338695, 16.831839);
INSERT INTO `china_region` VALUES (524589, 2, 460300000000, 460323000000, '572635', '2898', '中沙群岛的岛礁及其海域', '中沙', '海南,三沙,中沙', 'ZhongSha', 112.338695, 16.831839);
INSERT INTO `china_region` VALUES (524592, 1, 460000000000, 460400000000, '571700', '0805', '儋州市', '儋州', '海南,儋州', 'DanZhou', 109.580811, 19.521134);
INSERT INTO `china_region` VALUES (524593, 2, 460400000000, 460400100000, '571756', '0805', '那大镇', '那大', '海南,儋州,那大', 'NaDa', 109.546409, 19.514878);
INSERT INTO `china_region` VALUES (524635, 2, 460400000000, 460400101000, '571721', '0805', '和庆镇', '和庆', '海南,儋州,和庆', 'HeQing', 109.640854, 19.525401);
INSERT INTO `china_region` VALUES (524650, 2, 460400000000, 460400102000, '571724', '0805', '南丰镇', '南丰', '海南,儋州,南丰', 'NanFeng', 109.55144, 19.41804);
INSERT INTO `china_region` VALUES (524663, 2, 460400000000, 460400103000, '571736', '0805', '大成镇', '大成', '海南,儋州,大成', 'DaCheng', 109.399551, 19.508078);
INSERT INTO `china_region` VALUES (524689, 2, 460400000000, 460400104000, '571729', '0805', '雅星镇', '雅星', '海南,儋州,雅星', 'YaXing', 109.269115, 19.444076);
INSERT INTO `china_region` VALUES (524723, 2, 460400000000, 460400105000, '571722', '0805', '兰洋镇', '兰洋', '海南,儋州,兰洋', 'LanYang', 109.664392, 19.460398);
INSERT INTO `china_region` VALUES (524743, 2, 460400000000, 460400106000, '571752', '0805', '光村镇', '光村', '海南,儋州,光村', 'GuangCun', 109.48132, 19.818101);
INSERT INTO `china_region` VALUES (524757, 2, 460400000000, 460400107000, '571746', '0805', '木棠镇', '木棠', '海南,儋州,木棠', 'MuTang', 109.35023, 19.80393);
INSERT INTO `china_region` VALUES (524783, 2, 460400000000, 460400108000, '571732', '0805', '海头镇', '海头', '海南,儋州,海头', 'HaiTou', 108.953392, 19.503315);
INSERT INTO `china_region` VALUES (524798, 2, 460400000000, 460400109000, '571745', '0805', '峨蔓镇', '峨蔓', '海南,儋州,峨蔓', 'EMan', 109.266778, 19.854773);
INSERT INTO `china_region` VALUES (524812, 2, 460400000000, 460400111000, '571739', '0805', '王五镇', '王五', '海南,儋州,王五', 'WangWu', 109.29572, 19.653711);
INSERT INTO `china_region` VALUES (524822, 2, 460400000000, 460400112000, '571742', '0805', '白马井镇', '白马', '海南,儋州,白马', 'BaiMa', 109.218734, 19.696407);
INSERT INTO `china_region` VALUES (524845, 2, 460400000000, 460400113000, '571747', '0805', '中和镇', '中和', '海南,儋州,中和', 'ZhongHe', 109.349583, 19.743857);
INSERT INTO `china_region` VALUES (524858, 2, 460400000000, 460400114000, '571741', '0805', '排浦镇', '排浦', '海南,儋州,排浦', 'PaiPu', 109.163254, 19.638809);
INSERT INTO `china_region` VALUES (524868, 2, 460400000000, 460400115000, '571751', '0805', '东成镇', '东成', '海南,儋州,东成', 'DongCheng', 109.461375, 19.703706);
INSERT INTO `china_region` VALUES (524889, 2, 460400000000, 460400116000, '571749', '0805', '新州镇', '新州', '海南,儋州,新州', 'XinZhou', 109.316166, 19.71431);
INSERT INTO `china_region` VALUES (524921, 2, 460400000000, 460400499000, '578101', '0805', '洋浦经济开发区', '洋浦经开区', '海南,儋州,洋浦经开区', 'YangPuJingKaiQu', 109.207335, 19.737237);
INSERT INTO `china_region` VALUES (524949, 2, 460400000000, 460400500000, '577537', '0805', '华南热作学院', '华南热作学院', '海南,儋州,华南热作学院', 'HuaNanReZuoXueYuan', 109.493772, 19.506373);
INSERT INTO `china_region` VALUES (524951, 1, 460000000000, 469000000000, '570100', NULL, '直辖县', '海南', '海南', 'HaiNan', 110.349228, 20.017377);
INSERT INTO `china_region` VALUES (524952, 2, 469000000000, 469001000000, '572200', NULL, '五指山市', '五指山', '海南,五指山', 'WuZhiShan', 109.516925, 18.775146);
INSERT INTO `china_region` VALUES (525031, 2, 469000000000, 469002000000, '571400', NULL, '琼海市', '琼海', '海南,琼海', 'QiongHai', 110.474581, 19.25914);
INSERT INTO `china_region` VALUES (525260, 2, 469000000000, 469005000000, '571300', NULL, '文昌市', '文昌', '海南,文昌', 'WenChang', 110.797717, 19.543422);
INSERT INTO `china_region` VALUES (525576, 2, 469000000000, 469006000000, '571500', NULL, '万宁市', '万宁', '海南,万宁', 'WanNing', 110.391073, 18.795143);
INSERT INTO `china_region` VALUES (525827, 2, 469000000000, 469007000000, '572600', NULL, '东方市', '东方', '海南,东方', 'DongFang', 108.651815, 19.095351);
INSERT INTO `china_region` VALUES (526044, 2, 469000000000, 469021000000, '571200', NULL, '定安县', '定安', '海南,定安', 'DingAn', 110.358891, 19.681434);
INSERT INTO `china_region` VALUES (526185, 2, 469000000000, 469022000000, '571600', NULL, '屯昌县', '屯昌', '海南,屯昌', 'TunChang', 110.103415, 19.351766);
INSERT INTO `china_region` VALUES (526318, 2, 469000000000, 469023000000, '571900', NULL, '澄迈县', '澄迈', '海南,澄迈', 'ChengMai', 110.006755, 19.738521);
INSERT INTO `china_region` VALUES (526528, 2, 469000000000, 469024000000, '571800', NULL, '临高县', '临高', '海南,临高', 'LinGao', 109.690508, 19.912026);
INSERT INTO `china_region` VALUES (526731, 2, 469000000000, 469025000000, '572800', NULL, '白沙黎族自治县', '白沙', '海南,白沙', 'BaiSha', 109.451484, 19.224823);
INSERT INTO `china_region` VALUES (526835, 2, 469000000000, 469026000000, '572700', NULL, '昌江黎族自治县', '昌江', '海南,昌江', 'ChangJiang', 109.055724, 19.298062);
INSERT INTO `china_region` VALUES (526943, 2, 469000000000, 469027000000, '572500', NULL, '乐东黎族自治县', '乐东', '海南,乐东', 'LeDong', 109.173055, 18.75026);
INSERT INTO `china_region` VALUES (527154, 2, 469000000000, 469028000000, '572400', NULL, '陵水黎族自治县', '陵水', '海南,陵水', 'LingShui', 110.037504, 18.506048);
INSERT INTO `china_region` VALUES (527287, 2, 469000000000, 469029000000, '572300', NULL, '保亭黎族苗族自治县', '保亭', '海南,保亭', 'BaoTing', 109.702392, 18.638189);
INSERT INTO `china_region` VALUES (527366, 2, 469000000000, 469030000000, '572900', NULL, '琼中黎族苗族自治县', '琼中', '海南,琼中', 'QiongZhong', 109.838389, 19.033369);
INSERT INTO `china_region` VALUES (527503, 0, 0, 500000000000, '0', NULL, '重庆市', '重庆', '重庆', 'ChongQing', 106.551556, 29.563009);
INSERT INTO `china_region` VALUES (527504, 1, 500000000000, 500100000000, '404100', '023', '直辖区', '重庆', '重庆', 'ChongQing', 106.551556, 29.563009);
INSERT INTO `china_region` VALUES (527505, 2, 500100000000, 500101000000, '404100', '023', '万州区', '万州', '重庆,万州', 'WanZhou', 108.408661, 30.807667);
INSERT INTO `china_region` VALUES (528192, 2, 500100000000, 500102000000, '408000', '023', '涪陵区', '涪陵', '重庆,涪陵', 'FuLing', 107.389298, 29.703113);
INSERT INTO `china_region` VALUES (528642, 2, 500100000000, 500103000000, '400000', '023', '渝中区', '渝中', '重庆,渝中', 'YuZhong', 106.568892, 29.55275);
INSERT INTO `china_region` VALUES (528734, 2, 500100000000, 500104000000, '400000', '023', '大渡口区', '大渡口', '重庆,大渡口', 'DaDuKou', 106.482347, 29.484527);
INSERT INTO `china_region` VALUES (528837, 2, 500100000000, 500105000000, '400000', '023', '江北区', '江北', '重庆,江北', 'JiangBei', 106.574271, 29.606703);
INSERT INTO `china_region` VALUES (528969, 2, 500100000000, 500106000000, '400000', '023', '沙坪坝区', '沙坪坝', '重庆,沙坪坝', 'ShaPingBa', 106.456878, 29.541145);
INSERT INTO `china_region` VALUES (529195, 2, 500100000000, 500107000000, '400000', '023', '九龙坡区', '九龙坡', '重庆,九龙坡', 'JiuLongPo', 106.53192, 29.51419);
INSERT INTO `china_region` VALUES (529438, 2, 500100000000, 500108000000, '400000', '023', '南岸区', '南岸', '重庆,南岸', 'NanAn', 106.644428, 29.500297);
INSERT INTO `china_region` VALUES (529600, 2, 500100000000, 500109000000, '400700', '023', '北碚区', '北碚', '重庆,北碚', 'BeiBei', 106.445122, 29.822616);
INSERT INTO `china_region` VALUES (529804, 2, 500100000000, 500110000000, '400803', '023', '綦江区', '綦江', '重庆,綦江', 'QiJiang', 106.651362, 29.028067);
INSERT INTO `china_region` VALUES (530315, 2, 500100000000, 500111000000, '400900', '023', '大足区', '大足', '重庆,大足', 'DaZu', 105.721733, 29.707032);
INSERT INTO `china_region` VALUES (530652, 2, 500100000000, 500112000000, '401120', '023', '渝北区', '渝北', '重庆,渝北', 'YuBei', 106.631187, 29.718143);
INSERT INTO `china_region` VALUES (531093, 2, 500100000000, 500113000000, '401320', '023', '巴南区', '巴南', '重庆,巴南', 'BaNan', 106.53384, 29.375528);
INSERT INTO `china_region` VALUES (531417, 2, 500100000000, 500114000000, '409000', '023', '黔江区', '黔江', '重庆,黔江', 'QianJiang', 108.770678, 29.53361);
INSERT INTO `china_region` VALUES (531667, 2, 500100000000, 500115000000, '401220', '023', '长寿区', '长寿', '重庆,长寿', 'ChangShou', 107.081283, 29.857996);
INSERT INTO `china_region` VALUES (531953, 2, 500100000000, 500116000000, '402260', '023', '江津区', '江津', '重庆,江津', 'JiangJin', 106.259281, 29.290069);
INSERT INTO `china_region` VALUES (532272, 2, 500100000000, 500117000000, '401520', '023', '合川区', '合川', '重庆,合川', 'HeChuan', 106.27613, 29.972084);
INSERT INTO `china_region` VALUES (532722, 2, 500100000000, 500118000000, '402100', '023', '永川区', '永川', '重庆,永川', 'YongChuan', 105.927376, 29.356117);
INSERT INTO `china_region` VALUES (533007, 2, 500100000000, 500119000000, '408400', '023', '南川区', '南川', '重庆,南川', 'NanChuan', 107.099266, 29.157891);
INSERT INTO `china_region` VALUES (533286, 2, 500100000000, 500120000000, '402760', '023', '璧山区', '璧山', '重庆,璧山', 'BiShan', 106.227305, 29.592024);
INSERT INTO `china_region` VALUES (533491, 2, 500100000000, 500151000000, '402560', '023', '铜梁区', '铜梁', '重庆,铜梁', 'TongLiang', 106.056404, 29.844811);
INSERT INTO `china_region` VALUES (533853, 2, 500100000000, 500152000000, '402660', '023', '潼南区', '潼南', '重庆,潼南', 'TongNan', 105.840556, 30.191013);
INSERT INTO `china_region` VALUES (534180, 2, 500100000000, 500153000000, '402473', '023', '荣昌区', '荣昌', '重庆,荣昌', 'RongChang', 105.594623, 29.405002);
INSERT INTO `china_region` VALUES (534361, 2, 500100000000, 500154000000, '405499', '023', '开州区', '开州', '重庆,开州', 'KaiZhou', 108.393143, 31.1607);
INSERT INTO `china_region` VALUES (534937, 2, 500100000000, 500155000000, '405200', '023', '梁平区', '梁平', '重庆,梁平', 'LiangPing', 107.769581, 30.65423);
INSERT INTO `china_region` VALUES (535313, 2, 500100000000, 500156000000, '408500', '023', '武隆区', '武隆', '重庆,武隆', 'WuLong', 107.760025, 29.325601);
INSERT INTO `china_region` VALUES (535556, 1, 500000000000, 500200000000, '404100', '023', '直辖县', '重庆', '重庆', 'ChongQing', 106.551556, 29.563009);
INSERT INTO `china_region` VALUES (535557, 2, 500200000000, 500229000000, '405900', '023', '城口县', '城口', '重庆,城口', 'ChengKou', 108.664214, 31.947633);
INSERT INTO `china_region` VALUES (535787, 2, 500200000000, 500230000000, '408200', '023', '丰都县', '丰都', '重庆,丰都', 'FengDu', 107.730895, 29.8635);
INSERT INTO `china_region` VALUES (536148, 2, 500200000000, 500231000000, '408300', '023', '垫江县', '垫江', '重庆,垫江', 'DianJiang', 107.33339, 30.327717);
INSERT INTO `china_region` VALUES (536476, 2, 500200000000, 500233000000, '404300', '023', '忠县', '忠县', '重庆,忠县', 'ZhongXian', 108.039002, 30.29956);
INSERT INTO `china_region` VALUES (536878, 2, 500200000000, 500235000000, '404500', '023', '云阳县', '云阳', '重庆,云阳', 'YunYang', 108.697324, 30.930613);
INSERT INTO `china_region` VALUES (537399, 2, 500200000000, 500236000000, '404600', '023', '奉节县', '奉节', '重庆,奉节', 'FengJie', 109.463987, 31.018498);
INSERT INTO `china_region` VALUES (537822, 2, 500200000000, 500237000000, '404700', '023', '巫山县', '巫山', '重庆,巫山', 'WuShan', 109.879153, 31.074834);
INSERT INTO `china_region` VALUES (538189, 2, 500200000000, 500238000000, '405800', '023', '巫溪县', '巫溪', '重庆,巫溪', 'WuXi', 109.570062, 31.398604);
INSERT INTO `china_region` VALUES (538552, 2, 500200000000, 500240000000, '409100', '023', '石柱土家族自治县', '石柱', '重庆,石柱', 'ShiZhu', 108.114069, 29.999285);
INSERT INTO `china_region` VALUES (538828, 2, 500200000000, 500241000000, '409900', '023', '秀山土家族苗族自治县', '秀山', '重庆,秀山', 'XiuShan', 109.007094, 28.447997);
INSERT INTO `china_region` VALUES (539124, 2, 500200000000, 500242000000, '409800', '023', '酉阳土家族苗族自治县', '酉阳', '重庆,酉阳', 'YouYang', 108.767747, 28.841244);
INSERT INTO `china_region` VALUES (539442, 2, 500200000000, 500243000000, '409600', '023', '彭水苗族土家族自治县', '彭水', '重庆,彭水', 'PengShui', 108.165538, 29.293902);
INSERT INTO `china_region` VALUES (539778, 0, 0, 510000000000, '0', NULL, '四川省', '四川', '四川', 'SiChuan', 104.075931, 30.651651);
INSERT INTO `china_region` VALUES (539779, 1, 510000000000, 510100000000, '610000', '028', '成都市', '成都', '四川,成都', 'ChengDu', 104.066541, 30.572269);
INSERT INTO `china_region` VALUES (539780, 2, 510100000000, 510101000000, '610000', '028', '市辖区', '成都', '四川,成都', 'ChengDu', 104.066541, 30.572269);
INSERT INTO `china_region` VALUES (539781, 2, 510100000000, 510104000000, '610000', '028', '锦江区', '锦江', '四川,成都,锦江', 'JinJiang', 104.080989, 30.657689);
INSERT INTO `china_region` VALUES (539887, 2, 510100000000, 510105000000, '610000', '028', '青羊区', '青羊', '四川,成都,青羊', 'QingYang', 104.062499, 30.674406);
INSERT INTO `china_region` VALUES (539981, 2, 510100000000, 510106000000, '610000', '028', '金牛区', '金牛', '四川,成都,金牛', 'JinNiu', 104.117422, 30.763102);
INSERT INTO `china_region` VALUES (540108, 2, 510100000000, 510107000000, '610000', '028', '武侯区', '武侯', '四川,成都,武侯', 'WuHou', 104.04339, 30.641982);
INSERT INTO `china_region` VALUES (540264, 2, 510100000000, 510108000000, '610000', '028', '成华区', '成华', '四川,成都,成华', 'ChengHua', 104.101255, 30.660122);
INSERT INTO `china_region` VALUES (540384, 2, 510100000000, 510112000000, '610000', '028', '龙泉驿区', '龙泉驿', '四川,成都,龙泉驿', 'LongQuanYi', 104.274632, 30.556507);
INSERT INTO `china_region` VALUES (540541, 2, 510100000000, 510113000000, '610000', '028', '青白江区', '青白江', '四川,成都,青白江', 'QingBaiJiang', 104.250877, 30.878681);
INSERT INTO `china_region` VALUES (540677, 2, 510100000000, 510114000000, '610000', '028', '新都区', '新都', '四川,成都,新都', 'XinDu', 104.158705, 30.823499);
INSERT INTO `china_region` VALUES (540946, 2, 510100000000, 510115000000, '611130', '028', '温江区', '温江', '四川,成都,温江', 'WenJiang', 103.837104, 30.69046);
INSERT INTO `china_region` VALUES (541078, 2, 510100000000, 510116000000, '610200', '028', '双流区', '双流', '四川,成都,双流', 'ShuangLiu', 103.951908, 30.333027);
INSERT INTO `china_region` VALUES (541405, 2, 510100000000, 510117000000, '610000', '028', '郫都区', '郫都', '四川,成都,郫都', 'PiDou', 103.901092, 30.795854);
INSERT INTO `china_region` VALUES (541642, 2, 510100000000, 510121000000, '610400', '028', '金堂县', '金堂', '四川,成都,金堂', 'JinTang', 104.412005, 30.862017);
INSERT INTO `china_region` VALUES (541896, 2, 510100000000, 510129000000, '611300', '028', '大邑县', '大邑', '四川,成都,大邑', 'DaYi', 103.511875, 30.572269);
INSERT INTO `china_region` VALUES (542135, 2, 510100000000, 510131000000, '611600', '028', '蒲江县', '蒲江', '四川,成都,蒲江', 'PuJiang', 103.506498, 30.196789);
INSERT INTO `china_region` VALUES (542282, 2, 510100000000, 510132000000, '611400', '028', '新津县', '新津', '四川,成都,新津', 'XinJin', 103.811345, 30.410222);
INSERT INTO `china_region` VALUES (542401, 2, 510100000000, 510181000000, '611800', '028', '都江堰市', '都江堰', '四川,成都,都江堰', 'DuJiangYan', 103.650219, 30.975943);
INSERT INTO `china_region` VALUES (542677, 2, 510100000000, 510182000000, '611900', '028', '彭州市', '彭州', '四川,成都,彭州', 'PengZhou', 103.958013, 30.990165);
INSERT INTO `china_region` VALUES (543053, 2, 510100000000, 510183000000, '611500', '028', '邛崃市', '邛崃', '四川,成都,邛崃', 'QiongLai', 103.464156, 30.410275);
INSERT INTO `china_region` VALUES (543349, 2, 510100000000, 510184000000, '611200', '028', '崇州市', '崇州', '四川,成都,崇州', 'ChongZhou', 103.673001, 30.630122);
INSERT INTO `china_region` VALUES (543628, 2, 510100000000, 510185000000, '641400', '028', '简阳市', '简阳', '四川,成都,简阳', 'JianYang', 104.546773, 30.410754);
INSERT INTO `china_region` VALUES (544542, 1, 510000000000, 510300000000, '643000', '0813', '自贡市', '自贡', '四川,自贡', 'ZiGong', 104.778442, 29.33903);
INSERT INTO `china_region` VALUES (544543, 2, 510300000000, 510301000000, '643000', '0813', '市辖区', '自贡', '四川,自贡', 'ZiGong', 104.778442, 29.33903);
INSERT INTO `china_region` VALUES (544544, 2, 510300000000, 510302000000, '643000', '0813', '自流井区', '自流井', '四川,自贡,自流井', 'ZiLiuJing', 104.777191, 29.33743);
INSERT INTO `china_region` VALUES (544666, 2, 510300000000, 510303000000, '643020', '0813', '贡井区', '贡井', '四川,自贡,贡井', 'GongJing', 104.715117, 29.345546);
INSERT INTO `china_region` VALUES (544800, 2, 510300000000, 510304000000, '643010', '0813', '大安区', '大安', '四川,自贡,大安', 'DaAn', 104.773968, 29.363634);
INSERT INTO `china_region` VALUES (545005, 2, 510300000000, 510311000000, '643030', '0813', '沿滩区', '沿滩', '四川,自贡,沿滩', 'YanTan', 104.874073, 29.272581);
INSERT INTO `china_region` VALUES (545165, 2, 510300000000, 510321000000, '643100', '0813', '荣县', '荣县', '四川,自贡,荣县', 'RongXian', 104.417388, 29.44541);
INSERT INTO `china_region` VALUES (545534, 2, 510300000000, 510322000000, '643200', '0813', '富顺县', '富顺', '四川,自贡,富顺', 'FuShun', 104.975048, 29.18143);
INSERT INTO `china_region` VALUES (545826, 1, 510000000000, 510400000000, '617000', '0812', '攀枝花市', '攀枝花', '四川,攀枝花', 'PanZhiHua', 101.718637, 26.582347);
INSERT INTO `china_region` VALUES (545827, 2, 510400000000, 510401000000, '617000', '0812', '市辖区', '攀枝花', '四川,攀枝花', 'PanZhiHua', 101.718637, 26.582347);
INSERT INTO `china_region` VALUES (545828, 2, 510400000000, 510402000000, '617000', '0812', '东区', '东区', '四川,攀枝花,东区', 'DongQu', 101.718637, 26.582347);
INSERT INTO `china_region` VALUES (545908, 2, 510400000000, 510403000000, '617000', '0812', '西区', '西区', '四川,攀枝花,西区', 'XiQu', 101.718637, 26.582347);
INSERT INTO `china_region` VALUES (545958, 2, 510400000000, 510411000000, '617000', '0812', '仁和区', '仁和', '四川,攀枝花,仁和', 'RenHe', 101.738528, 26.497765);
INSERT INTO `china_region` VALUES (546074, 2, 510400000000, 510421000000, '617200', '0812', '米易县', '米易', '四川,攀枝花,米易', 'MiYi', 102.110339, 26.890689);
INSERT INTO `china_region` VALUES (546186, 2, 510400000000, 510422000000, '617100', '0812', '盐边县', '盐边', '四川,攀枝花,盐边', 'YanBian', 101.855071, 26.683213);
INSERT INTO `china_region` VALUES (546375, 1, 510000000000, 510500000000, '646000', '0830', '泸州市', '泸州', '四川,泸州', 'LuZhou', 105.442258, 28.87181);
INSERT INTO `china_region` VALUES (546376, 2, 510500000000, 510501000000, '646000', '0830', '市辖区', '泸州', '四川,泸州', 'LuZhou', 105.442258, 28.87181);
INSERT INTO `china_region` VALUES (546377, 2, 510500000000, 510502000000, '646000', '0830', '江阳区', '江阳', '四川,泸州,江阳', 'JiangYang', 105.435009, 28.878818);
INSERT INTO `china_region` VALUES (546555, 2, 510500000000, 510503000000, '646300', '0830', '纳溪区', '纳溪', '四川,泸州,纳溪', 'NaXi', 105.371151, 28.773428);
INSERT INTO `china_region` VALUES (546774, 2, 510500000000, 510504000000, '646000', '0830', '龙马潭区', '龙马潭', '四川,泸州,龙马潭', 'LongMaTan', 105.437765, 28.913221);
INSERT INTO `china_region` VALUES (546877, 2, 510500000000, 510521000000, '646100', '0830', '泸县', '泸县', '四川,泸州,泸县', 'LuXian', 105.381893, 29.151534);
INSERT INTO `china_region` VALUES (547204, 2, 510500000000, 510522000000, '646200', '0830', '合江县', '合江', '四川,泸州,合江', 'HeJiang', 105.831067, 28.811203);
INSERT INTO `china_region` VALUES (547559, 2, 510500000000, 510524000000, '646400', '0830', '叙永县', '叙永', '四川,泸州,叙永', 'XuYong', 105.444765, 28.155801);
INSERT INTO `china_region` VALUES (547851, 2, 510500000000, 510525000000, '646500', '0830', '古蔺县', '古蔺', '四川,泸州,古蔺', 'GuLin', 105.812602, 28.038802);
INSERT INTO `china_region` VALUES (548184, 1, 510000000000, 510600000000, '618000', '0838', '德阳市', '德阳', '四川,德阳', 'DeYang', 104.397894, 31.126855);
INSERT INTO `china_region` VALUES (548185, 2, 510600000000, 510601000000, '618000', '0838', '市辖区', '德阳', '四川,德阳', 'DeYang', 104.397894, 31.126855);
INSERT INTO `china_region` VALUES (548186, 2, 510600000000, 510603000000, '618000', '0838', '旌阳区', '旌阳', '四川,德阳,旌阳', 'JingYang', 104.416943, 31.142498);
INSERT INTO `china_region` VALUES (548434, 2, 510600000000, 510604000000, '618500', '0838', '罗江区', '罗江', '四川,德阳,罗江', 'LuoJiang', 104.510249, 31.317045);
INSERT INTO `china_region` VALUES (548572, 2, 510600000000, 510623000000, '618100', '0838', '中江县', '中江', '四川,德阳,中江', 'ZhongJiang', 104.678749, 31.033051);
INSERT INTO `china_region` VALUES (549457, 2, 510600000000, 510681000000, '618300', '0838', '广汉市', '广汉', '四川,德阳,广汉', 'GuangHan', 104.282331, 30.976165);
INSERT INTO `china_region` VALUES (549699, 2, 510600000000, 510682000000, '618400', '0838', '什邡市', '什邡', '四川,德阳,什邡', 'ShiFang', 104.167501, 31.12678);
INSERT INTO `china_region` VALUES (549887, 2, 510600000000, 510683000000, '618200', '0838', '绵竹市', '绵竹', '四川,德阳,绵竹', 'MianZhu', 104.22075, 31.338077);
INSERT INTO `china_region` VALUES (550116, 1, 510000000000, 510700000000, '621000', '0816', '绵阳市', '绵阳', '四川,绵阳', 'MianYang', 104.679114, 31.46745);
INSERT INTO `china_region` VALUES (550117, 2, 510700000000, 510701000000, '621000', '0816', '市辖区', '绵阳', '四川,绵阳', 'MianYang', 104.679114, 31.46745);
INSERT INTO `china_region` VALUES (550118, 2, 510700000000, 510703000000, '621000', '0816', '涪城区', '涪城', '四川,绵阳,涪城', 'FuCheng', 104.750215, 31.47083);
INSERT INTO `china_region` VALUES (550399, 2, 510700000000, 510704000000, '621000', '0816', '游仙区', '游仙', '四川,绵阳,游仙', 'YouXian', 104.766393, 31.473779);
INSERT INTO `china_region` VALUES (550749, 2, 510700000000, 510705000000, '622650', '0816', '安州区', '安州', '四川,绵阳,安州', 'AnZhou', 104.567187, 31.534886);
INSERT INTO `china_region` VALUES (551025, 2, 510700000000, 510722000000, '621100', '0816', '三台县', '三台', '四川,绵阳,三台', 'SanTai', 105.094586, 31.095979);
INSERT INTO `china_region` VALUES (552131, 2, 510700000000, 510723000000, '621600', '0816', '盐亭县', '盐亭', '四川,绵阳,盐亭', 'YanTing', 105.389453, 31.208363);
INSERT INTO `china_region` VALUES (552687, 2, 510700000000, 510725000000, '622150', '0816', '梓潼县', '梓潼', '四川,绵阳,梓潼', 'ZiTong', 105.170845, 31.642718);
INSERT INTO `china_region` VALUES (553069, 2, 510700000000, 510726000000, '622750', '0816', '北川羌族自治县', '北川', '四川,绵阳,北川', 'BeiChuan', 104.46797, 31.617203);
INSERT INTO `china_region` VALUES (553436, 2, 510700000000, 510727000000, '622550', '0816', '平武县', '平武', '四川,绵阳,平武', 'PingWu', 104.555583, 32.409675);
INSERT INTO `china_region` VALUES (553726, 2, 510700000000, 510781000000, '621700', '0816', '江油市', '江油', '四川,绵阳,江油', 'JiangYou', 104.745877, 31.778025);
INSERT INTO `china_region` VALUES (554209, 1, 510000000000, 510800000000, '628000', '0839', '广元市', '广元', '四川,广元', 'GuangYuan', 105.843357, 32.435435);
INSERT INTO `china_region` VALUES (554210, 2, 510800000000, 510801000000, '628000', '0839', '市辖区', '广元', '四川,广元', 'GuangYuan', 105.843357, 32.435435);
INSERT INTO `china_region` VALUES (554211, 2, 510800000000, 510802000000, '628000', '0839', '利州区', '利州', '四川,广元,利州', 'LiZhou', 105.845218, 32.433898);
INSERT INTO `china_region` VALUES (554492, 2, 510800000000, 510811000000, '628008', '0839', '昭化区', '昭化', '四川,广元,昭化', 'ZhaoHua', 105.964121, 32.322788);
INSERT INTO `china_region` VALUES (554758, 2, 510800000000, 510812000000, '628000', '0839', '朝天区', '朝天', '四川,广元,朝天', 'ChaoTian', 105.890445, 32.643982);
INSERT INTO `china_region` VALUES (555005, 2, 510800000000, 510821000000, '628200', '0839', '旺苍县', '旺苍', '四川,广元,旺苍', 'WangCang', 106.289905, 32.228917);
INSERT INTO `china_region` VALUES (555441, 2, 510800000000, 510822000000, '628100', '0839', '青川县', '青川', '四川,广元,青川', 'QingChuan', 105.238842, 32.575485);
INSERT INTO `china_region` VALUES (555719, 2, 510800000000, 510823000000, '628300', '0839', '剑阁县', '剑阁', '四川,广元,剑阁', 'JianGe', 105.524766, 32.287723);
INSERT INTO `china_region` VALUES (556356, 2, 510800000000, 510824000000, '628400', '0839', '苍溪县', '苍溪', '四川,广元,苍溪', 'CangXi', 105.934801, 31.732432);
INSERT INTO `china_region` VALUES (557209, 1, 510000000000, 510900000000, '629000', '0825', '遂宁市', '遂宁', '四川,遂宁', 'SuiNing', 105.592898, 30.532847);
INSERT INTO `china_region` VALUES (557210, 2, 510900000000, 510901000000, '629000', '0825', '市辖区', '遂宁', '四川,遂宁', 'SuiNing', 105.592898, 30.532847);
INSERT INTO `china_region` VALUES (557211, 2, 510900000000, 510903000000, '629000', '0825', '船山区', '船山', '四川,遂宁,船山', 'ChuanShan', 105.568297, 30.525475);
INSERT INTO `china_region` VALUES (557532, 2, 510900000000, 510904000000, '629000', '0825', '安居区', '安居', '四川,遂宁,安居', 'AnJu', 105.456342, 30.355379);
INSERT INTO `china_region` VALUES (558075, 2, 510900000000, 510921000000, '629100', '0825', '蓬溪县', '蓬溪', '四川,遂宁,蓬溪', 'PengXi', 105.70757, 30.757575);
INSERT INTO `china_region` VALUES (558646, 2, 510900000000, 510923000000, '629300', '0825', '大英县', '大英', '四川,遂宁,大英', 'DaYing', 105.236904, 30.594337);
INSERT INTO `china_region` VALUES (558993, 2, 510900000000, 510981000000, '629200', '0825', '射洪市', '射洪', '四川,遂宁,射洪', 'SheHong', 105.388405, 30.870986);
INSERT INTO `china_region` VALUES (559532, 1, 510000000000, 511000000000, '641000', '1832', '内江市', '内江', '四川,内江', 'NeiJiang', 105.058433, 29.580228);
INSERT INTO `china_region` VALUES (559533, 2, 511000000000, 511001000000, '641000', '1832', '市辖区', '内江', '四川,内江', 'NeiJiang', 105.058433, 29.580228);
INSERT INTO `china_region` VALUES (559534, 2, 511000000000, 511002000000, '641000', '1832', '市中区', '市中', '四川,内江,市中', 'ShiZhong', 105.067597, 29.587053);
INSERT INTO `china_region` VALUES (559753, 2, 511000000000, 511011000000, '641100', '1832', '东兴区', '东兴', '四川,内江,东兴', 'DongXing', 105.07549, 29.592756);
INSERT INTO `china_region` VALUES (560275, 2, 511000000000, 511024000000, '642450', '1832', '威远县', '威远', '四川,内江,威远', 'WeiYuan', 104.668879, 29.52744);
INSERT INTO `china_region` VALUES (560670, 2, 511000000000, 511025000000, '641200', '1832', '资中县', '资中', '四川,内江,资中', 'ZiZhong', 104.851944, 29.764059);
INSERT INTO `china_region` VALUES (561544, 2, 511000000000, 511071000000, '641106', '1832', '内江经济开发区', '内江经开区', '四川,内江,内江经开区', 'NeiJiangJingKaiQu', 105.018446, 29.583853);
INSERT INTO `china_region` VALUES (561575, 2, 511000000000, 511083000000, '642150', '1832', '隆昌市', '隆昌', '四川,内江,隆昌', 'LongChang', 105.287612, 29.339476);
INSERT INTO `china_region` VALUES (562008, 1, 510000000000, 511100000000, '614000', '0833', '乐山市', '乐山', '四川,乐山', 'LeShan', 103.765568, 29.552106);
INSERT INTO `china_region` VALUES (562009, 2, 511100000000, 511101000000, '614000', '0833', '市辖区', '乐山', '四川,乐山', 'LeShan', 103.765568, 29.552106);
INSERT INTO `china_region` VALUES (562010, 2, 511100000000, 511102000000, '614000', '0833', '市中区', '市中', '四川,乐山,市中', 'ShiZhong', 103.76133, 29.555375);
INSERT INTO `china_region` VALUES (562302, 2, 511100000000, 511111000000, '614900', '0833', '沙湾区', '沙湾', '四川,乐山,沙湾', 'ShaWan', 103.549991, 29.413091);
INSERT INTO `china_region` VALUES (562465, 2, 511100000000, 511112000000, '614800', '0833', '五通桥区', '五通桥', '四川,乐山,五通桥', 'WuTongQiao', 103.818009, 29.406932);
INSERT INTO `china_region` VALUES (562650, 2, 511100000000, 511113000000, '614700', '0833', '金口河区', '金口河', '四川,乐山,金口河', 'JinKouHe', 103.078621, 29.244345);
INSERT INTO `china_region` VALUES (562702, 2, 511100000000, 511123000000, '614400', '0833', '犍为县', '犍为', '四川,乐山,犍为', 'QianWei', 103.949326, 29.208171);
INSERT INTO `china_region` VALUES (563122, 2, 511100000000, 511124000000, '613100', '0833', '井研县', '井研', '四川,乐山,井研', 'JingYan', 104.069726, 29.651287);
INSERT INTO `china_region` VALUES (563381, 2, 511100000000, 511126000000, '614100', '0833', '夹江县', '夹江', '四川,乐山,夹江', 'JiaJiang', 103.571657, 29.73763);
INSERT INTO `china_region` VALUES (563515, 2, 511100000000, 511129000000, '614500', '0833', '沐川县', '沐川', '四川,乐山,沐川', 'MuChuan', 103.902335, 28.956647);
INSERT INTO `china_region` VALUES (563750, 2, 511100000000, 511132000000, '614300', '0833', '峨边彝族自治县', '峨边', '四川,乐山,峨边', 'EBian', 103.262048, 29.230425);
INSERT INTO `china_region` VALUES (563909, 2, 511100000000, 511133000000, '614600', '0833', '马边彝族自治县', '马边', '四川,乐山,马边', 'MaBian', 103.546348, 28.835521);
INSERT INTO `china_region` VALUES (564053, 2, 511100000000, 511181000000, '614200', '0833', '峨眉山市', '峨眉山', '四川,乐山,峨眉山', 'EMeiShan', 103.484504, 29.601199);
INSERT INTO `china_region` VALUES (564337, 1, 510000000000, 511300000000, '637000', '0817', '南充市', '南充', '四川,南充', 'NanChong', 106.110698, 30.837793);
INSERT INTO `china_region` VALUES (564338, 2, 511300000000, 511301000000, '637000', '0817', '市辖区', '南充', '四川,南充', 'NanChong', 106.110698, 30.837793);
INSERT INTO `china_region` VALUES (564339, 2, 511300000000, 511302000000, '637000', '0817', '顺庆区', '顺庆', '四川,南充,顺庆', 'ShunQing', 106.092399, 30.796486);
INSERT INTO `china_region` VALUES (564676, 2, 511300000000, 511303000000, '637100', '0817', '高坪区', '高坪', '四川,南充,高坪', 'GaoPing', 106.118808, 30.781623);
INSERT INTO `china_region` VALUES (565097, 2, 511300000000, 511304000000, '637500', '0817', '嘉陵区', '嘉陵', '四川,南充,嘉陵', 'JiaLing', 106.071793, 30.758748);
INSERT INTO `china_region` VALUES (565715, 2, 511300000000, 511321000000, '637300', '0817', '南部县', '南部', '四川,南充,南部', 'NanBu', 106.036584, 31.347467);
INSERT INTO `china_region` VALUES (566876, 2, 511300000000, 511322000000, '637700', '0817', '营山县', '营山', '四川,南充,营山', 'YingShan', 106.56542, 31.076461);
INSERT INTO `china_region` VALUES (567590, 2, 511300000000, 511323000000, '637800', '0817', '蓬安县', '蓬安', '四川,南充,蓬安', 'PengAn', 106.412151, 31.029097);
INSERT INTO `china_region` VALUES (568261, 2, 511300000000, 511324000000, '637600', '0817', '仪陇县', '仪陇', '四川,南充,仪陇', 'YiLong', 106.303042, 31.271562);
INSERT INTO `china_region` VALUES (569236, 2, 511300000000, 511325000000, '637200', '0817', '西充县', '西充', '四川,南充,西充', 'XiChong', 105.900878, 30.995669);
INSERT INTO `china_region` VALUES (569881, 2, 511300000000, 511381000000, '637400', '0817', '阆中市', '阆中', '四川,南充,阆中', 'LangZhong', 106.005047, 31.558357);
INSERT INTO `china_region` VALUES (570424, 1, 510000000000, 511400000000, '620000', '1833', '眉山市', '眉山', '四川,眉山', 'MeiShan', 103.848538, 30.075439);
INSERT INTO `china_region` VALUES (570425, 2, 511400000000, 511401000000, '620000', '1833', '市辖区', '眉山', '四川,眉山', 'MeiShan', 103.848538, 30.075439);
INSERT INTO `china_region` VALUES (570426, 2, 511400000000, 511402000000, '620000', '1833', '东坡区', '东坡', '四川,眉山,东坡', 'DongPo', 103.831752, 30.042345);
INSERT INTO `china_region` VALUES (570764, 2, 511400000000, 511403000000, '612700', '1833', '彭山区', '彭山', '四川,眉山,彭山', 'PengShan', 103.87295, 30.193056);
INSERT INTO `china_region` VALUES (570886, 2, 511400000000, 511421000000, '620500', '1833', '仁寿县', '仁寿', '四川,眉山,仁寿', 'RenShou', 104.134082, 29.99563);
INSERT INTO `china_region` VALUES (571565, 2, 511400000000, 511423000000, '620300', '1833', '洪雅县', '洪雅', '四川,眉山,洪雅', 'HongYa', 103.372863, 29.90489);
INSERT INTO `china_region` VALUES (571740, 2, 511400000000, 511424000000, '612200', '1833', '丹棱县', '丹棱', '四川,眉山,丹棱', 'DanLeng', 103.512733, 30.014448);
INSERT INTO `china_region` VALUES (571826, 2, 511400000000, 511425000000, '612400', '1833', '青神县', '青神', '四川,眉山,青神', 'QingShen', 103.846688, 29.831358);
INSERT INTO `china_region` VALUES (571926, 1, 510000000000, 511500000000, '644000', '0831', '宜宾市', '宜宾', '四川,宜宾', 'YiBin', 104.643215, 28.751768);
INSERT INTO `china_region` VALUES (571927, 2, 511500000000, 511501000000, '644000', '0831', '市辖区', '宜宾', '四川,宜宾', 'YiBin', 104.643215, 28.751768);
INSERT INTO `china_region` VALUES (571928, 2, 511500000000, 511502000000, '644000', '0831', '翠屏区', '翠屏', '四川,宜宾,翠屏', 'CuiPing', 104.644534, 28.758563);
INSERT INTO `china_region` VALUES (572318, 2, 511500000000, 511503000000, '644100', '0831', '南溪区', '南溪', '四川,宜宾,南溪', 'NanXi', 104.643215, 28.751768);
INSERT INTO `china_region` VALUES (572538, 2, 511500000000, 511504000000, '644009', '0831', '叙州区', '叙州', '四川,宜宾,叙州', 'XuZhou', 104.643215, 28.751768);
INSERT INTO `china_region` VALUES (573079, 2, 511500000000, 511523000000, '644200', '0831', '江安县', '江安', '四川,宜宾,江安', 'JiangAn', 104.643215, 28.751768);
INSERT INTO `china_region` VALUES (573436, 2, 511500000000, 511524000000, '644317', '0831', '长宁县', '长宁', '四川,宜宾,长宁', 'ChangNing', 104.914158, 28.577349);
INSERT INTO `china_region` VALUES (573731, 2, 511500000000, 511525000000, '645150', '0831', '高县', '高县', '四川,宜宾,高县', 'GaoXian', 104.518187, 28.435036);
INSERT INTO `china_region` VALUES (574062, 2, 511500000000, 511526000000, '644500', '0831', '珙县', '珙县', '四川,宜宾,珙县', 'GongXian', 104.713083, 28.443674);
INSERT INTO `china_region` VALUES (574339, 2, 511500000000, 511527000000, '645250', '0831', '筠连县', '筠连', '四川,宜宾,筠连', 'JunLian', 104.643215, 28.751768);
INSERT INTO `china_region` VALUES (574612, 2, 511500000000, 511528000000, '644400', '0831', '兴文县', '兴文', '四川,宜宾,兴文', 'XingWen', 105.236549, 28.302988);
INSERT INTO `china_region` VALUES (574884, 2, 511500000000, 511529000000, '645350', '0831', '屏山县', '屏山', '四川,宜宾,屏山', 'PingShan', 104.156008, 28.708446);
INSERT INTO `china_region` VALUES (575171, 1, 510000000000, 511600000000, '638500', '0826', '广安市', '广安', '四川,广安', 'GuangAn', 106.633212, 30.455961);
INSERT INTO `china_region` VALUES (575172, 2, 511600000000, 511601000000, '638500', '0826', '市辖区', '广安', '四川,广安', 'GuangAn', 106.633212, 30.455961);
INSERT INTO `china_region` VALUES (575173, 2, 511600000000, 511602000000, '638550', '0826', '广安区', '广安', '四川,广安', 'GuangAn', 106.641608, 30.474003);
INSERT INTO `china_region` VALUES (575811, 2, 511600000000, 511603000000, '638019', '0826', '前锋区', '前锋', '四川,广安,前锋', 'QianFeng', 106.893277, 30.4963);
INSERT INTO `china_region` VALUES (576112, 2, 511600000000, 511621000000, '638300', '0826', '岳池县', '岳池', '四川,广安,岳池', 'YueChi', 106.440114, 30.537863);
INSERT INTO `china_region` VALUES (577038, 2, 511600000000, 511622000000, '638400', '0826', '武胜县', '武胜', '四川,广安,武胜', 'WuSheng', 106.295764, 30.348772);
INSERT INTO `china_region` VALUES (577629, 2, 511600000000, 511623000000, '638500', '0826', '邻水县', '邻水', '四川,广安,邻水', 'LinShui', 106.93038, 30.334769);
INSERT INTO `china_region` VALUES (578202, 2, 511600000000, 511681000000, '638600', '0826', '华蓥市', '华蓥', '四川,广安,华蓥', 'HuaYing', 106.783088, 30.390435);
INSERT INTO `china_region` VALUES (578351, 1, 510000000000, 511700000000, '635000', '0818', '达州市', '达州', '四川,达州', 'DaZhou', 107.468023, 31.209571);
INSERT INTO `china_region` VALUES (578352, 2, 511700000000, 511701000000, '635000', '0818', '市辖区', '达州', '四川,达州', 'DaZhou', 107.468023, 31.209571);
INSERT INTO `china_region` VALUES (578353, 2, 511700000000, 511702000000, '635000', '0818', '通川区', '通川', '四川,达州,通川', 'TongChuan', 107.504517, 31.214724);
INSERT INTO `china_region` VALUES (578650, 2, 511700000000, 511703000000, '635000', '0818', '达川区', '达川', '四川,达州,达川', 'DaChuan', 107.511845, 31.196118);
INSERT INTO `china_region` VALUES (579388, 2, 511700000000, 511722000000, '636150', '0818', '宣汉县', '宣汉', '四川,达州,宣汉', 'XuanHan', 107.727191, 31.353835);
INSERT INTO `china_region` VALUES (580013, 2, 511700000000, 511723000000, '636250', '0818', '开江县', '开江', '四川,达州,开江', 'KaiJiang', 107.868736, 31.082987);
INSERT INTO `china_region` VALUES (580261, 2, 511700000000, 511724000000, '635100', '0818', '大竹县', '大竹', '四川,达州,大竹', 'DaZhu', 107.204744, 30.736266);
INSERT INTO `china_region` VALUES (580756, 2, 511700000000, 511725000000, '635200', '0818', '渠县', '渠县', '四川,达州,渠县', 'QuXian', 106.972996, 30.836659);
INSERT INTO `china_region` VALUES (581383, 2, 511700000000, 511771000000, '635000', '0818', '达州经济开发区', '达州经开区', '四川,达州,达州经开区', 'DaZhouJingKaiQu', 107.497067, 31.136267);
INSERT INTO `china_region` VALUES (581432, 2, 511700000000, 511781000000, '636350', '0818', '万源市', '万源', '四川,达州,万源', 'WanYuan', 108.034657, 32.081631);
INSERT INTO `china_region` VALUES (581899, 1, 510000000000, 511800000000, '625000', '0835', '雅安市', '雅安', '四川,雅安', 'YaAn', 103.013261, 29.980537);
INSERT INTO `china_region` VALUES (581900, 2, 511800000000, 511801000000, '625000', '0835', '市辖区', '雅安', '四川,雅安', 'YaAn', 103.013261, 29.980537);
INSERT INTO `china_region` VALUES (581901, 2, 511800000000, 511802000000, '625000', '0835', '雨城区', '雨城', '四川,雅安,雨城', 'YuCheng', 103.033083, 30.005447);
INSERT INTO `china_region` VALUES (582130, 2, 511800000000, 511803000000, '625100', '0835', '名山区', '名山', '四川,雅安,名山', 'MingShan', 103.109185, 30.069954);
INSERT INTO `china_region` VALUES (582360, 2, 511800000000, 511822000000, '625200', '0835', '荥经县', '荥经', '四川,雅安,荥经', 'YingJing', 102.846738, 29.792931);
INSERT INTO `china_region` VALUES (582494, 2, 511800000000, 511823000000, '625300', '0835', '汉源县', '汉源', '四川,雅安,汉源', 'HanYuan', 102.645453, 29.347187);
INSERT INTO `china_region` VALUES (582735, 2, 511800000000, 511824000000, '625400', '0835', '石棉县', '石棉', '四川,雅安,石棉', 'ShiMian', 102.359462, 29.227874);
INSERT INTO `china_region` VALUES (582853, 2, 511800000000, 511825000000, '625500', '0835', '天全县', '天全', '四川,雅安,天全', 'TianQuan', 102.758317, 30.066713);
INSERT INTO `china_region` VALUES (583007, 2, 511800000000, 511826000000, '625600', '0835', '芦山县', '芦山', '四川,雅安,芦山', 'LuShan', 102.92826, 30.144084);
INSERT INTO `china_region` VALUES (583064, 2, 511800000000, 511827000000, '625700', '0835', '宝兴县', '宝兴', '四川,雅安,宝兴', 'BaoXing', 102.814531, 30.368126);
INSERT INTO `china_region` VALUES (583132, 1, 510000000000, 511900000000, '636600', '0827', '巴中市', '巴中', '四川,巴中', 'BaZhong', 106.747477, 31.867903);
INSERT INTO `china_region` VALUES (583133, 2, 511900000000, 511901000000, '636600', '0827', '市辖区', '巴中', '四川,巴中', 'BaZhong', 106.747477, 31.867903);
INSERT INTO `china_region` VALUES (583134, 2, 511900000000, 511902000000, '636600', '0827', '巴州区', '巴州', '四川,巴中,巴州', 'BaZhou', 106.768878, 31.851478);
INSERT INTO `china_region` VALUES (583596, 2, 511900000000, 511903000000, '636064', '0827', '恩阳区', '恩阳', '四川,巴中,恩阳', 'EnYang', 106.655347, 31.786691);
INSERT INTO `china_region` VALUES (584067, 2, 511900000000, 511921000000, '636700', '0827', '通江县', '通江', '四川,巴中,通江', 'TongJiang', 107.245033, 31.911705);
INSERT INTO `china_region` VALUES (584685, 2, 511900000000, 511922000000, '635600', '0827', '南江县', '南江', '四川,巴中,南江', 'NanJiang', 106.828697, 32.346589);
INSERT INTO `china_region` VALUES (585364, 2, 511900000000, 511923000000, '636400', '0827', '平昌县', '平昌', '四川,巴中,平昌', 'PingChang', 107.104008, 31.560874);
INSERT INTO `china_region` VALUES (585961, 2, 511900000000, 511971000000, '636600', '0827', '巴中经济开发区', '巴中经开区', '四川,巴中,巴中经开区', 'BaZhongJingKaiQu', 106.747477, 31.867903);
INSERT INTO `china_region` VALUES (586006, 1, 510000000000, 512000000000, '641300', '0832', '资阳市', '资阳', '四川,资阳', 'ZiYang', 104.627636, 30.128901);
INSERT INTO `china_region` VALUES (586007, 2, 512000000000, 512001000000, '641300', '0832', '市辖区', '资阳', '四川,资阳', 'ZiYang', 104.627636, 30.128901);
INSERT INTO `china_region` VALUES (586008, 2, 512000000000, 512002000000, '641300', '0832', '雁江区', '雁江', '四川,资阳,雁江', 'YanJiang', 104.677096, 30.10821);
INSERT INTO `china_region` VALUES (586565, 2, 512000000000, 512021000000, '642300', '0832', '安岳县', '安岳', '四川,资阳,安岳', 'AnYue', 105.335613, 30.097246);
INSERT INTO `china_region` VALUES (587613, 2, 512000000000, 512022000000, '641500', '0832', '乐至县', '乐至', '四川,资阳,乐至', 'LeZhi', 105.019916, 30.275487);
INSERT INTO `china_region` VALUES (588272, 1, 510000000000, 513200000000, '624000', '0837', '阿坝藏族羌族自治州', '阿坝', '四川,阿坝', 'ABa', 102.224653, 31.899413);
INSERT INTO `china_region` VALUES (588273, 2, 513200000000, 513201000000, '624000', '0837', '马尔康市', '马尔康', '四川,阿坝,马尔康', 'MaErKang', 102.206504, 31.905813);
INSERT INTO `china_region` VALUES (588396, 2, 513200000000, 513221000000, '623000', '0837', '汶川县', '汶川', '四川,阿坝,汶川', 'WenChuan', 103.590387, 31.476822);
INSERT INTO `china_region` VALUES (588536, 2, 513200000000, 513222000000, '623100', '0837', '理县', '理县', '四川,阿坝,理县', 'LiXian', 103.166853, 31.436473);
INSERT INTO `china_region` VALUES (588639, 2, 513200000000, 513223000000, '623200', '0837', '茂县', '茂县', '四川,阿坝,茂县', 'MaoXian', 103.853522, 31.681154);
INSERT INTO `china_region` VALUES (588813, 2, 513200000000, 513224000000, '623300', '0837', '松潘县', '松潘', '四川,阿坝,松潘', 'SongPan', 103.604698, 32.655325);
INSERT INTO `china_region` VALUES (588988, 2, 513200000000, 513225000000, '623400', '0837', '九寨沟县', '九寨沟', '四川,阿坝,九寨沟', 'JiuZhaiGou', 104.243841, 33.252056);
INSERT INTO `china_region` VALUES (589140, 2, 513200000000, 513226000000, '624100', '0837', '金川县', '金川', '四川,阿坝,金川', 'JinChuan', 102.063829, 31.476277);
INSERT INTO `china_region` VALUES (589275, 2, 513200000000, 513227000000, '624200', '0837', '小金县', '小金', '四川,阿坝,小金', 'XiaoJin', 102.364373, 30.999031);
INSERT INTO `china_region` VALUES (589433, 2, 513200000000, 513228000000, '623500', '0837', '黑水县', '黑水', '四川,阿坝,黑水', 'HeiShui', 102.990108, 32.061895);
INSERT INTO `china_region` VALUES (589579, 2, 513200000000, 513230000000, '624300', '0837', '壤塘县', '壤塘', '四川,阿坝,壤塘', 'RangTang', 100.978526, 32.265796);
INSERT INTO `china_region` VALUES (589655, 2, 513200000000, 513231000000, '624600', '0837', '阿坝县', '阿坝', '四川,阿坝', 'ABa', 101.706655, 32.902459);
INSERT INTO `china_region` VALUES (589766, 2, 513200000000, 513232000000, '624500', '0837', '若尔盖县', '若尔盖', '四川,阿坝,若尔盖', 'RuoErGai', 102.961798, 33.575892);
INSERT INTO `china_region` VALUES (589887, 2, 513200000000, 513233000000, '624400', '0837', '红原县', '红原', '四川,阿坝,红原', 'HongYuan', 102.544405, 32.790891);
INSERT INTO `china_region` VALUES (589937, 1, 510000000000, 513300000000, '626000', '0836', '甘孜藏族自治州', '甘孜', '四川,甘孜', 'GanZi', 101.96231, 30.04952);
INSERT INTO `china_region` VALUES (589938, 2, 513300000000, 513301000000, '626000', '0836', '康定市', '康定', '四川,甘孜,康定', 'KangDing', 101.957146, 29.998436);
INSERT INTO `china_region` VALUES (590204, 2, 513300000000, 513322000000, '626100', '0836', '泸定县', '泸定', '四川,甘孜,泸定', 'LuDing', 102.234618, 29.91416);
INSERT INTO `china_region` VALUES (590369, 2, 513300000000, 513323000000, '626300', '0836', '丹巴县', '丹巴', '四川,甘孜,丹巴', 'DanBa', 101.890358, 30.878577);
INSERT INTO `china_region` VALUES (590570, 2, 513300000000, 513324000000, '616200', '0836', '九龙县', '九龙', '四川,甘孜,九龙', 'JiuLong', 101.507294, 29.000348);
INSERT INTO `china_region` VALUES (590654, 2, 513300000000, 513325000000, '627450', '0836', '雅江县', '雅江', '四川,甘孜,雅江', 'YaJiang', 101.014425, 30.031533);
INSERT INTO `china_region` VALUES (590786, 2, 513300000000, 513326000000, '626400', '0836', '道孚县', '道孚', '四川,甘孜,道孚', 'DaoFu', 101.125237, 30.979545);
INSERT INTO `china_region` VALUES (590969, 2, 513300000000, 513327000000, '626500', '0836', '炉霍县', '炉霍', '四川,甘孜,炉霍', 'LuHuo', 100.676372, 31.39179);
INSERT INTO `china_region` VALUES (591161, 2, 513300000000, 513328000000, '626700', '0836', '甘孜县', '甘孜', '四川,甘孜', 'GanZi', 99.992671, 31.622934);
INSERT INTO `china_region` VALUES (591407, 2, 513300000000, 513329000000, '626800', '0836', '新龙县', '新龙', '四川,甘孜,新龙', 'XinLong', 100.311369, 30.939169);
INSERT INTO `china_region` VALUES (591577, 2, 513300000000, 513330000000, '627250', '0836', '德格县', '德格', '四川,甘孜,德格', 'DeGe', 98.580915, 31.806118);
INSERT INTO `china_region` VALUES (591778, 2, 513300000000, 513331000000, '627150', '0836', '白玉县', '白玉', '四川,甘孜,白玉', 'BaiYu', 98.824182, 31.209913);
INSERT INTO `china_region` VALUES (591956, 2, 513300000000, 513332000000, '627350', '0836', '石渠县', '石渠', '四川,甘孜,石渠', 'ShiQu', 98.1029, 32.97896);
INSERT INTO `china_region` VALUES (592149, 2, 513300000000, 513333000000, '626600', '0836', '色达县', '色达', '四川,甘孜,色达', 'SeDa', 100.332743, 32.268129);
INSERT INTO `china_region` VALUES (592307, 2, 513300000000, 513334000000, '624300', '0836', '理塘县', '理塘', '四川,甘孜,理塘', 'LiTang', 100.269818, 29.996049);
INSERT INTO `china_region` VALUES (592550, 2, 513300000000, 513335000000, '627650', '0836', '巴塘县', '巴塘', '四川,甘孜,巴塘', 'BaTang', 99.110712, 30.004677);
INSERT INTO `china_region` VALUES (592693, 2, 513300000000, 513336000000, '627850', '0836', '乡城县', '乡城', '四川,甘孜,乡城', 'XiangCheng', 99.798435, 28.931172);
INSERT INTO `china_region` VALUES (592798, 2, 513300000000, 513337000000, '627750', '0836', '稻城县', '稻城', '四川,甘孜,稻城', 'DaoCheng', 100.298403, 29.037007);
INSERT INTO `china_region` VALUES (592937, 2, 513300000000, 513338000000, '627950', '0836', '得荣县', '得荣', '四川,甘孜,得荣', 'DeRong', 99.286335, 28.713037);
INSERT INTO `china_region` VALUES (593080, 1, 510000000000, 513400000000, '615000', '0834', '凉山彝族自治州', '凉山', '四川,凉山', 'LiangShan', 102.267335, 27.88161);
INSERT INTO `china_region` VALUES (593081, 2, 513400000000, 513401000000, '615000', '0834', '西昌市', '西昌', '四川,凉山,西昌', 'XiChang', 102.264449, 27.894504);
INSERT INTO `china_region` VALUES (593395, 2, 513400000000, 513422000000, '615800', '0834', '木里藏族自治县', '木里', '四川,凉山,木里', 'MuLi', 101.280206, 27.928835);
INSERT INTO `china_region` VALUES (593548, 2, 513400000000, 513423000000, '615700', '0834', '盐源县', '盐源', '四川,凉山,盐源', 'YanYuan', 101.509188, 27.422645);
INSERT INTO `china_region` VALUES (593854, 2, 513400000000, 513424000000, '615500', '0834', '德昌县', '德昌', '四川,凉山,德昌', 'DeChang', 102.17567, 27.402839);
INSERT INTO `china_region` VALUES (594016, 2, 513400000000, 513425000000, '615100', '0834', '会理县', '会理', '四川,凉山,会理', 'HuiLi', 102.244683, 26.655026);
INSERT INTO `china_region` VALUES (594357, 2, 513400000000, 513426000000, '615200', '0834', '会东县', '会东', '四川,凉山,会东', 'HuiDong', 102.577961, 26.634669);
INSERT INTO `china_region` VALUES (594703, 2, 513400000000, 513427000000, '615400', '0834', '宁南县', '宁南', '四川,凉山,宁南', 'NingNan', 102.759634, 27.066384);
INSERT INTO `china_region` VALUES (594863, 2, 513400000000, 513428000000, '615300', '0834', '普格县', '普格', '四川,凉山,普格', 'PuGe', 102.540901, 27.376413);
INSERT INTO `china_region` VALUES (595059, 2, 513400000000, 513429000000, '615350', '0834', '布拖县', '布拖', '四川,凉山,布拖', 'BuTuo', 102.811631, 27.706192);
INSERT INTO `china_region` VALUES (595282, 2, 513400000000, 513430000000, '616250', '0834', '金阳县', '金阳', '四川,凉山,金阳', 'JinYang', 103.248772, 27.696861);
INSERT INTO `china_region` VALUES (595495, 2, 513400000000, 513431000000, '616150', '0834', '昭觉县', '昭觉', '四川,凉山,昭觉', 'ZhaoJue', 102.842611, 28.014088);
INSERT INTO `china_region` VALUES (595817, 2, 513400000000, 513432000000, '616750', '0834', '喜德县', '喜德', '四川,凉山,喜德', 'XiDe', 102.412518, 28.306726);
INSERT INTO `china_region` VALUES (596015, 2, 513400000000, 513433000000, '615600', '0834', '冕宁县', '冕宁', '四川,凉山,冕宁', 'MianNing', 102.17701, 28.549657);
INSERT INTO `china_region` VALUES (596286, 2, 513400000000, 513434000000, '616650', '0834', '越西县', '越西', '四川,凉山,越西', 'YueXi', 102.50768, 28.639801);
INSERT INTO `china_region` VALUES (596619, 2, 513400000000, 513435000000, '616850', '0834', '甘洛县', '甘洛', '四川,凉山,甘洛', 'GanLuo', 102.771749, 28.966069);
INSERT INTO `china_region` VALUES (596878, 2, 513400000000, 513436000000, '616450', '0834', '美姑县', '美姑', '四川,凉山,美姑', 'MeiGu', 103.13218, 28.32864);
INSERT INTO `china_region` VALUES (597210, 2, 513400000000, 513437000000, '616550', '0834', '雷波县', '雷波', '四川,凉山,雷波', 'LeiBo', 103.571696, 28.262683);
INSERT INTO `china_region` VALUES (597541, 0, 0, 520000000000, '0', NULL, '贵州省', '贵州', '贵州', 'GuiZhou', 106.70741, 26.598194);
INSERT INTO `china_region` VALUES (597542, 1, 520000000000, 520100000000, '550000', '0851', '贵阳市', '贵阳', '贵州,贵阳', 'GuiYang', 106.630153, 26.647661);
INSERT INTO `china_region` VALUES (597543, 2, 520100000000, 520101000000, '550000', '0851', '市辖区', '贵阳', '贵州,贵阳', 'GuiYang', 106.630153, 26.647661);
INSERT INTO `china_region` VALUES (597544, 2, 520100000000, 520102000000, '550000', '0851', '南明区', '南明', '贵州,贵阳,南明', 'NanMing', 106.714374, 26.567944);
INSERT INTO `china_region` VALUES (597775, 2, 520100000000, 520103000000, '550000', '0851', '云岩区', '云岩', '贵州,贵阳,云岩', 'YunYan', 106.724426, 26.604594);
INSERT INTO `china_region` VALUES (597981, 2, 520100000000, 520111000000, '550000', '0851', '花溪区', '花溪', '贵州,贵阳,花溪', 'HuaXi', 106.67026, 26.409817);
INSERT INTO `china_region` VALUES (598223, 2, 520100000000, 520112000000, '550000', '0851', '乌当区', '乌当', '贵州,贵阳,乌当', 'WuDang', 106.750625, 26.630845);
INSERT INTO `china_region` VALUES (598345, 2, 520100000000, 520113000000, '550000', '0851', '白云区', '白云', '贵州,贵阳,白云', 'BaiYun', 106.623007, 26.678562);
INSERT INTO `china_region` VALUES (598455, 2, 520100000000, 520115000000, '550081', '0851', '观山湖区', '观山湖', '贵州,贵阳,观山湖', 'GuanShanHu', 106.622453, 26.60145);
INSERT INTO `china_region` VALUES (598594, 2, 520100000000, 520121000000, '550300', '0851', '开阳县', '开阳', '贵州,贵阳,开阳', 'KaiYang', 106.965089, 27.057764);
INSERT INTO `china_region` VALUES (598749, 2, 520100000000, 520122000000, '551100', '0851', '息烽县', '息烽', '贵州,贵阳,息烽', 'XiFeng', 106.740407, 27.090479);
INSERT INTO `china_region` VALUES (598939, 2, 520100000000, 520123000000, '550200', '0851', '修文县', '修文', '贵州,贵阳,修文', 'XiuWen', 106.592108, 26.838926);
INSERT INTO `china_region` VALUES (599078, 2, 520100000000, 520181000000, '551400', '0851', '清镇市', '清镇', '贵州,贵阳,清镇', 'QingZhen', 106.470714, 26.556079);
INSERT INTO `china_region` VALUES (599322, 1, 520000000000, 520200000000, '553000', '0858', '六盘水市', '六盘水', '贵州,六盘水', 'LiuPanShui', 104.830359, 26.592666);
INSERT INTO `china_region` VALUES (599323, 2, 520200000000, 520201000000, '553000', '0858', '钟山区', '钟山', '贵州,六盘水,钟山', 'ZhongShan', 104.843555, 26.574979);
INSERT INTO `china_region` VALUES (599473, 2, 520200000000, 520203000000, '553400', '0858', '六枝特区', '六枝特', '贵州,六盘水,六枝特', 'LiuZhiTe', 105.480029, 26.201228);
INSERT INTO `china_region` VALUES (599745, 2, 520200000000, 520221000000, '553600', '0858', '水城县', '水城', '贵州,六盘水,水城', 'ShuiCheng', 104.957831, 26.547904);
INSERT INTO `china_region` VALUES (600001, 2, 520200000000, 520281000000, '553537', '0858', '盘州市', '盘州', '贵州,六盘水,盘州', 'PanZhou', 104.830359, 26.592666);
INSERT INTO `china_region` VALUES (600559, 1, 520000000000, 520300000000, '563000', '0852', '遵义市', '遵义', '贵州,遵义', 'ZunYi', 106.927389, 27.725654);
INSERT INTO `china_region` VALUES (600560, 2, 520300000000, 520301000000, '563000', '0852', '市辖区', '遵义', '贵州,遵义', 'ZunYi', 106.927389, 27.725654);
INSERT INTO `china_region` VALUES (600561, 2, 520300000000, 520302000000, '563000', '0852', '红花岗区', '红花岗', '贵州,遵义,红花岗', 'HongHuaGang', 106.893709, 27.644755);
INSERT INTO `china_region` VALUES (600780, 2, 520300000000, 520303000000, '563000', '0852', '汇川区', '汇川', '贵州,遵义,汇川', 'HuiChuan', 106.93427, 27.750125);
INSERT INTO `china_region` VALUES (600931, 2, 520300000000, 520304000000, '553507', '0852', '播州区', '播州', '贵州,遵义,播州', 'BoZhou', 106.927389, 27.725654);
INSERT INTO `china_region` VALUES (601134, 2, 520300000000, 520322000000, '563200', '0852', '桐梓县', '桐梓', '贵州,遵义,桐梓', 'TongZi', 106.825644, 28.133583);
INSERT INTO `china_region` VALUES (601388, 2, 520300000000, 520323000000, '563300', '0852', '绥阳县', '绥阳', '贵州,遵义,绥阳', 'SuiYang', 107.191222, 27.946222);
INSERT INTO `china_region` VALUES (601523, 2, 520300000000, 520324000000, '563400', '0852', '正安县', '正安', '贵州,遵义,正安', 'ZhengAn', 107.453945, 28.553285);
INSERT INTO `china_region` VALUES (601698, 2, 520300000000, 520325000000, '563500', '0852', '道真仡佬族苗族自治县', '道真', '贵州,遵义,道真', 'DaoZhen', 107.613133, 28.862425);
INSERT INTO `china_region` VALUES (601798, 2, 520300000000, 520326000000, '564300', '0852', '务川仡佬族苗族自治县', '务川', '贵州,遵义,务川', 'WuChuan', 107.898957, 28.563086);
INSERT INTO `china_region` VALUES (601938, 2, 520300000000, 520327000000, '564200', '0852', '凤冈县', '凤冈', '贵州,遵义,凤冈', 'FengGang', 107.716356, 27.954695);
INSERT INTO `china_region` VALUES (602040, 2, 520300000000, 520328000000, '564100', '0852', '湄潭县', '湄潭', '贵州,遵义,湄潭', 'MeiTan', 107.465407, 27.749055);
INSERT INTO `china_region` VALUES (602193, 2, 520300000000, 520329000000, '564400', '0852', '余庆县', '余庆', '贵州,遵义,余庆', 'YuQing', 107.905278, 27.21542);
INSERT INTO `china_region` VALUES (602275, 2, 520300000000, 520330000000, '564600', '0852', '习水县', '习水', '贵州,遵义,习水', 'XiShui', 106.197138, 28.33127);
INSERT INTO `china_region` VALUES (602554, 2, 520300000000, 520381000000, '564700', '0852', '赤水市', '赤水', '贵州,遵义,赤水', 'ChiShui', 105.697472, 28.590337);
INSERT INTO `china_region` VALUES (602699, 2, 520300000000, 520382000000, '564500', '0852', '仁怀市', '仁怀', '贵州,遵义,仁怀', 'RenHuai', 106.400342, 27.79165);
INSERT INTO `china_region` VALUES (602894, 1, 520000000000, 520400000000, '561000', '0853', '安顺市', '安顺', '贵州,安顺', 'AnShun', 105.947593, 26.253072);
INSERT INTO `china_region` VALUES (602895, 2, 520400000000, 520401000000, '561000', '0853', '市辖区', '安顺', '贵州,安顺', 'AnShun', 105.947593, 26.253072);
INSERT INTO `china_region` VALUES (602896, 2, 520400000000, 520402000000, '561000', '0853', '西秀区', '西秀', '贵州,安顺,西秀', 'XiXiu', 105.965535, 26.245433);
INSERT INTO `china_region` VALUES (603279, 2, 520400000000, 520403000000, '561199', '0853', '平坝区', '平坝', '贵州,安顺,平坝', 'PingBa', 106.255557, 26.405502);
INSERT INTO `china_region` VALUES (603439, 2, 520400000000, 520422000000, '562100', '0853', '普定县', '普定', '贵州,安顺,普定', 'PuDing', 105.743196, 26.301446);
INSERT INTO `china_region` VALUES (603628, 2, 520400000000, 520423000000, '561200', '0853', '镇宁布依族苗族自治县', '镇宁', '贵州,安顺,镇宁', 'ZhenNing', 105.770402, 26.057362);
INSERT INTO `china_region` VALUES (603858, 2, 520400000000, 520424000000, '561300', '0853', '关岭布依族苗族自治县', '关岭', '贵州,安顺,关岭', 'GuanLing', 105.618745, 25.943856);
INSERT INTO `china_region` VALUES (604033, 2, 520400000000, 520425000000, '550800', '0853', '紫云苗族布依族自治县', '紫云', '贵州,安顺,紫云', 'ZiYun', 106.08434, 25.751052);
INSERT INTO `china_region` VALUES (604221, 1, 520000000000, 520500000000, '551700', '0857', '毕节市', '毕节', '贵州,毕节', 'BiJie', 105.283992, 27.302589);
INSERT INTO `china_region` VALUES (604222, 2, 520500000000, 520501000000, '551700', '0857', '市辖区', '毕节', '贵州,毕节', 'BiJie', 105.283992, 27.302589);
INSERT INTO `china_region` VALUES (604223, 2, 520500000000, 520502000000, '550500', '0857', '七星关区', '七星关', '贵州,毕节,七星关', 'QiXingGuan', 105.305138, 27.298494);
INSERT INTO `china_region` VALUES (604832, 2, 520500000000, 520521000000, '551600', '0857', '大方县', '大方', '贵州,毕节,大方', 'DaFang', 105.611656, 27.137097);
INSERT INTO `china_region` VALUES (605263, 2, 520500000000, 520522000000, '551500', '0857', '黔西县', '黔西', '贵州,毕节,黔西', 'QianXi', 106.033544, 27.007713);
INSERT INTO `china_region` VALUES (605681, 2, 520500000000, 520523000000, '551800', '0857', '金沙县', '金沙', '贵州,毕节,金沙', 'JinSha', 106.220228, 27.459214);
INSERT INTO `china_region` VALUES (605950, 2, 520500000000, 520524000000, '552100', '0857', '织金县', '织金', '贵州,毕节,织金', 'ZhiJin', 105.770542, 26.66345);
INSERT INTO `china_region` VALUES (606562, 2, 520500000000, 520525000000, '553300', '0857', '纳雍县', '纳雍', '贵州,毕节,纳雍', 'NaYong', 105.382715, 26.777645);
INSERT INTO `china_region` VALUES (607033, 2, 520500000000, 520526000000, '553100', '0857', '威宁彝族回族苗族自治县', '威宁', '贵州,毕节,威宁', 'WeiNing', 104.278733, 26.856193);
INSERT INTO `china_region` VALUES (607701, 2, 520500000000, 520527000000, '553200', '0857', '赫章县', '赫章', '贵州,毕节,赫章', 'HeZhang', 104.727418, 27.123079);
INSERT INTO `china_region` VALUES (608213, 1, 520000000000, 520600000000, '554300', '0856', '铜仁市', '铜仁', '贵州,铜仁', 'TongRen', 109.189598, 27.731514);
INSERT INTO `china_region` VALUES (608214, 2, 520600000000, 520601000000, '554300', '0856', '市辖区', '铜仁', '贵州,铜仁', 'TongRen', 109.189598, 27.731514);
INSERT INTO `china_region` VALUES (608215, 2, 520600000000, 520602000000, '551605', '0856', '碧江区', '碧江', '贵州,铜仁,碧江', 'BiJiang', 109.181122, 27.690653);
INSERT INTO `china_region` VALUES (608323, 2, 520600000000, 520603000000, '554200', '0856', '万山区', '万山', '贵州,铜仁,万山', 'WanShan', 109.213644, 27.517896);
INSERT INTO `china_region` VALUES (608434, 2, 520600000000, 520621000000, '554400', '0856', '江口县', '江口', '贵州,铜仁,江口', 'JiangKou', 108.839557, 27.69965);
INSERT INTO `china_region` VALUES (608550, 2, 520600000000, 520622000000, '554000', '0856', '玉屏侗族自治县', '玉屏', '贵州,铜仁,玉屏', 'YuPing', 108.91468, 27.243012);
INSERT INTO `china_region` VALUES (608655, 2, 520600000000, 520623000000, '555100', '0856', '石阡县', '石阡', '贵州,铜仁,石阡', 'ShiQian', 108.223612, 27.513829);
INSERT INTO `china_region` VALUES (608986, 2, 520600000000, 520624000000, '565100', '0856', '思南县', '思南', '贵州,铜仁,思南', 'SiNan', 108.253873, 27.93756);
INSERT INTO `china_region` VALUES (609543, 2, 520600000000, 520625000000, '555200', '0856', '印江土家族苗族自治县', '印江', '贵州,铜仁,印江', 'YinJiang', 108.409752, 27.994247);
INSERT INTO `china_region` VALUES (609935, 2, 520600000000, 520626000000, '565200', '0856', '德江县', '德江', '贵州,铜仁,德江', 'DeJiang', 108.119807, 28.263964);
INSERT INTO `china_region` VALUES (610301, 2, 520600000000, 520627000000, '565300', '0856', '沿河土家族自治县', '沿河', '贵州,铜仁,沿河', 'YanHe', 108.50387, 28.563928);
INSERT INTO `china_region` VALUES (610774, 2, 520600000000, 520628000000, '554100', '0856', '松桃苗族自治县', '松桃', '贵州,铜仁,松桃', 'SongTao', 109.202886, 28.154071);
INSERT INTO `china_region` VALUES (611329, 1, 520000000000, 522300000000, '562400', '0859', '黔西南布依族苗族自治州', '黔西南', '贵州,黔西南', 'QianXiNan', 104.906396, 25.087825);
INSERT INTO `china_region` VALUES (611330, 2, 522300000000, 522301000000, '562400', '0859', '兴义市', '兴义', '贵州,黔西南,兴义', 'XingYi', 104.895467, 25.09204);
INSERT INTO `china_region` VALUES (611595, 2, 522300000000, 522302000000, '562300', '0859', '兴仁市', '兴仁', '贵州,黔西南,兴仁', 'XingRen', 105.186238, 25.435183);
INSERT INTO `china_region` VALUES (611781, 2, 522300000000, 522323000000, '561500', '0859', '普安县', '普安', '贵州,黔西南,普安', 'PuAn', 104.953063, 25.784135);
INSERT INTO `china_region` VALUES (611889, 2, 522300000000, 522324000000, '561400', '0859', '晴隆县', '晴隆', '贵州,黔西南,晴隆', 'QingLong', 105.218991, 25.834784);
INSERT INTO `china_region` VALUES (612015, 2, 522300000000, 522325000000, '562200', '0859', '贞丰县', '贞丰', '贵州,黔西南,贞丰', 'ZhenFeng', 105.649864, 25.38576);
INSERT INTO `china_region` VALUES (612201, 2, 522300000000, 522326000000, '552300', '0859', '望谟县', '望谟', '贵州,黔西南,望谟', 'WangMo', 106.09385, 25.171024);
INSERT INTO `china_region` VALUES (612387, 2, 522300000000, 522327000000, '552200', '0859', '册亨县', '册亨', '贵州,黔西南,册亨', 'CeHeng', 105.811593, 24.983663);
INSERT INTO `china_region` VALUES (612533, 2, 522300000000, 522328000000, '552400', '0859', '安龙县', '安龙', '贵州,黔西南,安龙', 'AnLong', 105.442701, 25.099014);
INSERT INTO `china_region` VALUES (612740, 1, 520000000000, 522600000000, '556000', '0855', '黔东南苗族侗族自治州', '黔东南', '贵州,黔东南', 'QianDongNan', 107.982859, 26.583442);
INSERT INTO `china_region` VALUES (612741, 2, 522600000000, 522601000000, '556000', '0855', '凯里市', '凯里', '贵州,黔东南,凯里', 'KaiLi', 107.981212, 26.566867);
INSERT INTO `china_region` VALUES (612960, 2, 522600000000, 522622000000, '556100', '0855', '黄平县', '黄平', '贵州,黔东南,黄平', 'HuangPing', 107.916412, 26.905396);
INSERT INTO `china_region` VALUES (613127, 2, 522600000000, 522623000000, '556200', '0855', '施秉县', '施秉', '贵州,黔东南,施秉', 'ShiBing', 108.12438, 27.03292);
INSERT INTO `china_region` VALUES (613212, 2, 522600000000, 522624000000, '556500', '0855', '三穗县', '三穗', '贵州,黔东南,三穗', 'SanSui', 108.675267, 26.952968);
INSERT INTO `china_region` VALUES (613317, 2, 522600000000, 522625000000, '557700', '0855', '镇远县', '镇远', '贵州,黔东南,镇远', 'ZhenYuan', 108.429691, 27.04911);
INSERT INTO `china_region` VALUES (613459, 2, 522600000000, 522626000000, '557800', '0855', '岑巩县', '岑巩', '贵州,黔东南,岑巩', 'CenGong', 108.81606, 27.173887);
INSERT INTO `china_region` VALUES (613568, 2, 522600000000, 522627000000, '556600', '0855', '天柱县', '天柱', '贵州,黔东南,天柱', 'TianZhu', 109.207757, 26.909678);
INSERT INTO `china_region` VALUES (613713, 2, 522600000000, 522628000000, '556700', '0855', '锦屏县', '锦屏', '贵州,黔东南,锦屏', 'JinPing', 109.200534, 26.676233);
INSERT INTO `china_region` VALUES (613840, 2, 522600000000, 522629000000, '556400', '0855', '剑河县', '剑河', '贵州,黔东南,剑河', 'JianHe', 108.441501, 26.728274);
INSERT INTO `china_region` VALUES (614037, 2, 522600000000, 522630000000, '556300', '0855', '台江县', '台江', '贵州,黔东南,台江', 'TaiJiang', 108.321245, 26.667525);
INSERT INTO `china_region` VALUES (614114, 2, 522600000000, 522631000000, '557300', '0855', '黎平县', '黎平', '贵州,黔东南,黎平', 'LiPing', 109.136658, 26.230424);
INSERT INTO `china_region` VALUES (614459, 2, 522600000000, 522632000000, '557200', '0855', '榕江县', '榕江', '贵州,黔东南,榕江', 'RongJiang', 108.521881, 25.931893);
INSERT INTO `china_region` VALUES (614725, 2, 522600000000, 522633000000, '557400', '0855', '从江县', '从江', '贵州,黔东南,从江', 'CongJiang', 108.905329, 25.753009);
INSERT INTO `china_region` VALUES (614971, 2, 522600000000, 522634000000, '557100', '0855', '雷山县', '雷山', '贵州,黔东南,雷山', 'LeiShan', 108.07754, 26.378443);
INSERT INTO `china_region` VALUES (615145, 2, 522600000000, 522635000000, '557600', '0855', '麻江县', '麻江', '贵州,黔东南,麻江', 'MaJiang', 107.589359, 26.491105);
INSERT INTO `china_region` VALUES (615223, 2, 522600000000, 522636000000, '557500', '0855', '丹寨县', '丹寨', '贵州,黔东南,丹寨', 'DanZhai', 107.788728, 26.19832);
INSERT INTO `china_region` VALUES (615350, 1, 520000000000, 522700000000, '558000', '0854', '黔南布依族苗族自治州', '黔南', '贵州,黔南', 'QianNan', 107.522097, 26.254092);
INSERT INTO `china_region` VALUES (615351, 2, 522700000000, 522701000000, '558000', '0854', '都匀市', '都匀', '贵州,黔南,都匀', 'DuYun', 107.518847, 26.259427);
INSERT INTO `china_region` VALUES (615504, 2, 522700000000, 522702000000, '550500', '0854', '福泉市', '福泉', '贵州,黔南,福泉', 'FuQuan', 107.520386, 26.686335);
INSERT INTO `china_region` VALUES (615590, 2, 522700000000, 522722000000, '558400', '0854', '荔波县', '荔波', '贵州,黔南,荔波', 'LiBo', 107.88645, 25.410654);
INSERT INTO `china_region` VALUES (615700, 2, 522700000000, 522723000000, '551300', '0854', '贵定县', '贵定', '贵州,黔南,贵定', 'GuiDing', 107.232889, 26.557071);
INSERT INTO `china_region` VALUES (615820, 2, 522700000000, 522725000000, '550400', '0854', '瓮安县', '瓮安', '贵州,黔南,瓮安', 'WengAn', 107.471555, 27.078472);
INSERT INTO `china_region` VALUES (615936, 2, 522700000000, 522726000000, '558200', '0854', '独山县', '独山', '贵州,黔南,独山', 'DuShan', 107.545048, 25.822132);
INSERT INTO `china_region` VALUES (616011, 2, 522700000000, 522727000000, '558300', '0854', '平塘县', '平塘', '贵州,黔南,平塘', 'PingTang', 107.323077, 25.831955);
INSERT INTO `china_region` VALUES (616150, 2, 522700000000, 522728000000, '550100', '0854', '罗甸县', '罗甸', '贵州,黔南,罗甸', 'LuoDian', 106.751418, 25.424845);
INSERT INTO `china_region` VALUES (616343, 2, 522700000000, 522729000000, '550700', '0854', '长顺县', '长顺', '贵州,黔南,长顺', 'ChangShun', 106.447376, 26.022116);
INSERT INTO `china_region` VALUES (616439, 2, 522700000000, 522730000000, '551200', '0854', '龙里县', '龙里', '贵州,黔南,龙里', 'LongLi', 106.979524, 26.453154);
INSERT INTO `china_region` VALUES (616525, 2, 522700000000, 522731000000, '550600', '0854', '惠水县', '惠水', '贵州,黔南,惠水', 'HuiShui', 106.657089, 26.132061);
INSERT INTO `china_region` VALUES (616755, 2, 522700000000, 522732000000, '558100', '0854', '三都水族自治县', '三都', '贵州,黔南,三都', 'SanDu', 107.869749, 25.983202);
INSERT INTO `china_region` VALUES (616854, 0, 0, 530000000000, '0', NULL, '云南省', '云南', '云南', 'YunNan', 102.710002, 25.045806);
INSERT INTO `china_region` VALUES (616855, 1, 530000000000, 530100000000, '650000', '0871', '昆明市', '昆明', '云南,昆明', 'KunMing', 102.832891, 24.880095);
INSERT INTO `china_region` VALUES (616856, 2, 530100000000, 530101000000, '650000', '0871', '市辖区', '昆明', '云南,昆明', 'KunMing', 102.832891, 24.880095);
INSERT INTO `china_region` VALUES (616857, 2, 530100000000, 530102000000, '650000', '0871', '五华区', '五华', '云南,昆明,五华', 'WuHua', 102.706959, 25.043652);
INSERT INTO `china_region` VALUES (616971, 2, 530100000000, 530103000000, '650000', '0871', '盘龙区', '盘龙', '云南,昆明,盘龙', 'PanLong', 102.751907, 25.116106);
INSERT INTO `china_region` VALUES (617087, 2, 530100000000, 530111000000, '650200', '0871', '官渡区', '官渡', '云南,昆明,官渡', 'GuanDu', 102.743812, 25.015105);
INSERT INTO `china_region` VALUES (617228, 2, 530100000000, 530112000000, '650100', '0871', '西山区', '西山', '云南,昆明,西山', 'XiShan', 102.664376, 25.038297);
INSERT INTO `china_region` VALUES (617361, 2, 530100000000, 530113000000, '654100', '0871', '东川区', '东川', '云南,昆明,东川', 'DongChuan', 103.187824, 26.082873);
INSERT INTO `china_region` VALUES (617539, 2, 530100000000, 530114000000, '650501', '0871', '呈贡区', '呈贡', '云南,昆明,呈贡', 'ChengGong', 102.821468, 24.885532);
INSERT INTO `china_region` VALUES (617631, 2, 530100000000, 530115000000, '650600', '0871', '晋宁区', '晋宁', '云南,昆明,晋宁', 'JinNing', 102.832891, 24.880095);
INSERT INTO `china_region` VALUES (617777, 2, 530100000000, 530124000000, '650400', '0871', '富民县', '富民', '云南,昆明,富民', 'FuMin', 102.497684, 25.222045);
INSERT INTO `china_region` VALUES (617860, 2, 530100000000, 530125000000, '652100', '0871', '宜良县', '宜良', '云南,昆明,宜良', 'YiLiang', 103.141307, 24.919705);
INSERT INTO `china_region` VALUES (618010, 2, 530100000000, 530126000000, '652200', '0871', '石林彝族自治县', '石林', '云南,昆明,石林', 'ShiLin', 103.290785, 24.771798);
INSERT INTO `china_region` VALUES (618111, 2, 530100000000, 530127000000, '651700', '0871', '嵩明县', '嵩明', '云南,昆明,嵩明', 'SongMing', 103.036908, 25.338643);
INSERT INTO `china_region` VALUES (618196, 2, 530100000000, 530128000000, '651500', '0871', '禄劝彝族苗族自治县', '禄劝', '云南,昆明,禄劝', 'LuQuan', 102.471518, 25.551332);
INSERT INTO `china_region` VALUES (618414, 2, 530100000000, 530129000000, '655200', '0871', '寻甸回族彝族自治县', '寻甸', '云南,昆明,寻甸', 'XunDian', 103.256604, 25.558175);
INSERT INTO `china_region` VALUES (618608, 2, 530100000000, 530181000000, '650300', '0871', '安宁市', '安宁', '云南,昆明,安宁', 'AnNing', 102.478494, 24.919493);
INSERT INTO `china_region` VALUES (618717, 1, 530000000000, 530300000000, '655000', '0874', '曲靖市', '曲靖', '云南,曲靖', 'QuJing', 103.796167, 25.489999);
INSERT INTO `china_region` VALUES (618718, 2, 530300000000, 530301000000, '655000', '0874', '市辖区', '曲靖', '云南,曲靖', 'QuJing', 103.796167, 25.489999);
INSERT INTO `china_region` VALUES (618719, 2, 530300000000, 530302000000, '655000', '0874', '麒麟区', '麒麟', '云南,曲靖,麒麟', 'QiLin', 103.805012, 25.495241);
INSERT INTO `china_region` VALUES (618879, 2, 530300000000, 530303000000, '655500', '0874', '沾益区', '沾益', '云南,曲靖,沾益', 'ZhanYi', 103.796167, 25.489999);
INSERT INTO `china_region` VALUES (619025, 2, 530300000000, 530304000000, '655100', '0874', '马龙区', '马龙', '云南,曲靖,马龙', 'MaLong', 103.578454, 25.42813);
INSERT INTO `china_region` VALUES (619111, 2, 530300000000, 530322000000, '655600', '0874', '陆良县', '陆良', '云南,曲靖,陆良', 'LuLiang', 103.666663, 25.030051);
INSERT INTO `china_region` VALUES (619273, 2, 530300000000, 530323000000, '655700', '0874', '师宗县', '师宗', '云南,曲靖,师宗', 'ShiZong', 103.985478, 24.822403);
INSERT INTO `china_region` VALUES (619394, 2, 530300000000, 530324000000, '655800', '0874', '罗平县', '罗平', '云南,曲靖,罗平', 'LuoPing', 104.308675, 24.884626);
INSERT INTO `china_region` VALUES (619562, 2, 530300000000, 530325000000, '655500', '0874', '富源县', '富源', '云南,曲靖,富源', 'FuYuan', 104.255015, 25.674238);
INSERT INTO `china_region` VALUES (619736, 2, 530300000000, 530326000000, '654200', '0874', '会泽县', '会泽', '云南,曲靖,会泽', 'HuiZe', 103.297361, 26.417947);
INSERT INTO `china_region` VALUES (620138, 2, 530300000000, 530381000000, '655400', '0874', '宣威市', '宣威', '云南,曲靖,宣威', 'XuanWei', 104.104497, 26.219759);
INSERT INTO `china_region` VALUES (620528, 1, 530000000000, 530400000000, '653100', '0877', '玉溪市', '玉溪', '云南,玉溪', 'YuXi', 102.546543, 24.352036);
INSERT INTO `china_region` VALUES (620529, 2, 530400000000, 530401000000, '653100', '0877', '市辖区', '玉溪', '云南,玉溪', 'YuXi', 102.546543, 24.352036);
INSERT INTO `china_region` VALUES (620530, 2, 530400000000, 530402000000, '653100', '0877', '红塔区', '红塔', '云南,玉溪,红塔', 'HongTa', 102.540179, 24.341098);
INSERT INTO `china_region` VALUES (620646, 2, 530400000000, 530403000000, '652600', '0877', '江川区', '江川', '云南,玉溪,江川', 'JiangChuan', 102.75376, 24.287586);
INSERT INTO `china_region` VALUES (620728, 2, 530400000000, 530422000000, '652500', '0877', '澄江县', '澄江', '云南,玉溪,澄江', 'ChengJiang', 102.908248, 24.673734);
INSERT INTO `china_region` VALUES (620775, 2, 530400000000, 530423000000, '652700', '0877', '通海县', '通海', '云南,玉溪,通海', 'TongHai', 102.760039, 24.112205);
INSERT INTO `china_region` VALUES (620861, 2, 530400000000, 530424000000, '652800', '0877', '华宁县', '华宁', '云南,玉溪,华宁', 'HuaNing', 102.928835, 24.192761);
INSERT INTO `china_region` VALUES (620944, 2, 530400000000, 530425000000, '651100', '0877', '易门县', '易门', '云南,玉溪,易门', 'YiMen', 102.162531, 24.671651);
INSERT INTO `china_region` VALUES (621010, 2, 530400000000, 530426000000, '653200', '0877', '峨山彝族自治县', '峨山', '云南,玉溪,峨山', 'EShan', 102.405819, 24.168957);
INSERT INTO `china_region` VALUES (621095, 2, 530400000000, 530427000000, '653400', '0877', '新平彝族傣族自治县', '新平', '云南,玉溪,新平', 'XinPing', 101.990157, 24.070051);
INSERT INTO `china_region` VALUES (621231, 2, 530400000000, 530428000000, '653300', '0877', '元江哈尼族彝族傣族自治县', '元江', '云南,玉溪,元江', 'YuanJiang', 101.998103, 23.596503);
INSERT INTO `china_region` VALUES (621323, 1, 530000000000, 530500000000, '678000', '0875', '保山市', '保山', '云南,保山', 'BaoShan', 99.161761, 25.112046);
INSERT INTO `china_region` VALUES (621324, 2, 530500000000, 530501000000, '678000', '0875', '市辖区', '保山', '云南,保山', 'BaoShan', 99.161761, 25.112046);
INSERT INTO `china_region` VALUES (621325, 2, 530500000000, 530502000000, '678000', '0875', '隆阳区', '隆阳', '云南,保山,隆阳', 'LongYang', 99.165607, 25.121154);
INSERT INTO `china_region` VALUES (621699, 2, 530500000000, 530521000000, '678200', '0875', '施甸县', '施甸', '云南,保山,施甸', 'ShiDian', 99.189221, 24.723064);
INSERT INTO `china_region` VALUES (621853, 2, 530500000000, 530523000000, '678300', '0875', '龙陵县', '龙陵', '云南,保山,龙陵', 'LongLing', 98.68923, 24.586766);
INSERT INTO `china_region` VALUES (621985, 2, 530500000000, 530524000000, '678100', '0875', '昌宁县', '昌宁', '云南,保山,昌宁', 'ChangNing', 99.605142, 24.827839);
INSERT INTO `china_region` VALUES (622123, 2, 530500000000, 530581000000, '679100', '0875', '腾冲市', '腾冲', '云南,保山,腾冲', 'TengChong', 98.485333, 25.033111);
INSERT INTO `china_region` VALUES (622363, 1, 530000000000, 530600000000, '657000', '0870', '昭通市', '昭通', '云南,昭通', 'ZhaoTong', 103.717465, 27.338257);
INSERT INTO `china_region` VALUES (622364, 2, 530600000000, 530601000000, '657000', '0870', '市辖区', '昭通', '云南,昭通', 'ZhaoTong', 103.717465, 27.338257);
INSERT INTO `china_region` VALUES (622365, 2, 530600000000, 530602000000, '657000', '0870', '昭阳区', '昭阳', '云南,昭通,昭阳', 'ZhaoYang', 103.706539, 27.320075);
INSERT INTO `china_region` VALUES (622570, 2, 530600000000, 530621000000, '657100', '0870', '鲁甸县', '鲁甸', '云南,昭通,鲁甸', 'LuDian', 103.558042, 27.186659);
INSERT INTO `china_region` VALUES (622680, 2, 530600000000, 530622000000, '654600', '0870', '巧家县', '巧家', '云南,昭通,巧家', 'QiaoJia', 102.930164, 26.908461);
INSERT INTO `china_region` VALUES (622881, 2, 530600000000, 530623000000, '657500', '0870', '盐津县', '盐津', '云南,昭通,盐津', 'YanJin', 104.234442, 28.10871);
INSERT INTO `china_region` VALUES (622989, 2, 530600000000, 530624000000, '657400', '0870', '大关县', '大关', '云南,昭通,大关', 'DaGuan', 103.891146, 27.747978);
INSERT INTO `china_region` VALUES (623083, 2, 530600000000, 530625000000, '657300', '0870', '永善县', '永善', '云南,昭通,永善', 'YongShan', 103.638067, 28.229113);
INSERT INTO `china_region` VALUES (623243, 2, 530600000000, 530626000000, '657700', '0870', '绥江县', '绥江', '云南,昭通,绥江', 'SuiJiang', 103.968978, 28.5921);
INSERT INTO `china_region` VALUES (623292, 2, 530600000000, 530627000000, '657200', '0870', '镇雄县', '镇雄', '云南,昭通,镇雄', 'ZhenXiong', 104.873579, 27.441668);
INSERT INTO `china_region` VALUES (623586, 2, 530600000000, 530628000000, '657600', '0870', '彝良县', '彝良', '云南,昭通,彝良', 'YiLiang', 104.048289, 27.625419);
INSERT INTO `china_region` VALUES (623742, 2, 530600000000, 530629000000, '657900', '0870', '威信县', '威信', '云南,昭通,威信', 'WeiXin', 105.049027, 27.846901);
INSERT INTO `china_region` VALUES (623840, 2, 530600000000, 530681000000, '657800', '0870', '水富市', '水富', '云南,昭通,水富', 'ShuiFu', 104.416031, 28.62988);
INSERT INTO `china_region` VALUES (623874, 1, 530000000000, 530700000000, '674100', '0888', '丽江市', '丽江', '云南,丽江', 'LiJiang', 100.22775, 26.855047);
INSERT INTO `china_region` VALUES (623875, 2, 530700000000, 530701000000, '674100', '0888', '市辖区', '丽江', '云南,丽江', 'LiJiang', 100.22775, 26.855047);
INSERT INTO `china_region` VALUES (623876, 2, 530700000000, 530702000000, '674100', '0888', '古城区', '古城', '云南,丽江,古城', 'GuCheng', 100.225766, 26.87719);
INSERT INTO `china_region` VALUES (623948, 2, 530700000000, 530721000000, '674100', '0888', '玉龙纳西族自治县', '玉龙', '云南,丽江,玉龙', 'YuLong', 100.236955, 26.82146);
INSERT INTO `china_region` VALUES (624069, 2, 530700000000, 530722000000, '674200', '0888', '永胜县', '永胜', '云南,丽江,永胜', 'YongSheng', 100.750795, 26.684225);
INSERT INTO `china_region` VALUES (624235, 2, 530700000000, 530723000000, '674800', '0888', '华坪县', '华坪', '云南,丽江,华坪', 'HuaPing', 101.266195, 26.629211);
INSERT INTO `china_region` VALUES (624305, 2, 530700000000, 530724000000, '674300', '0888', '宁蒗彝族自治县', '宁蒗', '云南,丽江,宁蒗', 'NingLang', 100.852001, 27.282071);
INSERT INTO `china_region` VALUES (624412, 1, 530000000000, 530800000000, '665000', '0879', '普洱市', '普洱', '云南,普洱', 'PuEr', 100.966512, 22.825065);
INSERT INTO `china_region` VALUES (624413, 2, 530800000000, 530801000000, '665000', '0879', '市辖区', '普洱', '云南,普洱', 'PuEr', 100.966512, 22.825065);
INSERT INTO `china_region` VALUES (624414, 2, 530800000000, 530802000000, '665000', '0879', '思茅区', '思茅', '云南,普洱,思茅', 'SiMao', 100.977165, 22.78691);
INSERT INTO `china_region` VALUES (624495, 2, 530800000000, 530821000000, '665100', '0879', '宁洱哈尼族彝族自治县', '宁洱', '云南,普洱,宁洱', 'NingEr', 101.045317, 23.06175);
INSERT INTO `china_region` VALUES (624594, 2, 530800000000, 530822000000, '654800', '0879', '墨江哈尼族自治县', '墨江', '云南,普洱,墨江', 'MoJiang', 101.692461, 23.431894);
INSERT INTO `china_region` VALUES (624778, 2, 530800000000, 530823000000, '676200', '0879', '景东彝族自治县', '景东', '云南,普洱,景东', 'JingDong', 100.833877, 24.446731);
INSERT INTO `china_region` VALUES (624962, 2, 530800000000, 530824000000, '666400', '0879', '景谷傣族彝族自治县', '景谷', '云南,普洱,景谷', 'JingGu', 100.702871, 23.497028);
INSERT INTO `china_region` VALUES (625115, 2, 530800000000, 530825000000, '666500', '0879', '镇沅彝族哈尼族拉祜族自治县', '镇沅', '云南,普洱,镇沅', 'ZhenYuan', 101.108595, 24.004442);
INSERT INTO `china_region` VALUES (625236, 2, 530800000000, 530826000000, '665900', '0879', '江城哈尼族彝族自治县', '江城', '云南,普洱,江城', 'JiangCheng', 101.86212, 22.585868);
INSERT INTO `china_region` VALUES (625296, 2, 530800000000, 530827000000, '665000', '0879', '孟连傣族拉祜族佤族自治县', '孟连', '云南,普洱,孟连', 'MengLian', 99.584157, 22.3291);
INSERT INTO `china_region` VALUES (625345, 2, 530800000000, 530828000000, '665600', '0879', '澜沧拉祜族自治县', '澜沧', '云南,普洱,澜沧', 'LanCang', 99.931975, 22.555905);
INSERT INTO `china_region` VALUES (625531, 2, 530800000000, 530829000000, '665700', '0879', '西盟佤族自治县', '西盟佤族自治县', '云南,普洱,西', 'XiMengWaZuZiZhiXian', 99.590124, 22.644508);
INSERT INTO `china_region` VALUES (625578, 1, 530000000000, 530900000000, '677000', '0883', '临沧市', '临沧', '云南,临沧', 'LinCang', 100.079583, 23.877573);
INSERT INTO `china_region` VALUES (625579, 2, 530900000000, 530901000000, '677000', '0883', '市辖区', '临沧', '云南,临沧', 'LinCang', 100.079583, 23.877573);
INSERT INTO `china_region` VALUES (625580, 2, 530900000000, 530902000000, '677000', '0883', '临翔区', '临翔', '云南,临沧,临翔', 'LinXiang', 100.082523, 23.895137);
INSERT INTO `china_region` VALUES (625695, 2, 530900000000, 530921000000, '675900', '0883', '凤庆县', '凤庆', '云南,临沧,凤庆', 'FengQing', 99.92846, 24.580424);
INSERT INTO `china_region` VALUES (625896, 2, 530900000000, 530922000000, '675800', '0883', '云县', '云县', '云南,临沧,云县', 'YunXian', 100.123248, 24.437061);
INSERT INTO `china_region` VALUES (626107, 2, 530900000000, 530923000000, '677600', '0883', '永德县', '永德', '云南,临沧,永德', 'YongDe', 99.25934, 24.018357);
INSERT INTO `china_region` VALUES (626238, 2, 530900000000, 530924000000, '677700', '0883', '镇康县', '镇康', '云南,临沧,镇康', 'ZhenKang', 98.825285, 23.762584);
INSERT INTO `china_region` VALUES (626321, 2, 530900000000, 530925000000, '677300', '0883', '双江拉祜族佤族布朗族傣族自治县', '双江', '云南,临沧,双江', 'ShuangJiang', 99.827698, 23.473499);
INSERT INTO `china_region` VALUES (626404, 2, 530900000000, 530926000000, '677500', '0883', '耿马傣族佤族自治县', '耿马', '云南,临沧,耿马', 'GengMa', 99.397127, 23.538092);
INSERT INTO `china_region` VALUES (626509, 2, 530900000000, 530927000000, '677400', '0883', '沧源佤族自治县', '沧源', '云南,临沧,沧源', 'CangYuan', 99.246197, 23.146712);
INSERT INTO `china_region` VALUES (626616, 1, 530000000000, 532300000000, '675000', '0878', '楚雄彝族自治州', '楚雄', '云南,楚雄', 'ChuXiong', 101.528069, 25.045532);
INSERT INTO `china_region` VALUES (626617, 2, 532300000000, 532301000000, '675000', '0878', '楚雄市', '楚雄', '云南,楚雄', 'ChuXiong', 101.528069, 25.045532);
INSERT INTO `china_region` VALUES (626787, 2, 532300000000, 532322000000, '675100', '0878', '双柏县', '双柏', '云南,楚雄,双柏', 'ShuangBai', 101.641937, 24.688875);
INSERT INTO `china_region` VALUES (626881, 2, 532300000000, 532323000000, '675500', '0878', '牟定县', '牟定', '云南,楚雄,牟定', 'MouDing', 101.546566, 25.313122);
INSERT INTO `china_region` VALUES (626978, 2, 532300000000, 532324000000, '675200', '0878', '南华县', '南华', '云南,楚雄,南华', 'NanHua', 101.273577, 25.192293);
INSERT INTO `china_region` VALUES (627117, 2, 532300000000, 532325000000, '675300', '0878', '姚安县', '姚安', '云南,楚雄,姚安', 'YaoAn', 101.241728, 25.504173);
INSERT INTO `china_region` VALUES (627204, 2, 532300000000, 532326000000, '675400', '0878', '大姚县', '大姚', '云南,楚雄,大姚', 'DaYao', 101.336617, 25.729513);
INSERT INTO `china_region` VALUES (627346, 2, 532300000000, 532327000000, '651400', '0878', '永仁县', '永仁', '云南,楚雄,永仁', 'YongRen', 101.666133, 26.049464);
INSERT INTO `china_region` VALUES (627417, 2, 532300000000, 532328000000, '651300', '0878', '元谋县', '元谋', '云南,楚雄,元谋', 'YuanMou', 101.87452, 25.704338);
INSERT INTO `china_region` VALUES (627506, 2, 532300000000, 532329000000, '651600', '0878', '武定县', '武定', '云南,楚雄,武定', 'WuDing', 102.404338, 25.530389);
INSERT INTO `china_region` VALUES (627651, 2, 532300000000, 532331000000, '651200', '0878', '禄丰县', '禄丰', '云南,楚雄,禄丰', 'LuFeng', 102.079027, 25.150111);
INSERT INTO `china_region` VALUES (627831, 1, 530000000000, 532500000000, '661400', '0873', '红河哈尼族彝族自治州', '红河', '云南,红河', 'HongHe', 103.374799, 23.36313);
INSERT INTO `china_region` VALUES (627832, 2, 532500000000, 532501000000, '661000', '0873', '个旧市', '个旧', '云南,红河,个旧', 'GeJiu', 103.160034, 23.359121);
INSERT INTO `china_region` VALUES (627961, 2, 532500000000, 532502000000, '661600', '0873', '开远市', '开远', '云南,红河,开远', 'KaiYuan', 103.267143, 23.714316);
INSERT INTO `china_region` VALUES (628047, 2, 532500000000, 532503000000, '661100', '0873', '蒙自市', '蒙自', '云南,红河,蒙自', 'MengZi', 103.364905, 23.396201);
INSERT INTO `china_region` VALUES (628166, 2, 532500000000, 532504000000, '652300', '0873', '弥勒市', '弥勒', '云南,红河,弥勒', 'MiLe', 103.414874, 24.411912);
INSERT INTO `china_region` VALUES (628324, 2, 532500000000, 532523000000, '661200', '0873', '屏边苗族自治县', '屏边', '云南,红河,屏边', 'PingBian', 103.687612, 22.98356);
INSERT INTO `china_region` VALUES (628412, 2, 532500000000, 532524000000, '654300', '0873', '建水县', '建水', '云南,红河,建水', 'JianShui', 102.826557, 23.6347);
INSERT INTO `china_region` VALUES (628581, 2, 532500000000, 532525000000, '662200', '0873', '石屏县', '石屏', '云南,红河,石屏', 'ShiPing', 102.494984, 23.705936);
INSERT INTO `china_region` VALUES (628706, 2, 532500000000, 532527000000, '652400', '0873', '泸西县', '泸西', '云南,红河,泸西', 'LuXi', 103.766196, 24.532025);
INSERT INTO `china_region` VALUES (628802, 2, 532500000000, 532528000000, '662400', '0873', '元阳县', '元阳', '云南,红河,元阳', 'YuanYang', 102.835223, 23.219932);
INSERT INTO `china_region` VALUES (628955, 2, 532500000000, 532529000000, '654400', '0873', '红河县', '红河', '云南,红河', 'HongHe', 102.4206, 23.369161);
INSERT INTO `china_region` VALUES (629060, 2, 532500000000, 532530000000, '661500', '0873', '金平苗族瑶族傣族自治县', '金平', '云南,红河,金平', 'JinPing', 103.226448, 22.779543);
INSERT INTO `china_region` VALUES (629172, 2, 532500000000, 532531000000, '662500', '0873', '绿春县', '绿春', '云南,红河,绿春', 'LyuChun', 102.392463, 22.993718);
INSERT INTO `china_region` VALUES (629274, 2, 532500000000, 532532000000, '661300', '0873', '河口瑶族自治县', '河口', '云南,红河,河口', 'HeKou', 103.93935, 22.529404);
INSERT INTO `china_region` VALUES (629329, 1, 530000000000, 532600000000, '663000', '0876', '文山壮族苗族自治州', '文山', '云南,文山', 'WenShan', 104.216248, 23.400733);
INSERT INTO `china_region` VALUES (629330, 2, 532600000000, 532601000000, '663000', '0876', '文山市', '文山', '云南,文山', 'WenShan', 104.216248, 23.400733);
INSERT INTO `china_region` VALUES (629493, 2, 532600000000, 532622000000, '663100', '0876', '砚山县', '砚山', '云南,文山,砚山', 'YanShan', 104.337242, 23.605865);
INSERT INTO `china_region` VALUES (629612, 2, 532600000000, 532623000000, '663500', '0876', '西畴县', '西畴', '云南,文山,西畴', 'XiChou', 104.672597, 23.437782);
INSERT INTO `china_region` VALUES (629695, 2, 532600000000, 532624000000, '663600', '0876', '麻栗坡县', '麻栗坡', '云南,文山,麻栗坡', 'MaLiPo', 104.702799, 23.125714);
INSERT INTO `china_region` VALUES (629812, 2, 532600000000, 532625000000, '663700', '0876', '马关县', '马关', '云南,文山,马关', 'MaGuan', 104.394158, 23.012915);
INSERT INTO `china_region` VALUES (629954, 2, 532600000000, 532626000000, '663200', '0876', '丘北县', '丘北', '云南,文山,丘北', 'QiuBei', 104.19582, 24.041919);
INSERT INTO `china_region` VALUES (630068, 2, 532600000000, 532627000000, '663300', '0876', '广南县', '广南', '云南,文山,广南', 'GuangNan', 105.054981, 24.045941);
INSERT INTO `china_region` VALUES (630264, 2, 532600000000, 532628000000, '663400', '0876', '富宁县', '富宁', '云南,文山,富宁', 'FuNing', 105.630999, 23.625283);
INSERT INTO `china_region` VALUES (630423, 1, 530000000000, 532800000000, '666100', '0691', '西双版纳傣族自治州', '西双版纳', '云南,西双版纳', 'XiShuangBanNa', 100.797777, 22.007351);
INSERT INTO `china_region` VALUES (630424, 2, 532800000000, 532801000000, '666100', '0691', '景洪市', '景洪', '云南,西双版纳,景洪', 'JingHong', 100.771679, 22.000143);
INSERT INTO `china_region` VALUES (630560, 2, 532800000000, 532822000000, '666200', '0691', '勐海县', '勐海', '云南,西双版纳,勐海', 'MengHai', 100.452548, 21.957354);
INSERT INTO `china_region` VALUES (630666, 2, 532800000000, 532823000000, '666300', '0691', '勐腊县', '勐腊', '云南,西双版纳,勐腊', 'MengLa', 101.564636, 21.459233);
INSERT INTO `china_region` VALUES (630744, 1, 530000000000, 532900000000, '671000', '0872', '大理白族自治州', '大理', '云南,大理', 'DaLi', 100.267638, 25.606486);
INSERT INTO `china_region` VALUES (630745, 2, 532900000000, 532901000000, '671000', '0872', '大理市', '大理', '云南,大理', 'DaLi', 100.267638, 25.606486);
INSERT INTO `china_region` VALUES (630901, 2, 532900000000, 532922000000, '672500', '0872', '漾濞彝族自治县', '漾濞', '云南,大理,漾濞', 'YangBi', 99.958015, 25.670148);
INSERT INTO `china_region` VALUES (630977, 2, 532900000000, 532923000000, '672100', '0872', '祥云县', '祥云', '云南,大理,祥云', 'XiangYun', 100.550946, 25.48385);
INSERT INTO `china_region` VALUES (631127, 2, 532900000000, 532924000000, '671600', '0872', '宾川县', '宾川', '云南,大理,宾川', 'BinChuan', 100.575412, 25.827182);
INSERT INTO `china_region` VALUES (631228, 2, 532900000000, 532925000000, '675600', '0872', '弥渡县', '弥渡', '云南,大理,弥渡', 'MiDu', 100.490991, 25.343804);
INSERT INTO `china_region` VALUES (631326, 2, 532900000000, 532926000000, '675700', '0872', '南涧彝族自治县', '南涧', '云南,大理,南涧', 'NanJian', 100.509036, 25.04351);
INSERT INTO `china_region` VALUES (631416, 2, 532900000000, 532927000000, '672400', '0872', '巍山彝族回族自治县', '巍山', '云南,大理,巍山', 'WeiShan', 100.307175, 25.227212);
INSERT INTO `china_region` VALUES (631510, 2, 532900000000, 532928000000, '672600', '0872', '永平县', '永平', '云南,大理,永平', 'YongPing', 99.541236, 25.464681);
INSERT INTO `china_region` VALUES (631593, 2, 532900000000, 532929000000, '672700', '0872', '云龙县', '云龙', '云南,大理,云龙', 'YunLong', 99.371121, 25.885596);
INSERT INTO `china_region` VALUES (631691, 2, 532900000000, 532930000000, '671200', '0872', '洱源县', '洱源', '云南,大理,洱源', 'ErYuan', 99.951054, 26.11116);
INSERT INTO `china_region` VALUES (631791, 2, 532900000000, 532931000000, '671300', '0872', '剑川县', '剑川', '云南,大理,剑川', 'JianChuan', 99.905559, 26.537033);
INSERT INTO `china_region` VALUES (631893, 2, 532900000000, 532932000000, '671500', '0872', '鹤庆县', '鹤庆', '云南,大理,鹤庆', 'HeQing', 100.176498, 26.560231);
INSERT INTO `china_region` VALUES (632020, 1, 530000000000, 533100000000, '678400', '0692', '德宏傣族景颇族自治州', '德宏', '云南,德宏', 'DeHong', 98.584895, 24.433353);
INSERT INTO `china_region` VALUES (632021, 2, 533100000000, 533102000000, '678600', '0692', '瑞丽市', '瑞丽', '云南,德宏,瑞丽', 'RuiLi', 97.855477, 24.017836);
INSERT INTO `china_region` VALUES (632077, 2, 533100000000, 533103000000, '678499', '0692', '芒市', '芒市', '云南,德宏,芒市', 'MangShi', 98.588086, 24.43369);
INSERT INTO `china_region` VALUES (632194, 2, 533100000000, 533122000000, '679200', '0692', '梁河县', '梁河', '云南,德宏,梁河', 'LiangHe', 98.296657, 24.804232);
INSERT INTO `china_region` VALUES (632270, 2, 533100000000, 533123000000, '679300', '0692', '盈江县', '盈江', '云南,德宏,盈江', 'YingJiang', 97.943613, 24.691283);
INSERT INTO `china_region` VALUES (632395, 2, 533100000000, 533124000000, '678700', '0692', '陇川县', '陇川', '云南,德宏,陇川', 'LongChuan', 97.792105, 24.182965);
INSERT INTO `china_region` VALUES (632483, 1, 530000000000, 533300000000, '673100', '0886', '怒江傈僳族自治州', '怒江', '云南,怒江', 'NuJiang', 98.853097, 25.852547);
INSERT INTO `china_region` VALUES (632484, 2, 533300000000, 533301000000, '673200', '0886', '泸水市', '泸水', '云南,怒江,泸水', 'LuShui', 98.857977, 25.82288);
INSERT INTO `china_region` VALUES (632580, 2, 533300000000, 533323000000, '673400', '0886', '福贡县', '福贡', '云南,怒江,福贡', 'FuGong', 98.869132, 26.901832);
INSERT INTO `china_region` VALUES (632647, 2, 533300000000, 533324000000, '673500', '0886', '贡山独龙族怒族自治县', '贡山', '云南,怒江,贡山', 'GongShan', 98.665965, 27.740999);
INSERT INTO `china_region` VALUES (632681, 2, 533300000000, 533325000000, '671400', '0886', '兰坪白族普米族自治县', '兰坪', '云南,怒江,兰坪', 'LanPing', 99.416677, 26.453571);
INSERT INTO `china_region` VALUES (632804, 1, 530000000000, 533400000000, '674400', '0887', '迪庆藏族自治州', '迪庆', '云南,迪庆', 'DiQing', 99.702234, 27.818882);
INSERT INTO `china_region` VALUES (632805, 2, 533400000000, 533401000000, '674400', '0887', '香格里拉市', '香格里拉', '云南,迪庆,香格里拉', 'XiangGeLiLa', 99.700836, 27.829743);
INSERT INTO `china_region` VALUES (632881, 2, 533400000000, 533422000000, '674500', '0887', '德钦县', '德钦', '云南,迪庆,德钦', 'DeQin', 98.911561, 28.486162);
INSERT INTO `china_region` VALUES (632936, 2, 533400000000, 533423000000, '674600', '0887', '维西傈僳族自治县', '维西', '云南,迪庆,维西', 'WeiXi', 99.287173, 27.177162);
INSERT INTO `china_region` VALUES (633029, 0, 0, 540000000000, '0', NULL, '西藏自治区', '西藏', '西藏', 'XiZang', 91.117212, 29.646922);
INSERT INTO `china_region` VALUES (633030, 1, 540000000000, 540100000000, '850000', '0891', '拉萨市', '拉萨', '西藏,拉萨', 'LaSa', 91.140856, 29.645554);
INSERT INTO `china_region` VALUES (633031, 2, 540100000000, 540101000000, '850000', '0891', '市辖区', '拉萨', '西藏,拉萨', 'LaSa', 91.140856, 29.645554);
INSERT INTO `china_region` VALUES (633032, 2, 540100000000, 540102000000, '850000', '0891', '城关区', '城关', '西藏,拉萨,城关', 'ChengGuan', 91.140435, 29.654792);
INSERT INTO `china_region` VALUES (633097, 2, 540100000000, 540103000000, '851400', '0891', '堆龙德庆区', '堆龙德庆', '西藏,拉萨,堆龙德庆', 'DuiLongDeQing', 91.140856, 29.645554);
INSERT INTO `china_region` VALUES (633139, 2, 540100000000, 540104000000, '850100', '0891', '达孜区', '达孜', '西藏,拉萨,达孜', 'DaZi', 91.349867, 29.66941);
INSERT INTO `china_region` VALUES (633166, 2, 540100000000, 540121000000, '851600', '0891', '林周县', '林周', '西藏,拉萨,林周', 'LinZhou', 91.265288, 29.893545);
INSERT INTO `china_region` VALUES (633222, 2, 540100000000, 540122000000, '851500', '0891', '当雄县', '当雄', '西藏,拉萨,当雄', 'DangXiong', 91.101162, 30.473119);
INSERT INTO `china_region` VALUES (633260, 2, 540100000000, 540123000000, '851600', '0891', '尼木县', '尼木', '西藏,拉萨,尼木', 'NiMu', 90.164524, 29.431832);
INSERT INTO `china_region` VALUES (633302, 2, 540100000000, 540124000000, '850600', '0891', '曲水县', '曲水', '西藏,拉萨,曲水', 'QuShui', 90.743853, 29.353059);
INSERT INTO `china_region` VALUES (633328, 2, 540100000000, 540127000000, '850200', '0891', '墨竹工卡县', '墨竹工卡', '西藏,拉萨,墨竹工卡', 'MoZhuGongKa', 91.730866, 29.834132);
INSERT INTO `china_region` VALUES (633377, 2, 540100000000, 540171000000, '850000', '0891', '格尔木藏青工业园区', '格尔木藏青工业园', '西藏,拉萨,格尔木藏青工业园', 'GeErMuZangQingGongYeYuan', 91.140856, 29.645554);
INSERT INTO `china_region` VALUES (633380, 2, 540100000000, 540172000000, '851500', '0891', '拉萨经济技术开发区', '拉萨经开区', '西藏,拉萨,拉萨经开区', 'LaSaJingKaiQu', 91.023633, 29.644883);
INSERT INTO `china_region` VALUES (633383, 2, 540100000000, 540173000000, '850100', '0891', '西藏文化旅游创意园区', '西藏文化旅游创意园', '西藏,拉萨,文化旅游创意园', 'XiZangWenHuaLyuYouChuangYiYuan', 91.140856, 29.645554);
INSERT INTO `china_region` VALUES (633386, 2, 540100000000, 540174000000, '850117', '0891', '达孜工业园区', '达孜工业园', '西藏,拉萨,达孜工业园', 'DaZiGongYeYuan', 91.333133, 29.667394);
INSERT INTO `china_region` VALUES (633389, 1, 540000000000, 540200000000, '857000', '0892', '日喀则市', '日喀则', '西藏,日喀则', 'RiKaZe', 88.880583, 29.266869);
INSERT INTO `china_region` VALUES (633390, 2, 540200000000, 540202000000, '857061', '0892', '桑珠孜区', '桑珠孜', '西藏,日喀则,桑珠孜', 'SangZhuZi', 88.88727, 29.270389);
INSERT INTO `china_region` VALUES (633579, 2, 540200000000, 540221000000, '857100', '0892', '南木林县', '南木林', '西藏,日喀则,南木林', 'NanMuLin', 89.099243, 29.682331);
INSERT INTO `china_region` VALUES (633743, 2, 540200000000, 540222000000, '857400', '0892', '江孜县', '江孜', '西藏,日喀则,江孜', 'JiangZi', 89.605574, 28.911659);
INSERT INTO `china_region` VALUES (633918, 2, 540200000000, 540223000000, '858200', '0892', '定日县', '定日', '西藏,日喀则,定日', 'DingRi', 87.12612, 28.658743);
INSERT INTO `china_region` VALUES (634107, 2, 540200000000, 540224000000, '857800', '0892', '萨迦县', '萨迦', '西藏,日喀则,萨迦', 'SaJia', 88.021674, 28.899664);
INSERT INTO `china_region` VALUES (634226, 2, 540200000000, 540225000000, '858100', '0892', '拉孜县', '拉孜', '西藏,日喀则,拉孜', 'LaZi', 87.637041, 29.08166);
INSERT INTO `china_region` VALUES (634336, 2, 540200000000, 540226000000, '858500', '0892', '昂仁县', '昂仁', '西藏,日喀则,昂仁', 'AngRen', 87.236051, 29.294802);
INSERT INTO `china_region` VALUES (634539, 2, 540200000000, 540227000000, '858900', '0892', '谢通门县', '谢通门', '西藏,日喀则,谢通门', 'XieTongMen', 88.26162, 29.432641);
INSERT INTO `china_region` VALUES (634654, 2, 540200000000, 540228000000, '857300', '0892', '白朗县', '白朗', '西藏,日喀则,白朗', 'BaiLang', 89.097806, 28.814286);
INSERT INTO `china_region` VALUES (634777, 2, 540200000000, 540229000000, '857200', '0892', '仁布县', '仁布', '西藏,日喀则,仁布', 'RenBu', 89.841984, 29.230933);
INSERT INTO `china_region` VALUES (634860, 2, 540200000000, 540230000000, '857500', '0892', '康马县', '康马', '西藏,日喀则,康马', 'KangMa', 89.681663, 28.555627);
INSERT INTO `china_region` VALUES (634917, 2, 540200000000, 540231000000, '857900', '0892', '定结县', '定结', '西藏,日喀则,定结', 'DingJie', 87.765872, 28.364159);
INSERT INTO `china_region` VALUES (634998, 2, 540200000000, 540232000000, '858800', '0892', '仲巴县', '仲巴', '西藏,日喀则,仲巴', 'ZhongBa', 84.03153, 29.770279);
INSERT INTO `china_region` VALUES (635070, 2, 540200000000, 540233000000, '857600', '0892', '亚东县', '亚东', '西藏,日喀则,亚东', 'YaDong', 88.907094, 27.484806);
INSERT INTO `china_region` VALUES (635103, 2, 540200000000, 540234000000, '858700', '0892', '吉隆县', '吉隆', '西藏,日喀则,吉隆', 'JiLong', 85.297535, 28.852394);
INSERT INTO `china_region` VALUES (635151, 2, 540200000000, 540235000000, '858300', '0892', '聂拉木县', '聂拉木', '西藏,日喀则,聂拉木', 'NieLaMu', 85.982237, 28.155186);
INSERT INTO `china_region` VALUES (635203, 2, 540200000000, 540236000000, '858600', '0892', '萨嘎县', '萨嘎', '西藏,日喀则,萨嘎', 'SaGa', 85.232941, 29.328818);
INSERT INTO `china_region` VALUES (635250, 2, 540200000000, 540237000000, '857700', '0892', '岗巴县', '岗巴', '西藏,日喀则,岗巴', 'GangBa', 88.520031, 28.274601);
INSERT INTO `china_region` VALUES (635285, 1, 540000000000, 540300000000, '854000', '0895', '昌都市', '昌都', '西藏,昌都', 'ChangDu', 97.17202, 31.140969);
INSERT INTO `china_region` VALUES (635286, 2, 540300000000, 540302000000, '854078', '0895', '卡若区', '卡若', '西藏,昌都,卡若', 'KaRuo', 97.180437, 31.138507);
INSERT INTO `china_region` VALUES (635469, 2, 540300000000, 540321000000, '854100', '0895', '江达县', '江达', '西藏,昌都,江达', 'JiangDa', 98.21843, 31.499202);
INSERT INTO `china_region` VALUES (635578, 2, 540300000000, 540322000000, '854200', '0895', '贡觉县', '贡觉', '西藏,昌都,贡觉', 'GongJue', 98.27097, 30.860099);
INSERT INTO `china_region` VALUES (635740, 2, 540300000000, 540323000000, '855600', '0895', '类乌齐县', '类乌齐', '西藏,昌都,类乌齐', 'LeiWuQi', 96.600246, 31.211601);
INSERT INTO `china_region` VALUES (635833, 2, 540300000000, 540324000000, '855700', '0895', '丁青县', '丁青', '西藏,昌都,丁青', 'DingQing', 95.595761, 31.412405);
INSERT INTO `china_region` VALUES (635911, 2, 540300000000, 540325000000, '854300', '0895', '察雅县', '察雅', '西藏,昌都,察雅', 'ChaYa', 97.568752, 30.653943);
INSERT INTO `china_region` VALUES (636063, 2, 540300000000, 540326000000, '854600', '0895', '八宿县', '八宿', '西藏,昌都,八宿', 'BaSu', 96.917836, 30.053209);
INSERT INTO `china_region` VALUES (636188, 2, 540300000000, 540327000000, '854400', '0895', '左贡县', '左贡', '西藏,昌都,左贡', 'ZuoGong', 97.841022, 29.671069);
INSERT INTO `china_region` VALUES (636327, 2, 540300000000, 540328000000, '854500', '0895', '芒康县', '芒康', '西藏,昌都,芒康', 'MangKang', 98.593113, 29.679908);
INSERT INTO `china_region` VALUES (636405, 2, 540300000000, 540329000000, '855400', '0895', '洛隆县', '洛隆', '西藏,昌都,洛隆', 'LuoLong', 95.824567, 30.741571);
INSERT INTO `china_region` VALUES (636483, 2, 540300000000, 540330000000, '855500', '0895', '边坝县', '边坝', '西藏,昌都,边坝', 'BianBa', 94.7078, 30.933652);
INSERT INTO `china_region` VALUES (636577, 1, 540000000000, 540400000000, '860000', '0894', '林芝市', '林芝', '西藏,林芝', 'LinZhi', 94.36149, 29.649128);
INSERT INTO `china_region` VALUES (636578, 2, 540400000000, 540402000000, '860311', '0894', '巴宜区', '巴宜', '西藏,林芝,巴宜', 'BaYi', 94.360994, 29.653727);
INSERT INTO `china_region` VALUES (636659, 2, 540400000000, 540421000000, '850300', '0894', '工布江达县', '工布江达', '西藏,林芝,工布江达', 'GongBuJiangDa', 93.246077, 29.88528);
INSERT INTO `china_region` VALUES (636749, 2, 540400000000, 540422000000, '850500', '0894', '米林县', '米林', '西藏,林芝,米林', 'MiLin', 94.36149, 29.649128);
INSERT INTO `china_region` VALUES (636825, 2, 540400000000, 540423000000, '855300', '0894', '墨脱县', '墨脱', '西藏,林芝,墨脱', 'MoTuo', 95.332241, 29.325734);
INSERT INTO `china_region` VALUES (636880, 2, 540400000000, 540424000000, '850300', '0894', '波密县', '波密', '西藏,林芝,波密', 'BoMi', 95.768158, 29.858766);
INSERT INTO `china_region` VALUES (636976, 2, 540400000000, 540425000000, '855100', '0894', '察隅县', '察隅', '西藏,林芝,察隅', 'ChaYu', 97.465014, 28.660234);
INSERT INTO `china_region` VALUES (637080, 2, 540400000000, 540426000000, '856500', '0894', '朗县', '朗县', '西藏,林芝,朗县', 'LangXian', 93.074702, 29.046337);
INSERT INTO `china_region` VALUES (637139, 1, 540000000000, 540500000000, '856000', '0893', '山南市', '山南', '西藏,山南', 'ShanNan', 91.773134, 29.237137);
INSERT INTO `china_region` VALUES (637140, 2, 540500000000, 540501000000, '856000', '0893', '市辖区', '山南', '西藏,山南', 'ShanNan', 91.773134, 29.237137);
INSERT INTO `china_region` VALUES (637141, 2, 540500000000, 540502000000, '856100', '0893', '乃东区', '乃东', '西藏,山南,乃东', 'NaiDong', 91.761539, 29.224904);
INSERT INTO `china_region` VALUES (637201, 2, 540500000000, 540521000000, '850800', '0893', '扎囊县', '扎囊', '西藏,山南,扎囊', 'ZaNang', 91.33725, 29.245114);
INSERT INTO `china_region` VALUES (637269, 2, 540500000000, 540522000000, '850700', '0893', '贡嘎县', '贡嘎', '西藏,山南,贡嘎', 'GongGa', 90.98414, 29.289455);
INSERT INTO `china_region` VALUES (637321, 2, 540500000000, 540523000000, '856200', '0893', '桑日县', '桑日', '西藏,山南,桑日', 'SangRi', 92.015818, 29.259189);
INSERT INTO `china_region` VALUES (637369, 2, 540500000000, 540524000000, '856800', '0893', '琼结县', '琼结', '西藏,山南,琼结', 'QiongJie', 91.683881, 29.024625);
INSERT INTO `china_region` VALUES (637394, 2, 540500000000, 540525000000, '856300', '0893', '曲松县', '曲松', '西藏,山南,曲松', 'QuSong', 92.203739, 29.062826);
INSERT INTO `china_region` VALUES (637421, 2, 540500000000, 540526000000, '856900', '0893', '措美县', '措美', '西藏,山南,措美', 'CuoMei', 91.433509, 28.438202);
INSERT INTO `china_region` VALUES (637442, 2, 540500000000, 540527000000, '851200', '0893', '洛扎县', '洛扎', '西藏,山南,洛扎', 'LuoZha', 90.859992, 28.385713);
INSERT INTO `china_region` VALUES (637477, 2, 540500000000, 540528000000, '856400', '0893', '加查县', '加查', '西藏,山南,加查', 'JiaCha', 92.593993, 29.14029);
INSERT INTO `china_region` VALUES (637559, 2, 540500000000, 540529000000, '856600', '0893', '隆子县', '隆子', '西藏,山南,隆子', 'LongZi', 91.773134, 29.237137);
INSERT INTO `china_region` VALUES (637651, 2, 540500000000, 540530000000, '856700', '0893', '错那县', '错那', '西藏,山南,错那', 'CuoNa', 91.773134, 29.237137);
INSERT INTO `china_region` VALUES (637689, 2, 540500000000, 540531000000, '851100', '0893', '浪卡子县', '浪卡子', '西藏,山南,浪卡子', 'LangKaZi', 90.397977, 28.968031);
INSERT INTO `china_region` VALUES (637798, 1, 540000000000, 540600000000, '852000', NULL, '那曲市', '那曲', '西藏,那曲', 'NaQu', 91.117212, 29.646922);
INSERT INTO `china_region` VALUES (637799, 2, 540600000000, 540602000000, '853118', '0896', '色尼区', '色尼', '西藏,那曲,色尼', 'SeNi', 92.051239, 31.476202);
INSERT INTO `china_region` VALUES (637953, 2, 540600000000, 540621000000, '852400', '0896', '嘉黎县', '嘉黎', '西藏,那曲,嘉黎', 'JiaLi', 93.232528, 30.640815);
INSERT INTO `china_region` VALUES (638086, 2, 540600000000, 540622000000, '852300', '0896', '比如县', '比如', '西藏,那曲,比如', 'BiRu', 93.679639, 31.48025);
INSERT INTO `china_region` VALUES (638272, 2, 540600000000, 540623000000, '853500', '0896', '聂荣县', '聂荣', '西藏,那曲,聂荣', 'NieRong', 92.303346, 32.107772);
INSERT INTO `china_region` VALUES (638425, 2, 540600000000, 540624000000, '853400', '0896', '安多县', '安多', '西藏,那曲,安多', 'AnDuo', 91.68233, 32.265176);
INSERT INTO `china_region` VALUES (638513, 2, 540600000000, 540625000000, '853100', '0896', '申扎县', '申扎', '西藏,那曲,申扎', 'ShenZha', 88.709853, 30.930505);
INSERT INTO `china_region` VALUES (638584, 2, 540600000000, 540626000000, '852200', '0896', '索县', '索县', '西藏,那曲,索县', 'SuoXian', 93.785631, 31.886918);
INSERT INTO `china_region` VALUES (638719, 2, 540600000000, 540627000000, '852500', '0896', '班戈县', '班戈', '西藏,那曲,班戈', 'BanGe', 90.009957, 31.392411);
INSERT INTO `china_region` VALUES (638816, 2, 540600000000, 540628000000, '852100', '0896', '巴青县', '巴青', '西藏,那曲,巴青', 'BaQing', 94.053463, 31.918563);
INSERT INTO `china_region` VALUES (638983, 2, 540600000000, 540629000000, '852600', '0896', '尼玛县', '尼玛', '西藏,那曲,尼玛', 'NiMa', 87.236772, 31.784701);
INSERT INTO `china_region` VALUES (639075, 2, 540600000000, 540630000000, '853317', '0896', '双湖县', '双湖', '西藏,那曲,双湖', 'ShuangHu', 88.837642, 33.188515);
INSERT INTO `china_region` VALUES (639114, 1, 540000000000, 542500000000, '859000', '0897', '阿里地区', '阿里', '西藏,阿里', 'ALi', 80.105804, 32.501111);
INSERT INTO `china_region` VALUES (639115, 2, 542500000000, 542521000000, '859500', '0897', '普兰县', '普兰', '西藏,阿里,普兰', 'PuLan', 81.176237, 30.294402);
INSERT INTO `china_region` VALUES (639129, 2, 542500000000, 542522000000, '859600', '0897', '札达县', '札达', '西藏,阿里,札达', 'ZhaDa', 79.802706, 31.479217);
INSERT INTO `china_region` VALUES (639153, 2, 542500000000, 542523000000, '859001', '0897', '噶尔县', '噶尔', '西藏,阿里,噶尔', 'GaEr', 80.096419, 32.491488);
INSERT INTO `china_region` VALUES (639174, 2, 542500000000, 542524000000, '859700', '0897', '日土县', '日土', '西藏,阿里,日土', 'RiTu', 79.732427, 33.381359);
INSERT INTO `china_region` VALUES (639193, 2, 542500000000, 542525000000, '859100', '0897', '革吉县', '革吉', '西藏,阿里,革吉', 'GeJi', 81.145433, 32.387233);
INSERT INTO `china_region` VALUES (639219, 2, 542500000000, 542526000000, '859000', '0897', '改则县', '改则', '西藏,阿里,改则', 'GaiZe', 84.06259, 32.302713);
INSERT INTO `china_region` VALUES (639276, 2, 542500000000, 542527000000, '859300', '0897', '措勤县', '措勤', '西藏,阿里,措勤', 'CuoQin', 85.159494, 31.016769);
INSERT INTO `china_region` VALUES (639304, 0, 0, 610000000000, '0', NULL, '陕西省', '陕西', '陕西', 'ShanXi', 108.954239, 34.265472);
INSERT INTO `china_region` VALUES (639305, 1, 610000000000, 610100000000, '710000', '029', '西安市', '西安', '陕西,西安', 'XiAn', 108.940174, 34.341568);
INSERT INTO `china_region` VALUES (639306, 2, 610100000000, 610101000000, '710000', '029', '市辖区', '西安', '陕西,西安', 'XiAn', 108.940174, 34.341568);
INSERT INTO `china_region` VALUES (639307, 2, 610100000000, 610102000000, '710000', '029', '新城区', '新城', '陕西,西安,新城', 'XinCheng', 108.960747, 34.266451);
INSERT INTO `china_region` VALUES (639418, 2, 610100000000, 610103000000, '710000', '029', '碑林区', '碑林', '陕西,西安,碑林', 'BeiLin', 108.934235, 34.230769);
INSERT INTO `china_region` VALUES (639525, 2, 610100000000, 610104000000, '710000', '029', '莲湖区', '莲湖', '陕西,西安,莲湖', 'LianHu', 108.944041, 34.264995);
INSERT INTO `china_region` VALUES (639666, 2, 610100000000, 610111000000, '710000', '029', '灞桥区', '灞桥', '陕西,西安,灞桥', 'BaQiao', 109.064671, 34.273409);
INSERT INTO `china_region` VALUES (639858, 2, 610100000000, 610112000000, '710000', '029', '未央区', '未央', '陕西,西安,未央', 'WeiYang', 108.94685, 34.292873);
INSERT INTO `china_region` VALUES (640131, 2, 610100000000, 610113000000, '710000', '029', '雁塔区', '雁塔', '陕西,西安,雁塔', 'YanTa', 108.926593, 34.213389);
INSERT INTO `china_region` VALUES (640378, 2, 610100000000, 610114000000, '710000', '029', '阎良区', '阎良', '陕西,西安,阎良', 'YanLiang', 109.226102, 34.662234);
INSERT INTO `china_region` VALUES (640486, 2, 610100000000, 610115000000, '710000', '029', '临潼区', '临潼', '陕西,西安,临潼', 'LinTong', 109.214238, 34.367275);
INSERT INTO `china_region` VALUES (640779, 2, 610100000000, 610116000000, '710000', '029', '长安区', '长安', '陕西,西安,长安', 'ChangAn', 108.906917, 34.159016);
INSERT INTO `china_region` VALUES (641300, 2, 610100000000, 610117000000, '710200', '029', '高陵区', '高陵', '陕西,西安,高陵', 'GaoLing', 109.088297, 34.53483);
INSERT INTO `china_region` VALUES (641411, 2, 610100000000, 610118000000, '710000', '029', '鄠邑区', '鄠邑', '陕西,西安,鄠邑', 'HuYi', 108.605011, 34.108626);
INSERT INTO `china_region` VALUES (641707, 2, 610100000000, 610122000000, '710500', '029', '蓝田县', '蓝田', '陕西,西安,蓝田', 'LanTian', 109.323479, 34.151624);
INSERT INTO `china_region` VALUES (642075, 2, 610100000000, 610124000000, '710400', '029', '周至县', '周至', '陕西,西安,周至', 'ZhouZhi', 108.222154, 34.163621);
INSERT INTO `china_region` VALUES (642376, 1, 610000000000, 610200000000, '727000', '0919', '铜川市', '铜川', '陕西,铜川', 'TongChuan', 108.945233, 34.896756);
INSERT INTO `china_region` VALUES (642377, 2, 610200000000, 610201000000, '727000', '0919', '市辖区', '铜川', '陕西,铜川', 'TongChuan', 108.945233, 34.896756);
INSERT INTO `china_region` VALUES (642378, 2, 610200000000, 610202000000, '727000', '0919', '王益区', '王益', '陕西,铜川,王益', 'WangYi', 109.075578, 35.068964);
INSERT INTO `china_region` VALUES (642432, 2, 610200000000, 610203000000, '727000', '0919', '印台区', '印台', '陕西,铜川,印台', 'YinTai', 109.099975, 35.114492);
INSERT INTO `china_region` VALUES (642537, 2, 610200000000, 610204000000, '727100', '0919', '耀州区', '耀州', '陕西,铜川,耀州', 'YaoZhou', 108.980514, 34.908916);
INSERT INTO `china_region` VALUES (642722, 2, 610200000000, 610222000000, '727200', '0919', '宜君县', '宜君', '陕西,铜川,宜君', 'YiJun', 109.116932, 35.398577);
INSERT INTO `china_region` VALUES (642850, 1, 610000000000, 610300000000, '721000', '0917', '宝鸡市', '宝鸡', '陕西,宝鸡', 'BaoJi', 107.237974, 34.361979);
INSERT INTO `china_region` VALUES (642851, 2, 610300000000, 610301000000, '721000', '0917', '市辖区', '宝鸡', '陕西,宝鸡', 'BaoJi', 107.237974, 34.361979);
INSERT INTO `china_region` VALUES (642852, 2, 610300000000, 610302000000, '721000', '0917', '渭滨区', '渭滨', '陕西,宝鸡,渭滨', 'WeiBin', 107.149968, 34.371184);
INSERT INTO `china_region` VALUES (642989, 2, 610300000000, 610303000000, '721000', '0917', '金台区', '金台', '陕西,宝鸡,金台', 'JinTai', 107.146806, 34.376069);
INSERT INTO `china_region` VALUES (643125, 2, 610300000000, 610304000000, '721300', '0917', '陈仓区', '陈仓', '陕西,宝鸡,陈仓', 'ChenCang', 107.363567, 34.354701);
INSERT INTO `china_region` VALUES (643379, 2, 610300000000, 610322000000, '721400', '0917', '凤翔县', '凤翔', '陕西,宝鸡,凤翔', 'FengXiang', 107.400737, 34.521218);
INSERT INTO `china_region` VALUES (643558, 2, 610300000000, 610323000000, '722400', '0917', '岐山县', '岐山', '陕西,宝鸡,岐山', 'QiShan', 107.621054, 34.443459);
INSERT INTO `china_region` VALUES (643727, 2, 610300000000, 610324000000, '722200', '0917', '扶风县', '扶风', '陕西,宝鸡,扶风', 'FuFeng', 107.900219, 34.375411);
INSERT INTO `china_region` VALUES (643858, 2, 610300000000, 610326000000, '722300', '0917', '眉县', '眉县', '陕西,宝鸡,眉县', 'MeiXian', 107.749767, 34.274247);
INSERT INTO `china_region` VALUES (643968, 2, 610300000000, 610327000000, '721200', '0917', '陇县', '陇县', '陕西,宝鸡,陇县', 'LongXian', 106.864397, 34.89305);
INSERT INTO `china_region` VALUES (644086, 2, 610300000000, 610328000000, '721100', '0917', '千阳县', '千阳', '陕西,宝鸡,千阳', 'QianYang', 107.132442, 34.642381);
INSERT INTO `china_region` VALUES (644162, 2, 610300000000, 610329000000, '721500', '0917', '麟游县', '麟游', '陕西,宝鸡,麟游', 'LinYou', 107.793525, 34.677902);
INSERT INTO `china_region` VALUES (644240, 2, 610300000000, 610330000000, '721700', '0917', '凤县', '凤县', '陕西,宝鸡,凤县', 'FengXian', 106.515756, 33.908469);
INSERT INTO `china_region` VALUES (644324, 2, 610300000000, 610331000000, '721600', '0917', '太白县', '太白', '陕西,宝鸡,太白', 'TaiBai', 107.319116, 34.058401);
INSERT INTO `china_region` VALUES (644378, 1, 610000000000, 610400000000, '712000', '0910', '咸阳市', '咸阳', '陕西,咸阳', 'XianYang', 108.708991, 34.329605);
INSERT INTO `china_region` VALUES (644379, 2, 610400000000, 610401000000, '712000', '0910', '市辖区', '咸阳', '陕西,咸阳', 'XianYang', 108.708991, 34.329605);
INSERT INTO `china_region` VALUES (644380, 2, 610400000000, 610402000000, '712000', '0910', '秦都区', '秦都', '陕西,咸阳,秦都', 'QinDu', 108.706272, 34.329567);
INSERT INTO `china_region` VALUES (644575, 2, 610400000000, 610403000000, '712100', '0910', '杨陵区', '杨陵', '陕西,咸阳,杨陵', 'YangLing', 108.084732, 34.272117);
INSERT INTO `china_region` VALUES (644659, 2, 610400000000, 610404000000, '712000', '0910', '渭城区', '渭城', '陕西,咸阳,渭城', 'WeiCheng', 108.737213, 34.361988);
INSERT INTO `china_region` VALUES (644829, 2, 610400000000, 610422000000, '713800', '0910', '三原县', '三原', '陕西,咸阳,三原', 'SanYuan', 108.940509, 34.617382);
INSERT INTO `china_region` VALUES (644991, 2, 610400000000, 610423000000, '713700', '0910', '泾阳县', '泾阳', '陕西,咸阳,泾阳', 'JingYang', 108.842623, 34.527114);
INSERT INTO `china_region` VALUES (645227, 2, 610400000000, 610424000000, '713300', '0910', '乾县', '乾县', '陕西,咸阳,乾县', 'QianXian', 108.239473, 34.527551);
INSERT INTO `china_region` VALUES (645425, 2, 610400000000, 610425000000, '713200', '0910', '礼泉县', '礼泉', '陕西,咸阳,礼泉', 'LiQuan', 108.425018, 34.481764);
INSERT INTO `china_region` VALUES (645669, 2, 610400000000, 610426000000, '713400', '0910', '永寿县', '永寿', '陕西,咸阳,永寿', 'YongShou', 108.142311, 34.691979);
INSERT INTO `china_region` VALUES (645841, 2, 610400000000, 610428000000, '713600', '0910', '长武县', '长武', '陕西,咸阳,长武', 'ChangWu', 107.798757, 35.205886);
INSERT INTO `china_region` VALUES (645987, 2, 610400000000, 610429000000, '711300', '0910', '旬邑县', '旬邑', '陕西,咸阳,旬邑', 'XunYi', 108.333986, 35.111978);
INSERT INTO `china_region` VALUES (646123, 2, 610400000000, 610430000000, '711200', '0910', '淳化县', '淳化', '陕西,咸阳,淳化', 'ChunHua', 108.580681, 34.79925);
INSERT INTO `china_region` VALUES (646263, 2, 610400000000, 610431000000, '712200', '0910', '武功县', '武功', '陕西,咸阳,武功', 'WuGong', 108.200398, 34.260204);
INSERT INTO `china_region` VALUES (646461, 2, 610400000000, 610481000000, '713100', '0910', '兴平市', '兴平', '陕西,咸阳,兴平', 'XingPing', 108.490475, 34.299221);
INSERT INTO `china_region` VALUES (646675, 2, 610400000000, 610482000000, '713599', '0910', '彬州市', '彬州', '陕西,咸阳,彬州', 'BinZhou', 108.708991, 34.329605);
INSERT INTO `china_region` VALUES (646847, 1, 610000000000, 610500000000, '714000', '0913', '渭南市', '渭南', '陕西,渭南', 'WeiNan', 109.509786, 34.499995);
INSERT INTO `china_region` VALUES (646848, 2, 610500000000, 610501000000, '714000', '0913', '市辖区', '渭南', '陕西,渭南', 'WeiNan', 109.509786, 34.499995);
INSERT INTO `china_region` VALUES (646849, 2, 610500000000, 610502000000, '714000', '0913', '临渭区', '临渭', '陕西,渭南,临渭', 'LinWei', 109.492726, 34.498192);
INSERT INTO `china_region` VALUES (647276, 2, 610500000000, 610503000000, '714199', '0913', '华州区', '华州', '陕西,渭南,华州', 'HuaZhou', 109.761417, 34.511949);
INSERT INTO `china_region` VALUES (647437, 2, 610500000000, 610522000000, '714300', '0913', '潼关县', '潼关', '陕西,渭南,潼关', 'TongGuan', 110.24635, 34.544296);
INSERT INTO `china_region` VALUES (647471, 2, 610500000000, 610523000000, '715100', '0913', '大荔县', '大荔', '陕西,渭南,大荔', 'DaLi', 109.941658, 34.797184);
INSERT INTO `china_region` VALUES (647790, 2, 610500000000, 610524000000, '715300', '0913', '合阳县', '合阳', '陕西,渭南,合阳', 'HeYang', 110.149466, 35.237986);
INSERT INTO `china_region` VALUES (648023, 2, 610500000000, 610525000000, '715200', '0913', '澄城县', '澄城', '陕西,渭南,澄城', 'ChengCheng', 109.93235, 35.190245);
INSERT INTO `china_region` VALUES (648208, 2, 610500000000, 610526000000, '715500', '0913', '蒲城县', '蒲城', '陕西,渭南,蒲城', 'PuCheng', 109.586506, 34.955855);
INSERT INTO `china_region` VALUES (648518, 2, 610500000000, 610527000000, '715600', '0913', '白水县', '白水', '陕西,渭南,白水', 'BaiShui', 109.590671, 35.177452);
INSERT INTO `china_region` VALUES (648666, 2, 610500000000, 610528000000, '711700', '0913', '富平县', '富平', '陕西,渭南,富平', 'FuPing', 109.180331, 34.751086);
INSERT INTO `china_region` VALUES (648965, 2, 610500000000, 610581000000, '715400', '0913', '韩城市', '韩城', '陕西,渭南,韩城', 'HanCheng', 110.442847, 35.476788);
INSERT INTO `china_region` VALUES (649179, 2, 610500000000, 610582000000, '714200', '0913', '华阴市', '华阴', '陕西,渭南,华阴', 'HuaYin', 110.092301, 34.566096);
INSERT INTO `china_region` VALUES (649323, 1, 610000000000, 610600000000, '716000', '0911', '延安市', '延安', '陕西,延安', 'YanAn', 109.489727, 36.585455);
INSERT INTO `china_region` VALUES (649324, 2, 610600000000, 610601000000, '716000', '0911', '市辖区', '延安', '陕西,延安', 'YanAn', 109.489727, 36.585455);
INSERT INTO `china_region` VALUES (649325, 2, 610600000000, 610602000000, '716000', '0911', '宝塔区', '宝塔', '陕西,延安,宝塔', 'BaoTa', 109.493106, 36.591266);
INSERT INTO `china_region` VALUES (649714, 2, 610600000000, 610603000000, '717499', '0911', '安塞区', '安塞', '陕西,延安,安塞', 'AnSai', 109.328842, 36.863854);
INSERT INTO `china_region` VALUES (649855, 2, 610600000000, 610621000000, '717100', '0911', '延长县', '延长', '陕西,延安,延长', 'YanChang', 110.012334, 36.579313);
INSERT INTO `china_region` VALUES (650032, 2, 610600000000, 610622000000, '717200', '0911', '延川县', '延川', '陕西,延安,延川', 'YanChuan', 110.193514, 36.878117);
INSERT INTO `china_region` VALUES (650218, 2, 610600000000, 610625000000, '717500', '0911', '志丹县', '志丹', '陕西,延安,志丹', 'ZhiDan', 108.768432, 36.822194);
INSERT INTO `china_region` VALUES (650341, 2, 610600000000, 610626000000, '717600', '0911', '吴起县', '吴起', '陕西,延安,吴起', 'WuQi', 108.175933, 36.927216);
INSERT INTO `china_region` VALUES (650445, 2, 610600000000, 610627000000, '716100', '0911', '甘泉县', '甘泉', '陕西,延安,甘泉', 'GanQuan', 109.35102, 36.276526);
INSERT INTO `china_region` VALUES (650523, 2, 610600000000, 610628000000, '727500', '0911', '富县', '富县', '陕西,延安,富县', 'FuXian', 109.379711, 35.98801);
INSERT INTO `china_region` VALUES (650669, 2, 610600000000, 610629000000, '727400', '0911', '洛川县', '洛川', '陕西,延安,洛川', 'LuoChuan', 109.432369, 35.761975);
INSERT INTO `china_region` VALUES (650882, 2, 610600000000, 610630000000, '716200', '0911', '宜川县', '宜川', '陕西,延安,宜川', 'YiChuan', 110.168963, 36.050178);
INSERT INTO `china_region` VALUES (651007, 2, 610600000000, 610631000000, '715700', '0911', '黄龙县', '黄龙', '陕西,延安,黄龙', 'HuangLong', 109.840373, 35.584467);
INSERT INTO `china_region` VALUES (651065, 2, 610600000000, 610632000000, '727300', '0911', '黄陵县', '黄陵', '陕西,延安,黄陵', 'HuangLing', 109.262961, 35.579428);
INSERT INTO `china_region` VALUES (651186, 2, 610600000000, 610681000000, '717300', '0911', '子长市', '子长', '陕西,延安,子长', 'ZiChang', 109.675234, 37.142668);
INSERT INTO `china_region` VALUES (651393, 1, 610000000000, 610700000000, '723000', '0916', '汉中市', '汉中', '陕西,汉中', 'HanZhong', 107.023323, 33.06748);
INSERT INTO `china_region` VALUES (651394, 2, 610700000000, 610701000000, '723000', '0916', '市辖区', '汉中', '陕西,汉中', 'HanZhong', 107.023323, 33.06748);
INSERT INTO `china_region` VALUES (651395, 2, 610700000000, 610702000000, '723000', '0916', '汉台区', '汉台', '陕西,汉中,汉台', 'HanTai', 107.031856, 33.067771);
INSERT INTO `china_region` VALUES (651633, 2, 610700000000, 610703000000, '723100', '0916', '南郑区', '南郑', '陕西,汉中,南郑', 'NanZheng', 106.93623, 32.999334);
INSERT INTO `china_region` VALUES (651969, 2, 610700000000, 610722000000, '723200', '0916', '城固县', '城固', '陕西,汉中,城固', 'ChengGu', 107.33393, 33.157131);
INSERT INTO `china_region` VALUES (652260, 2, 610700000000, 610723000000, '723300', '0916', '洋县', '洋县', '陕西,汉中,洋县', 'YangXian', 107.545837, 33.222739);
INSERT INTO `china_region` VALUES (652566, 2, 610700000000, 610724000000, '723500', '0916', '西乡县', '西乡', '陕西,汉中,西乡', 'XiXiang', 107.766614, 32.983101);
INSERT INTO `china_region` VALUES (652799, 2, 610700000000, 610725000000, '724200', '0916', '勉县', '勉县', '陕西,汉中,勉县', 'MianXian', 106.673221, 33.153553);
INSERT INTO `china_region` VALUES (653016, 2, 610700000000, 610726000000, '724400', '0916', '宁强县', '宁强', '陕西,汉中,宁强', 'NingQiang', 106.257171, 32.829694);
INSERT INTO `china_region` VALUES (653248, 2, 610700000000, 610727000000, '724300', '0916', '略阳县', '略阳', '陕西,汉中,略阳', 'LueYang', 106.156718, 33.327281);
INSERT INTO `china_region` VALUES (653431, 2, 610700000000, 610728000000, '723600', '0916', '镇巴县', '镇巴', '陕西,汉中,镇巴', 'ZhenBa', 107.895035, 32.536704);
INSERT INTO `china_region` VALUES (653633, 2, 610700000000, 610729000000, '724100', '0916', '留坝县', '留坝', '陕西,汉中,留坝', 'LiuBa', 106.920808, 33.617571);
INSERT INTO `china_region` VALUES (653718, 2, 610700000000, 610730000000, '723400', '0916', '佛坪县', '佛坪', '陕西,汉中,佛坪', 'FoPing', 107.990539, 33.524359);
INSERT INTO `china_region` VALUES (653771, 1, 610000000000, 610800000000, '719000', '0912', '榆林市', '榆林', '陕西,榆林', 'YuLin', 109.734589, 38.28539);
INSERT INTO `china_region` VALUES (653772, 2, 610800000000, 610801000000, '719000', '0912', '市辖区', '榆林', '陕西,榆林', 'YuLin', 109.734589, 38.28539);
INSERT INTO `china_region` VALUES (653773, 2, 610800000000, 610802000000, '719000', '0912', '榆阳区', '榆阳', '陕西,榆林,榆阳', 'YuYang', 109.720309, 38.277029);
INSERT INTO `china_region` VALUES (654197, 2, 610800000000, 610803000000, '719200', '0912', '横山区', '横山', '陕西,榆林,横山', 'HengShan', 109.294346, 37.962209);
INSERT INTO `china_region` VALUES (654595, 2, 610800000000, 610822000000, '719400', '0912', '府谷县', '府谷', '陕西,榆林,府谷', 'FuGu', 111.067366, 39.028116);
INSERT INTO `china_region` VALUES (654797, 2, 610800000000, 610824000000, '718500', '0912', '靖边县', '靖边', '陕西,榆林,靖边', 'JingBian', 108.793988, 37.599438);
INSERT INTO `china_region` VALUES (655017, 2, 610800000000, 610825000000, '718600', '0912', '定边县', '定边', '陕西,榆林,定边', 'DingBian', 107.601267, 37.594612);
INSERT INTO `china_region` VALUES (655234, 2, 610800000000, 610826000000, '718000', '0912', '绥德县', '绥德', '陕西,榆林,绥德', 'SuiDe', 110.263362, 37.50294);
INSERT INTO `china_region` VALUES (655597, 2, 610800000000, 610827000000, '718100', '0912', '米脂县', '米脂', '陕西,榆林,米脂', 'MiZhi', 110.183754, 37.755417);
INSERT INTO `china_region` VALUES (655818, 2, 610800000000, 610828000000, '719200', '0912', '佳县', '佳县', '陕西,榆林,佳县', 'JiaXian', 110.491345, 38.019511);
INSERT INTO `china_region` VALUES (656165, 2, 610800000000, 610829000000, '718200', '0912', '吴堡县', '吴堡', '陕西,榆林,吴堡', 'WuBao', 110.739673, 37.452068);
INSERT INTO `china_region` VALUES (656275, 2, 610800000000, 610830000000, '718300', '0912', '清涧县', '清涧', '陕西,榆林,清涧', 'QingJian', 110.121209, 37.088878);
INSERT INTO `china_region` VALUES (656620, 2, 610800000000, 610831000000, '718400', '0912', '子洲县', '子洲', '陕西,榆林,子洲', 'ZiZhou', 110.03525, 37.610683);
INSERT INTO `china_region` VALUES (656913, 2, 610800000000, 610881000000, '719300', '0912', '神木市', '神木', '陕西,榆林,神木', 'ShenMu', 110.498868, 38.842498);
INSERT INTO `china_region` VALUES (657298, 1, 610000000000, 610900000000, '725000', '0915', '安康市', '安康', '陕西,安康', 'AnKang', 109.029022, 32.684714);
INSERT INTO `china_region` VALUES (657299, 2, 610900000000, 610901000000, '725000', '0915', '市辖区', '安康', '陕西,安康', 'AnKang', 109.029022, 32.684714);
INSERT INTO `china_region` VALUES (657300, 2, 610900000000, 610902000000, '725000', '0915', '汉滨区', '汉滨', '陕西,安康,汉滨', 'HanBin', 109.026836, 32.695173);
INSERT INTO `china_region` VALUES (657854, 2, 610900000000, 610921000000, '725100', '0915', '汉阴县', '汉阴', '陕西,安康,汉阴', 'HanYin', 108.508745, 32.893026);
INSERT INTO `china_region` VALUES (658015, 2, 610900000000, 610922000000, '725200', '0915', '石泉县', '石泉', '陕西,安康,石泉', 'ShiQuan', 108.247887, 33.038408);
INSERT INTO `china_region` VALUES (658188, 2, 610900000000, 610923000000, '711600', '0915', '宁陕县', '宁陕', '陕西,安康,宁陕', 'NingShan', 108.314283, 33.310527);
INSERT INTO `china_region` VALUES (658280, 2, 610900000000, 610924000000, '725300', '0915', '紫阳县', '紫阳', '陕西,安康,紫阳', 'ZiYang', 108.534229, 32.520246);
INSERT INTO `china_region` VALUES (658495, 2, 610900000000, 610925000000, '725400', '0915', '岚皋县', '岚皋', '陕西,安康,岚皋', 'LanGao', 108.902049, 32.307001);
INSERT INTO `china_region` VALUES (658644, 2, 610900000000, 610926000000, '725500', '0915', '平利县', '平利', '陕西,安康,平利', 'PingLi', 109.361864, 32.388854);
INSERT INTO `china_region` VALUES (658801, 2, 610900000000, 610927000000, '725600', '0915', '镇坪县', '镇坪', '陕西,安康,镇坪', 'ZhenPing', 109.526873, 31.883672);
INSERT INTO `china_region` VALUES (658871, 2, 610900000000, 610928000000, '725700', '0915', '旬阳县', '旬阳', '陕西,安康,旬阳', 'XunYang', 109.365265, 32.834086);
INSERT INTO `china_region` VALUES (659199, 2, 610900000000, 610929000000, '725800', '0915', '白河县', '白河', '陕西,安康,白河', 'BaiHe', 110.112629, 32.809026);
INSERT INTO `china_region` VALUES (659332, 1, 610000000000, 611000000000, '726000', '0914', '商洛市', '商洛', '陕西,商洛', 'ShangLuo', 109.940477, 33.870422);
INSERT INTO `china_region` VALUES (659333, 2, 611000000000, 611001000000, '726000', '0914', '市辖区', '商洛', '陕西,商洛', 'ShangLuo', 109.940477, 33.870422);
INSERT INTO `china_region` VALUES (659334, 2, 611000000000, 611002000000, '726000', '0914', '商州区', '商州', '陕西,商洛,商州', 'ShangZhou', 109.941241, 33.862703);
INSERT INTO `china_region` VALUES (659655, 2, 611000000000, 611021000000, '726100', '0914', '洛南县', '洛南', '陕西,商洛,洛南', 'LuoNan', 110.148509, 34.090838);
INSERT INTO `china_region` VALUES (659916, 2, 611000000000, 611022000000, '726200', '0914', '丹凤县', '丹凤', '陕西,商洛,丹凤', 'DanFeng', 110.331676, 33.698185);
INSERT INTO `china_region` VALUES (660084, 2, 611000000000, 611023000000, '726300', '0914', '商南县', '商南', '陕西,商洛,商南', 'ShangNan', 110.881807, 33.530995);
INSERT INTO `china_region` VALUES (660221, 2, 611000000000, 611024000000, '726400', '0914', '山阳县', '山阳', '陕西,商洛,山阳', 'ShanYang', 109.88229, 33.532172);
INSERT INTO `china_region` VALUES (660479, 2, 611000000000, 611025000000, '711500', '0914', '镇安县', '镇安', '陕西,商洛,镇安', 'ZhenAn', 109.152893, 33.423357);
INSERT INTO `china_region` VALUES (660655, 2, 611000000000, 611026000000, '711400', '0914', '柞水县', '柞水', '陕西,商洛,柞水', 'ZhaShui', 109.114207, 33.68611);
INSERT INTO `china_region` VALUES (660747, 0, 0, 620000000000, '0', NULL, '甘肃省', '甘肃', '甘肃', 'GanSu', 103.826308, 36.059421);
INSERT INTO `china_region` VALUES (660748, 1, 620000000000, 620100000000, '730000', '0931', '兰州市', '兰州', '甘肃,兰州', 'LanZhou', 103.834303, 36.061089);
INSERT INTO `china_region` VALUES (660749, 2, 620100000000, 620101000000, '730000', '0931', '市辖区', '兰州', '甘肃,兰州', 'LanZhou', 103.834303, 36.061089);
INSERT INTO `china_region` VALUES (660750, 2, 620100000000, 620102000000, '730030', '0931', '城关区', '城关', '甘肃,兰州,城关', 'ChengGuan', 103.825255, 36.057054);
INSERT INTO `china_region` VALUES (660955, 2, 620100000000, 620103000000, '730050', '0931', '七里河区', '七里河', '甘肃,兰州,七里河', 'QiLiHe', 103.785866, 36.065915);
INSERT INTO `china_region` VALUES (661108, 2, 620100000000, 620104000000, '730060', '0931', '西固区', '西固', '甘肃,兰州,西固', 'XiGu', 103.627964, 36.088431);
INSERT INTO `china_region` VALUES (661233, 2, 620100000000, 620105000000, '730070', '0931', '安宁区', '安宁', '甘肃,兰州,安宁', 'AnNing', 103.71909, 36.103927);
INSERT INTO `china_region` VALUES (661302, 2, 620100000000, 620111000000, '730080', '0931', '红古区', '红古', '甘肃,兰州,红古', 'HongGu', 102.859323, 36.345669);
INSERT INTO `china_region` VALUES (661367, 2, 620100000000, 620121000000, '730300', '0931', '永登县', '永登', '甘肃,兰州,永登', 'YongDeng', 103.26038, 36.736513);
INSERT INTO `china_region` VALUES (661594, 2, 620100000000, 620122000000, '730200', '0931', '皋兰县', '皋兰', '甘肃,兰州,皋兰', 'GaoLan', 103.947377, 36.332663);
INSERT INTO `china_region` VALUES (661663, 2, 620100000000, 620123000000, '730100', '0931', '榆中县', '榆中', '甘肃,兰州,榆中', 'YuZhong', 104.112527, 35.843056);
INSERT INTO `china_region` VALUES (661956, 2, 620100000000, 620171000000, '730000', '0931', '兰州新区', '兰州', '甘肃,兰州', 'LanZhou', 103.834303, 36.061089);
INSERT INTO `china_region` VALUES (662016, 1, 620000000000, 620200000000, '735100', '1937', '嘉峪关市', '嘉峪关', '甘肃,嘉峪关', 'JiaYuGuan', 98.289152, 39.77313);
INSERT INTO `china_region` VALUES (662017, 2, 620200000000, 620201000000, '735100', '1937', '市辖区', '嘉峪关', '甘肃,嘉峪关', 'JiaYuGuan', 98.289152, 39.77313);
INSERT INTO `china_region` VALUES (662071, 1, 620000000000, 620300000000, '737100', '0935', '金昌市', '金昌', '甘肃,金昌', 'JinChang', 102.188043, 38.520089);
INSERT INTO `china_region` VALUES (662072, 2, 620300000000, 620301000000, '737100', '0935', '市辖区', '金昌', '甘肃,金昌', 'JinChang', 102.188043, 38.520089);
INSERT INTO `china_region` VALUES (662073, 2, 620300000000, 620302000000, '737100', '0935', '金川区', '金川', '甘肃,金昌,金川', 'JinChuan', 102.194089, 38.521085);
INSERT INTO `china_region` VALUES (662125, 2, 620300000000, 620321000000, '737200', '0935', '永昌县', '永昌', '甘肃,金昌,永昌', 'YongChang', 101.984649, 38.24317);
INSERT INTO `china_region` VALUES (662265, 1, 620000000000, 620400000000, '730900', '0943', '白银市', '白银', '甘肃,白银', 'BaiYin', 104.138559, 36.544756);
INSERT INTO `china_region` VALUES (662266, 2, 620400000000, 620401000000, '730900', '0943', '市辖区', '白银', '甘肃,白银', 'BaiYin', 104.138559, 36.544756);
INSERT INTO `china_region` VALUES (662267, 2, 620400000000, 620402000000, '730900', '0943', '白银区', '白银', '甘肃,白银', 'BaiYin', 104.148556, 36.535398);
INSERT INTO `china_region` VALUES (662362, 2, 620400000000, 620403000000, '730900', '0943', '平川区', '平川', '甘肃,白银,平川', 'PingChuan', 104.825208, 36.728304);
INSERT INTO `china_region` VALUES (662465, 2, 620400000000, 620421000000, '730600', '0943', '靖远县', '靖远', '甘肃,白银,靖远', 'JingYuan', 104.676774, 36.571366);
INSERT INTO `china_region` VALUES (662671, 2, 620400000000, 620422000000, '730700', '0943', '会宁县', '会宁', '甘肃,白银,会宁', 'HuiNing', 105.053358, 35.692823);
INSERT INTO `china_region` VALUES (663017, 2, 620400000000, 620423000000, '730400', '0943', '景泰县', '景泰', '甘肃,白银,景泰', 'JingTai', 104.063091, 37.183804);
INSERT INTO `china_region` VALUES (663173, 1, 620000000000, 620500000000, '741000', '0938', '天水市', '天水', '甘肃,天水', 'TianShui', 105.724947, 34.580863);
INSERT INTO `china_region` VALUES (663174, 2, 620500000000, 620501000000, '741000', '0938', '市辖区', '天水', '甘肃,天水', 'TianShui', 105.724947, 34.580863);
INSERT INTO `china_region` VALUES (663175, 2, 620500000000, 620502000000, '741000', '0938', '秦州区', '秦州', '甘肃,天水,秦州', 'QinZhou', 105.724199, 34.580892);
INSERT INTO `china_region` VALUES (663666, 2, 620500000000, 620503000000, '741020', '0938', '麦积区', '麦积', '甘肃,天水,麦积', 'MaiJi', 105.889557, 34.570384);
INSERT INTO `china_region` VALUES (664113, 2, 620500000000, 620521000000, '741400', '0938', '清水县', '清水', '甘肃,天水,清水', 'QingShui', 106.137293, 34.749865);
INSERT INTO `china_region` VALUES (664401, 2, 620500000000, 620522000000, '741600', '0938', '秦安县', '秦安', '甘肃,天水,秦安', 'QinAn', 105.674983, 34.858916);
INSERT INTO `china_region` VALUES (664855, 2, 620500000000, 620523000000, '741200', '0938', '甘谷县', '甘谷', '甘肃,天水,甘谷', 'GanGu', 105.340864, 34.745465);
INSERT INTO `china_region` VALUES (665286, 2, 620500000000, 620524000000, '741300', '0938', '武山县', '武山', '甘肃,天水,武山', 'WuShan', 104.890782, 34.72138);
INSERT INTO `china_region` VALUES (665656, 2, 620500000000, 620525000000, '741500', '0938', '张家川回族自治县', '张家川', '甘肃,天水,张家川', 'ZhangJiaChuan', 106.204518, 34.988037);
INSERT INTO `china_region` VALUES (665933, 1, 620000000000, 620600000000, '733000', '1935', '武威市', '武威', '甘肃,武威', 'WuWei', 102.638011, 37.928264);
INSERT INTO `china_region` VALUES (665934, 2, 620600000000, 620601000000, '733000', '1935', '市辖区', '武威', '甘肃,武威', 'WuWei', 102.638011, 37.928264);
INSERT INTO `china_region` VALUES (665935, 2, 620600000000, 620602000000, '733000', '1935', '凉州区', '凉州', '甘肃,武威,凉州', 'LiangZhou', 102.72989, 37.820619);
INSERT INTO `china_region` VALUES (666526, 2, 620600000000, 620621000000, '733300', '1935', '民勤县', '民勤', '甘肃,武威,民勤', 'MinQin', 103.093792, 38.62435);
INSERT INTO `china_region` VALUES (666837, 2, 620600000000, 620622000000, '733100', '1935', '古浪县', '古浪', '甘肃,武威,古浪', 'GuLang', 102.897533, 37.47012);
INSERT INTO `china_region` VALUES (667108, 2, 620600000000, 620623000000, '733200', '1935', '天祝藏族自治县', '天祝', '甘肃,武威,天祝', 'TianZhu', 103.141757, 36.97174);
INSERT INTO `china_region` VALUES (667336, 1, 620000000000, 620700000000, '734000', '0936', '张掖市', '张掖', '甘肃,张掖', 'ZhangYe', 100.449818, 38.925875);
INSERT INTO `china_region` VALUES (667337, 2, 620700000000, 620701000000, '734000', '0936', '市辖区', '张掖', '甘肃,张掖', 'ZhangYe', 100.449818, 38.925875);
INSERT INTO `china_region` VALUES (667338, 2, 620700000000, 620702000000, '734000', '0936', '甘州区', '甘州', '甘肃,张掖,甘州', 'GanZhou', 100.478058, 38.929763);
INSERT INTO `china_region` VALUES (667629, 2, 620700000000, 620721000000, '734400', '0936', '肃南裕固族自治县', '肃南', '甘肃,张掖,肃南', 'SuNan', 99.615601, 38.836932);
INSERT INTO `china_region` VALUES (667747, 2, 620700000000, 620722000000, '734500', '0936', '民乐县', '民乐', '甘肃,张掖,民乐', 'MinYue', 100.81286, 38.430794);
INSERT INTO `china_region` VALUES (667938, 2, 620700000000, 620723000000, '734200', '0936', '临泽县', '临泽', '甘肃,张掖,临泽', 'LinZe', 100.164445, 39.152642);
INSERT INTO `china_region` VALUES (668034, 2, 620700000000, 620724000000, '734300', '0936', '高台县', '高台', '甘肃,张掖,高台', 'GaoTai', 99.819317, 39.377733);
INSERT INTO `china_region` VALUES (668191, 2, 620700000000, 620725000000, '734100', '0936', '山丹县', '山丹', '甘肃,张掖,山丹', 'ShanDan', 101.088575, 38.784758);
INSERT INTO `china_region` VALUES (668325, 1, 620000000000, 620800000000, '744000', '0933', '平凉市', '平凉', '甘肃,平凉', 'PingLiang', 106.66524, 35.543051);
INSERT INTO `china_region` VALUES (668326, 2, 620800000000, 620801000000, '744000', '0933', '市辖区', '平凉', '甘肃,平凉', 'PingLiang', 106.66524, 35.543051);
INSERT INTO `china_region` VALUES (668327, 2, 620800000000, 620802000000, '744000', '0933', '崆峒区', '崆峒', '甘肃,平凉,崆峒', 'KongTong', 106.674767, 35.542491);
INSERT INTO `china_region` VALUES (668623, 2, 620800000000, 620821000000, '744300', '0933', '泾川县', '泾川', '甘肃,平凉,泾川', 'JingChuan', 107.36785, 35.332666);
INSERT INTO `china_region` VALUES (668864, 2, 620800000000, 620822000000, '744400', '0933', '灵台县', '灵台', '甘肃,平凉,灵台', 'LingTai', 107.621124, 35.065399);
INSERT INTO `china_region` VALUES (669073, 2, 620800000000, 620823000000, '744200', '0933', '崇信县', '崇信', '甘肃,平凉,崇信', 'ChongXin', 107.035409, 35.302123);
INSERT INTO `china_region` VALUES (669167, 2, 620800000000, 620825000000, '744600', '0933', '庄浪县', '庄浪', '甘肃,平凉,庄浪', 'ZhuangLang', 106.036687, 35.202385);
INSERT INTO `china_region` VALUES (669485, 2, 620800000000, 620826000000, '743400', '0933', '静宁县', '静宁', '甘肃,平凉,静宁', 'JingNing', 105.732556, 35.521977);
INSERT INTO `china_region` VALUES (669851, 2, 620800000000, 620881000000, '744100', '0933', '华亭市', '华亭', '甘肃,平凉,华亭', 'HuaTing', 106.653158, 35.218292);
INSERT INTO `china_region` VALUES (669991, 1, 620000000000, 620900000000, '735000', '0937', '酒泉市', '酒泉', '甘肃,酒泉', 'JiuQuan', 98.494483, 39.73241);
INSERT INTO `china_region` VALUES (669992, 2, 620900000000, 620901000000, '735000', '0937', '市辖区', '酒泉', '甘肃,酒泉', 'JiuQuan', 98.494483, 39.73241);
INSERT INTO `china_region` VALUES (669993, 2, 620900000000, 620902000000, '735000', '0937', '肃州区', '肃州', '甘肃,酒泉,肃州', 'SuZhou', 98.50785, 39.745071);
INSERT INTO `china_region` VALUES (670165, 2, 620900000000, 620921000000, '735300', '0937', '金塔县', '金塔', '甘肃,酒泉,金塔', 'JinTa', 98.90327, 39.983599);
INSERT INTO `china_region` VALUES (670277, 2, 620900000000, 620922000000, '736100', '0937', '瓜州县', '瓜州', '甘肃,酒泉,瓜州', 'GuaZhou', 95.782306, 40.520545);
INSERT INTO `china_region` VALUES (670382, 2, 620900000000, 620923000000, '736300', '0937', '肃北蒙古族自治县', '肃北', '甘肃,酒泉,肃北', 'SuBei', 94.876579, 39.51245);
INSERT INTO `china_region` VALUES (670415, 2, 620900000000, 620924000000, '736400', '0937', '阿克塞哈萨克族自治县', '阿克塞', '甘肃,酒泉,阿克塞', 'AKeSai', 94.340204, 39.633943);
INSERT INTO `china_region` VALUES (670437, 2, 620900000000, 620981000000, '735200', '0937', '玉门市', '玉门', '甘肃,酒泉,玉门', 'YuMen', 98.494483, 39.73241);
INSERT INTO `china_region` VALUES (670539, 2, 620900000000, 620982000000, '736200', '0937', '敦煌市', '敦煌', '甘肃,酒泉,敦煌', 'DunHuang', 94.661967, 40.142128);
INSERT INTO `china_region` VALUES (670616, 1, 620000000000, 621000000000, '745000', '0934', '庆阳市', '庆阳', '甘肃,庆阳', 'QingYang', 107.643631, 35.709077);
INSERT INTO `china_region` VALUES (670617, 2, 621000000000, 621001000000, '745000', '0934', '市辖区', '庆阳', '甘肃,庆阳', 'QingYang', 107.643631, 35.709077);
INSERT INTO `china_region` VALUES (670618, 2, 621000000000, 621002000000, '745000', '0934', '西峰区', '西峰', '甘肃,庆阳,西峰', 'XiFeng', 107.651077, 35.730652);
INSERT INTO `china_region` VALUES (670745, 2, 621000000000, 621021000000, '745100', '0934', '庆城县', '庆城', '甘肃,庆阳,庆城', 'QingCheng', 107.881802, 36.016299);
INSERT INTO `china_region` VALUES (670937, 2, 621000000000, 621022000000, '745700', '0934', '环县', '环县', '甘肃,庆阳,环县', 'HuanXian', 107.308501, 36.568435);
INSERT INTO `china_region` VALUES (671226, 2, 621000000000, 621023000000, '745600', '0934', '华池县', '华池', '甘肃,庆阳,华池', 'HuaChi', 107.990035, 36.461355);
INSERT INTO `china_region` VALUES (671371, 2, 621000000000, 621024000000, '745400', '0934', '合水县', '合水', '甘肃,庆阳,合水', 'HeShui', 108.01953, 35.819243);
INSERT INTO `china_region` VALUES (671477, 2, 621000000000, 621025000000, '745300', '0934', '正宁县', '正宁', '甘肃,庆阳,正宁', 'ZhengNing', 108.359976, 35.49189);
INSERT INTO `china_region` VALUES (671596, 2, 621000000000, 621026000000, '745200', '0934', '宁县', '宁县', '甘肃,庆阳,宁县', 'NingXian', 107.928369, 35.502177);
INSERT INTO `china_region` VALUES (671893, 2, 621000000000, 621027000000, '744500', '0934', '镇原县', '镇原', '甘肃,庆阳,镇原', 'ZhenYuan', 107.200832, 35.677462);
INSERT INTO `china_region` VALUES (672134, 1, 620000000000, 621100000000, '743000', '0932', '定西市', '定西', '甘肃,定西', 'DingXi', 104.626282, 35.580662);
INSERT INTO `china_region` VALUES (672135, 2, 621100000000, 621101000000, '743000', '0932', '市辖区', '定西', '甘肃,定西', 'DingXi', 104.626282, 35.580662);
INSERT INTO `china_region` VALUES (672136, 2, 621100000000, 621102000000, '744300', '0932', '安定区', '安定', '甘肃,定西,安定', 'AnDing', 104.610668, 35.580629);
INSERT INTO `china_region` VALUES (672490, 2, 621100000000, 621121000000, '743300', '0932', '通渭县', '通渭', '甘肃,定西,通渭', 'TongWei', 105.242061, 35.210831);
INSERT INTO `china_region` VALUES (672851, 2, 621100000000, 621122000000, '748100', '0932', '陇西县', '陇西', '甘肃,定西,陇西', 'LongXi', 104.634984, 35.00394);
INSERT INTO `china_region` VALUES (673095, 2, 621100000000, 621123000000, '748200', '0932', '渭源县', '渭源', '甘肃,定西,渭源', 'WeiYuan', 104.215467, 35.136755);
INSERT INTO `china_region` VALUES (673332, 2, 621100000000, 621124000000, '730500', '0932', '临洮县', '临洮', '甘肃,定西,临洮', 'LinTao', 103.859565, 35.394989);
INSERT INTO `china_region` VALUES (673686, 2, 621100000000, 621125000000, '748300', '0932', '漳县', '漳县', '甘肃,定西,漳县', 'ZhangXian', 104.471572, 34.848444);
INSERT INTO `china_region` VALUES (673840, 2, 621100000000, 621126000000, '748400', '0932', '岷县', '岷县', '甘肃,定西,岷县', 'MinXian', 104.03688, 34.438076);
INSERT INTO `china_region` VALUES (674231, 1, 620000000000, 621200000000, '742500', '2935', '陇南市', '陇南', '甘肃,陇南', 'LongNan', 104.921841, 33.400684);
INSERT INTO `china_region` VALUES (674232, 2, 621200000000, 621201000000, '742500', '2935', '市辖区', '陇南', '甘肃,陇南', 'LongNan', 104.921841, 33.400684);
INSERT INTO `china_region` VALUES (674233, 2, 621200000000, 621202000000, '746000', '2935', '武都区', '武都', '甘肃,陇南,武都', 'WuDu', 104.926337, 33.392211);
INSERT INTO `china_region` VALUES (674983, 2, 621200000000, 621221000000, '742500', '2935', '成县', '成县', '甘肃,陇南,成县', 'ChengXian', 105.742203, 33.750477);
INSERT INTO `china_region` VALUES (675260, 2, 621200000000, 621222000000, '746400', '2935', '文县', '文县', '甘肃,陇南,文县', 'WenXian', 104.683434, 32.943815);
INSERT INTO `china_region` VALUES (675593, 2, 621200000000, 621223000000, '748500', '2935', '宕昌县', '宕昌', '甘肃,陇南,宕昌', 'DangChang', 104.393385, 34.047261);
INSERT INTO `china_region` VALUES (675959, 2, 621200000000, 621224000000, '746500', '2935', '康县', '康县', '甘肃,陇南,康县', 'KangXian', 105.609169, 33.329136);
INSERT INTO `china_region` VALUES (676340, 2, 621200000000, 621225000000, '742100', '2935', '西和县', '西和', '甘肃,陇南,西和', 'XiHe', 105.298756, 34.014215);
INSERT INTO `china_region` VALUES (676755, 2, 621200000000, 621226000000, '742200', '2935', '礼县', '礼县', '甘肃,陇南,礼县', 'LiXian', 105.17864, 34.189345);
INSERT INTO `china_region` VALUES (677364, 2, 621200000000, 621227000000, '742300', '2935', '徽县', '徽县', '甘肃,陇南,徽县', 'HuiXian', 106.08778, 33.768826);
INSERT INTO `china_region` VALUES (677615, 2, 621200000000, 621228000000, '742400', '2935', '两当县', '两当', '甘肃,陇南,两当', 'LiangDang', 106.304967, 33.908917);
INSERT INTO `china_region` VALUES (677748, 1, 620000000000, 622900000000, '731100', '0930', '临夏回族自治州', '临夏', '甘肃,临夏', 'LinXia', 103.210538, 35.601182);
INSERT INTO `china_region` VALUES (677749, 2, 622900000000, 622901000000, '731100', '0930', '临夏市', '临夏', '甘肃,临夏', 'LinXia', 103.210538, 35.601182);
INSERT INTO `china_region` VALUES (677833, 2, 622900000000, 622921000000, '731800', '0930', '临夏县', '临夏', '甘肃,临夏', 'LinXia', 102.995502, 35.491637);
INSERT INTO `china_region` VALUES (678082, 2, 622900000000, 622922000000, '731500', '0930', '康乐县', '康乐', '甘肃,临夏,康乐', 'KangLe', 103.708354, 35.370505);
INSERT INTO `china_region` VALUES (678253, 2, 622900000000, 622923000000, '731600', '0930', '永靖县', '永靖', '甘肃,临夏,永靖', 'YongJing', 103.285854, 35.958306);
INSERT INTO `china_region` VALUES (678405, 2, 622900000000, 622924000000, '731300', '0930', '广河县', '广河', '甘肃,临夏,广河', 'GuangHe', 103.575834, 35.488052);
INSERT INTO `china_region` VALUES (678522, 2, 622900000000, 622925000000, '731200', '0930', '和政县', '和政', '甘肃,临夏,和政', 'HeZheng', 103.350997, 35.424603);
INSERT INTO `china_region` VALUES (678662, 2, 622900000000, 622926000000, '731400', '0930', '东乡族自治县', '东乡族自治县', '甘肃,临夏,东乡族自治县', 'DongXiangZuZiZhiXian', 103.389346, 35.663752);
INSERT INTO `china_region` VALUES (678914, 2, 622900000000, 622927000000, '731700', '0930', '积石山保安族东乡族撒拉族自治县', '积石山', '甘肃,临夏,积石山', 'JiShiShan', 102.875843, 35.717661);
INSERT INTO `china_region` VALUES (679083, 1, 620000000000, 623000000000, '747000', '0941', '甘南藏族自治州', '甘南', '甘肃,甘南', 'GanNan', 102.911027, 34.983385);
INSERT INTO `china_region` VALUES (679084, 2, 623000000000, 623001000000, '747000', '0941', '合作市', '合作', '甘肃,甘南,合作', 'HeZuo', 102.910882, 35.000399);
INSERT INTO `china_region` VALUES (679146, 2, 623000000000, 623021000000, '747500', '0941', '临潭县', '临潭', '甘肃,甘南,临潭', 'LinTan', 103.353919, 34.692747);
INSERT INTO `china_region` VALUES (679313, 2, 623000000000, 623022000000, '747600', '0941', '卓尼县', '卓尼', '甘肃,甘南,卓尼', 'ZhuoNi', 103.507109, 34.589588);
INSERT INTO `china_region` VALUES (679435, 2, 623000000000, 623023000000, '746300', '0941', '舟曲县', '舟曲', '甘肃,甘南,舟曲', 'ZhouQu', 104.371586, 33.785259);
INSERT INTO `china_region` VALUES (679670, 2, 623000000000, 623024000000, '747400', '0941', '迭部县', '迭部', '甘肃,甘南,迭部', 'DieBu', 103.22187, 34.055939);
INSERT INTO `china_region` VALUES (679738, 2, 623000000000, 623025000000, '747300', '0941', '玛曲县', '玛曲', '甘肃,甘南,玛曲', 'MaQu', 102.072698, 33.997712);
INSERT INTO `china_region` VALUES (679791, 2, 623000000000, 623026000000, '747200', '0941', '碌曲县', '碌曲', '甘肃,甘南,碌曲', 'LuQu', 102.487327, 34.590944);
INSERT INTO `china_region` VALUES (679830, 2, 623000000000, 623027000000, '747100', '0941', '夏河县', '夏河', '甘肃,甘南,夏河', 'XiaHe', 102.521807, 35.202503);
INSERT INTO `china_region` VALUES (679919, 0, 0, 630000000000, '0', NULL, '青海省', '青海', '青海', 'QingHai', 101.780199, 36.620901);
INSERT INTO `china_region` VALUES (679920, 1, 630000000000, 630100000000, '810000', '0971', '西宁市', '西宁', '青海,西宁', 'XiNing', 101.778228, 36.617144);
INSERT INTO `china_region` VALUES (679921, 2, 630100000000, 630101000000, '810000', '0971', '市辖区', '西宁', '青海,西宁', 'XiNing', 101.778228, 36.617144);
INSERT INTO `china_region` VALUES (679922, 2, 630100000000, 630102000000, '810000', '0971', '城东区', '城东', '青海,西宁,城东', 'ChengDong', 101.803717, 36.599745);
INSERT INTO `china_region` VALUES (679993, 2, 630100000000, 630103000000, '810000', '0971', '城中区', '城中', '青海,西宁,城中', 'ChengZhong', 101.784554, 36.621181);
INSERT INTO `china_region` VALUES (680065, 2, 630100000000, 630104000000, '810000', '0971', '城西区', '城西', '青海,西宁,城西', 'ChengXi', 101.765843, 36.628305);
INSERT INTO `china_region` VALUES (680117, 2, 630100000000, 630105000000, '810000', '0971', '城北区', '城北', '青海,西宁,城北', 'ChengBei', 101.766228, 36.650038);
INSERT INTO `china_region` VALUES (680195, 2, 630100000000, 630121000000, '810100', '0971', '大通回族土族自治县', '大通', '青海,西宁,大通', 'DaTong', 101.685643, 36.926955);
INSERT INTO `china_region` VALUES (680527, 2, 630100000000, 630122000000, '811600', '0971', '湟中县', '湟中', '青海,西宁,湟中', 'HuangZhong', 101.571667, 36.500879);
INSERT INTO `china_region` VALUES (680942, 2, 630100000000, 630123000000, '812100', '0971', '湟源县', '湟源', '青海,西宁,湟源', 'HuangYuan', 101.256464, 36.682427);
INSERT INTO `china_region` VALUES (681106, 1, 630000000000, 630200000000, '814000', '0972', '海东市', '海东', '青海,海东', 'HaiDong', 102.104287, 36.502039);
INSERT INTO `china_region` VALUES (681107, 2, 630200000000, 630202000000, '810700', '0972', '乐都区', '乐都', '青海,海东,乐都', 'LeDou', 102.401725, 36.482058);
INSERT INTO `china_region` VALUES (681498, 2, 630200000000, 630203000000, '810600', '0972', '平安区', '平安', '青海,海东,平安', 'PingAn', 102.108835, 36.500563);
INSERT INTO `china_region` VALUES (681627, 2, 630200000000, 630222000000, '810800', '0972', '民和回族土族自治县', '民和', '青海,海东,民和', 'MinHe', 102.830892, 36.320321);
INSERT INTO `china_region` VALUES (681979, 2, 630200000000, 630223000000, '810500', '0972', '互助土族自治县', '互助', '青海,海东,互助', 'HuZhu', 101.959271, 36.844249);
INSERT INTO `china_region` VALUES (682310, 2, 630200000000, 630224000000, '810900', '0972', '化隆回族自治县', '化隆', '青海,海东,化隆', 'HuaLong', 102.264143, 36.094908);
INSERT INTO `china_region` VALUES (682699, 2, 630200000000, 630225000000, '811100', '0972', '循化撒拉族自治县', '循化', '青海,海东,循化', 'XunHua', 102.485646, 35.848586);
INSERT INTO `china_region` VALUES (682869, 1, 630000000000, 632200000000, '812200', '0970', '海北藏族自治州', '海北', '青海,海北', 'HaiBei', 100.900997, 36.954413);
INSERT INTO `china_region` VALUES (682870, 2, 632200000000, 632221000000, '810300', '0970', '门源回族自治县', '门源', '青海,海北,门源', 'MenYuan', 101.622364, 37.376449);
INSERT INTO `china_region` VALUES (683015, 2, 632200000000, 632222000000, '810400', '0970', '祁连县', '祁连', '青海,海北,祁连', 'QiLian', 100.253211, 38.177112);
INSERT INTO `china_region` VALUES (683073, 2, 632200000000, 632223000000, '812200', '0970', '海晏县', '海晏', '青海,海北,海晏', 'HaiYan', 100.99443, 36.896467);
INSERT INTO `china_region` VALUES (683116, 2, 632200000000, 632224000000, '812300', '0970', '刚察县', '刚察', '青海,海北,刚察', 'GangCha', 100.145833, 37.32547);
INSERT INTO `china_region` VALUES (683162, 1, 630000000000, 632300000000, '811300', '0973', '黄南藏族自治州', '黄南', '青海,黄南', 'HuangNan', 102.015248, 35.519548);
INSERT INTO `china_region` VALUES (683163, 2, 632300000000, 632321000000, '811300', '0973', '同仁县', '同仁', '青海,黄南,同仁', 'TongRen', 102.018323, 35.516063);
INSERT INTO `china_region` VALUES (683257, 2, 632300000000, 632322000000, '811200', '0973', '尖扎县', '尖扎', '青海,黄南,尖扎', 'JianZha', 102.031183, 35.938299);
INSERT INTO `china_region` VALUES (683363, 2, 632300000000, 632323000000, '811400', '0973', '泽库县', '泽库', '青海,黄南,泽库', 'ZeKu', 101.466689, 35.035313);
INSERT INTO `china_region` VALUES (683447, 2, 632300000000, 632324000000, '811500', '0973', '河南蒙古族自治县', '河南', '青海,黄南,河南', 'HeNan', 101.616308, 34.734773);
INSERT INTO `china_region` VALUES (683499, 1, 630000000000, 632500000000, '813000', '0974', '海南藏族自治州', '海南', '青海,海南', 'HaiNan', 100.620373, 36.286437);
INSERT INTO `china_region` VALUES (683500, 2, 632500000000, 632521000000, '813000', '0974', '共和县', '共和', '青海,海南,共和', 'GongHe', 100.620031, 36.284107);
INSERT INTO `china_region` VALUES (683637, 2, 632500000000, 632522000000, '813200', '0974', '同德县', '同德', '青海,海南,同德', 'TongDe', 100.578052, 35.254791);
INSERT INTO `china_region` VALUES (683736, 2, 632500000000, 632523000000, '811700', '0974', '贵德县', '贵德', '青海,海南,贵德', 'GuiDe', 101.435256, 36.04068);
INSERT INTO `china_region` VALUES (683877, 2, 632500000000, 632524000000, '813300', '0974', '兴海县', '兴海', '青海,海南,兴海', 'XingHai', 99.987966, 35.588613);
INSERT INTO `china_region` VALUES (683951, 2, 632500000000, 632525000000, '813100', '0974', '贵南县', '贵南', '青海,海南,贵南', 'GuiNan', 100.747503, 35.586715);
INSERT INTO `china_region` VALUES (684044, 1, 630000000000, 632600000000, '814000', '0975', '果洛藏族自治州', '果洛', '青海,果洛', 'GuoLuo', 100.244808, 34.471431);
INSERT INTO `china_region` VALUES (684045, 2, 632600000000, 632621000000, '814000', '0975', '玛沁县', '玛沁', '青海,果洛,玛沁', 'MaQin', 100.238888, 34.477433);
INSERT INTO `china_region` VALUES (684097, 2, 632600000000, 632622000000, '814300', '0975', '班玛县', '班玛', '青海,果洛,班玛', 'BanMa', 100.737138, 32.932723);
INSERT INTO `china_region` VALUES (684141, 2, 632600000000, 632623000000, '814100', '0975', '甘德县', '甘德', '青海,果洛,甘德', 'GanDe', 99.900905, 33.969219);
INSERT INTO `china_region` VALUES (684187, 2, 632600000000, 632624000000, '814200', '0975', '达日县', '达日', '青海,果洛,达日', 'DaRi', 99.651392, 33.748921);
INSERT INTO `china_region` VALUES (684234, 2, 632600000000, 632625000000, '624700', '0975', '久治县', '久治', '青海,果洛,久治', 'JiuZhi', 101.482831, 33.429471);
INSERT INTO `china_region` VALUES (684267, 2, 632600000000, 632626000000, '813500', '0975', '玛多县', '玛多', '青海,果洛,玛多', 'MaDuo', 98.209206, 34.915946);
INSERT INTO `china_region` VALUES (684305, 1, 630000000000, 632700000000, '815000', '0976', '玉树藏族自治州', '玉树', '青海,玉树', 'YuShu', 97.091934, 33.011674);
INSERT INTO `china_region` VALUES (684306, 2, 632700000000, 632701000000, '815000', '0976', '玉树市', '玉树', '青海,玉树', 'YuShu', 97.091934, 33.011674);
INSERT INTO `china_region` VALUES (684399, 2, 632700000000, 632722000000, '815300', '0976', '杂多县', '杂多', '青海,玉树,杂多', 'ZaDuo', 95.300723, 32.893185);
INSERT INTO `china_region` VALUES (684449, 2, 632700000000, 632723000000, '815100', '0976', '称多县', '称多', '青海,玉树,称多', 'ChenDuo', 97.110832, 33.369218);
INSERT INTO `china_region` VALUES (684522, 2, 632700000000, 632724000000, '815400', '0976', '治多县', '治多', '青海,玉树,治多', 'ZhiDuo', 95.61308, 33.852751);
INSERT INTO `china_region` VALUES (684555, 2, 632700000000, 632725000000, '815200', '0976', '囊谦县', '囊谦', '青海,玉树,囊谦', 'NangQian', 96.48065, 32.203246);
INSERT INTO `china_region` VALUES (684643, 2, 632700000000, 632726000000, '815500', '0976', '曲麻莱县', '曲麻莱', '青海,玉树,曲麻莱', 'QuMaLai', 95.797367, 34.126429);
INSERT INTO `china_region` VALUES (684673, 1, 630000000000, 632800000000, '817000', '0977', '海西蒙古族藏族自治州', '海西', '青海,海西', 'HaiXi', 97.369751, 37.377139);
INSERT INTO `china_region` VALUES (684674, 2, 632800000000, 632801000000, '816000', '0977', '格尔木市', '格尔木', '青海,海西,格尔木', 'GeErMu', 94.928484, 36.406404);
INSERT INTO `china_region` VALUES (684760, 2, 632800000000, 632802000000, '817000', '0977', '德令哈市', '德令哈', '青海,海西,德令哈', 'DeLingHa', 97.360985, 37.369436);
INSERT INTO `china_region` VALUES (684837, 2, 632800000000, 632803000000, '816401', '0977', '茫崖市', '茫崖', '青海,海西,茫崖', 'MangYa', 97.369751, 37.377139);
INSERT INTO `china_region` VALUES (684853, 2, 632800000000, 632821000000, '817100', '0977', '乌兰县', '乌兰', '青海,海西,乌兰', 'WuLan', 98.480195, 36.929749);
INSERT INTO `china_region` VALUES (684904, 2, 632800000000, 632822000000, '816100', '0977', '都兰县', '都兰', '青海,海西,都兰', 'DuLan', 98.095844, 36.302496);
INSERT INTO `china_region` VALUES (685029, 2, 632800000000, 632823000000, '817200', '0977', '天峻县', '天峻', '青海,海西,天峻', 'TianJun', 99.022984, 37.300851);
INSERT INTO `china_region` VALUES (685104, 2, 632800000000, 632857000000, '816201', '0977', '大柴旦行政委员会', '大柴旦', '青海,海西,大柴旦', 'DaChaiDan', 94.89036, 36.399323);
INSERT INTO `china_region` VALUES (685112, 0, 0, 640000000000, '0', NULL, '宁夏回族自治区', '宁夏', '宁夏', 'NingXia', 106.258754, 38.471317);
INSERT INTO `china_region` VALUES (685113, 1, 640000000000, 640100000000, '750000', '0951', '银川市', '银川', '宁夏,银川', 'YinChuan', 106.230909, 38.487193);
INSERT INTO `china_region` VALUES (685114, 2, 640100000000, 640101000000, '750000', '0951', '市辖区', '银川', '宁夏,银川', 'YinChuan', 106.230909, 38.487193);
INSERT INTO `china_region` VALUES (685115, 2, 640100000000, 640104000000, '750000', '0951', '兴庆区', '兴庆', '宁夏,银川,兴庆', 'XingQing', 106.28865, 38.47361);
INSERT INTO `china_region` VALUES (685268, 2, 640100000000, 640105000000, '750000', '0951', '西夏区', '西夏', '宁夏,银川,西夏', 'XiXia', 106.156394, 38.49604);
INSERT INTO `china_region` VALUES (685358, 2, 640100000000, 640106000000, '750000', '0951', '金凤区', '金凤', '宁夏,银川,金凤', 'JinFeng', 106.242542, 38.473305);
INSERT INTO `china_region` VALUES (685438, 2, 640100000000, 640121000000, '750100', '0951', '永宁县', '永宁', '宁夏,银川,永宁', 'YongNing', 106.253145, 38.277373);
INSERT INTO `china_region` VALUES (685540, 2, 640100000000, 640122000000, '750200', '0951', '贺兰县', '贺兰', '宁夏,银川,贺兰', 'HeLan', 106.349828, 38.554344);
INSERT INTO `china_region` VALUES (685632, 2, 640100000000, 640181000000, '751400', '0951', '灵武市', '灵武', '宁夏,银川,灵武', 'LingWu', 106.340054, 38.102655);
INSERT INTO `china_region` VALUES (685745, 1, 640000000000, 640200000000, '753000', '0952', '石嘴山市', '石嘴山', '宁夏,石嘴山', 'ShiZuiShan', 106.383303, 38.983236);
INSERT INTO `china_region` VALUES (685746, 2, 640200000000, 640201000000, '753000', '0952', '市辖区', '石嘴山', '宁夏,石嘴山', 'ShiZuiShan', 106.383303, 38.983236);
INSERT INTO `china_region` VALUES (685747, 2, 640200000000, 640202000000, '753000', '0952', '大武口区', '大武口', '宁夏,石嘴山,大武口', 'DaWuKou', 106.367861, 39.01906);
INSERT INTO `china_region` VALUES (685821, 2, 640200000000, 640205000000, '753600', '0952', '惠农区', '惠农', '宁夏,石嘴山,惠农', 'HuiNong', 106.781176, 39.239302);
INSERT INTO `china_region` VALUES (685918, 2, 640200000000, 640221000000, '753400', '0952', '平罗县', '平罗', '宁夏,石嘴山,平罗', 'PingLuo', 106.523474, 38.913544);
INSERT INTO `china_region` VALUES (686112, 1, 640000000000, 640300000000, '751100', '0953', '吴忠市', '吴忠', '宁夏,吴忠', 'WuZhong', 106.198393, 37.99746);
INSERT INTO `china_region` VALUES (686113, 2, 640300000000, 640301000000, '751100', '0953', '市辖区', '吴忠', '宁夏,吴忠', 'WuZhong', 106.198393, 37.99746);
INSERT INTO `china_region` VALUES (686114, 2, 640300000000, 640302000000, '751100', '0953', '利通区', '利通', '宁夏,吴忠,利通', 'LiTong', 106.212566, 37.983458);
INSERT INTO `china_region` VALUES (686261, 2, 640300000000, 640303000000, '751999', '0953', '红寺堡区', '红寺堡', '宁夏,吴忠,红寺堡', 'HongSiBao', 106.062114, 37.425702);
INSERT INTO `china_region` VALUES (686340, 2, 640300000000, 640323000000, '751500', '0953', '盐池县', '盐池', '宁夏,吴忠,盐池', 'YanChi', 107.407359, 37.783205);
INSERT INTO `china_region` VALUES (686468, 2, 640300000000, 640324000000, '751300', '0953', '同心县', '同心', '宁夏,吴忠,同心', 'TongXin', 105.914458, 36.980575);
INSERT INTO `china_region` VALUES (686627, 2, 640300000000, 640381000000, '751600', '0953', '青铜峡市', '青铜峡', '宁夏,吴忠,青铜峡', 'QingTongXia', 106.078818, 38.021302);
INSERT INTO `china_region` VALUES (686749, 1, 640000000000, 640400000000, '756000', '0954', '固原市', '固原', '宁夏,固原', 'GuYuan', 106.24261, 36.015855);
INSERT INTO `china_region` VALUES (686750, 2, 640400000000, 640401000000, '756000', '0954', '市辖区', '固原', '宁夏,固原', 'GuYuan', 106.24261, 36.015855);
INSERT INTO `china_region` VALUES (686751, 2, 640400000000, 640402000000, '756000', '0954', '原州区', '原州', '宁夏,固原,原州', 'YuanZhou', 106.287782, 36.00374);
INSERT INTO `china_region` VALUES (686957, 2, 640400000000, 640422000000, '756200', '0954', '西吉县', '西吉', '宁夏,固原,西吉', 'XiJi', 105.729085, 35.963913);
INSERT INTO `china_region` VALUES (687280, 2, 640400000000, 640423000000, '756300', '0954', '隆德县', '隆德', '宁夏,固原,隆德', 'LongDe', 106.111595, 35.625915);
INSERT INTO `china_region` VALUES (687417, 2, 640400000000, 640424000000, '756400', '0954', '泾源县', '泾源', '宁夏,固原,泾源', 'JingYuan', 106.330646, 35.49816);
INSERT INTO `china_region` VALUES (687522, 2, 640400000000, 640425000000, '756500', '0954', '彭阳县', '彭阳', '宁夏,固原,彭阳', 'PengYang', 106.63834, 35.849565);
INSERT INTO `china_region` VALUES (687697, 1, 640000000000, 640500000000, '755000', '1953', '中卫市', '中卫', '宁夏,中卫', 'ZhongWei', 105.196902, 37.499972);
INSERT INTO `china_region` VALUES (687698, 2, 640500000000, 640501000000, '755000', '1953', '市辖区', '中卫', '宁夏,中卫', 'ZhongWei', 105.196902, 37.499972);
INSERT INTO `china_region` VALUES (687699, 2, 640500000000, 640502000000, '755000', '1953', '沙坡头区', '沙坡头', '宁夏,中卫,沙坡头', 'ShaPoTou', 105.190536, 37.514564);
INSERT INTO `china_region` VALUES (687902, 2, 640500000000, 640521000000, '755100', '1953', '中宁县', '中宁', '宁夏,中卫,中宁', 'ZhongNing', 105.685285, 37.491505);
INSERT INTO `china_region` VALUES (688061, 2, 640500000000, 640522000000, '755200', '1953', '海原县', '海原', '宁夏,中卫,海原', 'HaiYuan', 105.643487, 36.565033);
INSERT INTO `china_region` VALUES (688246, 0, 0, 650000000000, '0', NULL, '新疆维吾尔自治区', '新疆', '新疆', 'XinJiang', 87.627704, 43.793026);
INSERT INTO `china_region` VALUES (688247, 1, 650000000000, 650100000000, '830000', '0991', '乌鲁木齐市', '乌鲁木齐', '新疆,乌鲁木齐', 'WuLuMuQi', 87.616848, 43.825592);
INSERT INTO `china_region` VALUES (688248, 2, 650100000000, 650101000000, '830000', '0991', '市辖区', '乌鲁木齐', '新疆,乌鲁木齐', 'WuLuMuQi', 87.616848, 43.825592);
INSERT INTO `china_region` VALUES (688249, 2, 650100000000, 650102000000, '830000', '0991', '天山区', '天山', '新疆,乌鲁木齐,天山', 'TianShan', 87.631676, 43.794399);
INSERT INTO `china_region` VALUES (688467, 2, 650100000000, 650103000000, '830000', '0991', '沙依巴克区', '沙依巴克', '新疆,乌鲁木齐,沙依巴克', 'ShaYiBaKe', 87.598195, 43.800939);
INSERT INTO `china_region` VALUES (688693, 2, 650100000000, 650104000000, '830000', '0991', '新市区', '新市区', '新疆,乌鲁木齐,新市区', 'XinShiQu', 87.573916, 43.843752);
INSERT INTO `china_region` VALUES (688887, 2, 650100000000, 650105000000, '830000', '0991', '水磨沟区', '水磨沟', '新疆,乌鲁木齐,水磨沟', 'ShuiMoGou', 87.642482, 43.832459);
INSERT INTO `china_region` VALUES (689063, 2, 650100000000, 650106000000, '830000', '0991', '头屯河区', '头屯河', '新疆,乌鲁木齐,头屯河', 'TouTunHe', 87.616848, 43.825592);
INSERT INTO `china_region` VALUES (689208, 2, 650100000000, 650107000000, '830039', '0991', '达坂城区', '达坂城', '新疆,乌鲁木齐,达坂城', 'DaBanCheng', 88.311099, 43.363668);
INSERT INTO `china_region` VALUES (689258, 2, 650100000000, 650109000000, '830000', '0991', '米东区', '米东', '新疆,乌鲁木齐,米东', 'MiDong', 87.655755, 43.973579);
INSERT INTO `china_region` VALUES (689430, 2, 650100000000, 650121000000, '830000', '0991', '乌鲁木齐县', '乌鲁木齐', '新疆,乌鲁木齐', 'WuLuMuQi', 87.409417, 43.47136);
INSERT INTO `china_region` VALUES (689488, 1, 650000000000, 650200000000, '834000', '0990', '克拉玛依市', '克拉玛依', '新疆,克拉玛依', 'KeLaMaYi', 84.889207, 45.579888);
INSERT INTO `china_region` VALUES (689489, 2, 650200000000, 650201000000, '834000', '0990', '市辖区', '克拉玛依', '新疆,克拉玛依', 'KeLaMaYi', 84.889207, 45.579888);
INSERT INTO `china_region` VALUES (689490, 2, 650200000000, 650202000000, '838600', '0990', '独山子区', '独山子', '新疆,克拉玛依,独山子', 'DuShanZi', 84.886974, 44.328096);
INSERT INTO `china_region` VALUES (689513, 2, 650200000000, 650203000000, '834000', '0990', '克拉玛依区', '克拉玛依', '新疆,克拉玛依', 'KeLaMaYi', 84.867844, 45.602526);
INSERT INTO `china_region` VALUES (689638, 2, 650200000000, 650204000000, '834000', '0990', '白碱滩区', '白碱滩', '新疆,克拉玛依,白碱滩', 'BaiJianTan', 85.119186, 45.685473);
INSERT INTO `china_region` VALUES (689660, 2, 650200000000, 650205000000, '834000', '0990', '乌尔禾区', '乌尔禾', '新疆,克拉玛依,乌尔禾', 'WuErHe', 85.693742, 46.089148);
INSERT INTO `china_region` VALUES (689679, 1, 650000000000, 650400000000, '838000', '0995', '吐鲁番市', '吐鲁番', '新疆,吐鲁番', 'TuLuFan', 89.189655, 42.951384);
INSERT INTO `china_region` VALUES (689680, 2, 650400000000, 650402000000, '838099', '0995', '高昌区', '高昌', '新疆,吐鲁番,高昌', 'GaoChang', 89.182342, 42.947635);
INSERT INTO `china_region` VALUES (689800, 2, 650400000000, 650421000000, '838200', '0995', '鄯善县', '鄯善', '新疆,吐鲁番,鄯善', 'ShanShan', 90.21333, 42.868744);
INSERT INTO `china_region` VALUES (689922, 2, 650400000000, 650422000000, '838100', '0995', '托克逊县', '托克逊', '新疆,吐鲁番,托克逊', 'TuoKeXun', 88.638816, 42.792454);
INSERT INTO `china_region` VALUES (689992, 1, 650000000000, 650500000000, '839000', '0902', '哈密市', '哈密', '新疆,哈密', 'HaMi', 93.514916, 42.818501);
INSERT INTO `china_region` VALUES (689993, 2, 650500000000, 650502000000, '835217', '0902', '伊州区', '伊州', '新疆,哈密,伊州', 'YiZhou', 93.514797, 42.827255);
INSERT INTO `china_region` VALUES (690258, 2, 650500000000, 650521000000, '839200', '0902', '巴里坤哈萨克自治县', '巴里坤', '新疆,哈密,巴里坤', 'BaLiKun', 93.016624, 43.598762);
INSERT INTO `china_region` VALUES (690354, 2, 650500000000, 650522000000, '839300', '0902', '伊吾县', '伊吾', '新疆,哈密,伊吾', 'YiWu', 94.697074, 43.254978);
INSERT INTO `china_region` VALUES (690411, 1, 650000000000, 652300000000, '831100', '0994', '昌吉回族自治州', '昌吉', '新疆,昌吉', 'ChangJi', 87.308224, 44.011182);
INSERT INTO `china_region` VALUES (690412, 2, 652300000000, 652301000000, '831100', '0994', '昌吉市', '昌吉', '新疆,昌吉', 'ChangJi', 87.308224, 44.011182);
INSERT INTO `china_region` VALUES (690598, 2, 652300000000, 652302000000, '831500', '0994', '阜康市', '阜康', '新疆,昌吉,阜康', 'FuKang', 87.946894, 44.168576);
INSERT INTO `china_region` VALUES (690721, 2, 652300000000, 652323000000, '831200', '0994', '呼图壁县', '呼图壁', '新疆,昌吉,呼图壁', 'HuTuBi', 86.898902, 44.191428);
INSERT INTO `china_region` VALUES (690869, 2, 652300000000, 652324000000, '832200', '0994', '玛纳斯县', '玛纳斯', '新疆,昌吉,玛纳斯', 'MaNaSi', 86.213997, 44.303893);
INSERT INTO `china_region` VALUES (691106, 2, 652300000000, 652325000000, '831800', '0994', '奇台县', '奇台', '新疆,昌吉,奇台', 'QiTai', 89.593967, 44.022066);
INSERT INTO `china_region` VALUES (691262, 2, 652300000000, 652327000000, '831700', '0994', '吉木萨尔县', '吉木萨尔', '新疆,昌吉,吉木萨尔', 'JiMuSaEr', 89.180437, 44.000497);
INSERT INTO `china_region` VALUES (691357, 2, 652300000000, 652328000000, '831900', '0994', '木垒哈萨克自治县', '木垒', '新疆,昌吉,木垒', 'MuLei', 90.286028, 43.834689);
INSERT INTO `china_region` VALUES (691435, 1, 650000000000, 652700000000, '833400', '0909', '博尔塔拉蒙古自治州', '博尔塔拉', '新疆,博尔塔拉', 'BoErTaLa', 82.066159, 44.905588);
INSERT INTO `china_region` VALUES (691436, 2, 652700000000, 652701000000, '833400', '0909', '博乐市', '博乐', '新疆,博尔塔拉,博乐', 'BoLe', 82.051005, 44.85387);
INSERT INTO `china_region` VALUES (691722, 2, 652700000000, 652702000000, '833418', '0909', '阿拉山口市', '阿拉山口', '新疆,博尔塔拉,阿拉山口', 'ALaShanKou', 82.559396, 45.172228);
INSERT INTO `china_region` VALUES (691728, 2, 652700000000, 652722000000, '833300', '0909', '精河县', '精河', '新疆,博尔塔拉,精河', 'JingHe', 82.894195, 44.600408);
INSERT INTO `china_region` VALUES (691879, 2, 652700000000, 652723000000, '833500', '0909', '温泉县', '温泉', '新疆,博尔塔拉,温泉', 'WenQuan', 81.024816, 44.968857);
INSERT INTO `china_region` VALUES (692004, 1, 650000000000, 652800000000, '841000', '0996', '巴音郭楞蒙古自治州', '巴音郭楞', '新疆,巴音郭楞', 'BaYinGuoLeng', 86.145298, 41.764115);
INSERT INTO `china_region` VALUES (692005, 2, 652800000000, 652801000000, '841000', '0996', '库尔勒市', '库尔勒', '新疆,巴音郭楞,库尔勒', 'KuErLe', 86.174633, 41.725892);
INSERT INTO `china_region` VALUES (692266, 2, 652800000000, 652822000000, '841600', '0996', '轮台县', '轮台', '新疆,巴音郭楞,轮台', 'LunTai', 84.252156, 41.777702);
INSERT INTO `china_region` VALUES (692359, 2, 652800000000, 652823000000, '841500', '0996', '尉犁县', '尉犁', '新疆,巴音郭楞,尉犁', 'YuLi', 86.261321, 41.343933);
INSERT INTO `china_region` VALUES (692484, 2, 652800000000, 652824000000, '841800', '0996', '若羌县', '若羌', '新疆,巴音郭楞,若羌', 'RuoQiang', 88.167152, 39.023242);
INSERT INTO `china_region` VALUES (692538, 2, 652800000000, 652825000000, '841900', '0996', '且末县', '且末', '新疆,巴音郭楞,且末', 'QieMo', 85.531996, 38.136842);
INSERT INTO `china_region` VALUES (692632, 2, 652800000000, 652826000000, '841100', '0996', '焉耆回族自治县', '焉耆', '新疆,巴音郭楞,焉耆', 'YanQi', 86.574067, 42.059759);
INSERT INTO `china_region` VALUES (692731, 2, 652800000000, 652827000000, '841300', '0996', '和静县', '和静', '新疆,巴音郭楞,和静', 'HeJing', 86.384065, 42.323625);
INSERT INTO `china_region` VALUES (692913, 2, 652800000000, 652828000000, '841200', '0996', '和硕县', '和硕', '新疆,巴音郭楞,和硕', 'HeShuo', 86.863963, 42.268371);
INSERT INTO `china_region` VALUES (692979, 2, 652800000000, 652829000000, '841400', '0996', '博湖县', '博湖', '新疆,巴音郭楞,博湖', 'BoHu', 86.631998, 41.980152);
INSERT INTO `china_region` VALUES (693029, 2, 652800000000, 652871000000, '841000', '0996', '库尔勒经济技术开发区', '库尔勒经开区', '新疆,巴音郭楞,库尔勒经开区', 'KuErLeJingKaiQu', 86.243095, 41.711313);
INSERT INTO `china_region` VALUES (693033, 1, 650000000000, 652900000000, '843000', '0997', '阿克苏地区', '阿克苏', '新疆,阿克苏', 'AKeSu', 80.260605, 41.168779);
INSERT INTO `china_region` VALUES (693034, 2, 652900000000, 652901000000, '843000', '0997', '阿克苏市', '阿克苏', '新疆,阿克苏', 'AKeSu', 80.260605, 41.168779);
INSERT INTO `china_region` VALUES (693275, 2, 652900000000, 652922000000, '843100', '0997', '温宿县', '温宿', '新疆,阿克苏,温宿', 'WenSu', 80.238959, 41.276688);
INSERT INTO `china_region` VALUES (693447, 2, 652900000000, 652923000000, '842000', '0997', '库车县', '库车', '新疆,阿克苏,库车', 'KuChe', 82.962016, 41.717906);
INSERT INTO `china_region` VALUES (693737, 2, 652900000000, 652924000000, '842200', '0997', '沙雅县', '沙雅', '新疆,阿克苏,沙雅', 'ShaYa', 82.781819, 41.221667);
INSERT INTO `china_region` VALUES (693934, 2, 652900000000, 652925000000, '842100', '0997', '新和县', '新和', '新疆,阿克苏,新和', 'XinHe', 82.60922, 41.548118);
INSERT INTO `china_region` VALUES (694088, 2, 652900000000, 652926000000, '842300', '0997', '拜城县', '拜城', '新疆,阿克苏,拜城', 'BaiCheng', 81.874156, 41.79691);
INSERT INTO `china_region` VALUES (694300, 2, 652900000000, 652927000000, '843400', '0997', '乌什县', '乌什', '新疆,阿克苏,乌什', 'WuShi', 79.224445, 41.214652);
INSERT INTO `china_region` VALUES (694429, 2, 652900000000, 652928000000, '843200', '0997', '阿瓦提县', '阿瓦提', '新疆,阿克苏,阿瓦提', 'AWaTi', 80.373137, 40.644529);
INSERT INTO `china_region` VALUES (694615, 2, 652900000000, 652929000000, '843600', '0997', '柯坪县', '柯坪', '新疆,阿克苏,柯坪', 'KePing', 79.047291, 40.50834);
INSERT INTO `china_region` VALUES (694664, 1, 650000000000, 653000000000, '845350', '0908', '克孜勒苏柯尔克孜自治州', '克孜勒苏', '新疆,克孜勒苏', 'KeZiLeSu', 76.167819, 39.714526);
INSERT INTO `china_region` VALUES (694665, 2, 653000000000, 653001000000, '845350', '0908', '阿图什市', '阿图什', '新疆,克孜勒苏,阿图什', 'ATuShi', 76.1684, 39.71616);
INSERT INTO `china_region` VALUES (694801, 2, 653000000000, 653022000000, '845550', '0908', '阿克陶县', '阿克陶', '新疆,克孜勒苏,阿克陶', 'AKeTao', 75.947396, 39.147785);
INSERT INTO `china_region` VALUES (694970, 2, 653000000000, 653023000000, '843500', '0908', '阿合奇县', '阿合奇', '新疆,克孜勒苏,阿合奇', 'AHeQi', 78.446253, 40.936936);
INSERT INTO `china_region` VALUES (695007, 2, 653000000000, 653024000000, '845450', '0908', '乌恰县', '乌恰', '新疆,克孜勒苏,乌恰', 'WuQia', 75.259228, 39.71931);
INSERT INTO `china_region` VALUES (695069, 1, 650000000000, 653100000000, '844000', '0998', '喀什地区', '喀什', '新疆,喀什', 'KaShi', 75.989755, 39.4704);
INSERT INTO `china_region` VALUES (695070, 2, 653100000000, 653101000000, '844000', '0998', '喀什市', '喀什', '新疆,喀什', 'KaShi', 75.989755, 39.4704);
INSERT INTO `china_region` VALUES (695376, 2, 653100000000, 653121000000, '844000', '0998', '疏附县', '疏附', '新疆,喀什,疏附', 'ShuFu', 75.862814, 39.375044);
INSERT INTO `china_region` VALUES (695540, 2, 653100000000, 653122000000, '844100', '0998', '疏勒县', '疏勒', '新疆,喀什,疏勒', 'ShuLe', 76.048139, 39.401385);
INSERT INTO `china_region` VALUES (695808, 2, 653100000000, 653123000000, '844500', '0998', '英吉沙县', '英吉沙', '新疆,喀什,英吉沙', 'YingJiSha', 76.175729, 38.930382);
INSERT INTO `china_region` VALUES (696028, 2, 653100000000, 653124000000, '844800', '0998', '泽普县', '泽普', '新疆,喀什,泽普', 'ZePu', 77.260103, 38.184955);
INSERT INTO `china_region` VALUES (696201, 2, 653100000000, 653125000000, '844700', '0998', '莎车县', '莎车', '新疆,喀什,莎车', 'ShaChe', 77.245761, 38.414217);
INSERT INTO `china_region` VALUES (696833, 2, 653100000000, 653126000000, '844900', '0998', '叶城县', '叶城', '新疆,喀什,叶城', 'YeCheng', 77.413836, 37.882989);
INSERT INTO `china_region` VALUES (697244, 2, 653100000000, 653127000000, '844600', '0998', '麦盖提县', '麦盖提', '新疆,喀什,麦盖提', 'MaiGeTi', 77.648006, 38.902232);
INSERT INTO `china_region` VALUES (697462, 2, 653100000000, 653128000000, '844400', '0998', '岳普湖县', '岳普湖', '新疆,喀什,岳普湖', 'YuePuHu', 76.773163, 39.2242);
INSERT INTO `china_region` VALUES (697589, 2, 653100000000, 653129000000, '844300', '0998', '伽师县', '伽师', '新疆,喀什,伽师', 'JiaShi', 76.72372, 39.488182);
INSERT INTO `china_region` VALUES (697948, 2, 653100000000, 653130000000, '843800', '0998', '巴楚县', '巴楚', '新疆,喀什,巴楚', 'BaChu', 78.549297, 39.785155);
INSERT INTO `china_region` VALUES (698206, 2, 653100000000, 653131000000, '845200', '0998', '塔什库尔干塔吉克自治县', '塔什库尔干', '新疆,喀什,塔什库尔干', 'TaShiKuErGan', 75.229889, 37.772094);
INSERT INTO `china_region` VALUES (698273, 1, 650000000000, 653200000000, '848000', '0903', '和田地区', '和田', '新疆,和田', 'HeTian', 79.922211, 37.114157);
INSERT INTO `china_region` VALUES (698274, 2, 653200000000, 653201000000, '848000', '0903', '和田市', '和田', '新疆,和田', 'HeTian', 79.913534, 37.112149);
INSERT INTO `china_region` VALUES (698536, 2, 653200000000, 653221000000, '848000', '0903', '和田县', '和田', '新疆,和田', 'HeTian', 79.81907, 37.120031);
INSERT INTO `china_region` VALUES (698812, 2, 653200000000, 653222000000, '848100', '0903', '墨玉县', '墨玉', '新疆,和田,墨玉', 'MoYu', 79.728841, 37.27734);
INSERT INTO `china_region` VALUES (699278, 2, 653200000000, 653223000000, '845100', '0903', '皮山县', '皮山', '新疆,和田,皮山', 'PiShan', 78.283669, 37.62145);
INSERT INTO `china_region` VALUES (699534, 2, 653200000000, 653224000000, '848200', '0903', '洛浦县', '洛浦', '新疆,和田,洛浦', 'LuoPu', 80.188986, 37.073667);
INSERT INTO `china_region` VALUES (699794, 2, 653200000000, 653225000000, '848300', '0903', '策勒县', '策勒', '新疆,和田,策勒', 'CeLe', 80.806159, 36.998335);
INSERT INTO `china_region` VALUES (699948, 2, 653200000000, 653226000000, '848400', '0903', '于田县', '于田', '新疆,和田,于田', 'YuTian', 81.677418, 36.857081);
INSERT INTO `china_region` VALUES (700192, 2, 653200000000, 653227000000, '848500', '0903', '民丰县', '民丰', '新疆,和田,民丰', 'MinFeng', 82.695862, 37.06408);
INSERT INTO `china_region` VALUES (700244, 1, 650000000000, 654000000000, '835000', '0999', '伊犁哈萨克自治州', '伊犁', '新疆,伊犁', 'YiLi', 81.324136, 43.916823);
INSERT INTO `china_region` VALUES (700245, 2, 654000000000, 654002000000, '835000', '0999', '伊宁市', '伊宁', '新疆,伊犁,伊宁', 'YiNing', 81.27795, 43.908558);
INSERT INTO `china_region` VALUES (700432, 2, 654000000000, 654003000000, '833200', '0999', '奎屯市', '奎屯', '新疆,伊犁,奎屯', 'KuiTun', 84.903267, 44.426529);
INSERT INTO `china_region` VALUES (700518, 2, 654000000000, 654004000000, '835000', '0999', '霍尔果斯市', '霍尔果斯', '新疆,伊犁,霍尔果斯', 'HuoErGuoSi', 80.420759, 44.201669);
INSERT INTO `china_region` VALUES (700574, 2, 654000000000, 654021000000, '835100', '0999', '伊宁县', '伊宁', '新疆,伊犁,伊宁', 'YiNing', 81.527453, 43.977138);
INSERT INTO `china_region` VALUES (700757, 2, 654000000000, 654022000000, '835300', '0999', '察布查尔锡伯自治县', '察布查尔', '新疆,伊犁,察布查尔', 'ChaBuChaEr', 81.151337, 43.840726);
INSERT INTO `china_region` VALUES (700898, 2, 654000000000, 654023000000, '835200', '0999', '霍城县', '霍城', '新疆,伊犁,霍城', 'HuoCheng', 80.874181, 44.053592);
INSERT INTO `china_region` VALUES (701071, 2, 654000000000, 654024000000, '835400', '0999', '巩留县', '巩留', '新疆,伊犁,巩留', 'GongLiu', 82.231718, 43.482628);
INSERT INTO `china_region` VALUES (701196, 2, 654000000000, 654025000000, '835800', '0999', '新源县', '新源', '新疆,伊犁,新源', 'XinYuan', 83.26077, 43.42993);
INSERT INTO `china_region` VALUES (701357, 2, 654000000000, 654026000000, '835600', '0999', '昭苏县', '昭苏', '新疆,伊犁,昭苏', 'ZhaoSu', 81.130975, 43.157293);
INSERT INTO `china_region` VALUES (701497, 2, 654000000000, 654027000000, '835500', '0999', '特克斯县', '特克斯', '新疆,伊犁,特克斯', 'TeKeSi', 81.836206, 43.217184);
INSERT INTO `china_region` VALUES (701594, 2, 654000000000, 654028000000, '835700', '0999', '尼勒克县', '尼勒克', '新疆,伊犁,尼勒克', 'NiLeKe', 82.51181, 43.800247);
INSERT INTO `china_region` VALUES (701707, 1, 650000000000, 654200000000, '834700', '0901', '塔城地区', '塔城', '新疆,塔城', 'TaCheng', 82.980316, 46.745364);
INSERT INTO `china_region` VALUES (701708, 2, 654200000000, 654201000000, '834700', '0901', '塔城市', '塔城', '新疆,塔城', 'TaCheng', 82.978928, 46.748523);
INSERT INTO `china_region` VALUES (701927, 2, 654200000000, 654202000000, '834700', '0901', '乌苏市', '乌苏', '新疆,塔城,乌苏', 'WuSu', 84.713736, 44.418887);
INSERT INTO `china_region` VALUES (702323, 2, 654200000000, 654221000000, '834600', '0901', '额敏县', '额敏', '新疆,塔城,额敏', 'EMin', 83.628303, 46.524673);
INSERT INTO `china_region` VALUES (702610, 2, 654200000000, 654223000000, '834700', '0901', '沙湾县', '沙湾', '新疆,塔城,沙湾', 'ShaWan', 85.619416, 44.326388);
INSERT INTO `china_region` VALUES (703078, 2, 654200000000, 654224000000, '834700', '0901', '托里县', '托里', '新疆,塔城,托里', 'TuoLi', 83.606951, 45.947638);
INSERT INTO `china_region` VALUES (703177, 2, 654200000000, 654225000000, '834700', '0901', '裕民县', '裕民', '新疆,塔城,裕民', 'YuMin', 82.982668, 46.201104);
INSERT INTO `china_region` VALUES (703254, 2, 654200000000, 654226000000, '834406', '0901', '和布克赛尔蒙古自治县', '和布克赛尔', '新疆,塔城,和布克赛尔', 'HeBuKeSaiEr', 85.728328, 46.793235);
INSERT INTO `china_region` VALUES (703371, 1, 650000000000, 654300000000, '836000', '0906', '阿勒泰地区', '阿勒泰', '新疆,阿勒泰', 'ALeTai', 88.141253, 47.844924);
INSERT INTO `china_region` VALUES (703372, 2, 654300000000, 654301000000, '836500', '0906', '阿勒泰市', '阿勒泰', '新疆,阿勒泰', 'ALeTai', 88.131842, 47.827309);
INSERT INTO `china_region` VALUES (703536, 2, 654300000000, 654321000000, '836600', '0906', '布尔津县', '布尔津', '新疆,阿勒泰,布尔津', 'BuErJin', 86.874897, 47.70185);
INSERT INTO `china_region` VALUES (703625, 2, 654300000000, 654322000000, '836100', '0906', '富蕴县', '富蕴', '新疆,阿勒泰,富蕴', 'FuYun', 89.530734, 46.995158);
INSERT INTO `china_region` VALUES (703724, 2, 654300000000, 654323000000, '836400', '0906', '福海县', '福海', '新疆,阿勒泰,福海', 'FuHai', 87.486703, 47.111919);
INSERT INTO `china_region` VALUES (703861, 2, 654300000000, 654324000000, '836700', '0906', '哈巴河县', '哈巴河', '新疆,阿勒泰,哈巴河', 'HaBaHe', 86.418621, 48.060846);
INSERT INTO `china_region` VALUES (703950, 2, 654300000000, 654325000000, '836200', '0906', '青河县', '青河', '新疆,阿勒泰,青河', 'QingHe', 90.382961, 46.674205);
INSERT INTO `china_region` VALUES (704021, 2, 654300000000, 654326000000, '836800', '0906', '吉木乃县', '吉木乃', '新疆,阿勒泰,吉木乃', 'JiMuNai', 85.874096, 47.443101);
INSERT INTO `china_region` VALUES (704082, 1, 650000000000, 659000000000, '830000', NULL, '直辖县', '新疆', '新疆', 'XinJiang', 87.627704, 43.793026);
INSERT INTO `china_region` VALUES (704083, 2, 659000000000, 659001000000, '832000', NULL, '石河子市', '石河子', '新疆,石河子', 'ShiHeZi', 86.08046, 44.305428);
INSERT INTO `china_region` VALUES (704229, 2, 659000000000, 659002000000, '843300', NULL, '阿拉尔市', '阿拉尔', '新疆,阿拉尔', 'ALaEr', 81.280527, 40.547653);
INSERT INTO `china_region` VALUES (704562, 2, 659000000000, 659003000000, '844000', NULL, '图木舒克市', '图木舒克', '新疆,图木舒克', 'TuMuShuKe', 79.074089, 39.868968);
INSERT INTO `china_region` VALUES (704695, 2, 659000000000, 659004000000, '831300', NULL, '五家渠市', '五家渠', '新疆,五家渠', 'WuJiaQu', 87.54324, 44.166756);
INSERT INTO `china_region` VALUES (704746, 2, 659000000000, 659006000000, '841007', NULL, '铁门关市', '铁门关', '新疆,铁门关', 'TieMenGuan', 85.669533, 41.8633);
INSERT INTO `china_region` VALUES (704751, 0, 0, 8113135772653, '999077', '00852', '香港特别行政区', '香港', '香港', 'Hong Kong', 114.173355, 22.320048);
INSERT INTO `china_region` VALUES (704752, 1, 8113135772653, 8111559760266, '999077', '00852', '香港岛', '香港岛', '香港,香港岛', 'Hong Kong Island', 114.177314, 22.266416);
INSERT INTO `china_region` VALUES (704753, 2, 8111559760266, 8110849350906, '999077', '00852', '中西区', '中西', '香港,香港岛,中西', 'Central and Western District', 114.154374, 22.281981);
INSERT INTO `china_region` VALUES (704754, 2, 8111559760266, 8111058871125, '999077', '00852', '湾仔区', '湾仔', '香港,香港岛,湾仔', 'Wan Chai District', 114.182915, 22.276389);
INSERT INTO `china_region` VALUES (704755, 2, 8111559760266, 8110237142817, '999077', '00852', '东区', '东区', '香港,香港岛,东区', 'Eastern District', 114.255993, 22.262755);
INSERT INTO `china_region` VALUES (704756, 2, 8111559760266, 8111454515153, '999077', '00852', '南区', '南区', '香港,香港岛,南区', 'Southern District', 114.174134, 22.24676);
INSERT INTO `china_region` VALUES (704757, 1, 8113135772653, 8112837441705, '999077', '00852', '九龙', '九龙', '香港,九龙', 'Kowloon', 114.17495, 22.327115);
INSERT INTO `china_region` VALUES (704758, 2, 8112837441705, 8113104193629, '999077', '00852', '油尖旺区', '油尖旺', '香港,九龙,油尖旺', 'Yau Tsim Mong', 114.173332, 22.311704);
INSERT INTO `china_region` VALUES (704759, 2, 8112837441705, 8111953597377, '999077', '00852', '深水埗区', '深水埗', '香港,九龙,深水埗', 'Sham Shui Po', 114.16721, 22.328171);
INSERT INTO `china_region` VALUES (704760, 2, 8112837441705, 8111617194943, '999077', '00852', '九龙城区', '九龙城', '香港,九龙,九龙城', 'Jiulongcheng', 114.195053, 22.32673);
INSERT INTO `china_region` VALUES (704761, 2, 8112837441705, 8113654523362, '999077', '00852', '黄大仙区', '黄大仙', '香港,九龙,黄大仙', 'Wong Tai Sin', 114.19924, 22.336313);
INSERT INTO `china_region` VALUES (704762, 2, 8112837441705, 8111787956502, '999077', '00852', '观塘区', '观塘', '香港,九龙,观塘', 'Kwun Tong', 114.231268, 22.30943);
INSERT INTO `china_region` VALUES (704763, 1, 8113135772653, 8113591118785, '999077', '00852', '新界', '新界', '香港,新界', 'New Territories', 114.202408, 22.341766);
INSERT INTO `china_region` VALUES (704764, 2, 8113591118785, 8110751011120, '999077', '00852', '荃湾区', '荃湾', '香港,新界,荃湾', 'Tsuen Wan', 114.122952, 22.370973);
INSERT INTO `china_region` VALUES (704765, 2, 8113591118785, 8113729602460, '999077', '00852', '屯门区', '屯门', '香港,新界,屯门', 'Tuen Mun', 113.977416, 22.391047);
INSERT INTO `china_region` VALUES (704766, 2, 8113591118785, 8113594074738, '999077', '00852', '元朗区', '元朗', '香港,新界,元朗', 'Yuen Long', 114.039796, 22.443342);
INSERT INTO `china_region` VALUES (704767, 2, 8113591118785, 8114215533540, '999077', '00852', '北区', '北区', '香港,新界,北区', 'North District', 114.148959, 22.494086);
INSERT INTO `china_region` VALUES (704768, 2, 8113591118785, 8111394999554, '999077', '00852', '大埔区', '大埔', '香港,新界,大埔', 'Tai Po', 114.171743, 22.445653);
INSERT INTO `china_region` VALUES (704769, 2, 8113591118785, 8113369943437, '999077', '00852', '西贡区', '西贡', '香港,新界,西贡', 'Sai Kung', 114.27854, 22.37944);
INSERT INTO `china_region` VALUES (704770, 2, 8113591118785, 8110210010697, '999077', '00852', '沙田区', '沙田', '香港,新界,沙田', 'Sha Tin', 114.191941, 22.379294);
INSERT INTO `china_region` VALUES (704771, 2, 8113591118785, 8112609184078, '999077', '00852', '葵青区', '葵青', '香港,新界,葵青', 'Kwai Tsing', 114.13932, 22.363877);
INSERT INTO `china_region` VALUES (704772, 2, 8113591118785, 8111072191825, '999077', '00852', '离岛区', '离岛', '香港,新界,离岛', 'Outlying Islands', 113.945842, 22.281508);
INSERT INTO `china_region` VALUES (704773, 0, 0, 8212407077174, '999078', '00853', '澳门特别行政区', '澳门', '澳门', 'Macau', 113.54909, 22.198951);
INSERT INTO `china_region` VALUES (704774, 1, 8212407077174, 8211217997835, '999078', '00853', '澳门半岛', '澳门半岛', '澳门,澳门半岛', 'MacauPeninsula', 113.549134, 22.198751);
INSERT INTO `china_region` VALUES (704775, 2, 8211217997835, 8211910163773, '999078', '00853', '花地玛堂区', '花地玛堂', '澳门,澳门半岛,花地玛堂', 'Nossa Senhora de Fatima', 113.552284, 22.208067);
INSERT INTO `china_region` VALUES (704776, 2, 8211217997835, 8213546008961, '999078', '00853', '圣安多尼堂区', '圣安多尼堂', '澳门,澳门半岛,圣安多尼堂', 'Santo Antonio', 113.564301, 22.12381);
INSERT INTO `china_region` VALUES (704777, 2, 8211217997835, 8212597413120, '999078', '00853', '大堂区', '大堂', '澳门,澳门半岛,大堂', 'Sé', 113.552971, 22.188359);
INSERT INTO `china_region` VALUES (704778, 2, 8211217997835, 8211283429206, '999078', '00853', '望德堂区', '望德堂', '澳门,澳门半岛,望德堂', 'Sao Lazaro', 113.550568, 22.194081);
INSERT INTO `china_region` VALUES (704779, 2, 8211217997835, 8212261828673, '999078', '00853', '风顺堂区', '风顺堂', '澳门,澳门半岛,风顺堂', 'Sao Lourenco', 113.541928, 22.187368);
INSERT INTO `china_region` VALUES (704780, 1, 8212407077174, 8210196278099, '999078', '00853', '氹仔岛', '氹仔岛', '澳门,氹仔岛', 'Taipa', 113.577669, 22.156838);
INSERT INTO `china_region` VALUES (704781, 2, 8210196278099, 8211710931118, '999078', '00853', '嘉模堂区', '嘉模堂', '澳门,氹仔岛,嘉模堂', 'Our Lady Of Carmel\'s Parish', 113.565303, 22.149029);
INSERT INTO `china_region` VALUES (704782, 1, 8212407077174, 8213878119597, '999078', '00853', '路环岛', '路环岛', '澳门,路环岛', 'Coloane', 113.564857, 22.116226);
INSERT INTO `china_region` VALUES (704783, 2, 8213878119597, 8213441486846, '999078', '00853', '圣方济各堂区', '圣方济各堂', '澳门,路环岛,圣方济各堂', 'St Francis Xavier\'s Parish', 113.559954, 22.123486);
INSERT INTO `china_region` VALUES (704784, 0, 0, 7112684281636, '0', NULL, '台湾省', '台湾', '台湾', 'Taiwan', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (704785, 1, 7112684281636, 7111363068475, '0', '04', '彰化县', '彰化', '台湾省,彰化', 'Changhua County', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (704786, 2, 7111363068475, 7113029654927, '000528', '04', '芳苑乡', '芳苑', '台湾省,彰化,芳苑', 'Fangyuan Township', 120.355687, 23.943069);
INSERT INTO `china_region` VALUES (705023, 2, 7111363068475, 7111315936918, '000502', '04', '芬园乡', '芬园', '台湾省,彰化,芬园', 'Fenyuan Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (705094, 2, 7111363068475, 7112534267540, '000506', '04', '福兴乡', '福兴', '台湾省,彰化,福兴', 'Fuxing Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (705195, 2, 7111363068475, 7112810715358, '000508', '04', '和美镇', '和美', '台湾省,彰化,和美', 'Hemei Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (705506, 2, 7111363068475, 7113711020646, '000503', '04', '花坛乡', '花坛', '台湾省,彰化,花坛', 'Huatan Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (705638, 2, 7111363068475, 7111619720398, '000505', '04', '鹿港镇', '鹿港', '台湾省,彰化,鹿港', 'Lukang Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (705978, 2, 7111363068475, 7113958736748, '000523', '04', '埤头乡', '埤头', '台湾省,彰化,埤头', 'Pitou Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (706087, 2, 7111363068475, 7110014952242, '000513', '04', '埔心乡', '埔心', '台湾省,彰化,埔心', 'Puxin Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (706250, 2, 7111363068475, 7113282061746, '000516', '04', '埔盐乡', '埔盐', '台湾省,彰化,埔盐', 'Puyan Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (706328, 2, 7111363068475, 7112413406027, '000509', '04', '伸港乡', '伸港', '台湾省,彰化,伸港', 'Shengang Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (706509, 2, 7111363068475, 7112706352853, '000511', '04', '社头乡', '社头', '台湾省,彰化,社头', 'Shetou Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (706671, 2, 7111363068475, 7113838126469, '000522', '04', '田尾乡', '田尾', '台湾省,彰化,田尾', 'Tianwei Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (706764, 2, 7111363068475, 7110401706921, '000520', '04', '田中镇', '田中', '台湾省,彰化,田中', 'Tianzhong Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (706979, 2, 7111363068475, 7111248547941, '000507', '04', '线西乡', '线西', '台湾省,彰化,线西', 'Xianxi Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (707067, 2, 7111363068475, 7113784766690, '000514', '04', '溪湖镇', '溪湖', '台湾省,彰化,溪湖', 'Xihu Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (707387, 2, 7111363068475, 7113042717571, '000504', '04', '秀水乡', '秀水', '台湾省,彰化,秀水', 'Xiushui Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (707554, 2, 7111363068475, 7112272384819, '000524', '04', '溪州乡', '溪州', '台湾省,彰化,溪州', 'Xizhou Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (707812, 2, 7111363068475, 7110045259473, '000512', '04', '永靖乡', '永靖', '台湾省,彰化,永靖', 'Yongjing Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (707955, 2, 7111363068475, 7112235333073, '000510', '04', '员林市', '员林市', '台湾省,彰化,员林市', 'Yuanlin City', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (708288, 2, 7111363068475, 7113942293366, '000525', '04', '竹塘乡', '竹塘', '台湾省,彰化,竹塘', 'Zhutang Township', 120.411516, 23.857407);
INSERT INTO `china_region` VALUES (708367, 2, 7111363068475, 7110561847290, '000521', '04', '北斗镇', '北斗', '台湾省,彰化,北斗', 'Beidou Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (708465, 2, 7111363068475, 7110409668851, '000500', '04', '彰化市', '彰化市', '台湾省,彰化,彰化市', 'Changhua City', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (708877, 2, 7111363068475, 7110750153154, '000527', '04', '大城乡', '大城', '台湾省,彰化,大城', 'Dacheng Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (708983, 2, 7111363068475, 7111703700079, '000515', '04', '大村乡', '大村', '台湾省,彰化,大村', 'Dacun Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (709092, 2, 7111363068475, 7111481999433, '000526', '04', '二林镇', '二林', '台湾省,彰化,二林', 'Erlin Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (709386, 2, 7111363068475, 7112739650211, '000530', '04', '二水乡', '二水', '台湾省,彰化,二水', 'Ershui Township', 120.557479, 24.068523);
INSERT INTO `china_region` VALUES (709478, 1, 7112684281636, 7112735772392, '0', '05', '嘉义市', '嘉义', '台湾省,嘉义', 'Chiayi City', 120.472462, 23.485079);
INSERT INTO `china_region` VALUES (709479, 2, 7112735772392, 7110037031425, '000600', '05', '东区', '东区', '台湾省,嘉义,东区', 'East Dist.', 120.472462, 23.485079);
INSERT INTO `china_region` VALUES (710414, 2, 7112735772392, 7112092163707, '000600', '05', '西区', '西区', '台湾省,嘉义,西区', 'West Dist.', 120.472462, 23.485079);
INSERT INTO `china_region` VALUES (711349, 1, 7112684281636, 7110941525844, '0', '05', '嘉义县', '嘉义', '台湾省,嘉义', 'Chiayi County', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (711350, 2, 7110941525844, 7113215860619, '000605', '05', '阿里山乡', '阿里山', '台湾省,嘉义,阿里山', 'Alishan Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (711375, 2, 7110941525844, 7113757619522, '000625', '05', '布袋镇', '布袋', '台湾省,嘉义,布袋', 'Budai Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (711468, 2, 7110941525844, 7114163684518, '000622', '05', '大林镇', '大林', '台湾省,嘉义,大林', 'Dalin Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (711606, 2, 7110941525844, 7111682524500, '000607', '05', '大埔乡', '大埔', '台湾省,嘉义,大埔', 'Dapu Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (711652, 2, 7110941525844, 7110230792026, '000614', '05', '东石乡', '东石', '台湾省,嘉义,东石', 'Dongshi Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (711708, 2, 7110941525844, 7111244987607, '000602', '05', '番路乡', '番路', '台湾省,嘉义,番路', 'Fanlu Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (711814, 2, 7110941525844, 7110922983469, '000615', '05', '六脚乡', '六脚', '台湾省,嘉义,六脚', 'Liujiao Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (711841, 2, 7110941525844, 7111909284255, '000611', '05', '鹿草乡', '鹿草', '台湾省,嘉义,鹿草', 'Lucao Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (711877, 2, 7110941525844, 7111896625293, '000603', '05', '梅山乡', '梅山', '台湾省,嘉义,梅山', 'Meishan Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (712025, 2, 7110941525844, 7112947314361, '000621', '05', '民雄乡', '民雄', '台湾省,嘉义,民雄', 'Minxiong Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (712202, 2, 7110941525844, 7111257224778, '000613', '05', '朴子市', '朴子市', '台湾省,嘉义,朴子市', 'Puzi City', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (712409, 2, 7110941525844, 7110508004641, '000608', '05', '水上乡', '水上', '台湾省,嘉义,水上', 'Shuishang Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (712516, 2, 7110941525844, 7111319581674, '000612', '05', '太保市', '太保市', '台湾省,嘉义,太保市', 'Taibao City', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (712628, 2, 7110941525844, 7113066224683, '000623', '05', '溪口乡', '溪口', '台湾省,嘉义,溪口', 'Xikou Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (712671, 2, 7110941525844, 7110341339468, '000616', '05', '新港乡', '新港', '台湾省,嘉义,新港', 'Xingang Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (712740, 2, 7110941525844, 7113048933126, '000624', '05', '义竹乡', '义竹', '台湾省,嘉义,义竹', 'Yizhu Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (712777, 2, 7110941525844, 7110021005531, '000606', '05', '中埔乡', '中埔', '台湾省,嘉义,中埔', 'Zhongpu Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (712957, 2, 7110941525844, 7110413539344, '000604', '05', '竹崎乡', '竹崎', '台湾省,嘉义,竹崎', 'Zhuqi Township', 120.624255, 23.434473);
INSERT INTO `china_region` VALUES (713148, 1, 7112684281636, 7110628507899, '0', '03', '新竹市', '新竹', '台湾省,新竹', 'Hsinchu City', 120.990745, 24.784924);
INSERT INTO `china_region` VALUES (713149, 2, 7110628507899, 7113374380901, '000300', '03', '香山区', '香山', '台湾省,新竹,香山', 'Xiangshan Dist.', 120.990745, 24.784924);
INSERT INTO `china_region` VALUES (714141, 2, 7110628507899, 7110696581395, '000300', '03', '东区', '东区', '台湾省,新竹,东区', 'East Dist.', 120.990745, 24.784924);
INSERT INTO `china_region` VALUES (715133, 2, 7110628507899, 7111520630175, '000300', '03', '北区', '北区', '台湾省,新竹,北区', 'North Dist.', 120.990745, 24.784924);
INSERT INTO `china_region` VALUES (716125, 1, 7112684281636, 7110872151750, '0', '03', '新竹县', '新竹', '台湾省,新竹', 'Hsinchu County', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (716126, 2, 7110872151750, 7112678987599, '000315', '03', '峨眉乡', '峨眉', '台湾省,新竹,峨眉', 'Emei Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (716165, 2, 7110872151750, 7111573430796, '000306', '03', '关西镇', '关西', '台湾省,新竹,关西', 'Guanxi Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (716272, 2, 7110872151750, 7111574705058, '000312', '03', '横山乡', '横山', '台湾省,新竹,横山', 'Hengshan Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (716357, 2, 7110872151750, 7113976827405, '000303', '03', '湖口乡', '湖口', '台湾省,新竹,湖口', 'Hukou Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (716691, 2, 7110872151750, 7111103710223, '000313', '03', '尖石乡', '尖石', '台湾省,新竹,尖石', 'Jianshi Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (716770, 2, 7110872151750, 7112592054963, '000307', '03', '芎林乡', '芎林', '台湾省,新竹,芎林', 'Qionglin Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (716894, 2, 7110872151750, 7112185405977, '000311', '03', '五峰乡', '五峰', '台湾省,新竹,五峰', 'Wufeng Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (716929, 2, 7110872151750, 7110804235076, '000304', '03', '新丰乡', '新丰', '台湾省,新竹,新丰', 'Xinfeng Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (717038, 2, 7110872151750, 7113513890282, '000305', '03', '新埔镇', '新埔', '台湾省,新竹,新埔', 'Xinpu Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (717184, 2, 7110872151750, 7113821071164, '000302', '03', '竹北市', '竹北市', '台湾省,新竹,竹北市', 'Zhubei City', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (717803, 2, 7110872151750, 7111130190992, '000310', '03', '竹东镇', '竹东', '台湾省,新竹,竹东', 'Zhudong Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (718002, 2, 7110872151750, 7110441779365, '000308', '03', '宝山乡', '宝山', '台湾省,新竹,宝山', 'Baoshan Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (718165, 2, 7110872151750, 7114250073576, '000314', '03', '北埔乡', '北埔', '台湾省,新竹,北埔', 'Beipu Township', 121.002012, 24.839233);
INSERT INTO `china_region` VALUES (718219, 1, 7112684281636, 7113659713107, '0', '03', '花莲县', '花莲', '台湾省,花莲', 'Hualien County', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (718220, 2, 7113659713107, 7112291897786, '000982', '03', '卓溪乡', '卓溪', '台湾省,花莲,卓溪', 'Zhuoxi Township', 121.187871, 23.387536);
INSERT INTO `china_region` VALUES (718232, 2, 7113659713107, 7111269720420, '000977', '03', '丰滨乡', '丰滨', '台湾省,花莲,丰滨', 'Fengbin Township', 121.493017, 23.577574);
INSERT INTO `china_region` VALUES (718286, 2, 7113659713107, 7113920061679, '000975', '03', '凤林镇', '凤林', '台湾省,花莲,凤林', 'Fenglin Township', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (718441, 2, 7113659713107, 7112845005465, '000983', '03', '富里乡', '富里', '台湾省,花莲,富里', 'Fuli Township', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (718513, 2, 7113659713107, 7110808777926, '000976', '03', '光复乡', '光复', '台湾省,花莲,光复', 'Guangfu Township', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (718622, 2, 7113659713107, 7111078920048, '000970', '03', '花莲市', '花莲市', '台湾省,花莲,花莲市', 'Hualien City', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (719104, 2, 7113659713107, 7112795809852, '000973', '03', '吉安乡', '吉安', '台湾省,花莲,吉安', 'Ji’an Township', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (719606, 2, 7113659713107, 7112573131115, '000978', '03', '瑞穗乡', '瑞穗', '台湾省,花莲,瑞穗', 'Ruisui Township', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (719759, 2, 7113659713107, 7113006661055, '000974', '03', '寿丰乡', '寿丰', '台湾省,花莲,寿丰', 'Shoufeng Township', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (719938, 2, 7113659713107, 7110576136005, '000979', '03', '万荣乡', '万荣', '台湾省,花莲,万荣', 'Wanrong Township', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (719947, 2, 7113659713107, 7112976092157, '000971', '03', '新城乡', '新城', '台湾省,花莲,新城', 'Xincheng Township', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (720076, 2, 7113659713107, 7113030129284, '000972', '03', '秀林乡', '秀林', '台湾省,花莲,秀林', 'Xiulin Township', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (720130, 2, 7113659713107, 7113280769219, '000981', '03', '玉里镇', '玉里', '台湾省,花莲,玉里', 'Yuli Township', 121.59729, 24.000674);
INSERT INTO `china_region` VALUES (720296, 1, 7112684281636, 7112732834600, '0', '07', '高雄市', '高雄', '台湾省,高雄', 'Kaohsiung City', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (720297, 2, 7112732834600, 7110442812242, '000822', '07', '阿莲区', '阿莲', '台湾省,高雄,阿莲', 'Alian Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (720403, 2, 7112732834600, 7110854479560, '000831', '07', '大寮区', '大寮', '台湾省,高雄,大寮', 'Daliao Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (720924, 2, 7112732834600, 7111882320423, '000815', '07', '大社区', '大社', '台湾省,高雄,大社', 'Dashe Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (721072, 2, 7112732834600, 7112234630013, '000840', '07', '大树区', '大树', '台湾省,高雄,大树', 'Dashu Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (721207, 2, 7112732834600, 7111892521830, '000830', '07', '凤山区', '凤山', '台湾省,高雄,凤山', 'Fengshan Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (722409, 2, 7112732834600, 7113120844413, '000820', '07', '冈山区', '冈山', '台湾省,高雄,冈山', 'Gangshan Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (722866, 2, 7112732834600, 7111949885952, '000804', '07', '鼓山区', '鼓山', '台湾省,高雄,鼓山', 'Gushan Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (723069, 2, 7112732834600, 7111010488019, '000829', '07', '湖内区', '湖内', '台湾省,高雄,湖内', 'Hunei Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (723173, 2, 7112732834600, 7112111808978, '000847', '07', '甲仙区', '甲仙', '台湾省,高雄,甲仙', 'Jiaxian Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (723220, 2, 7112732834600, 7110148762668, '000802', '07', '苓雅区', '苓雅', '台湾省,高雄,苓雅', 'Lingya Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (723918, 2, 7112732834600, 7113806860794, '000832', '07', '林园区', '林园', '台湾省,高雄,林园', 'Linyuan Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (724174, 2, 7112732834600, 7113751269460, '000844', '07', '六龟区', '六龟', '台湾省,高雄,六龟', 'Liugui Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (724232, 2, 7112732834600, 7112764079460, '000821', '07', '路竹区', '路竹', '台湾省,高雄,路竹', 'Luzhu Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (724420, 2, 7112732834600, 7112310584071, '000851', '07', '茂林区', '茂林', '台湾省,高雄,茂林', 'Maolin Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (724424, 2, 7112732834600, 7113330974441, '000843', '07', '美浓区', '美浓', '台湾省,高雄,美浓', 'Meinong Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (724592, 2, 7112732834600, 7113514449468, '000827', '07', '弥陀区', '弥陀', '台湾省,高雄,弥陀', 'Mituo Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (724738, 2, 7112732834600, 7110030028354, '000849', '07', '那玛夏区', '那玛夏区', '台湾省,高雄,那玛夏区', 'Namaxia Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (724746, 2, 7112732834600, 7114032618918, '000811', '07', '楠梓区', '楠梓', '台湾省,高雄,楠梓', 'Nanzi Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (725382, 2, 7112732834600, 7110878798209, '000845', '07', '内门区', '内门', '台湾省,高雄,内门', 'Neimen Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (725473, 2, 7112732834600, 7113834246005, '000833', '07', '鸟松区', '鸟松', '台湾省,高雄,鸟松', 'Niaosong Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (725748, 2, 7112732834600, 7113870065844, '000801', '07', '前金区', '前金', '台湾省,高雄,前金', 'Qianjin Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (725956, 2, 7112732834600, 7110966248440, '000806', '07', '前镇区', '前镇', '台湾省,高雄,前镇', 'Qianzhen Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (726622, 2, 7112732834600, 7110082497085, '000825', '07', '桥头区', '桥头', '台湾省,高雄,桥头', 'Qiaotou Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (727031, 2, 7112732834600, 7113596110646, '000852', '07', '茄萣区', '茄萣', '台湾省,高雄,茄萣', 'Qieding Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (727140, 2, 7112732834600, 7111678115205, '000805', '07', '旗津区', '旗津', '台湾省,高雄,旗津', 'Qijin Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (727206, 2, 7112732834600, 7110639291258, '000842', '07', '旗山区', '旗山', '台湾省,高雄,旗山', 'Qishan Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (727430, 2, 7112732834600, 7110851493721, '000814', '07', '仁武区', '仁武', '台湾省,高雄,仁武', 'Renwu Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (727893, 2, 7112732834600, 7113271135379, '000807', '07', '三民区', '三民', '台湾省,高雄,三民', 'Sanmin Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (729091, 2, 7112732834600, 7110650845235, '000846', '07', '杉林区', '杉林', '台湾省,高雄,杉林', 'Shanlin Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (729137, 2, 7112732834600, 7112395895808, '000848', '07', '桃源区', '桃源', '台湾省,高雄,桃源', 'Taoyuan Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (729158, 2, 7112732834600, 7112476413954, '000823', '07', '田寮区', '田寮', '台湾省,高雄,田寮', 'Tianliao Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (729234, 2, 7112732834600, 7112628800216, '000812', '07', '小港区', '小港', '台湾省,高雄,小港', 'Xiaogang Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (729910, 2, 7112732834600, 7112421692560, '000800', '07', '新兴区', '新兴', '台湾省,高雄,新兴', 'Xinxing Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (730157, 2, 7112732834600, 7110974548312, '000824', '07', '燕巢区', '燕巢', '台湾省,高雄,燕巢', 'Yanchao Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (730334, 2, 7112732834600, 7111621695789, '000803', '07', '盐埕区', '盐埕', '台湾省,高雄,盐埕', 'Yancheng Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (730408, 2, 7112732834600, 7110450605384, '000828', '07', '永安区', '永安', '台湾省,高雄,永安', 'Yong’an Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (730468, 2, 7112732834600, 7111611309039, '000826', '07', '梓官区', '梓官', '台湾省,高雄,梓官', 'Ziguan Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (730580, 2, 7112732834600, 7113125127243, '000813', '07', '左营区', '左营', '台湾省,高雄,左营', 'Zuoying Dist.', 120.306839, 22.630576);
INSERT INTO `china_region` VALUES (731605, 1, 7112684281636, 7114088135938, '0', '02', '基隆市', '基隆', '台湾省,基隆', 'Keelung City', 121.741526, 25.122105);
INSERT INTO `china_region` VALUES (731606, 2, 7114088135938, 7111582018734, '000204', '02', '安乐区', '安乐', '台湾省,基隆,安乐', 'Anle Dist.', 121.741526, 25.122105);
INSERT INTO `china_region` VALUES (731671, 2, 7114088135938, 7110515585760, '000205', '02', '暖暖区', '暖暖', '台湾省,基隆,暖暖', 'Nuannuan Dist.', 121.741526, 25.122105);
INSERT INTO `china_region` VALUES (731710, 2, 7114088135938, 7111871222944, '000206', '02', '七堵区', '七堵', '台湾省,基隆,七堵', 'Qidu Dist.', 121.741526, 25.122105);
INSERT INTO `china_region` VALUES (731809, 2, 7114088135938, 7114257038265, '000200', '02', '仁爱区', '仁爱', '台湾省,基隆,仁爱', 'Ren’ai Dist.', 121.741526, 25.122105);
INSERT INTO `china_region` VALUES (731895, 2, 7114088135938, 7112793206978, '000201', '02', '信义区', '信义', '台湾省,基隆,信义', 'Xinyi Dist.', 121.741526, 25.122105);
INSERT INTO `china_region` VALUES (731985, 2, 7114088135938, 7110254483509, '000203', '02', '中山区', '中山', '台湾省,基隆,中山', 'Zhongshan Dist.', 121.741526, 25.122105);
INSERT INTO `china_region` VALUES (732034, 2, 7114088135938, 7110480594410, '000202', '02', '中正区', '中正', '台湾省,基隆,中正', 'Zhongzheng Dist.', 121.741526, 25.122105);
INSERT INTO `china_region` VALUES (732114, 1, 7112684281636, 7113169128457, '0', '082', '金门县', '金门', '台湾省,金门', 'Kinmen County', 118.32277, 24.42931);
INSERT INTO `china_region` VALUES (732115, 2, 7113169128457, 7110682433541, '000893', '082', '金城镇', '金城', '台湾省,金门,金城', 'Jincheng Township', 118.32277, 24.42931);
INSERT INTO `china_region` VALUES (732195, 2, 7113169128457, 7113985354131, '000891', '082', '金湖镇', '金湖', '台湾省,金门,金湖', 'Jinhu Township', 118.32277, 24.42931);
INSERT INTO `china_region` VALUES (732311, 2, 7113169128457, 7111648043199, '000892', '082', '金宁乡', '金宁', '台湾省,金门,金宁', 'Jinning Township', 118.32277, 24.42931);
INSERT INTO `china_region` VALUES (732374, 2, 7113169128457, 7111025195083, '000890', '082', '金沙镇', '金沙', '台湾省,金门,金沙', 'Jinsha Township', 118.32277, 24.42931);
INSERT INTO `china_region` VALUES (732467, 2, 7113169128457, 7112187596712, '000894', '082', '烈屿乡', '烈屿', '台湾省,金门,烈屿', 'Lieyu Township', 118.32277, 24.42931);
INSERT INTO `china_region` VALUES (732502, 2, 7113169128457, 7113738253740, '000896', '082', '乌坵乡', '乌坵', '台湾省,金门,乌坵', 'Wuqiu Township', 118.32277, 24.42931);
INSERT INTO `china_region` VALUES (732505, 1, 7112684281636, 7113494932062, '0', '0836', '连江县', '连江', '台湾省,连江', 'Lienchiang County', 119.53957, 26.19753);
INSERT INTO `china_region` VALUES (732506, 2, 7113494932062, 7112940359462, '000210', '0836', '北竿乡', '北竿', '台湾省,连江,北竿', 'Beigan Township', 119.53957, 26.19753);
INSERT INTO `china_region` VALUES (732513, 2, 7113494932062, 7114021569284, '000212', '0836', '东引乡', '东引', '台湾省,连江,东引', 'Dongyin Township', 119.53957, 26.19753);
INSERT INTO `china_region` VALUES (732516, 2, 7113494932062, 7113496040244, '000211', '0836', '莒光乡', '莒光', '台湾省,连江,莒光', 'Juguang Township', 119.53957, 26.19753);
INSERT INTO `china_region` VALUES (732522, 2, 7113494932062, 7111526030900, '000209', '0836', '南竿乡', '南竿', '台湾省,连江,南竿', 'Nangan Township', 119.53957, 26.19753);
INSERT INTO `china_region` VALUES (732532, 1, 7112684281636, 7110006260735, '0', '037', '苗栗县', '苗栗', '台湾省,苗栗', 'Miaoli County', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (732533, 2, 7110006260735, 7113090723079, '000362', '037', '头屋乡', '头屋', '台湾省,苗栗,头屋', 'Touwu Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (732571, 2, 7110006260735, 7111741089814, '000368', '037', '西湖乡', '西湖', '台湾省,苗栗,西湖', 'Xihu Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (732631, 2, 7110006260735, 7110930268412, '000358', '037', '苑里镇', '苑里', '台湾省,苗栗,苑里', 'Yuanli Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (732738, 2, 7110006260735, 7114158854562, '000361', '037', '造桥乡', '造桥', '台湾省,苗栗,造桥', 'Zaoqiao Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (732844, 2, 7110006260735, 7110496316451, '000350', '037', '竹南镇', '竹南', '台湾省,苗栗,竹南', 'Zhunan Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (733190, 2, 7110006260735, 7112567153277, '000369', '037', '卓兰镇', '卓兰', '台湾省,苗栗,卓兰', 'Zhuolan Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (733303, 2, 7110006260735, 7111643313346, '000364', '037', '大湖乡', '大湖', '台湾省,苗栗,大湖', 'Dahu Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (733405, 2, 7110006260735, 7110278918396, '000363', '037', '公馆乡', '公馆', '台湾省,苗栗,公馆', 'Gongguan Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (733540, 2, 7110006260735, 7113307677160, '000356', '037', '后龙镇', '后龙', '台湾省,苗栗,后龙', 'Houlong Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (733755, 2, 7110006260735, 7110850522682, '000360', '037', '苗栗市', '苗栗市', '台湾省,苗栗,苗栗市', 'Miaoli City', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (734181, 2, 7110006260735, 7112661147856, '000353', '037', '南庄乡', '南庄', '台湾省,苗栗,南庄', 'Nanzhuang Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (734274, 2, 7110006260735, 7110599839409, '000352', '037', '三湾乡', '三湾', '台湾省,苗栗,三湾', 'Sanwan Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (734343, 2, 7110006260735, 7113421299737, '000367', '037', '三义乡', '三义', '台湾省,苗栗,三义', 'Sanyi Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (734399, 2, 7110006260735, 7111067966049, '000354', '037', '狮潭乡', '狮潭', '台湾省,苗栗,狮潭', 'Shitan Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (734459, 2, 7110006260735, 7110573241516, '000365', '037', '泰安乡', '泰安', '台湾省,苗栗,泰安', 'Tai’an Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (734493, 2, 7110006260735, 7111326135667, '000366', '037', '铜锣乡', '铜锣', '台湾省,苗栗,铜锣', 'Tongluo Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (734622, 2, 7110006260735, 7111251395217, '000357', '037', '通霄镇', '通霄', '台湾省,苗栗,通霄', 'Tongxiao Township', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (734715, 2, 7110006260735, 7113551665432, '000351', '037', '头份市', '头份市', '台湾省,苗栗,头份市', 'Toufen City', 120.884337, 24.696762);
INSERT INTO `china_region` VALUES (735134, 1, 7112684281636, 7112569630609, '0', NULL, '南海岛', '南海岛', '台湾省,南海岛', 'Nanhai Islands', 118.847309, 28.957092);
INSERT INTO `china_region` VALUES (735135, 2, 7112569630609, 7112535892745, '000817', NULL, '东沙群岛', '东沙群岛', '台湾省,南海岛,东沙群岛', 'Dongsha Islands', 118.847309, 28.957092);
INSERT INTO `china_region` VALUES (735137, 2, 7112569630609, 7110256214197, '000819', NULL, '南沙群岛', '南沙群岛', '台湾省,南海岛,南沙群岛', 'Nansha Islands', 118.847309, 28.957092);
INSERT INTO `china_region` VALUES (735139, 1, 7112684281636, 7113286391187, '0', '049', '南投县', '南投', '台湾省,南投', 'Nantou County', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (735140, 2, 7113286391187, 7113272562316, '000542', '049', '草屯镇', '草屯', '台湾省,南投,草屯', 'Caotun Township', 120.744932, 23.983402);
INSERT INTO `china_region` VALUES (735427, 2, 7113286391187, 7111164549046, '000544', '049', '国姓乡', '国姓', '台湾省,南投,国姓', 'Guoxing Township', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (735557, 2, 7113286391187, 7113790607472, '000552', '049', '集集镇', '集集', '台湾省,南投,集集', 'Jiji Township', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (735676, 2, 7113286391187, 7111585584227, '000558', '049', '鹿谷乡', '鹿谷', '台湾省,南投,鹿谷', 'Lugu Township', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (735804, 2, 7113286391187, 7111578156950, '000551', '049', '名间乡', '名间', '台湾省,南投,名间', 'Mingjian Township', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (735921, 2, 7113286391187, 7113244194435, '000540', '049', '南投市', '南投市', '台湾省,南投,南投市', 'Nantou City', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (736292, 2, 7113286391187, 7110080082251, '000545', '049', '埔里镇', '埔里', '台湾省,南投,埔里', 'Puli Township', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (736825, 2, 7113286391187, 7111416005546, '000546', '049', '仁爱乡', '仁爱', '台湾省,南投,仁爱', 'Ren’ai Township', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (736914, 2, 7113286391187, 7113176935601, '000553', '049', '水里乡', '水里', '台湾省,南投,水里', 'Shuili Township', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (737089, 2, 7113286391187, 7110564612001, '000556', '049', '信义乡', '信义', '台湾省,南投,信义', 'Xinyi Township', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (737150, 2, 7113286391187, 7113144026449, '000555', '049', '鱼池乡', '鱼池', '台湾省,南投,鱼池', 'Yuchi Township', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (737229, 2, 7113286391187, 7111390772412, '000541', '049', '中寮乡', '中寮', '台湾省,南投,中寮', 'Zhongliao Township', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (737318, 2, 7113286391187, 7111254583746, '000557', '049', '竹山镇', '竹山', '台湾省,南投,竹山', 'Zhushan Township', 120.670008, 23.919619);
INSERT INTO `china_region` VALUES (737632, 1, 7112684281636, 7113431434442, '0', '02', '新北市', '新北', '台湾省,新北', 'New Taipei City', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (737633, 2, 7113431434442, 7113923358308, '000249', '02', '八里区', '八里', '台湾省,新北,八里', 'Bali Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (737821, 2, 7113431434442, 7111771832497, '000220', '02', '板桥区', '板桥', '台湾省,新北,板桥', 'Banqiao Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (738791, 2, 7113431434442, 7111425042493, '000228', '02', '贡寮区', '贡寮', '台湾省,新北,贡寮', 'Gongliao Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (738883, 2, 7113431434442, 7114081319753, '000208', '02', '金山区', '金山', '台湾省,新北,金山', 'Jinshan Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (738993, 2, 7113431434442, 7112372513861, '000244', '02', '林口区', '林口', '台湾省,新北,林口', 'Linkou Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (739151, 2, 7113431434442, 7112829435547, '000247', '02', '芦洲区', '芦洲', '台湾省,新北,芦洲', 'Luzhou Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (739282, 2, 7113431434442, 7110433327131, '000232', '02', '坪林区', '坪林', '台湾省,新北,坪林', 'Pinglin Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (739344, 2, 7113431434442, 7113789165732, '000226', '02', '平溪区', '平溪', '台湾省,新北,平溪', 'Pingxi Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (739402, 2, 7113431434442, 7114214236107, '000224', '02', '瑞芳区', '瑞芳', '台湾省,新北,瑞芳', 'Ruifang Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (739558, 2, 7113431434442, 7113771102767, '000241', '02', '三重区', '三重', '台湾省,新北,三重', 'Sanchong Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (740582, 2, 7113431434442, 7114252931370, '000237', '02', '三峡区', '三峡', '台湾省,新北,三峡', 'Sanxia Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (740795, 2, 7113431434442, 7113213044942, '000252', '02', '三芝区', '三芝', '台湾省,新北,三芝', 'Sanzhi Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (740907, 2, 7113431434442, 7113001833072, '000222', '02', '深坑区', '深坑', '台湾省,新北,深坑', 'Shenkeng Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (740976, 2, 7113431434442, 7110998316149, '000223', '02', '石碇区', '石碇', '台湾省,新北,石碇', 'Shiding Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (741060, 2, 7113431434442, 7113349256604, '000253', '02', '石门区', '石门', '台湾省,新北,石门', 'Shimen Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (741108, 2, 7113431434442, 7113954389053, '000227', '02', '双溪区', '双溪', '台湾省,新北,双溪', 'Shuangxi Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (741209, 2, 7113431434442, 7112471900743, '000238', '02', '树林区', '树林', '台湾省,新北,树林', 'Shulin Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (741385, 2, 7113431434442, 7111754815224, '000243', '02', '泰山区', '泰山', '台湾省,新北,泰山', 'Taishan Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (741541, 2, 7113431434442, 7110626987335, '000251', '02', '淡水区', '淡水', '台湾省,新北,淡水', 'Tamsui Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (741889, 2, 7113431434442, 7111688526270, '000236', '02', '土城区', '土城', '台湾省,新北,土城', 'Tucheng Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (742159, 2, 7113431434442, 7113356776637, '000207', '02', '万里区', '万里', '台湾省,新北,万里', 'Wanli Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (742256, 2, 7113431434442, 7114210665677, '000248', '02', '五股区', '五股', '台湾省,新北,五股', 'Wugu Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (742429, 2, 7113431434442, 7112911886155, '000233', '02', '乌来区', '乌来', '台湾省,新北,乌来', 'Wulai Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (742473, 2, 7113431434442, 7111425195301, '000231', '02', '新店区', '新店', '台湾省,新北,新店', 'Xindian Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (743230, 2, 7113431434442, 7110001670951, '000242', '02', '新庄区', '新庄', '台湾省,新北,新庄', 'Xinzhuang Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (743715, 2, 7113431434442, 7113098932372, '000221', '02', '汐止区', '汐止', '台湾省,新北,汐止', 'Xizhi Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (744003, 2, 7113431434442, 7110991500953, '000239', '02', '莺歌区', '莺歌', '台湾省,新北,莺歌', 'Yingge Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (744248, 2, 7113431434442, 7110409446666, '000234', '02', '永和区', '永和', '台湾省,新北,永和', 'Yonghe Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (744565, 2, 7113431434442, 7113000372875, '000235', '02', '中和区', '中和', '台湾省,新北,中和', 'Zhonghe Dist.', 121.663675, 25.1853);
INSERT INTO `china_region` VALUES (745154, 1, 7112684281636, 7111448320652, '0', '06', '澎湖县', '澎湖', '台湾省,澎湖', 'Penghu County', 119.58457, 23.552351);
INSERT INTO `china_region` VALUES (745155, 2, 7111448320652, 7111422361597, '000884', '06', '白沙乡', '白沙', '台湾省,澎湖,白沙', 'Baisha Township', 119.58457, 23.552351);
INSERT INTO `china_region` VALUES (745179, 2, 7111448320652, 7111733498769, '000885', '06', '湖西乡', '湖西', '台湾省,澎湖,湖西', 'Huxi Township', 119.635245, 23.581998);
INSERT INTO `china_region` VALUES (745205, 2, 7111448320652, 7112039636647, '000880', '06', '马公市', '马公市', '台湾省,澎湖,马公市', 'Magong City', 119.58457, 23.552351);
INSERT INTO `china_region` VALUES (745403, 2, 7111448320652, 7111974023393, '000883', '06', '七美乡', '七美', '台湾省,澎湖,七美', 'Qimei Township', 119.58457, 23.552351);
INSERT INTO `china_region` VALUES (745428, 2, 7111448320652, 7112512381669, '000882', '06', '望安乡', '望安', '台湾省,澎湖,望安', 'Wang’an Township', 119.58457, 23.552351);
INSERT INTO `china_region` VALUES (745438, 2, 7111448320652, 7112453348952, '000881', '06', '西屿乡', '西屿', '台湾省,澎湖,西屿', 'Xiyu Township', 119.58457, 23.552351);
INSERT INTO `china_region` VALUES (745455, 1, 7112684281636, 7113368433646, '0', '08', '屏东县', '屏东', '台湾省,屏东', 'Pingtung County', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (745456, 2, 7113368433646, 7110673608588, '000901', '08', '三地门乡', '三地门', '台湾省,屏东,三地门', 'Sandimen Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (745487, 2, 7113368433646, 7111613600521, '000943', '08', '狮子乡', '狮子', '台湾省,屏东,狮子', 'Shizi Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (745509, 2, 7113368433646, 7112185106599, '000921', '08', '泰武乡', '泰武', '台湾省,屏东,泰武', 'Taiwu Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (745532, 2, 7113368433646, 7111623602338, '000913', '08', '万丹乡', '万丹', '台湾省,屏东,万丹', 'Wandan Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (745920, 2, 7113368433646, 7110803119647, '000923', '08', '万峦乡', '万峦', '台湾省,屏东,万峦', 'Wanluan Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (745989, 2, 7113368433646, 7112411480260, '000902', '08', '雾台乡', '雾台', '台湾省,屏东,雾台', 'Wutai Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (746012, 2, 7113368433646, 7112204640682, '000925', '08', '新埤乡', '新埤', '台湾省,屏东,新埤', 'Xinpi Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (746064, 2, 7113368433646, 7111931638604, '000932', '08', '新园乡', '新园', '台湾省,屏东,新园', 'Xinyuan Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (746208, 2, 7113368433646, 7113785859329, '000907', '08', '盐埔乡', '盐埔', '台湾省,屏东,盐埔', 'Yanpu Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (746323, 2, 7113368433646, 7111483532768, '000911', '08', '竹田乡', '竹田', '台湾省,屏东,竹田', 'Zhutian Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (746413, 2, 7113368433646, 7111541287570, '000908', '08', '长治乡', '长治', '台湾省,屏东,长治', 'Changzhi Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (746564, 2, 7113368433646, 7110452236011, '000920', '08', '潮州镇', '潮州', '台湾省,屏东,潮州', 'Chaozhou Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (746955, 2, 7113368433646, 7111603943886, '000944', '08', '车城乡', '车城', '台湾省,屏东,车城', 'Checheng Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (746999, 2, 7113368433646, 7113368589186, '000942', '08', '春日乡', '春日', '台湾省,屏东,春日', 'Chunri Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (747008, 2, 7113368433646, 7113333527751, '000928', '08', '东港镇', '东港', '台湾省,屏东,东港', 'Donggang Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (747205, 2, 7113368433646, 7110673728084, '000940', '08', '枋寮乡', '枋寮', '台湾省,屏东,枋寮', 'Fangliao Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (747350, 2, 7113368433646, 7111182169114, '000941', '08', '枋山乡', '枋山', '台湾省,屏东,枋山', 'Fangshan Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (747371, 2, 7113368433646, 7113000912039, '000906', '08', '高树乡', '高树', '台湾省,屏东,高树', 'Gaoshu Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (747545, 2, 7113368433646, 7112026670184, '000946', '08', '恆春镇', '恆春', '台湾省,屏东,恆春', 'Hengchun Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (747690, 2, 7113368433646, 7110288010220, '000931', '08', '佳冬乡', '佳冬', '台湾省,屏东,佳冬', 'Jiadong Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (747800, 2, 7113368433646, 7112022169923, '000904', '08', '九如乡', '九如', '台湾省,屏东,九如', 'Jiuru Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (747905, 2, 7113368433646, 7112654539145, '000924', '08', '崁顶乡', '崁顶', '台湾省,屏东,崁顶', 'Kanding Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (747957, 2, 7113368433646, 7112047958373, '000922', '08', '来义乡', '来义', '台湾省,屏东,来义', 'Laiyi Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (747978, 2, 7113368433646, 7113493910470, '000905', '08', '里港乡', '里港', '台湾省,屏东,里港', 'Ligang Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (748055, 2, 7113368433646, 7111118835261, '000927', '08', '林边乡', '林边', '台湾省,屏东,林边', 'Linbian Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (748106, 2, 7113368433646, 7112025956296, '000909', '08', '麟洛乡', '麟洛', '台湾省,屏东,麟洛', 'Linluo Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (748185, 2, 7113368433646, 7113726005446, '000929', '08', '琉球乡', '琉球', '台湾省,屏东,琉球', 'Liuqiu Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (748227, 2, 7113368433646, 7113049350399, '000903', '08', '玛家乡', '玛家', '台湾省,屏东,玛家', 'Majia Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (748243, 2, 7113368433646, 7112274789829, '000947', '08', '满州乡', '满州', '台湾省,屏东,满州', 'Manzhou Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (748291, 2, 7113368433646, 7110163210560, '000945', '08', '牡丹乡', '牡丹', '台湾省,屏东,牡丹', 'Mudan Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (748304, 2, 7113368433646, 7110340425038, '000926', '08', '南州乡', '南州', '台湾省,屏东,南州', 'Nanzhou Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (748351, 2, 7113368433646, 7110408368149, '000912', '08', '内埔乡', '内埔', '台湾省,屏东,内埔', 'Neipu Township', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (748721, 2, 7113368433646, 7112033082470, '000900', '08', '屏东市', '屏东市', '台湾省,屏东,屏东市', 'Pingtung City', 120.492005, 22.666716);
INSERT INTO `china_region` VALUES (749726, 1, 7112684281636, 7113392594310, '0', '04', '台中市', '台中', '台湾省,台中', 'Taichung City', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (749727, 2, 7113392594310, 7111961823849, '000435', '04', '梧栖区', '梧栖', '台湾省,台中,梧栖', 'Wuqi Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (750002, 2, 7113392594310, 7111192114038, '000414', '04', '乌日区', '乌日', '台湾省,台中,乌日', 'Wuri Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (750406, 2, 7113392594310, 7111266391560, '000426', '04', '新社区', '新社', '台湾省,台中,新社', 'Xinshe Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (750509, 2, 7113392594310, 7110433957784, '000407', '04', '西屯区', '西屯', '台湾省,台中,西屯', 'Xitun Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (751428, 2, 7113392594310, 7111788704085, '000406', '04', '北屯区', '北屯', '台湾省,台中,北屯', 'Beitun Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (752461, 2, 7113392594310, 7110428413866, '000400', '04', '中区', '中区', '台湾省,台中,中区', 'Central Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (752540, 2, 7113392594310, 7113170853902, '000432', '04', '大肚区', '大肚', '台湾省,台中,大肚', 'Dadu Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (752691, 2, 7113392594310, 7114224541064, '000437', '04', '大甲区', '大甲', '台湾省,台中,大甲', 'Dajia Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (752992, 2, 7113392594310, 7112900860127, '000412', '04', '大里区', '大里', '台湾省,台中,大里', 'Dali Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (753649, 2, 7113392594310, 7113791537826, '000428', '04', '大雅区', '大雅', '台湾省,台中,大雅', 'Daya Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (754019, 2, 7113392594310, 7112574153315, '000439', '04', '大安区', '大安', '台湾省,台中,大安', 'Da’an Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (754114, 2, 7113392594310, 7113593752472, '000423', '04', '东势区', '东势', '台湾省,台中,东势', 'Dongshi Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (754308, 2, 7113392594310, 7110506304237, '000401', '04', '东区', '东区', '台湾省,台中,东区', 'East Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (754616, 2, 7113392594310, 7112223091798, '000420', '04', '丰原区', '丰原', '台湾省,台中,丰原', 'Fengyuan Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (755048, 2, 7113392594310, 7110812416171, '000424', '04', '和平区', '和平', '台湾省,台中,和平', 'Heping Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (755143, 2, 7113392594310, 7111022797594, '000421', '04', '后里区', '后里', '台湾省,台中,后里', 'Houli Dist.', 120.726206, 24.31981);
INSERT INTO `china_region` VALUES (755459, 2, 7113392594310, 7110365173176, '000434', '04', '龙井区', '龙井', '台湾省,台中,龙井', 'Longjing Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (755665, 2, 7113392594310, 7111228143444, '000408', '04', '南屯区', '南屯', '台湾省,台中,南屯', 'Nantun Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (756647, 2, 7113392594310, 7113629563797, '000404', '04', '北区', '北区', '台湾省,台中,北区', 'North Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (757348, 2, 7113392594310, 7112266298763, '000436', '04', '清水区', '清水', '台湾省,台中,清水', 'Qingshui Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (757715, 2, 7113392594310, 7112272339853, '000433', '04', '沙鹿区', '沙鹿', '台湾省,台中,沙鹿', 'Shalu Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (758049, 2, 7113392594310, 7110312292837, '000429', '04', '神冈区', '神冈', '台湾省,台中,神冈', 'Shengang Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (758251, 2, 7113392594310, 7112473998959, '000422', '04', '石冈区', '石冈', '台湾省,台中,石冈', 'Shigang Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (758354, 2, 7113392594310, 7111990754425, '000402', '04', '南区', '南区', '台湾省,台中,南区', 'South Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (758821, 2, 7113392594310, 7112644293763, '000411', '04', '太平区', '太平', '台湾省,台中,太平', 'Taiping Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (759362, 2, 7113392594310, 7112849767928, '000427', '04', '潭子区', '潭子', '台湾省,台中,潭子', 'Tanzi Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (759748, 2, 7113392594310, 7111852125909, '000438', '04', '外埔区', '外埔', '台湾省,台中,外埔', 'Waipu Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (759831, 2, 7113392594310, 7110609368636, '000403', '04', '西区', '西区', '台湾省,台中,西区', 'West Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (760355, 2, 7113392594310, 7111032595476, '000413', '04', '雾峰区', '雾峰', '台湾省,台中,雾峰', 'Wufeng Dist.', 120.679882, 24.143171);
INSERT INTO `china_region` VALUES (760581, 1, 7112684281636, 7111810508871, '0', '06', '台南市', '台南', '台湾省,台南', 'Tainan City', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (760582, 2, 7111810508871, 7114027878727, '000722', '06', '佳里区', '佳里', '台湾省,台南,佳里', 'Jiali Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (760707, 2, 7111810508871, 7111001272307, '000725', '06', '将军区', '将军', '台湾省,台南,将军', 'Jiangjun Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (760735, 2, 7111810508871, 7113632079281, '000734', '06', '六甲区', '六甲', '台湾省,台南,六甲', 'Liujia Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (760802, 2, 7111810508871, 7111839708068, '000736', '06', '柳营区', '柳营', '台湾省,台南,柳营', 'Liuying Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (760932, 2, 7111810508871, 7111172661130, '000719', '06', '龙崎区', '龙崎', '台湾省,台南,龙崎', 'Longqi Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (760977, 2, 7111810508871, 7113515759399, '000721', '06', '麻豆区', '麻豆', '台湾省,台南,麻豆', 'Madou Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (761070, 2, 7111810508871, 7112825699332, '000716', '06', '南化区', '南化', '台湾省,台南,南化', 'Nanhua Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (761081, 2, 7111810508871, 7113542128882, '000715', '06', '楠西区', '楠西', '台湾省,台南,楠西', 'Nanxi Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (761126, 2, 7111810508871, 7111427228230, '000704', '06', '北区', '北区', '台湾省,台南,北区', 'North Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (761297, 2, 7111810508871, 7113013849771, '000724', '06', '七股区', '七股', '台湾省,台南,七股', 'Qigu Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (761324, 2, 7111810508871, 7110750170794, '000717', '06', '仁德区', '仁德', '台湾省,台南,仁德', 'Rende Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (761606, 2, 7111810508871, 7112135487021, '000741', '06', '善化区', '善化', '台湾省,台南,善化', 'Shanhua Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (761736, 2, 7111810508871, 7113250769247, '000743', '06', '山上区', '山上', '台湾省,台南,山上', 'Shanshang Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (761752, 2, 7111810508871, 7113460008268, '000702', '06', '南区', '南区', '台湾省,台南,南区', 'South Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (761981, 2, 7111810508871, 7113133167182, '000700', '06', '中西区', '中西', '台湾省,台南,中西', 'West Central Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (762245, 2, 7111810508871, 7112794494611, '000735', '06', '下营区', '下营', '台湾省,台南,下营', 'Xiaying Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (762344, 2, 7111810508871, 7113139115312, '000723', '06', '西港区', '西港', '台湾省,台南,西港', 'Xigang Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (762381, 2, 7111810508871, 7111053011981, '000712', '06', '新化区', '新化', '台湾省,台南,新化', 'Xinhua Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (762432, 2, 7111810508871, 7111691033451, '000744', '06', '新市区', '新市', '台湾省,台南,新市', 'Xinshi Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (762546, 2, 7111810508871, 7111363581116, '000730', '06', '新营区', '新营', '台湾省,台南,新营', 'Xinying Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (762786, 2, 7111810508871, 7111890149444, '000726', '06', '学甲区', '学甲', '台湾省,台南,学甲', 'Xuejia Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (762887, 2, 7111810508871, 7111524545902, '000737', '06', '盐水区', '盐水', '台湾省,台南,盐水', 'Yanshui Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (763003, 2, 7111810508871, 7110938451256, '000710', '06', '永康区', '永康', '台湾省,台南,永康', 'Yongkang Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (763559, 2, 7111810508871, 7110735633341, '000714', '06', '玉井区', '玉井', '台湾省,台南,玉井', 'Yujing Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (763633, 2, 7111810508871, 7113193852321, '000713', '06', '左镇区', '左镇', '台湾省,台南,左镇', 'Zuozhen Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (763644, 2, 7111810508871, 7111754691450, '000745', '06', '安定区', '安定', '台湾省,台南,安定', 'Anding Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (763674, 2, 7111810508871, 7110212004934, '000709', '06', '安南区', '安南', '台湾省,台南,安南', 'Annan Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (764148, 2, 7111810508871, 7110518938247, '000708', '06', '安平区', '安平', '台湾省,台南,安平', 'Anping Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (764304, 2, 7111810508871, 7110802109976, '000732', '06', '白河区', '白河', '台湾省,台南,白河', 'Baihe Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (764465, 2, 7111810508871, 7111146539742, '000727', '06', '北门区', '北门', '台湾省,台南,北门', 'Beimen Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (764485, 2, 7111810508871, 7113274722429, '000742', '06', '大内区', '大内', '台湾省,台南,大内', 'Danei Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (764506, 2, 7111810508871, 7113947342815, '000733', '06', '东山区', '东山', '台湾省,台南,东山', 'Dongshan Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (764587, 2, 7111810508871, 7113629942344, '000701', '06', '东区', '东区', '台湾省,台南,东区', 'East Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (764906, 2, 7111810508871, 7114084817045, '000718', '06', '关庙区', '关庙', '台湾省,台南,关庙', 'Guanmiao Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (765094, 2, 7111810508871, 7110501288095, '000720', '06', '官田区', '官田', '台湾省,台南,官田', 'Guantian Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (765171, 2, 7111810508871, 7110600348720, '000711', '06', '归仁区', '归仁', '台湾省,台南,归仁', 'Guiren Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (765470, 2, 7111810508871, 7110584299310, '000731', '06', '后壁区', '后壁', '台湾省,台南,后壁', 'Houbi Dist.', 120.187817, 22.998601);
INSERT INTO `china_region` VALUES (765503, 1, 7112684281636, 7111135835616, '0', '02', '台北市', '台北', '台湾省,台北', 'Taipei City', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (765504, 2, 7111135835616, 7110744762729, '000112', '02', '北投区', '北投', '台湾省,台北,北投', 'Beitou Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (765791, 2, 7111135835616, 7113675966616, '000103', '02', '大同区', '大同', '台湾省,台北,大同', 'Datong Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (766140, 2, 7111135835616, 7110800164585, '000106', '02', '大安区', '大安', '台湾省,台北,大安', 'Da’an Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (766964, 2, 7111135835616, 7111758551158, '000115', '02', '南港区', '南港', '台湾省,台北,南港', 'Nangang Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (767154, 2, 7111135835616, 7111478258212, '000114', '02', '内湖区', '内湖', '台湾省,台北,内湖', 'Neihu Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (767537, 2, 7111135835616, 7110369072551, '000111', '02', '士林区', '士林', '台湾省,台北,士林', 'Shilin Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (767927, 2, 7111135835616, 7110252641444, '000105', '02', '松山区', '松山', '台湾省,台北,松山', 'Songshan Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (768431, 2, 7111135835616, 7110215329689, '000108', '02', '万华区', '万华', '台湾省,台北,万华', 'Wanhua Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (768838, 2, 7111135835616, 7111116844598, '000116', '02', '文山区', '文山', '台湾省,台北,文山', 'Wenshan Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (769508, 2, 7111135835616, 7113408492912, '000110', '02', '信义区', '信义', '台湾省,台北,信义', 'Xinyi Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (769821, 2, 7111135835616, 7112025713063, '000104', '02', '中山区', '中山', '台湾省,台北,中山', 'Zhongshan Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (770632, 2, 7111135835616, 7113853708349, '000100', '02', '中正区', '中正', '台湾省,台北,中正', 'Zhongzheng Dist.', 121.520076, 25.030724);
INSERT INTO `china_region` VALUES (771099, 1, 7112684281636, 7110683530667, '0', '089', '台东县', '台东', '台湾省,台东', 'Taitung County', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771100, 2, 7110683530667, 7110411091341, '000954', '089', '卑南乡', '卑南', '台湾省,台东,卑南', 'Beinan Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771183, 2, 7110683530667, 7114091071397, '000962', '089', '长滨乡', '长滨', '台湾省,台东,长滨', 'Changbin Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771236, 2, 7110683530667, 7111109006944, '000961', '089', '成功镇', '成功', '台湾省,台东,成功', 'Chenggong Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771349, 2, 7110683530667, 7113542170157, '000958', '089', '池上乡', '池上', '台湾省,台东,池上', 'Chishang Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771476, 2, 7110683530667, 7112804014911, '000966', '089', '达仁乡', '达仁', '台湾省,台东,达仁', 'Daren Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771501, 2, 7110683530667, 7110235284468, '000965', '089', '大武乡', '大武', '台湾省,台东,大武', 'Dawu Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771551, 2, 7110683530667, 7113990021030, '000959', '089', '东河乡', '东河', '台湾省,台东,东河', 'Donghe Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771589, 2, 7110683530667, 7112595950617, '000956', '089', '关山镇', '关山', '台湾省,台东,关山', 'Guanshan Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771681, 2, 7110683530667, 7114169650500, '000957', '089', '海端乡', '海端', '台湾省,台东,海端', 'Haiduan Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771709, 2, 7110683530667, 7113085633749, '000964', '089', '金峰乡', '金峰', '台湾省,台东,金峰', 'Jinfeng Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771716, 2, 7110683530667, 7112807949443, '000952', '089', '兰屿乡', '兰屿', '台湾省,台东,兰屿', 'Lanyu Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771738, 2, 7110683530667, 7110029673025, '000951', '089', '绿岛乡', '绿岛', '台湾省,台东,绿岛', 'Ludao Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771762, 2, 7110683530667, 7110421361918, '000955', '089', '鹿野乡', '鹿野', '台湾省,台东,鹿野', 'Luye Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (771846, 2, 7110683530667, 7110428608379, '000963', '089', '太麻里乡', '太麻里', '台湾省,台东,太麻里', 'Taimali Township', 120.972099, 22.587472);
INSERT INTO `china_region` VALUES (771920, 2, 7110683530667, 7112475252249, '000950', '089', '台东市', '台东市', '台湾省,台东,台东市', 'Taitung City', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (772316, 2, 7110683530667, 7113634859837, '000953', '089', '延平乡', '延平', '台湾省,台东,延平', 'Yanping Township', 121.113207, 22.764364);
INSERT INTO `china_region` VALUES (772334, 1, 7112684281636, 7110341650825, '0', '03', '桃园市', '桃园', '台湾省,桃园', 'Taoyuan City', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (772335, 2, 7110341650825, 7110678168526, '000334', '03', '八德区', '八德', '台湾省,桃园,八德', 'Bade Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (772843, 2, 7110341650825, 7113219452238, '000335', '03', '大溪区', '大溪', '台湾省,桃园,大溪', 'Daxi Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (773123, 2, 7110341650825, 7110847329556, '000337', '03', '大园区', '大园', '台湾省,桃园,大园', 'Dayuan Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (773487, 2, 7110341650825, 7114249848471, '000336', '03', '复兴区', '复兴', '台湾省,桃园,复兴', 'Fuxing Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (773566, 2, 7110341650825, 7112531770128, '000328', '03', '观音区', '观音', '台湾省,桃园,观音', 'Guanyin Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (773936, 2, 7110341650825, 7112312633084, '000333', '03', '龟山区', '龟山', '台湾省,桃园,龟山', 'Guishan Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (774335, 2, 7110341650825, 7112762705132, '000325', '03', '龙潭区', '龙潭', '台湾省,桃园,龙潭', 'Longtan Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (774733, 2, 7110341650825, 7112224965181, '000338', '03', '芦竹区', '芦竹', '台湾省,桃园,芦竹', 'Luzhu Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (775267, 2, 7110341650825, 7111433119675, '000324', '03', '平镇区', '平镇', '台湾省,桃园,平镇', 'Pingzhen Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (775833, 2, 7110341650825, 7112984561367, '000330', '03', '桃园区', '桃园', '台湾省,桃园,桃园', 'Taoyuan Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (776649, 2, 7110341650825, 7112117373171, '000327', '03', '新屋区', '新屋', '台湾省,桃园,新屋', 'Xinwu Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (776883, 2, 7110341650825, 7110260206164, '000326', '03', '杨梅区', '杨梅', '台湾省,桃园,杨梅', 'Yangmei Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (777272, 2, 7110341650825, 7110260171037, '000320', '03', '中坜区', '中坜', '台湾省,桃园,中坜', 'Zhongli Dist.', 121.213608, 24.982757);
INSERT INTO `china_region` VALUES (778724, 1, 7112684281636, 7110496253116, '0', '03', '宜兰县', '宜兰', '台湾省,宜兰', 'Yilan County', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (778725, 2, 7110496253116, 7112864015669, '000267', '03', '大同乡', '大同', '台湾省,宜兰,大同', 'Datong Township', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (778792, 2, 7110496253116, 7110191903506, '000290', '03', '钓鱼台', '钓鱼台', '台湾省,宜兰,钓鱼台', 'Diaoyutai', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (778794, 2, 7110496253116, 7113685245322, '000269', '03', '冬山乡', '冬山', '台湾省,宜兰,冬山', 'Dongshan Township', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (779150, 2, 7110496253116, 7113840396599, '000262', '03', '礁溪乡', '礁溪', '台湾省,宜兰,礁溪', 'Jiaoxi Township', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (779296, 2, 7110496253116, 7110136250639, '000265', '03', '罗东镇', '罗东', '台湾省,宜兰,罗东', 'Luodong Township', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (779500, 2, 7110496253116, 7111436893118, '000272', '03', '南澳乡', '南澳', '台湾省,宜兰,南澳', 'Nan’ao Township', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (779523, 2, 7110496253116, 7110661036416, '000266', '03', '三星乡', '三星', '台湾省,宜兰,三星', 'Sanxing Township', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (779871, 2, 7110496253116, 7112787444136, '000270', '03', '苏澳镇', '苏澳', '台湾省,宜兰,苏澳', 'Su’ao Township', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (780103, 2, 7110496253116, 7113246144892, '000261', '03', '头城镇', '头城', '台湾省,宜兰,头城', 'Toucheng Township', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (780221, 2, 7110496253116, 7113214799864, '000268', '03', '五结乡', '五结', '台湾省,宜兰,五结', 'Wujie Township', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (780422, 2, 7110496253116, 7113435783860, '000260', '03', '宜兰市', '宜兰市', '台湾省,宜兰,宜兰市', 'Yilan City', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (780732, 2, 7110496253116, 7111930211838, '000264', '03', '员山乡', '员山', '台湾省,宜兰,员山', 'Yuanshan Township', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (780885, 2, 7110496253116, 7113006867933, '000263', '03', '壮围乡', '壮围', '台湾省,宜兰,壮围', 'Zhuangwei Township', 121.754442, 24.759707);
INSERT INTO `china_region` VALUES (780982, 1, 7112684281636, 7110805025214, '0', '05', '云林县', '云林', '台湾省,云林', 'Yunlin County', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (780983, 2, 7110805025214, 7112138581786, '000634', '05', '褒忠乡', '褒忠', '台湾省,云林,褒忠', 'Baozhong Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (781024, 2, 7110805025214, 7111868639671, '000651', '05', '北港镇', '北港', '台湾省,云林,北港', 'Beigang Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (781230, 2, 7110805025214, 7110215531178, '000647', '05', '莿桐乡', '莿桐', '台湾省,云林,莿桐', 'Citong Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (781302, 2, 7110805025214, 7113827712259, '000631', '05', '大埤乡', '大埤', '台湾省,云林,大埤', 'Dapi Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (781381, 2, 7110805025214, 7110474478353, '000635', '05', '东势乡', '东势', '台湾省,云林,东势', 'Dongshi Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (781455, 2, 7110805025214, 7112987030783, '000640', '05', '斗六市', '斗六市', '台湾省,云林,斗六市', 'Douliu City', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (781937, 2, 7110805025214, 7112581144835, '000630', '05', '斗南镇', '斗南', '台湾省,云林,斗南', 'Dounan Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (782194, 2, 7110805025214, 7110712761867, '000649', '05', '二崙乡', '二崙', '台湾省,云林,二崙', 'Erlun Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (782265, 2, 7110805025214, 7113428531096, '000646', '05', '古坑乡', '古坑', '台湾省,云林,古坑', 'Gukeng Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (782369, 2, 7110805025214, 7114107486674, '000632', '05', '虎尾镇', '虎尾', '台湾省,云林,虎尾', 'Huwei Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (782648, 2, 7110805025214, 7113169837655, '000653', '05', '口湖乡', '口湖', '台湾省,云林,口湖', 'Kouhu Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (782740, 2, 7110805025214, 7113918626080, '000643', '05', '林内乡', '林内', '台湾省,云林,林内', 'Linnei Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (782809, 2, 7110805025214, 7112106008722, '000637', '05', '崙背乡', '崙背', '台湾省,云林,崙背', 'Lunbei Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (782934, 2, 7110805025214, 7111789349480, '000638', '05', '麦寮乡', '麦寮', '台湾省,云林,麦寮', 'Mailiao Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (783048, 2, 7110805025214, 7114287996814, '000652', '05', '水林乡', '水林', '台湾省,云林,水林', 'Shuilin Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (783115, 2, 7110805025214, 7112940775739, '000654', '05', '四湖乡', '四湖', '台湾省,云林,四湖', 'Sihu Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (783192, 2, 7110805025214, 7110324425488, '000636', '05', '台西乡', '台西', '台湾省,云林,台西', 'Taixi Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (783246, 2, 7110805025214, 7110767901015, '000633', '05', '土库镇', '土库', '台湾省,云林,土库', 'Tuku Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (783328, 2, 7110805025214, 7111770338702, '000648', '05', '西螺镇', '西螺', '台湾省,云林,西螺', 'Xiluo Township', 120.480738, 23.664943);
INSERT INTO `china_region` VALUES (783478, 2, 7110805025214, 7113126346648, '000655', '05', '元长乡', '元长', '台湾省,云林,元长', 'Yuanchang Township', 120.480738, 23.664943);
COMMIT;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '平台ID',
  `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '标题',
  `subtitle` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '副标题',
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '分类ID',
  `image` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '图标',
  `content` text CHARACTER SET utf8mb4 DEFAULT '' COMMENT '内容',
  `type` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'h5' COMMENT 'URL类型',
  `appid` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT 'AppID',
  `url` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT 'URL',
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '状态',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='信息数据表';

-- ----------------------------
-- Records of content
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '键名',
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '键值',
  `status` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '状态 0停用 1正常',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否系统',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dict_key_unique` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
BEGIN;
INSERT INTO `dictionary` VALUES (1, '用户性别', 'user_sex', '{\"a\":\"a1\",\"b\":\"b1\",\"S#fdsf\":\"gffsd\"}', 1, '用户性别', 1, '2021-02-03 16:40:15', '2021-05-21 00:28:18');
INSERT INTO `dictionary` VALUES (2, '区域等级', 'china_region_level', '[\"\\u7701\\u7ea7\",\"\\u5e02\\u7ea7\",\"\\u533a\\/\\u53bf\",\"\\u8857\\u9053\\/\\u9547\",\"\\u5c45\\u59d4\\/\\u6751\\u59d4\",\"\\u7ec4\"]', 1, '区域等级', 1, '2021-02-03 18:25:18', '2021-05-20 14:52:50');
INSERT INTO `dictionary` VALUES (3, '链接类型', 'link_type', '{\"h5\":\"H5\",\"wechat\":\"\\u5fae\\u4fe1\\u5c0f\\u7a0b\\u5e8f\",\"alipay\":\"\\u652f\\u4ed8\\u5b9d\"}', 1, '链接类型', 1, '2021-02-03 18:26:21', '2021-06-17 17:50:11');
INSERT INTO `dictionary` VALUES (4, '认证等级', 'auth_level', '[\"\\u6e38\\u5ba2\",\"\\u767b\\u5f55\",\"\\u5b9e\\u540d\",\"\\u5b9e\\u4eba\",\"\\u5b9e\\u540d + \\u5b9e\\u4eba\"]', 1, '认证等级', 1, '2021-02-03 18:26:42', '2021-07-07 16:38:26');
INSERT INTO `dictionary` VALUES (5, '系统配置', 'system_config', '{\"site_name\":\"\\u6570\\u636e\\u7ba1\\u7406\\u5e73\\u53f0\",\"timezone\":\"Asia\\/Shanghai\"}', 1, '系统配置', 1, '2021-02-05 22:55:45', '2021-02-24 10:23:08');
INSERT INTO `dictionary` VALUES (6, '分类组别', 'category_group', '{\"application\":\"\\u5e94\\u7528\",\"content\":\"\\u5185\\u5bb9\"}', 1, '分类组别', 1, '2021-02-23 22:43:28', '2021-02-24 11:05:01');
INSERT INTO `dictionary` VALUES (7, '反馈类型', 'feedback_type', '{\"account\":\"\\u8d26\\u53f7\",\"content\":\"\\u5185\\u5bb9\",\"product\":\"\\u4ea7\\u54c1\",\"other\":\"\\u5176\\u5b83\"}', 1, '反馈类型', 1, '2021-07-06 19:16:10', '2021-07-06 19:16:55');
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '平台ID',
  `type` varchar(64) NOT NULL COMMENT '类型，来源字典',
  `content` varchar(255) NOT NULL COMMENT '反馈内容',
  `contact` varchar(64) DEFAULT NULL COMMENT '联系方式',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of feedback
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for layout
-- ----------------------------
DROP TABLE IF EXISTS `layout`;
CREATE TABLE `layout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `channel_id` int(10) unsigned DEFAULT 0 COMMENT '栏目ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '副标题',
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类型',
  `target_ids` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目标ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '状态',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of layout
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `app_id` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT 'App ID',
  `app_secret` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT 'App Secret',
  `status` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '状态（0关闭 1正常）',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of platform
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '平台ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `from` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '来源 0 内部 1外部',
  `status` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '状态 0 停用 1正常',
  `top` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '置顶 0否 1是',
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '内容',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of system_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
