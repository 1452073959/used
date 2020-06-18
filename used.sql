/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : used

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-06-19 01:20:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', 'Index', 'feather icon-bar-chart-2', '/', '2020-06-18 03:43:13', null);
INSERT INTO `admin_menu` VALUES ('2', '0', '2', 'Admin', 'feather icon-settings', '', '2020-06-18 03:43:13', null);
INSERT INTO `admin_menu` VALUES ('3', '2', '3', 'Users', '', 'auth/users', '2020-06-18 03:43:13', null);
INSERT INTO `admin_menu` VALUES ('4', '2', '4', 'Roles', '', 'auth/roles', '2020-06-18 03:43:13', null);
INSERT INTO `admin_menu` VALUES ('5', '2', '5', 'Permission', '', 'auth/permissions', '2020-06-18 03:43:13', null);
INSERT INTO `admin_menu` VALUES ('6', '2', '6', 'Menu', '', 'auth/menu', '2020-06-18 03:43:13', null);
INSERT INTO `admin_menu` VALUES ('7', '2', '7', 'Operation log', '', 'auth/logs', '2020-06-18 03:43:13', null);
INSERT INTO `admin_menu` VALUES ('8', '0', '8', '分类管理', 'fa-cube', 'cate', '2020-06-18 14:05:17', '2020-06-18 14:05:17');
INSERT INTO `admin_menu` VALUES ('9', '0', '9', '商品管理', 'fa-balance-scale', 'product', '2020-06-18 14:22:58', '2020-06-18 14:22:58');
INSERT INTO `admin_menu` VALUES ('10', '0', '10', '联系二维码', 'fa-google-wallet', 'qrcode', '2020-06-19 00:22:34', '2020-06-19 00:22:34');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-06-18 05:39:29', '2020-06-18 05:39:29');
INSERT INTO `admin_operation_log` VALUES ('2', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-06-18 13:44:10', '2020-06-18 13:44:10');
INSERT INTO `admin_operation_log` VALUES ('3', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"5O1MDN5EQMmkWDmB0VUMvgdsqK7AZaf4f1tnoIZ4\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-06-18 13:44:36', '2020-06-18 13:44:36');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-06-18 13:44:39', '2020-06-18 13:44:39');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-06-18 13:46:22', '2020-06-18 13:46:22');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 13:55:41', '2020-06-18 13:55:41');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-06-18 13:57:09', '2020-06-18 13:57:09');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-06-18 14:01:32', '2020-06-18 14:01:32');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:01:38', '2020-06-18 14:01:38');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"used\",\"tb\":\"cate\",\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\"}', '2020-06-18 14:01:42', '2020-06-18 14:01:42');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"cate\"}', '2020-06-18 14:01:43', '2020-06-18 14:01:43');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"cate\",\"exist-table\":\"used|cate\",\"model_name\":\"App\\\\Models\\\\Cate\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\CateController\",\"create\":[\"migration\",\"model\",\"controller\",\"lang\"],\"fields\":[{\"name\":\"title\",\"translation\":\"\\u540d\\u79f0\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u540d\\u79f0\"},{\"name\":\"image\",\"translation\":\"\\u56fe\\u7247\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u56fe\\u7247\"}],\"primary_key\":\"id\",\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\"}', '2020-06-18 14:02:01', '2020-06-18 14:02:01');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-18 14:02:01', '2020-06-18 14:02:01');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-18 14:04:26', '2020-06-18 14:04:26');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:04:30', '2020-06-18 14:04:30');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u5206\\u7c7b\\u7ba1\\u7406\",\"icon\":\"fa-cube\",\"uri\":\"cate\",\"roles\":[null],\"permissions\":null,\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\"}', '2020-06-18 14:05:17', '2020-06-18 14:05:17');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:05:17', '2020-06-18 14:05:17');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-06-18 14:05:20', '2020-06-18 14:05:20');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-06-18 14:05:26', '2020-06-18 14:05:26');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-06-18 14:05:28', '2020-06-18 14:05:28');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-06-18 14:05:30', '2020-06-18 14:05:30');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:05:32', '2020-06-18 14:05:32');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-06-18 14:05:33', '2020-06-18 14:05:33');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/cate/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:05:38', '2020-06-18 14:05:38');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/cate/create', 'GET', '127.0.0.1', '[]', '2020-06-18 14:07:55', '2020-06-18 14:07:55');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/cate/create', 'GET', '127.0.0.1', '[]', '2020-06-18 14:08:05', '2020-06-18 14:08:05');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/cate/create', 'GET', '127.0.0.1', '[]', '2020-06-18 14:09:09', '2020-06-18 14:09:09');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin/cate/create', 'GET', '127.0.0.1', '[]', '2020-06-18 14:09:49', '2020-06-18 14:09:49');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/cate/create', 'GET', '127.0.0.1', '[]', '2020-06-18 14:11:14', '2020-06-18 14:11:14');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"title\":\"\\u4e66\\u7c4d\",\"image\":null,\"file-image\":null,\"_file_\":null,\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\"}', '2020-06-18 14:11:26', '2020-06-18 14:11:26');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/cate/create', 'GET', '127.0.0.1', '[]', '2020-06-18 14:12:22', '2020-06-18 14:12:22');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"_id\":\"EQYIbxgaNykOubE3\",\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"1587692910(1).jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri Apr 24 2020 09:48:30 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"45927\"}', '2020-06-18 14:12:41', '2020-06-18 14:12:41');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"title\":\"\\u4e66\\u7c4d\",\"image\":\"images\\/e43c61cd434f561dd59093085b89547a.jpg\",\"file-image\":null,\"_file_\":null,\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\"}', '2020-06-18 14:12:42', '2020-06-18 14:12:42');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:12:43', '2020-06-18 14:12:43');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/cate/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:12:45', '2020-06-18 14:12:45');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"_id\":\"dZ3Ny9bw0I2k2gTO\",\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"timg.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri Apr 17 2020 09:19:24 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"40323\"}', '2020-06-18 14:13:04', '2020-06-18 14:13:04');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"title\":\"\\u751f\\u6d3b\",\"image\":\"images\\/f86196a1d1c2d95d343cb0227ad8b8c2.jpg\",\"file-image\":null,\"_file_\":null,\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/cate\"}', '2020-06-18 14:13:06', '2020-06-18 14:13:06');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:13:06', '2020-06-18 14:13:06');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/cate/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:13:08', '2020-06-18 14:13:08');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"_id\":\"SbNM0KtqGjkUkjiy\",\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\",\"upload_column\":\"image\",\"id\":\"WU_FILE_1\",\"name\":\"1590717343(1).jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri May 29 2020 09:55:43 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"2416\"}', '2020-06-18 14:13:20', '2020-06-18 14:13:20');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"title\":\"\\u6570\\u7801\",\"image\":\"images\\/02caaab798104239a00b636cea849e6c.jpg\",\"file-image\":null,\"_file_\":null,\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/cate\"}', '2020-06-18 14:13:21', '2020-06-18 14:13:21');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:13:21', '2020-06-18 14:13:21');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-06-18 14:13:39', '2020-06-18 14:13:39');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-06-18 14:13:52', '2020-06-18 14:13:52');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-06-18 14:14:16', '2020-06-18 14:14:16');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin/cate/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:14:22', '2020-06-18 14:14:22');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:14:26', '2020-06-18 14:14:26');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-06-18 14:15:00', '2020-06-18 14:15:00');
INSERT INTO `admin_operation_log` VALUES ('49', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:21:30', '2020-06-18 14:21:30');
INSERT INTO `admin_operation_log` VALUES ('50', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"used\",\"tb\":\"product\",\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\"}', '2020-06-18 14:21:34', '2020-06-18 14:21:34');
INSERT INTO `admin_operation_log` VALUES ('51', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"product\"}', '2020-06-18 14:21:34', '2020-06-18 14:21:34');
INSERT INTO `admin_operation_log` VALUES ('52', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"product\",\"exist-table\":\"used|product\",\"model_name\":\"App\\\\Models\\\\Product\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductController\",\"create\":[\"migration\",\"model\",\"repository\",\"controller\",\"lang\"],\"fields\":[{\"name\":\"cid\",\"translation\":\"\\u5206\\u7c7bid\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u5206\\u7c7bid\"},{\"name\":\"title\",\"translation\":\"\\u6807\\u9898\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u6807\\u9898\"},{\"name\":\"description\",\"translation\":\"\\u63cf\\u8ff0\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u63cf\\u8ff0\"},{\"name\":\"image\",\"translation\":\"\\u56fe\\u7247\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u56fe\\u7247\"},{\"name\":\"price\",\"translation\":\"\\u4ef7\\u683c\",\"type\":\"decimal\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u4ef7\\u683c\"},{\"name\":\"tel\",\"translation\":\"\\u8054\\u7cfb\\u65b9\\u5f0f\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u8054\\u7cfb\\u65b9\\u5f0f\"}],\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\"}', '2020-06-18 14:21:49', '2020-06-18 14:21:49');
INSERT INTO `admin_operation_log` VALUES ('53', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-18 14:21:50', '2020-06-18 14:21:50');
INSERT INTO `admin_operation_log` VALUES ('54', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-18 14:22:12', '2020-06-18 14:22:12');
INSERT INTO `admin_operation_log` VALUES ('55', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:22:17', '2020-06-18 14:22:17');
INSERT INTO `admin_operation_log` VALUES ('56', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-balance-scale\",\"uri\":\"product\",\"roles\":[null],\"permissions\":null,\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\"}', '2020-06-18 14:22:58', '2020-06-18 14:22:58');
INSERT INTO `admin_operation_log` VALUES ('57', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:22:59', '2020-06-18 14:22:59');
INSERT INTO `admin_operation_log` VALUES ('58', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-06-18 14:23:00', '2020-06-18 14:23:00');
INSERT INTO `admin_operation_log` VALUES ('59', '1', 'admin/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:23:02', '2020-06-18 14:23:02');
INSERT INTO `admin_operation_log` VALUES ('60', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 14:23:14', '2020-06-18 14:23:14');
INSERT INTO `admin_operation_log` VALUES ('61', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 14:35:22', '2020-06-18 14:35:22');
INSERT INTO `admin_operation_log` VALUES ('62', '1', 'admin/product/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 14:35:24', '2020-06-18 14:35:24');
INSERT INTO `admin_operation_log` VALUES ('63', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 14:35:27', '2020-06-18 14:35:27');
INSERT INTO `admin_operation_log` VALUES ('64', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 14:35:38', '2020-06-18 14:35:38');
INSERT INTO `admin_operation_log` VALUES ('65', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 14:59:53', '2020-06-18 14:59:53');
INSERT INTO `admin_operation_log` VALUES ('66', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:00:05', '2020-06-18 15:00:05');
INSERT INTO `admin_operation_log` VALUES ('67', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:00:31', '2020-06-18 15:00:31');
INSERT INTO `admin_operation_log` VALUES ('68', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:01:03', '2020-06-18 15:01:03');
INSERT INTO `admin_operation_log` VALUES ('69', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:01:49', '2020-06-18 15:01:49');
INSERT INTO `admin_operation_log` VALUES ('70', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:02:20', '2020-06-18 15:02:20');
INSERT INTO `admin_operation_log` VALUES ('71', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:02:47', '2020-06-18 15:02:47');
INSERT INTO `admin_operation_log` VALUES ('72', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:03:48', '2020-06-18 15:03:48');
INSERT INTO `admin_operation_log` VALUES ('73', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:03:49', '2020-06-18 15:03:49');
INSERT INTO `admin_operation_log` VALUES ('74', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:04:04', '2020-06-18 15:04:04');
INSERT INTO `admin_operation_log` VALUES ('75', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:05:12', '2020-06-18 15:05:12');
INSERT INTO `admin_operation_log` VALUES ('76', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:05:33', '2020-06-18 15:05:33');
INSERT INTO `admin_operation_log` VALUES ('77', '1', 'admin/product/create', 'GET', '127.0.0.1', '[]', '2020-06-18 15:06:38', '2020-06-18 15:06:38');
INSERT INTO `admin_operation_log` VALUES ('78', '1', 'admin/product', 'POST', '127.0.0.1', '{\"_id\":\"7kKITLlcfhh19jxc\",\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"1590717343(1).jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri May 29 2020 09:55:43 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"2416\"}', '2020-06-18 15:06:55', '2020-06-18 15:06:55');
INSERT INTO `admin_operation_log` VALUES ('79', '1', 'admin/product', 'POST', '127.0.0.1', '{\"_id\":\"7kKITLlcfhh19jxc\",\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\",\"upload_column\":\"image\",\"id\":\"WU_FILE_1\",\"name\":\"image.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Thu Dec 26 2019 10:42:35 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"89907\"}', '2020-06-18 15:06:55', '2020-06-18 15:06:55');
INSERT INTO `admin_operation_log` VALUES ('80', '1', 'admin/product', 'POST', '127.0.0.1', '{\"cid\":\"1\",\"title\":\"\\u7535\\u8111\\u5feb\\u6377\\u952e\\u5927\\u5168\",\"description\":\"\\u9ed8\\u8ba4\\u54cd\\u5e94\",\"image\":\"images\\/787d6be44234aeea14fcabf4ad32914e.jpg,images\\/45068a23a49a8d15bae97cf007c484e5.jpg\",\"file-image\":null,\"_file_\":null,\"file\":null,\"price\":\"50\",\"tel\":\"15766925847\",\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\"}', '2020-06-18 15:07:03', '2020-06-18 15:07:03');
INSERT INTO `admin_operation_log` VALUES ('81', '1', 'admin/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 15:07:03', '2020-06-18 15:07:03');
INSERT INTO `admin_operation_log` VALUES ('82', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 15:07:56', '2020-06-18 15:07:56');
INSERT INTO `admin_operation_log` VALUES ('83', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 15:09:30', '2020-06-18 15:09:30');
INSERT INTO `admin_operation_log` VALUES ('84', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 15:10:16', '2020-06-18 15:10:16');
INSERT INTO `admin_operation_log` VALUES ('85', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 15:10:30', '2020-06-18 15:10:30');
INSERT INTO `admin_operation_log` VALUES ('86', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 15:11:02', '2020-06-18 15:11:02');
INSERT INTO `admin_operation_log` VALUES ('87', '1', 'admin/product/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 15:11:07', '2020-06-18 15:11:07');
INSERT INTO `admin_operation_log` VALUES ('88', '1', 'admin/product/1', 'PUT', '127.0.0.1', '{\"cid\":\"3\",\"title\":\"\\u7535\\u8111\\u5feb\\u6377\\u952e\\u5927\\u5168\",\"description\":\"\\u9ed8\\u8ba4\\u54cd\\u5e94\",\"image\":\"images\\/787d6be44234aeea14fcabf4ad32914e.jpg,images\\/45068a23a49a8d15bae97cf007c484e5.jpg\",\"file-image\":null,\"_file_\":null,\"file\":null,\"price\":\"50.00\",\"tel\":\"15766925847\",\"status\":\"1\",\"_token\":\"Wwbs38w1sFbv1sEoOq2Zj21DmHePCgahktCeSDkl\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/product\"}', '2020-06-18 15:11:20', '2020-06-18 15:11:20');
INSERT INTO `admin_operation_log` VALUES ('89', '1', 'admin/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 15:11:20', '2020-06-18 15:11:20');
INSERT INTO `admin_operation_log` VALUES ('90', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 15:13:05', '2020-06-18 15:13:05');
INSERT INTO `admin_operation_log` VALUES ('91', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 15:14:47', '2020-06-18 15:14:47');
INSERT INTO `admin_operation_log` VALUES ('92', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 15:15:05', '2020-06-18 15:15:05');
INSERT INTO `admin_operation_log` VALUES ('93', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 15:15:54', '2020-06-18 15:15:54');
INSERT INTO `admin_operation_log` VALUES ('94', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-06-18 08:05:02', '2020-06-18 08:05:02');
INSERT INTO `admin_operation_log` VALUES ('95', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"N3UtamYYVhjWzLJZducmMeMniJFRAKh4h4aKzuiw\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-06-18 08:05:16', '2020-06-18 08:05:16');
INSERT INTO `admin_operation_log` VALUES ('96', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-06-18 08:05:17', '2020-06-18 08:05:17');
INSERT INTO `admin_operation_log` VALUES ('97', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-06-18 08:08:09', '2020-06-18 08:08:09');
INSERT INTO `admin_operation_log` VALUES ('98', '1', 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 08:08:21', '2020-06-18 08:08:21');
INSERT INTO `admin_operation_log` VALUES ('99', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-06-18 08:08:22', '2020-06-18 08:08:22');
INSERT INTO `admin_operation_log` VALUES ('100', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-06-18 08:08:39', '2020-06-18 08:08:39');
INSERT INTO `admin_operation_log` VALUES ('101', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-06-18 16:09:24', '2020-06-18 16:09:24');
INSERT INTO `admin_operation_log` VALUES ('102', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"dkkt2Dk9wm8u9y388VOAJyJPgREvHId7WtCV9xy1\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-06-18 16:09:40', '2020-06-18 16:09:40');
INSERT INTO `admin_operation_log` VALUES ('103', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-06-18 16:09:41', '2020-06-18 16:09:41');
INSERT INTO `admin_operation_log` VALUES ('104', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-06-18 16:10:22', '2020-06-18 16:10:22');
INSERT INTO `admin_operation_log` VALUES ('105', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 16:10:30', '2020-06-18 16:10:30');
INSERT INTO `admin_operation_log` VALUES ('106', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"used\",\"tb\":\"cate\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\"}', '2020-06-18 16:10:51', '2020-06-18 16:10:51');
INSERT INTO `admin_operation_log` VALUES ('107', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"cate\"}', '2020-06-18 16:10:52', '2020-06-18 16:10:52');
INSERT INTO `admin_operation_log` VALUES ('108', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"cate\",\"exist-table\":\"used|cate\",\"model_name\":\"App\\\\Models\\\\Cate\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\CateController\",\"create\":[\"migration\",\"model\",\"controller\",\"lang\"],\"fields\":[{\"name\":\"text\",\"translation\":\"\\u540d\\u79f0\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u540d\\u79f0\"},{\"name\":\"image\",\"translation\":\"\\u56fe\\u7247\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u56fe\\u7247\"}],\"primary_key\":\"id\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\"}', '2020-06-18 16:11:03', '2020-06-18 16:11:03');
INSERT INTO `admin_operation_log` VALUES ('109', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-18 16:11:11', '2020-06-18 16:11:11');
INSERT INTO `admin_operation_log` VALUES ('110', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"product\"}', '2020-06-18 16:11:21', '2020-06-18 16:11:21');
INSERT INTO `admin_operation_log` VALUES ('111', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"used\",\"tb\":\"product\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\"}', '2020-06-18 16:11:21', '2020-06-18 16:11:21');
INSERT INTO `admin_operation_log` VALUES ('112', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"product\",\"exist-table\":\"used|product\",\"model_name\":\"App\\\\Models\\\\Product\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductController\",\"create\":[\"migration\",\"model\",\"repository\",\"controller\",\"lang\"],\"fields\":[{\"name\":\"cid\",\"translation\":\"\\u5206\\u7c7bid\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u5206\\u7c7bid\"},{\"name\":\"title\",\"translation\":\"\\u6807\\u9898\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u6807\\u9898\"},{\"name\":\"description\",\"translation\":\"\\u63cf\\u8ff0\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u63cf\\u8ff0\"},{\"name\":\"image\",\"translation\":\"\\u56fe\\u7247\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u56fe\\u7247\"},{\"name\":\"price\",\"translation\":\"\\u4ef7\\u683c\",\"type\":\"decimal\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u4ef7\\u683c\"},{\"name\":\"tel\",\"translation\":\"\\u8054\\u7cfb\\u65b9\\u5f0f\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u8054\\u7cfb\\u65b9\\u5f0f\"},{\"name\":\"order\",\"translation\":\"\\/\\/\\u5c42\\u7ea7\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\/\\/\\u5c42\\u7ea7\"},{\"name\":\"status\",\"translation\":null,\"type\":\"tinyInteger\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\"}', '2020-06-18 16:11:45', '2020-06-18 16:11:45');
INSERT INTO `admin_operation_log` VALUES ('113', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-18 16:11:49', '2020-06-18 16:11:49');
INSERT INTO `admin_operation_log` VALUES ('114', '1', 'admin/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 16:14:10', '2020-06-18 16:14:10');
INSERT INTO `admin_operation_log` VALUES ('115', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 16:14:13', '2020-06-18 16:14:13');
INSERT INTO `admin_operation_log` VALUES ('116', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 16:14:45', '2020-06-18 16:14:45');
INSERT INTO `admin_operation_log` VALUES ('117', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 16:15:16', '2020-06-18 16:15:16');
INSERT INTO `admin_operation_log` VALUES ('118', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 16:16:05', '2020-06-18 16:16:05');
INSERT INTO `admin_operation_log` VALUES ('119', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 16:16:19', '2020-06-18 16:16:19');
INSERT INTO `admin_operation_log` VALUES ('120', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 16:16:22', '2020-06-18 16:16:22');
INSERT INTO `admin_operation_log` VALUES ('121', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-06-18 16:16:25', '2020-06-18 16:16:25');
INSERT INTO `admin_operation_log` VALUES ('122', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-06-18 16:16:51', '2020-06-18 16:16:51');
INSERT INTO `admin_operation_log` VALUES ('123', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-06-18 16:16:56', '2020-06-18 16:16:56');
INSERT INTO `admin_operation_log` VALUES ('124', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-06-18 16:17:11', '2020-06-18 16:17:11');
INSERT INTO `admin_operation_log` VALUES ('125', '1', 'admin/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 16:17:15', '2020-06-18 16:17:15');
INSERT INTO `admin_operation_log` VALUES ('126', '1', 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 16:17:25', '2020-06-18 16:17:25');
INSERT INTO `admin_operation_log` VALUES ('127', '1', 'admin/auth/setting', 'PUT', '127.0.0.1', '{\"_id\":\"1zneoMra60lEgOTu\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\",\"upload_column\":\"avatar\",\"_method\":\"PUT\",\"id\":\"WU_FILE_0\",\"name\":\"timg.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri Apr 17 2020 09:19:24 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"40323\"}', '2020-06-18 16:17:55', '2020-06-18 16:17:55');
INSERT INTO `admin_operation_log` VALUES ('128', '1', 'admin/auth/setting', 'PUT', '127.0.0.1', '{\"name\":\"used\",\"avatar\":null,\"file-avatar\":null,\"_file_\":null,\"old_password\":null,\"password\":null,\"password_confirmation\":null,\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/product\"}', '2020-06-18 16:17:56', '2020-06-18 16:17:56');
INSERT INTO `admin_operation_log` VALUES ('129', '1', 'admin/auth/setting', 'PUT', '127.0.0.1', '{\"_id\":\"1zneoMra60lEgOTu\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\",\"_method\":\"PUT\",\"avatar\":\"images\\/timg.jpg\"}', '2020-06-18 16:17:57', '2020-06-18 16:17:57');
INSERT INTO `admin_operation_log` VALUES ('130', '1', 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 16:17:58', '2020-06-18 16:17:58');
INSERT INTO `admin_operation_log` VALUES ('131', '1', 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2020-06-18 16:18:01', '2020-06-18 16:18:01');
INSERT INTO `admin_operation_log` VALUES ('132', '1', 'admin/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 16:18:33', '2020-06-18 16:18:33');
INSERT INTO `admin_operation_log` VALUES ('133', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 16:53:52', '2020-06-18 16:53:52');
INSERT INTO `admin_operation_log` VALUES ('134', '1', 'admin/product/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 16:53:57', '2020-06-18 16:53:57');
INSERT INTO `admin_operation_log` VALUES ('135', '1', 'admin/product/1/edit', 'GET', '127.0.0.1', '[]', '2020-06-18 16:54:21', '2020-06-18 16:54:21');
INSERT INTO `admin_operation_log` VALUES ('136', '1', 'admin/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 16:54:27', '2020-06-18 16:54:27');
INSERT INTO `admin_operation_log` VALUES ('137', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 17:05:37', '2020-06-18 17:05:37');
INSERT INTO `admin_operation_log` VALUES ('138', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-18 17:45:03', '2020-06-18 17:45:03');
INSERT INTO `admin_operation_log` VALUES ('139', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"comment\"}', '2020-06-18 17:46:16', '2020-06-18 17:46:16');
INSERT INTO `admin_operation_log` VALUES ('140', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"used\",\"tb\":\"comment\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\"}', '2020-06-18 17:46:17', '2020-06-18 17:46:17');
INSERT INTO `admin_operation_log` VALUES ('141', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-18 17:46:41', '2020-06-18 17:46:41');
INSERT INTO `admin_operation_log` VALUES ('142', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-18 17:46:51', '2020-06-18 17:46:51');
INSERT INTO `admin_operation_log` VALUES ('143', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"used\",\"tb\":\"cate\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\"}', '2020-06-18 17:46:56', '2020-06-18 17:46:56');
INSERT INTO `admin_operation_log` VALUES ('144', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"cate\"}', '2020-06-18 17:46:56', '2020-06-18 17:46:56');
INSERT INTO `admin_operation_log` VALUES ('145', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"used\",\"tb\":\"comment\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\"}', '2020-06-18 17:46:58', '2020-06-18 17:46:58');
INSERT INTO `admin_operation_log` VALUES ('146', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"comment\"}', '2020-06-18 17:46:58', '2020-06-18 17:46:58');
INSERT INTO `admin_operation_log` VALUES ('147', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"comment\",\"exist-table\":\"used|comment\",\"model_name\":\"App\\\\Models\\\\Comment\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\CommentController\",\"create\":[\"migration\",\"model\",\"repository\",\"controller\",\"lang\"],\"fields\":[{\"name\":\"user_id\",\"translation\":\"\\u7528\\u6237id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237id\"},{\"name\":\"pid\",\"translation\":\"\\u5546\\u54c1id\",\"type\":\"integer\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1id\"},{\"name\":\"parent_id\",\"translation\":\"\\u7236\\u7ea7\\u8bc4\\u8bbaid\",\"type\":\"integer\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u7236\\u7ea7\\u8bc4\\u8bbaid\"},{\"name\":\"replytime\",\"translation\":\"\\/\\/\\u8bc4\\u8bba\\u65f6\\u95f4\",\"type\":\"dateTime\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\/\\/\\u8bc4\\u8bba\\u65f6\\u95f4\"},{\"name\":\"content\",\"translation\":\"\\/\\/\\u8bc4\\u8bba\\u5185\\u5bb9\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\/\\/\\u8bc4\\u8bba\\u5185\\u5bb9\"}],\"primary_key\":\"id\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\"}', '2020-06-18 17:47:12', '2020-06-18 17:47:12');
INSERT INTO `admin_operation_log` VALUES ('148', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-18 17:47:16', '2020-06-18 17:47:16');
INSERT INTO `admin_operation_log` VALUES ('149', '1', 'admin/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 18:05:27', '2020-06-18 18:05:27');
INSERT INTO `admin_operation_log` VALUES ('150', '1', 'admin/product/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 18:05:30', '2020-06-18 18:05:30');
INSERT INTO `admin_operation_log` VALUES ('151', '1', 'admin/product', 'POST', '127.0.0.1', '{\"_id\":\"fE0DVj6wfIqTLZfQ\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"1587692910(1).jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri Apr 24 2020 09:48:30 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"45927\"}', '2020-06-18 18:06:05', '2020-06-18 18:06:05');
INSERT INTO `admin_operation_log` VALUES ('152', '1', 'admin/product', 'POST', '127.0.0.1', '{\"cid\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5546\\u54c1\\u4e8c\",\"description\":\"\\u6d4b\\u8bd5\\u63cf\\u8ff02\",\"image\":\"images\\/fd13a423216da50a7a7fbc5e4e1334dc.jpg\",\"file-image\":null,\"_file_\":null,\"file\":null,\"price\":\"0.0.1\",\"tel\":\"13257275375\",\"status\":\"1\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/product\"}', '2020-06-18 18:06:14', '2020-06-18 18:06:14');
INSERT INTO `admin_operation_log` VALUES ('153', '1', 'admin/product', 'POST', '127.0.0.1', '{\"cid\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5546\\u54c1\\u4e8c\",\"description\":\"\\u6d4b\\u8bd5\\u63cf\\u8ff02\",\"image\":\"images\\/fd13a423216da50a7a7fbc5e4e1334dc.jpg\",\"file-image\":null,\"_file_\":null,\"file\":null,\"price\":\"0.0.1\",\"tel\":\"13257275375\",\"status\":\"1\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/product\"}', '2020-06-18 18:06:22', '2020-06-18 18:06:22');
INSERT INTO `admin_operation_log` VALUES ('154', '1', 'admin/product', 'POST', '127.0.0.1', '{\"cid\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5546\\u54c1\\u4e8c\",\"description\":\"\\u6d4b\\u8bd5\\u63cf\\u8ff02\",\"image\":\"images\\/fd13a423216da50a7a7fbc5e4e1334dc.jpg\",\"file-image\":null,\"_file_\":null,\"file\":null,\"price\":\"0.0.1\",\"tel\":\"13257275375\",\"status\":\"1\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/product\"}', '2020-06-18 18:06:23', '2020-06-18 18:06:23');
INSERT INTO `admin_operation_log` VALUES ('155', '1', 'admin/product', 'POST', '127.0.0.1', '{\"cid\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5546\\u54c1\\u4e8c\",\"description\":\"\\u6d4b\\u8bd5\\u63cf\\u8ff02\",\"image\":\"images\\/fd13a423216da50a7a7fbc5e4e1334dc.jpg\",\"file-image\":null,\"_file_\":null,\"file\":null,\"price\":\"0.01\",\"tel\":\"13257275375\",\"status\":\"1\",\"_token\":\"J50Sb3V0lpF20EcWfRaL7EeVarwAgkMYjIlgpfeS\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/product\"}', '2020-06-18 18:06:38', '2020-06-18 18:06:38');
INSERT INTO `admin_operation_log` VALUES ('156', '1', 'admin/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 18:06:38', '2020-06-18 18:06:38');
INSERT INTO `admin_operation_log` VALUES ('157', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-18 18:10:16', '2020-06-18 18:10:16');
INSERT INTO `admin_operation_log` VALUES ('158', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-06-18 22:34:43', '2020-06-18 22:34:43');
INSERT INTO `admin_operation_log` VALUES ('159', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"coicDqNYjEgTjqv53v0vAskT5LBDP5gs6fHXHjT9\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-06-18 22:35:17', '2020-06-18 22:35:17');
INSERT INTO `admin_operation_log` VALUES ('160', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-06-18 22:35:18', '2020-06-18 22:35:18');
INSERT INTO `admin_operation_log` VALUES ('161', '1', 'admin/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 22:35:24', '2020-06-18 22:35:24');
INSERT INTO `admin_operation_log` VALUES ('162', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-19 00:01:07', '2020-06-19 00:01:07');
INSERT INTO `admin_operation_log` VALUES ('163', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-19 00:01:29', '2020-06-19 00:01:29');
INSERT INTO `admin_operation_log` VALUES ('164', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-19 00:11:18', '2020-06-19 00:11:18');
INSERT INTO `admin_operation_log` VALUES ('165', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-19 00:11:35', '2020-06-19 00:11:35');
INSERT INTO `admin_operation_log` VALUES ('166', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-19 00:13:19', '2020-06-19 00:13:19');
INSERT INTO `admin_operation_log` VALUES ('167', '1', 'admin/product', 'GET', '127.0.0.1', '[]', '2020-06-19 00:13:46', '2020-06-19 00:13:46');
INSERT INTO `admin_operation_log` VALUES ('168', '1', 'admin/product/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 00:14:02', '2020-06-19 00:14:02');
INSERT INTO `admin_operation_log` VALUES ('169', '1', 'admin/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 00:14:10', '2020-06-19 00:14:10');
INSERT INTO `admin_operation_log` VALUES ('170', '1', 'admin/helpers/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 00:16:17', '2020-06-19 00:16:17');
INSERT INTO `admin_operation_log` VALUES ('171', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 00:16:18', '2020-06-19 00:16:18');
INSERT INTO `admin_operation_log` VALUES ('172', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-19 00:19:38', '2020-06-19 00:19:38');
INSERT INTO `admin_operation_log` VALUES ('173', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"used\",\"tb\":\"qrcode\",\"_token\":\"8kJGLV83WaPxr1UQjkEmCBvr75mFjU5N62pD0fTn\"}', '2020-06-19 00:20:23', '2020-06-19 00:20:23');
INSERT INTO `admin_operation_log` VALUES ('174', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"qrcode\"}', '2020-06-19 00:20:23', '2020-06-19 00:20:23');
INSERT INTO `admin_operation_log` VALUES ('175', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"qrcode\",\"exist-table\":\"used|qrcode\",\"model_name\":\"App\\\\Models\\\\Qrcode\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\QrcodeController\",\"create\":[\"model\",\"repository\",\"controller\",\"lang\"],\"fields\":[{\"name\":\"text\",\"translation\":\"\\/\\/\\u5185\\u5bb9\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\/\\/\\u5185\\u5bb9\"}],\"primary_key\":\"id\",\"_token\":\"8kJGLV83WaPxr1UQjkEmCBvr75mFjU5N62pD0fTn\"}', '2020-06-19 00:20:28', '2020-06-19 00:20:28');
INSERT INTO `admin_operation_log` VALUES ('176', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-19 00:20:30', '2020-06-19 00:20:30');
INSERT INTO `admin_operation_log` VALUES ('177', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"used\",\"tb\":\"qrcode\",\"_token\":\"8kJGLV83WaPxr1UQjkEmCBvr75mFjU5N62pD0fTn\"}', '2020-06-19 00:20:42', '2020-06-19 00:20:42');
INSERT INTO `admin_operation_log` VALUES ('178', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"qrcode\"}', '2020-06-19 00:20:43', '2020-06-19 00:20:43');
INSERT INTO `admin_operation_log` VALUES ('179', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"qrcode\",\"exist-table\":\"used|qrcode\",\"model_name\":\"App\\\\Models\\\\Qrcode\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\QrcodeController\",\"create\":[\"migration\"],\"fields\":[{\"name\":\"text\",\"translation\":\"\\/\\/\\u5185\\u5bb9\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\/\\/\\u5185\\u5bb9\"}],\"primary_key\":\"id\",\"_token\":\"8kJGLV83WaPxr1UQjkEmCBvr75mFjU5N62pD0fTn\"}', '2020-06-19 00:20:47', '2020-06-19 00:20:47');
INSERT INTO `admin_operation_log` VALUES ('180', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-06-19 00:20:47', '2020-06-19 00:20:47');
INSERT INTO `admin_operation_log` VALUES ('181', '1', 'admin/helpers/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 00:20:53', '2020-06-19 00:20:53');
INSERT INTO `admin_operation_log` VALUES ('182', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 00:21:49', '2020-06-19 00:21:49');
INSERT INTO `admin_operation_log` VALUES ('183', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u8054\\u7cfb\\u4e8c\\u7ef4\\u7801\",\"icon\":\"fa-google-wallet\",\"uri\":\"qrcode\",\"roles\":[null],\"permissions\":null,\"_token\":\"8kJGLV83WaPxr1UQjkEmCBvr75mFjU5N62pD0fTn\"}', '2020-06-19 00:22:33', '2020-06-19 00:22:33');
INSERT INTO `admin_operation_log` VALUES ('184', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 00:22:34', '2020-06-19 00:22:34');
INSERT INTO `admin_operation_log` VALUES ('185', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-06-19 00:22:36', '2020-06-19 00:22:36');
INSERT INTO `admin_operation_log` VALUES ('186', '1', 'admin/qrcode', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 00:22:38', '2020-06-19 00:22:38');
INSERT INTO `admin_operation_log` VALUES ('187', '1', 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2020-06-19 00:23:40', '2020-06-19 00:23:40');
INSERT INTO `admin_operation_log` VALUES ('188', '1', 'admin/qrcode/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 00:23:43', '2020-06-19 00:23:43');
INSERT INTO `admin_operation_log` VALUES ('189', '1', 'admin/qrcode', 'POST', '127.0.0.1', '{\"description\":\"<p>\\u5165\\u5e93\\u91cf\\u89e3\\u7b54\\u662f\\u5947\\u5076\\u843d\\u843d\\u5927\\u65b9\\u76842\\u4e3e\\u62a5\\u7535\\u8bdd\\u7684<\\/p>\",\"_token\":\"8kJGLV83WaPxr1UQjkEmCBvr75mFjU5N62pD0fTn\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/qrcode\"}', '2020-06-19 00:23:57', '2020-06-19 00:23:57');
INSERT INTO `admin_operation_log` VALUES ('190', '1', 'admin/qrcode', 'POST', '127.0.0.1', '{\"description\":\"<p>\\u5165\\u5e93\\u91cf\\u89e3\\u7b54\\u662f\\u5947\\u5076\\u843d\\u843d\\u5927\\u65b9\\u76842\\u4e3e\\u62a5\\u7535\\u8bdd\\u7684<\\/p>\",\"_token\":\"8kJGLV83WaPxr1UQjkEmCBvr75mFjU5N62pD0fTn\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/qrcode\"}', '2020-06-19 00:24:07', '2020-06-19 00:24:07');
INSERT INTO `admin_operation_log` VALUES ('191', '1', 'admin/qrcode/create', 'GET', '127.0.0.1', '[]', '2020-06-19 00:28:39', '2020-06-19 00:28:39');
INSERT INTO `admin_operation_log` VALUES ('192', '1', 'admin/qrcode', 'POST', '127.0.0.1', '{\"text\":\"<p>\\u5927\\u5927\\u58eb\\u5927\\u592b\\u5218<\\/p>\",\"_token\":\"8kJGLV83WaPxr1UQjkEmCBvr75mFjU5N62pD0fTn\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/qrcode\"}', '2020-06-19 00:28:47', '2020-06-19 00:28:47');
INSERT INTO `admin_operation_log` VALUES ('193', '1', 'admin/qrcode', 'POST', '127.0.0.1', '{\"text\":\"<p>\\u5927\\u5927\\u58eb\\u5927\\u592b\\u5218<\\/p>\",\"_token\":\"8kJGLV83WaPxr1UQjkEmCBvr75mFjU5N62pD0fTn\",\"_previous_\":\"http:\\/\\/used.test\\/admin\\/qrcode\"}', '2020-06-19 00:29:07', '2020-06-19 00:29:07');
INSERT INTO `admin_operation_log` VALUES ('194', '1', 'admin/qrcode', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 00:29:08', '2020-06-19 00:29:08');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'Auth management', 'auth-management', '', '', '1', '0', '2020-06-18 03:43:13', null);
INSERT INTO `admin_permissions` VALUES ('2', 'Users', 'users', '', '/auth/users*', '2', '1', '2020-06-18 03:43:13', null);
INSERT INTO `admin_permissions` VALUES ('3', 'Roles', 'roles', '', '/auth/roles*', '3', '1', '2020-06-18 03:43:13', null);
INSERT INTO `admin_permissions` VALUES ('4', 'Permissions', 'permissions', '', '/auth/permissions*', '4', '1', '2020-06-18 03:43:13', null);
INSERT INTO `admin_permissions` VALUES ('5', 'Menu', 'menu', '', '/auth/menu*', '5', '1', '2020-06-18 03:43:13', null);
INSERT INTO `admin_permissions` VALUES ('6', 'Operation log', 'operation-log', '', '/auth/logs*', '6', '1', '2020-06-18 03:43:13', null);

-- ----------------------------
-- Table structure for admin_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE `admin_permission_menu` (
  `permission_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_permission_menu_permission_id_menu_id_unique` (`permission_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permission_menu
-- ----------------------------

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2020-06-18 03:43:13', '2020-06-18 03:43:14');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_menu_role_id_menu_id_unique` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_permissions_role_id_permission_id_unique` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_users_role_id_user_id_unique` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$UjTpogJuKHi2VN9r4T04necA/vFuo6.qbHWZAgG72geoCOvWOHvL2', 'used', 'images/timg.jpg', null, '2020-06-18 03:43:13', '2020-06-18 16:17:57');

-- ----------------------------
-- Table structure for cate
-- ----------------------------
DROP TABLE IF EXISTS `cate`;
CREATE TABLE `cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cate
-- ----------------------------
INSERT INTO `cate` VALUES ('1', '书籍', 'images/e43c61cd434f561dd59093085b89547a.jpg');
INSERT INTO `cate` VALUES ('2', '生活', 'images/f86196a1d1c2d95d343cb0227ad8b8c2.jpg');
INSERT INTO `cate` VALUES ('3', '数码', 'images/02caaab798104239a00b636cea849e6c.jpg');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `pid` int(11) DEFAULT NULL COMMENT '商品id',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级评论id',
  `replytime` datetime DEFAULT NULL COMMENT '//评论时间',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '//评论内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', null, null, '评论1');
INSERT INTO `comment` VALUES ('2', '1', '2', null, null, '不错哟一级评论');
INSERT INTO `comment` VALUES ('3', '1', '2', '2', null, '二级评论');
INSERT INTO `comment` VALUES ('4', '1', '2', '2', null, '二级评论2');
INSERT INTO `comment` VALUES ('5', '1', '2', '3', '2020-06-18 00:00:00', '三级评论');
INSERT INTO `comment` VALUES ('6', '1', '2', '4', '2020-06-18 00:00:00', '三级评论2');
INSERT INTO `comment` VALUES ('7', '1', '2', null, null, '一级评论2');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('4', '2016_01_04_173148_create_admin_tables', '2');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `cid` int(11) NOT NULL COMMENT '分类id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `tel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `pageview` int(11) DEFAULT NULL,
  `order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '层级',
  `status` tinyint(5) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1', '3', '电脑快捷键大全', '默认响应', '[\"images\\/787d6be44234aeea14fcabf4ad32914e.jpg\",\"images\\/45068a23a49a8d15bae97cf007c484e5.jpg\"]', '50.00', '15766925847', null, null, '1', '2020-06-18 15:07:03', '2020-06-18 15:11:20');
INSERT INTO `product` VALUES ('2', '1', '2', '测试商品二', '测试描述2', '[\"images\\/fd13a423216da50a7a7fbc5e4e1334dc.jpg\"]', '0.01', '13257275375', null, null, '1', '2020-06-18 18:06:38', '2020-06-18 18:06:38');

-- ----------------------------
-- Table structure for qrcode
-- ----------------------------
DROP TABLE IF EXISTS `qrcode`;
CREATE TABLE `qrcode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8mb4_unicode_ci COMMENT '//内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrcode
-- ----------------------------
INSERT INTO `qrcode` VALUES ('1', '<p>大大士大夫刘</p>');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `weapp_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `birthday` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `school` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学校',
  `weapp_openid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信id',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`weapp_avatar`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'snow雪', 'https://wx.qlogo.cn/mmopen/vi_32/fvSzic2fdNUMgDEXQMSMy4qUHQCCCcyPhyZCaKibRcGFckNYyqicx2mfJiagqjKV0USu8icX9fnibDE9wqb4aMazNseA/132', null, null, null, 'oUf9a5AT4xPDZy8lJ5Fpskh5gTqE', 'eyJpdiI6Ikg3XC9kdjFkMmlLZzE2TU9ScnIzbWp3PT0iLCJ2YWx1ZSI6IjVMN21HWWJOMjFCaWVzYUtnQTN2c0hTeXlDeFUyMkRlM3F2OFczOTFCVnBnelRvcHMzZmNTOGJLdkNyQkM3eWMiLCJtYWMiOiJhZDNkMTZiNTY4ODY5Y2RlNTY5OTI2ZDVlMGNmM2JiOTg4Y2ViODlmOTJmYzFiM2RlMDYwNTk4YjcyYTcxYWI4In0=', '2020-06-18 17:27:23', '2020-06-18 18:17:39');
