/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : wms

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 16/02/2023 15:30:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货名',
  `storage` int NOT NULL COMMENT '仓库',
  `goodsType` int NOT NULL COMMENT '分类',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '牙刷', 2, 3, 198, '名牌');
INSERT INTO `goods` VALUES (2, '华为手机', 1, 1, 1008, '只限今年售卖');
INSERT INTO `goods` VALUES (3, '避孕药', 3, 2, 10933, '男女慎用');

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES (1, '电子产品', '手机、电脑、平板、单反');
INSERT INTO `goodstype` VALUES (2, '医疗用品', '感冒药、退烧药、避孕药');
INSERT INTO `goodstype` VALUES (3, '生活用品', '牙刷、毛巾、洗面奶');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL,
  `menuCode` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编码',
  `menuName` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名字',
  `menuLevel` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单级别',
  `menuParentCode` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单的父code',
  `menuClick` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点击触发的函数',
  `menuRight` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限 0超级管理员，1表示管理员，2表示普通用户，可以用逗号组合使用',
  `menuComponent` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menuIcon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '001', '管理员管理', '1', NULL, 'Admin', '0', 'admin/AdminManage.vue', 'el-icon-s-custom');
INSERT INTO `menu` VALUES (2, '002', '用户管理', '1', NULL, 'User', '0,1', 'user/UserManage.vue', 'el-icon-user-solid');
INSERT INTO `menu` VALUES (3, '003', '仓库管理', '1', NULL, 'Storage', '0,1', 'storage/StorageManage', 'el-icon-office-building');
INSERT INTO `menu` VALUES (4, '004', '物品分类管理', '1', NULL, 'Goodstype', '0,1', 'goodstype/GoodstypeManage', 'el-icon-menu');
INSERT INTO `menu` VALUES (5, '005', '物品管理 ', '1', NULL, 'Goods', '0,1,2', 'goods/GoodsManage', 'el-icon-s-management');
INSERT INTO `menu` VALUES (6, '006', '记录管理', '1', NULL, 'Record', '0,1,2', 'record/RecordManage', 'el-icon-s-order');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods` int NOT NULL COMMENT '货品id',
  `userId` int NULL DEFAULT NULL COMMENT '取货人/补货人',
  `admin_id` int NULL DEFAULT NULL COMMENT '操作人id',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  `createtime` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, 2, 4, 1, 9, '2023-02-16 15:26:02', '半价');
INSERT INTO `record` VALUES (2, 1, 3, 1, 99, '2023-02-16 15:26:29', '名牌');
INSERT INTO `record` VALUES (3, 3, 5, 1, 999, '2023-02-16 15:27:04', '私生活混乱');
INSERT INTO `record` VALUES (4, 3, 4, 1, -65, '2023-02-16 15:28:06', '急需');

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库名',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES (1, '上海仓库', '上海各区仓库管理');
INSERT INTO `storage` VALUES (2, '杭州仓库', '杭州各区仓库管理');
INSERT INTO `storage` VALUES (3, '苏州仓库', '苏州各区仓库管理');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `age` int NULL DEFAULT NULL,
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `role_id` int NULL DEFAULT NULL COMMENT '角色 0超级管理员，1管理员，2普通账号',
  `isValid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '是否有效，Y有效，其他无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '超级管理员', 'root', 18, 1, '13215227869', 0, 'Y');
INSERT INTO `user` VALUES (2, 'sa', '管理员', 'root', 19, 0, '13215223466', 1, 'Y');
INSERT INTO `user` VALUES (3, 'gaze', '用户1', '123456', 29, 1, '13215228462', 2, 'Y');
INSERT INTO `user` VALUES (4, 'marin', '用户2', '123456', 18, 1, '18866669998', 2, 'Y');
INSERT INTO `user` VALUES (5, 'susic', '用户3', '123456', 22, 0, '13700000044', 2, 'Y');
INSERT INTO `user` VALUES (6, 'suke', '用户4', '123456', 32, 1, '18866669998', 1, 'Y');

SET FOREIGN_KEY_CHECKS = 1;
