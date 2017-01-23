/*
Navicat MySQL Data Transfer

Source Server         : localhost-mysql
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : jfinaluibv4

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2017-01-23 15:12:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pt_department`
-- ----------------------------
DROP TABLE IF EXISTS `pt_department`;
CREATE TABLE `pt_department` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `allchildnodeids` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `departmentlevel` bigint(20) DEFAULT NULL,
  `depttype` char(1) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `images` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `isparent` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `orderids` bigint(20) DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `parentdepartmentids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `principaluserids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_department
-- ----------------------------
INSERT INTO `pt_department` VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', null, '-1', null, '根节点', '1_open.png', 'true', '公司部门组织结构', '1', '#', null, null);
INSERT INTO `pt_department` VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', null, '0', null, '系统平台部', '2.png', 'true', '系统平台部', '0', null, '8a40c0353fa828a6013fa898d4ac0026', null);
INSERT INTO `pt_department` VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', null, '0', null, '运维部', '3.png', 'false', '运维部', '0', null, '8a40c0353fa828a6013fa898d4ac0027', '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO `pt_department` VALUES ('8a40c0353fa828a6013fa898d4ac0029', '0', null, '0', null, '测试账户', '4.png', 'true', '测试部门', '0', null, '8a40c0353fa828a6013fa898d4ac0026', null);
INSERT INTO `pt_department` VALUES ('8a40c0353fa828a6013fa898d4ac0030', '0', null, '0', null, '子部门2', '5.png', 'true', '平台组', '0', null, '8a40c0353fa828a6013fa898d4ac0029', '03a44ba0aa4e4905bea726d4da976ba5');

-- ----------------------------
-- Table structure for `pt_dict`
-- ----------------------------
DROP TABLE IF EXISTS `pt_dict`;
CREATE TABLE `pt_dict` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `images` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `orderids` bigint(20) DEFAULT NULL,
  `paths` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `zhuangtai` char(1) COLLATE utf8_bin DEFAULT NULL,
  `parentids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `isparent` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `levels` bigint(20) DEFAULT NULL,
  `numbers` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `val` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `i18n` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否国际化',
  `val_zhcn` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `val_zhhk` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `val_zhtw` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `val_ja` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `val_enus` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `status` char(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_dict
-- ----------------------------
INSERT INTO `pt_dict` VALUES ('0c78f87750a745bbb59005a6ca0f744a', '0', null, '3.png', 'weixinToken', '3', '100103root/83f4b0ee56904cbeb5f91696ad804c29/0c78f87750a745bbb59005a6ca0f744a', '1', '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinToken', '123', '1', null, null, null, null, null, '1');
INSERT INTO `pt_dict` VALUES ('10c3fc9a884a4cfc91f47e197913fd50', '1', null, '2.png', '钟祥市', '1', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/10c3fc9a884a4cfc91f47e197913fd50', '1', 'a1f14efbb8cb4e44a30bd32194d0f24b', 'true', '3', 'zhongXiangShi', null, null, '钟祥市', '钟祥市', '钟祥市', '钟祥市', '钟祥市', '1');
INSERT INTO `pt_dict` VALUES ('18a137a0b92944ba857b5dec39b4fa69', '0', null, '2.png', '河南省', '2', '100103root/31b6516f36d44fc280b82affc270c479/18a137a0b92944ba857b5dec39b4fa69', '1', '31b6516f36d44fc280b82affc270c479', 'false', '2', 'heNanSheng', null, '1', '河南省', '河南省', '河南省', '河南省', '河南省', '1');
INSERT INTO `pt_dict` VALUES ('3082e48992104e3ca8c2f542bbcfbe63', '0', null, '2.png', '三室一厅', '1', '100103root/56e8bdbc8d77460da17e473ee30906b0/3082e48992104e3ca8c2f542bbcfbe63', '1', '56e8bdbc8d77460da17e473ee30906b0', 'false', '2', 'sanShiYiTing', null, '1', '三室一厅', '三室一厅', '三室一厅', '三室一厅', '三室一厅', '1');
INSERT INTO `pt_dict` VALUES ('31b6516f36d44fc280b82affc270c479', '2', null, '2.png', '省市区', '1', '100103root/31b6516f36d44fc280b82affc270c479', '1', '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'shengShiQu', null, null, '省市区', '省市区', '省市区', '省市区', '省市区', '1');
INSERT INTO `pt_dict` VALUES ('325acbd77f5b43a894ec4ef53ba20914', '0', null, '2.png', '洪山区', '1', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902/325acbd77f5b43a894ec4ef53ba20914', '1', '64659405a79a4ecb9f116ae84ec55902', 'false', '4', 'hongShanQu', null, '1', '洪山区', '洪山区', '洪山区', '洪山区', '洪山区', '1');
INSERT INTO `pt_dict` VALUES ('405dc683656a4b328de5d5a19d1662d3', '0', null, '2.png', '胡集镇', '1', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/10c3fc9a884a4cfc91f47e197913fd50/405dc683656a4b328de5d5a19d1662d3', null, '10c3fc9a884a4cfc91f47e197913fd50', 'false', '4', 'huJiZhen', null, '1', '胡集镇', '胡集镇', '胡集镇', '胡集镇', '胡集镇', '1');
INSERT INTO `pt_dict` VALUES ('56e8bdbc8d77460da17e473ee30906b0', '0', null, '2.png', '房屋结构', '2', '100103root/56e8bdbc8d77460da17e473ee30906b0', '1', '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'fangWuJieGou', null, '1', '房屋结构', '房屋结构', '房屋结构', '房屋结构', '房屋结构', '1');
INSERT INTO `pt_dict` VALUES ('64659405a79a4ecb9f116ae84ec55902', '0', null, '2.png', '武汉市', '2', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902', '1', 'a1f14efbb8cb4e44a30bd32194d0f24b', 'true', '3', 'wuHanShi', null, '1', '武汉市', '武汉市', '武汉市', '武汉市', '武汉市', '1');
INSERT INTO `pt_dict` VALUES ('7381008292054bccba20224bc33774d7', '6', null, '2.png', 'weixinAppID', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29/7381008292054bccba20224bc33774d7', '1', '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppID', '123', '1', '1234', '1234', '1234', '1234', '1234', '1');
INSERT INTO `pt_dict` VALUES ('8094c60d7a594b36bb0187cbce9c4188', '0', null, '2.png', 'weixinAppSecret', '2', '100103root/83f4b0ee56904cbeb5f91696ad804c29/8094c60d7a594b36bb0187cbce9c4188', '1', '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppSecret', '123', '1', null, null, null, null, null, '1');
INSERT INTO `pt_dict` VALUES ('83f4b0ee56904cbeb5f91696ad804c29', '0', null, '2.png', '微信配置', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29', '1', '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'weixinConfig', null, '1', null, null, null, null, null, '1');
INSERT INTO `pt_dict` VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '字典树', '1_open.png', '字典树', '1', '100103root', '1', null, 'true', '0', null, null, '0', null, null, null, null, null, '1');
INSERT INTO `pt_dict` VALUES ('a1f14efbb8cb4e44a30bd32194d0f24b', '0', null, '2.png', '湖北省', '1', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b', '1', '31b6516f36d44fc280b82affc270c479', 'true', '2', 'huBeiSheng', null, '1', '湖北省', '湖北省', '湖北省', '湖北省', '湖北省', '1');
INSERT INTO `pt_dict` VALUES ('a929cbf789a74107a74aec88c0bcc8fe', '0', null, '2.png', '柴湖镇', '1', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/10c3fc9a884a4cfc91f47e197913fd50/a929cbf789a74107a74aec88c0bcc8fe', null, '10c3fc9a884a4cfc91f47e197913fd50', 'false', '4', 'chaiHuZhen', null, '1', '柴湖镇', '柴湖镇', '柴湖镇', '柴湖镇', '柴湖镇', '1');
INSERT INTO `pt_dict` VALUES ('bf1bf96a123447c58b7f181d3e4e6099', '0', null, '2.png', '两室一厅', '2', '100103root/56e8bdbc8d77460da17e473ee30906b0/bf1bf96a123447c58b7f181d3e4e6099', '1', '56e8bdbc8d77460da17e473ee30906b0', 'false', '2', 'laingshiyiting', null, '1', '两室一厅', '两室一厅', '两室一厅', '两室一厅', '两室一厅', '1');
INSERT INTO `pt_dict` VALUES ('ddbe84891d8b4632ac0dc2bd36f7f323', '0', null, '2.png', '江岸区', '2', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902/ddbe84891d8b4632ac0dc2bd36f7f323', '1', '64659405a79a4ecb9f116ae84ec55902', 'false', '4', 'jiangAnQu', null, '1', '江岸区', '江岸区', '江岸区', '江岸区', '江岸区', '1');

-- ----------------------------
-- Table structure for `pt_group`
-- ----------------------------
DROP TABLE IF EXISTS `pt_group`;
CREATE TABLE `pt_group` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `numbers` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_group
-- ----------------------------
INSERT INTO `pt_group` VALUES ('8a40c0353fa828a6013fa898d4ac0028', '4', '系统管理员组', '超级管理员', 'SuperAdmin');

-- ----------------------------
-- Table structure for `pt_grouprole`
-- ----------------------------
DROP TABLE IF EXISTS `pt_grouprole`;
CREATE TABLE `pt_grouprole` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '??',
  `groupids` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '??ids',
  `roleids` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '??ids',
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='????';

-- ----------------------------
-- Records of pt_grouprole
-- ----------------------------
INSERT INTO `pt_grouprole` VALUES ('b0afd556f2e6421298f6aca3ef226afa', '8a40c0353fa828a6013fa898d4ac0028', '8a40c0353fa828a6013fa898d4ac0023');

-- ----------------------------
-- Table structure for `pt_menu`
-- ----------------------------
DROP TABLE IF EXISTS `pt_menu`;
CREATE TABLE `pt_menu` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `images` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `levels` bigint(20) DEFAULT NULL,
  `orderids` bigint(20) DEFAULT NULL,
  `operatorids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `parentmenuids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `systemsids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `isparent` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `names_zhcn` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `names_zhhk` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `names_zhtw` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `names_enus` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `names_ja` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `param` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_menu
-- ----------------------------
INSERT INTO `pt_menu` VALUES ('017173f642e545b8a7b02fc6f5246b2f', '0', '2.png', null, '2', 'dfe9d74fe0ef4220bfcfe6d7bb2f9436', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '用户管理', null, null, null, null, null);
INSERT INTO `pt_menu` VALUES ('294ab73cc8274f1fa0663bf9c1bbe4d4', '1', '2.png', null, '3', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'true', '配置项', '配置项', '配置项', 'Configuration item', '構成項目', null);
INSERT INTO `pt_menu` VALUES ('297e0cf944f8cce70144f8dce1540069', '2', '8.png', '0', '8', '8897dbe85b3e4e6989d662495272cf26', '294ab73cc8274f1fa0663bf9c1bbe4d4', '8a40c0353fa828a6013fa898d4ac0020', 'false', '字典管理', '字典管理', '字典管理', 'dictionary management', '辞書の管理', null);
INSERT INTO `pt_menu` VALUES ('3272e2e0a7cd4d7f8e1e88abe9d70ae4', '1', '2.png', null, '2', '9adcc4c40e3148988e5003aaedbb4948', '294ab73cc8274f1fa0663bf9c1bbe4d4', null, 'false', '参数管理', '参数管理', '参数管理', 'Parameter management', 'パラメータの管理', null);
INSERT INTO `pt_menu` VALUES ('3ffaf784ef95497b803d7a9f43c9e7a8', '0', '5.png', null, '5', '0773a58c4bdb4858ab062c4a2a4da69a', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '自动回复', null, null, null, null, null);
INSERT INTO `pt_menu` VALUES ('4600e755ec5f4dc6a5783a4d097a42f2', '0', '4.png', null, '4', '420d8ebc68ad44dc8188d4c27dc585d1', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '位置管理', null, null, null, null, null);
INSERT INTO `pt_menu` VALUES ('4bae83d582744c928cb8c8f419586a31', '1', '2.png', null, '1', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false', '用户权限', '用户权限', '用户权限', 'User privilege', 'ユーザの権限', null);
INSERT INTO `pt_menu` VALUES ('625f1e0e951a4199a7262e064512e2c7', '0', '5.png', null, '5', null, '8a40c0353fa828a6013fa898d4ac1100', null, 'true', '微信管理', null, null, null, null, null);
INSERT INTO `pt_menu` VALUES ('75e3b493276146eb839ed9fb3285e829', '1', '4.png', null, '4', '15495beebe984cd19dc30d65676c4c4d', 'ed90c7b40be74552bbfa7ac58efdc5fe', '8a40c0353fa828a6013fa898d4ac0020', 'false', '资源负载', '资源负载', '资源负载', '资源负载', '资源负载', null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0020', '1', '3.png', '-1', '1', null, null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '菜单管理', '菜单管理', '菜单管理', 'Menu management', '管理メニュー', null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0021', '1', '3.png', '2', '1', '91baed789bc14efdbebb10b49c69ee5b', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '用户管理', '用户管理', '用户管理', 'User management', 'ユーザーの管理', null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0022', '1', '3.png', '2', '2', '1b0d7476974e4bf9b52f75fb82f87330', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '分组管理', '分组管理', '分组管理', 'Group management', 'グループの管理', null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0023', '1', '3.png', '2', '3', '7ae62737df444d619f8fd376360d160c', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '角色管理', '角色管理', '角色管理', 'Role management', 'キャラクターの管理', null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0024', '1', '3.png', '2', '5', '7eab5f800bab4efb8df1b2e8a0575f73', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '系统管理', '系统管理', '系统管理', 'System management', 'システム管理', null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0025', '1', '3.png', '2', '6', '0da15c49299d41a4b720f787d053e3cb', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '功能管理', '功能管理', '功能管理', 'Functional management', '機能管理', null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0026', '1', '8.png', '2', '4', '233356b63d8e477fb6e948b703232809', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '岗位管理', '岗位管理', '岗位管理', 'Post management', 'ポストの管理', null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0027', '1', '3.png', '2', '7', 'ad09a1b897744812875c752c2d70f11a', 'a5bf1c38a2ea4b6085d15b830cb80518', '8a40c0353fa828a6013fa898d4ac0020', 'false', '部门管理', '部门管理', '部门管理', 'Department management', '部門の管理', null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac1100', '0', '3.png', '-1', '1', null, null, 'd3a5c976c4c24751b6b00ec775692683', 'true', '后台菜单组织结构', null, null, null, null, null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac2200', '0', '3.png', '-1', '1', null, null, '0c1230c98ef34e58947903fab5a4fa85', 'true', '后台菜单组织结构', null, null, null, null, null);
INSERT INTO `pt_menu` VALUES ('9fd1692ae1fc4f3dab4f0fca7c2a6d68', '1', '3.png', null, '3', '36d3b89e378b451ca89d1a41a3c53e10', 'ed90c7b40be74552bbfa7ac58efdc5fe', null, 'false', '在线Log4j', '在线Log4j', '在线Log4j', 'Online Log4j', 'オンラインLog4j', null);
INSERT INTO `pt_menu` VALUES ('a5bf1c38a2ea4b6085d15b830cb80518', '1', '2.png', null, '2', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false', '组织机构', '组织机构', '组织机构', 'Organization', '組織機構', null);
INSERT INTO `pt_menu` VALUES ('aa2b382e85b348e6a9cd0cb967ff4006', '0', '3.png', null, '3', null, '625f1e0e951a4199a7262e064512e2c7', null, 'false', '消息管理', null, null, null, null, null);
INSERT INTO `pt_menu` VALUES ('bd5d741147f74a058a03bbb5164f392b', '1', '2.png', null, '9', 'd496b161d2564111992687b948862244', 'ed90c7b40be74552bbfa7ac58efdc5fe', '8a40c0353fa828a6013fa898d4ac0020', 'false', '数据源', '数据源', '数据源', 'Data source', 'データソース', null);
INSERT INTO `pt_menu` VALUES ('cdfd617ec645490f98a64bf36102d44f', '6', '6.png', null, '6', null, '625f1e0e951a4199a7262e064512e2c7', null, 'false', '新增菜单12', '新增菜单13', '新增菜单14', '222', '111', null);
INSERT INTO `pt_menu` VALUES ('ed30f3cd2e9f4e0aa0b950c147035b67', '0', '2.png', null, '2', '2c91467f905a4f5ba9f52830131c8ad9', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '分组管理', null, null, null, null, null);
INSERT INTO `pt_menu` VALUES ('ed90c7b40be74552bbfa7ac58efdc5fe', '1', '2.png', null, '2', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'true', '系统维护', '系统维护', '系统维护', 'System maintenance', 'システムのメンテナンス', null);
INSERT INTO `pt_menu` VALUES ('f353e484ce074b86b0210f66346d9a80', '1', '9.png', null, '10', '235d855d7b914d728e434f0f309aa04d', 'ed90c7b40be74552bbfa7ac58efdc5fe', '8a40c0353fa828a6013fa898d4ac0020', 'false', '系统日志', '系统日志', '系统日志', 'The system log', 'システムログ', null);

-- ----------------------------
-- Table structure for `pt_module`
-- ----------------------------
DROP TABLE IF EXISTS `pt_module`;
CREATE TABLE `pt_module` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `images` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `isparent` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `orderids` bigint(20) DEFAULT NULL,
  `parentmoduleids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `systemsids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_module
-- ----------------------------
INSERT INTO `pt_module` VALUES ('297e0cf944e9762e0144e97dfd6e00c9', '0', '数据源', '2.png', 'true', '数据源', '2', 'ec01ee2ea97a4ff1b2371304b8d0fe34', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('33a6f5664a194da8bc2394826cc25bc3', '0', null, '2.png', 'true', '岗位功能', '2', '6c4e642b911e468dbdcb62c9b4669eb3', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('377c7b7a896b43d0992c630d62bd596d', '0', null, '2.png', 'true', '用户岗位', '2', '6c4e642b911e468dbdcb62c9b4669eb3', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('417ed3d3cf4d4b7a939613829e8db17d', '0', null, '3.png', 'true', '消息管理', '3', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('4c343ddf030d4e17b6db83465600778b', '0', null, '2.png', 'true', '验证码', '2', '75f9bd430f4a4ec7b0a71928e15ea5f7', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('529d39f773a54ff39eea877f606d74b0', '0', null, '2.png', 'true', 'Ueditor', '2', '75f9bd430f4a4ec7b0a71928e15ea5f7', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('625e895224aa424693149208c9d4073e', '0', null, '2.png', 'true', '分组角色', '2', '6c4e642b911e468dbdcb62c9b4669eb3', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('68422887e56645728038cdde08caef9a', '0', null, '2.png', 'true', 'Test', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('6c4e642b911e468dbdcb62c9b4669eb3', '0', null, '2.png', 'true', '权限', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('75f9bd430f4a4ec7b0a71928e15ea5f7', '0', null, '2.png', 'true', '通用功能', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('7a35846a305c42abb68601b4f7347289', '0', null, '4.png', 'true', '主页管理', '4', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('7cbeac9418c946a2bda0c6aabf23c276', '0', null, '2.png', 'true', '博客', '2', '68422887e56645728038cdde08caef9a', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '根节点', '3.png', 'true', '根节点', '1', null, '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0021', '0', '后台登陆', '8.png', 'true', '登陆', '1', '6c4e642b911e468dbdcb62c9b4669eb3', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0022', '0', '字典', '2.png', 'true', '字典', '2', 'eabc054760164b4cb730c4f5c2a4d305', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '用户分组管理', '2.png', 'true', '分组', '2', '6c4e642b911e468dbdcb62c9b4669eb3', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0024', '0', '角色管理', '2.png', 'true', '角色', '3', '6c4e642b911e468dbdcb62c9b4669eb3', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0025', '0', '岗位管理', '5.png', 'true', '岗位', '4', 'cbe70ed41ad040938cfd7bcc5f4f0c58', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '系统管理', '5.png', 'true', '系统', '5', 'cbe70ed41ad040938cfd7bcc5f4f0c58', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', '功能管理', '7.png', 'true', '功能', '6', '6c4e642b911e468dbdcb62c9b4669eb3', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', '部门管理', '3.png', 'true', '部门', '7', 'cbe70ed41ad040938cfd7bcc5f4f0c58', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0029', '0', '日志管理', '6.png', 'true', '日志', '11', 'ec01ee2ea97a4ff1b2371304b8d0fe34', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0030', '0', '用户管理', '3.png', 'true', '用户', '1', 'cbe70ed41ad040938cfd7bcc5f4f0c58', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0031', '0', '公共功能', '5.png', 'true', '公共', '1', '75f9bd430f4a4ec7b0a71928e15ea5f7', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0032', '0', '菜单管理', '8.png', 'true', '菜单', '1', '6c4e642b911e468dbdcb62c9b4669eb3', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0033', '0', '模块管理', '7.png', 'true', '模块', '1', '6c4e642b911e468dbdcb62c9b4669eb3', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac1100', '0', '根节点', '3.png', 'true', '根节点', '1', null, 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac2200', '0', '根节点', '3.png', 'true', '根节点', '1', null, '0c1230c98ef34e58947903fab5a4fa85');
INSERT INTO `pt_module` VALUES ('8d7a260e02674bd3873656deb716202e', '0', null, '4.png', 'false', '文件上传', '4', '75f9bd430f4a4ec7b0a71928e15ea5f7', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8f53706d4af541588bde334d99d44727', '0', null, '6.png', 'true', '自动回复', '6', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('c4ab6b8d50434ddf8fa0ec106fcfc6ea', '0', null, '2.png', 'true', '角色功能', '2', '6c4e642b911e468dbdcb62c9b4669eb3', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('c4e63c4171db4ae2a83f7dfcc2656b0e', '0', null, '2.png', 'true', '用户管理', '2', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('c87c35097a2d4bc898fe6e9b1e280a3d', '0', null, '5.png', 'true', '位置管理', '5', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('c9cbb508c11b4b10aeac87a4f3ebc340', '0', null, '2.png', 'true', '资源负载', '2', 'ec01ee2ea97a4ff1b2371304b8d0fe34', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('cbe70ed41ad040938cfd7bcc5f4f0c58', '0', null, '2.png', 'true', '组织机构', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('e6eb0165223447218410f867a9614300', '0', null, '2.png', 'true', '分组管理', '2', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('eabc054760164b4cb730c4f5c2a4d305', '0', null, '2.png', 'true', '配置项', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('ec01ee2ea97a4ff1b2371304b8d0fe34', '0', null, '2.png', 'true', '运维', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('f2496d3a9635448280b28fbc373f6db6', '0', null, '2.png', 'true', '新增模块9', '2', 'cbe70ed41ad040938cfd7bcc5f4f0c58', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('f7fbc8e3ee59405dabe02e18d562abf4', '0', null, '2.png', 'true', '用户分组', '2', '6c4e642b911e468dbdcb62c9b4669eb3', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('f85f516c0b86439087d48a45173ba0e7', '0', null, '2.png', 'true', 'Log4j', '2', 'ec01ee2ea97a4ff1b2371304b8d0fe34', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('ffeeb72e053a4a86a4fe242642877a44', '0', null, '2.png', 'true', '参数管理', '2', 'eabc054760164b4cb730c4f5c2a4d305', '8a40c0353fa828a6013fa898d4ac0020');

-- ----------------------------
-- Table structure for `pt_operator`
-- ----------------------------
DROP TABLE IF EXISTS `pt_operator`;
CREATE TABLE `pt_operator` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `names` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `onemany` char(1) COLLATE utf8_bin DEFAULT NULL,
  `returnparamkeys` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `returnurl` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `rowfilter` char(1) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `moduleids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `splitpage` char(1) COLLATE utf8_bin DEFAULT NULL,
  `formtoken` char(1) COLLATE utf8_bin DEFAULT NULL,
  `ipblack` char(1) COLLATE utf8_bin DEFAULT NULL,
  `privilegess` char(1) COLLATE utf8_bin DEFAULT NULL,
  `ispv` char(1) COLLATE utf8_bin DEFAULT NULL,
  `pvtype` char(1) COLLATE utf8_bin DEFAULT NULL,
  `modulenames` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `csrf` char(1) COLLATE utf8_bin DEFAULT NULL,
  `referer` char(1) COLLATE utf8_bin DEFAULT NULL,
  `method` char(1) COLLATE utf8_bin DEFAULT NULL,
  `syslog` char(1) COLLATE utf8_bin DEFAULT NULL,
  `enctype` char(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`),
  KEY `onemanyindex` (`onemany`) USING BTREE,
  KEY `returnparamkeysindex` (`returnparamkeys`) USING BTREE,
  KEY `returnurlindex` (`returnurl`) USING BTREE,
  KEY `rowfilterindex` (`rowfilter`) USING BTREE,
  KEY `urlindex` (`url`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_operator
-- ----------------------------
INSERT INTO `pt_operator` VALUES ('01aa0c85c8b84ae8aca7f5484336b203', '0', null, '保存', null, null, null, '0', '/platform/dict/save', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', '0', '0', '字典', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('0478826a46df4f20b12f4043a97f8209', '0', null, '验证码', null, null, null, '0', '/platform/authImg', '4c343ddf030d4e17b6db83465600778b', '0', '0', '0', '0', '0', '0', '验证码', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('05114c0cbe1f4c2095b3216f13cfb681', '0', null, '保存', null, null, null, '0', '/wx/keyword/save', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', '0', '0', '自动回复', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('053d330462e1459ca1012c9d29113bc4', '0', null, '获取部门负责人', null, null, null, '0', '/platform/dept/getPrincipal', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', '0', '0', '部门', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('0773a58c4bdb4858ab062c4a2a4da69a', '0', null, '默认主页', null, null, null, '0', '/wx/keyword', '8f53706d4af541588bde334d99d44727', '1', '0', '0', '1', '0', '0', '自动回复', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('08a96d5dd37f49459eeb02eebeb0a78c', '0', null, '列表', null, null, null, '0', '/platform/roleOperator', 'c4ab6b8d50434ddf8fa0ec106fcfc6ea', '1', '0', '0', '1', '0', '0', '角色功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('091855dd809b418fae88a7fec6d9f246', '0', null, '准备更新', null, null, null, '0', '/platform/dict/edit', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', '0', '0', '字典', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('09b6ce29313c4051ba765de516a9b283', '0', null, 'treeData', null, null, null, '0', '/platform/station/treeData', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', '0', '0', '岗位', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('09dbbe046d6e469d8a5ba12e29abc522', '0', null, '菜单功能列表', null, null, null, '0', '/platform/menu/list', '8a40c0353fa828a6013fa898d4ac0032', '1', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('0da15c49299d41a4b720f787d053e3cb', '0', null, '默认列表', null, null, null, '0', '/platform/operator', '8a40c0353fa828a6013fa898d4ac0027', '1', '0', '0', '1', '0', '0', '功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('0fb7938c7d614fc389568eb67b442303', '0', null, '单选', null, null, null, '0', '/platform/module/radio.html', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', '0', '0', '模块', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('1046389d8525451697f2793185e7d6ee', '0', null, '更新', null, null, null, '0', '/platform/dept/update', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', '0', '0', '部门', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('10499bc7f9cb4adf99beba00343b4ea6', '0', null, '获取菜单功能', null, null, null, '0', '/platform/menu/getOperator', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('12141c1c3be241ca8a868bce9cd610d5', '0', null, '准备添加', null, null, null, '0', '/platform/dict/add.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', '0', '0', '字典', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('1329f58a0eed44e195dec78bddc591b6', '0', null, '单文件分片上传', null, null, null, '0', '/platform/upload/slice', '8d7a260e02674bd3873656deb716202e', '0', '0', '0', '1', '0', '0', '上传文件', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('15566e63f3104c73b4a0b4a784dd11ca', '0', null, '保存', null, null, null, '0', '/platform/role/save', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', '0', '0', '角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('18f50e0f48ef4dd9bec85f5612ab10c0', '0', null, '功能列表', null, null, null, '0', '/platform/test/operator', '68422887e56645728038cdde08caef9a', '1', '0', '0', '1', '0', '0', 'Test', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('1a8b4d8e4411412fa8bb561393563a85', '0', null, '准备添加', null, null, null, '0', '/platform/user/add.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('1b0d7476974e4bf9b52f75fb82f87330', '0', null, '分组默认列表', null, null, null, '0', '/platform/group', '8a40c0353fa828a6013fa898d4ac0023', '1', '0', '0', '1', '0', '0', '分组', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('1b1a809815574b2a9c1d0e18d692de17', '0', null, '更新', null, null, null, '0', '/platform/operator/update', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', '0', '0', '功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('1d2b6919b80a4a21821adc3efcda77b2', '0', null, '列表', null, null, null, '0', '/platform/upload/list', '8d7a260e02674bd3873656deb716202e', '1', '0', '0', '1', '0', '0', '文件上传', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('1f05b6496a494f488e4cacd2a449c37a', '0', null, '删除', null, null, null, '0', '/platform/stationOperator/del', '33a6f5664a194da8bc2394826cc25bc3', '0', '0', '0', '1', '0', '0', '岗位功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('21141da4febe4c929abe37126b37fd12', '0', null, '多选', null, null, null, '0', '/platform/station/checkbox.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', '0', '0', '岗位', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('21b0a910ef6e4c60a325d5e57e6e6f65', '0', null, '单选', null, null, null, '0', '/platform/dict/radio.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', '0', '0', '字典', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('22926eb196a14b48be775f4880b5ba94', '0', null, '保存', null, null, null, '0', '/platform/group/save', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', '0', '0', '分组', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('2329f58a0eed44e195dec78bddc591b7', '0', null, '多文件分片上传', null, null, null, '0', '/platform/upload/slices', '8d7a260e02674bd3873656deb716202e', '0', '0', '0', '1', '0', '0', '上传文件', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('233356b63d8e477fb6e948b703232809', '0', null, '默认树', null, null, null, '0', '/platform/station', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', '0', '0', '岗位', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('235d855d7b914d728e434f0f309aa04d', '0', null, '默认列表', null, null, null, '0', '/platform/sysLog', '8a40c0353fa828a6013fa898d4ac0029', '1', '0', '0', '1', '0', '0', '日志', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('235d855d7b914d728e434f0f309ab041', '0', null, '导出', null, null, null, '0', '/platform/sysLog/export', '8a40c0353fa828a6013fa898d4ac0029', '1', '0', '0', '1', '0', '0', '日志', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('29c18b3394924c30882da049da14ad99', '0', null, '更新', null, null, null, '0', '/platform/role/update', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', '0', '0', '角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('2bd0e8f116f9420692a81d1723cecf5c', '0', null, '日志列表', null, null, null, '0', '/platform/test/sysLog', '68422887e56645728038cdde08caef9a', '1', '0', '0', '1', '0', '0', 'Test', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('2be34991827e4e8da8e92f9b9e8bce25', '0', null, 'treeTableSub', null, null, null, '0', '/platform/dict/treeTable', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', '0', '0', '字典', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('2c2063e17dc742a3b9c330b84c5dfa6a', '0', null, '自动补全', null, null, null, '0', '/platform/test/autoComplete', '68422887e56645728038cdde08caef9a', '0', '0', '0', '1', '0', '0', 'Test', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('2c91467f905a4f5ba9f52830131c8ad9', '0', null, '默认分组列表', null, null, null, '0', '/wx/group', 'e6eb0165223447218410f867a9614300', '1', '0', '0', '1', '0', '0', '分组管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('2e32e08e495b4ccea6148774e9f91182', '0', null, '查看', null, null, null, '0', '/platform/param/view', 'ffeeb72e053a4a86a4fe242642877a44', '0', '0', '0', '1', '0', '0', '参数管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('2fbbc9cfb0bf4b5bb504ead155c3423c', '0', null, '保存', null, null, null, '0', '/platform/station/save', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', '0', '0', '岗位', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('2fee901117c64e18873f60e8f800713d', '0', null, '单选', null, null, null, '0', '/platform/station/radio.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', '0', '0', '岗位', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('3085a3b0c20d4f3aaa7c2d27fe986aba', '0', null, '博客添加', null, null, null, '0', '/test/blog/add.html', '7cbeac9418c946a2bda0c6aabf23c276', '0', '0', '0', '1', '0', '0', '博客', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('30bf01ffe1cb4ed39e92c6600ea39e93', '0', null, '添加', null, null, null, '0', '/platform/groupRole/addRole', '625e895224aa424693149208c9d4073e', '0', '0', '0', '1', '0', '0', '分组角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('32a3e59964204a3c8848e84b864306ae', '0', null, '删除', null, null, null, '0', '/platform/systems/delete', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', '0', '0', '系统', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('3329f58a0eed44e195dec78bddc591b8', '0', null, '验证文件md5', null, null, null, '0', '/platform/upload/md5', '8d7a260e02674bd3873656deb716202e', '0', '0', '0', '1', '0', '0', '上传文件', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('335d1f8f46eb47a18001889f8cc21348', '0', null, '删除', null, null, null, '0', '/platform/role/delete', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', '0', '0', '角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('351851fb7fce48f9a0ff6747971715ac', '0', null, 'lucene', null, null, null, '0', '/platform/test/lucene', '68422887e56645728038cdde08caef9a', '1', '0', '0', '1', '0', '0', 'Test', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('362cf247241c4d12b6242301e4a73516', '0', null, '删除', null, null, null, '0', '/platform/station/delete', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', '0', '0', '岗位', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('37218fb52ec94fb4bf76209a17916094', '0', null, '默认树', null, null, null, '0', '/platform/module', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', '0', '0', '模块', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('39d82b5574b540b88d3723b36eb3e577', '0', null, '验证手机号是否存在', null, null, null, '0', '/platform/login/valiMobile', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', '0', '0', '登陆', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('3da96263a14343eaa7b409a93ec9e1db', '0', null, 'treeTable', null, null, null, '0', '/platform/param/treeTable', 'ffeeb72e053a4a86a4fe242642877a44', '0', '0', '0', '1', '0', '0', '参数管理', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('3dd486cd58da467dbd83ae420db14815', '0', null, '准备添加', null, null, null, '0', '/weiXin/keyword/add.html', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', '0', '0', '自动回复', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('3e4e9e72dab243d38a1785d157c24cb6', '0', null, '博客更新', null, null, null, '0', '/test/blog/update', '7cbeac9418c946a2bda0c6aabf23c276', '0', '1', '0', '1', '0', '0', '博客', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('3ee5f986289d4a1990f4e42c9a0caadb', '0', null, '准备添加', null, null, null, '0', '/platform/group/add.html', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', '0', '0', '分组', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('420d8ebc68ad44dc8188d4c27dc585d1', '0', null, '位置默认列表', null, null, null, '0', '/wx/location', 'c87c35097a2d4bc898fe6e9b1e280a3d', '1', '0', '0', '1', '0', '0', '位置管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('423e8c2e2a644bbda0803f46ea8f31e2', '0', null, '准备国际化编辑', null, null, null, '0', '/platform/menu/toEdit', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('4376888fd74f4247a926529e5da03442', '0', null, 'treeData', null, null, null, '0', '/platform/user/treeData', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('437e05d09dd94720b67c4f230cdebe58', '0', null, '更新', null, null, null, '0', '/platform/module/update', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', '0', '0', '模块', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('46b7269a26044dfebb4edd06a2f9cd83', '0', null, '博客列表', null, null, null, '0', '/test/blog', '7cbeac9418c946a2bda0c6aabf23c276', '1', '0', '0', '1', '0', '0', '博客', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('46e00ef0fd234e9dbf68ed9bbb437d0f', '0', null, '多选', null, null, null, '0', '/platform/department/checkbox.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', '0', '0', '部门', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('481d4d5c0a634c4085c72c990260e58d', '0', null, '微信管理主页', null, null, null, '0', '/wx/index/content', '7a35846a305c42abb68601b4f7347289', '0', '0', '0', '1', '0', '0', '主页管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('483bdacba04f4663986e6339166e8321', '0', null, '验证账号是否存在', null, null, null, '0', '/platform/login/valiUserName', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', '0', '0', '登陆', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('48db51f20b504c4ab489b1dcfd3ecbd9', '0', null, '密码变更', null, null, null, '0', '/platform/user/passChange.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('4959d88b8ca64eb19310c30799faa07c', '0', null, '准备添加', null, null, null, '0', '/platform/param/add.html', 'ffeeb72e053a4a86a4fe242642877a44', '0', '0', '0', '1', '0', '0', '参数管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('4a6544ae7a2548ad81c0e3994999023c', '0', null, '准备设置菜单功能', null, null, null, '0', '/platform/menu/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('4bebccaa8f0c4bfbaa2ff89f00706100', '0', null, '博客编辑', null, null, null, '0', '/test/blog/edit', '7cbeac9418c946a2bda0c6aabf23c276', '0', '0', '0', '1', '0', '0', '博客', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('4df80521e66447618796c3cfe02bf239', '0', null, '默认treeTable', null, null, null, '0', '/platform/dict', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', '0', '0', '字典', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('4e03be6af2c74dae99a131a1ab3569f6', '0', null, '编辑', null, null, null, '0', '/platform/param/edit', 'ffeeb72e053a4a86a4fe242642877a44', '0', '0', '0', '1', '0', '0', '参数管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('5148ea207b974ee197f0bc57060ab1ad', '0', null, '删除', null, null, null, '0', '/wx/location/delete', 'c87c35097a2d4bc898fe6e9b1e280a3d', '0', '0', '0', '1', '0', '0', '位置管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('58a85040aa9f40cca0bdba6e23e30363', '0', null, '保存', null, null, null, '0', '/platform/dept/save', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', '0', '0', '部门', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('5b249ad344d948b99f58768c323f5f71', '0', null, '准备添加', null, null, null, '0', '/platform/systems/add.html', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', '0', '0', '系统', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('5b47ae382f42421682852f889c176d49', '0', null, '验证身份证是否存在', null, null, null, '0', '/platform/login/valiIdcard', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', '0', '0', '登陆', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('5c2bdc059ae24ffda2758a2781bb46da', '0', null, 'log4jServlet', null, null, null, '0', '/se/log4j', 'f85f516c0b86439087d48a45173ba0e7', '0', '0', '0', '1', '0', '0', 'Log4j', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('5d6f2bb8faa948108081492179d0c0ad', '0', null, '删除', null, null, null, '0', '/platform/upload/delete', '8d7a260e02674bd3873656deb716202e', '0', '0', '0', '1', '0', '0', '文件上传', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('5fcac107c80d493d91b53a815d4b297a', '0', null, '保存', null, null, null, '0', '/platform/user/save', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('61da3d9c60704621aa60d1da4553a264', '0', null, '添加', null, null, null, '0', '/platform/userGroup/addGroup', 'f7fbc8e3ee59405dabe02e18d562abf4', '0', '0', '0', '1', '0', '0', '用户分组', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('6324ff9e83654aa0bf7f9d918b636b55', '0', null, '查看字典', null, null, null, '0', '/platform/dict/view', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', '0', '0', '字典', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('6566adb7fc6347e7b01a3c47129b5eb5', '0', null, 'ueditor', null, null, null, '0', '/platform/ueditor', '529d39f773a54ff39eea877f606d74b0', '0', '0', '0', '1', '0', '0', 'Ueditor', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('6569e0d9f2cd4e3a97af4e1b0cd8d2f7', '0', null, '删除', null, null, null, '0', '/platform/dict/delete', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', '0', '0', '字典', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('671ce1e6167840baaa6d27f4f04574c9', '0', null, '主页', null, null, null, '0', '/platform/param', 'ffeeb72e053a4a86a4fe242642877a44', '0', '0', '0', '1', '0', '0', '参数管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('6b527ed138c343a89ddf73cf16fef565', '0', null, '更新', null, null, null, '0', '/wx/keyword/update', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', '0', '0', '自动回复', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('6daed51284f94923b1c8a6414e646959', '0', null, 'treeData', null, null, null, '0', '/platform/operator/treeData', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', '0', '0', '功能', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('721f7255449c445faf36607c254eea06', '0', null, 'iframe', null, null, null, '0', '/platform/log4j/iframe.html', 'f85f516c0b86439087d48a45173ba0e7', '0', '0', '0', '1', '0', '0', 'Log4j', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('77823e12391a47729a1f82a00bc15c5b', '0', null, '准备更新', null, null, null, '0', '/wx/keyword/edit', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', '0', '0', '自动回复', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('78c6026c6af44b41a6bef4cdb4cfb414', '0', null, '获取角色功能', null, null, null, '0', '/platform/role/getOperator', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', '0', '0', '角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('79039a2260da46b0aabb5a62e8db6c87', '0', null, '查看', null, null, null, '0', '/platform/user/view', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('7ae62737df444d619f8fd376360d160c', '0', null, '默认列表', null, null, null, '0', '/platform/role', '8a40c0353fa828a6013fa898d4ac0024', '1', '0', '0', '1', '0', '0', '角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('7b4281dd247c4624bee0d8f84c2c2715', '0', null, '保存', null, null, null, '0', '/platform/systems/save', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', '0', '0', '系统', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('7bd7ca42560140ee8573b2ade6388f3e', '0', null, '用户分组选择', null, null, null, '0', '/platform/userGroup/select', 'f7fbc8e3ee59405dabe02e18d562abf4', '0', '0', '0', '1', '0', '0', '用户分组', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('7cc12b5c154a4a9782c518c57e8ab3aa', '0', null, '准备更新', null, null, null, '0', '/platform/role/edit', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', '0', '0', '角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('7eab5f800bab4efb8df1b2e8a0575f73', '0', null, '默认列表', null, null, null, '0', '/platform/systems', '8a40c0353fa828a6013fa898d4ac0026', '1', '0', '0', '1', '0', '0', '系统', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('7ed5eefbbf3d4aa78d0c5b99f3b7010c', '0', null, '登陆验证', null, null, null, '0', '/platform/login/vali', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', '0', '0', '登陆', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('827a7067a28d442da3ddd834677127af', '0', null, '国际化编辑', null, null, null, '0', '/platform/menu/edit', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('8329f58a0eed44e195dec78bddc591b5', '0', null, '上传', null, null, null, '0', '/platform/upload', '8d7a260e02674bd3873656deb716202e', '0', '0', '0', '1', '0', '0', '文件上传', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('83ef85fd17804bb195d0ad3c07f88c30', '0', null, '准备更新', null, null, null, '0', '/platform/operator/edit', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', '0', '0', '功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('88298fbd650d49f492e268816feffd15', '0', null, '验证邮箱是否存在', null, null, null, '0', '/platform/login/valiMailBox', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', '0', '0', '登陆', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('886bd497064b4c9f87d8461ebba421d1', '0', null, '首页', null, null, null, '0', '/platform/index', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', '0', '0', '登陆', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('8897dbe85b3e4e6989d662495272cf26', '0', null, 'Iframe', null, null, null, '0', '/platform/dict/treeTableIframe.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', '0', '0', '字典', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('8b1c1c86385642f2b6c97930b44bbbcf', '0', null, '单选', null, null, null, '0', '/platform/param/radio.html', 'ffeeb72e053a4a86a4fe242642877a44', '0', '0', '0', '1', '0', '0', '参数管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('8bd9c0e14df941cdaf6253cd08dbd9cd', '0', null, '准备更新', null, null, null, '0', '/platform/systems/edit', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', '0', '0', '系统', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('8ca8af501522439d8c9249e00db5d78d', '0', null, '查看', null, null, null, '0', '/platform/sysLog/view', '8a40c0353fa828a6013fa898d4ac0029', '0', '0', '0', '1', '0', '0', '日志', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('8f79857b31d4475a94c712e997e89c99', '0', null, '更新', null, null, null, '0', '/platform/dict/update', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', '0', '0', '字典', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('90c3cee940ea4211a714f5111d24ff5d', '0', null, 'treeData', null, null, null, '0', '/platform/param/treeData', 'ffeeb72e053a4a86a4fe242642877a44', '0', '0', '0', '1', '0', '0', '参数管理', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('910955c2192a418995eeab8bf15372e9', '0', null, '准备添加', null, null, null, '0', '/platform/operator/add.html', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', '0', '0', '功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('91baed789bc14efdbebb10b49c69ee5b', '0', null, '默认主页列表', null, null, null, '0', '/platform/user', '8a40c0353fa828a6013fa898d4ac0030', '1', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('9750ea3ee4474711b9acbda8d5b87ee7', '0', null, '删除', null, null, null, '0', '/platform/groupRole/delRole', '625e895224aa424693149208c9d4073e', '0', '0', '0', '1', '0', '0', '分组角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('9765e6bb76eb40ab800cb8954822190e', '0', null, '删除', null, null, null, '0', '/wx/keyword/delete', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', '0', '0', '自动回复', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('9a708f39e123455e84b6125774bab1ea', '0', null, 'treeData', null, null, null, '0', '/platform/module/treeData', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', '0', '0', '模块', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('9adcc4c40e3148988e5003aaedbb4948', '0', null, 'treeTableIframe', null, null, null, '0', '/platform/param/treeTableIframe.html', 'ffeeb72e053a4a86a4fe242642877a44', '0', '0', '0', '1', '0', '0', '参数管理', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('9c0ae757fc564f27860b975e5792ae6a', '0', null, 'log4jhtml', null, null, null, '0', '/platform/log4j/log4j.html', 'f85f516c0b86439087d48a45173ba0e7', '0', '0', '0', '1', '0', '0', 'Log4j', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('9f75b47bdc0249e2b493c47384785a72', '0', null, '保存', null, null, null, '0', '/platform/menu/save', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('a0c01a5248cd4bf38e57945dbb2b98c5', '0', null, '更新', null, null, null, '0', '/platform/group/update', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', '0', '0', '分组', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('a0d2897ee9194378819e78538189faa0', '0', null, '列表', null, null, null, '0', '/platform/stationOperator', '33a6f5664a194da8bc2394826cc25bc3', '1', '0', '0', '1', '0', '0', '岗位功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('a1ff68acf9b24c34b347ff21e333cb70', '0', null, '设置菜单功能', null, null, null, '0', '/platform/menu/setOperator', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('a2727f19f7cd4a038dd1a94f042a8cf1', '0', null, '博客保存', null, null, null, '0', '/test/blog/save', '7cbeac9418c946a2bda0c6aabf23c276', '0', '1', '0', '1', '0', '0', '博客', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('a498a20dd4824b8fb103202360669de4', '0', null, '菜单功能设置', null, null, null, '0', '/platform/menu/set', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('a5289b2638d845fbb06dedbcdd517f97', '0', null, '删除', null, null, null, '0', '/platform/group/delete', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', '0', '0', '分组', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('a6623c65480f4f2cb63a4d7673f81e3a', '0', null, 'treeData', null, null, null, '0', '/platform/menu/treeData', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('aa126932641f4e068ed8278a332de85d', '0', null, '默认主页', null, null, null, '0', '/platform/index/content', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', '0', '0', '登陆', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('acbceb432b5849aca9e9b284240281ec', '0', null, '分组角色下拉选择', null, null, null, '0', '/platform/role/select', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', '0', '0', '角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('ad09a1b897744812875c752c2d70f11a', '0', null, '默认树', null, null, null, '0', '/platform/dept', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', '0', '0', '部门', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('ad51a6ca95c646ce9c03778eda715734', '0', null, '保存', null, null, null, '0', '/platform/operator/save', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', '0', '0', '功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('b13b002e2fad4e95bbe0e4dbc9fbdfe1', '0', null, '保存', null, null, null, '0', '/platform/module/save', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', '0', '0', '模块', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('b23b17d4c83242e8a1a8ee8cfcde9907', '0', null, '查看', null, null, null, '0', '/platform/operator/view', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', '0', '0', '功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('b4ee4ae4391f4243be69e838545d2131', '0', null, 'treeData', null, null, null, '0', '/platform/dept/treeData', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', '0', '0', '部门', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('b8218945b8e743f29651569950014511', '0', null, '单选', null, null, null, '0', '/platform/department/radio.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', '0', '0', '部门', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('b82d86fb7b64498a9c2b8b9a99b3fbeb', '0', null, '删除', null, null, null, '0', '/platform/menu/delete', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('b8339f29d8d84a4ead6454295f87b79c', '0', null, '人员分组设置', null, null, null, '0', '/platform/group/select', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', '0', '0', '分组', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('bc2c865be6af42cf861294d446fb1c6f', '0', null, '单选', null, null, null, '0', '/platform/user/radio.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('c04adcd019e04cf3ba7c66af721a18dc', '0', null, '删除', null, null, null, '0', '/platform/user/delete', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('c05642442e0a468ebe4f0b7771a803ae', '0', null, '更新', null, null, null, '0', '/platform/systems/update', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', '0', '0', '系统', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('c081c50918f4459f8e36ab8cb4151a61', '0', null, '准备岗位功能设置', null, null, null, '0', '/platform/station/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', '0', '0', '岗位', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('c0ccfcd127c347a8b9db140e5aa62188', '0', null, '准备添加', null, null, null, '0', '/platform/role/add.html', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', '0', '0', '角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('c1e991d1f56749298c18ff69d7777e0b', '0', null, '删除', null, null, null, '0', '/platform/module/delete', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', '0', '0', '模块', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('c29ea4cbd9044bc786e9f4584ad840ff', '0', null, '获取岗位功能', null, null, null, '0', '/platform/station/getOperator', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', '0', '0', '岗位', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('c7132250f5054b808bb119122a6ecb52', '0', null, '设置岗位功能', null, null, null, '0', '/platform/station/setOperator', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', '0', '0', '岗位', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('c9d013d14cbd4f148fb4562c91803ee8', '0', null, '准备更新', null, null, null, '0', '/platform/group/edit', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', '0', '0', '分组', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('ca0f6da01ada419eaa7739d9790e5b88', '0', null, '准备角色功能设置', null, null, null, '0', '/platform/role/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', '0', '0', '角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('cc6bcbee40ab43b2bd5aff6d9385e1fc', '0', null, '删除', null, null, null, '0', '/platform/operator/delete', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', '0', '0', '功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('cc88acee3a664c58861a872c351385e6', '0', null, '选择', null, null, null, '0', '/platform/groupRole/select', '625e895224aa424693149208c9d4073e', '0', '0', '0', '1', '0', '0', '分组角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('ccf9b69e151840a28be75d8443b70273', '0', null, '更新', null, null, null, '0', '/platform/param/update', 'ffeeb72e053a4a86a4fe242642877a44', '0', '0', '0', '1', '0', '0', '参数管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('cf26c1d2baa24a8791b3d264154b80d4', '0', null, '默认树', null, null, null, '0', '/platform/menu', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('d115d08591ef4c0eaebef15f8294b287', '0', null, '准备设置部门负责人', null, null, null, '0', '/platform/department/userTree.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', '0', '0', '部门', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('d247fb45be724ed2a2bb5c92d73bf6cf', '0', null, '设置用户的组', null, null, null, '0', '/platform/user/setGroup', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('d479dbdc901f4d85a207b9bace6465ac', '0', null, '更新', null, null, null, '0', '/platform/user/update', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('d496b161d2564111992687b948862244', '0', null, 'iframe', null, null, null, '0', '/platform/druid/iframe.html', '297e0cf944e9762e0144e97dfd6e00c9', '0', '0', '0', '1', '0', '0', '数据源', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('d5c8bdf7a49a4e46b776c05dc9ead484', '0', null, 'treeData', null, null, null, '0', '/platform/dict/treeData', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', '0', '0', '字典', '0', '0', '0', '0', '0');
INSERT INTO `pt_operator` VALUES ('d646da8707ae41838fd2ec9bf0d467ee', '0', null, '设置角色功能', null, null, null, '0', '/platform/role/setOperator', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', '0', '0', '角色', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('da6077ec1f354a409d0385b2c063e044', '0', null, '添加功能', null, null, null, '0', '/platform/roleOperator/add', 'c4ab6b8d50434ddf8fa0ec106fcfc6ea', '0', '0', '0', '1', '0', '0', '角色功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('dc750e57b54f4baca78d66969321ee51', '0', null, '更新', null, null, null, '0', '/platform/station/update', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', '0', '0', '岗位', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('df0aa534655242e4a0bcd638b51a4e03', '0', null, '更新', null, null, null, '0', '/platform/menu/update', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', '0', '0', '菜单', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('dfc7af0979a54e8e9a3f18b7a5d66030', '0', null, '查看', null, null, null, '0', '/wx/keyword/view', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', '0', '0', '自动回复', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('dfe9d74fe0ef4220bfcfe6d7bb2f9436', '0', null, '默认用户列表', null, null, null, '0', '/wx/user', 'c4e63c4171db4ae2a83f7dfcc2656b0e', '1', '0', '0', '1', '0', '0', '用户管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('e037e0bae9a94e549d6b647db49a64a1', '0', null, '角色设置', null, null, null, '0', '/platform/group/setRole', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', '0', '0', '分组', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('e1ac811d2a16495d927f994dd006e824', '0', null, '删除', null, null, null, '0', '/platform/param/delete', 'ffeeb72e053a4a86a4fe242642877a44', '0', '0', '0', '1', '0', '0', '参数管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('e2cead0f68ac4a2d98765264578a9f83', '0', null, '删除', null, null, null, '0', '/platform/userGroup/delGroup', 'f7fbc8e3ee59405dabe02e18d562abf4', '0', '0', '0', '1', '0', '0', '用户分组', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('e4f182b4009e48a58673134324b2ec56', '0', null, '资源负载', null, null, null, '0', '/platform/resources', 'c9cbb508c11b4b10aeac87a4f3ebc340', '0', '0', '0', '1', '0', '0', '资源负载', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('e754dfdb794d4e7db6023c9b089a340c', '0', null, '多选', null, null, null, '0', '/platform/user/checkbox.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('ee27f5c23b6d4217b3b66295a3506a40', '0', null, '删除功能', null, null, null, '0', '/platform/roleOperator/del', 'c4ab6b8d50434ddf8fa0ec106fcfc6ea', '0', '0', '0', '1', '0', '0', '角色功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('f1f6f2c8f026498c8ee64b7a918d06df', '0', null, '准备更新', null, null, null, '0', '/platform/user/edit', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', '0', '0', '用户', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('f604f021cba44b6fb96115265e557521', '0', null, '添加', null, null, null, '0', '/platform/stationOperator/add', '33a6f5664a194da8bc2394826cc25bc3', '0', '0', '0', '1', '0', '0', '岗位功能', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('f771691134c34174a819b5990310d000', '0', null, '首页', null, null, null, '0', '/platform/', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', '0', '0', '登陆', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('f771691134c34174a819b5990310da56', '0', null, '注销', null, null, null, '0', '/platform/login/logout', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', '0', '0', '登陆', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('f82c021dc443419fb2469032af73bf3e', '0', null, '删除', null, null, null, '0', '/platform/dept/delete', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', '0', '0', '部门', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('fb487ba403254ce8843b39a768422f04', '0', null, '保存', null, null, null, '0', '/platform/param/save', 'ffeeb72e053a4a86a4fe242642877a44', '0', '0', '0', '1', '0', '0', '参数管理', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('fb6a0c1e618041bcbbf8cfd41311b1fa', '0', null, '准备登陆', null, null, null, '0', '/platform/login', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', '0', '0', '登陆', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('fd9978df5c5a47f298e2d28e21e70b15', '0', null, '删除', null, null, null, '0', '/platform/sysLog/delete', '8a40c0353fa828a6013fa898d4ac0029', '0', '0', '0', '1', '0', '0', '日志', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('fdaeeb41691d460b8f142066d1f79927', '0', null, '博客删除', null, null, null, '0', '/test/blog/delete', '7cbeac9418c946a2bda0c6aabf23c276', '0', '0', '0', '1', '0', '0', '博客', '0', '0', '0', '1', '0');
INSERT INTO `pt_operator` VALUES ('ff91363b32424fa399e44cc0dfd688e9', '0', null, '博客查看', null, null, null, '0', '/test/blog/view', '7cbeac9418c946a2bda0c6aabf23c276', '0', '0', '0', '1', '0', '0', '博客', '0', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for `pt_param`
-- ----------------------------
DROP TABLE IF EXISTS `pt_param`;
CREATE TABLE `pt_param` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `images` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `orderids` bigint(20) DEFAULT NULL,
  `paths` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `zhuangtai` char(1) COLLATE utf8_bin DEFAULT NULL,
  `parentids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `isparent` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `levels` bigint(20) DEFAULT NULL,
  `numbers` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `val` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `i18n` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否国际化',
  `val_zhcn` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `val_zhhk` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `val_zhtw` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `val_ja` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `val_enus` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `status` char(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_param
-- ----------------------------
INSERT INTO `pt_param` VALUES ('0c78f87750a745bbb59005a6ca0f744a', '1', null, '3.png', 'weixinToken', '3', '100103root/83f4b0ee56904cbeb5f91696ad804c29/0c78f87750a745bbb59005a6ca0f744a', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinToken', 'weixinchat', '0', 'weixinchat', 'weixinchat', 'weixinchat', 'weixinchat', 'weixinchat', '1');
INSERT INTO `pt_param` VALUES ('7381008292054bccba20224bc33774d7', '7', null, '2.png', 'weixinAppID', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29/7381008292054bccba20224bc33774d7', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppID', '123', '0', '1234', '1234', '1234', '1234', '1234', '1');
INSERT INTO `pt_param` VALUES ('8094c60d7a594b36bb0187cbce9c4188', '0', null, '2.png', 'weixinAppSecret', '2', '100103root/83f4b0ee56904cbeb5f91696ad804c29/8094c60d7a594b36bb0187cbce9c4188', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppSecret', '123', '0', null, null, null, null, null, '1');
INSERT INTO `pt_param` VALUES ('83f4b0ee56904cbeb5f91696ad804c29', '0', null, '2.png', '微信配置', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29', null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'weixinConfig', null, '0', null, null, null, null, null, '1');
INSERT INTO `pt_param` VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '参数树', '1_open.png', '参数树', '1', '100103root', '1', null, 'true', '0', null, null, '0', null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for `pt_resources`
-- ----------------------------
DROP TABLE IF EXISTS `pt_resources`;
CREATE TABLE `pt_resources` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `osname` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ips` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `hostname` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `cpunumber` bigint(20) DEFAULT NULL,
  `cpuratio` decimal(20,10) DEFAULT NULL,
  `phymemory` bigint(20) DEFAULT NULL,
  `phyfreememory` bigint(20) DEFAULT NULL,
  `jvmtotalmemory` bigint(20) DEFAULT NULL,
  `jvmfreememory` bigint(20) DEFAULT NULL,
  `jvmmaxmemory` bigint(20) DEFAULT NULL,
  `gccount` bigint(20) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_resources
-- ----------------------------

-- ----------------------------
-- Table structure for `pt_role`
-- ----------------------------
DROP TABLE IF EXISTS `pt_role`;
CREATE TABLE `pt_role` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `numbers` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_role
-- ----------------------------
INSERT INTO `pt_role` VALUES ('8a40c0353fa828a6013fa898d4ac0023', '2', 'SuperAdmin', '超级管理员', '超级管理员');

-- ----------------------------
-- Table structure for `pt_roleoperator`
-- ----------------------------
DROP TABLE IF EXISTS `pt_roleoperator`;
CREATE TABLE `pt_roleoperator` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '??',
  `roleIds` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '??ids',
  `operatorIds` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '??ids',
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='????';

-- ----------------------------
-- Records of pt_roleoperator
-- ----------------------------
INSERT INTO `pt_roleoperator` VALUES ('021a2c6466994f258c57659b45026593', '8a40c0353fa828a6013fa898d4ac0023', '3e4e9e72dab243d38a1785d157c24cb6');
INSERT INTO `pt_roleoperator` VALUES ('03f99ab1f9104620b619fec5eaed0480', '8a40c0353fa828a6013fa898d4ac0023', 'e037e0bae9a94e549d6b647db49a64a1');
INSERT INTO `pt_roleoperator` VALUES ('053476ee46c44552beac3c3ef14fa037', '8a40c0353fa828a6013fa898d4ac0023', '6daed51284f94923b1c8a6414e646959');
INSERT INTO `pt_roleoperator` VALUES ('064f21920eeb481c86ae50879cd09d34', '8a40c0353fa828a6013fa898d4ac0023', 'a0c01a5248cd4bf38e57945dbb2b98c5');
INSERT INTO `pt_roleoperator` VALUES ('07e6c367e68a437e87126b3345b7ff44', '8a40c0353fa828a6013fa898d4ac0023', 'a2727f19f7cd4a038dd1a94f042a8cf1');
INSERT INTO `pt_roleoperator` VALUES ('0814045ac9ec4230a0b391e425a59540', '8a40c0353fa828a6013fa898d4ac0023', '79039a2260da46b0aabb5a62e8db6c87');
INSERT INTO `pt_roleoperator` VALUES ('09c97f5c18ac4b40bfb2d514d69b22b7', '8a40c0353fa828a6013fa898d4ac0023', '7b4281dd247c4624bee0d8f84c2c2715');
INSERT INTO `pt_roleoperator` VALUES ('0a08705ce1dd44c8b64ffb4af78d57d4', '8a40c0353fa828a6013fa898d4ac0023', 'b4ee4ae4391f4243be69e838545d2131');
INSERT INTO `pt_roleoperator` VALUES ('0a1c22befe984c6cbbb49ca98c85ca08', '8a40c0353fa828a6013fa898d4ac0023', '483bdacba04f4663986e6339166e8321');
INSERT INTO `pt_roleoperator` VALUES ('0bdcecb579304334a80dd169197bc7f1', '8a40c0353fa828a6013fa898d4ac0023', '827a7067a28d442da3ddd834677127af');
INSERT INTO `pt_roleoperator` VALUES ('0cfbb583544d43c7aca70f991ad0f746', '8a40c0353fa828a6013fa898d4ac0023', '7eab5f800bab4efb8df1b2e8a0575f73');
INSERT INTO `pt_roleoperator` VALUES ('0d57b3a3c5264e1e997b18183074d535', '8a40c0353fa828a6013fa898d4ac0023', 'a6623c65480f4f2cb63a4d7673f81e3a');
INSERT INTO `pt_roleoperator` VALUES ('0dfd8909022e48caa30a3bb9f7e48f1e', '8a40c0353fa828a6013fa898d4ac0023', '12141c1c3be241ca8a868bce9cd610d5');
INSERT INTO `pt_roleoperator` VALUES ('0e5432e4c8834200a58fd13a118cd0ce', '8a40c0353fa828a6013fa898d4ac0023', '2c91467f905a4f5ba9f52830131c8ad9');
INSERT INTO `pt_roleoperator` VALUES ('0f58a58a34984332af791d1767b7ab0a', '8a40c0353fa828a6013fa898d4ac0023', '8ca8af501522439d8c9249e00db5d78d');
INSERT INTO `pt_roleoperator` VALUES ('0f9c37f0970d4f3981ddbef662f0f861', '8a40c0353fa828a6013fa898d4ac0023', '1b1a809815574b2a9c1d0e18d692de17');
INSERT INTO `pt_roleoperator` VALUES ('121ba805f7514e64bb415ffc9bf61180', '8a40c0353fa828a6013fa898d4ac0023', '5c2bdc059ae24ffda2758a2781bb46da');
INSERT INTO `pt_roleoperator` VALUES ('129675d8bb95482aaca4b3ef673a4c0a', '8a40c0353fa828a6013fa898d4ac0023', '77823e12391a47729a1f82a00bc15c5b');
INSERT INTO `pt_roleoperator` VALUES ('12a9ee5e7eca44c5ba6e79dedfbc4049', '8a40c0353fa828a6013fa898d4ac0023', '2c2063e17dc742a3b9c330b84c5dfa6a');
INSERT INTO `pt_roleoperator` VALUES ('1322a73d36824bf9bcde729eba789e84', '8a40c0353fa828a6013fa898d4ac0023', '7ae62737df444d619f8fd376360d160c');
INSERT INTO `pt_roleoperator` VALUES ('139064e3c70c4e00babba49593146b1a', '8a40c0353fa828a6013fa898d4ac0023', '1b0d7476974e4bf9b52f75fb82f87330');
INSERT INTO `pt_roleoperator` VALUES ('1491b0d0f9fb406e92f1a990fb8268fe', '8a40c0353fa828a6013fa898d4ac0023', 'dfe9d74fe0ef4220bfcfe6d7bb2f9436');
INSERT INTO `pt_roleoperator` VALUES ('16e9ecd28cc842048a16f8304f3fd571', '8a40c0353fa828a6013fa898d4ac0023', '18f50e0f48ef4dd9bec85f5612ab10c0');
INSERT INTO `pt_roleoperator` VALUES ('1a0b60e808e145989a031277b83efae6', '8a40c0353fa828a6013fa898d4ac0023', '8329f58a0eed44e195dec78bddc591b5');
INSERT INTO `pt_roleoperator` VALUES ('1c26cfb2d7d94ad38ce0c553644f9ddd', '8a40c0353fa828a6013fa898d4ac0023', '091855dd809b418fae88a7fec6d9f246');
INSERT INTO `pt_roleoperator` VALUES ('1cd441db6daf407492d9b32a597232b1', '8a40c0353fa828a6013fa898d4ac0023', '08a96d5dd37f49459eeb02eebeb0a78c');
INSERT INTO `pt_roleoperator` VALUES ('1d18394cb6ed4f71b60c2eb3f8b511d9', '8a40c0353fa828a6013fa898d4ac0023', '8897dbe85b3e4e6989d662495272cf26');
INSERT INTO `pt_roleoperator` VALUES ('1f5bd29eabd84310b935ac26e4865aa8', '8a40c0353fa828a6013fa898d4ac0023', '1f05b6496a494f488e4cacd2a449c37a');
INSERT INTO `pt_roleoperator` VALUES ('20d039c9d09d427e802607a4d026300b', '8a40c0353fa828a6013fa898d4ac0023', '3da96263a14343eaa7b409a93ec9e1db');
INSERT INTO `pt_roleoperator` VALUES ('22eb103099d2495f98d1bc4dc449933a', '8a40c0353fa828a6013fa898d4ac0023', 'f604f021cba44b6fb96115265e557521');
INSERT INTO `pt_roleoperator` VALUES ('2336da1b46bb47629cd265869b3f7308', '8a40c0353fa828a6013fa898d4ac0023', '0da15c49299d41a4b720f787d053e3cb');
INSERT INTO `pt_roleoperator` VALUES ('260a75c9b59644eeb72a3fd8966cf5c9', '8a40c0353fa828a6013fa898d4ac0023', 'cc88acee3a664c58861a872c351385e6');
INSERT INTO `pt_roleoperator` VALUES ('26d880cfc63f48b5ad42fc170d69693e', '8a40c0353fa828a6013fa898d4ac0023', 'b8218945b8e743f29651569950014511');
INSERT INTO `pt_roleoperator` VALUES ('27274973f3e54783ae986912b84d91bc', '8a40c0353fa828a6013fa898d4ac0023', '6569e0d9f2cd4e3a97af4e1b0cd8d2f7');
INSERT INTO `pt_roleoperator` VALUES ('2897ed0986344de0a790c1c315381a43', '8a40c0353fa828a6013fa898d4ac0023', '4a6544ae7a2548ad81c0e3994999023c');
INSERT INTO `pt_roleoperator` VALUES ('2a0b60e808e145989a031277b83efae7', '8a40c0353fa828a6013fa898d4ac0023', '1329f58a0eed44e195dec78bddc591b6');
INSERT INTO `pt_roleoperator` VALUES ('2a0b60e808e145989a031277b83efae8', '8a40c0353fa828a6013fa898d4ac0023', '2329f58a0eed44e195dec78bddc591b7');
INSERT INTO `pt_roleoperator` VALUES ('2a0b60e808e145989a031277b83efae9', '8a40c0353fa828a6013fa898d4ac0023', '3329f58a0eed44e195dec78bddc591b8');
INSERT INTO `pt_roleoperator` VALUES ('2b0fc857882b4fd0a068d8ddaf514eab', '8a40c0353fa828a6013fa898d4ac0023', '053d330462e1459ca1012c9d29113bc4');
INSERT INTO `pt_roleoperator` VALUES ('2bc4654b3cc74eccad6ff320ede62385', '8a40c0353fa828a6013fa898d4ac0023', 'cc6bcbee40ab43b2bd5aff6d9385e1fc');
INSERT INTO `pt_roleoperator` VALUES ('2c2d096b627e4d3681f494e4ef38e6f0', '8a40c0353fa828a6013fa898d4ac0023', 'b13b002e2fad4e95bbe0e4dbc9fbdfe1');
INSERT INTO `pt_roleoperator` VALUES ('2c4b1fd860a4423a8590460f0b438ce0', '8a40c0353fa828a6013fa898d4ac0023', '9adcc4c40e3148988e5003aaedbb4948');
INSERT INTO `pt_roleoperator` VALUES ('2cbe2ac6fb8949e7be60da86395c5c88', '8a40c0353fa828a6013fa898d4ac0023', 'd5c8bdf7a49a4e46b776c05dc9ead484');
INSERT INTO `pt_roleoperator` VALUES ('2e1c21e46cd24d828de30f883f131f26', '8a40c0353fa828a6013fa898d4ac0023', 'fdaeeb41691d460b8f142066d1f79927');
INSERT INTO `pt_roleoperator` VALUES ('308307140623475bbbd3812288c68a4b', '8a40c0353fa828a6013fa898d4ac0023', '01aa0c85c8b84ae8aca7f5484336b203');
INSERT INTO `pt_roleoperator` VALUES ('32042be89a574cefaa2697f2d7fee41a', '8a40c0353fa828a6013fa898d4ac0023', '9750ea3ee4474711b9acbda8d5b87ee7');
INSERT INTO `pt_roleoperator` VALUES ('3601e3cd19e842f4bbf2d438857a7c68', '8a40c0353fa828a6013fa898d4ac0023', '29c18b3394924c30882da049da14ad99');
INSERT INTO `pt_roleoperator` VALUES ('382c564f5d6e4d11b17b2b729c8d30d0', '8a40c0353fa828a6013fa898d4ac0023', '3ee5f986289d4a1990f4e42c9a0caadb');
INSERT INTO `pt_roleoperator` VALUES ('38829184b84a44eeb82e00a8db46d3a2', '8a40c0353fa828a6013fa898d4ac0023', '4df80521e66447618796c3cfe02bf239');
INSERT INTO `pt_roleoperator` VALUES ('3bd650048f764fbf93a427c31a27274c', '8a40c0353fa828a6013fa898d4ac0023', '8bd9c0e14df941cdaf6253cd08dbd9cd');
INSERT INTO `pt_roleoperator` VALUES ('3c6b00c1db03430cb7e78880e4f283ec', '8a40c0353fa828a6013fa898d4ac0023', 'ad09a1b897744812875c752c2d70f11a');
INSERT INTO `pt_roleoperator` VALUES ('3d6a531acb2a4b199be1bd541f85caf4', '8a40c0353fa828a6013fa898d4ac0023', '5b47ae382f42421682852f889c176d49');
INSERT INTO `pt_roleoperator` VALUES ('3f60245dacb14844a6968a2884edaf07', '8a40c0353fa828a6013fa898d4ac0023', 'e2cead0f68ac4a2d98765264578a9f83');
INSERT INTO `pt_roleoperator` VALUES ('40707f58daee4d81b19b214c52eeb6a7', '8a40c0353fa828a6013fa898d4ac0023', 'c29ea4cbd9044bc786e9f4584ad840ff');
INSERT INTO `pt_roleoperator` VALUES ('41a43064ffa240ee9e9c84dff0d9e371', '8a40c0353fa828a6013fa898d4ac0023', 'e1ac811d2a16495d927f994dd006e824');
INSERT INTO `pt_roleoperator` VALUES ('41ed858aaaae4fc2bc1f197fe295af52', '8a40c0353fa828a6013fa898d4ac0023', 'e4f182b4009e48a58673134324b2ec56');
INSERT INTO `pt_roleoperator` VALUES ('42fbd1334a0849f6a06db739c11280f1', '8a40c0353fa828a6013fa898d4ac0023', 'f771691134c34174a819b5990310d000');
INSERT INTO `pt_roleoperator` VALUES ('43666165e4dd4cf3901e690613e47a66', '8a40c0353fa828a6013fa898d4ac0023', '46b7269a26044dfebb4edd06a2f9cd83');
INSERT INTO `pt_roleoperator` VALUES ('461c341a4da84a828fd720559c8116a4', '8a40c0353fa828a6013fa898d4ac0023', '09b6ce29313c4051ba765de516a9b283');
INSERT INTO `pt_roleoperator` VALUES ('46b9e0e47ad347dcb53e123c466db2a4', '8a40c0353fa828a6013fa898d4ac0023', 'b82d86fb7b64498a9c2b8b9a99b3fbeb');
INSERT INTO `pt_roleoperator` VALUES ('46f79be38d3340a0a752ef2f53ae661a', '8a40c0353fa828a6013fa898d4ac0023', '91baed789bc14efdbebb10b49c69ee5b');
INSERT INTO `pt_roleoperator` VALUES ('476fd5e99b214541aefd5c81982f624d', '8a40c0353fa828a6013fa898d4ac0023', 'a498a20dd4824b8fb103202360669de4');
INSERT INTO `pt_roleoperator` VALUES ('48db3f1015414972b274fcee382b5283', '8a40c0353fa828a6013fa898d4ac0023', '7ed5eefbbf3d4aa78d0c5b99f3b7010c');
INSERT INTO `pt_roleoperator` VALUES ('4ce7264311a3437db22445df4b643066', '8a40c0353fa828a6013fa898d4ac0023', '30bf01ffe1cb4ed39e92c6600ea39e93');
INSERT INTO `pt_roleoperator` VALUES ('4ddf4f2e1b9b495ebadeaef3029fd410', '8a40c0353fa828a6013fa898d4ac0023', '235d855d7b914d728e434f0f309aa04d');
INSERT INTO `pt_roleoperator` VALUES ('4eae708ad5974a57b0accc638eadac99', '8a40c0353fa828a6013fa898d4ac0023', 'fb6a0c1e618041bcbbf8cfd41311b1fa');
INSERT INTO `pt_roleoperator` VALUES ('521239b354cb482ba643238799d17e43', '8a40c0353fa828a6013fa898d4ac0023', '481d4d5c0a634c4085c72c990260e58d');
INSERT INTO `pt_roleoperator` VALUES ('535104b0d1d841eda391e58f2427fccc', '8a40c0353fa828a6013fa898d4ac0023', '4bebccaa8f0c4bfbaa2ff89f00706100');
INSERT INTO `pt_roleoperator` VALUES ('5459dad86a584a598ad51c10fcee1f7c', '8a40c0353fa828a6013fa898d4ac0023', '671ce1e6167840baaa6d27f4f04574c9');
INSERT INTO `pt_roleoperator` VALUES ('574921333dd64e4b8e4956436a698ec5', '8a40c0353fa828a6013fa898d4ac0023', '3085a3b0c20d4f3aaa7c2d27fe986aba');
INSERT INTO `pt_roleoperator` VALUES ('598267639b534e7ca95a8248b7e1250a', '8a40c0353fa828a6013fa898d4ac0023', 'c7132250f5054b808bb119122a6ecb52');
INSERT INTO `pt_roleoperator` VALUES ('5d0a48f1e78844cb9ed82c71b720f961', '8a40c0353fa828a6013fa898d4ac0023', 'aa126932641f4e068ed8278a332de85d');
INSERT INTO `pt_roleoperator` VALUES ('5fcb0597c6494021b0cb167161227d75', '8a40c0353fa828a6013fa898d4ac0023', '4376888fd74f4247a926529e5da03442');
INSERT INTO `pt_roleoperator` VALUES ('612117075c2d47c09df60c7ec316a466', '8a40c0353fa828a6013fa898d4ac0023', '437e05d09dd94720b67c4f230cdebe58');
INSERT INTO `pt_roleoperator` VALUES ('623d81207a5142638a8ba821dff1dbc3', '8a40c0353fa828a6013fa898d4ac0023', 'da6077ec1f354a409d0385b2c063e044');
INSERT INTO `pt_roleoperator` VALUES ('65bfac49893b406db04811795ff89f50', '8a40c0353fa828a6013fa898d4ac0023', 'a5289b2638d845fbb06dedbcdd517f97');
INSERT INTO `pt_roleoperator` VALUES ('65ee6094c4254096ab682c2699045fbe', '8a40c0353fa828a6013fa898d4ac0023', '37218fb52ec94fb4bf76209a17916094');
INSERT INTO `pt_roleoperator` VALUES ('6678e6fe003f43cc974fe6843da8688f', '8a40c0353fa828a6013fa898d4ac0023', '21b0a910ef6e4c60a325d5e57e6e6f65');
INSERT INTO `pt_roleoperator` VALUES ('6779f7b61b354ff88f4b72d6bab43c60', '8a40c0353fa828a6013fa898d4ac0023', '22926eb196a14b48be775f4880b5ba94');
INSERT INTO `pt_roleoperator` VALUES ('6aff9f7ef6344466a81de2c7eae4526a', '8a40c0353fa828a6013fa898d4ac0023', '9765e6bb76eb40ab800cb8954822190e');
INSERT INTO `pt_roleoperator` VALUES ('6b79fc49b2ed47e788c17fe41f217881', '8a40c0353fa828a6013fa898d4ac0023', 'ccf9b69e151840a28be75d8443b70273');
INSERT INTO `pt_roleoperator` VALUES ('6beeb6d1ee5544d49d03bfec34ceb56a', '8a40c0353fa828a6013fa898d4ac0023', 'f82c021dc443419fb2469032af73bf3e');
INSERT INTO `pt_roleoperator` VALUES ('6bf45b956cae4a1abed8865aa135fb6f', '8a40c0353fa828a6013fa898d4ac0023', '15566e63f3104c73b4a0b4a784dd11ca');
INSERT INTO `pt_roleoperator` VALUES ('6e3f829795a843b3b6f1044d7d19fbdb', '8a40c0353fa828a6013fa898d4ac0023', '233356b63d8e477fb6e948b703232809');
INSERT INTO `pt_roleoperator` VALUES ('71b8572ae55c41c4ba79151001166116', '8a40c0353fa828a6013fa898d4ac0023', '5b249ad344d948b99f58768c323f5f71');
INSERT INTO `pt_roleoperator` VALUES ('71d7a275c84044e9b5cc1562f4bf3396', '8a40c0353fa828a6013fa898d4ac0023', '6324ff9e83654aa0bf7f9d918b636b55');
INSERT INTO `pt_roleoperator` VALUES ('71eebd3168454ea0951e7182cf00e3c9', '8a40c0353fa828a6013fa898d4ac0023', '90c3cee940ea4211a714f5111d24ff5d');
INSERT INTO `pt_roleoperator` VALUES ('7396df5d012b412e9651805a4458a982', '8a40c0353fa828a6013fa898d4ac0023', '0773a58c4bdb4858ab062c4a2a4da69a');
INSERT INTO `pt_roleoperator` VALUES ('7611c160125a4b92ba67a6e924597ddb', '8a40c0353fa828a6013fa898d4ac0023', '1046389d8525451697f2793185e7d6ee');
INSERT INTO `pt_roleoperator` VALUES ('76e452d549b341b88fd8d5d51844d4f1', '8a40c0353fa828a6013fa898d4ac0023', '5fcac107c80d493d91b53a815d4b297a');
INSERT INTO `pt_roleoperator` VALUES ('7a42d1b5ab884d7098f913c16bcc7b48', '8a40c0353fa828a6013fa898d4ac0023', 'c081c50918f4459f8e36ab8cb4151a61');
INSERT INTO `pt_roleoperator` VALUES ('7b5c188e225d4fb9982e8973c1a49e90', '8a40c0353fa828a6013fa898d4ac0023', '39d82b5574b540b88d3723b36eb3e577');
INSERT INTO `pt_roleoperator` VALUES ('7e3f2af3206846fd8e35be1520e474e8', '8a40c0353fa828a6013fa898d4ac0023', '09dbbe046d6e469d8a5ba12e29abc522');
INSERT INTO `pt_roleoperator` VALUES ('7fd3982f773b4a8987ab69cfd101af11', '8a40c0353fa828a6013fa898d4ac0023', '6b527ed138c343a89ddf73cf16fef565');
INSERT INTO `pt_roleoperator` VALUES ('814f34aa1cde4a6a9c37e5966ed4ed5b', '8a40c0353fa828a6013fa898d4ac0023', '58a85040aa9f40cca0bdba6e23e30363');
INSERT INTO `pt_roleoperator` VALUES ('81b4dfa9ce5a4bc09e77e361b3bd5e6d', '8a40c0353fa828a6013fa898d4ac0023', '335d1f8f46eb47a18001889f8cc21348');
INSERT INTO `pt_roleoperator` VALUES ('82b6a5c1589b4a75b472a858462f9a5c', '8a40c0353fa828a6013fa898d4ac0023', '5148ea207b974ee197f0bc57060ab1ad');
INSERT INTO `pt_roleoperator` VALUES ('848474d1de20428ca6749f49b3e260da', '8a40c0353fa828a6013fa898d4ac0023', 'd496b161d2564111992687b948862244');
INSERT INTO `pt_roleoperator` VALUES ('85da45980b4247f0abc6e09ffafd7f8f', '8a40c0353fa828a6013fa898d4ac0023', '2fee901117c64e18873f60e8f800713d');
INSERT INTO `pt_roleoperator` VALUES ('8718e76a4ed14c609501acf0efe44c61', '8a40c0353fa828a6013fa898d4ac0023', '2be34991827e4e8da8e92f9b9e8bce25');
INSERT INTO `pt_roleoperator` VALUES ('87e0d85628b24118b9506babc049e6e7', '8a40c0353fa828a6013fa898d4ac0023', '88298fbd650d49f492e268816feffd15');
INSERT INTO `pt_roleoperator` VALUES ('8be5e404ae3149eb87eb0d3e32c178be', '8a40c0353fa828a6013fa898d4ac0023', 'c9d013d14cbd4f148fb4562c91803ee8');
INSERT INTO `pt_roleoperator` VALUES ('8d6b0c75af9340afaf812bdc9b737df7', '8a40c0353fa828a6013fa898d4ac0023', 'b8339f29d8d84a4ead6454295f87b79c');
INSERT INTO `pt_roleoperator` VALUES ('905956517a0f48a59c7481507c3dc2c4', '8a40c0353fa828a6013fa898d4ac0023', '4e03be6af2c74dae99a131a1ab3569f6');
INSERT INTO `pt_roleoperator` VALUES ('93192c14c94c4aab86520e29bc8cf3a8', '8a40c0353fa828a6013fa898d4ac0023', '351851fb7fce48f9a0ff6747971715ac');
INSERT INTO `pt_roleoperator` VALUES ('942227d7d02342d9a3d4d0cedc272a88', '8a40c0353fa828a6013fa898d4ac0023', '886bd497064b4c9f87d8461ebba421d1');
INSERT INTO `pt_roleoperator` VALUES ('98ea132c9f3c41f7a14e75a54b25cb4b', '8a40c0353fa828a6013fa898d4ac0023', 'cf26c1d2baa24a8791b3d264154b80d4');
INSERT INTO `pt_roleoperator` VALUES ('9bb5bde523264234b36f6a6f1790b097', '8a40c0353fa828a6013fa898d4ac0023', 'fb487ba403254ce8843b39a768422f04');
INSERT INTO `pt_roleoperator` VALUES ('9f84e5533e804e709c2f63eb2e958729', '8a40c0353fa828a6013fa898d4ac0023', 'a1ff68acf9b24c34b347ff21e333cb70');
INSERT INTO `pt_roleoperator` VALUES ('a11a562993784cabb5ae5d9ce3bda6cd', '8a40c0353fa828a6013fa898d4ac0023', '2bd0e8f116f9420692a81d1723cecf5c');
INSERT INTO `pt_roleoperator` VALUES ('a303d192041f40468970a75118d2b3e6', '8a40c0353fa828a6013fa898d4ac0023', 'a0d2897ee9194378819e78538189faa0');
INSERT INTO `pt_roleoperator` VALUES ('a3a679f9187d4bd8819c77e67dfae367', '8a40c0353fa828a6013fa898d4ac0023', '4959d88b8ca64eb19310c30799faa07c');
INSERT INTO `pt_roleoperator` VALUES ('a77dc935e8c0491e9c272bcfd67fa7c1', '8a40c0353fa828a6013fa898d4ac0023', '2fbbc9cfb0bf4b5bb504ead155c3423c');
INSERT INTO `pt_roleoperator` VALUES ('a851dde123ab4697b74225e8725f4633', '8a40c0353fa828a6013fa898d4ac0023', 'ad51a6ca95c646ce9c03778eda715734');
INSERT INTO `pt_roleoperator` VALUES ('ac26282436074fad81655fd5d639454f', '8a40c0353fa828a6013fa898d4ac0023', 'd646da8707ae41838fd2ec9bf0d467ee');
INSERT INTO `pt_roleoperator` VALUES ('ac2b6a038db74fe39664222aae93d1ff', '8a40c0353fa828a6013fa898d4ac0023', '32a3e59964204a3c8848e84b864306ae');
INSERT INTO `pt_roleoperator` VALUES ('ac4a6c8005de4afca3aa04f82b0f64d1', '8a40c0353fa828a6013fa898d4ac0023', 'ee27f5c23b6d4217b3b66295a3506a40');
INSERT INTO `pt_roleoperator` VALUES ('ac74144a8d7d4d5790073c0387d7a20c', '8a40c0353fa828a6013fa898d4ac0023', 'c04adcd019e04cf3ba7c66af721a18dc');
INSERT INTO `pt_roleoperator` VALUES ('aedaaa19e1da475d8f9a71c4217a80b9', '8a40c0353fa828a6013fa898d4ac0023', '235d855d7b914d728e434f0f309ab041');
INSERT INTO `pt_roleoperator` VALUES ('aee1eb6feb4943798513c1770a41e9ae', '8a40c0353fa828a6013fa898d4ac0023', 'acbceb432b5849aca9e9b284240281ec');
INSERT INTO `pt_roleoperator` VALUES ('b0bfdc9cfedf407cabd2964630c4262e', '8a40c0353fa828a6013fa898d4ac0023', 'f771691134c34174a819b5990310da56');
INSERT INTO `pt_roleoperator` VALUES ('b1eb78ff76de482bb88e0fb8acca7d5a', '8a40c0353fa828a6013fa898d4ac0023', '78c6026c6af44b41a6bef4cdb4cfb414');
INSERT INTO `pt_roleoperator` VALUES ('b5bb8efe0adc4a62a606d768c61e10e8', '8a40c0353fa828a6013fa898d4ac0023', '6566adb7fc6347e7b01a3c47129b5eb5');
INSERT INTO `pt_roleoperator` VALUES ('b8481bf5a29e41d8994b11542bae9a46', '8a40c0353fa828a6013fa898d4ac0023', '721f7255449c445faf36607c254eea06');
INSERT INTO `pt_roleoperator` VALUES ('b91ff9778e70437da2c875f433fb9cf7', '8a40c0353fa828a6013fa898d4ac0023', 'f1f6f2c8f026498c8ee64b7a918d06df');
INSERT INTO `pt_roleoperator` VALUES ('b9370c02cc8248f2aa415e0f5c2b083c', '8a40c0353fa828a6013fa898d4ac0023', 'bc2c865be6af42cf861294d446fb1c6f');
INSERT INTO `pt_roleoperator` VALUES ('bafd8455940a46d9af5b42fa6d01aeba', '8a40c0353fa828a6013fa898d4ac0023', '1d2b6919b80a4a21821adc3efcda77b2');
INSERT INTO `pt_roleoperator` VALUES ('bee5de9aa4714491b9cda9b3430aefd0', '8a40c0353fa828a6013fa898d4ac0023', '5d6f2bb8faa948108081492179d0c0ad');
INSERT INTO `pt_roleoperator` VALUES ('c0a5951482284b10ba6d7c7e0c5131fc', '8a40c0353fa828a6013fa898d4ac0023', '8b1c1c86385642f2b6c97930b44bbbcf');
INSERT INTO `pt_roleoperator` VALUES ('c433c6229611482f812595ed46c8c87b', '8a40c0353fa828a6013fa898d4ac0023', 'd479dbdc901f4d85a207b9bace6465ac');
INSERT INTO `pt_roleoperator` VALUES ('c8193e0665dc466f81c1785cf9a06eb5', '8a40c0353fa828a6013fa898d4ac0023', 'e754dfdb794d4e7db6023c9b089a340c');
INSERT INTO `pt_roleoperator` VALUES ('c9f24b55cf28484db39e137ea4fa35df', '8a40c0353fa828a6013fa898d4ac0023', 'df0aa534655242e4a0bcd638b51a4e03');
INSERT INTO `pt_roleoperator` VALUES ('cb88488a98ad4f17b2b0c23f3d386344', '8a40c0353fa828a6013fa898d4ac0023', 'c05642442e0a468ebe4f0b7771a803ae');
INSERT INTO `pt_roleoperator` VALUES ('cbd5349f6175452fba4aae0b628e9cce', '8a40c0353fa828a6013fa898d4ac0023', '61da3d9c60704621aa60d1da4553a264');
INSERT INTO `pt_roleoperator` VALUES ('cede53073ad749bc9bb4621249c92852', '8a40c0353fa828a6013fa898d4ac0023', '8f79857b31d4475a94c712e997e89c99');
INSERT INTO `pt_roleoperator` VALUES ('d233b60121504d9ca79138c0778fdd8a', '8a40c0353fa828a6013fa898d4ac0023', '9a708f39e123455e84b6125774bab1ea');
INSERT INTO `pt_roleoperator` VALUES ('d32280e50ef74270803dfaac49b7b5b2', '8a40c0353fa828a6013fa898d4ac0023', 'dfc7af0979a54e8e9a3f18b7a5d66030');
INSERT INTO `pt_roleoperator` VALUES ('d4c6a7deed2847e8bad34b69a559a53e', '8a40c0353fa828a6013fa898d4ac0023', '0478826a46df4f20b12f4043a97f8209');
INSERT INTO `pt_roleoperator` VALUES ('d4f1296a506e48c39291e2b55a5deb33', '8a40c0353fa828a6013fa898d4ac0023', '2e32e08e495b4ccea6148774e9f91182');
INSERT INTO `pt_roleoperator` VALUES ('db0dcaa30f7948c59d857da13eb368ef', '8a40c0353fa828a6013fa898d4ac0023', '1a8b4d8e4411412fa8bb561393563a85');
INSERT INTO `pt_roleoperator` VALUES ('dc7210d217c54f09ac800e47b2cabf69', '8a40c0353fa828a6013fa898d4ac0023', 'ff91363b32424fa399e44cc0dfd688e9');
INSERT INTO `pt_roleoperator` VALUES ('dcaaf233f3344fa183ea6fcf4838107f', '8a40c0353fa828a6013fa898d4ac0023', 'c0ccfcd127c347a8b9db140e5aa62188');
INSERT INTO `pt_roleoperator` VALUES ('dd46b92bb26f4bc1b474c157d60245f8', '8a40c0353fa828a6013fa898d4ac0023', '362cf247241c4d12b6242301e4a73516');
INSERT INTO `pt_roleoperator` VALUES ('df4ce9dce40941e6b97ac7ef6caa0878', '8a40c0353fa828a6013fa898d4ac0023', 'dc750e57b54f4baca78d66969321ee51');
INSERT INTO `pt_roleoperator` VALUES ('df5eca83889a4057b2a1581bcfc84c52', '8a40c0353fa828a6013fa898d4ac0023', '48db51f20b504c4ab489b1dcfd3ecbd9');
INSERT INTO `pt_roleoperator` VALUES ('e00da5f72a8545e58f41723e4aaf9815', '8a40c0353fa828a6013fa898d4ac0023', '10499bc7f9cb4adf99beba00343b4ea6');
INSERT INTO `pt_roleoperator` VALUES ('e060f34c9f1744d1aeb1e01a920158ba', '8a40c0353fa828a6013fa898d4ac0023', '21141da4febe4c929abe37126b37fd12');
INSERT INTO `pt_roleoperator` VALUES ('e0613568a4df4bfb8e6a6b4a691775e8', '8a40c0353fa828a6013fa898d4ac0023', '420d8ebc68ad44dc8188d4c27dc585d1');
INSERT INTO `pt_roleoperator` VALUES ('e32d74ddaae549cc830a6f030a4508c6', '8a40c0353fa828a6013fa898d4ac0023', '46e00ef0fd234e9dbf68ed9bbb437d0f');
INSERT INTO `pt_roleoperator` VALUES ('e3e0093504904769a12d7814a90ecc5e', '8a40c0353fa828a6013fa898d4ac0023', '9f75b47bdc0249e2b493c47384785a72');
INSERT INTO `pt_roleoperator` VALUES ('e50e023a31e34903816644e3246f740b', '8a40c0353fa828a6013fa898d4ac0023', '9c0ae757fc564f27860b975e5792ae6a');
INSERT INTO `pt_roleoperator` VALUES ('e54f1e31da9a4f728f66fdfd94d0bb5b', '8a40c0353fa828a6013fa898d4ac0023', 'b23b17d4c83242e8a1a8ee8cfcde9907');
INSERT INTO `pt_roleoperator` VALUES ('e597c74ee6d44858b3c99b157b3e92e8', '8a40c0353fa828a6013fa898d4ac0023', 'd247fb45be724ed2a2bb5c92d73bf6cf');
INSERT INTO `pt_roleoperator` VALUES ('e62ace3aeff74b18a215dc41dfece9e0', '8a40c0353fa828a6013fa898d4ac0023', 'd115d08591ef4c0eaebef15f8294b287');
INSERT INTO `pt_roleoperator` VALUES ('e6685532fd524e7380a560b4ecdb00da', '8a40c0353fa828a6013fa898d4ac0023', '7cc12b5c154a4a9782c518c57e8ab3aa');
INSERT INTO `pt_roleoperator` VALUES ('e81aad2c22d746d9902630ff3c521fcf', '8a40c0353fa828a6013fa898d4ac0023', 'c1e991d1f56749298c18ff69d7777e0b');
INSERT INTO `pt_roleoperator` VALUES ('e87c7e1f682e421bad56c9f97f5c3d2e', '8a40c0353fa828a6013fa898d4ac0023', '423e8c2e2a644bbda0803f46ea8f31e2');
INSERT INTO `pt_roleoperator` VALUES ('e9f51cc82e6641cc9a4889a696f2977b', '8a40c0353fa828a6013fa898d4ac0023', '910955c2192a418995eeab8bf15372e9');
INSERT INTO `pt_roleoperator` VALUES ('ec385c4831f145e286b528e077d450d6', '8a40c0353fa828a6013fa898d4ac0023', '05114c0cbe1f4c2095b3216f13cfb681');
INSERT INTO `pt_roleoperator` VALUES ('edae7d1fceea4a2ea20a7ec403686277', '8a40c0353fa828a6013fa898d4ac0023', '3dd486cd58da467dbd83ae420db14815');
INSERT INTO `pt_roleoperator` VALUES ('eeed83d366eb4083968cfdae9dba28b1', '8a40c0353fa828a6013fa898d4ac0023', 'ca0f6da01ada419eaa7739d9790e5b88');
INSERT INTO `pt_roleoperator` VALUES ('f0141c6068f74b8a95c3bf732c0111b8', '8a40c0353fa828a6013fa898d4ac0023', '7bd7ca42560140ee8573b2ade6388f3e');
INSERT INTO `pt_roleoperator` VALUES ('f2cfb3f642f64fdc80daecf002266bb9', '8a40c0353fa828a6013fa898d4ac0023', '0fb7938c7d614fc389568eb67b442303');
INSERT INTO `pt_roleoperator` VALUES ('f7dcf386fcf4407b863c923290200154', '8a40c0353fa828a6013fa898d4ac0023', '83ef85fd17804bb195d0ad3c07f88c30');
INSERT INTO `pt_roleoperator` VALUES ('fec66e284bd8410bbcf863da0f9fe91d', '8a40c0353fa828a6013fa898d4ac0023', 'fd9978df5c5a47f298e2d28e21e70b15');

-- ----------------------------
-- Table structure for `pt_station`
-- ----------------------------
DROP TABLE IF EXISTS `pt_station`;
CREATE TABLE `pt_station` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `images` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `isparent` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `orderids` bigint(20) DEFAULT NULL,
  `parentstationids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_station
-- ----------------------------
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '根节点', '1_open.png', 'true', '岗位组织结构', '1', null);
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0021', '0', '人事经理', '2.png', 'false', '人事经理', '6', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0022', '0', '财务经理', '3.png', 'false', '财务经理', '8', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '行政经理', '4.png', 'false', '行政经理', '7', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0024', '0', '测试经理', '5.png', 'false', '测试经理111', '9', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0025', '0', '研发经理', '6.png', 'false', '研发经理', '1', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '应用Java', '8.png', 'false', '应用Java', '3', '8a40c0353fa828a6013fa898d4ac0027');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', '应用经理', '7.png', 'true', '应用经理', '2', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', '应用C++', '2.png', 'false', '应用C++', '5', '8a40c0353fa828a6013fa898d4ac0027');

-- ----------------------------
-- Table structure for `pt_stationoperator`
-- ----------------------------
DROP TABLE IF EXISTS `pt_stationoperator`;
CREATE TABLE `pt_stationoperator` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '??',
  `stationids` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '??ids',
  `operatorids` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '??ids',
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='????';

-- ----------------------------
-- Records of pt_stationoperator
-- ----------------------------
INSERT INTO `pt_stationoperator` VALUES ('00502f4cf0c24bd68cf98691cbd92279', '8a40c0353fa828a6013fa898d4ac0026', '1f05b6496a494f488e4cacd2a449c37a');
INSERT INTO `pt_stationoperator` VALUES ('02ac78ef2c574e56afc9bb37b296d947', '8a40c0353fa828a6013fa898d4ac0026', 'da6077ec1f354a409d0385b2c063e044');
INSERT INTO `pt_stationoperator` VALUES ('0314a857a41a463296a4f646d14dd02b', '8a40c0353fa828a6013fa898d4ac0026', '7ed5eefbbf3d4aa78d0c5b99f3b7010c');
INSERT INTO `pt_stationoperator` VALUES ('07297e25620e43928ddd21de0cc0e3da', '8a40c0353fa828a6013fa898d4ac0026', '10499bc7f9cb4adf99beba00343b4ea6');
INSERT INTO `pt_stationoperator` VALUES ('0753f83d4b9749e581a0d4b5388a64c5', '8a40c0353fa828a6013fa898d4ac0026', 'c9d013d14cbd4f148fb4562c91803ee8');
INSERT INTO `pt_stationoperator` VALUES ('077005c2e19d498b8c4e24b7988fa1f5', '8a40c0353fa828a6013fa898d4ac0026', '2e32e08e495b4ccea6148774e9f91182');
INSERT INTO `pt_stationoperator` VALUES ('07d0294bb41e47bd9e531ad8d6cf4037', '8a40c0353fa828a6013fa898d4ac0026', 'fb487ba403254ce8843b39a768422f04');
INSERT INTO `pt_stationoperator` VALUES ('0a8e21a3952d4307a198ebef2a62ee27', '8a40c0353fa828a6013fa898d4ac0026', '362cf247241c4d12b6242301e4a73516');
INSERT INTO `pt_stationoperator` VALUES ('0aed618e795d4eb4ae11cef12f0a9a05', '8a40c0353fa828a6013fa898d4ac0026', '235d855d7b914d728e434f0f309aa04d');
INSERT INTO `pt_stationoperator` VALUES ('0c6421b8174144b19ad0ad112bb6f230', '8a40c0353fa828a6013fa898d4ac0026', '2c2063e17dc742a3b9c330b84c5dfa6a');
INSERT INTO `pt_stationoperator` VALUES ('0fcb2abde5bb497da08ec6965a475f38', '8a40c0353fa828a6013fa898d4ac0026', '48db51f20b504c4ab489b1dcfd3ecbd9');
INSERT INTO `pt_stationoperator` VALUES ('11354618ab2a41e38ea7af6c4bdeaa34', '8a40c0353fa828a6013fa898d4ac0026', '437e05d09dd94720b67c4f230cdebe58');
INSERT INTO `pt_stationoperator` VALUES ('11cc4d801a6c480984774295dbef07c3', '8a40c0353fa828a6013fa898d4ac0026', '12141c1c3be241ca8a868bce9cd610d5');
INSERT INTO `pt_stationoperator` VALUES ('153c3eb1fa6046f187ec7e528a6b4cbc', '8a40c0353fa828a6013fa898d4ac0026', '9f75b47bdc0249e2b493c47384785a72');
INSERT INTO `pt_stationoperator` VALUES ('16a5d266dec74e5383bd39d9113d33f9', '8a40c0353fa828a6013fa898d4ac0026', '4e03be6af2c74dae99a131a1ab3569f6');
INSERT INTO `pt_stationoperator` VALUES ('16b501a5dd354d4fbc3ab90b5868ab7e', '8a40c0353fa828a6013fa898d4ac0026', 'b8339f29d8d84a4ead6454295f87b79c');
INSERT INTO `pt_stationoperator` VALUES ('171ee8ac60f34b1bb6707788f6d1e1e6', '8a40c0353fa828a6013fa898d4ac0026', 'f771691134c34174a819b5990310da56');
INSERT INTO `pt_stationoperator` VALUES ('17757d37e01e474caa7f1aa00aa49c59', '8a40c0353fa828a6013fa898d4ac0026', 'c7132250f5054b808bb119122a6ecb52');
INSERT INTO `pt_stationoperator` VALUES ('177bfc023f02485196e0fcc6b4124510', '8a40c0353fa828a6013fa898d4ac0026', 'd247fb45be724ed2a2bb5c92d73bf6cf');
INSERT INTO `pt_stationoperator` VALUES ('187de98458444712bc7e8bc38b5fc78f', '8a40c0353fa828a6013fa898d4ac0026', '1a8b4d8e4411412fa8bb561393563a85');
INSERT INTO `pt_stationoperator` VALUES ('19535ce9d32b4d4da6255eee9755a9af', '8a40c0353fa828a6013fa898d4ac0026', '7cc12b5c154a4a9782c518c57e8ab3aa');
INSERT INTO `pt_stationoperator` VALUES ('19851b764a044cba974c9e5aa102ceef', '8a40c0353fa828a6013fa898d4ac0026', '30bf01ffe1cb4ed39e92c6600ea39e93');
INSERT INTO `pt_stationoperator` VALUES ('1bcb0fa822004becb90426cc24bfa033', '8a40c0353fa828a6013fa898d4ac0026', 'f771691134c34174a819b5990310d000');
INSERT INTO `pt_stationoperator` VALUES ('1c688e36f32c4885b95ecb10e54eeb21', '8a40c0353fa828a6013fa898d4ac0026', '7eab5f800bab4efb8df1b2e8a0575f73');
INSERT INTO `pt_stationoperator` VALUES ('1d9e2ba7549344cd9eaee78ae46813b7', '8a40c0353fa828a6013fa898d4ac0026', 'c081c50918f4459f8e36ab8cb4151a61');
INSERT INTO `pt_stationoperator` VALUES ('1dfc77c086694b43a0904b6668b848b3', '8a40c0353fa828a6013fa898d4ac0026', '3dd486cd58da467dbd83ae420db14815');
INSERT INTO `pt_stationoperator` VALUES ('1ec4e181cdd14199a17054c37391d86a', '8a40c0353fa828a6013fa898d4ac0026', 'ca0f6da01ada419eaa7739d9790e5b88');
INSERT INTO `pt_stationoperator` VALUES ('1fba3ec512b84337be1058c17052b82c', '8a40c0353fa828a6013fa898d4ac0026', 'dfe9d74fe0ef4220bfcfe6d7bb2f9436');
INSERT INTO `pt_stationoperator` VALUES ('20e52832a59a4830a336f32b2fc8421f', '8a40c0353fa828a6013fa898d4ac0026', 'b4ee4ae4391f4243be69e838545d2131');
INSERT INTO `pt_stationoperator` VALUES ('23855c2fed254537bdb5080ac723dfb7', '8a40c0353fa828a6013fa898d4ac0026', 'e037e0bae9a94e549d6b647db49a64a1');
INSERT INTO `pt_stationoperator` VALUES ('23dcc95be308435a8b76fe05ed933406', '8a40c0353fa828a6013fa898d4ac0026', '483bdacba04f4663986e6339166e8321');
INSERT INTO `pt_stationoperator` VALUES ('25eecf20d8454b029326831e48fe96ec', '8a40c0353fa828a6013fa898d4ac0026', '5148ea207b974ee197f0bc57060ab1ad');
INSERT INTO `pt_stationoperator` VALUES ('27a107010397418498de98b2cd4ea85d', '8a40c0353fa828a6013fa898d4ac0026', 'fb6a0c1e618041bcbbf8cfd41311b1fa');
INSERT INTO `pt_stationoperator` VALUES ('28ec713379a94469952df240c6a4550b', '8a40c0353fa828a6013fa898d4ac0026', '351851fb7fce48f9a0ff6747971715ac');
INSERT INTO `pt_stationoperator` VALUES ('2daa51b270ba4fb6aa6d4f1eaf1bb00c', '8a40c0353fa828a6013fa898d4ac0026', '3e4e9e72dab243d38a1785d157c24cb6');
INSERT INTO `pt_stationoperator` VALUES ('2ef9ddc95cee4c53ad03a3ddb465d1ed', '8a40c0353fa828a6013fa898d4ac0026', '46e00ef0fd234e9dbf68ed9bbb437d0f');
INSERT INTO `pt_stationoperator` VALUES ('2f2e74a589cf4d17bf9600599d18b505', '8a40c0353fa828a6013fa898d4ac0026', '8897dbe85b3e4e6989d662495272cf26');
INSERT INTO `pt_stationoperator` VALUES ('2f66b1e0f89e42bcaf2f493b7cb95272', '8a40c0353fa828a6013fa898d4ac0026', 'c0ccfcd127c347a8b9db140e5aa62188');
INSERT INTO `pt_stationoperator` VALUES ('2fa388e8fd8a48218b6941c7cad57a05', '8a40c0353fa828a6013fa898d4ac0026', 'c29ea4cbd9044bc786e9f4584ad840ff');
INSERT INTO `pt_stationoperator` VALUES ('32a3f0baa91a493b93dd0533e37876b8', '8a40c0353fa828a6013fa898d4ac0026', '4a6544ae7a2548ad81c0e3994999023c');
INSERT INTO `pt_stationoperator` VALUES ('32d7c0dfe9884d3496bcd2a1b9f4ab04', '8a40c0353fa828a6013fa898d4ac0026', 'df0aa534655242e4a0bcd638b51a4e03');
INSERT INTO `pt_stationoperator` VALUES ('340522c11889454685865fe7d915fcb5', '8a40c0353fa828a6013fa898d4ac0026', '233356b63d8e477fb6e948b703232809');
INSERT INTO `pt_stationoperator` VALUES ('353a9045f0d9492197e228e562b366ae', '8a40c0353fa828a6013fa898d4ac0026', 'f82c021dc443419fb2469032af73bf3e');
INSERT INTO `pt_stationoperator` VALUES ('3710db5a86414e7d96e15bfaa5d474bf', '8a40c0353fa828a6013fa898d4ac0026', 'b8218945b8e743f29651569950014511');
INSERT INTO `pt_stationoperator` VALUES ('3884b26baa0a46c790b423035346f3e1', '8a40c0353fa828a6013fa898d4ac0026', 'd646da8707ae41838fd2ec9bf0d467ee');
INSERT INTO `pt_stationoperator` VALUES ('3976e4ce61104d2fa9979ad4414a52ad', '8a40c0353fa828a6013fa898d4ac0026', '61da3d9c60704621aa60d1da4553a264');
INSERT INTO `pt_stationoperator` VALUES ('3a19b275fc9b4ed1af13b5c0cbbc9839', '8a40c0353fa828a6013fa898d4ac0026', 'c1e991d1f56749298c18ff69d7777e0b');
INSERT INTO `pt_stationoperator` VALUES ('3b37d007ad2a4393aba200661b08cc60', '8a40c0353fa828a6013fa898d4ac0026', '2fee901117c64e18873f60e8f800713d');
INSERT INTO `pt_stationoperator` VALUES ('3e37137580f740e7944de46949656b00', '8a40c0353fa828a6013fa898d4ac0026', '0478826a46df4f20b12f4043a97f8209');
INSERT INTO `pt_stationoperator` VALUES ('4265a12c57cd4f98ac3a486852efa881', '8a40c0353fa828a6013fa898d4ac0026', 'cc88acee3a664c58861a872c351385e6');
INSERT INTO `pt_stationoperator` VALUES ('4592e55302274567b73da0d11dd90d20', '8a40c0353fa828a6013fa898d4ac0026', '6569e0d9f2cd4e3a97af4e1b0cd8d2f7');
INSERT INTO `pt_stationoperator` VALUES ('478aeeb582084963bc360fe6da40babb', '8a40c0353fa828a6013fa898d4ac0026', '3da96263a14343eaa7b409a93ec9e1db');
INSERT INTO `pt_stationoperator` VALUES ('4ceb54a2dc474f3f95f7d7f1e692dcd9', '8a40c0353fa828a6013fa898d4ac0026', '90c3cee940ea4211a714f5111d24ff5d');
INSERT INTO `pt_stationoperator` VALUES ('4df6f2638f4442dca9a5e3e9359c7de1', '8a40c0353fa828a6013fa898d4ac0026', '9750ea3ee4474711b9acbda8d5b87ee7');
INSERT INTO `pt_stationoperator` VALUES ('4f8ea806583743dabc90a50aac487958', '8a40c0353fa828a6013fa898d4ac0026', '9765e6bb76eb40ab800cb8954822190e');
INSERT INTO `pt_stationoperator` VALUES ('50c0423cd3504f89a21085a2bb94560e', '8a40c0353fa828a6013fa898d4ac0026', '39d82b5574b540b88d3723b36eb3e577');
INSERT INTO `pt_stationoperator` VALUES ('5127119fe83047558d9ccb22902a89b4', '8a40c0353fa828a6013fa898d4ac0026', 'a6623c65480f4f2cb63a4d7673f81e3a');
INSERT INTO `pt_stationoperator` VALUES ('538eafde5f5e42609981c4760c79df4c', '8a40c0353fa828a6013fa898d4ac0026', '6324ff9e83654aa0bf7f9d918b636b55');
INSERT INTO `pt_stationoperator` VALUES ('5559248f2f4041239bf1abc94c7e2d0e', '8a40c0353fa828a6013fa898d4ac0026', '88298fbd650d49f492e268816feffd15');
INSERT INTO `pt_stationoperator` VALUES ('57421907b0b3489ea333b7c417e635e1', '8a40c0353fa828a6013fa898d4ac0026', '6b527ed138c343a89ddf73cf16fef565');
INSERT INTO `pt_stationoperator` VALUES ('582e360a54364cf4937140b8b76d004d', '8a40c0353fa828a6013fa898d4ac0026', '77823e12391a47729a1f82a00bc15c5b');
INSERT INTO `pt_stationoperator` VALUES ('5973a8b38b6844e4ab98dccca8651d85', '8a40c0353fa828a6013fa898d4ac0026', 'acbceb432b5849aca9e9b284240281ec');
INSERT INTO `pt_stationoperator` VALUES ('5a9784012bce4d728e6547bd089f849c', '8a40c0353fa828a6013fa898d4ac0026', 'aa126932641f4e068ed8278a332de85d');
INSERT INTO `pt_stationoperator` VALUES ('5b14361097994fcb86d12991ae355dfd', '8a40c0353fa828a6013fa898d4ac0026', '15566e63f3104c73b4a0b4a784dd11ca');
INSERT INTO `pt_stationoperator` VALUES ('5c1f785ed3cf46be9fb0b7e32f528f54', '8a40c0353fa828a6013fa898d4ac0026', '423e8c2e2a644bbda0803f46ea8f31e2');
INSERT INTO `pt_stationoperator` VALUES ('5c64a1bb5d3f4bff8a3e36d0e7bcede1', '8a40c0353fa828a6013fa898d4ac0026', '21141da4febe4c929abe37126b37fd12');
INSERT INTO `pt_stationoperator` VALUES ('5e80e37a8195482ab79b200b124f192b', '8a40c0353fa828a6013fa898d4ac0026', '8bd9c0e14df941cdaf6253cd08dbd9cd');
INSERT INTO `pt_stationoperator` VALUES ('606474f45001428085bc32389410f209', '8a40c0353fa828a6013fa898d4ac0026', '5b47ae382f42421682852f889c176d49');
INSERT INTO `pt_stationoperator` VALUES ('60c21a81cfe4457f8181583dc94f7fa6', '8a40c0353fa828a6013fa898d4ac0026', '091855dd809b418fae88a7fec6d9f246');
INSERT INTO `pt_stationoperator` VALUES ('655adf858cd64f80bb8ab1f048950008', '8a40c0353fa828a6013fa898d4ac0026', '1b0d7476974e4bf9b52f75fb82f87330');
INSERT INTO `pt_stationoperator` VALUES ('67e5e6767cc049e6a3e216b21e036c25', '8a40c0353fa828a6013fa898d4ac0026', '4bebccaa8f0c4bfbaa2ff89f00706100');
INSERT INTO `pt_stationoperator` VALUES ('67ef52dc4fb24ba8a5862f859c5f650f', '8a40c0353fa828a6013fa898d4ac0026', '91baed789bc14efdbebb10b49c69ee5b');
INSERT INTO `pt_stationoperator` VALUES ('6a0c5de6e62440da86c4c3bec873bbad', '8a40c0353fa828a6013fa898d4ac0026', 'a2727f19f7cd4a038dd1a94f042a8cf1');
INSERT INTO `pt_stationoperator` VALUES ('6efc736d451c4be0a7369a6e5b52bb7d', '8a40c0353fa828a6013fa898d4ac0026', 'e2cead0f68ac4a2d98765264578a9f83');
INSERT INTO `pt_stationoperator` VALUES ('710ef10e206a406f8e4266b61ed7f603', '8a40c0353fa828a6013fa898d4ac0026', '4376888fd74f4247a926529e5da03442');
INSERT INTO `pt_stationoperator` VALUES ('7119cd163424438dbb369f236ca95e48', '8a40c0353fa828a6013fa898d4ac0026', 'f604f021cba44b6fb96115265e557521');
INSERT INTO `pt_stationoperator` VALUES ('7384588cb54e4461ad4b6d1b4b9fff15', '8a40c0353fa828a6013fa898d4ac0026', 'ee27f5c23b6d4217b3b66295a3506a40');
INSERT INTO `pt_stationoperator` VALUES ('79ca251be03347869e5031d592b9536d', '8a40c0353fa828a6013fa898d4ac0026', 'fdaeeb41691d460b8f142066d1f79927');
INSERT INTO `pt_stationoperator` VALUES ('7f98538b125d4f84b274b81e1ef4f95d', '8a40c0353fa828a6013fa898d4ac0026', '7bd7ca42560140ee8573b2ade6388f3e');
INSERT INTO `pt_stationoperator` VALUES ('802ecb2bb69143d5ba89bacfad4cb794', '8a40c0353fa828a6013fa898d4ac0026', '58a85040aa9f40cca0bdba6e23e30363');
INSERT INTO `pt_stationoperator` VALUES ('830dcc9ea4d54c83aa261b93a40834a8', '8a40c0353fa828a6013fa898d4ac0026', 'ccf9b69e151840a28be75d8443b70273');
INSERT INTO `pt_stationoperator` VALUES ('8335a5122d3d4ea7ba608d6b152b548a', '8a40c0353fa828a6013fa898d4ac0026', '2bd0e8f116f9420692a81d1723cecf5c');
INSERT INTO `pt_stationoperator` VALUES ('836547167f4e47b1b02ee5d23c1d7ce3', '8a40c0353fa828a6013fa898d4ac0026', '7ae62737df444d619f8fd376360d160c');
INSERT INTO `pt_stationoperator` VALUES ('83ca6ac5d4854b0e8d5cb94ca04fc633', '8a40c0353fa828a6013fa898d4ac0026', '420d8ebc68ad44dc8188d4c27dc585d1');
INSERT INTO `pt_stationoperator` VALUES ('884840dd5cb14653a708e895d7f20473', '8a40c0353fa828a6013fa898d4ac0026', '21b0a910ef6e4c60a325d5e57e6e6f65');
INSERT INTO `pt_stationoperator` VALUES ('8a12f74f06f547e08132c632f2e75215', '8a40c0353fa828a6013fa898d4ac0026', '5fcac107c80d493d91b53a815d4b297a');
INSERT INTO `pt_stationoperator` VALUES ('8b4410c4f75c47eca03fcd8f0c5491ae', '8a40c0353fa828a6013fa898d4ac0026', 'ad51a6ca95c646ce9c03778eda715734');
INSERT INTO `pt_stationoperator` VALUES ('8ca3b4dd6f0d4aebad4db75ea8b93525', '8a40c0353fa828a6013fa898d4ac0026', 'c04adcd019e04cf3ba7c66af721a18dc');
INSERT INTO `pt_stationoperator` VALUES ('8cfddbf64e4f4b72b354bf82d87fe525', '8a40c0353fa828a6013fa898d4ac0026', 'dfc7af0979a54e8e9a3f18b7a5d66030');
INSERT INTO `pt_stationoperator` VALUES ('8d17b3c5831a429585d46f778d316a8d', '8a40c0353fa828a6013fa898d4ac0026', 'fd9978df5c5a47f298e2d28e21e70b15');
INSERT INTO `pt_stationoperator` VALUES ('8d1f1e2309eb42a0b417f799d1107079', '8a40c0353fa828a6013fa898d4ac0026', '4df80521e66447618796c3cfe02bf239');
INSERT INTO `pt_stationoperator` VALUES ('8e281cc556434f05b78b4c2a02de1463', '8a40c0353fa828a6013fa898d4ac0026', '886bd497064b4c9f87d8461ebba421d1');
INSERT INTO `pt_stationoperator` VALUES ('8f06cd6b36a140a788514a36f80c38b1', '8a40c0353fa828a6013fa898d4ac0026', '8b1c1c86385642f2b6c97930b44bbbcf');
INSERT INTO `pt_stationoperator` VALUES ('8f0e619fee124ee09779e7043baaa9ca', '8a40c0353fa828a6013fa898d4ac0026', '0fb7938c7d614fc389568eb67b442303');
INSERT INTO `pt_stationoperator` VALUES ('8f5895aea5e944eb8250cabba2c4b320', '8a40c0353fa828a6013fa898d4ac0026', 'a0c01a5248cd4bf38e57945dbb2b98c5');
INSERT INTO `pt_stationoperator` VALUES ('9029854f53214a3296531926fc06b357', '8a40c0353fa828a6013fa898d4ac0026', '05114c0cbe1f4c2095b3216f13cfb681');
INSERT INTO `pt_stationoperator` VALUES ('9210ef1ed90743eca910e6311bc919c9', '8a40c0353fa828a6013fa898d4ac0026', '2be34991827e4e8da8e92f9b9e8bce25');
INSERT INTO `pt_stationoperator` VALUES ('94d9dd332adf4da18703b7ea4666617d', '8a40c0353fa828a6013fa898d4ac0026', '2fbbc9cfb0bf4b5bb504ead155c3423c');
INSERT INTO `pt_stationoperator` VALUES ('9716e5bd908447658fa4ba28242373e5', '8a40c0353fa828a6013fa898d4ac0026', 'b23b17d4c83242e8a1a8ee8cfcde9907');
INSERT INTO `pt_stationoperator` VALUES ('99b4a86646fb4c889aa900ec86d3c21a', '8a40c0353fa828a6013fa898d4ac0026', '6566adb7fc6347e7b01a3c47129b5eb5');
INSERT INTO `pt_stationoperator` VALUES ('9a165d64aea94588aec25bc7198207f4', '8a40c0353fa828a6013fa898d4ac0026', 'd5c8bdf7a49a4e46b776c05dc9ead484');
INSERT INTO `pt_stationoperator` VALUES ('9b2366e6df3244c0b7663c76a7ed52ee', '8a40c0353fa828a6013fa898d4ac0026', '335d1f8f46eb47a18001889f8cc21348');
INSERT INTO `pt_stationoperator` VALUES ('a197dce7400e491989a6cb3e6f463d0f', '8a40c0353fa828a6013fa898d4ac0026', '9a708f39e123455e84b6125774bab1ea');
INSERT INTO `pt_stationoperator` VALUES ('a2625d85ccff4b098697236d2934e94c', '8a40c0353fa828a6013fa898d4ac0026', '46b7269a26044dfebb4edd06a2f9cd83');
INSERT INTO `pt_stationoperator` VALUES ('a2d1614dce624e06933a84e3111f36d4', '8a40c0353fa828a6013fa898d4ac0026', '6daed51284f94923b1c8a6414e646959');
INSERT INTO `pt_stationoperator` VALUES ('a556af7e9e45497ebbb9e6a9ba57ada4', '8a40c0353fa828a6013fa898d4ac0026', '09b6ce29313c4051ba765de516a9b283');
INSERT INTO `pt_stationoperator` VALUES ('a6a0ed877d50441ab588a45640da3dc2', '8a40c0353fa828a6013fa898d4ac0026', 'd479dbdc901f4d85a207b9bace6465ac');
INSERT INTO `pt_stationoperator` VALUES ('a860c5db7b9142babef25426561bd48a', '8a40c0353fa828a6013fa898d4ac0026', 'f1f6f2c8f026498c8ee64b7a918d06df');
INSERT INTO `pt_stationoperator` VALUES ('a913798ec9214f8c87d6ed628bec4e8f', '8a40c0353fa828a6013fa898d4ac0026', 'a1ff68acf9b24c34b347ff21e333cb70');
INSERT INTO `pt_stationoperator` VALUES ('a9e033ee2bc0477f91576490eb4ee6cd', '8a40c0353fa828a6013fa898d4ac0026', '827a7067a28d442da3ddd834677127af');
INSERT INTO `pt_stationoperator` VALUES ('aa60fd299e3c4b5282ecea6727fe3c45', '8a40c0353fa828a6013fa898d4ac0026', '4959d88b8ca64eb19310c30799faa07c');
INSERT INTO `pt_stationoperator` VALUES ('aaee4022b84e4373b2e586f7488d9368', '8a40c0353fa828a6013fa898d4ac0026', 'cc6bcbee40ab43b2bd5aff6d9385e1fc');
INSERT INTO `pt_stationoperator` VALUES ('b1aeb99260cc4ce39e783193bdd348c9', '8a40c0353fa828a6013fa898d4ac0026', 'e4f182b4009e48a58673134324b2ec56');
INSERT INTO `pt_stationoperator` VALUES ('b30ce8795d834b2787e53f41d3714c0c', '8a40c0353fa828a6013fa898d4ac0026', '83ef85fd17804bb195d0ad3c07f88c30');
INSERT INTO `pt_stationoperator` VALUES ('b3d491ee10dd43ef8f29243eb31bef95', '8a40c0353fa828a6013fa898d4ac0026', 'd115d08591ef4c0eaebef15f8294b287');
INSERT INTO `pt_stationoperator` VALUES ('b458e2ce27bd44f0a31a5f0793acc434', '8a40c0353fa828a6013fa898d4ac0026', '8f79857b31d4475a94c712e997e89c99');
INSERT INTO `pt_stationoperator` VALUES ('b50ac327cbde47babd13106c99c8dbdd', '8a40c0353fa828a6013fa898d4ac0026', '481d4d5c0a634c4085c72c990260e58d');
INSERT INTO `pt_stationoperator` VALUES ('b548070c4da8400481a4e9ea805e48ff', '8a40c0353fa828a6013fa898d4ac0026', 'b82d86fb7b64498a9c2b8b9a99b3fbeb');
INSERT INTO `pt_stationoperator` VALUES ('ba3a698ab8fe4c6bbad58c215d2c9a71', '8a40c0353fa828a6013fa898d4ac0026', 'b13b002e2fad4e95bbe0e4dbc9fbdfe1');
INSERT INTO `pt_stationoperator` VALUES ('c082ff78bd6f46529066bf3be1934d89', '8a40c0353fa828a6013fa898d4ac0026', '9c0ae757fc564f27860b975e5792ae6a');
INSERT INTO `pt_stationoperator` VALUES ('c1c59c73e4d447939f250c41e668f276', '8a40c0353fa828a6013fa898d4ac0026', '0773a58c4bdb4858ab062c4a2a4da69a');
INSERT INTO `pt_stationoperator` VALUES ('c1e9d0f4c8d14a93a287d12a1729d6d5', '8a40c0353fa828a6013fa898d4ac0026', 'e1ac811d2a16495d927f994dd006e824');
INSERT INTO `pt_stationoperator` VALUES ('c37ab72ab967407ab1f1f35eebe6ceea', '8a40c0353fa828a6013fa898d4ac0026', 'dc750e57b54f4baca78d66969321ee51');
INSERT INTO `pt_stationoperator` VALUES ('c77f667641e044a499c999aa48c147da', '8a40c0353fa828a6013fa898d4ac0026', '910955c2192a418995eeab8bf15372e9');
INSERT INTO `pt_stationoperator` VALUES ('c92ebef135d44cd7a1303b661e12812a', '8a40c0353fa828a6013fa898d4ac0026', 'c05642442e0a468ebe4f0b7771a803ae');
INSERT INTO `pt_stationoperator` VALUES ('ca68408ea43c42a088d8be77429d50bd', '8a40c0353fa828a6013fa898d4ac0026', '78c6026c6af44b41a6bef4cdb4cfb414');
INSERT INTO `pt_stationoperator` VALUES ('cac39f7a75dd499988e19ed1923bd973', '8a40c0353fa828a6013fa898d4ac0026', 'd496b161d2564111992687b948862244');
INSERT INTO `pt_stationoperator` VALUES ('cacb4fee167e445f96484295dfcfb34a', '8a40c0353fa828a6013fa898d4ac0026', '7b4281dd247c4624bee0d8f84c2c2715');
INSERT INTO `pt_stationoperator` VALUES ('ccedf261952a46aba525d866d54c4cee', '8a40c0353fa828a6013fa898d4ac0026', '22926eb196a14b48be775f4880b5ba94');
INSERT INTO `pt_stationoperator` VALUES ('cd37af6893f84ea78b676c39460d877b', '8a40c0353fa828a6013fa898d4ac0026', '01aa0c85c8b84ae8aca7f5484336b203');
INSERT INTO `pt_stationoperator` VALUES ('cee8c9b275ba4de3a1bd42f728d907b1', '8a40c0353fa828a6013fa898d4ac0026', '9adcc4c40e3148988e5003aaedbb4948');
INSERT INTO `pt_stationoperator` VALUES ('cfe54a80698243fcb9e10afd065a011e', '8a40c0353fa828a6013fa898d4ac0026', 'cf26c1d2baa24a8791b3d264154b80d4');
INSERT INTO `pt_stationoperator` VALUES ('d0ef1362d1ff43c8a25eea07f4447244', '8a40c0353fa828a6013fa898d4ac0026', '671ce1e6167840baaa6d27f4f04574c9');
INSERT INTO `pt_stationoperator` VALUES ('d0f6c77416d7443fb08459b9eaa0f9d6', '8a40c0353fa828a6013fa898d4ac0026', 'a0d2897ee9194378819e78538189faa0');
INSERT INTO `pt_stationoperator` VALUES ('d40d3b1a7044480a96ff5f78c222e15e', '8a40c0353fa828a6013fa898d4ac0026', '5c2bdc059ae24ffda2758a2781bb46da');
INSERT INTO `pt_stationoperator` VALUES ('db91cffbaa8a4043948715e35ee96408', '8a40c0353fa828a6013fa898d4ac0026', '721f7255449c445faf36607c254eea06');
INSERT INTO `pt_stationoperator` VALUES ('dbbd5d1929394401b468f816595235a0', '8a40c0353fa828a6013fa898d4ac0026', '08a96d5dd37f49459eeb02eebeb0a78c');
INSERT INTO `pt_stationoperator` VALUES ('dc0f0346b7ef4b76b84cc036f97ab23f', '8a40c0353fa828a6013fa898d4ac0026', '37218fb52ec94fb4bf76209a17916094');
INSERT INTO `pt_stationoperator` VALUES ('dfc925c3f9984304955fc8293810ddcb', '8a40c0353fa828a6013fa898d4ac0026', 'e754dfdb794d4e7db6023c9b089a340c');
INSERT INTO `pt_stationoperator` VALUES ('e0968a2e83794d37a280638bd0359dfd', '8a40c0353fa828a6013fa898d4ac0026', '1b1a809815574b2a9c1d0e18d692de17');
INSERT INTO `pt_stationoperator` VALUES ('e0a9173a2d584fc0b5bb5665a7941171', '8a40c0353fa828a6013fa898d4ac0026', '2c91467f905a4f5ba9f52830131c8ad9');
INSERT INTO `pt_stationoperator` VALUES ('e1c2318018ac4fe4ac0eb36c6c6fb797', '8a40c0353fa828a6013fa898d4ac0026', '1046389d8525451697f2793185e7d6ee');
INSERT INTO `pt_stationoperator` VALUES ('e26b70cfb6ce477c8fae7688187b8235', '8a40c0353fa828a6013fa898d4ac0026', 'a5289b2638d845fbb06dedbcdd517f97');
INSERT INTO `pt_stationoperator` VALUES ('eadf28f160604847833c4f1d88ed4715', '8a40c0353fa828a6013fa898d4ac0026', '18f50e0f48ef4dd9bec85f5612ab10c0');
INSERT INTO `pt_stationoperator` VALUES ('ebec92a266d5413e8442b47fe37aa7e2', '8a40c0353fa828a6013fa898d4ac0026', '29c18b3394924c30882da049da14ad99');
INSERT INTO `pt_stationoperator` VALUES ('ec31d96b679a4f09957e203f274ec5ae', '8a40c0353fa828a6013fa898d4ac0026', 'bc2c865be6af42cf861294d446fb1c6f');
INSERT INTO `pt_stationoperator` VALUES ('ec65641ec125424187243d8530f6b56c', '8a40c0353fa828a6013fa898d4ac0026', '053d330462e1459ca1012c9d29113bc4');
INSERT INTO `pt_stationoperator` VALUES ('edfae92ea85d4532977ead9c4e772117', '8a40c0353fa828a6013fa898d4ac0026', '0da15c49299d41a4b720f787d053e3cb');
INSERT INTO `pt_stationoperator` VALUES ('eff46328c2dc41a38de09ee76f1b4584', '8a40c0353fa828a6013fa898d4ac0026', '5b249ad344d948b99f58768c323f5f71');
INSERT INTO `pt_stationoperator` VALUES ('f1f05094d7b649ab94c90669714a1d14', '8a40c0353fa828a6013fa898d4ac0026', '8ca8af501522439d8c9249e00db5d78d');
INSERT INTO `pt_stationoperator` VALUES ('f423cb2b3bee47d29e20259bba7186ad', '8a40c0353fa828a6013fa898d4ac0026', 'ad09a1b897744812875c752c2d70f11a');
INSERT INTO `pt_stationoperator` VALUES ('f4ae287215d54609a5d5934263a62753', '8a40c0353fa828a6013fa898d4ac0026', '32a3e59964204a3c8848e84b864306ae');
INSERT INTO `pt_stationoperator` VALUES ('f83cdeaef7934597a3706e39d7ff3d72', '8a40c0353fa828a6013fa898d4ac0026', 'ff91363b32424fa399e44cc0dfd688e9');
INSERT INTO `pt_stationoperator` VALUES ('f97d8f7f69db42b5af558571b2c00e1b', '8a40c0353fa828a6013fa898d4ac0026', '3ee5f986289d4a1990f4e42c9a0caadb');
INSERT INTO `pt_stationoperator` VALUES ('fc86de2044414d72b1e4b1ec782d735e', '8a40c0353fa828a6013fa898d4ac0026', '3085a3b0c20d4f3aaa7c2d27fe986aba');
INSERT INTO `pt_stationoperator` VALUES ('fecc208b276240a69dfc6cfac333d73d', '8a40c0353fa828a6013fa898d4ac0026', '79039a2260da46b0aabb5a62e8db6c87');

-- ----------------------------
-- Table structure for `pt_syslog`
-- ----------------------------
DROP TABLE IF EXISTS `pt_syslog`;
CREATE TABLE `pt_syslog` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `actionenddate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `actionendtime` bigint(20) DEFAULT NULL,
  `actionhaoshi` bigint(20) DEFAULT NULL,
  `actionstartdate` timestamp NULL DEFAULT NULL,
  `actionstarttime` bigint(20) DEFAULT NULL,
  `cause` char(1) COLLATE utf8_bin DEFAULT NULL,
  `cookie` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `enddate` timestamp NULL DEFAULT NULL,
  `endtime` bigint(20) DEFAULT NULL,
  `haoshi` bigint(20) DEFAULT NULL,
  `ips` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `method` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `referer` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `requestpath` text COLLATE utf8_bin,
  `startdate` timestamp NULL DEFAULT NULL,
  `starttime` bigint(20) DEFAULT NULL,
  `status` char(1) COLLATE utf8_bin DEFAULT NULL,
  `useragent` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `viewhaoshi` bigint(20) DEFAULT NULL,
  `operatorids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `accept` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `acceptencoding` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `acceptlanguage` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `connection` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `host` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `xrequestedwith` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `pvids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `userids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_syslog
-- ----------------------------

-- ----------------------------
-- Table structure for `pt_systems`
-- ----------------------------
DROP TABLE IF EXISTS `pt_systems`;
CREATE TABLE `pt_systems` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `numbers` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `orderids` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_systems
-- ----------------------------
INSERT INTO `pt_systems` VALUES ('0c1230c98ef34e58947903fab5a4fa85', '0', null, '易信平台', 'yiXin', '3');
INSERT INTO `pt_systems` VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '基础平台', '基础平台', 'platform', '1');
INSERT INTO `pt_systems` VALUES ('d3a5c976c4c24751b6b00ec775692683', '0', null, '微信平台', 'weiXin', '2');

-- ----------------------------
-- Table structure for `pt_upload`
-- ----------------------------
DROP TABLE IF EXISTS `pt_upload`;
CREATE TABLE `pt_upload` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `parametername` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `filename` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `contenttype` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `originalfilename` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `md5` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '文件MD5摘要',
  `describe` text COLLATE utf8_bin,
  `orderids` bigint(20) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `targetids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`),
  UNIQUE KEY `md5_index` (`md5`) USING HASH,
  UNIQUE KEY `filename_index` (`filename`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_upload
-- ----------------------------

-- ----------------------------
-- Table structure for `pt_user`
-- ----------------------------
DROP TABLE IF EXISTS `pt_user`;
CREATE TABLE `pt_user` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `errorcount` bigint(20) DEFAULT NULL,
  `orderids` bigint(20) DEFAULT NULL,
  `password` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `salt` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `status` char(1) COLLATE utf8_bin DEFAULT NULL,
  `stopdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `departmentids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `stationids` text COLLATE utf8_bin,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `idcard` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `secretkey` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`),
  KEY `usernameindex` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_user
-- ----------------------------
INSERT INTO `pt_user` VALUES ('03a44ba0aa4e4905bea726d4da976ba5', '6', '0', '0', 'GKw78xJqQ9aBY31IaojrIDtVBpY=', 'DdDxMWSgtsQ=', '1', '2017-01-17 14:10:37', 'admins', '8a40c0353fa828a6013fa898d4ac0028', 0x3861343063303335336661383238613630313366613839386434616330303236, 'dongcb678@163.com', '420881198609283721', '13871558042', '管理员', 'N4aJzr8KltvVIFwbzdXdhQ==');
INSERT INTO `pt_user` VALUES ('ef15e94a52584743b2b9bf604fccd0cc', '0', '0', null, 'WE+OFSzgmA8qQxTms6SBdBIBC4U=', '5kqjzm8LeEM=', '1', '2017-01-17 14:10:37', 'littleant', '8a40c0353fa828a6013fa898d4ac0028', 0x3861343063303335336661383238613630313366613839386434616330303236, 'littleant@163.com', '420881198809555685', '13584778623', 'littleant', 'dRfs2ecd1dXvxbExRFnUnA==');

-- ----------------------------
-- Table structure for `pt_usergroup`
-- ----------------------------
DROP TABLE IF EXISTS `pt_usergroup`;
CREATE TABLE `pt_usergroup` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '??',
  `userids` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '??ids',
  `groupids` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '??ids',
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='????';

-- ----------------------------
-- Records of pt_usergroup
-- ----------------------------
INSERT INTO `pt_usergroup` VALUES ('5ccf0b1d605c49938fa8c4369c8a34c6', '03a44ba0aa4e4905bea726d4da976ba5', '8a40c0353fa828a6013fa898d4ac0028');
INSERT INTO `pt_usergroup` VALUES ('baeadb794a5241a888cd9346f07212a8', '3f33600d631e4b67af6f5d850d4a78de', '8a40c0353fa828a6013fa898d4ac0028');
INSERT INTO `pt_usergroup` VALUES ('db8478979b8f417891652c421d82eeb1', 'ef15e94a52584743b2b9bf604fccd0cc', '8a40c0353fa828a6013fa898d4ac0028');

-- ----------------------------
-- Table structure for `pt_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `pt_userinfo`;
CREATE TABLE `pt_userinfo` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `addressinfo` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `avoirdupois` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `bloodgroup` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `clientlevelend` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `clientlevelstart` timestamp NULL DEFAULT NULL,
  `culture` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `finishschooldate` date DEFAULT NULL,
  `folk` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `government` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `homepage` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `householder` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `marriage` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `msn` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `nativityaddress` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `postboy` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `schoolname` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `speciality` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `stature` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`),
  KEY `bloodgroupindex` (`bloodgroup`) USING BTREE,
  KEY `msnindex` (`msn`) USING BTREE,
  KEY `nativityaddressindex` (`nativityaddress`) USING BTREE,
  KEY `postboyindex` (`postboy`) USING BTREE,
  KEY `schoolnameindex` (`schoolname`) USING BTREE,
  KEY `specialityindex` (`speciality`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_userinfo
-- ----------------------------
INSERT INTO `pt_userinfo` VALUES ('03a44ba0aa4e4905bea726d4da976ba5', '6', '湖北钟祥', null, '55', '2012-03-07', 'bloodGroup_A', '2015-03-26 19:16:26', '2014-06-09 11:21:13', 'wenHuaChenDu_chuZhong', '湖北钟祥', '2010-10-25', 'folk_han', 'government_dangYuan', 'http://www.4bu4.com', '湖北钟祥', 'marriage_no', null, '湖北钟祥', '431924', '150584428', '西安外事学院', 'man', '电子商务', '165', '027-65155060');
INSERT INTO `pt_userinfo` VALUES ('ef15e94a52584743b2b9bf604fccd0cc', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `test_blog`
-- ----------------------------
DROP TABLE IF EXISTS `test_blog`;
CREATE TABLE `test_blog` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8_bin COMMENT '内容',
  `createTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of test_blog
-- ----------------------------
