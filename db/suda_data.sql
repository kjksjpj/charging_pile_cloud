/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_8.0
 Source Server Type    : MySQL
 Source Server Version : 80014
 Source Host           : 127.0.0.1:3307
 Source Schema         : suda_shop

 Target Server Type    : MySQL
 Target Server Version : 80014
 File Encoding         : 65001

 Date: 09/05/2019 15:01:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission`;
CREATE TABLE `admin_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单或按钮名字',
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单URL',
  `menu_lev` int(4) NULL DEFAULT 0 COMMENT '菜单级别  1 一级菜单  2 二级菜单',
  `menu_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单样式',
  `menu_type` int(4) NULL DEFAULT 1 COMMENT '菜单类型  1 菜单  2按钮',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '上级菜单',
  `menu_order` int(10) NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permission
-- ----------------------------
INSERT INTO `admin_permission` VALUES (1, '系统设置', NULL, 1, NULL, 1, 0, 0, NULL, '2019-05-06 15:36:14');
INSERT INTO `admin_permission` VALUES (2, '权限管理', NULL, 1, NULL, 1, 0, 0, NULL, '2019-05-06 15:36:19');
INSERT INTO `admin_permission` VALUES (3, '会员管理', NULL, 1, NULL, 1, 0, 0, NULL, '2019-05-06 15:36:22');
INSERT INTO `admin_permission` VALUES (4, '商品管理', NULL, 1, NULL, 1, 0, 0, NULL, '2019-05-06 15:36:24');
INSERT INTO `admin_permission` VALUES (5, '抽奖商品', NULL, 1, NULL, 1, 0, 0, NULL, '2019-05-06 15:36:27');
INSERT INTO `admin_permission` VALUES (6, '内容管理', NULL, 1, NULL, 1, 0, 0, NULL, '2019-05-06 15:36:30');
INSERT INTO `admin_permission` VALUES (7, '财务管理', NULL, 1, NULL, 1, 0, 0, NULL, '2019-05-06 15:36:32');
INSERT INTO `admin_permission` VALUES (8, '日志管理', NULL, 1, NULL, 1, 0, 0, NULL, '2019-05-06 15:36:35');
INSERT INTO `admin_permission` VALUES (9, '轮播图', NULL, 2, NULL, 1, 1, 0, NULL, '2019-05-06 16:36:14');
INSERT INTO `admin_permission` VALUES (10, '大转盘', NULL, 2, NULL, 1, 1, 0, NULL, '2019-05-06 16:36:37');
INSERT INTO `admin_permission` VALUES (11, '编辑', NULL, 0, NULL, 2, 9, 0, NULL, '2019-05-06 16:38:15');
INSERT INTO `admin_permission` VALUES (12, '添加', '11', 0, NULL, 2, 9, 12, NULL, '2019-05-06 17:27:22');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_parent_id` bigint(20) NULL DEFAULT 0,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色名',
  `role_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色编码',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `last` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '1:最后一级代理，可创建会员，0:不是最后一级',
  `admin_user_id` bigint(20) NULL DEFAULT 0 COMMENT '所属管理员下级管理员角色',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1088704347015835653 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, 0, '超级管理员', 'cc8271b4-1dc5-424a-9be4-0a8a5663658f', '2019-05-07 09:50:19', NULL, 1, 1, '2019-05-07 09:50:19');

-- ----------------------------
-- Table structure for admin_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permission`;
CREATE TABLE `admin_role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `permission_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permission
-- ----------------------------
INSERT INTO `admin_role_permission` VALUES (5, 1, 1);
INSERT INTO `admin_role_permission` VALUES (6, 1, 3);
INSERT INTO `admin_role_permission` VALUES (7, 1, 4);
INSERT INTO `admin_role_permission` VALUES (8, 1, 5);
INSERT INTO `admin_role_permission` VALUES (9, 1, 7);

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '帐号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '昵称',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '其他状态',
  `is_disable` tinyint(1) NULL DEFAULT 0 COMMENT '0:有效 1:禁止登录',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '1:删除，0:未删除',
  `admin_parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父级管理员id',
  `agent_parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父级分销代理商id',
  `user_invite_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理商邀请码',
  `invitation_path` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推荐邀请关系树',
  `inspect_status` tinyint(3) NULL DEFAULT 1 COMMENT '审核状态(1-待审核;2-已审核;3-拒绝)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 'admin', 'admin', NULL, 'admin', NULL, NULL, '2019-04-20 09:56:32', NULL, 1, 0, 0, 0, NULL, NULL, 1);
INSERT INTO `admin_user` VALUES (2, '1', '1', NULL, NULL, NULL, NULL, '2019-05-07 10:31:13', NULL, 1, 0, 0, 0, NULL, NULL, 1);
INSERT INTO `admin_user` VALUES (3, '2', '2', NULL, NULL, NULL, NULL, '2019-05-07 10:25:14', NULL, NULL, 0, 0, 0, NULL, NULL, 1);

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role`  (
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色用户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
INSERT INTO `admin_user_role` VALUES (1, 1);
INSERT INTO `admin_user_role` VALUES (1, 2);

-- ----------------------------
-- Table structure for agent_permission
-- ----------------------------
DROP TABLE IF EXISTS `agent_permission`;
CREATE TABLE `agent_permission`  (
  `id` bigint(20) NOT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单或按钮名字',
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单URL',
  `menu_lev` int(4) NULL DEFAULT NULL COMMENT '菜单级别  1 一级菜单  2 二级菜单',
  `menu_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单样式',
  `menu_type` int(4) NULL DEFAULT NULL COMMENT '菜单类型  1 菜单  2按钮',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级菜单',
  `menu_order` int(10) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代理商菜单资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agent_permission
-- ----------------------------
INSERT INTO `agent_permission` VALUES (1, '系统管理', 'xxxx.html', 1, 'icon-credit-card', 1, 0, 1);
INSERT INTO `agent_permission` VALUES (2, '角色管理', NULL, 2, 'icon-credit-card', 1, 1, 2);
INSERT INTO `agent_permission` VALUES (3, '用户管理', NULL, 2, 'icon-credit-card', 1, 1, 3);
INSERT INTO `agent_permission` VALUES (4, '系统日志', NULL, 2, 'icon-credit-card', 1, 1, 4);
INSERT INTO `agent_permission` VALUES (5, '角色管理添加', NULL, NULL, '', 2, 2, NULL);
INSERT INTO `agent_permission` VALUES (6, '角色管理删除', NULL, NULL, NULL, 2, 2, NULL);
INSERT INTO `agent_permission` VALUES (7, '角色管理查看', NULL, NULL, NULL, 2, 2, NULL);
INSERT INTO `agent_permission` VALUES (8, '用户管理添加', NULL, NULL, NULL, 2, 3, NULL);
INSERT INTO `agent_permission` VALUES (9, '用户管理删除', NULL, NULL, NULL, 2, 3, NULL);
INSERT INTO `agent_permission` VALUES (10, '用户管理查看', NULL, NULL, NULL, 2, 3, NULL);
INSERT INTO `agent_permission` VALUES (11, '系统日志查看', NULL, NULL, NULL, 2, 4, NULL);
INSERT INTO `agent_permission` VALUES (12, '系统监控', NULL, NULL, NULL, 1, 1, 5);
INSERT INTO `agent_permission` VALUES (13, '系统监控查看', NULL, NULL, NULL, 2, 12, NULL);
INSERT INTO `agent_permission` VALUES (14, '分销管理', NULL, 1, 'icon-credit-card', 1, 0, 6);
INSERT INTO `agent_permission` VALUES (15, '分销级别', NULL, 2, 'icon-credit-card', 1, 14, 7);
INSERT INTO `agent_permission` VALUES (16, '分销级别查看', NULL, NULL, NULL, 2, 15, NULL);
INSERT INTO `agent_permission` VALUES (17, '分销级别添加', NULL, NULL, NULL, 2, 15, NULL);

-- ----------------------------
-- Table structure for agent_role
-- ----------------------------
DROP TABLE IF EXISTS `agent_role`;
CREATE TABLE `agent_role`  (
  `id` bigint(20) NOT NULL,
  `role_parent_id` bigint(20) NULL DEFAULT 0,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色名',
  `role_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色编码',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `is_last` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '1:最后一级代理，可创建会员，0:不是最后一级',
  `admin_user_id` bigint(20) NULL DEFAULT 0 COMMENT '所属管理员下级管理员角色',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代理商角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agent_role
-- ----------------------------
INSERT INTO `agent_role` VALUES (1083303491852402689, NULL, 'admin', '867cd70f-00cd-4a70-a8d9-57c1d3bd9c61', 1547114653771, NULL, 0, 1, '2019-01-25 13:18:18');
INSERT INTO `agent_role` VALUES (1083632255647973378, NULL, '角色管理', 'd7fe35cb-4591-4878-8f1f-608614c3c968', 1547193037167, NULL, 0, 1, '2019-01-25 13:18:18');
INSERT INTO `agent_role` VALUES (1083632642748694530, NULL, '用户管理', 'e0d697e3-c2a5-488e-b420-9db7d88e677b', 1547193129484, NULL, 0, 1, '2019-01-25 13:18:19');
INSERT INTO `agent_role` VALUES (1083641901943209986, NULL, '超级管理员', '0c370f3b-a937-4125-94fc-52778fd37ae6', 1547195337041, NULL, 0, 1, '2019-01-25 15:58:25');
INSERT INTO `agent_role` VALUES (1085418800952483842, NULL, '1', 'a52f9525-779b-4f15-b91d-0ee9f5de2599', 1547618982764, NULL, 0, 1, '2019-01-25 13:18:24');
INSERT INTO `agent_role` VALUES (1088704347015835650, 0, '2', '9289131e-360c-4e4a-afd4-97d88f4de75e', 1548402317988, NULL, 1, 1, '2019-01-25 16:01:19');

-- ----------------------------
-- Table structure for agent_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `agent_role_permission`;
CREATE TABLE `agent_role_permission`  (
  `id` bigint(20) NOT NULL,
  `r_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `m_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代理商菜单角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agent_role_permission
-- ----------------------------
INSERT INTO `agent_role_permission` VALUES (1083303491911122946, 1083303491852402689, 1);
INSERT INTO `agent_role_permission` VALUES (1083303491923705857, 1083303491852402689, 2);
INSERT INTO `agent_role_permission` VALUES (1083303491936288770, 1083303491852402689, 3);
INSERT INTO `agent_role_permission` VALUES (1083303491936288771, 1083303491852402689, 4);
INSERT INTO `agent_role_permission` VALUES (1083632255710887938, 1083632255647973378, 1);
INSERT INTO `agent_role_permission` VALUES (1083632255727665154, 1083632255647973378, 2);
INSERT INTO `agent_role_permission` VALUES (1083632642803220482, 1083632642748694530, 1);
INSERT INTO `agent_role_permission` VALUES (1083632642811609089, 1083632642748694530, 3);
INSERT INTO `agent_role_permission` VALUES (1083641902006124545, 1083641901943209986, 1);
INSERT INTO `agent_role_permission` VALUES (1083641902014513153, 1083641901943209986, 2);
INSERT INTO `agent_role_permission` VALUES (1083641902031290369, 1083641901943209986, 5);
INSERT INTO `agent_role_permission` VALUES (1083641902048067585, 1083641901943209986, 6);
INSERT INTO `agent_role_permission` VALUES (1083641902056456193, 1083641901943209986, 7);
INSERT INTO `agent_role_permission` VALUES (1083641902060650497, 1083641901943209986, 3);
INSERT INTO `agent_role_permission` VALUES (1083641902069039106, 1083641901943209986, 8);
INSERT INTO `agent_role_permission` VALUES (1083641902077427713, 1083641901943209986, 9);
INSERT INTO `agent_role_permission` VALUES (1083641902085816322, 1083641901943209986, 10);
INSERT INTO `agent_role_permission` VALUES (1083641902102593537, 1083641901943209986, 4);
INSERT INTO `agent_role_permission` VALUES (1083641902110982146, 1083641901943209986, 11);
INSERT INTO `agent_role_permission` VALUES (1083641902110982147, 1083641901943209986, 12);
INSERT INTO `agent_role_permission` VALUES (1083641902110982148, 1083641901943209986, 13);
INSERT INTO `agent_role_permission` VALUES (1085418801011204097, 1085418800952483842, 1);
INSERT INTO `agent_role_permission` VALUES (1085418801027981314, 1085418800952483842, 2);
INSERT INTO `agent_role_permission` VALUES (1085418801044758530, 1085418800952483842, 5);
INSERT INTO `agent_role_permission` VALUES (1085418801057341442, 1085418800952483842, 6);
INSERT INTO `agent_role_permission` VALUES (1085418801069924354, 1085418800952483842, 7);
INSERT INTO `agent_role_permission` VALUES (1085418801078312961, 1085418800952483842, 3);
INSERT INTO `agent_role_permission` VALUES (1085418801095090178, 1085418800952483842, 8);
INSERT INTO `agent_role_permission` VALUES (1085418801111867393, 1085418800952483842, 9);
INSERT INTO `agent_role_permission` VALUES (1085418801120256002, 1085418800952483842, 10);
INSERT INTO `agent_role_permission` VALUES (1085418801128644610, 1085418800952483842, 4);
INSERT INTO `agent_role_permission` VALUES (1085418801137033218, 1085418800952483842, 11);
INSERT INTO `agent_role_permission` VALUES (1085418801145421826, 1085418800952483842, 12);
INSERT INTO `agent_role_permission` VALUES (1085418801153810434, 1085418800952483842, 13);
INSERT INTO `agent_role_permission` VALUES (1085418801153810435, 1083641901943209986, 14);
INSERT INTO `agent_role_permission` VALUES (1085418801153810436, 1083641901943209986, 15);
INSERT INTO `agent_role_permission` VALUES (1085418801153810437, 1083641901943209986, 16);
INSERT INTO `agent_role_permission` VALUES (1085418801153810438, 1083641901943209986, 17);
INSERT INTO `agent_role_permission` VALUES (1088672560147406850, 1088672560080297985, 1);
INSERT INTO `agent_role_permission` VALUES (1088672560168378370, 1088672560080297985, 2);
INSERT INTO `agent_role_permission` VALUES (1088672560193544193, 1088672560080297985, 5);
INSERT INTO `agent_role_permission` VALUES (1088672560210321409, 1088672560080297985, 6);
INSERT INTO `agent_role_permission` VALUES (1088672560227098625, 1088672560080297985, 7);
INSERT INTO `agent_role_permission` VALUES (1088672560235487233, 1088672560080297985, 3);
INSERT INTO `agent_role_permission` VALUES (1088672560252264450, 1088672560080297985, 8);
INSERT INTO `agent_role_permission` VALUES (1088672560269041666, 1088672560080297985, 9);
INSERT INTO `agent_role_permission` VALUES (1088672560290013185, 1088672560080297985, 10);
INSERT INTO `agent_role_permission` VALUES (1088672560302596097, 1088672560080297985, 4);
INSERT INTO `agent_role_permission` VALUES (1088672560319373314, 1088672560080297985, 11);
INSERT INTO `agent_role_permission` VALUES (1088672560336150529, 1088672560080297985, 12);
INSERT INTO `agent_role_permission` VALUES (1088672560344539137, 1088672560080297985, 13);
INSERT INTO `agent_role_permission` VALUES (1088672560361316353, 1088672560080297985, 14);
INSERT INTO `agent_role_permission` VALUES (1088672560382287873, 1088672560080297985, 15);
INSERT INTO `agent_role_permission` VALUES (1088672560390676482, 1088672560080297985, 16);
INSERT INTO `agent_role_permission` VALUES (1088672560407453697, 1088672560080297985, 17);
INSERT INTO `agent_role_permission` VALUES (1088691924649127938, 1088691924611379201, 1);
INSERT INTO `agent_role_permission` VALUES (1088691924674293761, 1088691924611379201, 2);
INSERT INTO `agent_role_permission` VALUES (1088691924695265282, 1088691924611379201, 5);
INSERT INTO `agent_role_permission` VALUES (1088691924712042498, 1088691924611379201, 6);
INSERT INTO `agent_role_permission` VALUES (1088691924741402625, 1088691924611379201, 7);
INSERT INTO `agent_role_permission` VALUES (1088691924758179842, 1088691924611379201, 3);
INSERT INTO `agent_role_permission` VALUES (1088691924774957057, 1088691924611379201, 8);
INSERT INTO `agent_role_permission` VALUES (1088691924791734273, 1088691924611379201, 9);
INSERT INTO `agent_role_permission` VALUES (1088691924804317185, 1088691924611379201, 10);
INSERT INTO `agent_role_permission` VALUES (1088691924821094401, 1088691924611379201, 4);
INSERT INTO `agent_role_permission` VALUES (1088691924829483009, 1088691924611379201, 11);
INSERT INTO `agent_role_permission` VALUES (1088691924846260225, 1088691924611379201, 12);
INSERT INTO `agent_role_permission` VALUES (1088691924863037442, 1088691924611379201, 13);
INSERT INTO `agent_role_permission` VALUES (1088691924879814657, 1088691924611379201, 14);
INSERT INTO `agent_role_permission` VALUES (1088691924896591873, 1088691924611379201, 15);
INSERT INTO `agent_role_permission` VALUES (1088691924909174786, 1088691924611379201, 16);
INSERT INTO `agent_role_permission` VALUES (1088691924934340610, 1088691924611379201, 17);
INSERT INTO `agent_role_permission` VALUES (1088701987405283329, 1088701987367534594, 1);
INSERT INTO `agent_role_permission` VALUES (1088701987434643457, 1088701987367534594, 2);
INSERT INTO `agent_role_permission` VALUES (1088701987464003585, 1088701987367534594, 5);
INSERT INTO `agent_role_permission` VALUES (1088701987480780801, 1088701987367534594, 6);
INSERT INTO `agent_role_permission` VALUES (1088701987493363713, 1088701987367534594, 7);
INSERT INTO `agent_role_permission` VALUES (1088701987514335233, 1088701987367534594, 3);
INSERT INTO `agent_role_permission` VALUES (1088701987531112450, 1088701987367534594, 8);
INSERT INTO `agent_role_permission` VALUES (1088701987552083969, 1088701987367534594, 9);
INSERT INTO `agent_role_permission` VALUES (1088701987568861185, 1088701987367534594, 10);
INSERT INTO `agent_role_permission` VALUES (1088701987581444098, 1088701987367534594, 4);
INSERT INTO `agent_role_permission` VALUES (1088701987589832706, 1088701987367534594, 11);
INSERT INTO `agent_role_permission` VALUES (1088701987606609921, 1088701987367534594, 12);
INSERT INTO `agent_role_permission` VALUES (1088701987623387138, 1088701987367534594, 13);
INSERT INTO `agent_role_permission` VALUES (1088704347082944514, 1088704347015835650, 14);
INSERT INTO `agent_role_permission` VALUES (1088704347099721729, 1088704347015835650, 15);
INSERT INTO `agent_role_permission` VALUES (1088704347116498945, 1088704347015835650, 17);

-- ----------------------------
-- Table structure for agent_user
-- ----------------------------
DROP TABLE IF EXISTS `agent_user`;
CREATE TABLE `agent_user`  (
  `id` bigint(20) NOT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '帐号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '昵称',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '添加时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '其他状态',
  `is_disable` tinyint(1) NULL DEFAULT NULL COMMENT '0:有效 1:禁止登录',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '1:删除，0:未删除',
  `admin_parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父级管理员id',
  `agent_parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父级分销代理商id',
  `user_invite_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理商邀请码',
  `invitation_path` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推荐邀请关系树',
  `inspect_status` tinyint(3) NULL DEFAULT 1 COMMENT '审核状态(1-待审核;2-已审核;3-拒绝)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代理商用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agent_user
-- ----------------------------
INSERT INTO `agent_user` VALUES (1, 'admin', 'admin', NULL, 'admin', NULL, NULL, '2019-01-24 17:49:01', NULL, NULL, 0, 0, 0, NULL, NULL, 1);

-- ----------------------------
-- Table structure for agent_user_info
-- ----------------------------
DROP TABLE IF EXISTS `agent_user_info`;
CREATE TABLE `agent_user_info`  (
  `admin_user_id` bigint(20) NOT NULL,
  `margin` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '保证金',
  `concession_ratio` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '佣金比例',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理商名字',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注详情',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地点',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分销代理商信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for agent_user_role
-- ----------------------------
DROP TABLE IF EXISTS `agent_user_role`;
CREATE TABLE `agent_user_role`  (
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色用户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agent_user_role
-- ----------------------------
INSERT INTO `agent_user_role` VALUES (1083641901943209986, 1);

-- ----------------------------
-- Table structure for app_version
-- ----------------------------
DROP TABLE IF EXISTS `app_version`;
CREATE TABLE `app_version`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '升级标题',
  `app_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `details` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `down_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载地址',
  `app_type` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '系统类型  1:ios 2:android 3:pc',
  `is_forced_update` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否强制更新  0:不强更  1:强更',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '1:删除，0:未删除',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for com_config_agreement
-- ----------------------------
DROP TABLE IF EXISTS `com_config_agreement`;
CREATE TABLE `com_config_agreement`  (
  `id` bigint(20) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '文本',
  `update_time` bigint(20) NOT NULL COMMENT '最后一次修改时间',
  `type` int(4) NOT NULL COMMENT '类型 1 用户协议',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统协议' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of com_config_agreement
-- ----------------------------
INSERT INTO `com_config_agreement` VALUES (1087626971716517890, '<p>2019-01-25 11:39:00.313  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:39:02.420  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1967\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8924\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4549\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4792\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6284\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4974\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6373\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3495\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3300\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4451\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4083\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3010\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4770\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4722\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4105\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8869\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2413\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6478\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6090\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3687\\\"}\"]}<br>2019-01-25 11:39:02.836  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -1043<br>2019-01-25 11:39:03.720  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 2446<br>2019-01-25 11:39:04.921  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:39:07.420  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5780\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3066\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9592\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4254\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7747\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9443\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9639\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"5739\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6447\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"1821\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2504\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3361\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4541\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6391\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4570\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2400\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3170\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9056\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8540\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2364\\\"}\"]}<br>2019-01-25 11:39:08.715  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -5990<br>2019-01-25 11:39:09.227  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 1890<br>2019-01-25 11:39:09.750  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:39:12.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"119\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6473\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"5718\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2158\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5087\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"5634\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2423\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9511\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"531\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3782\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7344\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"5072\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"767\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5767\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3069\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"7093\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4385\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1226\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"79\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2963\\\"}\"]}<br>2019-01-25 11:39:13.336  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -648<br>2019-01-25 11:39:15.572  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:39:17.421  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"5295\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3768\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6464\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1788\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1624\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4909\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9513\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3550\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7946\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3954\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"5860\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2162\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"37\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"877\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"197\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2941\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"6451\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5538\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3386\\\"}\"]}<br>2019-01-25 11:39:17.463  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -5858<br>2019-01-25 11:39:19.746  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:39:22.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3748\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"7272\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2292\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"816\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9458\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6027\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9817\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6097\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4411\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4189\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2949\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4141\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6976\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"310\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8647\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2801\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4304\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"325\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1546\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7074\\\"}\"]}<br>2019-01-25 11:39:25.046  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕,本次模拟无交易&lt;/a&gt;<br>2019-01-25 11:39:27.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9615\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4135\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2150\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8188\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"6591\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4032\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9987\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3823\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3218\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"6023\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4067\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"441\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9256\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3039\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5568\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9533\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2134\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1744\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"454\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"1155\\\"}\"]}<br>2019-01-25 11:39:28.336  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 4047<br>2019-01-25 11:39:30.609  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:39:32.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"886\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"685\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"753\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8378\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1784\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7107\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7526\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2679\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"119\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9341\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4588\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7856\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6111\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9364\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4317\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"595\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2084\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9353\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4250\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8744\\\"}\"]}<br>2019-01-25 11:39:32.963  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -3702<br>2019-01-25 11:39:32.984  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -6970<br>2019-01-25 11:39:33.251  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 90<br>2019-01-25 11:39:33.252  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -1399<br>2019-01-25 11:39:34.071  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:39:37.426  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1232\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3854\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7182\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6920\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4281\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2068\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1751\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"7082\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6219\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9043\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8283\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1488\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6956\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1876\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8585\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"6771\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2211\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4226\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8626\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"557\\\"}\"]}<br>2019-01-25 11:39:38.412  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -7051<br>2019-01-25 11:39:39.350  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -2917<br>2019-01-25 11:39:40.429  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:39:42.421  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9202\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4803\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8808\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"56\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9218\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"109\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4805\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6047\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9599\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1281\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3844\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4220\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6740\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7949\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8520\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"365\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"235\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4462\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9797\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1776\\\"}\"]}<br>2019-01-25 11:39:42.977  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 1253<br>2019-01-25 11:39:43.778  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 4568<br>2019-01-25 11:39:45.880  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:39:47.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4351\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9214\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"7164\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"5146\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4230\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"911\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4266\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4218\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2742\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7759\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6603\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"6090\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3055\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7728\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1154\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1396\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3081\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7557\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8182\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9828\\\"}\"]}<br>2019-01-25 11:39:47.842  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 7818<br>2019-01-25 11:39:49.396  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:39:52.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1940\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3449\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6089\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4678\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1445\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9926\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6388\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"869\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2885\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3609\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9066\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8604\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3560\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6101\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6366\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9862\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3267\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3406\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1736\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4974\\\"}\"]}<br>2019-01-25 11:39:53.538  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -296<br>2019-01-25 11:39:53.723  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:39:57.420  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3011\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8841\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8956\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8317\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9222\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7064\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2157\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3239\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1990\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"94\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"1093\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1157\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6200\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3100\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8148\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2892\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9066\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4348\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"1637\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1420\\\"}\"]}<br>2019-01-25 11:39:58.241  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -3189<br>2019-01-25 11:39:58.485  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 4493<br>2019-01-25 11:39:58.729  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 7319<br>2019-01-25 11:40:00.201  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:02.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2594\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"5853\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"463\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7718\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8811\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"7297\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"497\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1210\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6659\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3602\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4907\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6797\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8747\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"6119\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3670\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2339\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2743\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1955\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9615\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1971\\\"}\"]}<br>2019-01-25 11:40:03.315  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -3525<br>2019-01-25 11:40:03.320  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 3898<br>2019-01-25 11:40:04.647  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:07.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3724\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7201\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8146\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9613\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2793\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4462\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7083\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5662\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8167\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3118\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8109\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8671\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"7145\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"7008\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7706\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8612\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6030\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6111\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5532\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9757\\\"}\"]}<br>2019-01-25 11:40:08.176  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -1411<br>2019-01-25 11:40:10.207  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:12.420  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9391\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5179\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2708\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3755\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"6514\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4063\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6181\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4645\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5372\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8079\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9838\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8959\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"5255\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1854\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2863\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"524\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2284\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6961\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9022\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3538\\\"}\"]}<br>2019-01-25 11:40:12.991  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -447<br>2019-01-25 11:40:13.013  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 6528<br>2019-01-25 11:40:13.094  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 2895<br>2019-01-25 11:40:13.096  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -1782<br>2019-01-25 11:40:13.507  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -6314<br>2019-01-25 11:40:14.642  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:17.421  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4239\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3141\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4968\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2017\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5028\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"5522\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8746\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"43\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3105\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1017\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3318\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"672\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8649\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"80\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2504\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7270\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1043\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4559\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2719\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5912\\\"}\"]}<br>2019-01-25 11:40:17.956  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -4410<br>2019-01-25 11:40:17.980  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 1735<br>2019-01-25 11:40:18.410  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 2098<br>2019-01-25 11:40:19.403  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 2249<br>2019-01-25 11:40:20.581  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:22.420  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7715\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7512\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7863\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"913\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7506\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"464\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5531\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7403\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9969\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5568\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"7127\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4399\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4460\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3593\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8902\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7939\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8378\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"1527\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"7162\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4423\\\"}\"]}<br>2019-01-25 11:40:22.439  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 3255<br>2019-01-25 11:40:22.945  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 5985<br>2019-01-25 11:40:24.016  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -3510<br>2019-01-25 11:40:24.730  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:27.421  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5390\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2588\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5568\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4005\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2782\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3156\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1280\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9301\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"700\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"5791\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2584\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1464\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2045\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4708\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7863\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4553\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7273\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"5294\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"461\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"5746\\\"}\"]}<br>2019-01-25 11:40:28.056  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 2806<br>2019-01-25 11:40:29.125  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 5107<br>2019-01-25 11:40:30.000  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:32.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5008\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8104\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"5767\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7006\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6757\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2720\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4865\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2651\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7474\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4391\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5115\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"849\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1445\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8596\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2167\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2643\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3684\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"278\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8882\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2991\\\"}\"]}<br>2019-01-25 11:40:33.185  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -3588<br>2019-01-25 11:40:33.197  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 2841<br>2019-01-25 11:40:33.579  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 5461<br>2019-01-25 11:40:34.609  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:37.420  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9957\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6282\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4574\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4243\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2882\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"449\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4373\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8720\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3596\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"194\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9536\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2259\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1023\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5352\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2140\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8193\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9943\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5549\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2871\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5821\\\"}\"]}<br>2019-01-25 11:40:37.747  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 7698<br>2019-01-25 11:40:37.748  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 8934<br>2019-01-25 11:40:37.767  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -1911<br>2019-01-25 11:40:38.809  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -1578<br>2019-01-25 11:40:39.434  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:42.420  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3828\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1434\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8393\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"7046\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8589\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4947\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3020\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4846\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4607\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4408\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3035\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"6857\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6259\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1341\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5386\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2287\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"5129\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1569\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1049\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2597\\\"}\"]}<br>2019-01-25 11:40:42.826  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -3029<br>2019-01-25 11:40:43.153  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -135<br>2019-01-25 11:40:44.136  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:47.421  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"369\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2164\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7862\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"5842\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2155\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9768\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"352\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9737\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"582\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3077\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4995\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"1219\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"312\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8893\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"207\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3589\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2814\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9926\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"7433\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3893\\\"}\"]}<br>2019-01-25 11:40:48.169  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -4626<br>2019-01-25 11:40:48.176  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -850<br>2019-01-25 11:40:48.177  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 57<br>2019-01-25 11:40:48.966  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -650<br>2019-01-25 11:40:49.000  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -7762<br>2019-01-25 11:40:49.264  INFO 5092 --- [trap-executor-0] c.n.d.s.r.aws.ConfigClusterResolver      : Resolving eureka endpoints via configuration<br>2019-01-25 11:40:50.615  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:52.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7915\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9275\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9769\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9241\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5003\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4642\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3442\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9499\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8767\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7146\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2873\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2557\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8589\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9112\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3986\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9113\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9015\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3481\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4604\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3954\\\"}\"]}<br>2019-01-25 11:40:53.007  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 5358<br>2019-01-25 11:40:53.921  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 162<br>2019-01-25 11:40:56.186  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:40:57.421  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3481\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4458\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6413\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5824\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3556\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2137\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5229\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5009\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9705\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3761\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4916\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4130\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8480\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1664\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3803\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9431\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2045\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"1837\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"7216\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3612\\\"}\"]}<br>2019-01-25 11:40:57.903  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -649<br>2019-01-25 11:40:57.904  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 1817<br>2019-01-25 11:40:59.143  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -803<br>2019-01-25 11:40:59.755  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:41:02.420  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2774\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"554\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6842\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6356\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3700\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"5120\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8753\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6251\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8845\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"793\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4814\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8692\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2836\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1107\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"5418\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2584\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8057\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6742\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9322\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3788\\\"}\"]}<br>2019-01-25 11:41:02.820  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -5918<br>2019-01-25 11:41:02.821  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -62<br>2019-01-25 11:41:02.821  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -2644<br>2019-01-25 11:41:03.010  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -2030<br>2019-01-25 11:41:03.012  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -6188<br>2019-01-25 11:41:04.041  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 2568<br>2019-01-25 11:41:04.082  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:41:07.421  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8240\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2300\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3196\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"7946\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4736\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"7354\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2900\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9242\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"713\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9902\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"218\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8256\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5998\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7589\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9802\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8810\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"962\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2077\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1488\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3272\\\"}\"]}<br>2019-01-25 11:41:07.980  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 2242<br>2019-01-25 11:41:09.396  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 4674<br>2019-01-25 11:41:10.084  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:41:12.420  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9958\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6282\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3228\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7432\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9855\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"6655\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4466\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8975\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"902\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9135\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8981\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"345\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"487\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2478\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"915\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1975\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4390\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4185\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4601\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6644\\\"}\"]}<br>2019-01-25 11:41:14.733  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕,本次模拟无交易&lt;/a&gt;<br>2019-01-25 11:41:17.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"5678\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5007\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"145\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"7865\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7599\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6091\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"936\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3767\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3668\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8977\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6412\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2324\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"5183\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"7323\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6690\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"5875\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"808\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5754\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"889\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2899\\\"}\"]}<br>2019-01-25 11:41:18.729  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -747<br>2019-01-25 11:41:19.715  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -744<br>2019-01-25 11:41:20.255  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 4966<br>2019-01-25 11:41:20.257  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:41:22.420  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9073\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3717\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4631\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2530\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9804\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4987\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3673\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4726\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3193\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8790\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9620\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"9580\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4102\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6103\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3919\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9702\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4595\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"8734\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"6641\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2744\\\"}\"]}<br>2019-01-25 11:41:22.591  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -507<br>2019-01-25 11:41:22.593  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 2970<br>2019-01-25 11:41:24.234  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:41:27.421  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3390\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1345\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6081\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"7709\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8392\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6526\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3257\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1255\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"1980\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"5296\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5498\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"647\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2286\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6673\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"7049\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3598\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2578\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2458\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9946\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9071\\\"}\"]}<br>2019-01-25 11:41:27.693  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -2108<br>2019-01-25 11:41:27.694  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -3659<br>2019-01-25 11:41:29.128  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -3865<br>2019-01-25 11:41:30.147  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:41:32.420  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4306\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6317\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"8311\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1938\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"7572\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"164\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7864\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4643\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1714\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"341\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9027\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"734\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3557\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4189\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"6402\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"326\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"4210\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"9463\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"388\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"138\\\"}\"]}<br>2019-01-25 11:41:33.167  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -4721<br>2019-01-25 11:41:33.176  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ -2096<br>2019-01-25 11:41:33.958  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 7923<br>2019-01-25 11:41:34.878  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 1800<br>2019-01-25 11:41:34.928  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:41:37.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"7131\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9505\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3506\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"7037\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8015\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1282\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"3422\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"1632\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"2210\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"9896\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1077\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3527\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2236\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7027\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1557\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"3952\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"8624\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"6192\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8007\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2981\\\"}\"]}<br>2019-01-25 11:41:38.441  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 5553<br>2019-01-25 11:41:38.443  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 已产生一笔交易，本次交易模拟金额为：￥ 881<br>2019-01-25 11:41:39.671  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 结束通道: &lt;a&gt;本次交易完毕&lt;/a&gt;<br>2019-01-25 11:41:42.419  INFO 5092 --- [cTaskExecutor-1] c.admin.web.AdminControllerApplication   : 本次交易模拟数据为:{\"link1\":[\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"2798\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"9169\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"7637\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1824\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"168\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"6401\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"2984\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"1955\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"4451\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"3292\\\"}\"],\"link2\":[\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"1186\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"8433\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"3531\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"2788\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5188\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4651\\\"}\",\"{\\\"type\\\":\\\"2\\\",\\\"moeny\\\":\\\"1141\\\"}\",\"{\\\"type\\\":\\\"0\\\",\\\"moeny\\\":\\\"5353\\\"}\",\"{\\\"type\\\":\\\"1\\\",\\\"moeny\\\":\\\"4744\\\"}\",\"{\\\"type\\\":\\\"3\\\",\\\"moeny\\\":\\\"4587\\\"}\"]}<br>&nbsp;<br></p>', 1548387786599, 1, '2019-01-25 11:43:05');
INSERT INTO `com_config_agreement` VALUES (1087627059243253761, '<div id=\"leftmenu\"><div id=\"blog-calendar\"><table id=\"blogCalendar\" title=\"Calendar\" cellspacing=\"0\" cellpadding=\"0\">\n	<tbody><tr><td colspan=\"7\"><table cellspacing=\"0\">\n		<tbody><tr><td><a href=\"javascript:void(0);\" onclick=\"loadBlogCalendar(\'2018/12/01\');return false;\">&lt;</a></td><td align=\"center\">2019年1月</td><td align=\"right\"><a href=\"javascript:void(0);\" onclick=\"loadBlogCalendar(\'2019/02/01\');return false;\">&gt;</a></td></tr>\n	</tbody></table></td></tr><tr><th abbr=\"日\" scope=\"col\" align=\"center\">日</th><th abbr=\"一\" scope=\"col\" align=\"center\">一</th><th abbr=\"二\" scope=\"col\" align=\"center\">二</th><th abbr=\"三\" scope=\"col\" align=\"center\">三</th><th abbr=\"四\" scope=\"col\" align=\"center\">四</th><th abbr=\"五\" scope=\"col\" align=\"center\">五</th><th abbr=\"六\" scope=\"col\" align=\"center\">六</th></tr><tr><td align=\"center\">30</td><td align=\"center\">31</td><td align=\"center\">1</td><td align=\"center\">2</td><td align=\"center\">3</td><td align=\"center\">4</td><td align=\"center\">5</td></tr><tr><td align=\"center\">6</td><td align=\"center\">7</td><td align=\"center\">8</td><td align=\"center\">9</td><td align=\"center\">10</td><td align=\"center\">11</td><td align=\"center\">12</td></tr><tr><td align=\"center\">13</td><td align=\"center\">14</td><td align=\"center\">15</td><td align=\"center\">16</td><td align=\"center\">17</td><td align=\"center\">18</td><td align=\"center\">19</td></tr><tr><td align=\"center\">20</td><td align=\"center\">21</td><td align=\"center\">22</td><td align=\"center\">23</td><td align=\"center\">24</td><td align=\"center\">25</td><td align=\"center\">26</td></tr><tr><td align=\"center\">27</td><td align=\"center\">28</td><td align=\"center\">29</td><td align=\"center\">30</td><td align=\"center\">31</td><td align=\"center\">1</td><td align=\"center\">2</td></tr><tr><td align=\"center\">3 <br></td><td align=\"center\"></td><td align=\"center\"></td><td align=\"center\"></td><td align=\"center\"></td><td align=\"center\"></td><td align=\"center\"></td></tr></tbody></table></div></div><div><div>\n    </div></div><a name=\"demo\"> </a><div>\n  <fieldset>\n    <legend>体验</legend>\n  </fieldset>\n</div><div>\n  <div>\n    <span>iframe 版</span>\n    \n    \n  </div>\n  <div>\n    <div id=\"LAY_preview\" lay-filter=\"preview\" lay-anim=\"fade\" lay-indicator=\"outside\" lay-arrow=\"hover\">\n      <div carousel-item=\"\">\n        <div>\n          <a href=\"https://www.layui.com/admin/std/dist/views/\" target=\"_blank\">\n            <img src=\"https://cdn.layui.com/upload/2018_5/168_1527689303593_64334.png\" alt=\"iframe 版\">\n          </a>\n        </div>\n        \n        \n      </div>\n    <div><ul><li><br></li></ul></div></div></div></div><p><br></p>', 1548212338956, 2, '2019-02-23 11:23:02');

-- ----------------------------
-- Table structure for com_config_area
-- ----------------------------
DROP TABLE IF EXISTS `com_config_area`;
CREATE TABLE `com_config_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '区域主键',
  `area_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `area_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域代码',
  `area_short` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域简称',
  `area_is_hot` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否热门(0:否、1:是)',
  `area_sequence` int(11) NULL DEFAULT NULL COMMENT '区域序列',
  `area_parent_id` int(11) NULL DEFAULT NULL COMMENT '上级主键',
  `letter` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `init_date` datetime(0) NULL DEFAULT NULL COMMENT '初始时间',
  `init_addr` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '初始地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`area_parent_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 900001 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of com_config_area
-- ----------------------------
INSERT INTO `com_config_area` VALUES (110000, '北京', 'Beijing', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110100, '北京市', 'Beijing', NULL, NULL, NULL, 110000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110101, '东城区', 'Dongcheng', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110102, '西城区', 'Xicheng', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110105, '朝阳区', 'Chaoyang', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110106, '丰台区', 'Fengtai', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110107, '石景山区', 'Shijingshan', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110108, '海淀区', 'Haidian', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110109, '门头沟区', 'Mentougou', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110111, '房山区', 'Fangshan', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110112, '通州区', 'Tongzhou', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110113, '顺义区', 'Shunyi', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110114, '昌平区', 'Changping', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110115, '大兴区', 'Daxing', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110116, '怀柔区', 'Huairou', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110117, '平谷区', 'Pinggu', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110228, '密云县', 'Miyun', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (110229, '延庆县', 'Yanqing', NULL, NULL, NULL, 110100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120000, '天津', 'Tianjin', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120100, '天津市', 'Tianjin', NULL, NULL, NULL, 120000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120101, '和平区', 'Heping', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120102, '河东区', 'Hedong', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120103, '河西区', 'Hexi', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120104, '南开区', 'Nankai', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120105, '河北区', 'Hebei', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120106, '红桥区', 'Hongqiao', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120110, '东丽区', 'Dongli', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120111, '西青区', 'Xiqing', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120112, '津南区', 'Jinnan', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120113, '北辰区', 'Beichen', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120114, '武清区', 'Wuqing', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120115, '宝坻区', 'Baodi', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120116, '滨海新区', 'Binhaixinqu', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120221, '宁河县', 'Ninghe', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120223, '静海县', 'Jinghai', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (120225, '蓟县', 'Jixian', NULL, NULL, NULL, 120100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130000, '河北省', 'Hebei', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130100, '石家庄市', 'Shijiazhuang', NULL, NULL, NULL, 130000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130102, '长安区', 'Chang\'an', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130104, '桥西区', 'Qiaoxi', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130105, '新华区', 'Xinhua', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130107, '井陉矿区', 'Jingxingkuangqu', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130108, '裕华区', 'Yuhua', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130109, '藁城区', 'Gaocheng', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130110, '鹿泉区', 'Luquan', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130111, '栾城区', 'Luancheng', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130121, '井陉县', 'Jingxing', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130123, '正定县', 'Zhengding', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130125, '行唐县', 'Xingtang', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130126, '灵寿县', 'Lingshou', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130127, '高邑县', 'Gaoyi', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130128, '深泽县', 'Shenze', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130129, '赞皇县', 'Zanhuang', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130130, '无极县', 'Wuji', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130131, '平山县', 'Pingshan', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130132, '元氏县', 'Yuanshi', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130133, '赵县', 'Zhaoxian', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130181, '辛集市', 'Xinji', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130183, '晋州市', 'Jinzhou', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130184, '新乐市', 'Xinle', NULL, NULL, NULL, 130100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130200, '唐山市', 'Tangshan', NULL, NULL, NULL, 130000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130202, '路南区', 'Lunan', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130203, '路北区', 'Lubei', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130204, '古冶区', 'Guye', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130205, '开平区', 'Kaiping', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130207, '丰南区', 'Fengnan', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130208, '丰润区', 'Fengrun', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130209, '曹妃甸区', 'Caofeidian', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130223, '滦县', 'Luanxian', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130224, '滦南县', 'Luannan', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130225, '乐亭县', 'Laoting', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130227, '迁西县', 'Qianxi', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130229, '玉田县', 'Yutian', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130281, '遵化市', 'Zunhua', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130283, '迁安市', 'Qian\'an', NULL, NULL, NULL, 130200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130300, '秦皇岛市', 'Qinhuangdao', NULL, NULL, NULL, 130000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130302, '海港区', 'Haigang', NULL, NULL, NULL, 130300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130303, '山海关区', 'Shanhaiguan', NULL, NULL, NULL, 130300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130304, '北戴河区', 'Beidaihe', NULL, NULL, NULL, 130300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130321, '青龙满族自治县', 'Qinglong', NULL, NULL, NULL, 130300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130322, '昌黎县', 'Changli', NULL, NULL, NULL, 130300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130323, '抚宁县', 'Funing', NULL, NULL, NULL, 130300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130324, '卢龙县', 'Lulong', NULL, NULL, NULL, 130300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130400, '邯郸市', 'Handan', NULL, NULL, NULL, 130000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130402, '邯山区', 'Hanshan', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130403, '丛台区', 'Congtai', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130404, '复兴区', 'Fuxing', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130406, '峰峰矿区', 'Fengfengkuangqu', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130421, '邯郸县', 'Handan', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130423, '临漳县', 'Linzhang', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130424, '成安县', 'Cheng\'an', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130425, '大名县', 'Daming', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130426, '涉县', 'Shexian', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130427, '磁县', 'Cixian', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130428, '肥乡县', 'Feixiang', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130429, '永年县', 'Yongnian', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130430, '邱县', 'Qiuxian', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130431, '鸡泽县', 'Jize', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130432, '广平县', 'Guangping', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130433, '馆陶县', 'Guantao', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130434, '魏县', 'Weixian', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130435, '曲周县', 'Quzhou', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130481, '武安市', 'Wu\'an', NULL, NULL, NULL, 130400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130500, '邢台市', 'Xingtai', NULL, NULL, NULL, 130000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130502, '桥东区', 'Qiaodong', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130503, '桥西区', 'Qiaoxi', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130521, '邢台县', 'Xingtai', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130522, '临城县', 'Lincheng', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130523, '内丘县', 'Neiqiu', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130524, '柏乡县', 'Baixiang', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130525, '隆尧县', 'Longyao', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130526, '任县', 'Renxian', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130527, '南和县', 'Nanhe', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130528, '宁晋县', 'Ningjin', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130529, '巨鹿县', 'Julu', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130530, '新河县', 'Xinhe', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130531, '广宗县', 'Guangzong', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130532, '平乡县', 'Pingxiang', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130533, '威县', 'Weixian', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130534, '清河县', 'Qinghe', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130535, '临西县', 'Linxi', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130581, '南宫市', 'Nangong', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130582, '沙河市', 'Shahe', NULL, NULL, NULL, 130500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130600, '保定市', 'Baoding', NULL, NULL, NULL, 130000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130602, '新市区', 'Xinshi', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130603, '北市区', 'Beishi', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130604, '南市区', 'Nanshi', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130621, '满城县', 'Mancheng', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130622, '清苑县', 'Qingyuan', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130623, '涞水县', 'Laishui', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130624, '阜平县', 'Fuping', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130625, '徐水县', 'Xushui', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130626, '定兴县', 'Dingxing', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130627, '唐县', 'Tangxian', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130628, '高阳县', 'Gaoyang', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130629, '容城县', 'Rongcheng', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130630, '涞源县', 'Laiyuan', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130631, '望都县', 'Wangdu', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130632, '安新县', 'Anxin', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130633, '易县', 'Yixian', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130634, '曲阳县', 'Quyang', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130635, '蠡县', 'Lixian', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130636, '顺平县', 'Shunping', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130637, '博野县', 'Boye', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130638, '雄县', 'Xiongxian', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130681, '涿州市', 'Zhuozhou', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130682, '定州市', 'Dingzhou', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130683, '安国市', 'Anguo', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130684, '高碑店市', 'Gaobeidian', NULL, NULL, NULL, 130600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130700, '张家口市', 'Zhangjiakou', NULL, NULL, NULL, 130000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130702, '桥东区', 'Qiaodong', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130703, '桥西区', 'Qiaoxi', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130705, '宣化区', 'Xuanhua', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130706, '下花园区', 'Xiahuayuan', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130721, '宣化县', 'Xuanhua', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130722, '张北县', 'Zhangbei', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130723, '康保县', 'Kangbao', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130724, '沽源县', 'Guyuan', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130725, '尚义县', 'Shangyi', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130726, '蔚县', 'Yuxian', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130727, '阳原县', 'Yangyuan', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130728, '怀安县', 'Huai\'an', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130729, '万全县', 'Wanquan', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130730, '怀来县', 'Huailai', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130731, '涿鹿县', 'Zhuolu', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130732, '赤城县', 'Chicheng', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130733, '崇礼县', 'Chongli', NULL, NULL, NULL, 130700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130800, '承德市', 'Chengde', NULL, NULL, NULL, 130000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130802, '双桥区', 'Shuangqiao', NULL, NULL, NULL, 130800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130803, '双滦区', 'Shuangluan', NULL, NULL, NULL, 130800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130804, '鹰手营子矿区', 'Yingshouyingzikuangqu', NULL, NULL, NULL, 130800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130821, '承德县', 'Chengde', NULL, NULL, NULL, 130800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130822, '兴隆县', 'Xinglong', NULL, NULL, NULL, 130800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130823, '平泉县', 'Pingquan', NULL, NULL, NULL, 130800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130824, '滦平县', 'Luanping', NULL, NULL, NULL, 130800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130825, '隆化县', 'Longhua', NULL, NULL, NULL, 130800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130826, '丰宁满族自治县', 'Fengning', NULL, NULL, NULL, 130800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130827, '宽城满族自治县', 'Kuancheng', NULL, NULL, NULL, 130800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130828, '围场满族蒙古族自治县', 'Weichang', NULL, NULL, NULL, 130800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130900, '沧州市', 'Cangzhou', NULL, NULL, NULL, 130000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130902, '新华区', 'Xinhua', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130903, '运河区', 'Yunhe', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130921, '沧县', 'Cangxian', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130922, '青县', 'Qingxian', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130923, '东光县', 'Dongguang', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130924, '海兴县', 'Haixing', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130925, '盐山县', 'Yanshan', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130926, '肃宁县', 'Suning', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130927, '南皮县', 'Nanpi', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130928, '吴桥县', 'Wuqiao', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130929, '献县', 'Xianxian', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130930, '孟村回族自治县', 'Mengcun', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130981, '泊头市', 'Botou', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130982, '任丘市', 'Renqiu', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130983, '黄骅市', 'Huanghua', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (130984, '河间市', 'Hejian', NULL, NULL, NULL, 130900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131000, '廊坊市', 'Langfang', NULL, NULL, NULL, 130000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131002, '安次区', 'Anci', NULL, NULL, NULL, 131000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131003, '广阳区', 'Guangyang', NULL, NULL, NULL, 131000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131022, '固安县', 'Gu\'an', NULL, NULL, NULL, 131000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131023, '永清县', 'Yongqing', NULL, NULL, NULL, 131000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131024, '香河县', 'Xianghe', NULL, NULL, NULL, 131000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131025, '大城县', 'Daicheng', NULL, NULL, NULL, 131000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131026, '文安县', 'Wen\'an', NULL, NULL, NULL, 131000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131028, '大厂回族自治县', 'Dachang', NULL, NULL, NULL, 131000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131081, '霸州市', 'Bazhou', NULL, NULL, NULL, 131000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131082, '三河市', 'Sanhe', NULL, NULL, NULL, 131000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131100, '衡水市', 'Hengshui', NULL, NULL, NULL, 130000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131102, '桃城区', 'Taocheng', NULL, NULL, NULL, 131100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131121, '枣强县', 'Zaoqiang', NULL, NULL, NULL, 131100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131122, '武邑县', 'Wuyi', NULL, NULL, NULL, 131100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131123, '武强县', 'Wuqiang', NULL, NULL, NULL, 131100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131124, '饶阳县', 'Raoyang', NULL, NULL, NULL, 131100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131125, '安平县', 'Anping', NULL, NULL, NULL, 131100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131126, '故城县', 'Gucheng', NULL, NULL, NULL, 131100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131127, '景县', 'Jingxian', NULL, NULL, NULL, 131100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131128, '阜城县', 'Fucheng', NULL, NULL, NULL, 131100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131181, '冀州市', 'Jizhou', NULL, NULL, NULL, 131100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (131182, '深州市', 'Shenzhou', NULL, NULL, NULL, 131100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140000, '山西省', 'Shanxi', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140100, '太原市', 'Taiyuan', NULL, NULL, NULL, 140000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140105, '小店区', 'Xiaodian', NULL, NULL, NULL, 140100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140106, '迎泽区', 'Yingze', NULL, NULL, NULL, 140100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140107, '杏花岭区', 'Xinghualing', NULL, NULL, NULL, 140100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140108, '尖草坪区', 'Jiancaoping', NULL, NULL, NULL, 140100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140109, '万柏林区', 'Wanbailin', NULL, NULL, NULL, 140100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140110, '晋源区', 'Jinyuan', NULL, NULL, NULL, 140100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140121, '清徐县', 'Qingxu', NULL, NULL, NULL, 140100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140122, '阳曲县', 'Yangqu', NULL, NULL, NULL, 140100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140123, '娄烦县', 'Loufan', NULL, NULL, NULL, 140100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140181, '古交市', 'Gujiao', NULL, NULL, NULL, 140100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140200, '大同市', 'Datong', NULL, NULL, NULL, 140000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140202, '城区', 'Chengqu', NULL, NULL, NULL, 140200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140203, '矿区', 'Kuangqu', NULL, NULL, NULL, 140200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140211, '南郊区', 'Nanjiao', NULL, NULL, NULL, 140200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140212, '新荣区', 'Xinrong', NULL, NULL, NULL, 140200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140221, '阳高县', 'Yanggao', NULL, NULL, NULL, 140200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140222, '天镇县', 'Tianzhen', NULL, NULL, NULL, 140200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140223, '广灵县', 'Guangling', NULL, NULL, NULL, 140200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140224, '灵丘县', 'Lingqiu', NULL, NULL, NULL, 140200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140225, '浑源县', 'Hunyuan', NULL, NULL, NULL, 140200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140226, '左云县', 'Zuoyun', NULL, NULL, NULL, 140200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140227, '大同县', 'Datong', NULL, NULL, NULL, 140200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140300, '阳泉市', 'Yangquan', NULL, NULL, NULL, 140000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140302, '城区', 'Chengqu', NULL, NULL, NULL, 140300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140303, '矿区', 'Kuangqu', NULL, NULL, NULL, 140300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140311, '郊区', 'Jiaoqu', NULL, NULL, NULL, 140300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140321, '平定县', 'Pingding', NULL, NULL, NULL, 140300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140322, '盂县', 'Yuxian', NULL, NULL, NULL, 140300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140400, '长治市', 'Changzhi', NULL, NULL, NULL, 140000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140402, '城区', 'Chengqu', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140411, '郊区', 'Jiaoqu', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140421, '长治县', 'Changzhi', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140423, '襄垣县', 'Xiangyuan', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140424, '屯留县', 'Tunliu', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140425, '平顺县', 'Pingshun', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140426, '黎城县', 'Licheng', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140427, '壶关县', 'Huguan', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140428, '长子县', 'Zhangzi', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140429, '武乡县', 'Wuxiang', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140430, '沁县', 'Qinxian', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140431, '沁源县', 'Qinyuan', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140481, '潞城市', 'Lucheng', NULL, NULL, NULL, 140400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140500, '晋城市', 'Jincheng', NULL, NULL, NULL, 140000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140502, '城区', 'Chengqu', NULL, NULL, NULL, 140500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140521, '沁水县', 'Qinshui', NULL, NULL, NULL, 140500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140522, '阳城县', 'Yangcheng', NULL, NULL, NULL, 140500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140524, '陵川县', 'Lingchuan', NULL, NULL, NULL, 140500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140525, '泽州县', 'Zezhou', NULL, NULL, NULL, 140500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140581, '高平市', 'Gaoping', NULL, NULL, NULL, 140500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140600, '朔州市', 'Shuozhou', NULL, NULL, NULL, 140000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140602, '朔城区', 'Shuocheng', NULL, NULL, NULL, 140600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140603, '平鲁区', 'Pinglu', NULL, NULL, NULL, 140600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140621, '山阴县', 'Shanyin', NULL, NULL, NULL, 140600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140622, '应县', 'Yingxian', NULL, NULL, NULL, 140600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140623, '右玉县', 'Youyu', NULL, NULL, NULL, 140600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140624, '怀仁县', 'Huairen', NULL, NULL, NULL, 140600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140700, '晋中市', 'Jinzhong', NULL, NULL, NULL, 140000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140702, '榆次区', 'Yuci', NULL, NULL, NULL, 140700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140721, '榆社县', 'Yushe', NULL, NULL, NULL, 140700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140722, '左权县', 'Zuoquan', NULL, NULL, NULL, 140700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140723, '和顺县', 'Heshun', NULL, NULL, NULL, 140700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140724, '昔阳县', 'Xiyang', NULL, NULL, NULL, 140700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140725, '寿阳县', 'Shouyang', NULL, NULL, NULL, 140700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140726, '太谷县', 'Taigu', NULL, NULL, NULL, 140700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140727, '祁县', 'Qixian', NULL, NULL, NULL, 140700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140728, '平遥县', 'Pingyao', NULL, NULL, NULL, 140700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140729, '灵石县', 'Lingshi', NULL, NULL, NULL, 140700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140781, '介休市', 'Jiexiu', NULL, NULL, NULL, 140700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140800, '运城市', 'Yuncheng', NULL, NULL, NULL, 140000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140802, '盐湖区', 'Yanhu', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140821, '临猗县', 'Linyi', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140822, '万荣县', 'Wanrong', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140823, '闻喜县', 'Wenxi', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140824, '稷山县', 'Jishan', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140825, '新绛县', 'Xinjiang', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140826, '绛县', 'Jiangxian', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140827, '垣曲县', 'Yuanqu', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140828, '夏县', 'Xiaxian', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140829, '平陆县', 'Pinglu', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140830, '芮城县', 'Ruicheng', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140881, '永济市', 'Yongji', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140882, '河津市', 'Hejin', NULL, NULL, NULL, 140800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140900, '忻州市', 'Xinzhou', NULL, NULL, NULL, 140000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140902, '忻府区', 'Xinfu', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140921, '定襄县', 'Dingxiang', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140922, '五台县', 'Wutai', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140923, '代县', 'Daixian', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140924, '繁峙县', 'Fanshi', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140925, '宁武县', 'Ningwu', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140926, '静乐县', 'Jingle', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140927, '神池县', 'Shenchi', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140928, '五寨县', 'Wuzhai', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140929, '岢岚县', 'Kelan', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140930, '河曲县', 'Hequ', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140931, '保德县', 'Baode', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140932, '偏关县', 'Pianguan', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (140981, '原平市', 'Yuanping', NULL, NULL, NULL, 140900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141000, '临汾市', 'Linfen', NULL, NULL, NULL, 140000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141002, '尧都区', 'Yaodu', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141021, '曲沃县', 'Quwo', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141022, '翼城县', 'Yicheng', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141023, '襄汾县', 'Xiangfen', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141024, '洪洞县', 'Hongtong', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141025, '古县', 'Guxian', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141026, '安泽县', 'Anze', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141027, '浮山县', 'Fushan', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141028, '吉县', 'Jixian', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141029, '乡宁县', 'Xiangning', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141030, '大宁县', 'Daning', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141031, '隰县', 'Xixian', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141032, '永和县', 'Yonghe', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141033, '蒲县', 'Puxian', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141034, '汾西县', 'Fenxi', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141081, '侯马市', 'Houma', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141082, '霍州市', 'Huozhou', NULL, NULL, NULL, 141000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141100, '吕梁市', 'Lvliang', NULL, NULL, NULL, 140000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141102, '离石区', 'Lishi', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141121, '文水县', 'Wenshui', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141122, '交城县', 'Jiaocheng', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141123, '兴县', 'Xingxian', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141124, '临县', 'Linxian', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141125, '柳林县', 'Liulin', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141126, '石楼县', 'Shilou', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141127, '岚县', 'Lanxian', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141128, '方山县', 'Fangshan', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141129, '中阳县', 'Zhongyang', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141130, '交口县', 'Jiaokou', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141181, '孝义市', 'Xiaoyi', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (141182, '汾阳市', 'Fenyang', NULL, NULL, NULL, 141100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150000, '内蒙古自治区', 'Inner Mongolia', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150100, '呼和浩特市', 'Hohhot', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150102, '新城区', 'Xincheng', NULL, NULL, NULL, 150100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150103, '回民区', 'Huimin', NULL, NULL, NULL, 150100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150104, '玉泉区', 'Yuquan', NULL, NULL, NULL, 150100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150105, '赛罕区', 'Saihan', NULL, NULL, NULL, 150100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150121, '土默特左旗', 'Tumotezuoqi', NULL, NULL, NULL, 150100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150122, '托克托县', 'Tuoketuo', NULL, NULL, NULL, 150100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150123, '和林格尔县', 'Helingeer', NULL, NULL, NULL, 150100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150124, '清水河县', 'Qingshuihe', NULL, NULL, NULL, 150100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150125, '武川县', 'Wuchuan', NULL, NULL, NULL, 150100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150200, '包头市', 'Baotou', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150202, '东河区', 'Donghe', NULL, NULL, NULL, 150200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150203, '昆都仑区', 'Kundulun', NULL, NULL, NULL, 150200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150204, '青山区', 'Qingshan', NULL, NULL, NULL, 150200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150205, '石拐区', 'Shiguai', NULL, NULL, NULL, 150200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150206, '白云鄂博矿区', 'Baiyunebokuangqu', NULL, NULL, NULL, 150200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150207, '九原区', 'Jiuyuan', NULL, NULL, NULL, 150200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150221, '土默特右旗', 'Tumoteyouqi', NULL, NULL, NULL, 150200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150222, '固阳县', 'Guyang', NULL, NULL, NULL, 150200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150223, '达尔罕茂明安联合旗', 'Damaoqi', NULL, NULL, NULL, 150200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150300, '乌海市', 'Wuhai', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150302, '海勃湾区', 'Haibowan', NULL, NULL, NULL, 150300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150303, '海南区', 'Hainan', NULL, NULL, NULL, 150300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150304, '乌达区', 'Wuda', NULL, NULL, NULL, 150300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150400, '赤峰市', 'Chifeng', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150402, '红山区', 'Hongshan', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150403, '元宝山区', 'Yuanbaoshan', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150404, '松山区', 'Songshan', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150421, '阿鲁科尔沁旗', 'Alukeerqinqi', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150422, '巴林左旗', 'Balinzuoqi', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150423, '巴林右旗', 'Balinyouqi', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150424, '林西县', 'Linxi', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150425, '克什克腾旗', 'Keshiketengqi', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150426, '翁牛特旗', 'Wengniuteqi', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150428, '喀喇沁旗', 'Kalaqinqi', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150429, '宁城县', 'Ningcheng', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150430, '敖汉旗', 'Aohanqi', NULL, NULL, NULL, 150400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150500, '通辽市', 'Tongliao', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150502, '科尔沁区', 'Keerqin', NULL, NULL, NULL, 150500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150521, '科尔沁左翼中旗', 'Keerqinzuoyizhongqi', NULL, NULL, NULL, 150500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150522, '科尔沁左翼后旗', 'Keerqinzuoyihouqi', NULL, NULL, NULL, 150500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150523, '开鲁县', 'Kailu', NULL, NULL, NULL, 150500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150524, '库伦旗', 'Kulunqi', NULL, NULL, NULL, 150500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150525, '奈曼旗', 'Naimanqi', NULL, NULL, NULL, 150500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150526, '扎鲁特旗', 'Zhaluteqi', NULL, NULL, NULL, 150500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150581, '霍林郭勒市', 'Huolinguole', NULL, NULL, NULL, 150500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150600, '鄂尔多斯市', 'Ordos', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150602, '东胜区', 'Dongsheng', NULL, NULL, NULL, 150600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150621, '达拉特旗', 'Dalateqi', NULL, NULL, NULL, 150600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150622, '准格尔旗', 'Zhungeerqi', NULL, NULL, NULL, 150600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150623, '鄂托克前旗', 'Etuokeqianqi', NULL, NULL, NULL, 150600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150624, '鄂托克旗', 'Etuokeqi', NULL, NULL, NULL, 150600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150625, '杭锦旗', 'Hangjinqi', NULL, NULL, NULL, 150600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150626, '乌审旗', 'Wushenqi', NULL, NULL, NULL, 150600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150627, '伊金霍洛旗', 'Yijinhuoluoqi', NULL, NULL, NULL, 150600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150700, '呼伦贝尔市', 'Hulunber', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150702, '海拉尔区', 'Hailaer', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150703, '扎赉诺尔区', 'Zhalainuoer', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150721, '阿荣旗', 'Arongqi', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150722, '莫力达瓦达斡尔族自治旗', 'Moqi', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150723, '鄂伦春自治旗', 'Elunchun', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150724, '鄂温克族自治旗', 'Ewen', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150725, '陈巴尔虎旗', 'Chenbaerhuqi', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150726, '新巴尔虎左旗', 'Xinbaerhuzuoqi', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150727, '新巴尔虎右旗', 'Xinbaerhuyouqi', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150781, '满洲里市', 'Manzhouli', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150782, '牙克石市', 'Yakeshi', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150783, '扎兰屯市', 'Zhalantun', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150784, '额尔古纳市', 'Eerguna', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150785, '根河市', 'Genhe', NULL, NULL, NULL, 150700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150800, '巴彦淖尔市', 'Bayan Nur', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150802, '临河区', 'Linhe', NULL, NULL, NULL, 150800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150821, '五原县', 'Wuyuan', NULL, NULL, NULL, 150800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150822, '磴口县', 'Dengkou', NULL, NULL, NULL, 150800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150823, '乌拉特前旗', 'Wulateqianqi', NULL, NULL, NULL, 150800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150824, '乌拉特中旗', 'Wulatezhongqi', NULL, NULL, NULL, 150800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150825, '乌拉特后旗', 'Wulatehouqi', NULL, NULL, NULL, 150800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150826, '杭锦后旗', 'Hangjinhouqi', NULL, NULL, NULL, 150800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150900, '乌兰察布市', 'Ulanqab', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150902, '集宁区', 'Jining', NULL, NULL, NULL, 150900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150921, '卓资县', 'Zhuozi', NULL, NULL, NULL, 150900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150922, '化德县', 'Huade', NULL, NULL, NULL, 150900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150923, '商都县', 'Shangdu', NULL, NULL, NULL, 150900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150924, '兴和县', 'Xinghe', NULL, NULL, NULL, 150900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150925, '凉城县', 'Liangcheng', NULL, NULL, NULL, 150900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150926, '察哈尔右翼前旗', 'Chayouqianqi', NULL, NULL, NULL, 150900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150927, '察哈尔右翼中旗', 'Chayouzhongqi', NULL, NULL, NULL, 150900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150928, '察哈尔右翼后旗', 'Chayouhouqi', NULL, NULL, NULL, 150900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150929, '四子王旗', 'Siziwangqi', NULL, NULL, NULL, 150900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (150981, '丰镇市', 'Fengzhen', NULL, NULL, NULL, 150900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152200, '兴安盟', 'Hinggan', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152201, '乌兰浩特市', 'Wulanhaote', NULL, NULL, NULL, 152200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152202, '阿尔山市', 'Aershan', NULL, NULL, NULL, 152200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152221, '科尔沁右翼前旗', 'Keyouqianqi', NULL, NULL, NULL, 152200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152222, '科尔沁右翼中旗', 'Keyouzhongqi', NULL, NULL, NULL, 152200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152223, '扎赉特旗', 'Zhalaiteqi', NULL, NULL, NULL, 152200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152224, '突泉县', 'Tuquan', NULL, NULL, NULL, 152200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152500, '锡林郭勒盟', 'Xilin Gol', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152501, '二连浩特市', 'Erlianhaote', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152502, '锡林浩特市', 'Xilinhaote', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152522, '阿巴嘎旗', 'Abagaqi', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152523, '苏尼特左旗', 'Sunitezuoqi', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152524, '苏尼特右旗', 'Suniteyouqi', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152525, '东乌珠穆沁旗', 'Dongwuqi', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152526, '西乌珠穆沁旗', 'Xiwuqi', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152527, '太仆寺旗', 'Taipusiqi', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152528, '镶黄旗', 'Xianghuangqi', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152529, '正镶白旗', 'Zhengxiangbaiqi', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152530, '正蓝旗', 'Zhenglanqi', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152531, '多伦县', 'Duolun', NULL, NULL, NULL, 152500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152900, '阿拉善盟', 'Alxa', NULL, NULL, NULL, 150000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152921, '阿拉善左旗', 'Alashanzuoqi', NULL, NULL, NULL, 152900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152922, '阿拉善右旗', 'Alashanyouqi', NULL, NULL, NULL, 152900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (152923, '额济纳旗', 'Ejinaqi', NULL, NULL, NULL, 152900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210000, '辽宁省', 'Liaoning', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210100, '沈阳市', 'Shenyang', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210102, '和平区', 'Heping', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210103, '沈河区', 'Shenhe', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210104, '大东区', 'Dadong', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210105, '皇姑区', 'Huanggu', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210106, '铁西区', 'Tiexi', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210111, '苏家屯区', 'Sujiatun', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210112, '浑南区', 'Hunnan', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210113, '沈北新区', 'Shenbeixinqu', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210114, '于洪区', 'Yuhong', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210122, '辽中县', 'Liaozhong', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210123, '康平县', 'Kangping', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210124, '法库县', 'Faku', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210181, '新民市', 'Xinmin', NULL, NULL, NULL, 210100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210200, '大连市', 'Dalian', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210202, '中山区', 'Zhongshan', NULL, NULL, NULL, 210200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210203, '西岗区', 'Xigang', NULL, NULL, NULL, 210200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210204, '沙河口区', 'Shahekou', NULL, NULL, NULL, 210200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210211, '甘井子区', 'Ganjingzi', NULL, NULL, NULL, 210200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210212, '旅顺口区', 'Lvshunkou', NULL, NULL, NULL, 210200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210213, '金州区', 'Jinzhou', NULL, NULL, NULL, 210200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210224, '长海县', 'Changhai', NULL, NULL, NULL, 210200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210281, '瓦房店市', 'Wafangdian', NULL, NULL, NULL, 210200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210282, '普兰店市', 'Pulandian', NULL, NULL, NULL, 210200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210283, '庄河市', 'Zhuanghe', NULL, NULL, NULL, 210200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210300, '鞍山市', 'Anshan', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210302, '铁东区', 'Tiedong', NULL, NULL, NULL, 210300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210303, '铁西区', 'Tiexi', NULL, NULL, NULL, 210300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210304, '立山区', 'Lishan', NULL, NULL, NULL, 210300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210311, '千山区', 'Qianshan', NULL, NULL, NULL, 210300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210321, '台安县', 'Tai\'an', NULL, NULL, NULL, 210300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210323, '岫岩满族自治县', 'Xiuyan', NULL, NULL, NULL, 210300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210381, '海城市', 'Haicheng', NULL, NULL, NULL, 210300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210400, '抚顺市', 'Fushun', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210402, '新抚区', 'Xinfu', NULL, NULL, NULL, 210400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210403, '东洲区', 'Dongzhou', NULL, NULL, NULL, 210400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210404, '望花区', 'Wanghua', NULL, NULL, NULL, 210400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210411, '顺城区', 'Shuncheng', NULL, NULL, NULL, 210400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210421, '抚顺县', 'Fushun', NULL, NULL, NULL, 210400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210422, '新宾满族自治县', 'Xinbin', NULL, NULL, NULL, 210400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210423, '清原满族自治县', 'Qingyuan', NULL, NULL, NULL, 210400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210500, '本溪市', 'Benxi', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210502, '平山区', 'Pingshan', NULL, NULL, NULL, 210500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210503, '溪湖区', 'Xihu', NULL, NULL, NULL, 210500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210504, '明山区', 'Mingshan', NULL, NULL, NULL, 210500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210505, '南芬区', 'Nanfen', NULL, NULL, NULL, 210500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210521, '本溪满族自治县', 'Benxi', NULL, NULL, NULL, 210500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210522, '桓仁满族自治县', 'Huanren', NULL, NULL, NULL, 210500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210600, '丹东市', 'Dandong', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210602, '元宝区', 'Yuanbao', NULL, NULL, NULL, 210600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210603, '振兴区', 'Zhenxing', NULL, NULL, NULL, 210600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210604, '振安区', 'Zhen\'an', NULL, NULL, NULL, 210600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210624, '宽甸满族自治县', 'Kuandian', NULL, NULL, NULL, 210600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210681, '东港市', 'Donggang', NULL, NULL, NULL, 210600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210682, '凤城市', 'Fengcheng', NULL, NULL, NULL, 210600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210700, '锦州市', 'Jinzhou', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210702, '古塔区', 'Guta', NULL, NULL, NULL, 210700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210703, '凌河区', 'Linghe', NULL, NULL, NULL, 210700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210711, '太和区', 'Taihe', NULL, NULL, NULL, 210700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210726, '黑山县', 'Heishan', NULL, NULL, NULL, 210700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210727, '义县', 'Yixian', NULL, NULL, NULL, 210700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210781, '凌海市', 'Linghai', NULL, NULL, NULL, 210700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210782, '北镇市', 'Beizhen', NULL, NULL, NULL, 210700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210800, '营口市', 'Yingkou', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210802, '站前区', 'Zhanqian', NULL, NULL, NULL, 210800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210803, '西市区', 'Xishi', NULL, NULL, NULL, 210800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210804, '鲅鱼圈区', 'Bayuquan', NULL, NULL, NULL, 210800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210811, '老边区', 'Laobian', NULL, NULL, NULL, 210800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210881, '盖州市', 'Gaizhou', NULL, NULL, NULL, 210800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210882, '大石桥市', 'Dashiqiao', NULL, NULL, NULL, 210800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210900, '阜新市', 'Fuxin', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210902, '海州区', 'Haizhou', NULL, NULL, NULL, 210900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210903, '新邱区', 'Xinqiu', NULL, NULL, NULL, 210900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210904, '太平区', 'Taiping', NULL, NULL, NULL, 210900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210905, '清河门区', 'Qinghemen', NULL, NULL, NULL, 210900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210911, '细河区', 'Xihe', NULL, NULL, NULL, 210900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210921, '阜新蒙古族自治县', 'Fuxin', NULL, NULL, NULL, 210900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (210922, '彰武县', 'Zhangwu', NULL, NULL, NULL, 210900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211000, '辽阳市', 'Liaoyang', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211002, '白塔区', 'Baita', NULL, NULL, NULL, 211000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211003, '文圣区', 'Wensheng', NULL, NULL, NULL, 211000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211004, '宏伟区', 'Hongwei', NULL, NULL, NULL, 211000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211005, '弓长岭区', 'Gongchangling', NULL, NULL, NULL, 211000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211011, '太子河区', 'Taizihe', NULL, NULL, NULL, 211000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211021, '辽阳县', 'Liaoyang', NULL, NULL, NULL, 211000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211081, '灯塔市', 'Dengta', NULL, NULL, NULL, 211000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211100, '盘锦市', 'Panjin', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211102, '双台子区', 'Shuangtaizi', NULL, NULL, NULL, 211100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211103, '兴隆台区', 'Xinglongtai', NULL, NULL, NULL, 211100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211121, '大洼县', 'Dawa', NULL, NULL, NULL, 211100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211122, '盘山县', 'Panshan', NULL, NULL, NULL, 211100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211200, '铁岭市', 'Tieling', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211202, '银州区', 'Yinzhou', NULL, NULL, NULL, 211200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211204, '清河区', 'Qinghe', NULL, NULL, NULL, 211200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211221, '铁岭县', 'Tieling', NULL, NULL, NULL, 211200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211223, '西丰县', 'Xifeng', NULL, NULL, NULL, 211200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211224, '昌图县', 'Changtu', NULL, NULL, NULL, 211200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211281, '调兵山市', 'Diaobingshan', NULL, NULL, NULL, 211200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211282, '开原市', 'Kaiyuan', NULL, NULL, NULL, 211200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211300, '朝阳市', 'Chaoyang', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211302, '双塔区', 'Shuangta', NULL, NULL, NULL, 211300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211303, '龙城区', 'Longcheng', NULL, NULL, NULL, 211300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211321, '朝阳县', 'Chaoyang', NULL, NULL, NULL, 211300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211322, '建平县', 'Jianping', NULL, NULL, NULL, 211300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211324, '喀喇沁左翼蒙古族自治县', 'Kalaqinzuoyi', NULL, NULL, NULL, 211300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211381, '北票市', 'Beipiao', NULL, NULL, NULL, 211300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211382, '凌源市', 'Lingyuan', NULL, NULL, NULL, 211300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211400, '葫芦岛市', 'Huludao', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211402, '连山区', 'Lianshan', NULL, NULL, NULL, 211400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211403, '龙港区', 'Longgang', NULL, NULL, NULL, 211400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211404, '南票区', 'Nanpiao', NULL, NULL, NULL, 211400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211421, '绥中县', 'Suizhong', NULL, NULL, NULL, 211400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211422, '建昌县', 'Jianchang', NULL, NULL, NULL, 211400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211481, '兴城市', 'Xingcheng', NULL, NULL, NULL, 211400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211500, '金普新区', 'Jinpuxinqu', NULL, NULL, NULL, 210000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211501, '金州新区', 'Jinzhouxinqu', NULL, NULL, NULL, 211500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211502, '普湾新区', 'Puwanxinqu', NULL, NULL, NULL, 211500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (211503, '保税区', 'Baoshuiqu', NULL, NULL, NULL, 211500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220000, '吉林省', 'Jilin', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220100, '长春市', 'Changchun', NULL, NULL, NULL, 220000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220102, '南关区', 'Nanguan', NULL, NULL, NULL, 220100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220103, '宽城区', 'Kuancheng', NULL, NULL, NULL, 220100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220104, '朝阳区', 'Chaoyang', NULL, NULL, NULL, 220100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220105, '二道区', 'Erdao', NULL, NULL, NULL, 220100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220106, '绿园区', 'Lvyuan', NULL, NULL, NULL, 220100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220112, '双阳区', 'Shuangyang', NULL, NULL, NULL, 220100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220113, '九台区', 'Jiutai', NULL, NULL, NULL, 220100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220122, '农安县', 'Nong\'an', NULL, NULL, NULL, 220100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220182, '榆树市', 'Yushu', NULL, NULL, NULL, 220100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220183, '德惠市', 'Dehui', NULL, NULL, NULL, 220100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220200, '吉林市', 'Jilin', NULL, NULL, NULL, 220000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220202, '昌邑区', 'Changyi', NULL, NULL, NULL, 220200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220203, '龙潭区', 'Longtan', NULL, NULL, NULL, 220200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220204, '船营区', 'Chuanying', NULL, NULL, NULL, 220200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220211, '丰满区', 'Fengman', NULL, NULL, NULL, 220200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220221, '永吉县', 'Yongji', NULL, NULL, NULL, 220200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220281, '蛟河市', 'Jiaohe', NULL, NULL, NULL, 220200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220282, '桦甸市', 'Huadian', NULL, NULL, NULL, 220200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220283, '舒兰市', 'Shulan', NULL, NULL, NULL, 220200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220284, '磐石市', 'Panshi', NULL, NULL, NULL, 220200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220300, '四平市', 'Siping', NULL, NULL, NULL, 220000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220302, '铁西区', 'Tiexi', NULL, NULL, NULL, 220300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220303, '铁东区', 'Tiedong', NULL, NULL, NULL, 220300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220322, '梨树县', 'Lishu', NULL, NULL, NULL, 220300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220323, '伊通满族自治县', 'Yitong', NULL, NULL, NULL, 220300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220381, '公主岭市', 'Gongzhuling', NULL, NULL, NULL, 220300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220382, '双辽市', 'Shuangliao', NULL, NULL, NULL, 220300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220400, '辽源市', 'Liaoyuan', NULL, NULL, NULL, 220000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220402, '龙山区', 'Longshan', NULL, NULL, NULL, 220400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220403, '西安区', 'Xi\'an', NULL, NULL, NULL, 220400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220421, '东丰县', 'Dongfeng', NULL, NULL, NULL, 220400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220422, '东辽县', 'Dongliao', NULL, NULL, NULL, 220400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220500, '通化市', 'Tonghua', NULL, NULL, NULL, 220000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220502, '东昌区', 'Dongchang', NULL, NULL, NULL, 220500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220503, '二道江区', 'Erdaojiang', NULL, NULL, NULL, 220500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220521, '通化县', 'Tonghua', NULL, NULL, NULL, 220500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220523, '辉南县', 'Huinan', NULL, NULL, NULL, 220500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220524, '柳河县', 'Liuhe', NULL, NULL, NULL, 220500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220581, '梅河口市', 'Meihekou', NULL, NULL, NULL, 220500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220582, '集安市', 'Ji\'an', NULL, NULL, NULL, 220500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220600, '白山市', 'Baishan', NULL, NULL, NULL, 220000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220602, '浑江区', 'Hunjiang', NULL, NULL, NULL, 220600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220605, '江源区', 'Jiangyuan', NULL, NULL, NULL, 220600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220621, '抚松县', 'Fusong', NULL, NULL, NULL, 220600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220622, '靖宇县', 'Jingyu', NULL, NULL, NULL, 220600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220623, '长白朝鲜族自治县', 'Changbai', NULL, NULL, NULL, 220600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220681, '临江市', 'Linjiang', NULL, NULL, NULL, 220600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220700, '松原市', 'Songyuan', NULL, NULL, NULL, 220000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220702, '宁江区', 'Ningjiang', NULL, NULL, NULL, 220700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220721, '前郭尔罗斯蒙古族自治县', 'Qianguoerluosi', NULL, NULL, NULL, 220700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220722, '长岭县', 'Changling', NULL, NULL, NULL, 220700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220723, '乾安县', 'Qian\'an', NULL, NULL, NULL, 220700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220781, '扶余市', 'Fuyu', NULL, NULL, NULL, 220700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220800, '白城市', 'Baicheng', NULL, NULL, NULL, 220000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220802, '洮北区', 'Taobei', NULL, NULL, NULL, 220800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220821, '镇赉县', 'Zhenlai', NULL, NULL, NULL, 220800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220822, '通榆县', 'Tongyu', NULL, NULL, NULL, 220800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220881, '洮南市', 'Taonan', NULL, NULL, NULL, 220800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (220882, '大安市', 'Da\'an', NULL, NULL, NULL, 220800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (222400, '延边朝鲜族自治州', 'Yanbian', NULL, NULL, NULL, 220000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (222401, '延吉市', 'Yanji', NULL, NULL, NULL, 222400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (222402, '图们市', 'Tumen', NULL, NULL, NULL, 222400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (222403, '敦化市', 'Dunhua', NULL, NULL, NULL, 222400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (222404, '珲春市', 'Hunchun', NULL, NULL, NULL, 222400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (222405, '龙井市', 'Longjing', NULL, NULL, NULL, 222400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (222406, '和龙市', 'Helong', NULL, NULL, NULL, 222400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (222424, '汪清县', 'Wangqing', NULL, NULL, NULL, 222400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (222426, '安图县', 'Antu', NULL, NULL, NULL, 222400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230000, '黑龙江省', 'Heilongjiang', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230100, '哈尔滨市', 'Harbin', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230102, '道里区', 'Daoli', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230103, '南岗区', 'Nangang', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230104, '道外区', 'Daowai', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230108, '平房区', 'Pingfang', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230109, '松北区', 'Songbei', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230110, '香坊区', 'Xiangfang', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230111, '呼兰区', 'Hulan', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230112, '阿城区', 'A\'cheng', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230113, '双城区', 'Shuangcheng', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230123, '依兰县', 'Yilan', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230124, '方正县', 'Fangzheng', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230125, '宾县', 'Binxian', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230126, '巴彦县', 'Bayan', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230127, '木兰县', 'Mulan', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230128, '通河县', 'Tonghe', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230129, '延寿县', 'Yanshou', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230183, '尚志市', 'Shangzhi', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230184, '五常市', 'Wuchang', NULL, NULL, NULL, 230100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230200, '齐齐哈尔市', 'Qiqihar', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230202, '龙沙区', 'Longsha', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230203, '建华区', 'Jianhua', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230204, '铁锋区', 'Tiefeng', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230205, '昂昂溪区', 'Angangxi', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230206, '富拉尔基区', 'Fulaerji', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230207, '碾子山区', 'Nianzishan', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230208, '梅里斯达斡尔族区', 'Meilisi', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230221, '龙江县', 'Longjiang', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230223, '依安县', 'Yi\'an', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230224, '泰来县', 'Tailai', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230225, '甘南县', 'Gannan', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230227, '富裕县', 'Fuyu', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230229, '克山县', 'Keshan', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230230, '克东县', 'Kedong', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230231, '拜泉县', 'Baiquan', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230281, '讷河市', 'Nehe', NULL, NULL, NULL, 230200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230300, '鸡西市', 'Jixi', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230302, '鸡冠区', 'Jiguan', NULL, NULL, NULL, 230300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230303, '恒山区', 'Hengshan', NULL, NULL, NULL, 230300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230304, '滴道区', 'Didao', NULL, NULL, NULL, 230300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230305, '梨树区', 'Lishu', NULL, NULL, NULL, 230300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230306, '城子河区', 'Chengzihe', NULL, NULL, NULL, 230300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230307, '麻山区', 'Mashan', NULL, NULL, NULL, 230300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230321, '鸡东县', 'Jidong', NULL, NULL, NULL, 230300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230381, '虎林市', 'Hulin', NULL, NULL, NULL, 230300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230382, '密山市', 'Mishan', NULL, NULL, NULL, 230300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230400, '鹤岗市', 'Hegang', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230402, '向阳区', 'Xiangyang', NULL, NULL, NULL, 230400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230403, '工农区', 'Gongnong', NULL, NULL, NULL, 230400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230404, '南山区', 'Nanshan', NULL, NULL, NULL, 230400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230405, '兴安区', 'Xing\'an', NULL, NULL, NULL, 230400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230406, '东山区', 'Dongshan', NULL, NULL, NULL, 230400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230407, '兴山区', 'Xingshan', NULL, NULL, NULL, 230400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230421, '萝北县', 'Luobei', NULL, NULL, NULL, 230400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230422, '绥滨县', 'Suibin', NULL, NULL, NULL, 230400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230500, '双鸭山市', 'Shuangyashan', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230502, '尖山区', 'Jianshan', NULL, NULL, NULL, 230500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230503, '岭东区', 'Lingdong', NULL, NULL, NULL, 230500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230505, '四方台区', 'Sifangtai', NULL, NULL, NULL, 230500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230506, '宝山区', 'Baoshan', NULL, NULL, NULL, 230500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230521, '集贤县', 'Jixian', NULL, NULL, NULL, 230500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230522, '友谊县', 'Youyi', NULL, NULL, NULL, 230500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230523, '宝清县', 'Baoqing', NULL, NULL, NULL, 230500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230524, '饶河县', 'Raohe', NULL, NULL, NULL, 230500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230600, '大庆市', 'Daqing', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230602, '萨尔图区', 'Saertu', NULL, NULL, NULL, 230600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230603, '龙凤区', 'Longfeng', NULL, NULL, NULL, 230600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230604, '让胡路区', 'Ranghulu', NULL, NULL, NULL, 230600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230605, '红岗区', 'Honggang', NULL, NULL, NULL, 230600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230606, '大同区', 'Datong', NULL, NULL, NULL, 230600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230621, '肇州县', 'Zhaozhou', NULL, NULL, NULL, 230600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230622, '肇源县', 'Zhaoyuan', NULL, NULL, NULL, 230600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230623, '林甸县', 'Lindian', NULL, NULL, NULL, 230600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230624, '杜尔伯特蒙古族自治县', 'Duerbote', NULL, NULL, NULL, 230600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230700, '伊春市', 'Yichun', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230702, '伊春区', 'Yichun', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230703, '南岔区', 'Nancha', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230704, '友好区', 'Youhao', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230705, '西林区', 'Xilin', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230706, '翠峦区', 'Cuiluan', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230707, '新青区', 'Xinqing', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230708, '美溪区', 'Meixi', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230709, '金山屯区', 'Jinshantun', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230710, '五营区', 'Wuying', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230711, '乌马河区', 'Wumahe', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230712, '汤旺河区', 'Tangwanghe', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230713, '带岭区', 'Dailing', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230714, '乌伊岭区', 'Wuyiling', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230715, '红星区', 'Hongxing', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230716, '上甘岭区', 'Shangganling', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230722, '嘉荫县', 'Jiayin', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230781, '铁力市', 'Tieli', NULL, NULL, NULL, 230700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230800, '佳木斯市', 'Jiamusi', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230803, '向阳区', 'Xiangyang', NULL, NULL, NULL, 230800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230804, '前进区', 'Qianjin', NULL, NULL, NULL, 230800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230805, '东风区', 'Dongfeng', NULL, NULL, NULL, 230800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230811, '郊区', 'Jiaoqu', NULL, NULL, NULL, 230800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230822, '桦南县', 'Huanan', NULL, NULL, NULL, 230800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230826, '桦川县', 'Huachuan', NULL, NULL, NULL, 230800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230828, '汤原县', 'Tangyuan', NULL, NULL, NULL, 230800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230833, '抚远县', 'Fuyuan', NULL, NULL, NULL, 230800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230881, '同江市', 'Tongjiang', NULL, NULL, NULL, 230800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230882, '富锦市', 'Fujin', NULL, NULL, NULL, 230800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230900, '七台河市', 'Qitaihe', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230902, '新兴区', 'Xinxing', NULL, NULL, NULL, 230900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230903, '桃山区', 'Taoshan', NULL, NULL, NULL, 230900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230904, '茄子河区', 'Qiezihe', NULL, NULL, NULL, 230900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (230921, '勃利县', 'Boli', NULL, NULL, NULL, 230900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231000, '牡丹江市', 'Mudanjiang', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231002, '东安区', 'Dong\'an', NULL, NULL, NULL, 231000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231003, '阳明区', 'Yangming', NULL, NULL, NULL, 231000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231004, '爱民区', 'Aimin', NULL, NULL, NULL, 231000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231005, '西安区', 'Xi\'an', NULL, NULL, NULL, 231000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231024, '东宁县', 'Dongning', NULL, NULL, NULL, 231000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231025, '林口县', 'Linkou', NULL, NULL, NULL, 231000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231081, '绥芬河市', 'Suifenhe', NULL, NULL, NULL, 231000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231083, '海林市', 'Hailin', NULL, NULL, NULL, 231000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231084, '宁安市', 'Ning\'an', NULL, NULL, NULL, 231000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231085, '穆棱市', 'Muling', NULL, NULL, NULL, 231000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231100, '黑河市', 'Heihe', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231102, '爱辉区', 'Aihui', NULL, NULL, NULL, 231100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231121, '嫩江县', 'Nenjiang', NULL, NULL, NULL, 231100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231123, '逊克县', 'Xunke', NULL, NULL, NULL, 231100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231124, '孙吴县', 'Sunwu', NULL, NULL, NULL, 231100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231181, '北安市', 'Bei\'an', NULL, NULL, NULL, 231100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231182, '五大连池市', 'Wudalianchi', NULL, NULL, NULL, 231100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231200, '绥化市', 'Suihua', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231202, '北林区', 'Beilin', NULL, NULL, NULL, 231200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231221, '望奎县', 'Wangkui', NULL, NULL, NULL, 231200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231222, '兰西县', 'Lanxi', NULL, NULL, NULL, 231200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231223, '青冈县', 'Qinggang', NULL, NULL, NULL, 231200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231224, '庆安县', 'Qing\'an', NULL, NULL, NULL, 231200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231225, '明水县', 'Mingshui', NULL, NULL, NULL, 231200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231226, '绥棱县', 'Suileng', NULL, NULL, NULL, 231200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231281, '安达市', 'Anda', NULL, NULL, NULL, 231200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231282, '肇东市', 'Zhaodong', NULL, NULL, NULL, 231200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (231283, '海伦市', 'Hailun', NULL, NULL, NULL, 231200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (232700, '大兴安岭地区', 'DaXingAnLing', NULL, NULL, NULL, 230000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (232701, '加格达奇区', 'Jiagedaqi', NULL, NULL, NULL, 232700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (232702, '新林区', 'Xinlin', NULL, NULL, NULL, 232700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (232703, '松岭区', 'Songling', NULL, NULL, NULL, 232700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (232704, '呼中区', 'Huzhong', NULL, NULL, NULL, 232700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (232721, '呼玛县', 'Huma', NULL, NULL, NULL, 232700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (232722, '塔河县', 'Tahe', NULL, NULL, NULL, 232700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (232723, '漠河县', 'Mohe', NULL, NULL, NULL, 232700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310000, '上海', 'Shanghai', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310100, '上海市', 'Shanghai', NULL, NULL, NULL, 310000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310101, '黄浦区', 'Huangpu', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310104, '徐汇区', 'Xuhui', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310105, '长宁区', 'Changning', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310106, '静安区', 'Jing\'an', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310107, '普陀区', 'Putuo', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310108, '闸北区', 'Zhabei', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310109, '虹口区', 'Hongkou', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310110, '杨浦区', 'Yangpu', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310112, '闵行区', 'Minhang', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310113, '宝山区', 'Baoshan', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310114, '嘉定区', 'Jiading', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310115, '浦东新区', 'Pudong', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310116, '金山区', 'Jinshan', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310117, '松江区', 'Songjiang', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310118, '青浦区', 'Qingpu', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310120, '奉贤区', 'Fengxian', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (310230, '崇明县', 'Chongming', NULL, NULL, NULL, 310100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320000, '江苏省', 'Jiangsu', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320100, '南京市', 'Nanjing', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320102, '玄武区', 'Xuanwu', NULL, NULL, NULL, 320100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320104, '秦淮区', 'Qinhuai', NULL, NULL, NULL, 320100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320105, '建邺区', 'Jianye', NULL, NULL, NULL, 320100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320106, '鼓楼区', 'Gulou', NULL, NULL, NULL, 320100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320111, '浦口区', 'Pukou', NULL, NULL, NULL, 320100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320113, '栖霞区', 'Qixia', NULL, NULL, NULL, 320100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320114, '雨花台区', 'Yuhuatai', NULL, NULL, NULL, 320100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320115, '江宁区', 'Jiangning', NULL, NULL, NULL, 320100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320116, '六合区', 'Luhe', NULL, NULL, NULL, 320100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320117, '溧水区', 'Lishui', NULL, NULL, NULL, 320100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320118, '高淳区', 'Gaochun', NULL, NULL, NULL, 320100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320200, '无锡市', 'Wuxi', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320202, '崇安区', 'Chong\'an', NULL, NULL, NULL, 320200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320203, '南长区', 'Nanchang', NULL, NULL, NULL, 320200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320204, '北塘区', 'Beitang', NULL, NULL, NULL, 320200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320205, '锡山区', 'Xishan', NULL, NULL, NULL, 320200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320206, '惠山区', 'Huishan', NULL, NULL, NULL, 320200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320211, '滨湖区', 'Binhu', NULL, NULL, NULL, 320200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320281, '江阴市', 'Jiangyin', NULL, NULL, NULL, 320200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320282, '宜兴市', 'Yixing', NULL, NULL, NULL, 320200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320300, '徐州市', 'Xuzhou', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320302, '鼓楼区', 'Gulou', NULL, NULL, NULL, 320300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320303, '云龙区', 'Yunlong', NULL, NULL, NULL, 320300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320305, '贾汪区', 'Jiawang', NULL, NULL, NULL, 320300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320311, '泉山区', 'Quanshan', NULL, NULL, NULL, 320300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320312, '铜山区', 'Tongshan', NULL, NULL, NULL, 320300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320321, '丰县', 'Fengxian', NULL, NULL, NULL, 320300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320322, '沛县', 'Peixian', NULL, NULL, NULL, 320300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320324, '睢宁县', 'Suining', NULL, NULL, NULL, 320300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320381, '新沂市', 'Xinyi', NULL, NULL, NULL, 320300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320382, '邳州市', 'Pizhou', NULL, NULL, NULL, 320300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320400, '常州市', 'Changzhou', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320402, '天宁区', 'Tianning', NULL, NULL, NULL, 320400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320404, '钟楼区', 'Zhonglou', NULL, NULL, NULL, 320400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320405, '戚墅堰区', 'Qishuyan', NULL, NULL, NULL, 320400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320411, '新北区', 'Xinbei', NULL, NULL, NULL, 320400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320412, '武进区', 'Wujin', NULL, NULL, NULL, 320400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320481, '溧阳市', 'Liyang', NULL, NULL, NULL, 320400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320482, '金坛市', 'Jintan', NULL, NULL, NULL, 320400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320500, '苏州市', 'Suzhou', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320505, '虎丘区', 'Huqiu', NULL, NULL, NULL, 320500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320506, '吴中区', 'Wuzhong', NULL, NULL, NULL, 320500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320507, '相城区', 'Xiangcheng', NULL, NULL, NULL, 320500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320508, '姑苏区', 'Gusu', NULL, NULL, NULL, 320500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320509, '吴江区', 'Wujiang', NULL, NULL, NULL, 320500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320581, '常熟市', 'Changshu', NULL, NULL, NULL, 320500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320582, '张家港市', 'Zhangjiagang', NULL, NULL, NULL, 320500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320583, '昆山市', 'Kunshan', NULL, NULL, NULL, 320500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320585, '太仓市', 'Taicang', NULL, NULL, NULL, 320500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320600, '南通市', 'Nantong', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320602, '崇川区', 'Chongchuan', NULL, NULL, NULL, 320600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320611, '港闸区', 'Gangzha', NULL, NULL, NULL, 320600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320612, '通州区', 'Tongzhou', NULL, NULL, NULL, 320600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320621, '海安县', 'Hai\'an', NULL, NULL, NULL, 320600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320623, '如东县', 'Rudong', NULL, NULL, NULL, 320600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320681, '启东市', 'Qidong', NULL, NULL, NULL, 320600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320682, '如皋市', 'Rugao', NULL, NULL, NULL, 320600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320684, '海门市', 'Haimen', NULL, NULL, NULL, 320600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320700, '连云港市', 'Lianyungang', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320703, '连云区', 'Lianyun', NULL, NULL, NULL, 320700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320706, '海州区', 'Haizhou', NULL, NULL, NULL, 320700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320707, '赣榆区', 'Ganyu', NULL, NULL, NULL, 320700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320722, '东海县', 'Donghai', NULL, NULL, NULL, 320700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320723, '灌云县', 'Guanyun', NULL, NULL, NULL, 320700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320724, '灌南县', 'Guannan', NULL, NULL, NULL, 320700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320800, '淮安市', 'Huai\'an', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320802, '清河区', 'Qinghe', NULL, NULL, NULL, 320800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320803, '淮安区', 'Huai\'an', NULL, NULL, NULL, 320800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320804, '淮阴区', 'Huaiyin', NULL, NULL, NULL, 320800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320811, '清浦区', 'Qingpu', NULL, NULL, NULL, 320800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320826, '涟水县', 'Lianshui', NULL, NULL, NULL, 320800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320829, '洪泽县', 'Hongze', NULL, NULL, NULL, 320800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320830, '盱眙县', 'Xuyi', NULL, NULL, NULL, 320800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320831, '金湖县', 'Jinhu', NULL, NULL, NULL, 320800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320900, '盐城市', 'Yancheng', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320902, '亭湖区', 'Tinghu', NULL, NULL, NULL, 320900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320903, '盐都区', 'Yandu', NULL, NULL, NULL, 320900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320921, '响水县', 'Xiangshui', NULL, NULL, NULL, 320900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320922, '滨海县', 'Binhai', NULL, NULL, NULL, 320900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320923, '阜宁县', 'Funing', NULL, NULL, NULL, 320900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320924, '射阳县', 'Sheyang', NULL, NULL, NULL, 320900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320925, '建湖县', 'Jianhu', NULL, NULL, NULL, 320900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320981, '东台市', 'Dongtai', NULL, NULL, NULL, 320900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (320982, '大丰市', 'Dafeng', NULL, NULL, NULL, 320900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321000, '扬州市', 'Yangzhou', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321002, '广陵区', 'Guangling', NULL, NULL, NULL, 321000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321003, '邗江区', 'Hanjiang', NULL, NULL, NULL, 321000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321012, '江都区', 'Jiangdu', NULL, NULL, NULL, 321000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321023, '宝应县', 'Baoying', NULL, NULL, NULL, 321000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321081, '仪征市', 'Yizheng', NULL, NULL, NULL, 321000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321084, '高邮市', 'Gaoyou', NULL, NULL, NULL, 321000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321100, '镇江市', 'Zhenjiang', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321102, '京口区', 'Jingkou', NULL, NULL, NULL, 321100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321111, '润州区', 'Runzhou', NULL, NULL, NULL, 321100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321112, '丹徒区', 'Dantu', NULL, NULL, NULL, 321100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321181, '丹阳市', 'Danyang', NULL, NULL, NULL, 321100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321182, '扬中市', 'Yangzhong', NULL, NULL, NULL, 321100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321183, '句容市', 'Jurong', NULL, NULL, NULL, 321100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321200, '泰州市', 'Taizhou', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321202, '海陵区', 'Hailing', NULL, NULL, NULL, 321200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321203, '高港区', 'Gaogang', NULL, NULL, NULL, 321200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321204, '姜堰区', 'Jiangyan', NULL, NULL, NULL, 321200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321281, '兴化市', 'Xinghua', NULL, NULL, NULL, 321200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321282, '靖江市', 'Jingjiang', NULL, NULL, NULL, 321200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321283, '泰兴市', 'Taixing', NULL, NULL, NULL, 321200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321300, '宿迁市', 'Suqian', NULL, NULL, NULL, 320000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321302, '宿城区', 'Sucheng', NULL, NULL, NULL, 321300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321311, '宿豫区', 'Suyu', NULL, NULL, NULL, 321300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321322, '沭阳县', 'Shuyang', NULL, NULL, NULL, 321300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321323, '泗阳县', 'Siyang', NULL, NULL, NULL, 321300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (321324, '泗洪县', 'Sihong', NULL, NULL, NULL, 321300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330000, '浙江省', 'Zhejiang', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330100, '杭州市', 'Hangzhou', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330102, '上城区', 'Shangcheng', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330103, '下城区', 'Xiacheng', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330104, '江干区', 'Jianggan', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330105, '拱墅区', 'Gongshu', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330106, '西湖区', 'Xihu', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330108, '滨江区', 'Binjiang', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330109, '萧山区', 'Xiaoshan', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330110, '余杭区', 'Yuhang', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330122, '桐庐县', 'Tonglu', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330127, '淳安县', 'Chun\'an', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330182, '建德市', 'Jiande', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330183, '富阳区', 'Fuyang', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330185, '临安市', 'Lin\'an', NULL, NULL, NULL, 330100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330200, '宁波市', 'Ningbo', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330203, '海曙区', 'Haishu', NULL, NULL, NULL, 330200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330204, '江东区', 'Jiangdong', NULL, NULL, NULL, 330200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330205, '江北区', 'Jiangbei', NULL, NULL, NULL, 330200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330206, '北仑区', 'Beilun', NULL, NULL, NULL, 330200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330211, '镇海区', 'Zhenhai', NULL, NULL, NULL, 330200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330212, '鄞州区', 'Yinzhou', NULL, NULL, NULL, 330200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330225, '象山县', 'Xiangshan', NULL, NULL, NULL, 330200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330226, '宁海县', 'Ninghai', NULL, NULL, NULL, 330200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330281, '余姚市', 'Yuyao', NULL, NULL, NULL, 330200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330282, '慈溪市', 'Cixi', NULL, NULL, NULL, 330200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330283, '奉化市', 'Fenghua', NULL, NULL, NULL, 330200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330300, '温州市', 'Wenzhou', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330302, '鹿城区', 'Lucheng', NULL, NULL, NULL, 330300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330303, '龙湾区', 'Longwan', NULL, NULL, NULL, 330300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330304, '瓯海区', 'Ouhai', NULL, NULL, NULL, 330300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330322, '洞头县', 'Dongtou', NULL, NULL, NULL, 330300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330324, '永嘉县', 'Yongjia', NULL, NULL, NULL, 330300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330326, '平阳县', 'Pingyang', NULL, NULL, NULL, 330300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330327, '苍南县', 'Cangnan', NULL, NULL, NULL, 330300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330328, '文成县', 'Wencheng', NULL, NULL, NULL, 330300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330329, '泰顺县', 'Taishun', NULL, NULL, NULL, 330300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330381, '瑞安市', 'Rui\'an', NULL, NULL, NULL, 330300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330382, '乐清市', 'Yueqing', NULL, NULL, NULL, 330300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330400, '嘉兴市', 'Jiaxing', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330402, '南湖区', 'Nanhu', NULL, NULL, NULL, 330400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330411, '秀洲区', 'Xiuzhou', NULL, NULL, NULL, 330400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330421, '嘉善县', 'Jiashan', NULL, NULL, NULL, 330400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330424, '海盐县', 'Haiyan', NULL, NULL, NULL, 330400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330481, '海宁市', 'Haining', NULL, NULL, NULL, 330400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330482, '平湖市', 'Pinghu', NULL, NULL, NULL, 330400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330483, '桐乡市', 'Tongxiang', NULL, NULL, NULL, 330400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330500, '湖州市', 'Huzhou', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330502, '吴兴区', 'Wuxing', NULL, NULL, NULL, 330500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330503, '南浔区', 'Nanxun', NULL, NULL, NULL, 330500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330521, '德清县', 'Deqing', NULL, NULL, NULL, 330500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330522, '长兴县', 'Changxing', NULL, NULL, NULL, 330500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330523, '安吉县', 'Anji', NULL, NULL, NULL, 330500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330600, '绍兴市', 'Shaoxing', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330602, '越城区', 'Yuecheng', NULL, NULL, NULL, 330600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330603, '柯桥区', 'Keqiao ', NULL, NULL, NULL, 330600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330604, '上虞区', 'Shangyu', NULL, NULL, NULL, 330600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330624, '新昌县', 'Xinchang', NULL, NULL, NULL, 330600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330681, '诸暨市', 'Zhuji', NULL, NULL, NULL, 330600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330683, '嵊州市', 'Shengzhou', NULL, NULL, NULL, 330600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330700, '金华市', 'Jinhua', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330702, '婺城区', 'Wucheng', NULL, NULL, NULL, 330700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330703, '金东区', 'Jindong', NULL, NULL, NULL, 330700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330723, '武义县', 'Wuyi', NULL, NULL, NULL, 330700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330726, '浦江县', 'Pujiang', NULL, NULL, NULL, 330700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330727, '磐安县', 'Pan\'an', NULL, NULL, NULL, 330700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330781, '兰溪市', 'Lanxi', NULL, NULL, NULL, 330700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330782, '义乌市', 'Yiwu', NULL, NULL, NULL, 330700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330783, '东阳市', 'Dongyang', NULL, NULL, NULL, 330700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330784, '永康市', 'Yongkang', NULL, NULL, NULL, 330700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330800, '衢州市', 'Quzhou', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330802, '柯城区', 'Kecheng', NULL, NULL, NULL, 330800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330803, '衢江区', 'Qujiang', NULL, NULL, NULL, 330800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330822, '常山县', 'Changshan', NULL, NULL, NULL, 330800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330824, '开化县', 'Kaihua', NULL, NULL, NULL, 330800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330825, '龙游县', 'Longyou', NULL, NULL, NULL, 330800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330881, '江山市', 'Jiangshan', NULL, NULL, NULL, 330800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330900, '舟山市', 'Zhoushan', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330902, '定海区', 'Dinghai', NULL, NULL, NULL, 330900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330903, '普陀区', 'Putuo', NULL, NULL, NULL, 330900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330921, '岱山县', 'Daishan', NULL, NULL, NULL, 330900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (330922, '嵊泗县', 'Shengsi', NULL, NULL, NULL, 330900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331000, '台州市', 'Taizhou', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331002, '椒江区', 'Jiaojiang', NULL, NULL, NULL, 331000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331003, '黄岩区', 'Huangyan', NULL, NULL, NULL, 331000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331004, '路桥区', 'Luqiao', NULL, NULL, NULL, 331000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331021, '玉环县', 'Yuhuan', NULL, NULL, NULL, 331000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331022, '三门县', 'Sanmen', NULL, NULL, NULL, 331000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331023, '天台县', 'Tiantai', NULL, NULL, NULL, 331000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331024, '仙居县', 'Xianju', NULL, NULL, NULL, 331000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331081, '温岭市', 'Wenling', NULL, NULL, NULL, 331000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331082, '临海市', 'Linhai', NULL, NULL, NULL, 331000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331100, '丽水市', 'Lishui', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331102, '莲都区', 'Liandu', NULL, NULL, NULL, 331100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331121, '青田县', 'Qingtian', NULL, NULL, NULL, 331100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331122, '缙云县', 'Jinyun', NULL, NULL, NULL, 331100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331123, '遂昌县', 'Suichang', NULL, NULL, NULL, 331100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331124, '松阳县', 'Songyang', NULL, NULL, NULL, 331100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331125, '云和县', 'Yunhe', NULL, NULL, NULL, 331100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331126, '庆元县', 'Qingyuan', NULL, NULL, NULL, 331100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331127, '景宁畲族自治县', 'Jingning', NULL, NULL, NULL, 331100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331181, '龙泉市', 'Longquan', NULL, NULL, NULL, 331100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331200, '舟山群岛新区', 'Zhoushan', NULL, NULL, NULL, 330000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331201, '金塘岛', 'Jintang', NULL, NULL, NULL, 331200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331202, '六横岛', 'Liuheng', NULL, NULL, NULL, 331200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331203, '衢山岛', 'Qushan', NULL, NULL, NULL, 331200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331204, '舟山本岛西北部', 'Zhoushan', NULL, NULL, NULL, 331200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331205, '岱山岛西南部', 'Daishan', NULL, NULL, NULL, 331200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331206, '泗礁岛', 'Sijiao', NULL, NULL, NULL, 331200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331207, '朱家尖岛', 'Zhujiajian', NULL, NULL, NULL, 331200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331208, '洋山岛', 'Yangshan', NULL, NULL, NULL, 331200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331209, '长涂岛', 'Changtu', NULL, NULL, NULL, 331200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (331210, '虾峙岛', 'Xiazhi', NULL, NULL, NULL, 331200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340000, '安徽省', 'Anhui', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340100, '合肥市', 'Hefei', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340102, '瑶海区', 'Yaohai', NULL, NULL, NULL, 340100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340103, '庐阳区', 'Luyang', NULL, NULL, NULL, 340100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340104, '蜀山区', 'Shushan', NULL, NULL, NULL, 340100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340111, '包河区', 'Baohe', NULL, NULL, NULL, 340100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340121, '长丰县', 'Changfeng', NULL, NULL, NULL, 340100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340122, '肥东县', 'Feidong', NULL, NULL, NULL, 340100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340123, '肥西县', 'Feixi', NULL, NULL, NULL, 340100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340124, '庐江县', 'Lujiang', NULL, NULL, NULL, 340100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340181, '巢湖市', 'Chaohu', NULL, NULL, NULL, 340100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340200, '芜湖市', 'Wuhu', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340202, '镜湖区', 'Jinghu', NULL, NULL, NULL, 340200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340203, '弋江区', 'Yijiang', NULL, NULL, NULL, 340200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340207, '鸠江区', 'Jiujiang', NULL, NULL, NULL, 340200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340208, '三山区', 'Sanshan', NULL, NULL, NULL, 340200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340221, '芜湖县', 'Wuhu', NULL, NULL, NULL, 340200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340222, '繁昌县', 'Fanchang', NULL, NULL, NULL, 340200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340223, '南陵县', 'Nanling', NULL, NULL, NULL, 340200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340225, '无为县', 'Wuwei', NULL, NULL, NULL, 340200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340300, '蚌埠市', 'Bengbu', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340302, '龙子湖区', 'Longzihu', NULL, NULL, NULL, 340300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340303, '蚌山区', 'Bengshan', NULL, NULL, NULL, 340300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340304, '禹会区', 'Yuhui', NULL, NULL, NULL, 340300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340311, '淮上区', 'Huaishang', NULL, NULL, NULL, 340300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340321, '怀远县', 'Huaiyuan', NULL, NULL, NULL, 340300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340322, '五河县', 'Wuhe', NULL, NULL, NULL, 340300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340323, '固镇县', 'Guzhen', NULL, NULL, NULL, 340300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340400, '淮南市', 'Huainan', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340402, '大通区', 'Datong', NULL, NULL, NULL, 340400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340403, '田家庵区', 'Tianjiaan', NULL, NULL, NULL, 340400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340404, '谢家集区', 'Xiejiaji', NULL, NULL, NULL, 340400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340405, '八公山区', 'Bagongshan', NULL, NULL, NULL, 340400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340406, '潘集区', 'Panji', NULL, NULL, NULL, 340400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340421, '凤台县', 'Fengtai', NULL, NULL, NULL, 340400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340500, '马鞍山市', 'Ma\'anshan', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340503, '花山区', 'Huashan', NULL, NULL, NULL, 340500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340504, '雨山区', 'Yushan', NULL, NULL, NULL, 340500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340506, '博望区', 'Bowang', NULL, NULL, NULL, 340500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340521, '当涂县', 'Dangtu', NULL, NULL, NULL, 340500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340522, '含山县', 'Hanshan ', NULL, NULL, NULL, 340500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340523, '和县', 'Hexian', NULL, NULL, NULL, 340500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340600, '淮北市', 'Huaibei', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340602, '杜集区', 'Duji', NULL, NULL, NULL, 340600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340603, '相山区', 'Xiangshan', NULL, NULL, NULL, 340600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340604, '烈山区', 'Lieshan', NULL, NULL, NULL, 340600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340621, '濉溪县', 'Suixi', NULL, NULL, NULL, 340600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340700, '铜陵市', 'Tongling', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340702, '铜官山区', 'Tongguanshan', NULL, NULL, NULL, 340700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340703, '狮子山区', 'Shizishan', NULL, NULL, NULL, 340700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340711, '郊区', 'Jiaoqu', NULL, NULL, NULL, 340700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340721, '铜陵县', 'Tongling', NULL, NULL, NULL, 340700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340800, '安庆市', 'Anqing', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340802, '迎江区', 'Yingjiang', NULL, NULL, NULL, 340800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340803, '大观区', 'Daguan', NULL, NULL, NULL, 340800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340811, '宜秀区', 'Yixiu', NULL, NULL, NULL, 340800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340822, '怀宁县', 'Huaining', NULL, NULL, NULL, 340800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340823, '枞阳县', 'Zongyang', NULL, NULL, NULL, 340800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340824, '潜山县', 'Qianshan', NULL, NULL, NULL, 340800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340825, '太湖县', 'Taihu', NULL, NULL, NULL, 340800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340826, '宿松县', 'Susong', NULL, NULL, NULL, 340800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340827, '望江县', 'Wangjiang', NULL, NULL, NULL, 340800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340828, '岳西县', 'Yuexi', NULL, NULL, NULL, 340800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (340881, '桐城市', 'Tongcheng', NULL, NULL, NULL, 340800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341000, '黄山市', 'Huangshan', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341002, '屯溪区', 'Tunxi', NULL, NULL, NULL, 341000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341003, '黄山区', 'Huangshan', NULL, NULL, NULL, 341000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341004, '徽州区', 'Huizhou', NULL, NULL, NULL, 341000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341021, '歙县', 'Shexian', NULL, NULL, NULL, 341000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341022, '休宁县', 'Xiuning', NULL, NULL, NULL, 341000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341023, '黟县', 'Yixian', NULL, NULL, NULL, 341000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341024, '祁门县', 'Qimen', NULL, NULL, NULL, 341000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341100, '滁州市', 'Chuzhou', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341102, '琅琊区', 'Langya', NULL, NULL, NULL, 341100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341103, '南谯区', 'Nanqiao', NULL, NULL, NULL, 341100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341122, '来安县', 'Lai\'an', NULL, NULL, NULL, 341100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341124, '全椒县', 'Quanjiao', NULL, NULL, NULL, 341100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341125, '定远县', 'Dingyuan', NULL, NULL, NULL, 341100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341126, '凤阳县', 'Fengyang', NULL, NULL, NULL, 341100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341181, '天长市', 'Tianchang', NULL, NULL, NULL, 341100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341182, '明光市', 'Mingguang', NULL, NULL, NULL, 341100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341200, '阜阳市', 'Fuyang', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341202, '颍州区', 'Yingzhou', NULL, NULL, NULL, 341200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341203, '颍东区', 'Yingdong', NULL, NULL, NULL, 341200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341204, '颍泉区', 'Yingquan', NULL, NULL, NULL, 341200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341221, '临泉县', 'Linquan', NULL, NULL, NULL, 341200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341222, '太和县', 'Taihe', NULL, NULL, NULL, 341200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341225, '阜南县', 'Funan', NULL, NULL, NULL, 341200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341226, '颍上县', 'Yingshang', NULL, NULL, NULL, 341200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341282, '界首市', 'Jieshou', NULL, NULL, NULL, 341200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341300, '宿州市', 'Suzhou', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341302, '埇桥区', 'Yongqiao', NULL, NULL, NULL, 341300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341321, '砀山县', 'Dangshan', NULL, NULL, NULL, 341300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341322, '萧县', 'Xiaoxian', NULL, NULL, NULL, 341300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341323, '灵璧县', 'Lingbi', NULL, NULL, NULL, 341300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341324, '泗县', 'Sixian', NULL, NULL, NULL, 341300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341500, '六安市', 'Lu\'an', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341502, '金安区', 'Jin\'an', NULL, NULL, NULL, 341500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341503, '裕安区', 'Yu\'an', NULL, NULL, NULL, 341500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341521, '寿县', 'Shouxian', NULL, NULL, NULL, 341500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341522, '霍邱县', 'Huoqiu', NULL, NULL, NULL, 341500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341523, '舒城县', 'Shucheng', NULL, NULL, NULL, 341500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341524, '金寨县', 'Jinzhai', NULL, NULL, NULL, 341500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341525, '霍山县', 'Huoshan', NULL, NULL, NULL, 341500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341600, '亳州市', 'Bozhou', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341602, '谯城区', 'Qiaocheng', NULL, NULL, NULL, 341600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341621, '涡阳县', 'Guoyang', NULL, NULL, NULL, 341600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341622, '蒙城县', 'Mengcheng', NULL, NULL, NULL, 341600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341623, '利辛县', 'Lixin', NULL, NULL, NULL, 341600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341700, '池州市', 'Chizhou', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341702, '贵池区', 'Guichi', NULL, NULL, NULL, 341700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341721, '东至县', 'Dongzhi', NULL, NULL, NULL, 341700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341722, '石台县', 'Shitai', NULL, NULL, NULL, 341700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341723, '青阳县', 'Qingyang', NULL, NULL, NULL, 341700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341800, '宣城市', 'Xuancheng', NULL, NULL, NULL, 340000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341802, '宣州区', 'Xuanzhou', NULL, NULL, NULL, 341800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341821, '郎溪县', 'Langxi', NULL, NULL, NULL, 341800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341822, '广德县', 'Guangde', NULL, NULL, NULL, 341800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341823, '泾县', 'Jingxian', NULL, NULL, NULL, 341800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341824, '绩溪县', 'Jixi', NULL, NULL, NULL, 341800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341825, '旌德县', 'Jingde', NULL, NULL, NULL, 341800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (341881, '宁国市', 'Ningguo', NULL, NULL, NULL, 341800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350000, '福建省', 'Fujian', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350100, '福州市', 'Fuzhou', NULL, NULL, NULL, 350000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350102, '鼓楼区', 'Gulou', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350103, '台江区', 'Taijiang', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350104, '仓山区', 'Cangshan', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350105, '马尾区', 'Mawei', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350111, '晋安区', 'Jin\'an', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350121, '闽侯县', 'Minhou', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350122, '连江县', 'Lianjiang', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350123, '罗源县', 'Luoyuan', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350124, '闽清县', 'Minqing', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350125, '永泰县', 'Yongtai', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350128, '平潭县', 'Pingtan', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350181, '福清市', 'Fuqing', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350182, '长乐市', 'Changle', NULL, NULL, NULL, 350100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350200, '厦门市', 'Xiamen', NULL, NULL, NULL, 350000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350203, '思明区', 'Siming', NULL, NULL, NULL, 350200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350205, '海沧区', 'Haicang', NULL, NULL, NULL, 350200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350206, '湖里区', 'Huli', NULL, NULL, NULL, 350200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350211, '集美区', 'Jimei', NULL, NULL, NULL, 350200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350212, '同安区', 'Tong\'an', NULL, NULL, NULL, 350200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350213, '翔安区', 'Xiang\'an', NULL, NULL, NULL, 350200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350300, '莆田市', 'Putian', NULL, NULL, NULL, 350000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350302, '城厢区', 'Chengxiang', NULL, NULL, NULL, 350300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350303, '涵江区', 'Hanjiang', NULL, NULL, NULL, 350300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350304, '荔城区', 'Licheng', NULL, NULL, NULL, 350300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350305, '秀屿区', 'Xiuyu', NULL, NULL, NULL, 350300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350322, '仙游县', 'Xianyou', NULL, NULL, NULL, 350300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350400, '三明市', 'Sanming', NULL, NULL, NULL, 350000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350402, '梅列区', 'Meilie', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350403, '三元区', 'Sanyuan', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350421, '明溪县', 'Mingxi', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350423, '清流县', 'Qingliu', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350424, '宁化县', 'Ninghua', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350425, '大田县', 'Datian', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350426, '尤溪县', 'Youxi', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350427, '沙县', 'Shaxian', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350428, '将乐县', 'Jiangle', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350429, '泰宁县', 'Taining', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350430, '建宁县', 'Jianning', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350481, '永安市', 'Yong\'an', NULL, NULL, NULL, 350400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350500, '泉州市', 'Quanzhou', NULL, NULL, NULL, 350000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350502, '鲤城区', 'Licheng', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350503, '丰泽区', 'Fengze', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350504, '洛江区', 'Luojiang', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350505, '泉港区', 'Quangang', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350521, '惠安县', 'Hui\'an', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350524, '安溪县', 'Anxi', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350525, '永春县', 'Yongchun', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350526, '德化县', 'Dehua', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350527, '金门县', 'Jinmen', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350581, '石狮市', 'Shishi', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350582, '晋江市', 'Jinjiang', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350583, '南安市', 'Nan\'an', NULL, NULL, NULL, 350500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350600, '漳州市', 'Zhangzhou', NULL, NULL, NULL, 350000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350602, '芗城区', 'Xiangcheng', NULL, NULL, NULL, 350600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350603, '龙文区', 'Longwen', NULL, NULL, NULL, 350600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350622, '云霄县', 'Yunxiao', NULL, NULL, NULL, 350600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350623, '漳浦县', 'Zhangpu', NULL, NULL, NULL, 350600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350624, '诏安县', 'Zhao\'an', NULL, NULL, NULL, 350600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350625, '长泰县', 'Changtai', NULL, NULL, NULL, 350600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350626, '东山县', 'Dongshan', NULL, NULL, NULL, 350600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350627, '南靖县', 'Nanjing', NULL, NULL, NULL, 350600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350628, '平和县', 'Pinghe', NULL, NULL, NULL, 350600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350629, '华安县', 'Hua\'an', NULL, NULL, NULL, 350600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350681, '龙海市', 'Longhai', NULL, NULL, NULL, 350600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350700, '南平市', 'Nanping', NULL, NULL, NULL, 350000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350702, '延平区', 'Yanping', NULL, NULL, NULL, 350700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350703, '建阳区', 'Jianyang', NULL, NULL, NULL, 350700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350721, '顺昌县', 'Shunchang', NULL, NULL, NULL, 350700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350722, '浦城县', 'Pucheng', NULL, NULL, NULL, 350700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350723, '光泽县', 'Guangze', NULL, NULL, NULL, 350700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350724, '松溪县', 'Songxi', NULL, NULL, NULL, 350700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350725, '政和县', 'Zhenghe', NULL, NULL, NULL, 350700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350781, '邵武市', 'Shaowu', NULL, NULL, NULL, 350700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350782, '武夷山市', 'Wuyishan', NULL, NULL, NULL, 350700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350783, '建瓯市', 'Jianou', NULL, NULL, NULL, 350700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350800, '龙岩市', 'Longyan', NULL, NULL, NULL, 350000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350802, '新罗区', 'Xinluo', NULL, NULL, NULL, 350800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350821, '长汀县', 'Changting', NULL, NULL, NULL, 350800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350822, '永定区', 'Yongding', NULL, NULL, NULL, 350800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350823, '上杭县', 'Shanghang', NULL, NULL, NULL, 350800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350824, '武平县', 'Wuping', NULL, NULL, NULL, 350800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350825, '连城县', 'Liancheng', NULL, NULL, NULL, 350800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350881, '漳平市', 'Zhangping', NULL, NULL, NULL, 350800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350900, '宁德市', 'Ningde', NULL, NULL, NULL, 350000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350902, '蕉城区', 'Jiaocheng', NULL, NULL, NULL, 350900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350921, '霞浦县', 'Xiapu', NULL, NULL, NULL, 350900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350922, '古田县', 'Gutian', NULL, NULL, NULL, 350900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350923, '屏南县', 'Pingnan', NULL, NULL, NULL, 350900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350924, '寿宁县', 'Shouning', NULL, NULL, NULL, 350900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350925, '周宁县', 'Zhouning', NULL, NULL, NULL, 350900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350926, '柘荣县', 'Zherong', NULL, NULL, NULL, 350900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350981, '福安市', 'Fu\'an', NULL, NULL, NULL, 350900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (350982, '福鼎市', 'Fuding', NULL, NULL, NULL, 350900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360000, '江西省', 'Jiangxi', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360100, '南昌市', 'Nanchang', NULL, NULL, NULL, 360000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360102, '东湖区', 'Donghu', NULL, NULL, NULL, 360100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360103, '西湖区', 'Xihu', NULL, NULL, NULL, 360100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360104, '青云谱区', 'Qingyunpu', NULL, NULL, NULL, 360100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360105, '湾里区', 'Wanli', NULL, NULL, NULL, 360100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360111, '青山湖区', 'Qingshanhu', NULL, NULL, NULL, 360100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360121, '南昌县', 'Nanchang', NULL, NULL, NULL, 360100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360122, '新建县', 'Xinjian', NULL, NULL, NULL, 360100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360123, '安义县', 'Anyi', NULL, NULL, NULL, 360100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360124, '进贤县', 'Jinxian', NULL, NULL, NULL, 360100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360200, '景德镇市', 'Jingdezhen', NULL, NULL, NULL, 360000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360202, '昌江区', 'Changjiang', NULL, NULL, NULL, 360200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360203, '珠山区', 'Zhushan', NULL, NULL, NULL, 360200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360222, '浮梁县', 'Fuliang', NULL, NULL, NULL, 360200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360281, '乐平市', 'Leping', NULL, NULL, NULL, 360200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360300, '萍乡市', 'Pingxiang', NULL, NULL, NULL, 360000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360302, '安源区', 'Anyuan', NULL, NULL, NULL, 360300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360313, '湘东区', 'Xiangdong', NULL, NULL, NULL, 360300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360321, '莲花县', 'Lianhua', NULL, NULL, NULL, 360300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360322, '上栗县', 'Shangli', NULL, NULL, NULL, 360300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360323, '芦溪县', 'Luxi', NULL, NULL, NULL, 360300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360400, '九江市', 'Jiujiang', NULL, NULL, NULL, 360000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360402, '庐山区', 'Lushan', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360403, '浔阳区', 'Xunyang', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360421, '九江县', 'Jiujiang', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360423, '武宁县', 'Wuning', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360424, '修水县', 'Xiushui', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360425, '永修县', 'Yongxiu', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360426, '德安县', 'De\'an', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360427, '星子县', 'Xingzi', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360428, '都昌县', 'Duchang', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360429, '湖口县', 'Hukou', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360430, '彭泽县', 'Pengze', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360481, '瑞昌市', 'Ruichang', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360482, '共青城市', 'Gongqingcheng', NULL, NULL, NULL, 360400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360500, '新余市', 'Xinyu', NULL, NULL, NULL, 360000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360502, '渝水区', 'Yushui', NULL, NULL, NULL, 360500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360521, '分宜县', 'Fenyi', NULL, NULL, NULL, 360500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360600, '鹰潭市', 'Yingtan', NULL, NULL, NULL, 360000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360602, '月湖区', 'Yuehu', NULL, NULL, NULL, 360600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360622, '余江县', 'Yujiang', NULL, NULL, NULL, 360600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360681, '贵溪市', 'Guixi', NULL, NULL, NULL, 360600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360700, '赣州市', 'Ganzhou', NULL, NULL, NULL, 360000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360702, '章贡区', 'Zhanggong', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360703, '南康区', 'Nankang', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360721, '赣县', 'Ganxian', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360722, '信丰县', 'Xinfeng', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360723, '大余县', 'Dayu', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360724, '上犹县', 'Shangyou', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360725, '崇义县', 'Chongyi', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360726, '安远县', 'Anyuan', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360727, '龙南县', 'Longnan', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360728, '定南县', 'Dingnan', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360729, '全南县', 'Quannan', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360730, '宁都县', 'Ningdu', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360731, '于都县', 'Yudu', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360732, '兴国县', 'Xingguo', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360733, '会昌县', 'Huichang', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360734, '寻乌县', 'Xunwu', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360735, '石城县', 'Shicheng', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360781, '瑞金市', 'Ruijin', NULL, NULL, NULL, 360700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360800, '吉安市', 'Ji\'an', NULL, NULL, NULL, 360000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360802, '吉州区', 'Jizhou', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360803, '青原区', 'Qingyuan', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360821, '吉安县', 'Ji\'an', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360822, '吉水县', 'Jishui', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360823, '峡江县', 'Xiajiang', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360824, '新干县', 'Xingan', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360825, '永丰县', 'Yongfeng', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360826, '泰和县', 'Taihe', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360827, '遂川县', 'Suichuan', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360828, '万安县', 'Wan\'an', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360829, '安福县', 'Anfu', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360830, '永新县', 'Yongxin', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360881, '井冈山市', 'Jinggangshan', NULL, NULL, NULL, 360800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360900, '宜春市', 'Yichun', NULL, NULL, NULL, 360000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360902, '袁州区', 'Yuanzhou', NULL, NULL, NULL, 360900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360921, '奉新县', 'Fengxin', NULL, NULL, NULL, 360900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360922, '万载县', 'Wanzai', NULL, NULL, NULL, 360900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360923, '上高县', 'Shanggao', NULL, NULL, NULL, 360900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360924, '宜丰县', 'Yifeng', NULL, NULL, NULL, 360900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360925, '靖安县', 'Jing\'an', NULL, NULL, NULL, 360900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360926, '铜鼓县', 'Tonggu', NULL, NULL, NULL, 360900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360981, '丰城市', 'Fengcheng', NULL, NULL, NULL, 360900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360982, '樟树市', 'Zhangshu', NULL, NULL, NULL, 360900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (360983, '高安市', 'Gao\'an', NULL, NULL, NULL, 360900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361000, '抚州市', 'Fuzhou', NULL, NULL, NULL, 360000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361002, '临川区', 'Linchuan', NULL, NULL, NULL, 361000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361021, '南城县', 'Nancheng', NULL, NULL, NULL, 361000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361022, '黎川县', 'Lichuan', NULL, NULL, NULL, 361000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361023, '南丰县', 'Nanfeng', NULL, NULL, NULL, 361000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361024, '崇仁县', 'Chongren', NULL, NULL, NULL, 361000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361025, '乐安县', 'Le\'an', NULL, NULL, NULL, 361000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361026, '宜黄县', 'Yihuang', NULL, NULL, NULL, 361000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361027, '金溪县', 'Jinxi', NULL, NULL, NULL, 361000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361028, '资溪县', 'Zixi', NULL, NULL, NULL, 361000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361029, '东乡县', 'Dongxiang', NULL, NULL, NULL, 361000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361030, '广昌县', 'Guangchang', NULL, NULL, NULL, 361000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361100, '上饶市', 'Shangrao', NULL, NULL, NULL, 360000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361102, '信州区', 'Xinzhou', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361121, '上饶县', 'Shangrao', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361122, '广丰县', 'Guangfeng', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361123, '玉山县', 'Yushan', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361124, '铅山县', 'Yanshan', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361125, '横峰县', 'Hengfeng', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361126, '弋阳县', 'Yiyang', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361127, '余干县', 'Yugan', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361128, '鄱阳县', 'Poyang', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361129, '万年县', 'Wannian', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361130, '婺源县', 'Wuyuan', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (361181, '德兴市', 'Dexing', NULL, NULL, NULL, 361100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370000, '山东省', 'Shandong', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370100, '济南市', 'Jinan', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370102, '历下区', 'Lixia', NULL, NULL, NULL, 370100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370103, '市中区', 'Shizhongqu', NULL, NULL, NULL, 370100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370104, '槐荫区', 'Huaiyin', NULL, NULL, NULL, 370100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370105, '天桥区', 'Tianqiao', NULL, NULL, NULL, 370100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370112, '历城区', 'Licheng', NULL, NULL, NULL, 370100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370113, '长清区', 'Changqing', NULL, NULL, NULL, 370100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370124, '平阴县', 'Pingyin', NULL, NULL, NULL, 370100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370125, '济阳县', 'Jiyang', NULL, NULL, NULL, 370100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370126, '商河县', 'Shanghe', NULL, NULL, NULL, 370100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370181, '章丘市', 'Zhangqiu', NULL, NULL, NULL, 370100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370200, '青岛市', 'Qingdao', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370202, '市南区', 'Shinan', NULL, NULL, NULL, 370200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370203, '市北区', 'Shibei', NULL, NULL, NULL, 370200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370211, '黄岛区', 'Huangdao', NULL, NULL, NULL, 370200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370212, '崂山区', 'Laoshan', NULL, NULL, NULL, 370200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370213, '李沧区', 'Licang', NULL, NULL, NULL, 370200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370214, '城阳区', 'Chengyang', NULL, NULL, NULL, 370200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370281, '胶州市', 'Jiaozhou', NULL, NULL, NULL, 370200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370282, '即墨市', 'Jimo', NULL, NULL, NULL, 370200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370283, '平度市', 'Pingdu', NULL, NULL, NULL, 370200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370285, '莱西市', 'Laixi', NULL, NULL, NULL, 370200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370286, '西海岸新区', 'Xihai\'an', NULL, NULL, NULL, 370200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370300, '淄博市', 'Zibo', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370302, '淄川区', 'Zichuan', NULL, NULL, NULL, 370300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370303, '张店区', 'Zhangdian', NULL, NULL, NULL, 370300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370304, '博山区', 'Boshan', NULL, NULL, NULL, 370300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370305, '临淄区', 'Linzi', NULL, NULL, NULL, 370300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370306, '周村区', 'Zhoucun', NULL, NULL, NULL, 370300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370321, '桓台县', 'Huantai', NULL, NULL, NULL, 370300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370322, '高青县', 'Gaoqing', NULL, NULL, NULL, 370300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370323, '沂源县', 'Yiyuan', NULL, NULL, NULL, 370300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370400, '枣庄市', 'Zaozhuang', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370402, '市中区', 'Shizhongqu', NULL, NULL, NULL, 370400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370403, '薛城区', 'Xuecheng', NULL, NULL, NULL, 370400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370404, '峄城区', 'Yicheng', NULL, NULL, NULL, 370400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370405, '台儿庄区', 'Taierzhuang', NULL, NULL, NULL, 370400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370406, '山亭区', 'Shanting', NULL, NULL, NULL, 370400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370481, '滕州市', 'Tengzhou', NULL, NULL, NULL, 370400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370500, '东营市', 'Dongying', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370502, '东营区', 'Dongying', NULL, NULL, NULL, 370500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370503, '河口区', 'Hekou', NULL, NULL, NULL, 370500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370521, '垦利县', 'Kenli', NULL, NULL, NULL, 370500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370522, '利津县', 'Lijin', NULL, NULL, NULL, 370500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370523, '广饶县', 'Guangrao', NULL, NULL, NULL, 370500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370600, '烟台市', 'Yantai', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370602, '芝罘区', 'Zhifu', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370611, '福山区', 'Fushan', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370612, '牟平区', 'Muping', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370613, '莱山区', 'Laishan', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370634, '长岛县', 'Changdao', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370681, '龙口市', 'Longkou', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370682, '莱阳市', 'Laiyang', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370683, '莱州市', 'Laizhou', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370684, '蓬莱市', 'Penglai', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370685, '招远市', 'Zhaoyuan', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370686, '栖霞市', 'Qixia', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370687, '海阳市', 'Haiyang', NULL, NULL, NULL, 370600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370700, '潍坊市', 'Weifang', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370702, '潍城区', 'Weicheng', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370703, '寒亭区', 'Hanting', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370704, '坊子区', 'Fangzi', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370705, '奎文区', 'Kuiwen', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370724, '临朐县', 'Linqu', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370725, '昌乐县', 'Changle', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370781, '青州市', 'Qingzhou', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370782, '诸城市', 'Zhucheng', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370783, '寿光市', 'Shouguang', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370784, '安丘市', 'Anqiu', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370785, '高密市', 'Gaomi', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370786, '昌邑市', 'Changyi', NULL, NULL, NULL, 370700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370800, '济宁市', 'Jining', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370811, '任城区', 'Rencheng', NULL, NULL, NULL, 370800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370812, '兖州区', 'Yanzhou ', NULL, NULL, NULL, 370800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370826, '微山县', 'Weishan', NULL, NULL, NULL, 370800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370827, '鱼台县', 'Yutai', NULL, NULL, NULL, 370800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370828, '金乡县', 'Jinxiang', NULL, NULL, NULL, 370800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370829, '嘉祥县', 'Jiaxiang', NULL, NULL, NULL, 370800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370830, '汶上县', 'Wenshang', NULL, NULL, NULL, 370800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370831, '泗水县', 'Sishui', NULL, NULL, NULL, 370800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370832, '梁山县', 'Liangshan', NULL, NULL, NULL, 370800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370881, '曲阜市', 'Qufu', NULL, NULL, NULL, 370800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370883, '邹城市', 'Zoucheng', NULL, NULL, NULL, 370800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370900, '泰安市', 'Tai\'an', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370902, '泰山区', 'Taishan', NULL, NULL, NULL, 370900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370911, '岱岳区', 'Daiyue', NULL, NULL, NULL, 370900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370921, '宁阳县', 'Ningyang', NULL, NULL, NULL, 370900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370923, '东平县', 'Dongping', NULL, NULL, NULL, 370900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370982, '新泰市', 'Xintai', NULL, NULL, NULL, 370900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (370983, '肥城市', 'Feicheng', NULL, NULL, NULL, 370900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371000, '威海市', 'Weihai', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371002, '环翠区', 'Huancui', NULL, NULL, NULL, 371000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371003, '文登区', 'Wendeng', NULL, NULL, NULL, 371000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371082, '荣成市', 'Rongcheng', NULL, NULL, NULL, 371000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371083, '乳山市', 'Rushan', NULL, NULL, NULL, 371000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371100, '日照市', 'Rizhao', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371102, '东港区', 'Donggang', NULL, NULL, NULL, 371100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371103, '岚山区', 'Lanshan', NULL, NULL, NULL, 371100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371121, '五莲县', 'Wulian', NULL, NULL, NULL, 371100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371122, '莒县', 'Juxian', NULL, NULL, NULL, 371100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371200, '莱芜市', 'Laiwu', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371202, '莱城区', 'Laicheng', NULL, NULL, NULL, 371200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371203, '钢城区', 'Gangcheng', NULL, NULL, NULL, 371200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371300, '临沂市', 'Linyi', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371302, '兰山区', 'Lanshan', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371311, '罗庄区', 'Luozhuang', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371312, '河东区', 'Hedong', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371321, '沂南县', 'Yinan', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371322, '郯城县', 'Tancheng', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371323, '沂水县', 'Yishui', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371324, '兰陵县', 'Lanling', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371325, '费县', 'Feixian', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371326, '平邑县', 'Pingyi', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371327, '莒南县', 'Junan', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371328, '蒙阴县', 'Mengyin', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371329, '临沭县', 'Linshu', NULL, NULL, NULL, 371300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371400, '德州市', 'Dezhou', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371402, '德城区', 'Decheng', NULL, NULL, NULL, 371400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371403, '陵城区', 'Lingcheng', NULL, NULL, NULL, 371400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371422, '宁津县', 'Ningjin', NULL, NULL, NULL, 371400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371423, '庆云县', 'Qingyun', NULL, NULL, NULL, 371400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371424, '临邑县', 'Linyi', NULL, NULL, NULL, 371400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371425, '齐河县', 'Qihe', NULL, NULL, NULL, 371400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371426, '平原县', 'Pingyuan', NULL, NULL, NULL, 371400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371427, '夏津县', 'Xiajin', NULL, NULL, NULL, 371400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371428, '武城县', 'Wucheng', NULL, NULL, NULL, 371400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371481, '乐陵市', 'Leling', NULL, NULL, NULL, 371400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371482, '禹城市', 'Yucheng', NULL, NULL, NULL, 371400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371500, '聊城市', 'Liaocheng', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371502, '东昌府区', 'Dongchangfu', NULL, NULL, NULL, 371500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371521, '阳谷县', 'Yanggu', NULL, NULL, NULL, 371500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371522, '莘县', 'Shenxian', NULL, NULL, NULL, 371500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371523, '茌平县', 'Chiping', NULL, NULL, NULL, 371500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371524, '东阿县', 'Dong\'e', NULL, NULL, NULL, 371500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371525, '冠县', 'Guanxian', NULL, NULL, NULL, 371500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371526, '高唐县', 'Gaotang', NULL, NULL, NULL, 371500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371581, '临清市', 'Linqing', NULL, NULL, NULL, 371500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371600, '滨州市', 'Binzhou', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371602, '滨城区', 'Bincheng', NULL, NULL, NULL, 371600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371603, '沾化区', 'Zhanhua', NULL, NULL, NULL, 371600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371621, '惠民县', 'Huimin', NULL, NULL, NULL, 371600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371622, '阳信县', 'Yangxin', NULL, NULL, NULL, 371600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371623, '无棣县', 'Wudi', NULL, NULL, NULL, 371600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371625, '博兴县', 'Boxing', NULL, NULL, NULL, 371600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371626, '邹平县', 'Zouping', NULL, NULL, NULL, 371600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371627, '北海新区', 'Beihaixinqu', NULL, NULL, NULL, 371600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371700, '菏泽市', 'Heze', NULL, NULL, NULL, 370000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371702, '牡丹区', 'Mudan', NULL, NULL, NULL, 371700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371721, '曹县', 'Caoxian', NULL, NULL, NULL, 371700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371722, '单县', 'Shanxian', NULL, NULL, NULL, 371700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371723, '成武县', 'Chengwu', NULL, NULL, NULL, 371700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371724, '巨野县', 'Juye', NULL, NULL, NULL, 371700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371725, '郓城县', 'Yuncheng', NULL, NULL, NULL, 371700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371726, '鄄城县', 'Juancheng', NULL, NULL, NULL, 371700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371727, '定陶县', 'Dingtao', NULL, NULL, NULL, 371700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (371728, '东明县', 'Dongming', NULL, NULL, NULL, 371700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410000, '河南省', 'Henan', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410100, '郑州市', 'Zhengzhou', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410102, '中原区', 'Zhongyuan', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410103, '二七区', 'Erqi', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410104, '管城回族区', 'Guancheng', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410105, '金水区', 'Jinshui', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410106, '上街区', 'Shangjie', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410108, '惠济区', 'Huiji', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410122, '中牟县', 'Zhongmu', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410181, '巩义市', 'Gongyi', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410182, '荥阳市', 'Xingyang', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410183, '新密市', 'Xinmi', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410184, '新郑市', 'Xinzheng', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410185, '登封市', 'Dengfeng', NULL, NULL, NULL, 410100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410200, '开封市', 'Kaifeng', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410202, '龙亭区', 'Longting', NULL, NULL, NULL, 410200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410203, '顺河回族区', 'Shunhe', NULL, NULL, NULL, 410200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410204, '鼓楼区', 'Gulou', NULL, NULL, NULL, 410200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410205, '禹王台区', 'Yuwangtai', NULL, NULL, NULL, 410200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410212, '祥符区', 'Xiangfu', NULL, NULL, NULL, 410200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410221, '杞县', 'Qixian', NULL, NULL, NULL, 410200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410222, '通许县', 'Tongxu', NULL, NULL, NULL, 410200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410223, '尉氏县', 'Weishi', NULL, NULL, NULL, 410200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410225, '兰考县', 'Lankao', NULL, NULL, NULL, 410200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410300, '洛阳市', 'Luoyang', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410302, '老城区', 'Laocheng', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410303, '西工区', 'Xigong', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410304, '瀍河回族区', 'Chanhe', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410305, '涧西区', 'Jianxi', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410306, '吉利区', 'Jili', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410311, '洛龙区', 'Luolong', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410322, '孟津县', 'Mengjin', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410323, '新安县', 'Xin\'an', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410324, '栾川县', 'Luanchuan', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410325, '嵩县', 'Songxian', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410326, '汝阳县', 'Ruyang', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410327, '宜阳县', 'Yiyang', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410328, '洛宁县', 'Luoning', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410329, '伊川县', 'Yichuan', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410381, '偃师市', 'Yanshi', NULL, NULL, NULL, 410300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410400, '平顶山市', 'Pingdingshan', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410402, '新华区', 'Xinhua', NULL, NULL, NULL, 410400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410403, '卫东区', 'Weidong', NULL, NULL, NULL, 410400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410404, '石龙区', 'Shilong', NULL, NULL, NULL, 410400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410411, '湛河区', 'Zhanhe', NULL, NULL, NULL, 410400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410421, '宝丰县', 'Baofeng', NULL, NULL, NULL, 410400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410422, '叶县', 'Yexian', NULL, NULL, NULL, 410400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410423, '鲁山县', 'Lushan', NULL, NULL, NULL, 410400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410425, '郏县', 'Jiaxian', NULL, NULL, NULL, 410400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410481, '舞钢市', 'Wugang', NULL, NULL, NULL, 410400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410482, '汝州市', 'Ruzhou', NULL, NULL, NULL, 410400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410500, '安阳市', 'Anyang', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410502, '文峰区', 'Wenfeng', NULL, NULL, NULL, 410500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410503, '北关区', 'Beiguan', NULL, NULL, NULL, 410500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410505, '殷都区', 'Yindu', NULL, NULL, NULL, 410500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410506, '龙安区', 'Long\'an', NULL, NULL, NULL, 410500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410522, '安阳县', 'Anyang', NULL, NULL, NULL, 410500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410523, '汤阴县', 'Tangyin', NULL, NULL, NULL, 410500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410526, '滑县', 'Huaxian', NULL, NULL, NULL, 410500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410527, '内黄县', 'Neihuang', NULL, NULL, NULL, 410500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410581, '林州市', 'Linzhou', NULL, NULL, NULL, 410500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410600, '鹤壁市', 'Hebi', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410602, '鹤山区', 'Heshan', NULL, NULL, NULL, 410600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410603, '山城区', 'Shancheng', NULL, NULL, NULL, 410600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410611, '淇滨区', 'Qibin', NULL, NULL, NULL, 410600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410621, '浚县', 'Xunxian', NULL, NULL, NULL, 410600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410622, '淇县', 'Qixian', NULL, NULL, NULL, 410600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410700, '新乡市', 'Xinxiang', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410702, '红旗区', 'Hongqi', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410703, '卫滨区', 'Weibin', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410704, '凤泉区', 'Fengquan', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410711, '牧野区', 'Muye', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410721, '新乡县', 'Xinxiang', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410724, '获嘉县', 'Huojia', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410725, '原阳县', 'Yuanyang', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410726, '延津县', 'Yanjin', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410727, '封丘县', 'Fengqiu', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410728, '长垣县', 'Changyuan', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410781, '卫辉市', 'Weihui', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410782, '辉县市', 'Huixian', NULL, NULL, NULL, 410700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410800, '焦作市', 'Jiaozuo', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410802, '解放区', 'Jiefang', NULL, NULL, NULL, 410800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410803, '中站区', 'Zhongzhan', NULL, NULL, NULL, 410800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410804, '马村区', 'Macun', NULL, NULL, NULL, 410800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410811, '山阳区', 'Shanyang', NULL, NULL, NULL, 410800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410821, '修武县', 'Xiuwu', NULL, NULL, NULL, 410800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410822, '博爱县', 'Boai', NULL, NULL, NULL, 410800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410823, '武陟县', 'Wuzhi', NULL, NULL, NULL, 410800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410825, '温县', 'Wenxian', NULL, NULL, NULL, 410800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410882, '沁阳市', 'Qinyang', NULL, NULL, NULL, 410800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410883, '孟州市', 'Mengzhou', NULL, NULL, NULL, 410800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410900, '濮阳市', 'Puyang', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410902, '华龙区', 'Hualong', NULL, NULL, NULL, 410900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410922, '清丰县', 'Qingfeng', NULL, NULL, NULL, 410900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410923, '南乐县', 'Nanle', NULL, NULL, NULL, 410900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410926, '范县', 'Fanxian', NULL, NULL, NULL, 410900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410927, '台前县', 'Taiqian', NULL, NULL, NULL, 410900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (410928, '濮阳县', 'Puyang', NULL, NULL, NULL, 410900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411000, '许昌市', 'Xuchang', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411002, '魏都区', 'Weidu', NULL, NULL, NULL, 411000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411023, '许昌县', 'Xuchang', NULL, NULL, NULL, 411000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411024, '鄢陵县', 'Yanling', NULL, NULL, NULL, 411000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411025, '襄城县', 'Xiangcheng', NULL, NULL, NULL, 411000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411081, '禹州市', 'Yuzhou', NULL, NULL, NULL, 411000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411082, '长葛市', 'Changge', NULL, NULL, NULL, 411000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411100, '漯河市', 'Luohe', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411102, '源汇区', 'Yuanhui', NULL, NULL, NULL, 411100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411103, '郾城区', 'Yancheng', NULL, NULL, NULL, 411100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411104, '召陵区', 'Zhaoling', NULL, NULL, NULL, 411100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411121, '舞阳县', 'Wuyang', NULL, NULL, NULL, 411100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411122, '临颍县', 'Linying', NULL, NULL, NULL, 411100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411200, '三门峡市', 'Sanmenxia', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411202, '湖滨区', 'Hubin', NULL, NULL, NULL, 411200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411221, '渑池县', 'Mianchi', NULL, NULL, NULL, 411200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411222, '陕县', 'Shanxian', NULL, NULL, NULL, 411200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411224, '卢氏县', 'Lushi', NULL, NULL, NULL, 411200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411281, '义马市', 'Yima', NULL, NULL, NULL, 411200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411282, '灵宝市', 'Lingbao', NULL, NULL, NULL, 411200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411300, '南阳市', 'Nanyang', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411302, '宛城区', 'Wancheng', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411303, '卧龙区', 'Wolong', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411321, '南召县', 'Nanzhao', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411322, '方城县', 'Fangcheng', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411323, '西峡县', 'Xixia', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411324, '镇平县', 'Zhenping', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411325, '内乡县', 'Neixiang', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411326, '淅川县', 'Xichuan', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411327, '社旗县', 'Sheqi', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411328, '唐河县', 'Tanghe', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411329, '新野县', 'Xinye', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411330, '桐柏县', 'Tongbai', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411381, '邓州市', 'Dengzhou', NULL, NULL, NULL, 411300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411400, '商丘市', 'Shangqiu', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411402, '梁园区', 'Liangyuan', NULL, NULL, NULL, 411400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411403, '睢阳区', 'Suiyang', NULL, NULL, NULL, 411400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411421, '民权县', 'Minquan', NULL, NULL, NULL, 411400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411422, '睢县', 'Suixian', NULL, NULL, NULL, 411400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411423, '宁陵县', 'Ningling', NULL, NULL, NULL, 411400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411424, '柘城县', 'Zhecheng', NULL, NULL, NULL, 411400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411425, '虞城县', 'Yucheng', NULL, NULL, NULL, 411400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411426, '夏邑县', 'Xiayi', NULL, NULL, NULL, 411400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411481, '永城市', 'Yongcheng', NULL, NULL, NULL, 411400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411500, '信阳市', 'Xinyang', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411502, '浉河区', 'Shihe', NULL, NULL, NULL, 411500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411503, '平桥区', 'Pingqiao', NULL, NULL, NULL, 411500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411521, '罗山县', 'Luoshan', NULL, NULL, NULL, 411500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411522, '光山县', 'Guangshan', NULL, NULL, NULL, 411500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411523, '新县', 'Xinxian', NULL, NULL, NULL, 411500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411524, '商城县', 'Shangcheng', NULL, NULL, NULL, 411500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411525, '固始县', 'Gushi', NULL, NULL, NULL, 411500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411526, '潢川县', 'Huangchuan', NULL, NULL, NULL, 411500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411527, '淮滨县', 'Huaibin', NULL, NULL, NULL, 411500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411528, '息县', 'Xixian', NULL, NULL, NULL, 411500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411600, '周口市', 'Zhoukou', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411602, '川汇区', 'Chuanhui', NULL, NULL, NULL, 411600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411621, '扶沟县', 'Fugou', NULL, NULL, NULL, 411600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411622, '西华县', 'Xihua', NULL, NULL, NULL, 411600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411623, '商水县', 'Shangshui', NULL, NULL, NULL, 411600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411624, '沈丘县', 'Shenqiu', NULL, NULL, NULL, 411600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411625, '郸城县', 'Dancheng', NULL, NULL, NULL, 411600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411626, '淮阳县', 'Huaiyang', NULL, NULL, NULL, 411600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411627, '太康县', 'Taikang', NULL, NULL, NULL, 411600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411628, '鹿邑县', 'Luyi', NULL, NULL, NULL, 411600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411681, '项城市', 'Xiangcheng', NULL, NULL, NULL, 411600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411700, '驻马店市', 'Zhumadian', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411702, '驿城区', 'Yicheng', NULL, NULL, NULL, 411700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411721, '西平县', 'Xiping', NULL, NULL, NULL, 411700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411722, '上蔡县', 'Shangcai', NULL, NULL, NULL, 411700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411723, '平舆县', 'Pingyu', NULL, NULL, NULL, 411700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411724, '正阳县', 'Zhengyang', NULL, NULL, NULL, 411700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411725, '确山县', 'Queshan', NULL, NULL, NULL, 411700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411726, '泌阳县', 'Biyang', NULL, NULL, NULL, 411700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411727, '汝南县', 'Runan', NULL, NULL, NULL, 411700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411728, '遂平县', 'Suiping', NULL, NULL, NULL, 411700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (411729, '新蔡县', 'Xincai', NULL, NULL, NULL, 411700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (419000, '直辖县级', '', NULL, NULL, NULL, 410000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (419001, '济源市', 'Jiyuan', NULL, NULL, NULL, 419000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420000, '湖北省', 'Hubei', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420100, '武汉市', 'Wuhan', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420102, '江岸区', 'Jiang\'an', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420103, '江汉区', 'Jianghan', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420104, '硚口区', 'Qiaokou', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420105, '汉阳区', 'Hanyang', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420106, '武昌区', 'Wuchang', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420107, '青山区', 'Qingshan', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420111, '洪山区', 'Hongshan', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420112, '东西湖区', 'Dongxihu', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420113, '汉南区', 'Hannan', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420114, '蔡甸区', 'Caidian', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420115, '江夏区', 'Jiangxia', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420116, '黄陂区', 'Huangpi', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420117, '新洲区', 'Xinzhou', NULL, NULL, NULL, 420100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420200, '黄石市', 'Huangshi', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420202, '黄石港区', 'Huangshigang', NULL, NULL, NULL, 420200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420203, '西塞山区', 'Xisaishan', NULL, NULL, NULL, 420200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420204, '下陆区', 'Xialu', NULL, NULL, NULL, 420200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420205, '铁山区', 'Tieshan', NULL, NULL, NULL, 420200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420222, '阳新县', 'Yangxin', NULL, NULL, NULL, 420200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420281, '大冶市', 'Daye', NULL, NULL, NULL, 420200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420300, '十堰市', 'Shiyan', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420302, '茅箭区', 'Maojian', NULL, NULL, NULL, 420300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420303, '张湾区', 'Zhangwan', NULL, NULL, NULL, 420300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420304, '郧阳区', 'Yunyang', NULL, NULL, NULL, 420300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420322, '郧西县', 'Yunxi', NULL, NULL, NULL, 420300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420323, '竹山县', 'Zhushan', NULL, NULL, NULL, 420300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420324, '竹溪县', 'Zhuxi', NULL, NULL, NULL, 420300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420325, '房县', 'Fangxian', NULL, NULL, NULL, 420300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420381, '丹江口市', 'Danjiangkou', NULL, NULL, NULL, 420300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420500, '宜昌市', 'Yichang', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420502, '西陵区', 'Xiling', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420503, '伍家岗区', 'Wujiagang', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420504, '点军区', 'Dianjun', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420505, '猇亭区', 'Xiaoting', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420506, '夷陵区', 'Yiling', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420525, '远安县', 'Yuan\'an', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420526, '兴山县', 'Xingshan', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420527, '秭归县', 'Zigui', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420528, '长阳土家族自治县', 'Changyang', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420529, '五峰土家族自治县', 'Wufeng', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420581, '宜都市', 'Yidu', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420582, '当阳市', 'Dangyang', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420583, '枝江市', 'Zhijiang', NULL, NULL, NULL, 420500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420600, '襄阳市', 'Xiangyang', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420602, '襄城区', 'Xiangcheng', NULL, NULL, NULL, 420600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420606, '樊城区', 'Fancheng', NULL, NULL, NULL, 420600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420607, '襄州区', 'Xiangzhou', NULL, NULL, NULL, 420600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420624, '南漳县', 'Nanzhang', NULL, NULL, NULL, 420600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420625, '谷城县', 'Gucheng', NULL, NULL, NULL, 420600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420626, '保康县', 'Baokang', NULL, NULL, NULL, 420600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420682, '老河口市', 'Laohekou', NULL, NULL, NULL, 420600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420683, '枣阳市', 'Zaoyang', NULL, NULL, NULL, 420600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420684, '宜城市', 'Yicheng', NULL, NULL, NULL, 420600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420700, '鄂州市', 'Ezhou', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420702, '梁子湖区', 'Liangzihu', NULL, NULL, NULL, 420700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420703, '华容区', 'Huarong', NULL, NULL, NULL, 420700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420704, '鄂城区', 'Echeng', NULL, NULL, NULL, 420700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420800, '荆门市', 'Jingmen', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420802, '东宝区', 'Dongbao', NULL, NULL, NULL, 420800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420804, '掇刀区', 'Duodao', NULL, NULL, NULL, 420800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420821, '京山县', 'Jingshan', NULL, NULL, NULL, 420800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420822, '沙洋县', 'Shayang', NULL, NULL, NULL, 420800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420881, '钟祥市', 'Zhongxiang', NULL, NULL, NULL, 420800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420900, '孝感市', 'Xiaogan', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420902, '孝南区', 'Xiaonan', NULL, NULL, NULL, 420900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420921, '孝昌县', 'Xiaochang', NULL, NULL, NULL, 420900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420922, '大悟县', 'Dawu', NULL, NULL, NULL, 420900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420923, '云梦县', 'Yunmeng', NULL, NULL, NULL, 420900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420981, '应城市', 'Yingcheng', NULL, NULL, NULL, 420900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420982, '安陆市', 'Anlu', NULL, NULL, NULL, 420900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (420984, '汉川市', 'Hanchuan', NULL, NULL, NULL, 420900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421000, '荆州市', 'Jingzhou', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421002, '沙市区', 'Shashi', NULL, NULL, NULL, 421000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421003, '荆州区', 'Jingzhou', NULL, NULL, NULL, 421000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421022, '公安县', 'Gong\'an', NULL, NULL, NULL, 421000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421023, '监利县', 'Jianli', NULL, NULL, NULL, 421000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421024, '江陵县', 'Jiangling', NULL, NULL, NULL, 421000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421081, '石首市', 'Shishou', NULL, NULL, NULL, 421000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421083, '洪湖市', 'Honghu', NULL, NULL, NULL, 421000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421087, '松滋市', 'Songzi', NULL, NULL, NULL, 421000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421100, '黄冈市', 'Huanggang', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421102, '黄州区', 'Huangzhou', NULL, NULL, NULL, 421100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421121, '团风县', 'Tuanfeng', NULL, NULL, NULL, 421100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421122, '红安县', 'Hong\'an', NULL, NULL, NULL, 421100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421123, '罗田县', 'Luotian', NULL, NULL, NULL, 421100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421124, '英山县', 'Yingshan', NULL, NULL, NULL, 421100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421125, '浠水县', 'Xishui', NULL, NULL, NULL, 421100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421126, '蕲春县', 'Qichun', NULL, NULL, NULL, 421100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421127, '黄梅县', 'Huangmei', NULL, NULL, NULL, 421100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421181, '麻城市', 'Macheng', NULL, NULL, NULL, 421100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421182, '武穴市', 'Wuxue', NULL, NULL, NULL, 421100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421200, '咸宁市', 'Xianning', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421202, '咸安区', 'Xian\'an', NULL, NULL, NULL, 421200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421221, '嘉鱼县', 'Jiayu', NULL, NULL, NULL, 421200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421222, '通城县', 'Tongcheng', NULL, NULL, NULL, 421200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421223, '崇阳县', 'Chongyang', NULL, NULL, NULL, 421200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421224, '通山县', 'Tongshan', NULL, NULL, NULL, 421200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421281, '赤壁市', 'Chibi', NULL, NULL, NULL, 421200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421300, '随州市', 'Suizhou', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421303, '曾都区', 'Zengdu', NULL, NULL, NULL, 421300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421321, '随县', 'Suixian', NULL, NULL, NULL, 421300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (421381, '广水市', 'Guangshui', NULL, NULL, NULL, 421300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (422800, '恩施土家族苗族自治州', 'Enshi', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (422801, '恩施市', 'Enshi', NULL, NULL, NULL, 422800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (422802, '利川市', 'Lichuan', NULL, NULL, NULL, 422800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (422822, '建始县', 'Jianshi', NULL, NULL, NULL, 422800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (422823, '巴东县', 'Badong', NULL, NULL, NULL, 422800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (422825, '宣恩县', 'Xuanen', NULL, NULL, NULL, 422800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (422826, '咸丰县', 'Xianfeng', NULL, NULL, NULL, 422800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (422827, '来凤县', 'Laifeng', NULL, NULL, NULL, 422800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (422828, '鹤峰县', 'Hefeng', NULL, NULL, NULL, 422800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (429000, '直辖县级', '', NULL, NULL, NULL, 420000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (429004, '仙桃市', 'Xiantao', NULL, NULL, NULL, 429000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (429005, '潜江市', 'Qianjiang', NULL, NULL, NULL, 429000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (429006, '天门市', 'Tianmen', NULL, NULL, NULL, 429000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (429021, '神农架林区', 'Shennongjia', NULL, NULL, NULL, 429000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430000, '湖南省', 'Hunan', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430100, '长沙市', 'Changsha', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430102, '芙蓉区', 'Furong', NULL, NULL, NULL, 430100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430103, '天心区', 'Tianxin', NULL, NULL, NULL, 430100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430104, '岳麓区', 'Yuelu', NULL, NULL, NULL, 430100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430105, '开福区', 'Kaifu', NULL, NULL, NULL, 430100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430111, '雨花区', 'Yuhua', NULL, NULL, NULL, 430100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430112, '望城区', 'Wangcheng', NULL, NULL, NULL, 430100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430121, '长沙县', 'Changsha', NULL, NULL, NULL, 430100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430124, '宁乡县', 'Ningxiang', NULL, NULL, NULL, 430100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430181, '浏阳市', 'Liuyang', NULL, NULL, NULL, 430100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430200, '株洲市', 'Zhuzhou', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430202, '荷塘区', 'Hetang', NULL, NULL, NULL, 430200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430203, '芦淞区', 'Lusong', NULL, NULL, NULL, 430200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430204, '石峰区', 'Shifeng', NULL, NULL, NULL, 430200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430211, '天元区', 'Tianyuan', NULL, NULL, NULL, 430200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430221, '株洲县', 'Zhuzhou', NULL, NULL, NULL, 430200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430223, '攸县', 'Youxian', NULL, NULL, NULL, 430200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430224, '茶陵县', 'Chaling', NULL, NULL, NULL, 430200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430225, '炎陵县', 'Yanling', NULL, NULL, NULL, 430200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430281, '醴陵市', 'Liling', NULL, NULL, NULL, 430200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430300, '湘潭市', 'Xiangtan', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430302, '雨湖区', 'Yuhu', NULL, NULL, NULL, 430300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430304, '岳塘区', 'Yuetang', NULL, NULL, NULL, 430300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430321, '湘潭县', 'Xiangtan', NULL, NULL, NULL, 430300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430381, '湘乡市', 'Xiangxiang', NULL, NULL, NULL, 430300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430382, '韶山市', 'Shaoshan', NULL, NULL, NULL, 430300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430400, '衡阳市', 'Hengyang', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430405, '珠晖区', 'Zhuhui', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430406, '雁峰区', 'Yanfeng', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430407, '石鼓区', 'Shigu', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430408, '蒸湘区', 'Zhengxiang', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430412, '南岳区', 'Nanyue', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430421, '衡阳县', 'Hengyang', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430422, '衡南县', 'Hengnan', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430423, '衡山县', 'Hengshan', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430424, '衡东县', 'Hengdong', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430426, '祁东县', 'Qidong', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430481, '耒阳市', 'Leiyang', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430482, '常宁市', 'Changning', NULL, NULL, NULL, 430400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430500, '邵阳市', 'Shaoyang', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430502, '双清区', 'Shuangqing', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430503, '大祥区', 'Daxiang', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430511, '北塔区', 'Beita', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430521, '邵东县', 'Shaodong', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430522, '新邵县', 'Xinshao', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430523, '邵阳县', 'Shaoyang', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430524, '隆回县', 'Longhui', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430525, '洞口县', 'Dongkou', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430527, '绥宁县', 'Suining', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430528, '新宁县', 'Xinning', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430529, '城步苗族自治县', 'Chengbu', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430581, '武冈市', 'Wugang', NULL, NULL, NULL, 430500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430600, '岳阳市', 'Yueyang', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430602, '岳阳楼区', 'Yueyanglou', NULL, NULL, NULL, 430600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430603, '云溪区', 'Yunxi', NULL, NULL, NULL, 430600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430611, '君山区', 'Junshan', NULL, NULL, NULL, 430600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430621, '岳阳县', 'Yueyang', NULL, NULL, NULL, 430600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430623, '华容县', 'Huarong', NULL, NULL, NULL, 430600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430624, '湘阴县', 'Xiangyin', NULL, NULL, NULL, 430600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430626, '平江县', 'Pingjiang', NULL, NULL, NULL, 430600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430681, '汨罗市', 'Miluo', NULL, NULL, NULL, 430600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430682, '临湘市', 'Linxiang', NULL, NULL, NULL, 430600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430700, '常德市', 'Changde', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430702, '武陵区', 'Wuling', NULL, NULL, NULL, 430700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430703, '鼎城区', 'Dingcheng', NULL, NULL, NULL, 430700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430721, '安乡县', 'Anxiang', NULL, NULL, NULL, 430700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430722, '汉寿县', 'Hanshou', NULL, NULL, NULL, 430700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430723, '澧县', 'Lixian', NULL, NULL, NULL, 430700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430724, '临澧县', 'Linli', NULL, NULL, NULL, 430700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430725, '桃源县', 'Taoyuan', NULL, NULL, NULL, 430700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430726, '石门县', 'Shimen', NULL, NULL, NULL, 430700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430781, '津市市', 'Jinshi', NULL, NULL, NULL, 430700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430800, '张家界市', 'Zhangjiajie', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430802, '永定区', 'Yongding', NULL, NULL, NULL, 430800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430811, '武陵源区', 'Wulingyuan', NULL, NULL, NULL, 430800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430821, '慈利县', 'Cili', NULL, NULL, NULL, 430800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430822, '桑植县', 'Sangzhi', NULL, NULL, NULL, 430800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430900, '益阳市', 'Yiyang', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430902, '资阳区', 'Ziyang', NULL, NULL, NULL, 430900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430903, '赫山区', 'Heshan', NULL, NULL, NULL, 430900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430921, '南县', 'Nanxian', NULL, NULL, NULL, 430900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430922, '桃江县', 'Taojiang', NULL, NULL, NULL, 430900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430923, '安化县', 'Anhua', NULL, NULL, NULL, 430900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (430981, '沅江市', 'Yuanjiang', NULL, NULL, NULL, 430900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431000, '郴州市', 'Chenzhou', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431002, '北湖区', 'Beihu', NULL, NULL, NULL, 431000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431003, '苏仙区', 'Suxian', NULL, NULL, NULL, 431000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431021, '桂阳县', 'Guiyang', NULL, NULL, NULL, 431000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431022, '宜章县', 'Yizhang', NULL, NULL, NULL, 431000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431023, '永兴县', 'Yongxing', NULL, NULL, NULL, 431000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431024, '嘉禾县', 'Jiahe', NULL, NULL, NULL, 431000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431025, '临武县', 'Linwu', NULL, NULL, NULL, 431000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431026, '汝城县', 'Rucheng', NULL, NULL, NULL, 431000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431027, '桂东县', 'Guidong', NULL, NULL, NULL, 431000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431028, '安仁县', 'Anren', NULL, NULL, NULL, 431000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431081, '资兴市', 'Zixing', NULL, NULL, NULL, 431000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431100, '永州市', 'Yongzhou', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431102, '零陵区', 'Lingling', NULL, NULL, NULL, 431100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431103, '冷水滩区', 'Lengshuitan', NULL, NULL, NULL, 431100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431121, '祁阳县', 'Qiyang', NULL, NULL, NULL, 431100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431122, '东安县', 'Dong\'an', NULL, NULL, NULL, 431100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431123, '双牌县', 'Shuangpai', NULL, NULL, NULL, 431100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431124, '道县', 'Daoxian', NULL, NULL, NULL, 431100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431125, '江永县', 'Jiangyong', NULL, NULL, NULL, 431100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431126, '宁远县', 'Ningyuan', NULL, NULL, NULL, 431100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431127, '蓝山县', 'Lanshan', NULL, NULL, NULL, 431100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431128, '新田县', 'Xintian', NULL, NULL, NULL, 431100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431129, '江华瑶族自治县', 'Jianghua', NULL, NULL, NULL, 431100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431200, '怀化市', 'Huaihua', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431202, '鹤城区', 'Hecheng', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431221, '中方县', 'Zhongfang', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431222, '沅陵县', 'Yuanling', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431223, '辰溪县', 'Chenxi', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431224, '溆浦县', 'Xupu', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431225, '会同县', 'Huitong', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431226, '麻阳苗族自治县', 'Mayang', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431227, '新晃侗族自治县', 'Xinhuang', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431228, '芷江侗族自治县', 'Zhijiang', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431229, '靖州苗族侗族自治县', 'Jingzhou', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431230, '通道侗族自治县', 'Tongdao', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431281, '洪江市', 'Hongjiang', NULL, NULL, NULL, 431200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431300, '娄底市', 'Loudi', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431302, '娄星区', 'Louxing', NULL, NULL, NULL, 431300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431321, '双峰县', 'Shuangfeng', NULL, NULL, NULL, 431300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431322, '新化县', 'Xinhua', NULL, NULL, NULL, 431300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431381, '冷水江市', 'Lengshuijiang', NULL, NULL, NULL, 431300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (431382, '涟源市', 'Lianyuan', NULL, NULL, NULL, 431300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (433100, '湘西土家族苗族自治州', 'Xiangxi', NULL, NULL, NULL, 430000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (433101, '吉首市', 'Jishou', NULL, NULL, NULL, 433100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (433122, '泸溪县', 'Luxi', NULL, NULL, NULL, 433100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (433123, '凤凰县', 'Fenghuang', NULL, NULL, NULL, 433100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (433124, '花垣县', 'Huayuan', NULL, NULL, NULL, 433100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (433125, '保靖县', 'Baojing', NULL, NULL, NULL, 433100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (433126, '古丈县', 'Guzhang', NULL, NULL, NULL, 433100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (433127, '永顺县', 'Yongshun', NULL, NULL, NULL, 433100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (433130, '龙山县', 'Longshan', NULL, NULL, NULL, 433100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440000, '广东省', 'Guangdong', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440100, '广州市', 'Guangzhou', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440103, '荔湾区', 'Liwan', NULL, NULL, NULL, 440100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440104, '越秀区', 'Yuexiu', NULL, NULL, NULL, 440100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440105, '海珠区', 'Haizhu', NULL, NULL, NULL, 440100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440106, '天河区', 'Tianhe', NULL, NULL, NULL, 440100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440111, '白云区', 'Baiyun', NULL, NULL, NULL, 440100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440112, '黄埔区', 'Huangpu', NULL, NULL, NULL, 440100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440113, '番禺区', 'Panyu', NULL, NULL, NULL, 440100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440114, '花都区', 'Huadu', NULL, NULL, NULL, 440100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440115, '南沙区', 'Nansha', NULL, NULL, NULL, 440100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440117, '从化区', 'Conghua', NULL, NULL, NULL, 440100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440118, '增城区', 'Zengcheng', NULL, NULL, NULL, 440100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440200, '韶关市', 'Shaoguan', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440203, '武江区', 'Wujiang', NULL, NULL, NULL, 440200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440204, '浈江区', 'Zhenjiang', NULL, NULL, NULL, 440200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440205, '曲江区', 'Qujiang', NULL, NULL, NULL, 440200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440222, '始兴县', 'Shixing', NULL, NULL, NULL, 440200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440224, '仁化县', 'Renhua', NULL, NULL, NULL, 440200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440229, '翁源县', 'Wengyuan', NULL, NULL, NULL, 440200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440232, '乳源瑶族自治县', 'Ruyuan', NULL, NULL, NULL, 440200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440233, '新丰县', 'Xinfeng', NULL, NULL, NULL, 440200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440281, '乐昌市', 'Lechang', NULL, NULL, NULL, 440200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440282, '南雄市', 'Nanxiong', NULL, NULL, NULL, 440200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440300, '深圳市', 'Shenzhen', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440303, '罗湖区', 'Luohu', NULL, NULL, NULL, 440300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440304, '福田区', 'Futian', NULL, NULL, NULL, 440300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440305, '南山区', 'Nanshan', NULL, NULL, NULL, 440300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440306, '宝安区', 'Bao\'an', NULL, NULL, NULL, 440300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440307, '龙岗区', 'Longgang', NULL, NULL, NULL, 440300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440308, '盐田区', 'Yantian', NULL, NULL, NULL, 440300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440309, '光明新区', 'Guangmingxinqu', NULL, NULL, NULL, 440300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440310, '坪山新区', 'Pingshanxinqu', NULL, NULL, NULL, 440300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440311, '大鹏新区', 'Dapengxinqu', NULL, NULL, NULL, 440300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440312, '龙华新区', 'Longhuaxinqu', NULL, NULL, NULL, 440300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440400, '珠海市', 'Zhuhai', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440402, '香洲区', 'Xiangzhou', NULL, NULL, NULL, 440400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440403, '斗门区', 'Doumen', NULL, NULL, NULL, 440400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440404, '金湾区', 'Jinwan', NULL, NULL, NULL, 440400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440500, '汕头市', 'Shantou', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440507, '龙湖区', 'Longhu', NULL, NULL, NULL, 440500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440511, '金平区', 'Jinping', NULL, NULL, NULL, 440500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440512, '濠江区', 'Haojiang', NULL, NULL, NULL, 440500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440513, '潮阳区', 'Chaoyang', NULL, NULL, NULL, 440500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440514, '潮南区', 'Chaonan', NULL, NULL, NULL, 440500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440515, '澄海区', 'Chenghai', NULL, NULL, NULL, 440500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440523, '南澳县', 'Nanao', NULL, NULL, NULL, 440500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440600, '佛山市', 'Foshan', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440604, '禅城区', 'Chancheng', NULL, NULL, NULL, 440600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440605, '南海区', 'Nanhai', NULL, NULL, NULL, 440600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440606, '顺德区', 'Shunde', NULL, NULL, NULL, 440600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440607, '三水区', 'Sanshui', NULL, NULL, NULL, 440600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440608, '高明区', 'Gaoming', NULL, NULL, NULL, 440600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440700, '江门市', 'Jiangmen', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440703, '蓬江区', 'Pengjiang', NULL, NULL, NULL, 440700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440704, '江海区', 'Jianghai', NULL, NULL, NULL, 440700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440705, '新会区', 'Xinhui', NULL, NULL, NULL, 440700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440781, '台山市', 'Taishan', NULL, NULL, NULL, 440700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440783, '开平市', 'Kaiping', NULL, NULL, NULL, 440700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440784, '鹤山市', 'Heshan', NULL, NULL, NULL, 440700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440785, '恩平市', 'Enping', NULL, NULL, NULL, 440700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440800, '湛江市', 'Zhanjiang', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440802, '赤坎区', 'Chikan', NULL, NULL, NULL, 440800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440803, '霞山区', 'Xiashan', NULL, NULL, NULL, 440800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440804, '坡头区', 'Potou', NULL, NULL, NULL, 440800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440811, '麻章区', 'Mazhang', NULL, NULL, NULL, 440800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440823, '遂溪县', 'Suixi', NULL, NULL, NULL, 440800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440825, '徐闻县', 'Xuwen', NULL, NULL, NULL, 440800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440881, '廉江市', 'Lianjiang', NULL, NULL, NULL, 440800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440882, '雷州市', 'Leizhou', NULL, NULL, NULL, 440800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440883, '吴川市', 'Wuchuan', NULL, NULL, NULL, 440800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440900, '茂名市', 'Maoming', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440902, '茂南区', 'Maonan', NULL, NULL, NULL, 440900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440904, '电白区', 'Dianbai', NULL, NULL, NULL, 440900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440981, '高州市', 'Gaozhou', NULL, NULL, NULL, 440900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440982, '化州市', 'Huazhou', NULL, NULL, NULL, 440900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (440983, '信宜市', 'Xinyi', NULL, NULL, NULL, 440900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441200, '肇庆市', 'Zhaoqing', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441202, '端州区', 'Duanzhou', NULL, NULL, NULL, 441200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441203, '鼎湖区', 'Dinghu', NULL, NULL, NULL, 441200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441223, '广宁县', 'Guangning', NULL, NULL, NULL, 441200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441224, '怀集县', 'Huaiji', NULL, NULL, NULL, 441200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441225, '封开县', 'Fengkai', NULL, NULL, NULL, 441200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441226, '德庆县', 'Deqing', NULL, NULL, NULL, 441200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441283, '高要市', 'Gaoyao', NULL, NULL, NULL, 441200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441284, '四会市', 'Sihui', NULL, NULL, NULL, 441200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441300, '惠州市', 'Huizhou', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441302, '惠城区', 'Huicheng', NULL, NULL, NULL, 441300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441303, '惠阳区', 'Huiyang', NULL, NULL, NULL, 441300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441322, '博罗县', 'Boluo', NULL, NULL, NULL, 441300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441323, '惠东县', 'Huidong', NULL, NULL, NULL, 441300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441324, '龙门县', 'Longmen', NULL, NULL, NULL, 441300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441400, '梅州市', 'Meizhou', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441402, '梅江区', 'Meijiang', NULL, NULL, NULL, 441400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441403, '梅县区', 'Meixian', NULL, NULL, NULL, 441400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441422, '大埔县', 'Dabu', NULL, NULL, NULL, 441400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441423, '丰顺县', 'Fengshun', NULL, NULL, NULL, 441400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441424, '五华县', 'Wuhua', NULL, NULL, NULL, 441400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441426, '平远县', 'Pingyuan', NULL, NULL, NULL, 441400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441427, '蕉岭县', 'Jiaoling', NULL, NULL, NULL, 441400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441481, '兴宁市', 'Xingning', NULL, NULL, NULL, 441400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441500, '汕尾市', 'Shanwei', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441502, '城区', 'Chengqu', NULL, NULL, NULL, 441500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441521, '海丰县', 'Haifeng', NULL, NULL, NULL, 441500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441523, '陆河县', 'Luhe', NULL, NULL, NULL, 441500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441581, '陆丰市', 'Lufeng', NULL, NULL, NULL, 441500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441600, '河源市', 'Heyuan', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441602, '源城区', 'Yuancheng', NULL, NULL, NULL, 441600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441621, '紫金县', 'Zijin', NULL, NULL, NULL, 441600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441622, '龙川县', 'Longchuan', NULL, NULL, NULL, 441600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441623, '连平县', 'Lianping', NULL, NULL, NULL, 441600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441624, '和平县', 'Heping', NULL, NULL, NULL, 441600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441625, '东源县', 'Dongyuan', NULL, NULL, NULL, 441600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441700, '阳江市', 'Yangjiang', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441702, '江城区', 'Jiangcheng', NULL, NULL, NULL, 441700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441704, '阳东区', 'Yangdong', NULL, NULL, NULL, 441700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441721, '阳西县', 'Yangxi', NULL, NULL, NULL, 441700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441781, '阳春市', 'Yangchun', NULL, NULL, NULL, 441700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441800, '清远市', 'Qingyuan', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441802, '清城区', 'Qingcheng', NULL, NULL, NULL, 441800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441803, '清新区', 'Qingxin', NULL, NULL, NULL, 441800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441821, '佛冈县', 'Fogang', NULL, NULL, NULL, 441800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441823, '阳山县', 'Yangshan', NULL, NULL, NULL, 441800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441825, '连山壮族瑶族自治县', 'Lianshan', NULL, NULL, NULL, 441800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441826, '连南瑶族自治县', 'Liannan', NULL, NULL, NULL, 441800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441881, '英德市', 'Yingde', NULL, NULL, NULL, 441800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441882, '连州市', 'Lianzhou', NULL, NULL, NULL, 441800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441900, '东莞市', 'Dongguan', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441901, '莞城区', 'Guancheng', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441902, '南城区', 'Nancheng', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441904, '万江区', 'Wanjiang', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441905, '石碣镇', 'Shijie', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441906, '石龙镇', 'Shilong', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441907, '茶山镇', 'Chashan', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441908, '石排镇', 'Shipai', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441909, '企石镇', 'Qishi', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441910, '横沥镇', 'Hengli', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441911, '桥头镇', 'Qiaotou', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441912, '谢岗镇', 'Xiegang', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441913, '东坑镇', 'Dongkeng', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441914, '常平镇', 'Changping', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441915, '寮步镇', 'Liaobu', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441916, '大朗镇', 'Dalang', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441917, '麻涌镇', 'Machong', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441918, '中堂镇', 'Zhongtang', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441919, '高埗镇', 'Gaobu', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441920, '樟木头镇', 'Zhangmutou', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441921, '大岭山镇', 'Dalingshan', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441922, '望牛墩镇', 'Wangniudun', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441923, '黄江镇', 'Huangjiang', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441924, '洪梅镇', 'Hongmei', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441925, '清溪镇', 'Qingxi', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441926, '沙田镇', 'Shatian', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441927, '道滘镇', 'Daojiao', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441928, '塘厦镇', 'Tangxia', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441929, '虎门镇', 'Humen', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441930, '厚街镇', 'Houjie', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441931, '凤岗镇', 'Fenggang', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (441932, '长安镇', 'Chang\'an', NULL, NULL, NULL, 441900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442000, '中山市', 'Zhongshan', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442001, '石岐区', 'Shiqi', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442004, '南区', 'Nanqu', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442005, '五桂山区', 'Wuguishan', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442006, '火炬开发区', 'Huoju', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442007, '黄圃镇', 'Huangpu', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442008, '南头镇', 'Nantou', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442009, '东凤镇', 'Dongfeng', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442010, '阜沙镇', 'Fusha', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442011, '小榄镇', 'Xiaolan', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442012, '东升镇', 'Dongsheng', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442013, '古镇镇', 'Guzhen', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442014, '横栏镇', 'Henglan', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442015, '三角镇', 'Sanjiao', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442016, '民众镇', 'Minzhong', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442017, '南朗镇', 'Nanlang', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442018, '港口镇', 'Gangkou', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442019, '大涌镇', 'Dayong', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442020, '沙溪镇', 'Shaxi', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442021, '三乡镇', 'Sanxiang', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442022, '板芙镇', 'Banfu', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442023, '神湾镇', 'Shenwan', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (442024, '坦洲镇', 'Tanzhou', NULL, NULL, NULL, 442000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445100, '潮州市', 'Chaozhou', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445102, '湘桥区', 'Xiangqiao', NULL, NULL, NULL, 445100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445103, '潮安区', 'Chao\'an', NULL, NULL, NULL, 445100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445122, '饶平县', 'Raoping', NULL, NULL, NULL, 445100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445200, '揭阳市', 'Jieyang', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445202, '榕城区', 'Rongcheng', NULL, NULL, NULL, 445200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445203, '揭东区', 'Jiedong', NULL, NULL, NULL, 445200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445222, '揭西县', 'Jiexi', NULL, NULL, NULL, 445200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445224, '惠来县', 'Huilai', NULL, NULL, NULL, 445200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445281, '普宁市', 'Puning', NULL, NULL, NULL, 445200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445300, '云浮市', 'Yunfu', NULL, NULL, NULL, 440000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445302, '云城区', 'Yuncheng', NULL, NULL, NULL, 445300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445303, '云安区', 'Yun\'an', NULL, NULL, NULL, 445300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445321, '新兴县', 'Xinxing', NULL, NULL, NULL, 445300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445322, '郁南县', 'Yunan', NULL, NULL, NULL, 445300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (445381, '罗定市', 'Luoding', NULL, NULL, NULL, 445300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450000, '广西壮族自治区', 'Guangxi', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450100, '南宁市', 'Nanning', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450102, '兴宁区', 'Xingning', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450103, '青秀区', 'Qingxiu', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450105, '江南区', 'Jiangnan', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450107, '西乡塘区', 'Xixiangtang', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450108, '良庆区', 'Liangqing', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450109, '邕宁区', 'Yongning', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450122, '武鸣县', 'Wuming', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450123, '隆安县', 'Long\'an', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450124, '马山县', 'Mashan', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450125, '上林县', 'Shanglin', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450126, '宾阳县', 'Binyang', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450127, '横县', 'Hengxian', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450128, '埌东新区', 'Langdong', NULL, NULL, NULL, 450100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450200, '柳州市', 'Liuzhou', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450202, '城中区', 'Chengzhong', NULL, NULL, NULL, 450200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450203, '鱼峰区', 'Yufeng', NULL, NULL, NULL, 450200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450204, '柳南区', 'Liunan', NULL, NULL, NULL, 450200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450205, '柳北区', 'Liubei', NULL, NULL, NULL, 450200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450221, '柳江县', 'Liujiang', NULL, NULL, NULL, 450200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450222, '柳城县', 'Liucheng', NULL, NULL, NULL, 450200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450223, '鹿寨县', 'Luzhai', NULL, NULL, NULL, 450200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450224, '融安县', 'Rong\'an', NULL, NULL, NULL, 450200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450225, '融水苗族自治县', 'Rongshui', NULL, NULL, NULL, 450200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450226, '三江侗族自治县', 'Sanjiang', NULL, NULL, NULL, 450200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450227, '柳东新区', 'Liudong', NULL, NULL, NULL, 450200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450300, '桂林市', 'Guilin', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450302, '秀峰区', 'Xiufeng', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450303, '叠彩区', 'Diecai', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450304, '象山区', 'Xiangshan', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450305, '七星区', 'Qixing', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450311, '雁山区', 'Yanshan', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450312, '临桂区', 'Lingui', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450321, '阳朔县', 'Yangshuo', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450323, '灵川县', 'Lingchuan', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450324, '全州县', 'Quanzhou', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450325, '兴安县', 'Xing\'an', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450326, '永福县', 'Yongfu', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450327, '灌阳县', 'Guanyang', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450328, '龙胜各族自治县', 'Longsheng', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450329, '资源县', 'Ziyuan', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450330, '平乐县', 'Pingle', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450331, '荔浦县', 'Lipu', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450332, '恭城瑶族自治县', 'Gongcheng', NULL, NULL, NULL, 450300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450400, '梧州市', 'Wuzhou', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450403, '万秀区', 'Wanxiu', NULL, NULL, NULL, 450400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450405, '长洲区', 'Changzhou', NULL, NULL, NULL, 450400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450406, '龙圩区', 'Longxu', NULL, NULL, NULL, 450400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450421, '苍梧县', 'Cangwu', NULL, NULL, NULL, 450400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450422, '藤县', 'Tengxian', NULL, NULL, NULL, 450400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450423, '蒙山县', 'Mengshan', NULL, NULL, NULL, 450400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450481, '岑溪市', 'Cenxi', NULL, NULL, NULL, 450400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450500, '北海市', 'Beihai', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450502, '海城区', 'Haicheng', NULL, NULL, NULL, 450500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450503, '银海区', 'Yinhai', NULL, NULL, NULL, 450500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450512, '铁山港区', 'Tieshangang', NULL, NULL, NULL, 450500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450521, '合浦县', 'Hepu', NULL, NULL, NULL, 450500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450600, '防城港市', 'Fangchenggang', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450602, '港口区', 'Gangkou', NULL, NULL, NULL, 450600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450603, '防城区', 'Fangcheng', NULL, NULL, NULL, 450600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450621, '上思县', 'Shangsi', NULL, NULL, NULL, 450600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450681, '东兴市', 'Dongxing', NULL, NULL, NULL, 450600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450700, '钦州市', 'Qinzhou', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450702, '钦南区', 'Qinnan', NULL, NULL, NULL, 450700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450703, '钦北区', 'Qinbei', NULL, NULL, NULL, 450700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450721, '灵山县', 'Lingshan', NULL, NULL, NULL, 450700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450722, '浦北县', 'Pubei', NULL, NULL, NULL, 450700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450800, '贵港市', 'Guigang', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450802, '港北区', 'Gangbei', NULL, NULL, NULL, 450800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450803, '港南区', 'Gangnan', NULL, NULL, NULL, 450800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450804, '覃塘区', 'Qintang', NULL, NULL, NULL, 450800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450821, '平南县', 'Pingnan', NULL, NULL, NULL, 450800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450881, '桂平市', 'Guiping', NULL, NULL, NULL, 450800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450900, '玉林市', 'Yulin', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450902, '玉州区', 'Yuzhou', NULL, NULL, NULL, 450900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450903, '福绵区', 'Fumian', NULL, NULL, NULL, 450900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450904, '玉东新区', 'Yudong', NULL, NULL, NULL, 450900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450921, '容县', 'Rongxian', NULL, NULL, NULL, 450900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450922, '陆川县', 'Luchuan', NULL, NULL, NULL, 450900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450923, '博白县', 'Bobai', NULL, NULL, NULL, 450900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450924, '兴业县', 'Xingye', NULL, NULL, NULL, 450900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (450981, '北流市', 'Beiliu', NULL, NULL, NULL, 450900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451000, '百色市', 'Baise', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451002, '右江区', 'Youjiang', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451021, '田阳县', 'Tianyang', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451022, '田东县', 'Tiandong', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451023, '平果县', 'Pingguo', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451024, '德保县', 'Debao', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451025, '靖西县', 'Jingxi', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451026, '那坡县', 'Napo', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451027, '凌云县', 'Lingyun', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451028, '乐业县', 'Leye', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451029, '田林县', 'Tianlin', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451030, '西林县', 'Xilin', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451031, '隆林各族自治县', 'Longlin', NULL, NULL, NULL, 451000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451100, '贺州市', 'Hezhou', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451102, '八步区', 'Babu', NULL, NULL, NULL, 451100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451121, '昭平县', 'Zhaoping', NULL, NULL, NULL, 451100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451122, '钟山县', 'Zhongshan', NULL, NULL, NULL, 451100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451123, '富川瑶族自治县', 'Fuchuan', NULL, NULL, NULL, 451100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451124, '平桂管理区', 'Pingui', NULL, NULL, NULL, 451100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451200, '河池市', 'Hechi', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451202, '金城江区', 'Jinchengjiang', NULL, NULL, NULL, 451200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451221, '南丹县', 'Nandan', NULL, NULL, NULL, 451200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451222, '天峨县', 'Tiane', NULL, NULL, NULL, 451200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451223, '凤山县', 'Fengshan', NULL, NULL, NULL, 451200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451224, '东兰县', 'Donglan', NULL, NULL, NULL, 451200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451225, '罗城仫佬族自治县', 'Luocheng', NULL, NULL, NULL, 451200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451226, '环江毛南族自治县', 'Huanjiang', NULL, NULL, NULL, 451200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451227, '巴马瑶族自治县', 'Bama', NULL, NULL, NULL, 451200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451228, '都安瑶族自治县', 'Du\'an', NULL, NULL, NULL, 451200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451229, '大化瑶族自治县', 'Dahua', NULL, NULL, NULL, 451200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451281, '宜州市', 'Yizhou', NULL, NULL, NULL, 451200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451300, '来宾市', 'Laibin', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451302, '兴宾区', 'Xingbin', NULL, NULL, NULL, 451300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451321, '忻城县', 'Xincheng', NULL, NULL, NULL, 451300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451322, '象州县', 'Xiangzhou', NULL, NULL, NULL, 451300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451323, '武宣县', 'Wuxuan', NULL, NULL, NULL, 451300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451324, '金秀瑶族自治县', 'Jinxiu', NULL, NULL, NULL, 451300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451381, '合山市', 'Heshan', NULL, NULL, NULL, 451300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451400, '崇左市', 'Chongzuo', NULL, NULL, NULL, 450000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451402, '江州区', 'Jiangzhou', NULL, NULL, NULL, 451400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451421, '扶绥县', 'Fusui', NULL, NULL, NULL, 451400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451422, '宁明县', 'Ningming', NULL, NULL, NULL, 451400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451423, '龙州县', 'Longzhou', NULL, NULL, NULL, 451400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451424, '大新县', 'Daxin', NULL, NULL, NULL, 451400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451425, '天等县', 'Tiandeng', NULL, NULL, NULL, 451400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (451481, '凭祥市', 'Pingxiang', NULL, NULL, NULL, 451400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460000, '海南省', 'Hainan', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460100, '海口市', 'Haikou', NULL, NULL, NULL, 460000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460105, '秀英区', 'Xiuying', NULL, NULL, NULL, 460100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460106, '龙华区', 'Longhua', NULL, NULL, NULL, 460100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460107, '琼山区', 'Qiongshan', NULL, NULL, NULL, 460100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460108, '美兰区', 'Meilan', NULL, NULL, NULL, 460100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460200, '三亚市', 'Sanya', NULL, NULL, NULL, 460000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460202, '海棠区', 'Haitang', NULL, NULL, NULL, 460200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460203, '吉阳区', 'Jiyang', NULL, NULL, NULL, 460200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460204, '天涯区', 'Tianya', NULL, NULL, NULL, 460200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460205, '崖州区', 'Yazhou', NULL, NULL, NULL, 460200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460300, '三沙市', 'Sansha', NULL, NULL, NULL, 460000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460321, '西沙群岛', 'Xisha Islands', NULL, NULL, NULL, 460300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460322, '南沙群岛', 'Nansha Islands', NULL, NULL, NULL, 460300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (460323, '中沙群岛', 'Zhongsha Islands', NULL, NULL, NULL, 460300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469000, '直辖县级', '', NULL, NULL, NULL, 460000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469001, '五指山市', 'Wuzhishan', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469002, '琼海市', 'Qionghai', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469003, '儋州市', 'Danzhou', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469005, '文昌市', 'Wenchang', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469006, '万宁市', 'Wanning', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469007, '东方市', 'Dongfang', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469021, '定安县', 'Ding\'an', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469022, '屯昌县', 'Tunchang', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469023, '澄迈县', 'Chengmai', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469024, '临高县', 'Lingao', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469025, '白沙黎族自治县', 'Baisha', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469026, '昌江黎族自治县', 'Changjiang', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469027, '乐东黎族自治县', 'Ledong', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469028, '陵水黎族自治县', 'Lingshui', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469029, '保亭黎族苗族自治县', 'Baoting', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (469030, '琼中黎族苗族自治县', 'Qiongzhong', NULL, NULL, NULL, 469000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500000, '重庆', 'Chongqing', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500100, '重庆市', 'Chongqing', NULL, NULL, NULL, 500000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500101, '万州区', 'Wanzhou', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500102, '涪陵区', 'Fuling', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500103, '渝中区', 'Yuzhong', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500104, '大渡口区', 'Dadukou', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500105, '江北区', 'Jiangbei', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500106, '沙坪坝区', 'Shapingba', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500107, '九龙坡区', 'Jiulongpo', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500108, '南岸区', 'Nan\'an', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500109, '北碚区', 'Beibei', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500110, '綦江区', 'Qijiang', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500111, '大足区', 'Dazu', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500112, '渝北区', 'Yubei', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500113, '巴南区', 'Banan', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500114, '黔江区', 'Qianjiang', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500115, '长寿区', 'Changshou', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500116, '江津区', 'Jiangjin', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500117, '合川区', 'Hechuan', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500118, '永川区', 'Yongchuan', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500119, '南川区', 'Nanchuan', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500120, '璧山区', 'Bishan', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500151, '铜梁区', 'Tongliang', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500223, '潼南县', 'Tongnan', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500226, '荣昌县', 'Rongchang', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500228, '梁平县', 'Liangping', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500229, '城口县', 'Chengkou', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500230, '丰都县', 'Fengdu', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500231, '垫江县', 'Dianjiang', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500232, '武隆县', 'Wulong', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500233, '忠县', 'Zhongxian', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500234, '开县', 'Kaixian', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500235, '云阳县', 'Yunyang', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500236, '奉节县', 'Fengjie', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500237, '巫山县', 'Wushan', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500238, '巫溪县', 'Wuxi', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500240, '石柱土家族自治县', 'Shizhu', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500241, '秀山土家族苗族自治县', 'Xiushan', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500242, '酉阳土家族苗族自治县', 'Youyang', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500243, '彭水苗族土家族自治县', 'Pengshui', NULL, NULL, NULL, 500100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500300, '两江新区', 'Liangjiangxinqu', NULL, NULL, NULL, 500000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500301, '北部新区', 'Beibuxinqu', NULL, NULL, NULL, 500300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500302, '保税港区', 'Baoshuigangqu', NULL, NULL, NULL, 500300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (500303, '工业园区', 'Gongyeyuanqu', NULL, NULL, NULL, 500300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510000, '四川省', 'Sichuan', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510100, '成都市', 'Chengdu', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510104, '锦江区', 'Jinjiang', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510105, '青羊区', 'Qingyang', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510106, '金牛区', 'Jinniu', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510107, '武侯区', 'Wuhou', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510108, '成华区', 'Chenghua', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510112, '龙泉驿区', 'Longquanyi', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510113, '青白江区', 'Qingbaijiang', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510114, '新都区', 'Xindu', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510115, '温江区', 'Wenjiang', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510121, '金堂县', 'Jintang', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510122, '双流县', 'Shuangliu', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510124, '郫县', 'Pixian', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510129, '大邑县', 'Dayi', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510131, '蒲江县', 'Pujiang', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510132, '新津县', 'Xinjin', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510181, '都江堰市', 'Dujiangyan', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510182, '彭州市', 'Pengzhou', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510183, '邛崃市', 'Qionglai', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510184, '崇州市', 'Chongzhou', NULL, NULL, NULL, 510100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510300, '自贡市', 'Zigong', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510302, '自流井区', 'Ziliujing', NULL, NULL, NULL, 510300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510303, '贡井区', 'Gongjing', NULL, NULL, NULL, 510300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510304, '大安区', 'Da\'an', NULL, NULL, NULL, 510300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510311, '沿滩区', 'Yantan', NULL, NULL, NULL, 510300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510321, '荣县', 'Rongxian', NULL, NULL, NULL, 510300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510322, '富顺县', 'Fushun', NULL, NULL, NULL, 510300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510400, '攀枝花市', 'Panzhihua', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510402, '东区', 'Dongqu', NULL, NULL, NULL, 510400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510403, '西区', 'Xiqu', NULL, NULL, NULL, 510400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510411, '仁和区', 'Renhe', NULL, NULL, NULL, 510400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510421, '米易县', 'Miyi', NULL, NULL, NULL, 510400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510422, '盐边县', 'Yanbian', NULL, NULL, NULL, 510400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510500, '泸州市', 'Luzhou', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510502, '江阳区', 'Jiangyang', NULL, NULL, NULL, 510500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510503, '纳溪区', 'Naxi', NULL, NULL, NULL, 510500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510504, '龙马潭区', 'Longmatan', NULL, NULL, NULL, 510500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510521, '泸县', 'Luxian', NULL, NULL, NULL, 510500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510522, '合江县', 'Hejiang', NULL, NULL, NULL, 510500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510524, '叙永县', 'Xuyong', NULL, NULL, NULL, 510500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510525, '古蔺县', 'Gulin', NULL, NULL, NULL, 510500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510600, '德阳市', 'Deyang', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510603, '旌阳区', 'Jingyang', NULL, NULL, NULL, 510600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510623, '中江县', 'Zhongjiang', NULL, NULL, NULL, 510600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510626, '罗江县', 'Luojiang', NULL, NULL, NULL, 510600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510681, '广汉市', 'Guanghan', NULL, NULL, NULL, 510600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510682, '什邡市', 'Shifang', NULL, NULL, NULL, 510600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510683, '绵竹市', 'Mianzhu', NULL, NULL, NULL, 510600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510700, '绵阳市', 'Mianyang', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510703, '涪城区', 'Fucheng', NULL, NULL, NULL, 510700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510704, '游仙区', 'Youxian', NULL, NULL, NULL, 510700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510722, '三台县', 'Santai', NULL, NULL, NULL, 510700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510723, '盐亭县', 'Yanting', NULL, NULL, NULL, 510700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510724, '安县', 'Anxian', NULL, NULL, NULL, 510700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510725, '梓潼县', 'Zitong', NULL, NULL, NULL, 510700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510726, '北川羌族自治县', 'Beichuan', NULL, NULL, NULL, 510700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510727, '平武县', 'Pingwu', NULL, NULL, NULL, 510700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510781, '江油市', 'Jiangyou', NULL, NULL, NULL, 510700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510800, '广元市', 'Guangyuan', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510802, '利州区', 'Lizhou', NULL, NULL, NULL, 510800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510811, '昭化区', 'Zhaohua', NULL, NULL, NULL, 510800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510812, '朝天区', 'Chaotian', NULL, NULL, NULL, 510800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510821, '旺苍县', 'Wangcang', NULL, NULL, NULL, 510800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510822, '青川县', 'Qingchuan', NULL, NULL, NULL, 510800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510823, '剑阁县', 'Jiange', NULL, NULL, NULL, 510800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510824, '苍溪县', 'Cangxi', NULL, NULL, NULL, 510800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510900, '遂宁市', 'Suining', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510903, '船山区', 'Chuanshan', NULL, NULL, NULL, 510900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510904, '安居区', 'Anju', NULL, NULL, NULL, 510900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510921, '蓬溪县', 'Pengxi', NULL, NULL, NULL, 510900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510922, '射洪县', 'Shehong', NULL, NULL, NULL, 510900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (510923, '大英县', 'Daying', NULL, NULL, NULL, 510900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511000, '内江市', 'Neijiang', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511002, '市中区', 'Shizhongqu', NULL, NULL, NULL, 511000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511011, '东兴区', 'Dongxing', NULL, NULL, NULL, 511000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511024, '威远县', 'Weiyuan', NULL, NULL, NULL, 511000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511025, '资中县', 'Zizhong', NULL, NULL, NULL, 511000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511028, '隆昌县', 'Longchang', NULL, NULL, NULL, 511000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511100, '乐山市', 'Leshan', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511102, '市中区', 'Shizhongqu', NULL, NULL, NULL, 511100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511111, '沙湾区', 'Shawan', NULL, NULL, NULL, 511100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511112, '五通桥区', 'Wutongqiao', NULL, NULL, NULL, 511100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511113, '金口河区', 'Jinkouhe', NULL, NULL, NULL, 511100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511123, '犍为县', 'Qianwei', NULL, NULL, NULL, 511100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511124, '井研县', 'Jingyan', NULL, NULL, NULL, 511100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511126, '夹江县', 'Jiajiang', NULL, NULL, NULL, 511100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511129, '沐川县', 'Muchuan', NULL, NULL, NULL, 511100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511132, '峨边彝族自治县', 'Ebian', NULL, NULL, NULL, 511100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511133, '马边彝族自治县', 'Mabian', NULL, NULL, NULL, 511100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511181, '峨眉山市', 'Emeishan', NULL, NULL, NULL, 511100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511300, '南充市', 'Nanchong', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511302, '顺庆区', 'Shunqing', NULL, NULL, NULL, 511300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511303, '高坪区', 'Gaoping', NULL, NULL, NULL, 511300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511304, '嘉陵区', 'Jialing', NULL, NULL, NULL, 511300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511321, '南部县', 'Nanbu', NULL, NULL, NULL, 511300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511322, '营山县', 'Yingshan', NULL, NULL, NULL, 511300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511323, '蓬安县', 'Peng\'an', NULL, NULL, NULL, 511300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511324, '仪陇县', 'Yilong', NULL, NULL, NULL, 511300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511325, '西充县', 'Xichong', NULL, NULL, NULL, 511300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511381, '阆中市', 'Langzhong', NULL, NULL, NULL, 511300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511400, '眉山市', 'Meishan', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511402, '东坡区', 'Dongpo', NULL, NULL, NULL, 511400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511403, '彭山区', 'Pengshan', NULL, NULL, NULL, 511400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511421, '仁寿县', 'Renshou', NULL, NULL, NULL, 511400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511423, '洪雅县', 'Hongya', NULL, NULL, NULL, 511400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511424, '丹棱县', 'Danling', NULL, NULL, NULL, 511400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511425, '青神县', 'Qingshen', NULL, NULL, NULL, 511400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511500, '宜宾市', 'Yibin', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511502, '翠屏区', 'Cuiping', NULL, NULL, NULL, 511500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511503, '南溪区', 'Nanxi', NULL, NULL, NULL, 511500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511521, '宜宾县', 'Yibin', NULL, NULL, NULL, 511500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511523, '江安县', 'Jiang\'an', NULL, NULL, NULL, 511500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511524, '长宁县', 'Changning', NULL, NULL, NULL, 511500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511525, '高县', 'Gaoxian', NULL, NULL, NULL, 511500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511526, '珙县', 'Gongxian', NULL, NULL, NULL, 511500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511527, '筠连县', 'Junlian', NULL, NULL, NULL, 511500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511528, '兴文县', 'Xingwen', NULL, NULL, NULL, 511500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511529, '屏山县', 'Pingshan', NULL, NULL, NULL, 511500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511600, '广安市', 'Guang\'an', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511602, '广安区', 'Guang\'an', NULL, NULL, NULL, 511600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511603, '前锋区', 'Qianfeng', NULL, NULL, NULL, 511600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511621, '岳池县', 'Yuechi', NULL, NULL, NULL, 511600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511622, '武胜县', 'Wusheng', NULL, NULL, NULL, 511600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511623, '邻水县', 'Linshui', NULL, NULL, NULL, 511600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511681, '华蓥市', 'Huaying', NULL, NULL, NULL, 511600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511700, '达州市', 'Dazhou', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511702, '通川区', 'Tongchuan', NULL, NULL, NULL, 511700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511703, '达川区', 'Dachuan', NULL, NULL, NULL, 511700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511722, '宣汉县', 'Xuanhan', NULL, NULL, NULL, 511700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511723, '开江县', 'Kaijiang', NULL, NULL, NULL, 511700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511724, '大竹县', 'Dazhu', NULL, NULL, NULL, 511700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511725, '渠县', 'Quxian', NULL, NULL, NULL, 511700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511781, '万源市', 'Wanyuan', NULL, NULL, NULL, 511700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511800, '雅安市', 'Ya\'an', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511802, '雨城区', 'Yucheng', NULL, NULL, NULL, 511800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511803, '名山区', 'Mingshan', NULL, NULL, NULL, 511800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511822, '荥经县', 'Yingjing', NULL, NULL, NULL, 511800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511823, '汉源县', 'Hanyuan', NULL, NULL, NULL, 511800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511824, '石棉县', 'Shimian', NULL, NULL, NULL, 511800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511825, '天全县', 'Tianquan', NULL, NULL, NULL, 511800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511826, '芦山县', 'Lushan', NULL, NULL, NULL, 511800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511827, '宝兴县', 'Baoxing', NULL, NULL, NULL, 511800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511900, '巴中市', 'Bazhong', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511902, '巴州区', 'Bazhou', NULL, NULL, NULL, 511900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511903, '恩阳区', 'Enyang', NULL, NULL, NULL, 511900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511921, '通江县', 'Tongjiang', NULL, NULL, NULL, 511900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511922, '南江县', 'Nanjiang', NULL, NULL, NULL, 511900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (511923, '平昌县', 'Pingchang', NULL, NULL, NULL, 511900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (512000, '资阳市', 'Ziyang', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (512002, '雁江区', 'Yanjiang', NULL, NULL, NULL, 512000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (512021, '安岳县', 'Anyue', NULL, NULL, NULL, 512000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (512022, '乐至县', 'Lezhi', NULL, NULL, NULL, 512000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (512081, '简阳市', 'Jianyang', NULL, NULL, NULL, 512000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513200, '阿坝藏族羌族自治州', 'Aba', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513221, '汶川县', 'Wenchuan', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513222, '理县', 'Lixian', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513223, '茂县', 'Maoxian', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513224, '松潘县', 'Songpan', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513225, '九寨沟县', 'Jiuzhaigou', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513226, '金川县', 'Jinchuan', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513227, '小金县', 'Xiaojin', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513228, '黑水县', 'Heishui', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513229, '马尔康县', 'Maerkang', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513230, '壤塘县', 'Rangtang', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513231, '阿坝县', 'Aba', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513232, '若尔盖县', 'Ruoergai', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513233, '红原县', 'Hongyuan', NULL, NULL, NULL, 513200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513300, '甘孜藏族自治州', 'Garze', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513321, '康定县', 'Kangding', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513322, '泸定县', 'Luding', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513323, '丹巴县', 'Danba', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513324, '九龙县', 'Jiulong', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513325, '雅江县', 'Yajiang', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513326, '道孚县', 'Daofu', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513327, '炉霍县', 'Luhuo', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513328, '甘孜县', 'Ganzi', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513329, '新龙县', 'Xinlong', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513330, '德格县', 'Dege', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513331, '白玉县', 'Baiyu', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513332, '石渠县', 'Shiqu', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513333, '色达县', 'Seda', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513334, '理塘县', 'Litang', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513335, '巴塘县', 'Batang', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513336, '乡城县', 'Xiangcheng', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513337, '稻城县', 'Daocheng', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513338, '得荣县', 'Derong', NULL, NULL, NULL, 513300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513400, '凉山彝族自治州', 'Liangshan', NULL, NULL, NULL, 510000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513401, '西昌市', 'Xichang', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513422, '木里藏族自治县', 'Muli', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513423, '盐源县', 'Yanyuan', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513424, '德昌县', 'Dechang', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513425, '会理县', 'Huili', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513426, '会东县', 'Huidong', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513427, '宁南县', 'Ningnan', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513428, '普格县', 'Puge', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513429, '布拖县', 'Butuo', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513430, '金阳县', 'Jinyang', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513431, '昭觉县', 'Zhaojue', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513432, '喜德县', 'Xide', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513433, '冕宁县', 'Mianning', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513434, '越西县', 'Yuexi', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513435, '甘洛县', 'Ganluo', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513436, '美姑县', 'Meigu', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (513437, '雷波县', 'Leibo', NULL, NULL, NULL, 513400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520000, '贵州省', 'Guizhou', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520100, '贵阳市', 'Guiyang', NULL, NULL, NULL, 520000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520102, '南明区', 'Nanming', NULL, NULL, NULL, 520100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520103, '云岩区', 'Yunyan', NULL, NULL, NULL, 520100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520111, '花溪区', 'Huaxi', NULL, NULL, NULL, 520100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520112, '乌当区', 'Wudang', NULL, NULL, NULL, 520100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520113, '白云区', 'Baiyun', NULL, NULL, NULL, 520100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520115, '观山湖区', 'Guanshanhu', NULL, NULL, NULL, 520100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520121, '开阳县', 'Kaiyang', NULL, NULL, NULL, 520100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520122, '息烽县', 'Xifeng', NULL, NULL, NULL, 520100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520123, '修文县', 'Xiuwen', NULL, NULL, NULL, 520100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520181, '清镇市', 'Qingzhen', NULL, NULL, NULL, 520100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520200, '六盘水市', 'Liupanshui', NULL, NULL, NULL, 520000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520201, '钟山区', 'Zhongshan', NULL, NULL, NULL, 520200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520203, '六枝特区', 'Liuzhi', NULL, NULL, NULL, 520200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520221, '水城县', 'Shuicheng', NULL, NULL, NULL, 520200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520222, '盘县', 'Panxian', NULL, NULL, NULL, 520200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520300, '遵义市', 'Zunyi', NULL, NULL, NULL, 520000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520302, '红花岗区', 'Honghuagang', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520303, '汇川区', 'Huichuan', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520321, '遵义县', 'Zunyi', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520322, '桐梓县', 'Tongzi', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520323, '绥阳县', 'Suiyang', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520324, '正安县', 'Zheng\'an', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520325, '道真仡佬族苗族自治县', 'Daozhen', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520326, '务川仡佬族苗族自治县', 'Wuchuan', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520327, '凤冈县', 'Fenggang', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520328, '湄潭县', 'Meitan', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520329, '余庆县', 'Yuqing', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520330, '习水县', 'Xishui', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520381, '赤水市', 'Chishui', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520382, '仁怀市', 'Renhuai', NULL, NULL, NULL, 520300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520400, '安顺市', 'Anshun', NULL, NULL, NULL, 520000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520402, '西秀区', 'Xixiu', NULL, NULL, NULL, 520400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520421, '平坝区', 'Pingba', NULL, NULL, NULL, 520400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520422, '普定县', 'Puding', NULL, NULL, NULL, 520400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520423, '镇宁布依族苗族自治县', 'Zhenning', NULL, NULL, NULL, 520400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520424, '关岭布依族苗族自治县', 'Guanling', NULL, NULL, NULL, 520400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520425, '紫云苗族布依族自治县', 'Ziyun', NULL, NULL, NULL, 520400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520500, '毕节市', 'Bijie', NULL, NULL, NULL, 520000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520502, '七星关区', 'Qixingguan', NULL, NULL, NULL, 520500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520521, '大方县', 'Dafang', NULL, NULL, NULL, 520500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520522, '黔西县', 'Qianxi', NULL, NULL, NULL, 520500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520523, '金沙县', 'Jinsha', NULL, NULL, NULL, 520500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520524, '织金县', 'Zhijin', NULL, NULL, NULL, 520500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520525, '纳雍县', 'Nayong', NULL, NULL, NULL, 520500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520526, '威宁彝族回族苗族自治县', 'Weining', NULL, NULL, NULL, 520500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520527, '赫章县', 'Hezhang', NULL, NULL, NULL, 520500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520600, '铜仁市', 'Tongren', NULL, NULL, NULL, 520000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520602, '碧江区', 'Bijiang', NULL, NULL, NULL, 520600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520603, '万山区', 'Wanshan', NULL, NULL, NULL, 520600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520621, '江口县', 'Jiangkou', NULL, NULL, NULL, 520600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520622, '玉屏侗族自治县', 'Yuping', NULL, NULL, NULL, 520600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520623, '石阡县', 'Shiqian', NULL, NULL, NULL, 520600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520624, '思南县', 'Sinan', NULL, NULL, NULL, 520600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520625, '印江土家族苗族自治县', 'Yinjiang', NULL, NULL, NULL, 520600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520626, '德江县', 'Dejiang', NULL, NULL, NULL, 520600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520627, '沿河土家族自治县', 'Yuanhe', NULL, NULL, NULL, 520600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (520628, '松桃苗族自治县', 'Songtao', NULL, NULL, NULL, 520600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522300, '黔西南布依族苗族自治州', 'Qianxinan', NULL, NULL, NULL, 520000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522301, '兴义市 ', 'Xingyi', NULL, NULL, NULL, 522300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522322, '兴仁县', 'Xingren', NULL, NULL, NULL, 522300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522323, '普安县', 'Pu\'an', NULL, NULL, NULL, 522300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522324, '晴隆县', 'Qinglong', NULL, NULL, NULL, 522300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522325, '贞丰县', 'Zhenfeng', NULL, NULL, NULL, 522300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522326, '望谟县', 'Wangmo', NULL, NULL, NULL, 522300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522327, '册亨县', 'Ceheng', NULL, NULL, NULL, 522300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522328, '安龙县', 'Anlong', NULL, NULL, NULL, 522300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522600, '黔东南苗族侗族自治州', 'Qiandongnan', NULL, NULL, NULL, 520000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522601, '凯里市', 'Kaili', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522622, '黄平县', 'Huangping', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522623, '施秉县', 'Shibing', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522624, '三穗县', 'Sansui', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522625, '镇远县', 'Zhenyuan', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522626, '岑巩县', 'Cengong', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522627, '天柱县', 'Tianzhu', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522628, '锦屏县', 'Jinping', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522629, '剑河县', 'Jianhe', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522630, '台江县', 'Taijiang', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522631, '黎平县', 'Liping', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522632, '榕江县', 'Rongjiang', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522633, '从江县', 'Congjiang', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522634, '雷山县', 'Leishan', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522635, '麻江县', 'Majiang', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522636, '丹寨县', 'Danzhai', NULL, NULL, NULL, 522600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522700, '黔南布依族苗族自治州', 'Qiannan', NULL, NULL, NULL, 520000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522701, '都匀市', 'Duyun', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522702, '福泉市', 'Fuquan', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522722, '荔波县', 'Libo', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522723, '贵定县', 'Guiding', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522725, '瓮安县', 'Weng\'an', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522726, '独山县', 'Dushan', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522727, '平塘县', 'Pingtang', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522728, '罗甸县', 'Luodian', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522729, '长顺县', 'Changshun', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522730, '龙里县', 'Longli', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522731, '惠水县', 'Huishui', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (522732, '三都水族自治县', 'Sandu', NULL, NULL, NULL, 522700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530000, '云南省', 'Yunnan', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530100, '昆明市', 'Kunming', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530102, '五华区', 'Wuhua', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530103, '盘龙区', 'Panlong', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530111, '官渡区', 'Guandu', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530112, '西山区', 'Xishan', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530113, '东川区', 'Dongchuan', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530114, '呈贡区', 'Chenggong', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530122, '晋宁县', 'Jinning', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530124, '富民县', 'Fumin', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530125, '宜良县', 'Yiliang', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530126, '石林彝族自治县', 'Shilin', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530127, '嵩明县', 'Songming', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530128, '禄劝彝族苗族自治县', 'Luquan', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530129, '寻甸回族彝族自治县 ', 'Xundian', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530181, '安宁市', 'Anning', NULL, NULL, NULL, 530100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530300, '曲靖市', 'Qujing', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530302, '麒麟区', 'Qilin', NULL, NULL, NULL, 530300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530321, '马龙县', 'Malong', NULL, NULL, NULL, 530300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530322, '陆良县', 'Luliang', NULL, NULL, NULL, 530300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530323, '师宗县', 'Shizong', NULL, NULL, NULL, 530300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530324, '罗平县', 'Luoping', NULL, NULL, NULL, 530300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530325, '富源县', 'Fuyuan', NULL, NULL, NULL, 530300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530326, '会泽县', 'Huize', NULL, NULL, NULL, 530300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530328, '沾益县', 'Zhanyi', NULL, NULL, NULL, 530300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530381, '宣威市', 'Xuanwei', NULL, NULL, NULL, 530300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530400, '玉溪市', 'Yuxi', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530402, '红塔区', 'Hongta', NULL, NULL, NULL, 530400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530421, '江川县', 'Jiangchuan', NULL, NULL, NULL, 530400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530422, '澄江县', 'Chengjiang', NULL, NULL, NULL, 530400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530423, '通海县', 'Tonghai', NULL, NULL, NULL, 530400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530424, '华宁县', 'Huaning', NULL, NULL, NULL, 530400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530425, '易门县', 'Yimen', NULL, NULL, NULL, 530400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530426, '峨山彝族自治县', 'Eshan', NULL, NULL, NULL, 530400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530427, '新平彝族傣族自治县', 'Xinping', NULL, NULL, NULL, 530400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530428, '元江哈尼族彝族傣族自治县', 'Yuanjiang', NULL, NULL, NULL, 530400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530500, '保山市', 'Baoshan', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530502, '隆阳区', 'Longyang', NULL, NULL, NULL, 530500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530521, '施甸县', 'Shidian', NULL, NULL, NULL, 530500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530522, '腾冲县', 'Tengchong', NULL, NULL, NULL, 530500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530523, '龙陵县', 'Longling', NULL, NULL, NULL, 530500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530524, '昌宁县', 'Changning', NULL, NULL, NULL, 530500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530600, '昭通市', 'Zhaotong', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530602, '昭阳区', 'Zhaoyang', NULL, NULL, NULL, 530600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530621, '鲁甸县', 'Ludian', NULL, NULL, NULL, 530600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530622, '巧家县', 'Qiaojia', NULL, NULL, NULL, 530600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530623, '盐津县', 'Yanjin', NULL, NULL, NULL, 530600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530624, '大关县', 'Daguan', NULL, NULL, NULL, 530600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530625, '永善县', 'Yongshan', NULL, NULL, NULL, 530600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530626, '绥江县', 'Suijiang', NULL, NULL, NULL, 530600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530627, '镇雄县', 'Zhenxiong', NULL, NULL, NULL, 530600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530628, '彝良县', 'Yiliang', NULL, NULL, NULL, 530600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530629, '威信县', 'Weixin', NULL, NULL, NULL, 530600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530630, '水富县', 'Shuifu', NULL, NULL, NULL, 530600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530700, '丽江市', 'Lijiang', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530702, '古城区', 'Gucheng', NULL, NULL, NULL, 530700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530721, '玉龙纳西族自治县', 'Yulong', NULL, NULL, NULL, 530700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530722, '永胜县', 'Yongsheng', NULL, NULL, NULL, 530700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530723, '华坪县', 'Huaping', NULL, NULL, NULL, 530700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530724, '宁蒗彝族自治县', 'Ninglang', NULL, NULL, NULL, 530700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530800, '普洱市', 'Pu\'er', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530802, '思茅区', 'Simao', NULL, NULL, NULL, 530800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530821, '宁洱哈尼族彝族自治县', 'Ninger', NULL, NULL, NULL, 530800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530822, '墨江哈尼族自治县', 'Mojiang', NULL, NULL, NULL, 530800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530823, '景东彝族自治县', 'Jingdong', NULL, NULL, NULL, 530800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530824, '景谷傣族彝族自治县', 'Jinggu', NULL, NULL, NULL, 530800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530825, '镇沅彝族哈尼族拉祜族自治县', 'Zhenyuan', NULL, NULL, NULL, 530800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530826, '江城哈尼族彝族自治县', 'Jiangcheng', NULL, NULL, NULL, 530800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530827, '孟连傣族拉祜族佤族自治县', 'Menglian', NULL, NULL, NULL, 530800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530828, '澜沧拉祜族自治县', 'Lancang', NULL, NULL, NULL, 530800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530829, '西盟佤族自治县', 'Ximeng', NULL, NULL, NULL, 530800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530900, '临沧市', 'Lincang', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530902, '临翔区', 'Linxiang', NULL, NULL, NULL, 530900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530921, '凤庆县', 'Fengqing', NULL, NULL, NULL, 530900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530922, '云县', 'Yunxian', NULL, NULL, NULL, 530900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530923, '永德县', 'Yongde', NULL, NULL, NULL, 530900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530924, '镇康县', 'Zhenkang', NULL, NULL, NULL, 530900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530925, '双江拉祜族佤族布朗族傣族自治县', 'Shuangjiang', NULL, NULL, NULL, 530900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530926, '耿马傣族佤族自治县', 'Gengma', NULL, NULL, NULL, 530900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (530927, '沧源佤族自治县', 'Cangyuan', NULL, NULL, NULL, 530900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532300, '楚雄彝族自治州', 'Chuxiong', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532301, '楚雄市', 'Chuxiong', NULL, NULL, NULL, 532300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532322, '双柏县', 'Shuangbai', NULL, NULL, NULL, 532300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532323, '牟定县', 'Mouding', NULL, NULL, NULL, 532300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532324, '南华县', 'Nanhua', NULL, NULL, NULL, 532300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532325, '姚安县', 'Yao\'an', NULL, NULL, NULL, 532300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532326, '大姚县', 'Dayao', NULL, NULL, NULL, 532300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532327, '永仁县', 'Yongren', NULL, NULL, NULL, 532300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532328, '元谋县', 'Yuanmou', NULL, NULL, NULL, 532300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532329, '武定县', 'Wuding', NULL, NULL, NULL, 532300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532331, '禄丰县', 'Lufeng', NULL, NULL, NULL, 532300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532500, '红河哈尼族彝族自治州', 'Honghe', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532501, '个旧市', 'Gejiu', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532502, '开远市', 'Kaiyuan', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532503, '蒙自市', 'Mengzi', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532504, '弥勒市', 'Mile ', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532523, '屏边苗族自治县', 'Pingbian', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532524, '建水县', 'Jianshui', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532525, '石屏县', 'Shiping', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532527, '泸西县', 'Luxi', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532528, '元阳县', 'Yuanyang', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532529, '红河县', 'Honghexian', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532530, '金平苗族瑶族傣族自治县', 'Jinping', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532531, '绿春县', 'Lvchun', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532532, '河口瑶族自治县', 'Hekou', NULL, NULL, NULL, 532500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532600, '文山壮族苗族自治州', 'Wenshan', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532601, '文山市', 'Wenshan', NULL, NULL, NULL, 532600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532622, '砚山县', 'Yanshan', NULL, NULL, NULL, 532600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532623, '西畴县', 'Xichou', NULL, NULL, NULL, 532600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532624, '麻栗坡县', 'Malipo', NULL, NULL, NULL, 532600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532625, '马关县', 'Maguan', NULL, NULL, NULL, 532600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532626, '丘北县', 'Qiubei', NULL, NULL, NULL, 532600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532627, '广南县', 'Guangnan', NULL, NULL, NULL, 532600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532628, '富宁县', 'Funing', NULL, NULL, NULL, 532600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532800, '西双版纳傣族自治州', 'Xishuangbanna', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532801, '景洪市', 'Jinghong', NULL, NULL, NULL, 532800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532822, '勐海县', 'Menghai', NULL, NULL, NULL, 532800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532823, '勐腊县', 'Mengla', NULL, NULL, NULL, 532800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532900, '大理白族自治州', 'Dali', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532901, '大理市', 'Dali', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532922, '漾濞彝族自治县', 'Yangbi', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532923, '祥云县', 'Xiangyun', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532924, '宾川县', 'Binchuan', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532925, '弥渡县', 'Midu', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532926, '南涧彝族自治县', 'Nanjian', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532927, '巍山彝族回族自治县', 'Weishan', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532928, '永平县', 'Yongping', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532929, '云龙县', 'Yunlong', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532930, '洱源县', 'Eryuan', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532931, '剑川县', 'Jianchuan', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (532932, '鹤庆县', 'Heqing', NULL, NULL, NULL, 532900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533100, '德宏傣族景颇族自治州', 'Dehong', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533102, '瑞丽市', 'Ruili', NULL, NULL, NULL, 533100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533103, '芒市', 'Mangshi', NULL, NULL, NULL, 533100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533122, '梁河县', 'Lianghe', NULL, NULL, NULL, 533100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533123, '盈江县', 'Yingjiang', NULL, NULL, NULL, 533100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533124, '陇川县', 'Longchuan', NULL, NULL, NULL, 533100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533300, '怒江傈僳族自治州', 'Nujiang', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533321, '泸水县', 'Lushui', NULL, NULL, NULL, 533300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533323, '福贡县', 'Fugong', NULL, NULL, NULL, 533300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533324, '贡山独龙族怒族自治县', 'Gongshan', NULL, NULL, NULL, 533300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533325, '兰坪白族普米族自治县', 'Lanping', NULL, NULL, NULL, 533300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533400, '迪庆藏族自治州', 'Deqen', NULL, NULL, NULL, 530000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533421, '香格里拉市', 'Xianggelila', NULL, NULL, NULL, 533400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533422, '德钦县', 'Deqin', NULL, NULL, NULL, 533400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (533423, '维西傈僳族自治县', 'Weixi', NULL, NULL, NULL, 533400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540000, '西藏自治区', 'Tibet', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540100, '拉萨市', 'Lhasa', NULL, NULL, NULL, 540000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540102, '城关区', 'Chengguan', NULL, NULL, NULL, 540100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540121, '林周县', 'Linzhou', NULL, NULL, NULL, 540100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540122, '当雄县', 'Dangxiong', NULL, NULL, NULL, 540100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540123, '尼木县', 'Nimu', NULL, NULL, NULL, 540100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540124, '曲水县', 'Qushui', NULL, NULL, NULL, 540100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540125, '堆龙德庆县', 'Duilongdeqing', NULL, NULL, NULL, 540100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540126, '达孜县', 'Dazi', NULL, NULL, NULL, 540100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540127, '墨竹工卡县', 'Mozhugongka', NULL, NULL, NULL, 540100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540200, '日喀则市', 'Rikaze', NULL, NULL, NULL, 540000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540202, '桑珠孜区', 'Sangzhuzi', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540221, '南木林县', 'Nanmulin', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540222, '江孜县', 'Jiangzi', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540223, '定日县', 'Dingri', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540224, '萨迦县', 'Sajia', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540225, '拉孜县', 'Lazi', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540226, '昂仁县', 'Angren', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540227, '谢通门县', 'Xietongmen', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540228, '白朗县', 'Bailang', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540229, '仁布县', 'Renbu', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540230, '康马县', 'Kangma', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540231, '定结县', 'Dingjie', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540232, '仲巴县', 'Zhongba', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540233, '亚东县', 'Yadong', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540234, '吉隆县', 'Jilong', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540235, '聂拉木县', 'Nielamu', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540236, '萨嘎县', 'Saga', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540237, '岗巴县', 'Gangba', NULL, NULL, NULL, 540200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540300, '昌都市', 'Qamdo', NULL, NULL, NULL, 540000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540302, '卡若区', 'Karuo', NULL, NULL, NULL, 540300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540321, '江达县', 'Jiangda', NULL, NULL, NULL, 540300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540322, '贡觉县', 'Gongjue', NULL, NULL, NULL, 540300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540323, '类乌齐县', 'Leiwuqi', NULL, NULL, NULL, 540300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540324, '丁青县', 'Dingqing', NULL, NULL, NULL, 540300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540325, '察雅县', 'Chaya', NULL, NULL, NULL, 540300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540326, '八宿县', 'Basu', NULL, NULL, NULL, 540300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540327, '左贡县', 'Zuogong', NULL, NULL, NULL, 540300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540328, '芒康县', 'Mangkang', NULL, NULL, NULL, 540300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540329, '洛隆县', 'Luolong', NULL, NULL, NULL, 540300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (540330, '边坝县', 'Bianba', NULL, NULL, NULL, 540300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542200, '山南地区', 'Shannan', NULL, NULL, NULL, 540000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542221, '乃东县', 'Naidong', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542222, '扎囊县', 'Zhanang', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542223, '贡嘎县', 'Gongga', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542224, '桑日县', 'Sangri', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542225, '琼结县', 'Qiongjie', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542226, '曲松县', 'Qusong', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542227, '措美县', 'Cuomei', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542228, '洛扎县', 'Luozha', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542229, '加查县', 'Jiacha', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542231, '隆子县', 'Longzi', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542232, '错那县', 'Cuona', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542233, '浪卡子县', 'Langkazi', NULL, NULL, NULL, 542200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542400, '那曲地区', 'Nagqu', NULL, NULL, NULL, 540000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542421, '那曲县', 'Naqu', NULL, NULL, NULL, 542400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542422, '嘉黎县', 'Jiali', NULL, NULL, NULL, 542400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542423, '比如县', 'Biru', NULL, NULL, NULL, 542400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542424, '聂荣县', 'Nierong', NULL, NULL, NULL, 542400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542425, '安多县', 'Anduo', NULL, NULL, NULL, 542400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542426, '申扎县', 'Shenzha', NULL, NULL, NULL, 542400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542427, '索县', 'Suoxian', NULL, NULL, NULL, 542400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542428, '班戈县', 'Bange', NULL, NULL, NULL, 542400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542429, '巴青县', 'Baqing', NULL, NULL, NULL, 542400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542430, '尼玛县', 'Nima', NULL, NULL, NULL, 542400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542431, '双湖县', 'Shuanghu', NULL, NULL, NULL, 542400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542500, '阿里地区', 'Ngari', NULL, NULL, NULL, 540000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542521, '普兰县', 'Pulan', NULL, NULL, NULL, 542500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542522, '札达县', 'Zhada', NULL, NULL, NULL, 542500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542523, '噶尔县', 'Gaer', NULL, NULL, NULL, 542500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542524, '日土县', 'Ritu', NULL, NULL, NULL, 542500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542525, '革吉县', 'Geji', NULL, NULL, NULL, 542500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542526, '改则县', 'Gaize', NULL, NULL, NULL, 542500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542527, '措勤县', 'Cuoqin', NULL, NULL, NULL, 542500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542600, '林芝地区', 'Nyingchi', NULL, NULL, NULL, 540000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542621, '林芝县', 'Linzhi', NULL, NULL, NULL, 542600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542622, '工布江达县', 'Gongbujiangda', NULL, NULL, NULL, 542600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542623, '米林县', 'Milin', NULL, NULL, NULL, 542600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542624, '墨脱县', 'Motuo', NULL, NULL, NULL, 542600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542625, '波密县', 'Bomi', NULL, NULL, NULL, 542600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542626, '察隅县', 'Chayu', NULL, NULL, NULL, 542600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (542627, '朗县', 'Langxian', NULL, NULL, NULL, 542600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610000, '陕西省', 'Shaanxi', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610100, '西安市', 'Xi\'an', NULL, NULL, NULL, 610000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610102, '新城区', 'Xincheng', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610103, '碑林区', 'Beilin', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610104, '莲湖区', 'Lianhu', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610111, '灞桥区', 'Baqiao', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610112, '未央区', 'Weiyang', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610113, '雁塔区', 'Yanta', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610114, '阎良区', 'Yanliang', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610115, '临潼区', 'Lintong', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610116, '长安区', 'Chang\'an', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610122, '蓝田县', 'Lantian', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610124, '周至县', 'Zhouzhi', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610125, '户县', 'Huxian', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610126, '高陵区', 'Gaoling', NULL, NULL, NULL, 610100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610200, '铜川市', 'Tongchuan', NULL, NULL, NULL, 610000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610202, '王益区', 'Wangyi', NULL, NULL, NULL, 610200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610203, '印台区', 'Yintai', NULL, NULL, NULL, 610200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610204, '耀州区', 'Yaozhou', NULL, NULL, NULL, 610200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610222, '宜君县', 'Yijun', NULL, NULL, NULL, 610200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610300, '宝鸡市', 'Baoji', NULL, NULL, NULL, 610000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610302, '渭滨区', 'Weibin', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610303, '金台区', 'Jintai', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610304, '陈仓区', 'Chencang', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610322, '凤翔县', 'Fengxiang', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610323, '岐山县', 'Qishan', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610324, '扶风县', 'Fufeng', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610326, '眉县', 'Meixian', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610327, '陇县', 'Longxian', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610328, '千阳县', 'Qianyang', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610329, '麟游县', 'Linyou', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610330, '凤县', 'Fengxian', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610331, '太白县', 'Taibai', NULL, NULL, NULL, 610300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610400, '咸阳市', 'Xianyang', NULL, NULL, NULL, 610000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610402, '秦都区', 'Qindu', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610403, '杨陵区', 'Yangling', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610404, '渭城区', 'Weicheng', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610422, '三原县', 'Sanyuan', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610423, '泾阳县', 'Jingyang', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610424, '乾县', 'Qianxian', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610425, '礼泉县', 'Liquan', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610426, '永寿县', 'Yongshou', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610427, '彬县', 'Binxian', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610428, '长武县', 'Changwu', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610429, '旬邑县', 'Xunyi', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610430, '淳化县', 'Chunhua', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610431, '武功县', 'Wugong', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610481, '兴平市', 'Xingping', NULL, NULL, NULL, 610400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610500, '渭南市', 'Weinan', NULL, NULL, NULL, 610000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610502, '临渭区', 'Linwei', NULL, NULL, NULL, 610500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610521, '华县', 'Huaxian', NULL, NULL, NULL, 610500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610522, '潼关县', 'Tongguan', NULL, NULL, NULL, 610500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610523, '大荔县', 'Dali', NULL, NULL, NULL, 610500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610524, '合阳县', 'Heyang', NULL, NULL, NULL, 610500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610525, '澄城县', 'Chengcheng', NULL, NULL, NULL, 610500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610526, '蒲城县', 'Pucheng', NULL, NULL, NULL, 610500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610527, '白水县', 'Baishui', NULL, NULL, NULL, 610500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610528, '富平县', 'Fuping', NULL, NULL, NULL, 610500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610581, '韩城市', 'Hancheng', NULL, NULL, NULL, 610500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610582, '华阴市', 'Huayin', NULL, NULL, NULL, 610500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610600, '延安市', 'Yan\'an', NULL, NULL, NULL, 610000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610602, '宝塔区', 'Baota', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610621, '延长县', 'Yanchang', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610622, '延川县', 'Yanchuan', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610623, '子长县', 'Zichang', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610624, '安塞县', 'Ansai', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610625, '志丹县', 'Zhidan', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610626, '吴起县', 'Wuqi', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610627, '甘泉县', 'Ganquan', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610628, '富县', 'Fuxian', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610629, '洛川县', 'Luochuan', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610630, '宜川县', 'Yichuan', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610631, '黄龙县', 'Huanglong', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610632, '黄陵县', 'Huangling', NULL, NULL, NULL, 610600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610700, '汉中市', 'Hanzhong', NULL, NULL, NULL, 610000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610702, '汉台区', 'Hantai', NULL, NULL, NULL, 610700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610721, '南郑县', 'Nanzheng', NULL, NULL, NULL, 610700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610722, '城固县', 'Chenggu', NULL, NULL, NULL, 610700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610723, '洋县', 'Yangxian', NULL, NULL, NULL, 610700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610724, '西乡县', 'Xixiang', NULL, NULL, NULL, 610700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610725, '勉县', 'Mianxian', NULL, NULL, NULL, 610700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610726, '宁强县', 'Ningqiang', NULL, NULL, NULL, 610700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610727, '略阳县', 'Lueyang', NULL, NULL, NULL, 610700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610728, '镇巴县', 'Zhenba', NULL, NULL, NULL, 610700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610729, '留坝县', 'Liuba', NULL, NULL, NULL, 610700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610730, '佛坪县', 'Foping', NULL, NULL, NULL, 610700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610800, '榆林市', 'Yulin', NULL, NULL, NULL, 610000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610802, '榆阳区', 'Yuyang', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610821, '神木县', 'Shenmu', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610822, '府谷县', 'Fugu', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610823, '横山县', 'Hengshan', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610824, '靖边县', 'Jingbian', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610825, '定边县', 'Dingbian', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610826, '绥德县', 'Suide', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610827, '米脂县', 'Mizhi', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610828, '佳县', 'Jiaxian', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610829, '吴堡县', 'Wubu', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610830, '清涧县', 'Qingjian', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610831, '子洲县', 'Zizhou', NULL, NULL, NULL, 610800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610900, '安康市', 'Ankang', NULL, NULL, NULL, 610000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610902, '汉滨区', 'Hanbin', NULL, NULL, NULL, 610900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610921, '汉阴县', 'Hanyin', NULL, NULL, NULL, 610900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610922, '石泉县', 'Shiquan', NULL, NULL, NULL, 610900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610923, '宁陕县', 'Ningshan', NULL, NULL, NULL, 610900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610924, '紫阳县', 'Ziyang', NULL, NULL, NULL, 610900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610925, '岚皋县', 'Langao', NULL, NULL, NULL, 610900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610926, '平利县', 'Pingli', NULL, NULL, NULL, 610900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610927, '镇坪县', 'Zhenping', NULL, NULL, NULL, 610900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610928, '旬阳县', 'Xunyang', NULL, NULL, NULL, 610900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (610929, '白河县', 'Baihe', NULL, NULL, NULL, 610900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611000, '商洛市', 'Shangluo', NULL, NULL, NULL, 610000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611002, '商州区', 'Shangzhou', NULL, NULL, NULL, 611000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611021, '洛南县', 'Luonan', NULL, NULL, NULL, 611000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611022, '丹凤县', 'Danfeng', NULL, NULL, NULL, 611000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611023, '商南县', 'Shangnan', NULL, NULL, NULL, 611000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611024, '山阳县', 'Shanyang', NULL, NULL, NULL, 611000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611025, '镇安县', 'Zhen\'an', NULL, NULL, NULL, 611000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611026, '柞水县', 'Zhashui', NULL, NULL, NULL, 611000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611100, '西咸新区', 'Xixian', NULL, NULL, NULL, 610000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611101, '空港新城', 'Konggang', NULL, NULL, NULL, 611100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611102, '沣东新城', 'Fengdong', NULL, NULL, NULL, 611100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611103, '秦汉新城', 'Qinhan', NULL, NULL, NULL, 611100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611104, '沣西新城', 'Fengxi', NULL, NULL, NULL, 611100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (611105, '泾河新城', 'Jinghe', NULL, NULL, NULL, 611100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620000, '甘肃省', 'Gansu', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620100, '兰州市', 'Lanzhou', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620102, '城关区', 'Chengguan', NULL, NULL, NULL, 620100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620103, '七里河区', 'Qilihe', NULL, NULL, NULL, 620100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620104, '西固区', 'Xigu', NULL, NULL, NULL, 620100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620105, '安宁区', 'Anning', NULL, NULL, NULL, 620100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620111, '红古区', 'Honggu', NULL, NULL, NULL, 620100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620121, '永登县', 'Yongdeng', NULL, NULL, NULL, 620100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620122, '皋兰县', 'Gaolan', NULL, NULL, NULL, 620100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620123, '榆中县', 'Yuzhong', NULL, NULL, NULL, 620100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620200, '嘉峪关市', 'Jiayuguan', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620201, '雄关区', 'Xiongguan', NULL, NULL, NULL, 620200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620202, '长城区', 'Changcheng', NULL, NULL, NULL, 620200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620203, '镜铁区', 'Jingtie', NULL, NULL, NULL, 620200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620300, '金昌市', 'Jinchang', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620302, '金川区', 'Jinchuan', NULL, NULL, NULL, 620300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620321, '永昌县', 'Yongchang', NULL, NULL, NULL, 620300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620400, '白银市', 'Baiyin', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620402, '白银区', 'Baiyin', NULL, NULL, NULL, 620400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620403, '平川区', 'Pingchuan', NULL, NULL, NULL, 620400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620421, '靖远县', 'Jingyuan', NULL, NULL, NULL, 620400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620422, '会宁县', 'Huining', NULL, NULL, NULL, 620400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620423, '景泰县', 'Jingtai', NULL, NULL, NULL, 620400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620500, '天水市', 'Tianshui', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620502, '秦州区', 'Qinzhou', NULL, NULL, NULL, 620500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620503, '麦积区', 'Maiji', NULL, NULL, NULL, 620500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620521, '清水县', 'Qingshui', NULL, NULL, NULL, 620500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620522, '秦安县', 'Qin\'an', NULL, NULL, NULL, 620500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620523, '甘谷县', 'Gangu', NULL, NULL, NULL, 620500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620524, '武山县', 'Wushan', NULL, NULL, NULL, 620500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620525, '张家川回族自治县', 'Zhangjiachuan', NULL, NULL, NULL, 620500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620600, '武威市', 'Wuwei', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620602, '凉州区', 'Liangzhou', NULL, NULL, NULL, 620600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620621, '民勤县', 'Minqin', NULL, NULL, NULL, 620600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620622, '古浪县', 'Gulang', NULL, NULL, NULL, 620600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620623, '天祝藏族自治县', 'Tianzhu', NULL, NULL, NULL, 620600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620700, '张掖市', 'Zhangye', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620702, '甘州区', 'Ganzhou', NULL, NULL, NULL, 620700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620721, '肃南裕固族自治县', 'Sunan', NULL, NULL, NULL, 620700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620722, '民乐县', 'Minle', NULL, NULL, NULL, 620700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620723, '临泽县', 'Linze', NULL, NULL, NULL, 620700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620724, '高台县', 'Gaotai', NULL, NULL, NULL, 620700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620725, '山丹县', 'Shandan', NULL, NULL, NULL, 620700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620800, '平凉市', 'Pingliang', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620802, '崆峒区', 'Kongtong', NULL, NULL, NULL, 620800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620821, '泾川县', 'Jingchuan', NULL, NULL, NULL, 620800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620822, '灵台县', 'Lingtai', NULL, NULL, NULL, 620800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620823, '崇信县', 'Chongxin', NULL, NULL, NULL, 620800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620824, '华亭县', 'Huating', NULL, NULL, NULL, 620800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620825, '庄浪县', 'Zhuanglang', NULL, NULL, NULL, 620800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620826, '静宁县', 'Jingning', NULL, NULL, NULL, 620800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620900, '酒泉市', 'Jiuquan', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620902, '肃州区', 'Suzhou', NULL, NULL, NULL, 620900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620921, '金塔县', 'Jinta', NULL, NULL, NULL, 620900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620922, '瓜州县', 'Guazhou', NULL, NULL, NULL, 620900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620923, '肃北蒙古族自治县', 'Subei', NULL, NULL, NULL, 620900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620924, '阿克塞哈萨克族自治县', 'Akesai', NULL, NULL, NULL, 620900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620981, '玉门市', 'Yumen', NULL, NULL, NULL, 620900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (620982, '敦煌市', 'Dunhuang', NULL, NULL, NULL, 620900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621000, '庆阳市', 'Qingyang', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621002, '西峰区', 'Xifeng', NULL, NULL, NULL, 621000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621021, '庆城县', 'Qingcheng', NULL, NULL, NULL, 621000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621022, '环县', 'Huanxian', NULL, NULL, NULL, 621000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621023, '华池县', 'Huachi', NULL, NULL, NULL, 621000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621024, '合水县', 'Heshui', NULL, NULL, NULL, 621000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621025, '正宁县', 'Zhengning', NULL, NULL, NULL, 621000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621026, '宁县', 'Ningxian', NULL, NULL, NULL, 621000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621027, '镇原县', 'Zhenyuan', NULL, NULL, NULL, 621000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621100, '定西市', 'Dingxi', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621102, '安定区', 'Anding', NULL, NULL, NULL, 621100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621121, '通渭县', 'Tongwei', NULL, NULL, NULL, 621100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621122, '陇西县', 'Longxi', NULL, NULL, NULL, 621100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621123, '渭源县', 'Weiyuan', NULL, NULL, NULL, 621100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621124, '临洮县', 'Lintao', NULL, NULL, NULL, 621100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621125, '漳县', 'Zhangxian', NULL, NULL, NULL, 621100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621126, '岷县', 'Minxian', NULL, NULL, NULL, 621100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621200, '陇南市', 'Longnan', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621202, '武都区', 'Wudu', NULL, NULL, NULL, 621200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621221, '成县', 'Chengxian', NULL, NULL, NULL, 621200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621222, '文县', 'Wenxian', NULL, NULL, NULL, 621200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621223, '宕昌县', 'Dangchang', NULL, NULL, NULL, 621200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621224, '康县', 'Kangxian', NULL, NULL, NULL, 621200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621225, '西和县', 'Xihe', NULL, NULL, NULL, 621200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621226, '礼县', 'Lixian', NULL, NULL, NULL, 621200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621227, '徽县', 'Huixian', NULL, NULL, NULL, 621200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (621228, '两当县', 'Liangdang', NULL, NULL, NULL, 621200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (622900, '临夏回族自治州', 'Linxia', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (622901, '临夏市', 'Linxia', NULL, NULL, NULL, 622900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (622921, '临夏县', 'Linxia', NULL, NULL, NULL, 622900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (622922, '康乐县', 'Kangle', NULL, NULL, NULL, 622900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (622923, '永靖县', 'Yongjing', NULL, NULL, NULL, 622900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (622924, '广河县', 'Guanghe', NULL, NULL, NULL, 622900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (622925, '和政县', 'Hezheng', NULL, NULL, NULL, 622900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (622926, '东乡族自治县', 'Dongxiangzu', NULL, NULL, NULL, 622900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (622927, '积石山保安族东乡族撒拉族自治县', 'Jishishan', NULL, NULL, NULL, 622900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (623000, '甘南藏族自治州', 'Gannan', NULL, NULL, NULL, 620000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (623001, '合作市', 'Hezuo', NULL, NULL, NULL, 623000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (623021, '临潭县', 'Lintan', NULL, NULL, NULL, 623000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (623022, '卓尼县', 'Zhuoni', NULL, NULL, NULL, 623000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (623023, '舟曲县', 'Zhouqu', NULL, NULL, NULL, 623000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (623024, '迭部县', 'Diebu', NULL, NULL, NULL, 623000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (623025, '玛曲县', 'Maqu', NULL, NULL, NULL, 623000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (623026, '碌曲县', 'Luqu', NULL, NULL, NULL, 623000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (623027, '夏河县', 'Xiahe', NULL, NULL, NULL, 623000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630000, '青海省', 'Qinghai', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630100, '西宁市', 'Xining', NULL, NULL, NULL, 630000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630102, '城东区', 'Chengdong', NULL, NULL, NULL, 630100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630103, '城中区', 'Chengzhong', NULL, NULL, NULL, 630100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630104, '城西区', 'Chengxi', NULL, NULL, NULL, 630100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630105, '城北区', 'Chengbei', NULL, NULL, NULL, 630100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630121, '大通回族土族自治县', 'Datong', NULL, NULL, NULL, 630100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630122, '湟中县', 'Huangzhong', NULL, NULL, NULL, 630100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630123, '湟源县', 'Huangyuan', NULL, NULL, NULL, 630100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630200, '海东市', 'Haidong', NULL, NULL, NULL, 630000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630202, '乐都区', 'Ledu', NULL, NULL, NULL, 630200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630221, '平安县', 'Ping\'an', NULL, NULL, NULL, 630200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630222, '民和回族土族自治县', 'Minhe', NULL, NULL, NULL, 630200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630223, '互助土族自治县', 'Huzhu', NULL, NULL, NULL, 630200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630224, '化隆回族自治县', 'Hualong', NULL, NULL, NULL, 630200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (630225, '循化撒拉族自治县', 'Xunhua', NULL, NULL, NULL, 630200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632200, '海北藏族自治州', 'Haibei', NULL, NULL, NULL, 630000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632221, '门源回族自治县', 'Menyuan', NULL, NULL, NULL, 632200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632222, '祁连县', 'Qilian', NULL, NULL, NULL, 632200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632223, '海晏县', 'Haiyan', NULL, NULL, NULL, 632200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632224, '刚察县', 'Gangcha', NULL, NULL, NULL, 632200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632300, '黄南藏族自治州', 'Huangnan', NULL, NULL, NULL, 630000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632321, '同仁县', 'Tongren', NULL, NULL, NULL, 632300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632322, '尖扎县', 'Jianzha', NULL, NULL, NULL, 632300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632323, '泽库县', 'Zeku', NULL, NULL, NULL, 632300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632324, '河南蒙古族自治县', 'Henan', NULL, NULL, NULL, 632300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632500, '海南藏族自治州', 'Hainan', NULL, NULL, NULL, 630000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632521, '共和县', 'Gonghe', NULL, NULL, NULL, 632500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632522, '同德县', 'Tongde', NULL, NULL, NULL, 632500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632523, '贵德县', 'Guide', NULL, NULL, NULL, 632500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632524, '兴海县', 'Xinghai', NULL, NULL, NULL, 632500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632525, '贵南县', 'Guinan', NULL, NULL, NULL, 632500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632600, '果洛藏族自治州', 'Golog', NULL, NULL, NULL, 630000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632621, '玛沁县', 'Maqin', NULL, NULL, NULL, 632600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632622, '班玛县', 'Banma', NULL, NULL, NULL, 632600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632623, '甘德县', 'Gande', NULL, NULL, NULL, 632600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632624, '达日县', 'Dari', NULL, NULL, NULL, 632600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632625, '久治县', 'Jiuzhi', NULL, NULL, NULL, 632600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632626, '玛多县', 'Maduo', NULL, NULL, NULL, 632600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632700, '玉树藏族自治州', 'Yushu', NULL, NULL, NULL, 630000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632701, '玉树市', 'Yushu', NULL, NULL, NULL, 632700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632722, '杂多县', 'Zaduo', NULL, NULL, NULL, 632700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632723, '称多县', 'Chenduo', NULL, NULL, NULL, 632700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632724, '治多县', 'Zhiduo', NULL, NULL, NULL, 632700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632725, '囊谦县', 'Nangqian', NULL, NULL, NULL, 632700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632726, '曲麻莱县', 'Qumalai', NULL, NULL, NULL, 632700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632800, '海西蒙古族藏族自治州', 'Haixi', NULL, NULL, NULL, 630000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632801, '格尔木市', 'Geermu', NULL, NULL, NULL, 632800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632802, '德令哈市', 'Delingha', NULL, NULL, NULL, 632800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632821, '乌兰县', 'Wulan', NULL, NULL, NULL, 632800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632822, '都兰县', 'Dulan', NULL, NULL, NULL, 632800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (632823, '天峻县', 'Tianjun', NULL, NULL, NULL, 632800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640000, '宁夏回族自治区', 'Ningxia', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640100, '银川市', 'Yinchuan', NULL, NULL, NULL, 640000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640104, '兴庆区', 'Xingqing', NULL, NULL, NULL, 640100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640105, '西夏区', 'Xixia', NULL, NULL, NULL, 640100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640106, '金凤区', 'Jinfeng', NULL, NULL, NULL, 640100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640121, '永宁县', 'Yongning', NULL, NULL, NULL, 640100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640122, '贺兰县', 'Helan', NULL, NULL, NULL, 640100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640181, '灵武市', 'Lingwu', NULL, NULL, NULL, 640100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640200, '石嘴山市', 'Shizuishan', NULL, NULL, NULL, 640000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640202, '大武口区', 'Dawukou', NULL, NULL, NULL, 640200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640205, '惠农区', 'Huinong', NULL, NULL, NULL, 640200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640221, '平罗县', 'Pingluo', NULL, NULL, NULL, 640200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640300, '吴忠市', 'Wuzhong', NULL, NULL, NULL, 640000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640302, '利通区', 'Litong', NULL, NULL, NULL, 640300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640303, '红寺堡区', 'Hongsibao', NULL, NULL, NULL, 640300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640323, '盐池县', 'Yanchi', NULL, NULL, NULL, 640300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640324, '同心县', 'Tongxin', NULL, NULL, NULL, 640300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640381, '青铜峡市', 'Qingtongxia', NULL, NULL, NULL, 640300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640400, '固原市', 'Guyuan', NULL, NULL, NULL, 640000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640402, '原州区', 'Yuanzhou', NULL, NULL, NULL, 640400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640422, '西吉县', 'Xiji', NULL, NULL, NULL, 640400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640423, '隆德县', 'Longde', NULL, NULL, NULL, 640400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640424, '泾源县', 'Jingyuan', NULL, NULL, NULL, 640400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640425, '彭阳县', 'Pengyang', NULL, NULL, NULL, 640400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640500, '中卫市', 'Zhongwei', NULL, NULL, NULL, 640000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640502, '沙坡头区', 'Shapotou', NULL, NULL, NULL, 640500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640521, '中宁县', 'Zhongning', NULL, NULL, NULL, 640500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (640522, '海原县', 'Haiyuan', NULL, NULL, NULL, 640500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650000, '新疆维吾尔自治区', 'Xinjiang', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650100, '乌鲁木齐市', 'Urumqi', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650102, '天山区', 'Tianshan', NULL, NULL, NULL, 650100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650103, '沙依巴克区', 'Shayibake', NULL, NULL, NULL, 650100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650104, '新市区', 'Xinshi', NULL, NULL, NULL, 650100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650105, '水磨沟区', 'Shuimogou', NULL, NULL, NULL, 650100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650106, '头屯河区', 'Toutunhe', NULL, NULL, NULL, 650100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650107, '达坂城区', 'Dabancheng', NULL, NULL, NULL, 650100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650109, '米东区', 'Midong', NULL, NULL, NULL, 650100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650121, '乌鲁木齐县', 'Wulumuqi', NULL, NULL, NULL, 650100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650200, '克拉玛依市', 'Karamay', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650202, '独山子区', 'Dushanzi', NULL, NULL, NULL, 650200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650203, '克拉玛依区', 'Kelamayi', NULL, NULL, NULL, 650200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650204, '白碱滩区', 'Baijiantan', NULL, NULL, NULL, 650200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (650205, '乌尔禾区', 'Wuerhe', NULL, NULL, NULL, 650200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652100, '吐鲁番地区', 'Turpan', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652101, '吐鲁番市', 'Tulufan', NULL, NULL, NULL, 652100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652122, '鄯善县', 'Shanshan', NULL, NULL, NULL, 652100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652123, '托克逊县', 'Tuokexun', NULL, NULL, NULL, 652100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652200, '哈密地区', 'Hami', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652201, '哈密市', 'Hami', NULL, NULL, NULL, 652200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652222, '巴里坤哈萨克自治县', 'Balikun', NULL, NULL, NULL, 652200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652223, '伊吾县', 'Yiwu', NULL, NULL, NULL, 652200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652300, '昌吉回族自治州', 'Changji', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652301, '昌吉市', 'Changji', NULL, NULL, NULL, 652300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652302, '阜康市', 'Fukang', NULL, NULL, NULL, 652300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652323, '呼图壁县', 'Hutubi', NULL, NULL, NULL, 652300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652324, '玛纳斯县', 'Manasi', NULL, NULL, NULL, 652300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652325, '奇台县', 'Qitai', NULL, NULL, NULL, 652300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652327, '吉木萨尔县', 'Jimusaer', NULL, NULL, NULL, 652300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652328, '木垒哈萨克自治县', 'Mulei', NULL, NULL, NULL, 652300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652700, '博尔塔拉蒙古自治州', 'Bortala', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652701, '博乐市', 'Bole', NULL, NULL, NULL, 652700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652702, '阿拉山口市', 'Alashankou', NULL, NULL, NULL, 652700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652722, '精河县', 'Jinghe', NULL, NULL, NULL, 652700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652723, '温泉县', 'Wenquan', NULL, NULL, NULL, 652700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652800, '巴音郭楞蒙古自治州', 'Bayingol', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652801, '库尔勒市', 'Kuerle', NULL, NULL, NULL, 652800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652822, '轮台县', 'Luntai', NULL, NULL, NULL, 652800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652823, '尉犁县', 'Yuli', NULL, NULL, NULL, 652800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652824, '若羌县', 'Ruoqiang', NULL, NULL, NULL, 652800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652825, '且末县', 'Qiemo', NULL, NULL, NULL, 652800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652826, '焉耆回族自治县', 'Yanqi', NULL, NULL, NULL, 652800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652827, '和静县', 'Hejing', NULL, NULL, NULL, 652800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652828, '和硕县', 'Heshuo', NULL, NULL, NULL, 652800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652829, '博湖县', 'Bohu', NULL, NULL, NULL, 652800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652900, '阿克苏地区', 'Aksu', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652901, '阿克苏市', 'Akesu', NULL, NULL, NULL, 652900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652922, '温宿县', 'Wensu', NULL, NULL, NULL, 652900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652923, '库车县', 'Kuche', NULL, NULL, NULL, 652900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652924, '沙雅县', 'Shaya', NULL, NULL, NULL, 652900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652925, '新和县', 'Xinhe', NULL, NULL, NULL, 652900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652926, '拜城县', 'Baicheng', NULL, NULL, NULL, 652900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652927, '乌什县', 'Wushi', NULL, NULL, NULL, 652900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652928, '阿瓦提县', 'Awati', NULL, NULL, NULL, 652900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (652929, '柯坪县', 'Keping', NULL, NULL, NULL, 652900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653000, '克孜勒苏柯尔克孜自治州', 'Kizilsu', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653001, '阿图什市', 'Atushi', NULL, NULL, NULL, 653000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653022, '阿克陶县', 'Aketao', NULL, NULL, NULL, 653000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653023, '阿合奇县', 'Aheqi', NULL, NULL, NULL, 653000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653024, '乌恰县', 'Wuqia', NULL, NULL, NULL, 653000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653100, '喀什地区', 'Kashgar', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653101, '喀什市', 'Kashi', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653121, '疏附县', 'Shufu', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653122, '疏勒县', 'Shule', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653123, '英吉沙县', 'Yingjisha', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653124, '泽普县', 'Zepu', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653125, '莎车县', 'Shache', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653126, '叶城县', 'Yecheng', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653127, '麦盖提县', 'Maigaiti', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653128, '岳普湖县', 'Yuepuhu', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653129, '伽师县', 'Jiashi', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653130, '巴楚县', 'Bachu', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653131, '塔什库尔干塔吉克自治县', 'Tashikuergantajike', NULL, NULL, NULL, 653100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653200, '和田地区', 'Hotan', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653201, '和田市', 'Hetianshi', NULL, NULL, NULL, 653200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653221, '和田县', 'Hetianxian', NULL, NULL, NULL, 653200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653222, '墨玉县', 'Moyu', NULL, NULL, NULL, 653200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653223, '皮山县', 'Pishan', NULL, NULL, NULL, 653200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653224, '洛浦县', 'Luopu', NULL, NULL, NULL, 653200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653225, '策勒县', 'Cele', NULL, NULL, NULL, 653200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653226, '于田县', 'Yutian', NULL, NULL, NULL, 653200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (653227, '民丰县', 'Minfeng', NULL, NULL, NULL, 653200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654000, '伊犁哈萨克自治州', 'Ili', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654002, '伊宁市', 'Yining', NULL, NULL, NULL, 654000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654003, '奎屯市', 'Kuitun', NULL, NULL, NULL, 654000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654004, '霍尔果斯市', 'Huoerguosi', NULL, NULL, NULL, 654000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654021, '伊宁县', 'Yining', NULL, NULL, NULL, 654000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654022, '察布查尔锡伯自治县', 'Chabuchaerxibo', NULL, NULL, NULL, 654000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654023, '霍城县', 'Huocheng', NULL, NULL, NULL, 654000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654024, '巩留县', 'Gongliu', NULL, NULL, NULL, 654000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654025, '新源县', 'Xinyuan', NULL, NULL, NULL, 654000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654026, '昭苏县', 'Zhaosu', NULL, NULL, NULL, 654000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654027, '特克斯县', 'Tekesi', NULL, NULL, NULL, 654000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654028, '尼勒克县', 'Nileke', NULL, NULL, NULL, 654000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654200, '塔城地区', 'Qoqek', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654201, '塔城市', 'Tacheng', NULL, NULL, NULL, 654200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654202, '乌苏市', 'Wusu', NULL, NULL, NULL, 654200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654221, '额敏县', 'Emin', NULL, NULL, NULL, 654200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654223, '沙湾县', 'Shawan', NULL, NULL, NULL, 654200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654224, '托里县', 'Tuoli', NULL, NULL, NULL, 654200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654225, '裕民县', 'Yumin', NULL, NULL, NULL, 654200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654226, '和布克赛尔蒙古自治县', 'Hebukesaier', NULL, NULL, NULL, 654200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654300, '阿勒泰地区', 'Altay', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654301, '阿勒泰市', 'Aletai', NULL, NULL, NULL, 654300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654321, '布尔津县', 'Buerjin', NULL, NULL, NULL, 654300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654322, '富蕴县', 'Fuyun', NULL, NULL, NULL, 654300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654323, '福海县', 'Fuhai', NULL, NULL, NULL, 654300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654324, '哈巴河县', 'Habahe', NULL, NULL, NULL, 654300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654325, '青河县', 'Qinghe', NULL, NULL, NULL, 654300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (654326, '吉木乃县', 'Jimunai', NULL, NULL, NULL, 654300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (659000, '直辖县级', '', NULL, NULL, NULL, 650000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (659001, '石河子市', 'Shihezi', NULL, NULL, NULL, 659000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (659002, '阿拉尔市', 'Aral', NULL, NULL, NULL, 659000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (659003, '图木舒克市', 'Tumxuk', NULL, NULL, NULL, 659000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (659004, '五家渠市', 'Wujiaqu', NULL, NULL, NULL, 659000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (659005, '北屯市', 'Beitun', NULL, NULL, NULL, 659000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (659006, '铁门关市', 'Tiemenguan', NULL, NULL, NULL, 659000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (659007, '双河市', 'Shuanghe', NULL, NULL, NULL, 659000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710000, '台湾', 'Taiwan', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710100, '台北市', 'Taipei', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710101, '松山区', 'Songshan', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710102, '信义区', 'Xinyi', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710103, '大安区', 'Da\'an', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710104, '中山区', 'Zhongshan', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710105, '中正区', 'Zhongzheng', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710106, '大同区', 'Datong', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710107, '万华区', 'Wanhua', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710108, '文山区', 'Wenshan', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710109, '南港区', 'Nangang', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710110, '内湖区', 'Nahu', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710111, '士林区', 'Shilin', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710112, '北投区', 'Beitou', NULL, NULL, NULL, 710100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710200, '高雄市', 'Kaohsiung', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710201, '盐埕区', 'Yancheng', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710202, '鼓山区', 'Gushan', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710203, '左营区', 'Zuoying', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710204, '楠梓区', 'Nanzi', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710205, '三民区', 'Sanmin', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710206, '新兴区', 'Xinxing', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710207, '前金区', 'Qianjin', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710208, '苓雅区', 'Lingya', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710209, '前镇区', 'Qianzhen', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710210, '旗津区', 'Qijin', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710211, '小港区', 'Xiaogang', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710212, '凤山区', 'Fengshan', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710213, '林园区', 'Linyuan', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710214, '大寮区', 'Daliao', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710215, '大树区', 'Dashu', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710216, '大社区', 'Dashe', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710217, '仁武区', 'Renwu', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710218, '鸟松区', 'Niaosong', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710219, '冈山区', 'Gangshan', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710220, '桥头区', 'Qiaotou', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710221, '燕巢区', 'Yanchao', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710222, '田寮区', 'Tianliao', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710223, '阿莲区', 'Alian', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710224, '路竹区', 'Luzhu', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710225, '湖内区', 'Huna', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710226, '茄萣区', 'Qieding', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710227, '永安区', 'Yong\'an', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710228, '弥陀区', 'Mituo', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710229, '梓官区', 'Ziguan', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710230, '旗山区', 'Qishan', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710231, '美浓区', 'Meinong', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710232, '六龟区', 'Liugui', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710233, '甲仙区', 'Jiaxian', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710234, '杉林区', 'Shanlin', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710235, '内门区', 'Namen', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710236, '茂林区', 'Maolin', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710237, '桃源区', 'Taoyuan', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710238, '那玛夏区', 'Namaxia', NULL, NULL, NULL, 710200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710300, '基隆市', 'Keelung', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710301, '中正区', 'Zhongzheng', NULL, NULL, NULL, 710300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710302, '七堵区', 'Qidu', NULL, NULL, NULL, 710300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710303, '暖暖区', 'Nuannuan', NULL, NULL, NULL, 710300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710304, '仁爱区', 'Renai', NULL, NULL, NULL, 710300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710305, '中山区', 'Zhongshan', NULL, NULL, NULL, 710300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710306, '安乐区', 'Anle', NULL, NULL, NULL, 710300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710307, '信义区', 'Xinyi', NULL, NULL, NULL, 710300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710400, '台中市', 'Taichung', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710401, '中区', 'Zhongqu', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710402, '东区', 'Dongqu', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710403, '南区', 'Nanqu', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710404, '西区', 'Xiqu', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710405, '北区', 'Beiqu', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710406, '西屯区', 'Xitun', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710407, '南屯区', 'Nantun', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710408, '北屯区', 'Beitun', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710409, '丰原区', 'Fengyuan', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710410, '东势区', 'Dongshi', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710411, '大甲区', 'Dajia', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710412, '清水区', 'Qingshui', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710413, '沙鹿区', 'Shalu', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710414, '梧栖区', 'Wuqi', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710415, '后里区', 'Houli', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710416, '神冈区', 'Shengang', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710417, '潭子区', 'Tanzi', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710418, '大雅区', 'Daya', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710419, '新社区', 'Xinshe', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710420, '石冈区', 'Shigang', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710421, '外埔区', 'Waipu', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710422, '大安区', 'Da\'an', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710423, '乌日区', 'Wuri', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710424, '大肚区', 'Dadu', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710425, '龙井区', 'Longjing', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710426, '雾峰区', 'Wufeng', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710427, '太平区', 'Taiping', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710428, '大里区', 'Dali', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710429, '和平区', 'Heping', NULL, NULL, NULL, 710400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710500, '台南市', 'Tainan', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710501, '东区', 'Dongqu', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710502, '南区', 'Nanqu', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710504, '北区', 'Beiqu', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710506, '安南区', 'Annan', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710507, '安平区', 'Anping', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710508, '中西区', 'Zhongxi', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710509, '新营区', 'Xinying', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710510, '盐水区', 'Yanshui', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710511, '白河区', 'Baihe', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710512, '柳营区', 'Liuying', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710513, '后壁区', 'Houbi', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710514, '东山区', 'Dongshan', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710515, '麻豆区', 'Madou', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710516, '下营区', 'Xiaying', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710517, '六甲区', 'Liujia', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710518, '官田区', 'Guantian', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710519, '大内区', 'Dana', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710520, '佳里区', 'Jiali', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710521, '学甲区', 'Xuejia', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710522, '西港区', 'Xigang', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710523, '七股区', 'Qigu', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710524, '将军区', 'Jiangjun', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710525, '北门区', 'Beimen', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710526, '新化区', 'Xinhua', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710527, '善化区', 'Shanhua', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710528, '新市区', 'Xinshi', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710529, '安定区', 'Anding', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710530, '山上区', 'Shanshang', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710531, '玉井区', 'Yujing', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710532, '楠西区', 'Nanxi', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710533, '南化区', 'Nanhua', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710534, '左镇区', 'Zuozhen', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710535, '仁德区', 'Rende', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710536, '归仁区', 'Guiren', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710537, '关庙区', 'Guanmiao', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710538, '龙崎区', 'Longqi', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710539, '永康区', 'Yongkang', NULL, NULL, NULL, 710500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710600, '新竹市', 'Hsinchu', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710601, '东区', 'Dongqu', NULL, NULL, NULL, 710600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710602, '北区', 'Beiqu', NULL, NULL, NULL, 710600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710603, '香山区', 'Xiangshan', NULL, NULL, NULL, 710600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710700, '嘉义市', 'Chiayi', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710701, '东区', 'Dongqu', NULL, NULL, NULL, 710700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710702, '西区', 'Xiqu', NULL, NULL, NULL, 710700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710800, '新北市', 'New Taipei', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710801, '板桥区', 'Banqiao', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710802, '三重区', 'Sanzhong', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710803, '中和区', 'Zhonghe', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710804, '永和区', 'Yonghe', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710805, '新庄区', 'Xinzhuang', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710806, '新店区', 'Xindian', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710807, '树林区', 'Shulin', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710808, '莺歌区', 'Yingge', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710809, '三峡区', 'Sanxia', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710810, '淡水区', 'Danshui', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710811, '汐止区', 'Xizhi', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710812, '瑞芳区', 'Ruifang', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710813, '土城区', 'Tucheng', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710814, '芦洲区', 'Luzhou', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710815, '五股区', 'Wugu', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710816, '泰山区', 'Taishan', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710817, '林口区', 'Linkou', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710818, '深坑区', 'Shenkeng', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710819, '石碇区', 'Shiding', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710820, '坪林区', 'Pinglin', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710821, '三芝区', 'Sanzhi', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710822, '石门区', 'Shimen', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710823, '八里区', 'Bali', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710824, '平溪区', 'Pingxi', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710825, '双溪区', 'Shuangxi', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710826, '贡寮区', 'Gongliao', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710827, '金山区', 'Jinshan', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710828, '万里区', 'Wanli', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (710829, '乌来区', 'Wulai', NULL, NULL, NULL, 710800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712200, '宜兰县', 'Yilan', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712201, '宜兰市', 'Yilan', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712221, '罗东镇', 'Luodong', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712222, '苏澳镇', 'Suao', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712223, '头城镇', 'Toucheng', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712224, '礁溪乡', 'Jiaoxi', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712225, '壮围乡', 'Zhuangwei', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712226, '员山乡', 'Yuanshan', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712227, '冬山乡', 'Dongshan', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712228, '五结乡', 'Wujie', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712229, '三星乡', 'Sanxing', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712230, '大同乡', 'Datong', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712231, '南澳乡', 'Nanao', NULL, NULL, NULL, 712200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712300, '桃园县', 'Taoyuan', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712301, '桃园市', 'Taoyuan', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712302, '中坜市', 'Zhongli', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712303, '平镇市', 'Pingzhen', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712304, '八德市', 'Bade', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712305, '杨梅市', 'Yangmei', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712306, '芦竹市', 'Luzhu', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712321, '大溪镇', 'Daxi', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712324, '大园乡', 'Dayuan', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712325, '龟山乡', 'Guishan', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712327, '龙潭乡', 'Longtan', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712329, '新屋乡', 'Xinwu', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712330, '观音乡', 'Guanyin', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712331, '复兴乡', 'Fuxing', NULL, NULL, NULL, 712300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712400, '新竹县', 'Hsinchu', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712401, '竹北市', 'Zhubei', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712421, '竹东镇', 'Zhudong', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712422, '新埔镇', 'Xinpu', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712423, '关西镇', 'Guanxi', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712424, '湖口乡', 'Hukou', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712425, '新丰乡', 'Xinfeng', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712426, '芎林乡', 'Xionglin', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712427, '横山乡', 'Hengshan', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712428, '北埔乡', 'Beipu', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712429, '宝山乡', 'Baoshan', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712430, '峨眉乡', 'Emei', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712431, '尖石乡', 'Jianshi', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712432, '五峰乡', 'Wufeng', NULL, NULL, NULL, 712400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712500, '苗栗县', 'Miaoli', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712501, '苗栗市', 'Miaoli', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712521, '苑里镇', 'Yuanli', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712522, '通霄镇', 'Tongxiao', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712523, '竹南镇', 'Zhunan', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712524, '头份镇', 'Toufen', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712525, '后龙镇', 'Houlong', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712526, '卓兰镇', 'Zhuolan', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712527, '大湖乡', 'Dahu', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712528, '公馆乡', 'Gongguan', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712529, '铜锣乡', 'Tongluo', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712530, '南庄乡', 'Nanzhuang', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712531, '头屋乡', 'Touwu', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712532, '三义乡', 'Sanyi', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712533, '西湖乡', 'Xihu', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712534, '造桥乡', 'Zaoqiao', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712535, '三湾乡', 'Sanwan', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712536, '狮潭乡', 'Shitan', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712537, '泰安乡', 'Tai\'an', NULL, NULL, NULL, 712500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712700, '彰化县', 'Changhua', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712701, '彰化市', 'Zhanghuashi', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712721, '鹿港镇', 'Lugang', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712722, '和美镇', 'Hemei', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712723, '线西乡', 'Xianxi', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712724, '伸港乡', 'Shengang', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712725, '福兴乡', 'Fuxing', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712726, '秀水乡', 'Xiushui', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712727, '花坛乡', 'Huatan', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712728, '芬园乡', 'Fenyuan', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712729, '员林镇', 'Yuanlin', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712730, '溪湖镇', 'Xihu', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712731, '田中镇', 'Tianzhong', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712732, '大村乡', 'Dacun', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712733, '埔盐乡', 'Puyan', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712734, '埔心乡', 'Puxin', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712735, '永靖乡', 'Yongjing', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712736, '社头乡', 'Shetou', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712737, '二水乡', 'Ershui', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712738, '北斗镇', 'Beidou', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712739, '二林镇', 'Erlin', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712740, '田尾乡', 'Tianwei', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712741, '埤头乡', 'Pitou', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712742, '芳苑乡', 'Fangyuan', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712743, '大城乡', 'Dacheng', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712744, '竹塘乡', 'Zhutang', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712745, '溪州乡', 'Xizhou', NULL, NULL, NULL, 712700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712800, '南投县', 'Nantou', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712801, '南投市', 'Nantoushi', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712821, '埔里镇', 'Puli', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712822, '草屯镇', 'Caotun', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712823, '竹山镇', 'Zhushan', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712824, '集集镇', 'Jiji', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712825, '名间乡', 'Mingjian', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712826, '鹿谷乡', 'Lugu', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712827, '中寮乡', 'Zhongliao', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712828, '鱼池乡', 'Yuchi', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712829, '国姓乡', 'Guoxing', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712830, '水里乡', 'Shuili', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712831, '信义乡', 'Xinyi', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712832, '仁爱乡', 'Renai', NULL, NULL, NULL, 712800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712900, '云林县', 'Yunlin', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712901, '斗六市', 'Douliu', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712921, '斗南镇', 'Dounan', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712922, '虎尾镇', 'Huwei', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712923, '西螺镇', 'Xiluo', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712924, '土库镇', 'Tuku', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712925, '北港镇', 'Beigang', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712926, '古坑乡', 'Gukeng', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712927, '大埤乡', 'Dapi', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712928, '莿桐乡', 'Citong', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712929, '林内乡', 'Linna', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712930, '二仑乡', 'Erlun', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712931, '仑背乡', 'Lunbei', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712932, '麦寮乡', 'Mailiao', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712933, '东势乡', 'Dongshi', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712934, '褒忠乡', 'Baozhong', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712935, '台西乡', 'Taixi', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712936, '元长乡', 'Yuanchang', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712937, '四湖乡', 'Sihu', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712938, '口湖乡', 'Kouhu', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (712939, '水林乡', 'Shuilin', NULL, NULL, NULL, 712900, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713000, '嘉义县', 'Chiayi', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713001, '太保市', 'Taibao', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713002, '朴子市', 'Puzi', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713023, '布袋镇', 'Budai', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713024, '大林镇', 'Dalin', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713025, '民雄乡', 'Minxiong', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713026, '溪口乡', 'Xikou', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713027, '新港乡', 'Xingang', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713028, '六脚乡', 'Liujiao', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713029, '东石乡', 'Dongshi', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713030, '义竹乡', 'Yizhu', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713031, '鹿草乡', 'Lucao', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713032, '水上乡', 'Shuishang', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713033, '中埔乡', 'Zhongpu', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713034, '竹崎乡', 'Zhuqi', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713035, '梅山乡', 'Meishan', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713036, '番路乡', 'Fanlu', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713037, '大埔乡', 'Dapu', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713038, '阿里山乡', 'Alishan', NULL, NULL, NULL, 713000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713300, '屏东县', 'Pingtung', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713301, '屏东市', 'Pingdong', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713321, '潮州镇', 'Chaozhou', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713322, '东港镇', 'Donggang', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713323, '恒春镇', 'Hengchun', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713324, '万丹乡', 'Wandan', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713325, '长治乡', 'Changzhi', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713326, '麟洛乡', 'Linluo', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713327, '九如乡', 'Jiuru', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713328, '里港乡', 'Ligang', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713329, '盐埔乡', 'Yanpu', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713330, '高树乡', 'Gaoshu', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713331, '万峦乡', 'Wanluan', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713332, '内埔乡', 'Napu', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713333, '竹田乡', 'Zhutian', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713334, '新埤乡', 'Xinpi', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713335, '枋寮乡', 'Fangliao', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713336, '新园乡', 'Xinyuan', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713337, '崁顶乡', 'Kanding', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713338, '林边乡', 'Linbian', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713339, '南州乡', 'Nanzhou', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713340, '佳冬乡', 'Jiadong', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713341, '琉球乡', 'Liuqiu', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713342, '车城乡', 'Checheng', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713343, '满州乡', 'Manzhou', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713344, '枋山乡', 'Fangshan', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713345, '三地门乡', 'Sandimen', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713346, '雾台乡', 'Wutai', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713347, '玛家乡', 'Majia', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713348, '泰武乡', 'Taiwu', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713349, '来义乡', 'Laiyi', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713350, '春日乡', 'Chunri', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713351, '狮子乡', 'Shizi', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713352, '牡丹乡', 'Mudan', NULL, NULL, NULL, 713300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713400, '台东县', 'Taitung', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713401, '台东市', 'Taidong', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713421, '成功镇', 'Chenggong', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713422, '关山镇', 'Guanshan', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713423, '卑南乡', 'Beinan', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713424, '鹿野乡', 'Luye', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713425, '池上乡', 'Chishang', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713426, '东河乡', 'Donghe', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713427, '长滨乡', 'Changbin', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713428, '太麻里乡', 'Taimali', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713429, '大武乡', 'Dawu', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713430, '绿岛乡', 'Lvdao', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713431, '海端乡', 'Haiduan', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713432, '延平乡', 'Yanping', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713433, '金峰乡', 'Jinfeng', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713434, '达仁乡', 'Daren', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713435, '兰屿乡', 'Lanyu', NULL, NULL, NULL, 713400, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713500, '花莲县', 'Hualien', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713501, '花莲市', 'Hualian', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713521, '凤林镇', 'Fenglin', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713522, '玉里镇', 'Yuli', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713523, '新城乡', 'Xincheng', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713524, '吉安乡', 'Ji\'an', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713525, '寿丰乡', 'Shoufeng', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713526, '光复乡', 'Guangfu', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713527, '丰滨乡', 'Fengbin', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713528, '瑞穗乡', 'Ruisui', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713529, '富里乡', 'Fuli', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713530, '秀林乡', 'Xiulin', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713531, '万荣乡', 'Wanrong', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713532, '卓溪乡', 'Zhuoxi', NULL, NULL, NULL, 713500, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713600, '澎湖县', 'Penghu', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713601, '马公市', 'Magong', NULL, NULL, NULL, 713600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713621, '湖西乡', 'Huxi', NULL, NULL, NULL, 713600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713622, '白沙乡', 'Baisha', NULL, NULL, NULL, 713600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713623, '西屿乡', 'Xiyu', NULL, NULL, NULL, 713600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713624, '望安乡', 'Wang\'an', NULL, NULL, NULL, 713600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713625, '七美乡', 'Qimei', NULL, NULL, NULL, 713600, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713700, '金门县', 'Jinmen', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713701, '金城镇', 'Jincheng', NULL, NULL, NULL, 713700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713702, '金湖镇', 'Jinhu', NULL, NULL, NULL, 713700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713703, '金沙镇', 'Jinsha', NULL, NULL, NULL, 713700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713704, '金宁乡', 'Jinning', NULL, NULL, NULL, 713700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713705, '烈屿乡', 'Lieyu', NULL, NULL, NULL, 713700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713706, '乌丘乡', 'Wuqiu', NULL, NULL, NULL, 713700, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713800, '连江县', 'Lienchiang', NULL, NULL, NULL, 710000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713801, '南竿乡', 'Nangan', NULL, NULL, NULL, 713800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713802, '北竿乡', 'Beigan', NULL, NULL, NULL, 713800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713803, '莒光乡', 'Juguang', NULL, NULL, NULL, 713800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (713804, '东引乡', 'Dongyin', NULL, NULL, NULL, 713800, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810000, '香港特别行政区', 'Hong Kong', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810100, '香港岛', 'Hong Kong Island', NULL, NULL, NULL, 810000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810101, '中西区', 'Central and Western District', NULL, NULL, NULL, 810100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810102, '湾仔区', 'Wan Chai District', NULL, NULL, NULL, 810100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810103, '东区', 'Eastern District', NULL, NULL, NULL, 810100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810104, '南区', 'Southern District', NULL, NULL, NULL, 810100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810200, '九龙', 'Kowloon', NULL, NULL, NULL, 810000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810201, '油尖旺区', 'Yau Tsim Mong', NULL, NULL, NULL, 810200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810202, '深水埗区', 'Sham Shui Po', NULL, NULL, NULL, 810200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810203, '九龙城区', 'Jiulongcheng', NULL, NULL, NULL, 810200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810204, '黄大仙区', 'Wong Tai Sin', NULL, NULL, NULL, 810200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810205, '观塘区', 'Kwun Tong', NULL, NULL, NULL, 810200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810300, '新界', 'New Territories', NULL, NULL, NULL, 810000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810301, '荃湾区', 'Tsuen Wan', NULL, NULL, NULL, 810300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810302, '屯门区', 'Tuen Mun', NULL, NULL, NULL, 810300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810303, '元朗区', 'Yuen Long', NULL, NULL, NULL, 810300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810304, '北区', 'North District', NULL, NULL, NULL, 810300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810305, '大埔区', 'Tai Po', NULL, NULL, NULL, 810300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810306, '西贡区', 'Sai Kung', NULL, NULL, NULL, 810300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810307, '沙田区', 'Sha Tin', NULL, NULL, NULL, 810300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810308, '葵青区', 'Kwai Tsing', NULL, NULL, NULL, 810300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (810309, '离岛区', 'Outlying Islands', NULL, NULL, NULL, 810300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (820000, '澳门特别行政区', 'Macau', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (820100, '澳门半岛', 'MacauPeninsula', NULL, NULL, NULL, 820000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (820101, '花地玛堂区', 'Nossa Senhora de Fatima', NULL, NULL, NULL, 820100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (820102, '圣安多尼堂区', 'Santo Antonio', NULL, NULL, NULL, 820100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (820103, '大堂区', 'Sé', NULL, NULL, NULL, 820100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (820104, '望德堂区', 'Sao Lazaro', NULL, NULL, NULL, 820100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (820105, '风顺堂区', 'Sao Lourenco', NULL, NULL, NULL, 820100, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (820200, '氹仔岛', 'Taipa', NULL, NULL, NULL, 820000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (820201, '嘉模堂区', 'Our Lady Of Carmel\'s Parish', NULL, NULL, NULL, 820200, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (820300, '路环岛', 'Coloane', NULL, NULL, NULL, 820000, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (820301, '圣方济各堂区', 'St Francis Xavier\'s Parish', NULL, NULL, NULL, 820300, NULL, '2017-08-08 14:48:16', '127.0.0.1');
INSERT INTO `com_config_area` VALUES (900000, '钓鱼岛', 'DiaoyuDao', NULL, NULL, NULL, 0, NULL, '2017-08-08 14:48:16', '127.0.0.1');

-- ----------------------------
-- Table structure for com_config_pay
-- ----------------------------
DROP TABLE IF EXISTS `com_config_pay`;
CREATE TABLE `com_config_pay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pay_fee` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '付款金额（cny）',
  `pay_gold` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '获取金币数量',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1119498104577953794 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '付款金币配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of com_config_pay
-- ----------------------------
INSERT INTO `com_config_pay` VALUES (2, 10.00000000, 15.00000000, '2019-04-20 15:04:46', '2019-04-20 15:07:14');
INSERT INTO `com_config_pay` VALUES (3, 10.00000000, 15.00000000, '2019-04-20 15:06:31', '2019-04-20 15:07:20');
INSERT INTO `com_config_pay` VALUES (1119498007387541506, 10.00000000, 15.00000000, '2019-04-20 15:08:19', '2019-04-20 15:08:18');
INSERT INTO `com_config_pay` VALUES (1119498104577953793, 10.00000000, 15.00000000, '2019-04-20 15:08:42', '2019-04-20 15:08:42');
INSERT INTO `com_config_pay` VALUES (1119498104577953794, 0.00000000, 0.00000000, NULL, '2019-04-20 15:09:59');

-- ----------------------------
-- Table structure for com_config_pay_channel
-- ----------------------------
DROP TABLE IF EXISTS `com_config_pay_channel`;
CREATE TABLE `com_config_pay_channel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式名字',
  `start_status` tinyint(2) NULL DEFAULT NULL COMMENT '启用状态：-1停用 1：停用',
  `pay_channel_type` tinyint(2) NULL DEFAULT NULL COMMENT '1，支付宝 2，微信 3，银联',
  `pay_in_out_type` tinyint(2) NULL DEFAULT NULL COMMENT '1，入 2，出',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for com_config_service
-- ----------------------------
DROP TABLE IF EXISTS `com_config_service`;
CREATE TABLE `com_config_service`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客服账号',
  `qr_code_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码路径',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `type` tinyint(3) NULL DEFAULT NULL COMMENT '客服类型1，qq 2，微信 3，邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of com_config_service
-- ----------------------------
INSERT INTO `com_config_service` VALUES (1, '1', '1', NULL, '2019-04-20 14:14:06', NULL);

-- ----------------------------
-- Table structure for com_config_sys
-- ----------------------------
DROP TABLE IF EXISTS `com_config_sys`;
CREATE TABLE `com_config_sys`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置的key键名',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置的val值',
  `type` tinyint(3) NULL DEFAULT NULL COMMENT '配置分组(1-网站信息;2-网站协议;3-法币交易;4-币币交易;5-杠杆交易;6-短信设置;7-充/提设置;8-平台账户,9-关于我们,10-APP轮播图,11-集团信息)',
  `name_notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of com_config_sys
-- ----------------------------
INSERT INTO `com_config_sys` VALUES (27, 'store_name', '牛', 1, '网站名字');
INSERT INTO `com_config_sys` VALUES (29, 'store_title', '牛', 1, '网站标题');
INSERT INTO `com_config_sys` VALUES (33, 'store_phone', '18000000000', 1, '联系电话');
INSERT INTO `com_config_sys` VALUES (34, 'store_email', 'suda@163.com', 1, '联系邮箱');
INSERT INTO `com_config_sys` VALUES (35, 'store_address', 'suda', 1, '联系地址');
INSERT INTO `com_config_sys` VALUES (36, 'store_copyright', 'Copyright 2016-2023 数据库 All Rights Reserved. Powered by HREX.11111', 1, '网站归属权');

-- ----------------------------
-- Table structure for com_config_viewpager
-- ----------------------------
DROP TABLE IF EXISTS `com_config_viewpager`;
CREATE TABLE `com_config_viewpager`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#',
  `type` tinyint(3) NOT NULL DEFAULT 1 COMMENT '图片类型：1.app 2.pc',
  `sort` int(25) NULL DEFAULT 1 COMMENT '排序字段',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '轮播图配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of com_config_viewpager
-- ----------------------------
INSERT INTO `com_config_viewpager` VALUES (18, '#', 1, 1, NULL, '2019-05-07 15:53:30');

-- ----------------------------
-- Table structure for com_config_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `com_config_withdraw`;
CREATE TABLE `com_config_withdraw`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `min_fee` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '最大提现',
  `max_fee` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '最小提现',
  `isDisable` tinyint(1) NULL DEFAULT 0 COMMENT '0:不禁用 1：禁用',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '提现额度设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of com_config_withdraw
-- ----------------------------
INSERT INTO `com_config_withdraw` VALUES (1, 10.00000000, 60.00000000, 0, NULL, '2019-04-20 15:40:46');

-- ----------------------------
-- Table structure for com_screen_notice
-- ----------------------------
DROP TABLE IF EXISTS `com_screen_notice`;
CREATE TABLE `com_screen_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `details` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告内容',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '弹屏公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of com_screen_notice
-- ----------------------------
INSERT INTO `com_screen_notice` VALUES (1, '哈哈', '真的吗', '2019-04-20 15:59:22');

-- ----------------------------
-- Table structure for content_message
-- ----------------------------
DROP TABLE IF EXISTS `content_message`;
CREATE TABLE `content_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock_user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `stock_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `reply_user_id` bigint(20) NULL DEFAULT NULL COMMENT '回复者ID',
  `reply_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复者姓名',
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `reply_time` datetime(0) NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '1:删除，0:未删除',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of content_message
-- ----------------------------
INSERT INTO `content_message` VALUES (1, 63, '李小白', NULL, '1111111', NULL, NULL, NULL, NULL, '2018-10-12 10:37:28', 0, '2018-10-12 10:37:31');

-- ----------------------------
-- Table structure for content_news
-- ----------------------------
DROP TABLE IF EXISTS `content_news`;
CREATE TABLE `content_news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `img_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻来源',
  `details` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻内容',
  `content_type` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '新闻类型 默认为0 方便以后扩展',
  `is_show` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否展示 默认为1 展示',
  `is_top` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否置顶 默认为0 不置顶（推荐）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '1:删除，0:未删除',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司新闻' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of content_news
-- ----------------------------
INSERT INTO `content_news` VALUES (1, NULL, '`的撒撒旦`', NULL, NULL, '的撒反对方式上的负担十分', NULL, 1, 0, '2018-10-12 10:37:35', 0, '2019-03-07 18:47:05');
INSERT INTO `content_news` VALUES (2, NULL, '我认为', NULL, NULL, '为而为', 0, 1, 0, '2019-03-05 14:17:22', 0, '2019-03-07 18:23:03');
INSERT INTO `content_news` VALUES (3, NULL, '是否', 'https://hrex.oss-cn-hongkong.aliyuncs.com/file/e8484b2204a743c9b296261c513e0b79.jpg?x-oss-process=image/resize,w_300,h_300/quality,q_100', '212', '<p id=\"news_details_p\"></p><p id=\"news_details_p\"></p><p id=\"news_details_p\"></p><p id=\"news_details_p\"></p><p id=\"news_details_p\"></p><p id=\"news_details_p\"></p><p id=\"news_details_p\"></p><p id=\"news_details_p\"></p><p id=\"news_details_p\"></p><p id=\"news_details_p\"></p><p id=\"news_details_p\">是否是</p><p><br><img src=\"https://hrex.oss-cn-hongkong.aliyuncs.com/file/1e579471d43142c38e6480d91e5bceed.jpg?x-oss-process=image/resize,w_300,h_300/quality,q_100\" style=\"max-width:100%;\"></p><p></p><p><br></p><p></p><p><br></p><p></p><p><br></p><p></p><p><br></p><p></p><p><br></p><p></p><p><br></p><p></p><p><br></p><p></p><p><br></p><p></p><p><br></p><p></p><p><br></p>', 0, 1, 0, '2019-03-14 14:17:29', 0, '2019-03-12 20:20:44');
INSERT INTO `content_news` VALUES (4, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, NULL, 1, '2019-03-07 18:47:14');

-- ----------------------------
-- Table structure for content_notice
-- ----------------------------
DROP TABLE IF EXISTS `content_notice`;
CREATE TABLE `content_notice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `details` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '1:删除，0:未删除',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of content_notice
-- ----------------------------
INSERT INTO `content_notice` VALUES (1, NULL, 'H-REX交易所上线通知', '<p>H-REX交易所上线了，欢迎全球的投资者在本平台交易。</p>', '2017-11-18 09:00:00', 1, '2019-01-02 16:50:49');
INSERT INTO `content_notice` VALUES (2, NULL, 'test', '222', '2018-08-05 23:12:12', 1, '2018-08-15 14:15:48');
INSERT INTO `content_notice` VALUES (3, NULL, 'test', 'test', '2018-08-05 23:12:12', 1, '2018-12-05 20:56:54');
INSERT INTO `content_notice` VALUES (4, NULL, '2222222222', '1111111111', '2018-10-12 10:01:01', 1, '2018-10-12 10:01:40');
INSERT INTO `content_notice` VALUES (5, NULL, '今天会下雪的通知', '<p>天气预报说:&quot;今天会下雪&quot;.<br/></p>', '2018-12-05 00:00:00', 1, '2018-12-05 20:18:30');
INSERT INTO `content_notice` VALUES (6, NULL, '今天中午吃宴席的通知', '<p>天气严寒,为了防冻,今天特此通知,吃火锅.</p>', '2018-12-05 00:00:00', 1, '2018-12-05 20:18:28');
INSERT INTO `content_notice` VALUES (7, NULL, '今天多喝水的通知.', '<p>今天多喝水,防冻,防寒.</p>', '2018-12-05 00:00:00', 1, '2018-12-05 20:18:25');
INSERT INTO `content_notice` VALUES (8, NULL, '明天会更好的通知', '<p>我相信,我们今天做的好,明天会更好.</p>', '2018-12-05 00:00:00', 1, '2018-12-05 20:18:23');
INSERT INTO `content_notice` VALUES (9, NULL, '今天会不会值日', '<p>有时候,我们想,我们会不会值日.</p>', '2018-12-05 00:00:00', 1, '2018-12-05 20:18:21');
INSERT INTO `content_notice` VALUES (10, NULL, '请说出你内心事', '<p>我们知道,我们会做什么,有什么烦心事.</p>', '2018-12-05 00:00:00', 1, '2018-12-05 20:18:19');
INSERT INTO `content_notice` VALUES (11, NULL, '我们只有这样,才会更好', '<p>我们相信,只有跟着党走,明天的日子会更好.</p>', '2018-12-05 00:00:00', 1, '2018-12-05 20:18:17');
INSERT INTO `content_notice` VALUES (12, NULL, '在希望的田野上.', '<p>在希望的田野上.</p>', '2018-12-05 00:00:00', 1, '2018-12-05 20:18:14');
INSERT INTO `content_notice` VALUES (13, NULL, '春天里', '<p>冬天来了,春天还会远吗?</p>', '2018-12-05 00:00:00', 1, '2018-12-05 20:18:12');
INSERT INTO `content_notice` VALUES (14, NULL, '大雪', '<p><span style=\"font-size: 18px;\">大雪节气，太阳黄经达255度。大雪，顾名思义，雪量大。古人云：“大者，盛也，至此而雪盛也”。到了这个时段，雪往往下得大、范围也广。</span></p><p><span style=\"font-size: 18px;\">这时我国大部分地区的最低温度都降到了0℃或以下。往往在强冷空气前沿冷暖空气交锋的地区，会降大雪，甚至暴雪。可见，大雪节气是表示这一时期，降大雪的起始时间和雪量程度，它和小雪、雨水、谷雨等节气一样，都是直接反映降水的节气。</span></p><p><span style=\"font-size: 18px;\">大雪时节分为三候：“一候鹖鴠不鸣；二候虎始交；三候荔挺出。”是说此时因天气寒冷，寒号鸟也不再鸣叫了；此时是阴气最盛时期，所谓盛极而衰，阳气已有所萌动，老虎开始有求偶行为；“荔挺”为兰草的一种，感到阳气的萌动而抽出新芽。</span></p><p><span style=\"font-size: 18px;\">常说，“瑞雪兆丰年”。严冬积雪覆盖大地，保持地面及作物周围的温度不会因寒流侵袭而降得很低，冬作物创造了良好的越冬环境。积雪融化时又增加了土壤水分含量，供作物春季生长的需要。雪水中氮化物的含量是普通雨水的5倍，有一定的肥田作用。有“今年麦盖三层被，来年枕着馒头睡”的农谚。</span></p><p><br/></p>', '2018-12-06 00:00:00', 1, '2019-01-01 17:37:08');
INSERT INTO `content_notice` VALUES (15, NULL, 'H-REX 承兑商招募公告 ', '<p style=\"white-space: normal;\">&nbsp;因近期H-REX&nbsp;用户C2C交易上涨<br/>交易活跃，需求量大<br/>H-REX&nbsp;现向全球招募法币交易区承立商</p><p style=\"white-space: normal;\"><br/>招标如下：<br/>1，年龄20-60岁之间能够正常使用普通话交流<br/>2，二品行端正，无不良个人记录数字<br/>3，具备数字货币相关基础知识<br/>4，了解H-REX&nbsp;法交易规则及操作流程<br/>5，具备一定的经济能力</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">申请函标准：</p><p style=\"white-space: normal;\">将您的个人资料（身份证正/反面照片，手持身份证照片，手机号码）<br/>发送到H-REX 官网邮箱：hrexpro@hotmail.com(备注“承兑商申请”）<br/>审核通过后官方会第一时间将以邮件的形式通知您，谢谢参与！</p><p><br/></p>', '2017-11-28 09:00:00', 0, '2019-01-03 15:43:55');
INSERT INTO `content_notice` VALUES (16, NULL, '关于H-REX升级公告', '<p><br/></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">亲爱的</span><span style=\"font-family: 宋体; letter-spacing: 0px;\">H-REX</span><span style=\"font-family: 宋体; letter-spacing: 0px;\">用户</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">您好！</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">为了更好的服务广大用户，我们将在2018年11月25日14:30—16：:30</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">对交易所服务器进行优化升级，升级期间，将无法登陆您的账户，请广</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">大用户提前做好平仓及止损止盈，以免造成风险损失！</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">H-REX</span><span style=\"font-family: 宋体; letter-spacing: 0px;\">交易所</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">2018年4月5日</span></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>', '2018-04-05 10:00:00', 0, '2019-01-01 19:33:26');
INSERT INTO `content_notice` VALUES (17, NULL, '关于强平说明', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">关于强平：强平是指您的爆仓率达到70%时，系统会自动止损</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp; &nbsp; &nbsp; 如果您在持有单的情况下再建仓，请您务必提前关注您账户里</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">面的动态权益，动态权益是您当期实时的可用资金，如需再建仓时</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">，需先考虑到您的资金是否支持您再下单，强行下单会导致您整单</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">爆仓。</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">动态权益以及爆仓率公式：</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">1，动态权益=余额+建仓及委托（保证金）+浮动盈亏</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">2，爆仓率=动态权益/保证金*100%（当爆仓率达到70%，系统会自动强平）</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">（具体交易规格请参照官网的交易规格）</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">温馨提示：用户建仓位高于30%，都属于高风险建仓！</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">交易有风险，一定请谨慎操作！</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">H-REX</span><span style=\"font-family: 宋体; letter-spacing: 0px;\">X交易所</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">2018年5月6日</span></p><p><span style=\"font-family: 宋体; letter-spacing: 0px;\"><br/></span></p><p><br/></p>', '2018-05-06 17:00:00', 1, '2019-01-02 16:50:45');
INSERT INTO `content_notice` VALUES (18, NULL, '关于H-REX手续费活动', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">活动声明</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">为感谢</span><span style=\"font-family: 宋体; letter-spacing: 0px;\">H-REX</span><span style=\"font-family: 宋体; letter-spacing: 0px;\">用户的信任与支持，交易所将于2018年11月27日12：00起</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">手续费调降至双边：0.03%</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">活动时间：11月27—12月27日</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">H-REX</span><span style=\"font-family: 宋体; letter-spacing: 0px;\">交易所</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体; letter-spacing: 0px;\">2018年6月18日</span></p><p style=\"white-space: normal;\"><br/></p>', '2018-06-18 17:00:00', 0, '2019-01-03 15:44:08');
INSERT INTO `content_notice` VALUES (19, NULL, '关于手续费恢复', '<p>亲爱的H-REX用户</p><p>&nbsp;您好！</p><p>手续费活动已圆满结束，现在恢复至双边0.04%，请知悉！</p><p>H-REX交易所</p><p>2018年10月7日</p>', '2018-10-07 16:00:00', 0, '2019-01-07 11:48:28');
INSERT INTO `content_notice` VALUES (20, NULL, '服务器维护通知', '<p>尊敬的用户：</p><p><br/></p><p>为了提升用户体验，&nbsp; &nbsp; H-REX的币币交易和合约交易页面将于2019年1月7日12：00-13:00 (GMT+8)全新升级。改版后，页面结构优化，视觉换新，体验更流畅。</p><p><br/></p><p><br/></p><p>H-REX交易所<br/></p><p>2019年1月7日</p><p><br/></p>', '2019-01-07 12:00:00', 0, '2019-01-08 12:01:06');
INSERT INTO `content_notice` VALUES (21, NULL, '服务器维护通知', '<p>尊敬的用户：</p><p><br/></p><p><br/></p><p><br/></p><p>为了提升用户体验， &nbsp; &nbsp;H-REX的币币交易和合约交易页面将于2019年1月8日12：00-13:00 (GMT+8)全新升级。改版后，页面结构优化，视觉换新，体验更流畅。</p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>H-REX交易所</p><p><br/></p><p>2019年1月8日</p><p><br/></p><p><br/></p>', '2019-01-08 00:00:00', 0, '2019-01-08 11:59:10');
INSERT INTO `content_notice` VALUES (22, NULL, '服务器短暂维护', '<p>尊敬的用户：</p><p>为了提升用户体验， H-REX的币币交易和合约交易页面将于2019年1月9日12：00-13:00 (GMT+8)进行系统维护升级。</p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;H-REX交易所</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2019年1月9日<br/></p><p><br/></p>', '2019-01-09 00:00:00', 0, '2019-01-09 11:49:56');
INSERT INTO `content_notice` VALUES (23, NULL, '服务器12点到13点升级维护', '<p style=\"white-space: normal;\">尊敬的用户：</p><p style=\"white-space: normal;\">为了提升用户体验， H-REX的币币交易和合约交易页面将于2019年1月10日12：00-13:00 (GMT+8)进行系统维护升级。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;H-REX交易所</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2019年1月10日</p><p><br/></p>', '2019-01-10 00:00:00', 0, '2019-01-10 11:35:53');

-- ----------------------------
-- Table structure for log_admin_agent
-- ----------------------------
DROP TABLE IF EXISTS `log_admin_agent`;
CREATE TABLE `log_admin_agent`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求地址',
  `request_way` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求方式',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'IP',
  `method_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '方法地址',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '方法别名',
  `request_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求参数',
  `return_param` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '返回参数',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '耗时',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `operator_id` bigint(255) NULL DEFAULT NULL COMMENT '操作人id',
  `operator_platform` tinyint(2) NULL DEFAULT 1 COMMENT '1,admin，2，agent',
  `login_facility` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录设备',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_admin_agent
-- ----------------------------
INSERT INTO `log_admin_agent` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL);

-- ----------------------------
-- Table structure for log_app_pc
-- ----------------------------
DROP TABLE IF EXISTS `log_app_pc`;
CREATE TABLE `log_app_pc`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求地址',
  `request_way` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求方式',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'IP',
  `method_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '方法地址',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '方法别名',
  `request_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求参数',
  `return_param` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '返回参数',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '耗时',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `operator_id` bigint(20) NULL DEFAULT NULL COMMENT '操作人id',
  `operator_platform` tinyint(2) NULL DEFAULT 1 COMMENT '1,app',
  `login_facility` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录设备',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_app_pc
-- ----------------------------
INSERT INTO `log_app_pc` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL);

-- ----------------------------
-- Table structure for product_activity_take_user
-- ----------------------------
DROP TABLE IF EXISTS `product_activity_take_user`;
CREATE TABLE `product_activity_take_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_info_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `stock_user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `win_prize_status` tinyint(1) NULL DEFAULT 0 COMMENT '0:未中奖 1:中奖',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `get_status` tinyint(1) NULL DEFAULT 0 COMMENT '0:未领取 1:已领取',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品活动参与人员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_activity_take_user
-- ----------------------------
INSERT INTO `product_activity_take_user` VALUES (1, 1, 1, 0, NULL, '2019-05-08 17:48:25', NULL);

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名字',
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品封面图',
  `banner_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品轮播图',
  `info_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情',
  `product_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品说明',
  `product_parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品参数',
  `inventory_num` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '产品库存',
  `sales_volume` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '产品销量',
  `real_sales_volume` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '产品真实销量',
  `sell_price` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '售卖价格',
  `stock_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品售卖币种',
  `product_partition_type_id` bigint(20) NULL DEFAULT NULL COMMENT '产品分区id',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '0:未删除 1:删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_activity` tinyint(1) NULL DEFAULT 0 COMMENT '0:不是活动商品 1:是活动商品',
  `prize_countdown` datetime(0) NULL DEFAULT NULL COMMENT '开奖倒计时',
  `apply_num` bigint(11) NULL DEFAULT 0 COMMENT '报名人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品种类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, 0, NULL, '2019-05-08 17:48:57', 0, NULL, 0);

-- ----------------------------
-- Table structure for product_partition_type
-- ----------------------------
DROP TABLE IF EXISTS `product_partition_type`;
CREATE TABLE `product_partition_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partition_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区名字',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区详情',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '0:未删除 1:删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品分区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_partition_type
-- ----------------------------
INSERT INTO `product_partition_type` VALUES (1, '精品专区', NULL, 0, NULL, '2019-05-08 11:09:17');
INSERT INTO `product_partition_type` VALUES (2, '优选热销', NULL, 0, NULL, '2019-05-08 11:09:35');

-- ----------------------------
-- Table structure for product_specification_type
-- ----------------------------
DROP TABLE IF EXISTS `product_specification_type`;
CREATE TABLE `product_specification_type`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `colour` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色（白色,黑色）',
  `model_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号（大码,标准）',
  `product_info_id` bigint(11) NULL DEFAULT NULL COMMENT '商品id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_info_id`(`product_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品规格列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_specification_type
-- ----------------------------
INSERT INTO `product_specification_type` VALUES (1, '白色,黑色', '大码,标准', 1, '2019-05-08 15:38:32', '2019-05-08 15:45:33');

-- ----------------------------
-- Table structure for stock_code
-- ----------------------------
DROP TABLE IF EXISTS `stock_code`;
CREATE TABLE `stock_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock_code` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种编码',
  `stock_code_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种名字',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种备注信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `timestamp` timestamp(0) NULL DEFAULT NULL,
  `stock_code_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种图片',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `stock_code`(`stock_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统币种' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_code
-- ----------------------------
INSERT INTO `stock_code` VALUES (1, 'TC', '商城币', NULL, NULL, NULL, NULL);
INSERT INTO `stock_code` VALUES (2, 'ETH', '以太坊', NULL, NULL, NULL, NULL);
INSERT INTO `stock_code` VALUES (3, 'SDT', '速达币', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for stock_user
-- ----------------------------
DROP TABLE IF EXISTS `stock_user`;
CREATE TABLE `stock_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `user_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录帐号',
  `tel` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱|帐号',
  `pswd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码，使用md5加密',
  `trade_pwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易密码',
  `device_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `invitation_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `agent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级代理id',
  `inspector_id` bigint(20) NULL DEFAULT NULL COMMENT '审核者ID',
  `inspect_auth_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核原因',
  `inspect_auth_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `inspect_auth_status` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '1:未认证 2:待审核 3:已认证 4:审核未通过',
  `is_real` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT ' 0:模拟用户 false 1:真实用户 true',
  `is_disable` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '0:未禁用 1：禁用',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '0:未删除 1:删除',
  `is_staff` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否是经纪人 1:是，0:否',
  `is_shop` tinyint(1) NULL DEFAULT 0 COMMENT '是否是商家 0：false 不是商家  1：true 是商家',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `invitation_id` bigint(20) NULL DEFAULT 0 COMMENT '上级经纪人id',
  `invitation_path` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推荐邀请关系树',
  `staff_inspect_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请经济人拒绝原因',
  `staff_inspect_time` datetime(0) NULL DEFAULT NULL COMMENT '经济人审核时间',
  `staff_apply_status` tinyint(3) NULL DEFAULT 1 COMMENT '经纪人申请状态1.未申请 2.已申请(待审核）3.同意 4.拒绝',
  `shop_inspect_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请商家拒绝原因',
  `shop_inspect_time` datetime(0) NULL DEFAULT NULL COMMENT '商家审核时间',
  `shop_inspect_status` tinyint(3) NULL DEFAULT 1 COMMENT '商家申请状态1.未申请 2.已申请(待审核）3.同意 4.拒绝 5.已解绑',
  `shop_frost_fund` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '成为商家冻结保证金',
  `concession_ratio` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '佣金比例',
  `user_charge_rate` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '用户单独设置手续费比例',
  `head_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_unique_index`(`user_uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 177 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '手机用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stock_user
-- ----------------------------
INSERT INTO `stock_user` VALUES (1, NULL, 'zzy', NULL, '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, '2019-04-24 14:41:27', 0, NULL, NULL, NULL, 1, NULL, NULL, 1, 0.00000000, 0.00000000, 0.00000000, NULL);

-- ----------------------------
-- Table structure for stock_user_capital_fund
-- ----------------------------
DROP TABLE IF EXISTS `stock_user_capital_fund`;
CREATE TABLE `stock_user_capital_fund`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock_user_id` bigint(20) NOT NULL COMMENT '用户id',
  `stock_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种编码',
  `stock_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '币种名字',
  `usable_fund` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '可用',
  `in_all_fee` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '总充值金额',
  `out_all_fee` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '总提现金额',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_id_code`(`stock_user_id`, `stock_code`) USING BTREE,
  INDEX `stock_user_id`(`stock_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1451 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人资产' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stock_user_capital_fund
-- ----------------------------
INSERT INTO `stock_user_capital_fund` VALUES (1, 1, 'TC', NULL, 30.00000000, 0.00000000, 0.00000000, NULL, '2019-05-08 10:42:08');

-- ----------------------------
-- Table structure for stock_user_charge
-- ----------------------------
DROP TABLE IF EXISTS `stock_user_charge`;
CREATE TABLE `stock_user_charge`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '付款金币获取数量',
  `swift_no` char(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流水号: 四位项目简称 + yyyyMMddHHmmSS + 4位随机数 + 账号后4位',
  `stock_user_id` bigint(20) NULL DEFAULT NULL COMMENT '手机用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `pay_fee` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '付款金额',
  `pay_gold` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '付款金币数量',
  `real_pay_fee` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '真实金额',
  `real_pay_gold` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '真实金币',
  `charge_type` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '出入金类型 1:入金，2:出金',
  `pay_type` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '支付类型：1在线2人工充值',
  `withdraw_status` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '支付状态:1:未支付，2：支付成功 3：支付失败 4:处理中',
  `inspector_id` bigint(20) NULL DEFAULT NULL COMMENT '审核者ID',
  `inspect_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核原因/备注',
  `inspect_time` datetime(0) NULL DEFAULT NULL COMMENT '审核/确认时间',
  `inspect_status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '审核状态 0:待审核 1:已审核 2:拒绝 3:审核中',
  `poundage` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '手续费',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '1:删除，0:未删除',
  `tranId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '三方支付平台的流水号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户出入金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_user_concession
-- ----------------------------
DROP TABLE IF EXISTS `stock_user_concession`;
CREATE TABLE `stock_user_concession`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_user_id` int(11) NULL DEFAULT 0 COMMENT '手机用户id',
  `stock_user_up_id` int(11) NULL DEFAULT 0 COMMENT '手机用户上级id',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '代理id',
  `yy_id` int(11) NULL DEFAULT 0 COMMENT '运营中心（会员单位id）',
  `entrust_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '委托单号',
  `stock_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '股票代码',
  `stock_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '股票名字',
  `entrust_count` int(11) NULL DEFAULT 0 COMMENT '交易股数',
  `hand_num` int(11) NULL DEFAULT 0 COMMENT '交易手数',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `user_return_fee` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '手机用户返佣金额',
  `user_return_ratio` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '手机用户返佣比例',
  `yy_return_fee` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '运营中心返佣金额',
  `yy_return_ratio` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '运营中心佣金比例',
  `usd_fee` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '实际手续费',
  `create_time` varchar(21) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_return` tinyint(1) NULL DEFAULT 0 COMMENT '佣金是否已返(1:是，0:否)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '佣金记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_user_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_user_info`;
CREATE TABLE `stock_user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock_user_id` bigint(20) NULL DEFAULT NULL COMMENT '手机用户id',
  `bank_card_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bank_card_union_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银联号',
  `bank_card_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡类型',
  `bank_card_type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡类型编码',
  `bank_card_open_bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `bank_card_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡图片',
  `bank_card_expired_time` datetime(0) NULL DEFAULT NULL COMMENT '银行卡过期时间',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地点',
  `id_card_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `id_card_front_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证正面照',
  `id_card_back_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证背面照',
  `id_card_start_time` datetime(0) NULL DEFAULT NULL COMMENT '身份证有效期开始时间',
  `id_card_end_time` datetime(0) NULL DEFAULT NULL COMMENT '身份证有效期结束时间',
  `selfie_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自拍照',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '1:删除，0:未删除',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `sex` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '性别 0:男 ，1女',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `stock_user_id_unique_index`(`stock_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '手机用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_user_money_detail
-- ----------------------------
DROP TABLE IF EXISTS `stock_user_money_detail`;
CREATE TABLE `stock_user_money_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock_user_id` bigint(20) NULL DEFAULT NULL COMMENT '手机用户id',
  `stock_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种类型',
  `money` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '发生金额',
  `money_before` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '发生前金额',
  `money_after` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '发生后金额',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type` tinyint(3) UNSIGNED NULL DEFAULT 1,
  `type_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源表id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '1:删除，0:未删除',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `water_type` tinyint(2) NULL DEFAULT 2 COMMENT '1:后台操作，2:正常流水',
  `income` tinyint(1) NULL DEFAULT NULL COMMENT '0：支出 1：收入',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stock_user_id_index`(`stock_user_id`, `stock_code`, `type`, `type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19892 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户资金明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stock_user_money_detail
-- ----------------------------
INSERT INTO `stock_user_money_detail` VALUES (19891, 1, 'TC', 20.00000000, 10.00000000, 30.00000000, '111', 1, NULL, '2019-05-08 10:42:10', 0, '2019-05-08 10:42:09', 1, NULL);

-- ----------------------------
-- Table structure for turnplate_prize_1
-- ----------------------------
DROP TABLE IF EXISTS `turnplate_prize_1`;
CREATE TABLE `turnplate_prize_1`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'TC' COMMENT '币种编码 SDT ，TC，ETH，',
  `prize_num` decimal(20, 8) NULL DEFAULT 0.00000000 COMMENT '奖品数量',
  `prize_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '商城币' COMMENT '奖品名称',
  `ratio` decimal(25, 8) NULL DEFAULT 0.00000000 COMMENT '奖品比例',
  `prize_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖品图片url',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '0：未删除 1：已删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `timestamp` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大转盘奖品1' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of turnplate_prize_1
-- ----------------------------
INSERT INTO `turnplate_prize_1` VALUES (9, 'ETH', 0.10000000, '50ETH', 10.00000000, '---', 0, NULL, '2019-05-07 14:39:26');
INSERT INTO `turnplate_prize_1` VALUES (10, 'TC', 0.00000000, '商城币', 0.00000000, NULL, 0, NULL, '2019-05-07 11:28:26');
INSERT INTO `turnplate_prize_1` VALUES (11, 'TC', 0.00000000, '商城币', 0.00000000, NULL, 0, NULL, '2019-05-07 11:28:29');
INSERT INTO `turnplate_prize_1` VALUES (12, 'TC', 0.00000000, '商城币', 0.00000000, NULL, 0, NULL, '2019-05-07 11:28:29');
INSERT INTO `turnplate_prize_1` VALUES (13, 'TC', 0.00000000, '商城币', 0.00000000, NULL, 0, NULL, '2019-05-07 11:28:30');
INSERT INTO `turnplate_prize_1` VALUES (14, 'TC', 0.00000000, '商城币', 0.00000000, NULL, 0, NULL, '2019-05-07 11:28:31');
INSERT INTO `turnplate_prize_1` VALUES (15, 'TC', 0.00000000, '商城币', 0.00000000, NULL, 0, NULL, '2019-05-07 11:28:33');

SET FOREIGN_KEY_CHECKS = 1;
