/*
Navicat MySQL Data Transfer

Source Server         : localhost-mysql
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : jfinaluib

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2014-08-29 21:38:16
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
INSERT INTO `pt_department` VALUES ('8a40c0353fa828a6013fa898d4ac0030', '0', null, '0', null, '子部门2', '5.png', 'false', '平台组', '0', null, '8a40c0353fa828a6013fa898d4ac0029', '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO `pt_department` VALUES ('b7dd88dc96a748d0a11b52fb56ee5d68', '0', null, null, null, null, '2.png', 'false', '实施组', '2', null, '8a40c0353fa828a6013fa898d4ac0029', null);

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
INSERT INTO `pt_dict` VALUES ('0c78f87750a745bbb59005a6ca0f744a', '0', null, '3.png', 'weixinToken', '3', '100103root/83f4b0ee56904cbeb5f91696ad804c29/0c78f87750a745bbb59005a6ca0f744a', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinToken', '123', '1', null, null, null, null, null, '1');
INSERT INTO `pt_dict` VALUES ('10c3fc9a884a4cfc91f47e197913fd50', '1', null, '2.png', '钟祥市', '1', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/10c3fc9a884a4cfc91f47e197913fd50', null, 'a1f14efbb8cb4e44a30bd32194d0f24b', 'false', '3', 'zhongXiangShi', null, null, '钟祥市', '钟祥市', '钟祥市', '钟祥市', '钟祥市', '1');
INSERT INTO `pt_dict` VALUES ('18a137a0b92944ba857b5dec39b4fa69', '0', null, '2.png', '河南省', '2', '100103root/31b6516f36d44fc280b82affc270c479/18a137a0b92944ba857b5dec39b4fa69', null, '31b6516f36d44fc280b82affc270c479', 'false', '2', 'heNanSheng', null, '1', '河南省', '河南省', '河南省', '河南省', '河南省', '1');
INSERT INTO `pt_dict` VALUES ('3082e48992104e3ca8c2f542bbcfbe63', '0', null, '2.png', '三室一厅', '1', '100103root/56e8bdbc8d77460da17e473ee30906b0/3082e48992104e3ca8c2f542bbcfbe63', null, '56e8bdbc8d77460da17e473ee30906b0', 'false', '2', 'sanShiYiTing', null, '1', '三室一厅', '三室一厅', '三室一厅', '三室一厅', '三室一厅', '1');
INSERT INTO `pt_dict` VALUES ('31b6516f36d44fc280b82affc270c479', '2', null, '2.png', '省市区', '1', '100103root/31b6516f36d44fc280b82affc270c479', null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'shengShiQu', null, null, '省市区', '省市区', '省市区', '省市区', '省市区', '1');
INSERT INTO `pt_dict` VALUES ('325acbd77f5b43a894ec4ef53ba20914', '0', null, '2.png', '洪山区', '1', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902/325acbd77f5b43a894ec4ef53ba20914', null, '64659405a79a4ecb9f116ae84ec55902', 'false', '4', 'hongShanQu', null, '1', '洪山区', '洪山区', '洪山区', '洪山区', '洪山区', '1');
INSERT INTO `pt_dict` VALUES ('56e8bdbc8d77460da17e473ee30906b0', '0', null, '2.png', '房屋结构', '2', '100103root/56e8bdbc8d77460da17e473ee30906b0', null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'fangWuJieGou', null, '1', '房屋结构', '房屋结构', '房屋结构', '房屋结构', '房屋结构', '1');
INSERT INTO `pt_dict` VALUES ('64659405a79a4ecb9f116ae84ec55902', '0', null, '2.png', '武汉市', '2', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902', null, 'a1f14efbb8cb4e44a30bd32194d0f24b', 'true', '3', 'wuHanShi', null, '1', '武汉市', '武汉市', '武汉市', '武汉市', '武汉市', '1');
INSERT INTO `pt_dict` VALUES ('7381008292054bccba20224bc33774d7', '6', null, '2.png', 'weixinAppID', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29/7381008292054bccba20224bc33774d7', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppID', '123', '1', '1234', '1234', '1234', '1234', '1234', '1');
INSERT INTO `pt_dict` VALUES ('8094c60d7a594b36bb0187cbce9c4188', '0', null, '2.png', 'weixinAppSecret', '2', '100103root/83f4b0ee56904cbeb5f91696ad804c29/8094c60d7a594b36bb0187cbce9c4188', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppSecret', '123', '1', null, null, null, null, null, '1');
INSERT INTO `pt_dict` VALUES ('83f4b0ee56904cbeb5f91696ad804c29', '0', null, '2.png', '微信配置', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29', null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'weixinConfig', null, '1', null, null, null, null, null, '1');
INSERT INTO `pt_dict` VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '字典树', '1_open.png', '字典树', '1', '100103root', '1', null, 'true', '0', null, null, '0', null, null, null, null, null, '1');
INSERT INTO `pt_dict` VALUES ('a1f14efbb8cb4e44a30bd32194d0f24b', '0', null, '2.png', '湖北省', '1', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b', null, '31b6516f36d44fc280b82affc270c479', 'true', '2', 'huBeiSheng', null, '1', '湖北省', '湖北省', '湖北省', '湖北省', '湖北省', '1');
INSERT INTO `pt_dict` VALUES ('bf1bf96a123447c58b7f181d3e4e6099', '0', null, '2.png', '两室一厅', '2', '100103root/56e8bdbc8d77460da17e473ee30906b0/bf1bf96a123447c58b7f181d3e4e6099', null, '56e8bdbc8d77460da17e473ee30906b0', 'false', '2', 'laingshiyiting', null, '1', '两室一厅', '两室一厅', '两室一厅', '两室一厅', '两室一厅', '1');
INSERT INTO `pt_dict` VALUES ('ddbe84891d8b4632ac0dc2bd36f7f323', '0', null, '2.png', '江岸区', '2', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902/ddbe84891d8b4632ac0dc2bd36f7f323', null, '64659405a79a4ecb9f116ae84ec55902', 'false', '4', 'jiangAnQu', null, '1', '江岸区', '江岸区', '江岸区', '江岸区', '江岸区', '1');

-- ----------------------------
-- Table structure for `pt_group`
-- ----------------------------
DROP TABLE IF EXISTS `pt_group`;
CREATE TABLE `pt_group` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `roleids` text COLLATE utf8_bin,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_group
-- ----------------------------
INSERT INTO `pt_group` VALUES ('8a40c0353fa828a6013fa898d4ac0028', '1', '系统管理员组', '系统管理员', 0x38613430633033353366613832386136303133666138393864346163303032332C);

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
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_menu
-- ----------------------------
INSERT INTO `pt_menu` VALUES ('017173f642e545b8a7b02fc6f5246b2f', '0', '2.png', null, '2', 'dfe9d74fe0ef4220bfcfe6d7bb2f9436', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '用户管理', null, null, null, null);
INSERT INTO `pt_menu` VALUES ('294ab73cc8274f1fa0663bf9c1bbe4d4', '1', '2.png', null, '3', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'true', '配置项', '配置项', '配置项', 'Configuration item', '構成項目');
INSERT INTO `pt_menu` VALUES ('297e0cf944f8cce70144f8dce1540069', '2', '8.png', '0', '8', '74aa20442105408d90f9e6469a3a92b5', '294ab73cc8274f1fa0663bf9c1bbe4d4', '8a40c0353fa828a6013fa898d4ac0020', 'false', '字典管理', '字典管理', '字典管理', 'dictionary management', '辞書の管理');
INSERT INTO `pt_menu` VALUES ('3272e2e0a7cd4d7f8e1e88abe9d70ae4', '1', '2.png', null, '2', '06244cf3520c49e8a45cbde82a53fa5e', '294ab73cc8274f1fa0663bf9c1bbe4d4', null, 'false', '参数管理', '参数管理', '参数管理', 'Parameter management', 'パラメータの管理');
INSERT INTO `pt_menu` VALUES ('3ffaf784ef95497b803d7a9f43c9e7a8', '0', '5.png', null, '5', '0773a58c4bdb4858ab062c4a2a4da69a', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '自动回复', null, null, null, null);
INSERT INTO `pt_menu` VALUES ('4600e755ec5f4dc6a5783a4d097a42f2', '0', '4.png', null, '4', '420d8ebc68ad44dc8188d4c27dc585d1', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '位置管理', null, null, null, null);
INSERT INTO `pt_menu` VALUES ('4bae83d582744c928cb8c8f419586a31', '1', '2.png', null, '1', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false', '用户权限', '用户权限', '用户权限', 'User privilege', 'ユーザの権限');
INSERT INTO `pt_menu` VALUES ('625f1e0e951a4199a7262e064512e2c7', '0', '5.png', null, '5', null, '8a40c0353fa828a6013fa898d4ac1100', null, 'true', '微信管理', null, null, null, null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0020', '1', '3.png', '-1', '1', null, null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '菜单管理', '菜单管理', '菜单管理', 'Menu management', '管理メニュー');
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0021', '1', '3.png', '2', '1', '91baed789bc14efdbebb10b49c69ee5b', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '用户管理', '用户管理', '用户管理', 'User management', 'ユーザーの管理');
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0022', '1', '3.png', '2', '2', '1b0d7476974e4bf9b52f75fb82f87330', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '分组管理', '分组管理', '分组管理', 'Group management', 'グループの管理');
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0023', '1', '3.png', '2', '3', '7ae62737df444d619f8fd376360d160c', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '角色管理', '角色管理', '角色管理', 'Role management', 'キャラクターの管理');
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0024', '1', '3.png', '2', '5', '7eab5f800bab4efb8df1b2e8a0575f73', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '系统管理', '系统管理', '系统管理', 'System management', 'システム管理');
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0025', '1', '3.png', '2', '6', '0da15c49299d41a4b720f787d053e3cb', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '功能管理', '功能管理', '功能管理', 'Functional management', '機能管理');
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0026', '1', '8.png', '2', '4', '233356b63d8e477fb6e948b703232809', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '岗位管理', '岗位管理', '岗位管理', 'Post management', 'ポストの管理');
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac0027', '1', '3.png', '2', '7', 'ad09a1b897744812875c752c2d70f11a', 'a5bf1c38a2ea4b6085d15b830cb80518', '8a40c0353fa828a6013fa898d4ac0020', 'false', '部门管理', '部门管理', '部门管理', 'Department management', '部門の管理');
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac1100', '0', '3.png', '-1', '1', null, null, 'd3a5c976c4c24751b6b00ec775692683', 'true', '后台菜单组织结构', null, null, null, null);
INSERT INTO `pt_menu` VALUES ('8a40c0353fa828a6013fa898d4ac2200', '0', '3.png', '-1', '1', null, null, '0c1230c98ef34e58947903fab5a4fa85', 'true', '后台菜单组织结构', null, null, null, null);
INSERT INTO `pt_menu` VALUES ('9fd1692ae1fc4f3dab4f0fca7c2a6d68', '1', '3.png', null, '3', '36d3b89e378b451ca89d1a41a3c53e10', 'ed90c7b40be74552bbfa7ac58efdc5fe', null, 'false', '在线Log4j', '在线Log4j', '在线Log4j', 'Online Log4j', 'オンラインLog4j');
INSERT INTO `pt_menu` VALUES ('a5bf1c38a2ea4b6085d15b830cb80518', '1', '2.png', null, '2', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false', '组织机构', '组织机构', '组织机构', 'Organization', '組織機構');
INSERT INTO `pt_menu` VALUES ('aa2b382e85b348e6a9cd0cb967ff4006', '0', '3.png', null, '3', null, '625f1e0e951a4199a7262e064512e2c7', null, 'false', '消息管理', null, null, null, null);
INSERT INTO `pt_menu` VALUES ('bd5d741147f74a058a03bbb5164f392b', '1', '2.png', null, '9', 'd496b161d2564111992687b948862244', 'ed90c7b40be74552bbfa7ac58efdc5fe', '8a40c0353fa828a6013fa898d4ac0020', 'false', '数据源', '数据源', '数据源', 'Data source', 'データソース');
INSERT INTO `pt_menu` VALUES ('cdfd617ec645490f98a64bf36102d44f', '6', '6.png', null, '6', null, '625f1e0e951a4199a7262e064512e2c7', null, 'false', '新增菜单12', '新增菜单13', '新增菜单14', '222', '111');
INSERT INTO `pt_menu` VALUES ('ed30f3cd2e9f4e0aa0b950c147035b67', '0', '2.png', null, '2', '2c91467f905a4f5ba9f52830131c8ad9', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '分组管理', null, null, null, null);
INSERT INTO `pt_menu` VALUES ('ed90c7b40be74552bbfa7ac58efdc5fe', '1', '2.png', null, '2', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'true', '系统维护', '系统维护', '系统维护', 'System maintenance', 'システムのメンテナンス');
INSERT INTO `pt_menu` VALUES ('f353e484ce074b86b0210f66346d9a80', '1', '9.png', null, '10', '235d855d7b914d728e434f0f309aa04d', 'ed90c7b40be74552bbfa7ac58efdc5fe', '8a40c0353fa828a6013fa898d4ac0020', 'false', '系统日志', '系统日志', '系统日志', 'The system log', 'システムログ');

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
INSERT INTO `pt_module` VALUES ('297e0cf944e9762e0144e97dfd6e00c9', '0', '数据源', '2.png', 'true', '数据源', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('3bf4c1829bf447979865fc4d2ab75801', '0', null, '2.png', 'true', 'Log4j', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('3dec44186175424cbee2d05ffbb690dd', '0', null, '2.png', 'true', 'Upload', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('3e048ee263c344318e9c4995a5cd35e0', '0', null, '2.png', 'true', '验证码', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('4090cac06e15459789bc5154eef67e4e', '0', null, '2.png', 'true', 'Ueditor', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('417ed3d3cf4d4b7a939613829e8db17d', '0', null, '3.png', 'true', '消息管理', '3', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('7a35846a305c42abb68601b4f7347289', '0', null, '4.png', 'true', '主页管理', '4', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('8a1b51bb6fae4fac8591f4f387d250ff', '0', null, '2.png', 'true', '参数', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '根节点', '3.png', 'true', '根节点', '1', null, '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0021', '0', '后台登陆', '8.png', 'true', '登陆', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0022', '0', '字典', '2.png', 'true', '字典', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '用户分组管理', '2.png', 'true', '分组', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0024', '0', '角色管理', '2.png', 'true', '角色', '3', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0025', '0', '岗位管理', '5.png', 'true', '岗位', '4', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '系统管理', '5.png', 'true', '系统', '5', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', '功能管理', '7.png', 'true', '功能', '6', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', '部门管理', '3.png', 'true', '部门', '7', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0029', '0', '日志管理', '6.png', 'true', '日志', '11', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0030', '0', '用户管理', '3.png', 'true', '用户', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0031', '0', '公共功能', '5.png', 'true', '公共', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0032', '0', '菜单管理', '8.png', 'true', '菜单', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac0033', '0', '模块管理', '7.png', 'true', '模块', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac1100', '0', '根节点', '3.png', 'true', '根节点', '1', null, 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('8a40c0353fa828a6013fa898d4ac2200', '0', '根节点', '3.png', 'true', '根节点', '1', null, '0c1230c98ef34e58947903fab5a4fa85');
INSERT INTO `pt_module` VALUES ('8f53706d4af541588bde334d99d44727', '0', null, '6.png', 'true', '自动回复', '6', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('c4e63c4171db4ae2a83f7dfcc2656b0e', '0', null, '2.png', 'true', '用户管理', '2', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('c87c35097a2d4bc898fe6e9b1e280a3d', '0', null, '5.png', 'true', '位置管理', '5', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('e6eb0165223447218410f867a9614300', '0', null, '2.png', 'true', '分组管理', '2', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('e86e5bc9ae5d44e78a48543cf348ca82', '0', null, '2.png', 'true', 'test', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');

-- ----------------------------
-- Table structure for `pt_operator`
-- ----------------------------
DROP TABLE IF EXISTS `pt_operator`;
CREATE TABLE `pt_operator` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `pt_operator` VALUES ('01aa0c85c8b84ae8aca7f5484336b203', '1', null, '保存', null, null, null, '0', '/jf/dict/save', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('05114c0cbe1f4c2095b3216f13cfb681', '0', null, '保存', null, null, null, '0', '/jf/wx/keyword/save', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('053d330462e1459ca1012c9d29113bc4', '0', null, '获取部门负责人', null, null, null, '0', '/jf/dept/getPrincipal', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('06244cf3520c49e8a45cbde82a53fa5e', '0', null, 'treeTableIframe', null, null, null, '0', '/pingtai/param/treeTableIframe.html', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('0773a58c4bdb4858ab062c4a2a4da69a', '0', null, '默认主页', null, null, null, '0', '/jf/wx/keyword', '8f53706d4af541588bde334d99d44727', '1', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('091855dd809b418fae88a7fec6d9f246', '0', null, '准备更新', null, null, null, '0', '/jf/dict/edit', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('09b6ce29313c4051ba765de516a9b283', '0', null, 'treeData', null, null, null, '0', '/jf/station/treeData', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('0da15c49299d41a4b720f787d053e3cb', '0', null, '默认列表', null, null, null, '0', '/jf/operator', '8a40c0353fa828a6013fa898d4ac0027', '1', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('0fb7938c7d614fc389568eb67b442303', '0', null, '单选', null, null, null, '0', '/pingtai/module/radio.html', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('1046389d8525451697f2793185e7d6ee', '0', null, '更新', null, null, null, '0', '/jf/dept/update', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('10499bc7f9cb4adf99beba00343b4ea6', '0', null, '获取菜单功能', null, null, null, '0', '/jf/menu/getOperator', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('12141c1c3be241ca8a868bce9cd610d5', '0', null, '准备添加', null, null, null, '0', '/pingtai/dict/add.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('1553d9a97a4b4063a46f4be41e7adedd', '0', null, 'lucene', null, null, null, '0', '/jf/test/lucene', 'e86e5bc9ae5d44e78a48543cf348ca82', '1', '0', '0', '1', null, null, 'test');
INSERT INTO `pt_operator` VALUES ('15566e63f3104c73b4a0b4a784dd11ca', '0', null, '保存', null, null, null, '0', '/jf/role/save', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('1a8b4d8e4411412fa8bb561393563a85', '0', null, '准备添加', null, null, null, '0', '/pingtai/user/add.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('1b0d7476974e4bf9b52f75fb82f87330', '0', null, '分组默认列表', null, null, null, '0', '/jf/group', '8a40c0353fa828a6013fa898d4ac0023', '1', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('1b1a809815574b2a9c1d0e18d692de17', '0', null, '更新', null, null, null, '0', '/jf/operator/update', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('21141da4febe4c929abe37126b37fd12', '0', null, '多选', null, null, null, '0', '/pingtai/station/checkbox.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('21b0a910ef6e4c60a325d5e57e6e6f65', '0', null, '单选', null, null, null, '0', '/pingtai/dict/radio.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('22926eb196a14b48be775f4880b5ba94', '0', null, '保存', null, null, null, '0', '/jf/group/save', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('233356b63d8e477fb6e948b703232809', '0', null, '默认树', null, null, null, '0', '/jf/station', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('235d855d7b914d728e434f0f309aa04d', '0', null, '默认列表', null, null, null, '0', '/jf/sysLog', '8a40c0353fa828a6013fa898d4ac0029', '1', '0', '0', '1', null, null, '日志');
INSERT INTO `pt_operator` VALUES ('29c18b3394924c30882da049da14ad99', '0', null, '更新', null, null, null, '0', '/jf/role/update', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('2b7f6e28f9a74854b7399e8740b765fd', '0', null, 'log4jServlet', null, null, null, '0', '/se/log4j', '3bf4c1829bf447979865fc4d2ab75801', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO `pt_operator` VALUES ('2be34991827e4e8da8e92f9b9e8bce25', '0', null, 'treeTableSub', null, null, null, '0', '/jf/dict/treeTable', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('2c91467f905a4f5ba9f52830131c8ad9', '0', null, '默认分组列表', null, null, null, '0', '/jf/wx/group', 'e6eb0165223447218410f867a9614300', '1', '0', '0', '1', null, null, '分组管理');
INSERT INTO `pt_operator` VALUES ('2fbbc9cfb0bf4b5bb504ead155c3423c', '0', null, '保存', null, null, null, '0', '/jf/station/save', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('2fee901117c64e18873f60e8f800713d', '0', null, '单选', null, null, null, '0', '/pingtai/station/radio.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('32a3e59964204a3c8848e84b864306ae', '0', null, '删除', null, null, null, '0', '/jf/systems/delete', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('335d1f8f46eb47a18001889f8cc21348', '0', null, '删除', null, null, null, '0', '/jf/role/delete', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('362cf247241c4d12b6242301e4a73516', '0', null, '删除', null, null, null, '0', '/jf/station/delete', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('36d3b89e378b451ca89d1a41a3c53e10', '1', null, 'iframe', null, null, null, '0', '/pingtai/log4j/iframe.html', '3bf4c1829bf447979865fc4d2ab75801', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO `pt_operator` VALUES ('37218fb52ec94fb4bf76209a17916094', '0', null, '默认树', null, null, null, '0', '/jf/module', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('37a9a6966448469f9d9abe2e8aeb1b9e', '0', null, 'Upload', null, null, null, '0', '/jf/upload', '3dec44186175424cbee2d05ffbb690dd', '0', '0', '0', '1', null, null, 'Upload');
INSERT INTO `pt_operator` VALUES ('3b1e7c5d5e0e461c90e1f0032f679a25', '0', null, '查看', null, null, null, '0', '/jf/dict/view', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('3b6a8f61e20e4bf2943421af2119e9b9', '0', null, '准备添加', null, null, null, '0', '/pingtai/param/add.html', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('3dd486cd58da467dbd83ae420db14815', '0', null, '准备添加', null, null, null, '0', '/weiXin/keyword/add.html', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('3ee5f986289d4a1990f4e42c9a0caadb', '0', null, '准备添加', null, null, null, '0', '/pingtai/group/add.html', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('420d8ebc68ad44dc8188d4c27dc585d1', '0', null, '位置默认列表', null, null, null, '0', '/jf/wx/location', 'c87c35097a2d4bc898fe6e9b1e280a3d', '1', '0', '0', '1', null, null, '位置管理');
INSERT INTO `pt_operator` VALUES ('4376888fd74f4247a926529e5da03442', '0', null, 'treeData', null, null, null, '0', '/jf/user/treeData', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('437e05d09dd94720b67c4f230cdebe58', '0', null, '更新', null, null, null, '0', '/jf/module/update', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('45cf6e8f9c254e509399deda080f0e20', '0', null, '功能列表', null, null, null, '0', '/jf/test/operator', 'e86e5bc9ae5d44e78a48543cf348ca82', '1', '0', '0', '1', null, null, 'test');
INSERT INTO `pt_operator` VALUES ('46e00ef0fd234e9dbf68ed9bbb437d0f', '0', null, '多选', null, null, null, '0', '/pingtai/department/checkbox.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('481d4d5c0a634c4085c72c990260e58d', '0', null, '微信管理主页', null, null, null, '0', '/jf/wx/index/content', '7a35846a305c42abb68601b4f7347289', '0', '0', '0', '1', null, null, '主页管理');
INSERT INTO `pt_operator` VALUES ('48db51f20b504c4ab489b1dcfd3ecbd9', '0', null, '密码变更', null, null, null, '0', '/pingtai/user/passChange.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('4a05ffcfe351476391a036937eaf733f', '0', null, '删除', null, null, null, '0', '/jf/param/delete', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('4a6544ae7a2548ad81c0e3994999023c', '0', null, '准备设置菜单功能', null, null, null, '0', '/pingtai/menu/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('4df80521e66447618796c3cfe02bf239', '0', null, '默认treeTable', null, null, null, '0', '/jf/dict', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('5148ea207b974ee197f0bc57060ab1ad', '0', null, '删除', null, null, null, '0', '/jf/wx/location/delete', 'c87c35097a2d4bc898fe6e9b1e280a3d', '0', '0', '0', '1', null, null, '位置管理');
INSERT INTO `pt_operator` VALUES ('58a85040aa9f40cca0bdba6e23e30363', '0', null, '保存', null, null, null, '0', '/jf/dept/save', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('5982350f7d0e4b2ca72de64300d75223', '0', null, 'treeTable', null, null, null, '0', '/jf/param/treeTable', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('5b249ad344d948b99f58768c323f5f71', '0', null, '准备添加', null, null, null, '0', '/pingtai/systems/add.html', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('5fcac107c80d493d91b53a815d4b297a', '0', null, '保存', null, null, null, '0', '/jf/user/save', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('6131942dd2644790b80df13c14fb3ae8', '0', null, '保存', null, null, null, '0', '/jf/param/save', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('6569e0d9f2cd4e3a97af4e1b0cd8d2f7', '0', null, '删除', null, null, null, '0', '/jf/dict/delete', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('666f50e0f3b04f4ba43bcb4e719c1e8d', '0', null, '验证码', null, null, null, '0', '/jf/authImg', '3e048ee263c344318e9c4995a5cd35e0', '0', '0', '0', '0', null, null, '验证码');
INSERT INTO `pt_operator` VALUES ('6b527ed138c343a89ddf73cf16fef565', '0', null, '更新', null, null, null, '0', '/jf/wx/keyword/update', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('6daed51284f94923b1c8a6414e646959', '0', null, 'treeData', null, null, null, '0', '/jf/operator/treeData', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('74aa20442105408d90f9e6469a3a92b5', '0', null, 'treeTableIframe', null, null, null, '0', '/pingtai/dict/treeTableIframe.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('77823e12391a47729a1f82a00bc15c5b', '0', null, '准备更新', null, null, null, '0', '/jf/wx/keyword/edit', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('78c6026c6af44b41a6bef4cdb4cfb414', '0', null, '获取角色功能', null, null, null, '0', '/jf/role/getOperator', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('79039a2260da46b0aabb5a62e8db6c87', '0', null, '查看', null, null, null, '0', '/jf/user/view', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('7ae62737df444d619f8fd376360d160c', '0', null, '默认列表', null, null, null, '0', '/jf/role', '8a40c0353fa828a6013fa898d4ac0024', '1', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('7b4281dd247c4624bee0d8f84c2c2715', '0', null, '保存', null, null, null, '0', '/jf/systems/save', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('7cc12b5c154a4a9782c518c57e8ab3aa', '0', null, '准备更新', null, null, null, '0', '/jf/role/edit', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('7eab5f800bab4efb8df1b2e8a0575f73', '0', null, '默认列表', null, null, null, '0', '/jf/systems', '8a40c0353fa828a6013fa898d4ac0026', '1', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('7ed5eefbbf3d4aa78d0c5b99f3b7010c', '0', null, '登陆验证', null, null, null, '0', '/jf/login/vali', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('83ef85fd17804bb195d0ad3c07f88c30', '0', null, '准备更新', null, null, null, '0', '/jf/operator/edit', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('886bd497064b4c9f87d8461ebba421d1', '0', null, '首页', null, null, null, '0', '/jf/index', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('8911e913ceae47a28b809a619ccf8578', '0', null, '自动补全', null, null, null, '0', '/jf/test/autoComplete', 'e86e5bc9ae5d44e78a48543cf348ca82', '0', '0', '0', '1', null, null, 'test');
INSERT INTO `pt_operator` VALUES ('8bd9c0e14df941cdaf6253cd08dbd9cd', '0', null, '准备更新', null, null, null, '0', '/jf/systems/edit', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('8ca8af501522439d8c9249e00db5d78d', '0', null, '查看', null, null, null, '0', '/jf/sysLog/view', '8a40c0353fa828a6013fa898d4ac0029', '0', '0', '0', '1', null, null, '日志');
INSERT INTO `pt_operator` VALUES ('8f79857b31d4475a94c712e997e89c99', '0', null, '更新', null, null, null, '0', '/jf/dict/update', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('910955c2192a418995eeab8bf15372e9', '0', null, '准备添加', null, null, null, '0', '/pingtai/operator/add.html', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('91baed789bc14efdbebb10b49c69ee5b', '0', null, '默认主页列表', null, null, null, '0', '/jf/user', '8a40c0353fa828a6013fa898d4ac0030', '1', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('91f78713c3084b6e9b7419e2a97c7dac', '0', null, '查看', null, null, null, '0', '/jf/param/view', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('9765e6bb76eb40ab800cb8954822190e', '0', null, '删除', null, null, null, '0', '/jf/wx/keyword/delete', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('99a42a467bbf4e829fd0706507c9f7a7', '0', null, 'log4jHtml', null, null, null, '0', '/pingtai/log4j/log4j.html', '3bf4c1829bf447979865fc4d2ab75801', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO `pt_operator` VALUES ('9a708f39e123455e84b6125774bab1ea', '0', null, 'treeData', null, null, null, '0', '/jf/module/treeData', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('9ee4ee562eaa475a95f45d3daeb0220a', '0', null, '单选', null, null, null, '0', '/pingtai/param/radio.html', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('9f75b47bdc0249e2b493c47384785a72', '0', null, '保存', null, null, null, '0', '/jf/menu/save', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('a0c01a5248cd4bf38e57945dbb2b98c5', '0', null, '更新', null, null, null, '0', '/jf/group/update', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('a1ff68acf9b24c34b347ff21e333cb70', '0', null, '设置菜单功能', null, null, null, '0', '/jf/menu/setOperator', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('a5289b2638d845fbb06dedbcdd517f97', '0', null, '删除', null, null, null, '0', '/jf/group/delete', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('a6623c65480f4f2cb63a4d7673f81e3a', '0', null, 'treeData', null, null, null, '0', '/jf/menu/treeData', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('aa126932641f4e068ed8278a332de85d', '0', null, '默认主页', null, null, null, '0', '/jf/index/content', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('acbceb432b5849aca9e9b284240281ec', '0', null, '分组角色下拉选择', null, null, null, '0', '/jf/role/select', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('ad09a1b897744812875c752c2d70f11a', '0', null, '默认树', null, null, null, '0', '/jf/dept', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('ad51a6ca95c646ce9c03778eda715734', '0', null, '保存', null, null, null, '0', '/jf/operator/save', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('afe893c6be744c4f98187b084ac832e7', '0', null, '编辑更新菜单', null, null, null, '0', '/jf/menu/edit', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('b13b002e2fad4e95bbe0e4dbc9fbdfe1', '0', null, '保存', null, null, null, '0', '/jf/module/save', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('b23b17d4c83242e8a1a8ee8cfcde9907', '0', null, '查看', null, null, null, '0', '/jf/operator/view', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('b352e4246e754a9691bcc9011f445665', '0', null, 'treeData', null, null, null, '0', '/jf/param/treeData', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('b4ee4ae4391f4243be69e838545d2131', '0', null, 'treeData', null, null, null, '0', '/jf/dept/treeData', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('b8218945b8e743f29651569950014511', '0', null, '单选', null, null, null, '0', '/pingtai/department/radio.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('b82d86fb7b64498a9c2b8b9a99b3fbeb', '0', null, '删除', null, null, null, '0', '/jf/menu/delete', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('b8339f29d8d84a4ead6454295f87b79c', '0', null, '人员分组设置', null, null, null, '0', '/jf/group/select', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('bc2c865be6af42cf861294d446fb1c6f', '0', null, '单选', null, null, null, '0', '/pingtai/user/radio.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('beeaa7f4b2444430a6732ecc83c453a2', '0', null, '编辑', null, null, null, '0', '/jf/param/edit', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('c04adcd019e04cf3ba7c66af721a18dc', '0', null, '删除', null, null, null, '0', '/jf/user/delete', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('c05642442e0a468ebe4f0b7771a803ae', '0', null, '更新', null, null, null, '0', '/jf/systems/update', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('c081c50918f4459f8e36ab8cb4151a61', '0', null, '准备岗位功能设置', null, null, null, '0', '/pingtai/station/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('c0ccfcd127c347a8b9db140e5aa62188', '0', null, '准备添加', null, null, null, '0', '/pingtai/role/add.html', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('c1e991d1f56749298c18ff69d7777e0b', '0', null, '删除', null, null, null, '0', '/jf/module/delete', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('c29ea4cbd9044bc786e9f4584ad840ff', '0', null, '获取岗位功能', null, null, null, '0', '/jf/station/getOperator', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('c7132250f5054b808bb119122a6ecb52', '0', null, '设置岗位功能', null, null, null, '0', '/jf/station/setOperator', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('c9d013d14cbd4f148fb4562c91803ee8', '0', null, '准备更新', null, null, null, '0', '/jf/group/edit', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('ca0f6da01ada419eaa7739d9790e5b88', '0', null, '准备角色功能设置', null, null, null, '0', '/pingtai/role/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('cc6bcbee40ab43b2bd5aff6d9385e1fc', '0', null, '删除', null, null, null, '0', '/jf/operator/delete', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('cf26c1d2baa24a8791b3d264154b80d4', '0', null, '默认树', null, null, null, '0', '/jf/menu', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('d115d08591ef4c0eaebef15f8294b287', '0', null, '准备设置部门负责人', null, null, null, '0', '/pingtai/department/userTree.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('d1b453799d62485b82e027b96b596ccd', '0', null, 'ueditor', null, null, null, '0', '/jf/ueditor', '4090cac06e15459789bc5154eef67e4e', '0', '0', '0', '1', null, null, 'Ueditor');
INSERT INTO `pt_operator` VALUES ('d247fb45be724ed2a2bb5c92d73bf6cf', '0', null, '设置用户的组', null, null, null, '0', '/jf/user/setGroup', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('d479dbdc901f4d85a207b9bace6465ac', '0', null, '更新', null, null, null, '0', '/jf/user/update', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('d496b161d2564111992687b948862244', '0', null, 'iframe', null, null, null, '0', '/pingtai/druid/iframe.html', '297e0cf944e9762e0144e97dfd6e00c9', '0', '0', '0', '1', null, null, '数据源');
INSERT INTO `pt_operator` VALUES ('d5c8bdf7a49a4e46b776c05dc9ead484', '0', null, 'treeData', null, null, null, '0', '/jf/dict/treeData', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('d646da8707ae41838fd2ec9bf0d467ee', '0', null, '设置角色功能', null, null, null, '0', '/jf/role/setOperator', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('dad107c1aeb0419b8004d57f9d70223e', '0', null, '更新', null, null, null, '0', '/jf/param/update', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('dc750e57b54f4baca78d66969321ee51', '0', null, '更新', null, null, null, '0', '/jf/station/update', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('df0aa534655242e4a0bcd638b51a4e03', '0', null, '更新', null, null, null, '0', '/jf/menu/update', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('dfa8256651a84269869c35ca1f10cae5', '0', null, '日之分页', null, null, null, '0', '/jf/test/sysLog', 'e86e5bc9ae5d44e78a48543cf348ca82', '1', '0', '0', '1', null, null, 'test');
INSERT INTO `pt_operator` VALUES ('dfc7af0979a54e8e9a3f18b7a5d66030', '0', null, '查看', null, null, null, '0', '/jf/wx/keyword/view', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('dfe9d74fe0ef4220bfcfe6d7bb2f9436', '0', null, '默认用户列表', null, null, null, '0', '/jf/wx/user', 'c4e63c4171db4ae2a83f7dfcc2656b0e', '1', '0', '0', '1', null, null, '用户管理');
INSERT INTO `pt_operator` VALUES ('e037e0bae9a94e549d6b647db49a64a1', '0', null, '角色设置', null, null, null, '0', '/jf/group/setRole', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('e754dfdb794d4e7db6023c9b089a340c', '0', null, '多选', null, null, null, '0', '/pingtai/user/checkbox.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('f1f6f2c8f026498c8ee64b7a918d06df', '0', null, '准备更新', null, null, null, '0', '/jf/user/edit', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('f57388d139034099932c36a955df625a', '0', null, '准备编辑菜单', null, null, null, '0', '/jf/menu/toEdit', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('f771691134c34174a819b5990310d000', '0', null, '首页', null, null, null, '0', '/jf/', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('f771691134c34174a819b5990310da56', '0', null, '注销', null, null, null, '0', '/jf/login/logout', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('f7c220a81ba843938f8ccb108bec9c03', '0', null, '参数主页', null, null, null, '0', '/jf/param', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('f82c021dc443419fb2469032af73bf3e', '0', null, '删除', null, null, null, '0', '/jf/dept/delete', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('fb6a0c1e618041bcbbf8cfd41311b1fa', '0', null, '准备登陆', null, null, null, '0', '/jf/login', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('fd9978df5c5a47f298e2d28e21e70b15', '0', null, '删除', null, null, null, '0', '/jf/sysLog/delete', '8a40c0353fa828a6013fa898d4ac0029', '0', '0', '0', '1', null, null, '日志');

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
INSERT INTO `pt_param` VALUES ('0c78f87750a745bbb59005a6ca0f744a', '0', null, '3.png', 'weixinToken', '3', '100103root/83f4b0ee56904cbeb5f91696ad804c29/0c78f87750a745bbb59005a6ca0f744a', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinToken', '123', '1', null, null, null, null, null, '1');
INSERT INTO `pt_param` VALUES ('7381008292054bccba20224bc33774d7', '7', null, '2.png', 'weixinAppID', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29/7381008292054bccba20224bc33774d7', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppID', '123', null, '1234', '1234', '1234', '1234', '1234', '1');
INSERT INTO `pt_param` VALUES ('8094c60d7a594b36bb0187cbce9c4188', '0', null, '2.png', 'weixinAppSecret', '2', '100103root/83f4b0ee56904cbeb5f91696ad804c29/8094c60d7a594b36bb0187cbce9c4188', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppSecret', '123', '1', null, null, null, null, null, '1');
INSERT INTO `pt_param` VALUES ('83f4b0ee56904cbeb5f91696ad804c29', '0', null, '2.png', '微信配置', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29', null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'weixinConfig', null, '1', null, null, null, null, null, '1');
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
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `operatorids` text COLLATE utf8_bin,
  `moduleids` text COLLATE utf8_bin,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_role
-- ----------------------------
INSERT INTO `pt_role` VALUES ('8a40c0353fa828a6013fa898d4ac0023', '1', '超级管理员', '系统管理员', 0x6F70657261746F725F38663961623731643532366334353335396334343736663935373938376536642C6F70657261746F725F33373231386662353265633934666234626637363230396131373931363039342C6F70657261746F725F63316539393164316635363734393239386331386666363964373737376530622C6F70657261746F725F62313362303032653266616434653935626265306534646263396662646665312C6F70657261746F725F39613730386633396531323334353565383462363132353737346261623165612C6F70657261746F725F34333765303564303964643934373230623637633466323330636465626535382C6F70657261746F725F30666237393338633764363134666333383935363865623637623434323330332C6F70657261746F725F39316261656437383962633134656664626562623130623439633639656535622C6F70657261746F725F63303461646364303139653034636633626137633636616637323161313864632C6F70657261746F725F66316636663263386630323634393863386565363462376139313864303664662C6F70657261746F725F35666361633130376338306434393364393162353361383135643462323937612C6F70657261746F725F64323437666234356265373234656432613262623563393264373362663663662C6F70657261746F725F34333736383838666437346634323437613932363532396535646130333434322C6F70657261746F725F64343739646264633930316634643835613230376239626163653634363561632C6F70657261746F725F37393033396132323630646134366230616162623561363265386462366338372C6F70657261746F725F31613862346438653434313134313266613862623536313339333536336138352C6F70657261746F725F65373534646664623739346434653764623630323363396230383961333430632C6F70657261746F725F34386462353166323062353034633461623438396231646366643365636264392C6F70657261746F725F62633263383635626536616634326366383631323934643434366662316336662C6F70657261746F725F63663236633164326261613234613837393162336432363431353462383064342C6F70657261746F725F62383264383666623762363434393861396332623862396139396233666265622C6F70657261746F725F31303439396263376639636234616466393962656261303033343362346561362C6F70657261746F725F39663735623437626463303234396532623439336334373338343738356137322C6F70657261746F725F61316666363861636639623234633334623334376666323165333333636237302C6F70657261746F725F61363632336336353438306634663263623633613464373637336638316533612C6F70657261746F725F64663061613533343635353234326534613062636436333862353161346530332C6F70657261746F725F34613635343461653761323534386164383163306533393934393939303233632C6F70657261746F725F66373731363931313334633334313734613831396235393930333130643030302C6F70657261746F725F38383662643439373036346234633966383764383436316562626134323164312C6F70657261746F725F61613132363933323634316634653036386564383237386133333264653835642C6F70657261746F725F66623661306331653631383034316263626266386366643431333131623166612C6F70657261746F725F66373731363931313334633334313734613831396235393930333130646135362C6F70657261746F725F37656435656566626266336434616137386430633562393966336237303130632C6F70657261746F725F31623064373437363937346534626639623532663735666238326638373333302C6F70657261746F725F61353238396232363338643834356662623036646564626364643531376639372C6F70657261746F725F63396430313364313463626434663134386662343536326339313830336565382C6F70657261746F725F32323932366562313936613134623438626537373566343838306235626139342C6F70657261746F725F62383333396632396438643834613465616436343534323935663837623739632C6F70657261746F725F65303337653062616539613934653534396436623634376462343961363461312C6F70657261746F725F61306330316135323438636434626633386535373934356462623262393863352C6F70657261746F725F33656535663938363238396434613139393066346534326339613063616164622C6F70657261746F725F64343936623136316432353634313131393932363837623934383836323234342C6F70657261746F725F34646638303532316536363434373631383739366333636665303262663233392C6F70657261746F725F36353639653064396632636434653361393761663465316230636438643266372C6F70657261746F725F66313663616464386638316534626566393236653039663731386462386665322C6F70657261746F725F30393138353564643830396234313866616538386137666563366439663234362C6F70657261746F725F30316161306338356338623834616538616361376635343834333336623230332C6F70657261746F725F64356338626466376134396134653436623737366330356463396561643438342C6F70657261746F725F32626533343939313832376534653864613865393266396239653862636532352C6F70657261746F725F38663739383537623331643434373561393463373132653939376538396339392C6F70657261746F725F31323134316331633362653234316361386138363862636539636436313064352C6F70657261746F725F32316230613931306566366534633630613332356435653537653665366636352C6F70657261746F725F64316531346530623766363934373833393438353064323233383231343639322C6F70657261746F725F37346161323034343231303534303864393066396536343639613361393262352C6F70657261746F725F38383937646265383562336534653639383964363632343935323732636632362C6F70657261746F725F37616536323733376466343434643631396638666433373633363064313630632C6F70657261746F725F33333564316638663436656234376131383030313838396638636332313334382C6F70657261746F725F37636331326235633135346134613937383263353138633537653861623361612C6F70657261746F725F37386336303236633661663434623431613662656634636462346366623431342C6F70657261746F725F31353536366536336633313034633733623461306234613738346464313163612C6F70657261746F725F61636263656234333262353834396163613965396232383432343032383165632C6F70657261746F725F64363436646138373037616534313833386664326563396266306434363765652C6F70657261746F725F32396331386233333934393234633330383832646130343964613134616439392C6F70657261746F725F63306363666364313237633334376138623964623134306535616136323138382C6F70657261746F725F63613066366461303161646134313965616137373339643937393065356238382C6F70657261746F725F32333333353662363364386534373766623665393438623730333233323830392C6F70657261746F725F33363263663234373234316334643132623632343233303165346137333531362C6F70657261746F725F63323965613463626439303434626337383665396634353834616438343066662C6F70657261746F725F32666262633963666230626634623562623530346561643135356333343233632C6F70657261746F725F63373133323235306635303534623830386262313139313232613665636235322C6F70657261746F725F30396236636532393331336334303531626137363564653531366139623238332C6F70657261746F725F64633735306535376235346634626163613738643636393639333231656535312C6F70657261746F725F32313134316461346665626534633932396162653337313236623337666431322C6F70657261746F725F63303831633530393138663434353966386533366162386362343135316136312C6F70657261746F725F32666565393031313137633634653138383733663630653866383030373133642C6F70657261746F725F37656162356638303062616234656662386466316232653861303537356637332C6F70657261746F725F33326133653539393634323034613363383834386538346238363433303661652C6F70657261746F725F38626439633065313464663934316364616636323533636430386462643963642C6F70657261746F725F37623432383164643234376334363234626565306438663834633263323731352C6F70657261746F725F63303536343234343265306134363865626534663062373737316138303361652C6F70657261746F725F35623234396164333434643934386239396635383736386333323366356637312C6F70657261746F725F30646131356334393239396434316134623732306637383764303533653363622C6F70657261746F725F63633662636265653430616234336232626435616666366439333835653166632C6F70657261746F725F38336566383566643137383034626231393564306164336330376638386333302C6F70657261746F725F61643531613663613935633634366365396330333737386564613731353733342C6F70657261746F725F36646165643531323834663934393233623163386136343134653634363935392C6F70657261746F725F31623161383039383135353734623261396331643065313864363932646531372C6F70657261746F725F62323362313764346338333234326538613161386565386366636465393930372C6F70657261746F725F39313039353563323139326134313839393565656162386266313533373265392C6F70657261746F725F61643039613162383937373434383132383735633735326332643730663131612C6F70657261746F725F66383263303231646334343334313966623234363930333261663733626633652C6F70657261746F725F30353364333330343632653134353963613130313263396432393131336263342C6F70657261746F725F35386138353034306161396634306363613062646261366532336533303336332C6F70657261746F725F62346565346165343339316634323433626536396538333835343564323133312C6F70657261746F725F31303436333839643835323534353136393766323739333138356537643665652C6F70657261746F725F34366530306566306664323334653964626636386564396262623433376430662C6F70657261746F725F62383231383934356238653734336632393635313536393935303031343531312C6F70657261746F725F64313135643038353931656634633065616562656631356638323934623238372C6F70657261746F725F32333564383535643762393134643732386534333466306633303961613034642C6F70657261746F725F66643939373864663563356134376632393865326432386532316537306231352C6F70657261746F725F38636138616635303135323234333964386339323439653030646235643738642C6F70657261746F725F64666539643734666530656634323230626663666536643762623266393433362C6F70657261746F725F32633931343637663930356134663562613966353238333031333163386164392C6F70657261746F725F34383164346435633061363334633430383563373263393930323630653538642C6F70657261746F725F34323064386562633638616434346463383138386434633237646335383564312C6F70657261746F725F35313438656132303762393734656531393766306263353730363061623161642C6F70657261746F725F30373733613538633462646234383538616230363263346132613464613639612C6F70657261746F725F39373635653662623736656234306162383030636238393534383232313930652C6F70657261746F725F37373832336531323339316134373732396131663832613030626331356335622C6F70657261746F725F30353131346330636265316634633230393562333231366631336366623638312C6F70657261746F725F36623532376564313338633334336138396464663733636631366665663536352C6F70657261746F725F64666337616630393739613534653865396133663138623761356436363033302C6F70657261746F725F33646434383663643538646134363764626438336165343230646231343831352C6F70657261746F725F33366433623839653337386234353163613839643161343161336335336531302C6F70657261746F725F39396134326134363762626634653832396664303730363530376339663761372C6F70657261746F725F32623766366532386639613734383534623733393965383734306237363566642C6F70657261746F725F64316234353337393964363234383562383265303237623936623539366363642C6F70657261746F725F33376139613639363634343834363966396439616265326538616562316239652C6F70657261746F725F33623165376335643565306534363163393065316630303332663637396132352C6F70657261746F725F61666538393363366265373434633466393831383762303834616338333265372C6F70657261746F725F66353733383864313339303334303939393332633336613935356466363235612C6F70657261746F725F66376332323061383162613834333933386638636362313038626563396330332C6F70657261746F725F34613035666663666533353134373633393161303336393337656166373333662C6F70657261746F725F62656561613766346232343434343330613637333265636338336334353361322C6F70657261746F725F36313331393432646432363434373930623830646631336331346662336165382C6F70657261746F725F62333532653432343665373534613936393162636339303131663434353636352C6F70657261746F725F35393832333530663764306534623263613732646536343330306437353232332C6F70657261746F725F64616431303763316165623034313962383030346435376639643730323233652C6F70657261746F725F39316637383731336333303834623665396237343139653261393763376461632C6F70657261746F725F33623661386636316532306534626632393433343231616632313139653962392C6F70657261746F725F39656534656535363265616134373561393566343564336461656230323230612C6F70657261746F725F30363234346366333532306334396538613435636264653832613533666135652C6F70657261746F725F36363666353065306633623034663462613433626362346537313963316538642C6F70657261746F725F34356366366538663963323534653530393339396465646130383066306532302C6F70657261746F725F64666138323536363531613834323639383639633335636131663130636165352C6F70657261746F725F31353533643961393761346234303633613436663462653431653761646564642C6F70657261746F725F38393131653931336365616534376132386238303961363139636366383537382C, 0x6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033332C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033302C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033312C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032312C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032332C6D6F64756C655F32393765306366393434653937363265303134346539376466643665303063392C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032342C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032352C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032362C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032372C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032382C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032392C6D6F64756C655F38613430633033353366613832386136303133666138393864346163313130302C6D6F64756C655F63346536336334313731646234616532613833663764666363323635366230652C6D6F64756C655F65366562303136353232333434373231383431306638363761393631343330302C6D6F64756C655F34313765643364336366346434623761393339363133383239653864623137642C6D6F64756C655F37613335383436613330356334326162623638363031623466373334373238392C6D6F64756C655F63383763333530393761326434626338393866653665396231653238306133642C6D6F64756C655F38663533373036643461663534313538386264653333346439396434343732372C6D6F64756C655F38613430633033353366613832386136303133666138393864346163323230302C6D6F64756C655F33626634633138323962663434373937393836356663346432616237353830312C6D6F64756C655F34303930636163303665313534353937383962633531353465656636376534652C6D6F64756C655F33646563343431383631373534323463626565326430356666626236393064642C6D6F64756C655F38613162353162623666616534666163383539316634663338376432353066662C6D6F64756C655F33653034386565323633633334343331386539633439393561356364333565302C6D6F64756C655F65383665356263396165356434346537386134383534336366333438636138322C);

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
  `operatorids` text COLLATE utf8_bin,
  `moduleids` text COLLATE utf8_bin,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_station
-- ----------------------------
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '根节点', '1_open.png', 'true', '岗位组织结构', '1', null, '', '');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0021', '0', '人事经理', '2.png', 'false', '人事经理', '6', '8a40c0353fa828a6013fa898d4ac0020', 0x6F70657261746F725F3532302C6F70657261746F725F3532362C6F70657261746F725F3533302C6F70657261746F725F3532372C, 0x6D6F64756C655F38613430633033353366653035363562303133303030312C6D6F64756C655F38613430633033353366653035363562303133303030322C);
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0022', '0', '财务经理', '3.png', 'false', '财务经理', '8', '8a40c0353fa828a6013fa898d4ac0020', '', '');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '行政经理', '4.png', 'false', '行政经理', '7', '8a40c0353fa828a6013fa898d4ac0020', 0x6F70657261746F725F3532302C6F70657261746F725F3532362C6F70657261746F725F3533302C6F70657261746F725F3532392C, 0x6D6F64756C655F38613430633033353366653035363562303133303030312C6D6F64756C655F38613430633033353366653035363562303133303030322C);
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0024', '0', '测试经理', '5.png', 'false', '测试经理111', '9', '8a40c0353fa828a6013fa898d4ac0020', '', '');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0025', '0', '研发经理', '6.png', 'false', '研发经理', '1', '8a40c0353fa828a6013fa898d4ac0020', '', '');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '应用Java', '8.png', 'false', '应用Java', '3', '8a40c0353fa828a6013fa898d4ac0027', 0x6F70657261746F725F33373231386662353265633934666234626637363230396131373931363039342C6F70657261746F725F63316539393164316635363734393239386331386666363964373737376530622C6F70657261746F725F62313362303032653266616434653935626265306534646263396662646665312C6F70657261746F725F39613730386633396531323334353565383462363132353737346261623165612C6F70657261746F725F34333765303564303964643934373230623637633466323330636465626535382C6F70657261746F725F30666237393338633764363134666333383935363865623637623434323330332C6F70657261746F725F66373731363931313334633334313734613831396235393930333130643030302C6F70657261746F725F38383662643439373036346234633966383764383436316562626134323164312C6F70657261746F725F61613132363933323634316634653036386564383237386133333264653835642C6F70657261746F725F66623661306331653631383034316263626266386366643431333131623166612C6F70657261746F725F66373731363931313334633334313734613831396235393930333130646135362C6F70657261746F725F37656435656566626266336434616137386430633562393966336237303130632C6F70657261746F725F63663236633164326261613234613837393162336432363431353462383064342C6F70657261746F725F62383264383666623762363434393861396332623862396139396233666265622C6F70657261746F725F31303439396263376639636234616466393962656261303033343362346561362C6F70657261746F725F39663735623437626463303234396532623439336334373338343738356137322C6F70657261746F725F61316666363861636639623234633334623334376666323165333333636237302C6F70657261746F725F61363632336336353438306634663263623633613464373637336638316533612C6F70657261746F725F64663061613533343635353234326534613062636436333862353161346530332C6F70657261746F725F34613635343461653761323534386164383163306533393934393939303233632C6F70657261746F725F39316261656437383962633134656664626562623130623439633639656535622C6F70657261746F725F63303461646364303139653034636633626137633636616637323161313864632C6F70657261746F725F66316636663263386630323634393863386565363462376139313864303664662C6F70657261746F725F35666361633130376338306434393364393162353361383135643462323937612C6F70657261746F725F64323437666234356265373234656432613262623563393264373362663663662C6F70657261746F725F34333736383838666437346634323437613932363532396535646130333434322C6F70657261746F725F64343739646264633930316634643835613230376239626163653634363561632C6F70657261746F725F37393033396132323630646134366230616162623561363265386462366338372C6F70657261746F725F31613862346438653434313134313266613862623536313339333536336138352C6F70657261746F725F65373534646664623739346434653764623630323363396230383961333430632C6F70657261746F725F34386462353166323062353034633461623438396231646366643365636264392C6F70657261746F725F62633263383635626536616634326366383631323934643434366662316336662C6F70657261746F725F64343936623136316432353634313131393932363837623934383836323234342C6F70657261746F725F31623064373437363937346534626639623532663735666238326638373333302C6F70657261746F725F61353238396232363338643834356662623036646564626364643531376639372C6F70657261746F725F63396430313364313463626434663134386662343536326339313830336565382C6F70657261746F725F32323932366562313936613134623438626537373566343838306235626139342C6F70657261746F725F62383333396632396438643834613465616436343534323935663837623739632C6F70657261746F725F65303337653062616539613934653534396436623634376462343961363461312C6F70657261746F725F61306330316135323438636434626633386535373934356462623262393863352C6F70657261746F725F33656535663938363238396434613139393066346534326339613063616164622C6F70657261746F725F34646638303532316536363434373631383739366333636665303262663233392C6F70657261746F725F36353639653064396632636434653361393761663465316230636438643266372C6F70657261746F725F66313663616464386638316534626566393236653039663731386462386665322C6F70657261746F725F30393138353564643830396234313866616538386137666563366439663234362C6F70657261746F725F30316161306338356338623834616538616361376635343834333336623230332C6F70657261746F725F64356338626466376134396134653436623737366330356463396561643438342C6F70657261746F725F32626533343939313832376534653864613865393266396239653862636532352C6F70657261746F725F38663739383537623331643434373561393463373132653939376538396339392C6F70657261746F725F31323134316331633362653234316361386138363862636539636436313064352C6F70657261746F725F32316230613931306566366534633630613332356435653537653665366636352C6F70657261746F725F64316531346530623766363934373833393438353064323233383231343639322C6F70657261746F725F37346161323034343231303534303864393066396536343639613361393262352C6F70657261746F725F38383937646265383562336534653639383964363632343935323732636632362C6F70657261746F725F37616536323733376466343434643631396638666433373633363064313630632C6F70657261746F725F33333564316638663436656234376131383030313838396638636332313334382C6F70657261746F725F37636331326235633135346134613937383263353138633537653861623361612C6F70657261746F725F37386336303236633661663434623431613662656634636462346366623431342C6F70657261746F725F31353536366536336633313034633733623461306234613738346464313163612C6F70657261746F725F61636263656234333262353834396163613965396232383432343032383165632C6F70657261746F725F64363436646138373037616534313833386664326563396266306434363765652C6F70657261746F725F32396331386233333934393234633330383832646130343964613134616439392C6F70657261746F725F63306363666364313237633334376138623964623134306535616136323138382C6F70657261746F725F63613066366461303161646134313965616137373339643937393065356238382C6F70657261746F725F32333333353662363364386534373766623665393438623730333233323830392C6F70657261746F725F33363263663234373234316334643132623632343233303165346137333531362C6F70657261746F725F63323965613463626439303434626337383665396634353834616438343066662C6F70657261746F725F32666262633963666230626634623562623530346561643135356333343233632C6F70657261746F725F63373133323235306635303534623830386262313139313232613665636235322C6F70657261746F725F30396236636532393331336334303531626137363564653531366139623238332C6F70657261746F725F64633735306535376235346634626163613738643636393639333231656535312C6F70657261746F725F32313134316461346665626534633932396162653337313236623337666431322C6F70657261746F725F63303831633530393138663434353966386533366162386362343135316136312C6F70657261746F725F32666565393031313137633634653138383733663630653866383030373133642C6F70657261746F725F37656162356638303062616234656662386466316232653861303537356637332C6F70657261746F725F33326133653539393634323034613363383834386538346238363433303661652C6F70657261746F725F38626439633065313464663934316364616636323533636430386462643963642C6F70657261746F725F37623432383164643234376334363234626565306438663834633263323731352C6F70657261746F725F63303536343234343265306134363865626534663062373737316138303361652C6F70657261746F725F35623234396164333434643934386239396635383736386333323366356637312C6F70657261746F725F30646131356334393239396434316134623732306637383764303533653363622C6F70657261746F725F63633662636265653430616234336232626435616666366439333835653166632C6F70657261746F725F38336566383566643137383034626231393564306164336330376638386333302C6F70657261746F725F61643531613663613935633634366365396330333737386564613731353733342C6F70657261746F725F36646165643531323834663934393233623163386136343134653634363935392C6F70657261746F725F31623161383039383135353734623261396331643065313864363932646531372C6F70657261746F725F62323362313764346338333234326538613161386565386366636465393930372C6F70657261746F725F39313039353563323139326134313839393565656162386266313533373265392C6F70657261746F725F61643039613162383937373434383132383735633735326332643730663131612C6F70657261746F725F66383263303231646334343334313966623234363930333261663733626633652C6F70657261746F725F30353364333330343632653134353963613130313263396432393131336263342C6F70657261746F725F35386138353034306161396634306363613062646261366532336533303336332C6F70657261746F725F62346565346165343339316634323433626536396538333835343564323133312C6F70657261746F725F31303436333839643835323534353136393766323739333138356537643665652C6F70657261746F725F34366530306566306664323334653964626636386564396262623433376430662C6F70657261746F725F62383231383934356238653734336632393635313536393935303031343531312C6F70657261746F725F64313135643038353931656634633065616562656631356638323934623238372C6F70657261746F725F32333564383535643762393134643732386534333466306633303961613034642C6F70657261746F725F66643939373864663563356134376632393865326432386532316537306231352C6F70657261746F725F38636138616635303135323234333964386339323439653030646235643738642C6F70657261746F725F64666539643734666530656634323230626663666536643762623266393433362C6F70657261746F725F32633931343637663930356134663562613966353238333031333163386164392C6F70657261746F725F34383164346435633061363334633430383563373263393930323630653538642C6F70657261746F725F34323064386562633638616434346463383138386434633237646335383564312C6F70657261746F725F35313438656132303762393734656531393766306263353730363061623161642C6F70657261746F725F30373733613538633462646234383538616230363263346132613464613639612C6F70657261746F725F39373635653662623736656234306162383030636238393534383232313930652C6F70657261746F725F37373832336531323339316134373732396131663832613030626331356335622C6F70657261746F725F30353131346330636265316634633230393562333231366631336366623638312C6F70657261746F725F36623532376564313338633334336138396464663733636631366665663536352C6F70657261746F725F64666337616630393739613534653865396133663138623761356436363033302C6F70657261746F725F33646434383663643538646134363764626438336165343230646231343831352C6F70657261746F725F33366433623839653337386234353163613839643161343161336335336531302C6F70657261746F725F39396134326134363762626634653832396664303730363530376339663761372C6F70657261746F725F32623766366532386639613734383534623733393965383734306237363566642C6F70657261746F725F64316234353337393964363234383562383265303237623936623539366363642C6F70657261746F725F33376139613639363634343834363966396439616265326538616562316239652C6F70657261746F725F33623165376335643565306534363163393065316630303332663637396132352C6F70657261746F725F66376332323061383162613834333933386638636362313038626563396330332C6F70657261746F725F34613035666663666533353134373633393161303336393337656166373333662C6F70657261746F725F62656561613766346232343434343330613637333265636338336334353361322C6F70657261746F725F36313331393432646432363434373930623830646631336331346662336165382C6F70657261746F725F62333532653432343665373534613936393162636339303131663434353636352C6F70657261746F725F35393832333530663764306534623263613732646536343330306437353232332C6F70657261746F725F64616431303763316165623034313962383030346435376639643730323233652C6F70657261746F725F39316637383731336333303834623665396237343139653261393763376461632C6F70657261746F725F33623661386636316532306534626632393433343231616632313139653962392C6F70657261746F725F39656534656535363265616134373561393566343564336461656230323230612C6F70657261746F725F30363234346366333532306334396538613435636264653832613533666135652C6F70657261746F725F36363666353065306633623034663462613433626362346537313963316538642C6F70657261746F725F66353733383864313339303334303939393332633336613935356466363235612C6F70657261746F725F61666538393363366265373434633466393831383762303834616338333265372C, 0x6D6F64756C655F38613430633033353433323865353237303134333238653838346265303031362C6D6F64756C655F70696E675461692C6D6F64756C655F70696E6754616930303032302C6D6F64756C655F70696E67546169303030342C6D6F64756C655F70696E6754616930303031362C6D6F64756C655F70696E67546169303030372C6D6F64756C655F70696E6754616930303031322C6D6F64756C655F32393765306366393434663863636537303134346638653136366134303136372C6D6F64756C655F70696E6754616930303031352C6D6F64756C655F70696E6754616930303032322C6D6F64756C655F70696E6754616930303031302C6D6F64756C655F70696E6754616930303031382C6D6F64756C655F70696E67546169303030362C6D6F64756C655F70696E6754616930303032332C6D6F64756C655F70696E6754616930303031312C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032302C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033332C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032312C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033312C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033302C6D6F64756C655F32393765306366393434653937363265303134346539376466643665303063392C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032332C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032342C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032352C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032362C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032372C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032382C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032392C6D6F64756C655F38613430633033353366613832386136303133666138393864346163313130302C6D6F64756C655F63346536336334313731646234616532613833663764666363323635366230652C6D6F64756C655F65366562303136353232333434373231383431306638363761393631343330302C6D6F64756C655F34313765643364336366346434623761393339363133383239653864623137642C6D6F64756C655F37613335383436613330356334326162623638363031623466373334373238392C6D6F64756C655F63383763333530393761326434626338393866653665396231653238306133642C6D6F64756C655F38663533373036643461663534313538386264653333346439396434343732372C6D6F64756C655F38613430633033353366613832386136303133666138393864346163323230302C6D6F64756C655F33626634633138323962663434373937393836356663346432616237353830312C6D6F64756C655F34303930636163303665313534353937383962633531353465656636376534652C6D6F64756C655F33646563343431383631373534323463626565326430356666626236393064642C6D6F64756C655F38613162353162623666616534666163383539316634663338376432353066662C6D6F64756C655F33653034386565323633633334343331386539633439393561356364333565302C);
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', '应用经理', '7.png', 'true', '应用经理', '2', '8a40c0353fa828a6013fa898d4ac0020', '', '');
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', '应用C++', '2.png', 'false', '应用C++', '5', '8a40c0353fa828a6013fa898d4ac0027', '', '');

-- ----------------------------
-- Table structure for `pt_syslog`
-- ----------------------------
DROP TABLE IF EXISTS `pt_syslog`;
CREATE TABLE `pt_syslog` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `actionenddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `actionendtime` bigint(20) DEFAULT NULL,
  `actionhaoshi` bigint(20) DEFAULT NULL,
  `actionstartdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actionstarttime` bigint(20) DEFAULT NULL,
  `cause` char(1) COLLATE utf8_bin DEFAULT NULL,
  `cookie` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `enddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endtime` bigint(20) DEFAULT NULL,
  `haoshi` bigint(20) DEFAULT NULL,
  `ips` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `method` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `referer` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `requestpath` text COLLATE utf8_bin,
  `startdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `starttime` bigint(20) DEFAULT NULL,
  `status` char(1) COLLATE utf8_bin DEFAULT NULL,
  `useragent` varchar(200) COLLATE utf8_bin DEFAULT NULL,
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
  PRIMARY KEY (`ids`)
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
  `password` blob,
  `salt` blob,
  `status` char(1) COLLATE utf8_bin DEFAULT NULL,
  `stopdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `departmentids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `userinfoids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `stationids` text COLLATE utf8_bin,
  `deptids` text COLLATE utf8_bin,
  `userids` text COLLATE utf8_bin,
  `groupids` text COLLATE utf8_bin,
  `departmentnames` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `stationnames` text COLLATE utf8_bin,
  `deptnames` text COLLATE utf8_bin,
  `usernames` text COLLATE utf8_bin,
  `groupnames` text COLLATE utf8_bin,
  PRIMARY KEY (`ids`),
  KEY `usernameindex` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_user
-- ----------------------------
INSERT INTO `pt_user` VALUES ('03a44ba0aa4e4905bea726d4da976ba5', '2', '0', '0', 0xF1F086AE167055D1183C2CF37EEB10EF41EFFCD6, 0x87FFE243576B1A8C, '1', '2014-08-25 14:14:15', 'admins', '8a40c0353fa828a6013fa898d4ac0028', '03a44ba0aa4e4905bea726d4da976ba5', 0x3861343063303335336661383238613630313366613839386434616330303236, 0x646570745F342C646570745F322C, 0x757365725F30336134346261306161346534393035626561373236643464613937366261352C, 0x38613430633033353366613832386136303133666138393864346163303032382C, '运维部', 0xE5BA94E794A84A617661, 0xE8BF90E7BBB4E983A82CE7B3BBE7BB9FE5B9B3E58FB0E983A82C, 0x61646D696E73, null);

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
  `clientlevelend` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `clientlevelstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `culture` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `finishschooldate` date DEFAULT NULL,
  `folk` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `government` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `homepage` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `householder` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `idcard` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `marriage` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `msn` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(25) COLLATE utf8_bin DEFAULT NULL,
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
  KEY `emailindex` (`email`) USING BTREE,
  KEY `msnindex` (`msn`) USING BTREE,
  KEY `nativityaddressindex` (`nativityaddress`) USING BTREE,
  KEY `postboyindex` (`postboy`) USING BTREE,
  KEY `schoolnameindex` (`schoolname`) USING BTREE,
  KEY `specialityindex` (`speciality`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_userinfo
-- ----------------------------
INSERT INTO `pt_userinfo` VALUES ('03a44ba0aa4e4905bea726d4da976ba5', '2', '湖北钟祥', null, '55', '2012-03-07', 'bloodGroup_A', '2014-08-25 14:14:15', '2014-06-09 11:21:13', 'wenHuaChenDu_chuZhong', '湖北钟祥', 'dongcb678@163.com', '2010-10-25', 'folk_han', 'government_dangYuan', 'http://www.4bu4.com', '湖北钟祥', '420881198609285832', 'marriage_no', '13871558042', null, '董华健', '湖北钟祥', '431924', '150584428', '西安外事学院', 'man', '电子商务', '165', '027-65155060');

-- ----------------------------
-- Table structure for `wx_article`
-- ----------------------------
DROP TABLE IF EXISTS `wx_article`;
CREATE TABLE `wx_article` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `messageids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `Title` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Description` text COLLATE utf8_bin,
  `PicUrl` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '图片链接，支持JPG、PNG格式，较好的效果为大图640*320，小图80*80',
  `Url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '点击图文消息跳转链接',
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of wx_article
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_file`
-- ----------------------------
DROP TABLE IF EXISTS `wx_file`;
CREATE TABLE `wx_file` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of wx_file
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_group`
-- ----------------------------
DROP TABLE IF EXISTS `wx_group`;
CREATE TABLE `wx_group` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `count` decimal(20,0) DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of wx_group
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `wx_keyword`;
CREATE TABLE `wx_keyword` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `question` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '问题',
  `questionkey` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '问题关键字',
  `answer` text COLLATE utf8_bin COMMENT '答案',
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of wx_keyword
-- ----------------------------
INSERT INTO `wx_keyword` VALUES ('00592572e58b4c45ab8af0233f41515e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('009ff197f4f14580945e16ef2fb970b1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('01015d62c11d4ccabdc5ce146b10d8ed', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0142c29a23fb467483f14bb6f034116b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('01b8bc8fd92c4966bf06c096c62ca1d9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('02146dc5590640cdb39cead4d2b7677e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('02dc01c115384ad0835a5e5d70d657a9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0393a3d704734f499c2850917d290e1c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('03b1b208a17442aba79b5dba2f8e83f9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('03fed86b11904646a3aca37680f93a6e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('045977207b604f679c66b6b5ab6ccd2a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('049285c1d0e341c4b38ae49ae8139d5b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('04b7a9c26d1e46dd97bcbb4893cf970a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0528d0106f1141d892b52ad3cb2d5cf6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('053268874d124087983fd735742b976d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('058a465d93724a138a70dc8ca6fe2874', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('05979e0a1d2d40b18147ca2e0ce622ba', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('05b029857b0d49e7ba1b0f5f405cdb7b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('05c713f674a5438190a71ee089eef2e4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('05d551f75be7443bb0701f3d0a8bfcb9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('05e50dd59145430f8628fc9ed6ff5a64', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('060e52e82c0f4496981892f569228270', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('06bbd5fee9aa4779a34a6ab4f193b211', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('06dbd926b83046719fda1b53e393fcc1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('06f390839d4d40ef927501b0bd3aafa5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('06f977421e9c4b9fb16e16012cf9cc5f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('07ec04a36ec347a98cbb5eef3c06cd3b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('07f0d54f2b4c4d5e81e93c8b447b1779', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0813bf15592b465cad45f36f233f3589', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('08178fbf89ba4b53a0b096fe7613dcac', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('081946c1e8e44cf08f33116dfa37f80c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0848284bd8ae47ba844101968eed1f31', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('08705c7f02c3439d950745db7cb6d29f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0875659351a0401b919373c1b947d654', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('08ddb0ef1fb94e9ebb5d5623c2aa7c9d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('08f0ef15bc4f45ea9219bc7e8caac772', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('08fc774082b644ba874302a2d43417e8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('091949d3167d4a5dbdf860d9624dca74', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('09697a9820d145578911cd99a4f33ef6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0979495aac4143a6a56347b229bb9c3b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('097f666095464e4aa28647f8996b4063', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('099796b827404ea5a4cbe6cc6f7db45d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0a08af7fee8c4a45997e63023036db7e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0a3348c241424d6dbb26c43c2fb06370', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0a8728599c15476ab7841b8663691e9d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0b05bdfffed74ad6b0d099173d435b57', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0b4221d1f2d74e9d9cbb2bdf8b1c831e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0b4358bbaed845fe99e40c7df6f007cc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0b6e915822c64d61bf5aa8d36f970d01', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0b89ee0e4f9547189dff48f25e5b58ad', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0bd7977a901243bd840917bfa29fdd48', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0bfc780f066e467ebdb30e8dc24bf25b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0c64090d321342f5899854d79790e5eb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0c6f1e5a9d444874ba816e8ca1df3e59', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0cba6448c0af42958ceb38e503c49b9d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0cd26ef9932b42a5b84f51ec79d87d99', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0d0f2155d6a34c0d98686fa2dd78667c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0d35cba6dffe49efa493017ffc8b9dce', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0d6798eafafe4f0780167fc3b7546872', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0d90658a3be14d4a9ce23b5c5caa72bd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0f02288aed4343b0a7d1920b3bf322ec', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0f1559dd39294578b25938d751bf9e3e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0f3f6158febc47a5bb7c8a08a3e94821', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0f42ba7cbc8348fbab3aee2ebd12d550', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('0f4b0642b9ea41428ef4c7898acbb50c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1052567322cd4a1d8971ef43786f290c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1087838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？11', '早餐11', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('109ac50eb3b84caca55d1c4788c97fa9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('10cdf314f8da493e91efdf39ca3bee6b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('10db5065c72f48b197418092b5b7f361', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('10e8e101626a47b692a4430577158e25', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1100303b04cf46869e919c0332f42649', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1138a22df11349cd852a280558ee6511', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('115ea74994c944bf82054f3dcf52f2ab', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('11696706e85f43f3a3d785c4688a2e40', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1187838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？22', '早餐22', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('118822163ad6461790e085d0bf7762c8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('118962a116f145309d89ec14e05dbd15', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1287838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？33', '早餐2', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('12ae871ce30c497a8d4cc62a3af63ed6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1348895389b04bb9b6e5981389b5e76b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1359163236f84fe0823c3e2b6e25a748', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('13668ea2a4ac4d62ad36f9800c35b39d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1387838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？44', '早餐3', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('1387f4343ac24d0ebf15221f96545a80', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1396366a756442309b46cdef7bd6410b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('13b37c4c09ea4db39d1c11b4c9967146', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('13c7dea76e644743a0e240eac58e2769', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('14526c6025c741ab8367a0068d16fef8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1487838f24d34c5bbd33a24cd8f2c595', 'A你喜欢的歌手有哪些？', '刘德华、张学友', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('1488bd6b02254344ab553ccabb25161b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('14b50f9f29ba4f8f9a3f773a0455e688', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('14d912c2728c4598b6ec28aff0c2e6de', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('150e3d4f8d484db6be05d3926f718634', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('150f3935a8f2404799a20689f074edc1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('155295ae65564c1f9f758f55d6e6df3e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1587838f24d34c5bbd33a24cd8f2c595', 'B你喜欢的歌手有哪些？', '刘德华', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('1589730cc7824ddabfe2bb5d4cc70ff8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('15899651fad240fca7713159a91f7f03', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('15e00c1a5df0498295ac13f41a687176', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1641cddee76e454abd44e76fda56b40a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1687838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？77', '早餐6', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('17215daf0d014521834ed0b1f950e283', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('173d7de7df1548b8b0a4d5a2a8dd07cd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1787838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？88', '早餐7asd', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('1887838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？99', '早餐8', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('18f369de20104b6ba7e1b7bf705a71b4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('196933fa7440465cb7874fb28fcea3bc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1987838f24d34c5bbd33a24cd8f2c595', 'A你干哪行的？', '苦逼的程序员', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('19f0081cd7224d5e95f900dd41b35731', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1a27ce06d4d941efbb7046c5e61422c0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1a4490abc83e4b5ea34f1210667d95c7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1a892ccb47dd42879d484b49dd86bdff', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1b3d20bb92814f4cafdb89a73e3b05a7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1b7691c352324794a4102f3af0211f84', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1bb612af644f4131a42aba56469e6af2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1becfa1aa5024f03914d1eaa8efeff7f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1bfd55322edf4119a67b808dfd95a8ac', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1c1a7417fb874f2186b0a6b879be8bba', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1c44abea09d84ea19b8f712b453cb044', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1c59fd3ad08b4a18b3cd6e39b634fdea', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1c7bbe17a0d5446c9b52ae4e963489fe', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1cb6896790eb40a0bd61a237ba1e756f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1d19b6ddb71a4fab8cd1799972b5f377', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1d3f42a93ba94ed290ddce7f8398bce2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1d5c93ae5b7747fd872b48a8275a4433', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1d6c893d8f8e4218aead4ee7614dcc6b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1d7e7b1f221b47f6b317d59b417e12ab', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1d87838f24d34c5bbd33a24cd8f2c595', 'B你干哪行的？', '苦逼的程序员', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('1da87a33f3af4c4eb58901c1ff95b6a2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1df666788ce34081bc8660e8e2ea4d31', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1e019e62952c4797a42567acdd6474ad', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1e05c09c68eb41af85846ed8a3275b39', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1e0f70fb7d034a2cba4711f8afe7a5be', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1e7fa273655c4310bdaba81842648d51', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1e8df4e54b4b4863914e79b23b810ccc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1eae9a47e6014ded83b181cf078bc3d2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1ec9875eac2c416ba7402668e69828c1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1ecfd617203c42c083e55b0e1ffd38fe', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1efbf209f7cc48dab265c47f62abc7cd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1f01d6cdc77741829892a214cca9942b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1f395301ebbc45c3a599f543f39f46c5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1f406b544710435184571903e8ee702d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1f4b9c0dedb34ef58662c295a71f26cf', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('1f52e1a764674e2b885af596e8dedd2b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2015fa5dce144db29dbea422fa689a9a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('20480445ac2149ecae61dfa2827dd17b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2087838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？r', '早餐q', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('21155067af8a46ab89b7f383d3b1e135', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('216c562980da4f579fb4c61082b597d8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2175cc1a7bd44716be5ab0b90bbeb00b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2187838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？t', '早餐w', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('219a75bf4cb04d4985039a2775399241', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('221a1903c9ec4434a200d1efd2c80564', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('221a9045f1254e93b3a80d8b98838d66', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('22353434831b4899a5f0de25a14f27d8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2287838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？y', '早餐e', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('2289b34c0065474f98f34d37220bbd24', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('22bb6f6be7b84ebeb48a46107af56223', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2344645d4c494c8499098b46847c6e0c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2346217d9ad747b18ca68ce250a22b3a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2365c4dd5d744aca9ecc19287e856e56', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2370078997114eb4845f295a32e161c3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2387838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？u', '早餐r', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('24525992e512472fbda2950ad51c10bd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2472dfcf59e64e11a57f71a1d99c7f2b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2487838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？i', '早餐t', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('24a3272399414ef6b3b098c53f1816f4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('25808caf7a48456284dbdf3fff01af5c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2587838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？o', '早餐y', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('25c816a1111141a7a657351d0bf32456', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('25de807aeacb4f62a6384a27c3eb8c15', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('25f3624325c94863b566cbe4c4d19f30', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('25fc51ea3f2c42ec87f35e48a20872df', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('262d12d82f3f49ff916b918679fdb695', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2635251ba2ee41af87d96ac8ae236a38', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2687838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？p', '早餐u', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('277250f5638049138452896c3448380e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2787838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？[', '早餐i', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('2841d9ba467c4980897b2dfc5b088966', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('284c5f6793344b92ac802bc9d0829fe4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2852eb38482b4ce3896da533224df6cf', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('28716c6d05114c5d8e13d9cbae0ae28e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2887838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？]', '早餐o', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('28b5b59611a24ea0a3eaa9726b83bfe4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('28eb4547eb3448559b387010992a62b6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('292eff2840744818984707388f871f36', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('296ae3ea0421476e88dc468aa5e7f602', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2987838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？s', '早餐p', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('2aa255592b63480d81db476b6b4783da', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2abd53a60ae24d01bdd170eea91c4ac8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2ac9362830f34449a7f589ee02013627', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2ace54f78600469daf88e1ef9f2ea4e8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2b59a7e341d64977ab33ba8d8ee71ca7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2bb4158afb794c918a9671fd1be3b66d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2bfce7938fed48148fe665e2556bfdf6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2c9ff41998b742a8af3618d4879e7b34', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2ca1dfcfa6e0473a929708c23458a326', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2d783a17050c40d9995634de6f8494da', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2d7d6516b9b2428aa9661e16648e23f8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2d87838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？d', '早餐s', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('2dc3285b4bac4929ab31b48334870acd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2e285bd4163e44aaba2942ab22108caf', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2e406e869685474294696828a7c53576', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2e8447d9091246a682437f799c6d5c10', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2f885878419343cba5023ada5cf67fb9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('2fd2200d875e4a6184c6cd409400545f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('300d3a92231d484598db768dd4fd877e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3087838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？f', '早餐d', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('309bf52e7e3f47ed80f4e7412a43204c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('30c26c0a0bee47edbd1946abb86ea671', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('30cf1a379f1c49c386bae6232edbd212', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3165b6b26317433fb67192504d84ed91', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('319874054e634ca1ab727f81a3eab562', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('31a2151bcd3c407695bbfdc292b99cb6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('31b87acedeaa4c1487916a4a14c15c07', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('323424aebc774fff88135d08f2fd9578', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('326eaa07ff184ba09ada46a216d1dbef', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('32ae6e51fbef419ab8374ee3ebe4f144', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('32cb07d8d8d84f1ca813877276969136', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('32e02899c0b049b6a0bc4bbcf8d3fda0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('32e064f6eeb7448eb0d794986a056b9b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3300f64fbf3b42ce8eec8dc3506f2f4f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('331e55613d0348ab95490cbe3b360c9e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('334a1634af9e4b9498c7aabfed7ac316', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3392df1ba4b7497c8dd5485283f08b7d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('34b657bd320f4f22aea64b56e19d8f07', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('34e9d31f3043448899cc2a1e43d86325', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3586981bf616480f8a8ccae23b5a2f14', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('358fc86bc96c478ea3c718cc2ef62c14', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('35a0fd938bc0455ba02d48e31257728e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('36df4e2e1ac84d5cb7ce4bbfad9a59e2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('36f606d5e7834f90a4459d2960378017', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('370467a3ad6a4f798fc911afc170b92c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('377c047fbe8442dea112b2803c32adbc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3840b13ab3f7408a8dc78b5a637a8cd3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('38adcb39476d41358eb0468edd790018', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('39156b402a004941afac4ae99bd0f575', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3992aee2c34f4d2bb600389baf48b591', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('39e74cc9fbd74dba95e35c17fac0258a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3a27968d7da24e8d8ab8824bb6361755', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3a358b7f64824f00887c97b66f4db0cc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3a946e37a379466eaee663736fe3ca58', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3a9ff5e7098c49b098a6abe4c593d544', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3aa4dc57b8d24a14ba8f40f21046a496', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3aba56ae2b4a495099d16faa8e537c4c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3aceaf3448c74371b0ca7ffb2cfb1d88', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3add290d751f4700a4cd5d3d96fa4553', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3b52f7b2ed57419ca692655d5479e2ba', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3b5cd750158049faa44201799f03e8b1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3b7f208ac2c440aea7742ba48aad7a10', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3bbdc4e8682147d0b33ff2649c6d526c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3bd3efe185384831b5c25e636d6f7081', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3bef3ffce204460e991dd8175ed76dca', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3bef76d4ab3448e2ac61a95b8ac78563', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3bfc6e2f8c004964be552446b7868fe6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3c0a94b24dd446bd9072fb178e8a1246', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3c4f2e69a1e941309c457b3e406db372', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3c5b55ed40d2451f80ff7d58642767e3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3c84c2ee7336445c8fcbd7e9269cebb8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3c8791b149ec4cabb68ca59dd253b5ae', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3caee913a4274c03ad07de7177968b25', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3d2ecd7e29f7487b9cad04292c1dd10c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3d5540b36c114fa99c5bc596517bd3ce', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3d63685e72c54fe384146e04dea256a3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3d72c23e876e4294b65a7267d3440773', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3d87838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？g', '早餐f', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('3dd4f9d8faf645f2ada7468ed150f4e8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3e10522be5154676a586747e06dab22b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3e10cde37591452b999308df450098d5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3e62f9ded23e4195ab34611e050e8c75', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3e9adb172dea44d8a25c444856dbb1da', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3ea20f61af924787a3ddfd9b5a15a464', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3ec4bd8cf2d642338ab77f74a640f260', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3f031bbaa9c94e898949ba2eded13b51', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3f0b1cecb64e4b248f409b8fc5729faa', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3f2eec0348044080acc1fe2e2786fb75', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('3f44b36cbcc14892b108c1f045e80c3d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4016171e5c794c4dae200c730b211122', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4044079dca954d7aa1a1311dfd0d022a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('40a321f70d744df79f6045f1726d67d7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('40aebbaf035448d49d1ec4340538fbc0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('412b4feb0d684ba28f11284131832579', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4193bcf6ae64411b91b53ad4c38ac5b6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('41bf7ea91016468b860bd6004bb2e40c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('41c3006c38d3453dba81bc4ad41612ab', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('41ffcc1c895642b19f58dfcf8f5ea244', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4203bc204e084299811c6a3394d0f322', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('421833ad26f541b78923c0e0282574f3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('42786eebd49c4573ba11525ba41ed7a1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('42a51b57ebcf4a90a45b8db33d965424', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('42f7309cb0084c789027b0b8fed05c4a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('43d1e2edc3f3449e97419115fb3b6bea', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4411d41468a549249b450cd0cd3a8a22', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('44ae17a1013d497385078427e6b78a4c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('44f96102eddb4a00a3167f9fb6cfe56a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('45096a8a907641fba45e00acac5585a6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4513e283ae874addbb7317f78f5d25be', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4537b3b2d66c49608fc8f3e223128250', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4539bef8614f4461a702c3667812e336', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('457112f545ba40bda07ec47c30b5bf24', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('45a3adb1476f46adaddc903e65a7fa90', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('45d196724edd4714819532729e2558a1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4602b7df27514f478706b81755beb9ea', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('460ef7d8e35b4290905862808e500049', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4637c6fc51924433839f8030b195e20d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('463e295202c04a9ebf75fde1ddda75b6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4648be996d7d4c4ab27ac99ef0ac64fe', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4675d4e1089d40589aea09e314179479', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('46a02bea447541289fe5c5b998c43d6e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('46c80de1352d48b18b62f835669cf644', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('47059d4b722946f38b901d4f3dfd9dfc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('473170e74b4647ca928505847584e73d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4752be279c244ddaa2cfd0896c0df8fa', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('47697b16cd60428b9fa39503258813ab', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('47a7364d4bdb4a63b7c9e20757380fbd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('47c6ffc2a52e46a994725ee1aaea53ea', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('47f287563693404880846cc4525648b7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('482940835d13491d85342e7c95bccd58', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('48db80e33bc74bb5a8cb6d4b21101c65', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('493fff4661be424889072eb6bbf35e06', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('49a539377921426481c31b2318c73a34', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4a6a518044bd4a329acf3cc03c353e2d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4a6f019b316941dc820d975b289f1a79', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4a873b8c584d4724b3d1877d6380cd9f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4b3c359d953940eba03c689f287ddae0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4bd82176c0be4ab29be342b6d6029435', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4be0debb129c43549087248fd247a044', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4c3a3a8d7f9b41afb5e1cdc9c630d402', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4c4297b620f84ca0ae08dd232f66e1ce', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4ca3507addad4bb2be6deac19e924b84', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4ce965617c0b4d84a6f6538d9d98895a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4cf44a1094704f748a5fb9a1875e5786', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4d13a86f387d4375ad2609c0e34c4c18', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4d7e7b6f74c04f7fa8674202caa4227a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4d87838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？h', '早餐g', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('4d8ecd8473594391aae4c00f00591438', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4daefc69c1fc4e129a0e3f49e98ade5f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4e7bb5242e1d4b0782a8838ae451f3bd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4e8e46322d014a1483c25409c8495854', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4e945540ec1f43a8a4616e0b5c05d61b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4f183b63ccdb433098bbdaaad10899d1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4f9d0c7722104d0abb9cd47bde46ec5f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4fbc4c6c0c3240e1961479bd54db3d2c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('4fbcccbe4db84754953c6ff64220e356', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('502849420484457fb7df9b96bd889d62', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('506a331439e64d279841a0ca3e587955', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('50c212049a58497395485c18a859d077', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5134f53faf8845bf917091ff0d0d94bb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('51bdcad000884aba850b2cfaf926f3ca', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5251a5c60c804764b135e1db6fe66d8c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('52c0ee7646d34e9c82d091c7204e341e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('52dd192ad2e341439edd62e6909a5ce6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('53be0f04e44f41f28d0d7670c6edb9ef', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('53f3ab5890ea445683d5cbd1232cb468', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('53fda759983a4050b18e3991d17e950f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('543a166d8ddf40ed8f40be713882a738', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('54a80b474b8f4932bdb052a7160cb15f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5539a51b78f74a658357812d40527246', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5584649d237942c8939a90439919339c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('55a29fbc027143848b60905bf71d5b6d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('55a39acc1bf648029746bdd406c28fd4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('55dead16d29145ce9aa777eeb4ecc298', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('563ed136a06a433988999edfb3946bbb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5656e2359dd742dc833279ab45f2a847', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('565c8c07b30a433ea77f4a5e7b6a7182', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('567c7eb8af1144dd88ca4d9b99bcc0b7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('569a93cb58e5473a98d1ebe6ddde67fa', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('56a19d5ecd7d46f9a108a7cdc9f1d92a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('56ee81b68099479aba21eccce88c6c73', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('574581eed77444d7b9bc779e2140a0fb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('57dce2349a1b41c0b32c197b7b904bd2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('583d3b230a7e4b4e9ff2d74a024331cf', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('584346aba3e143999c44e2664e52f00f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('584cea2fa9e1443db277a252134dfece', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5876fb2d59fd4c81a139542c9f713e21', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('589c4018079e44acb41fc23fbe2f0997', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('58e353e319d5429d9076934dc0be697e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('59496dff75b04ad8b7de3544bd0c112a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('596727ccf8be482a948ef790d7e7f1bd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('599e59fa1477443abc6c9bf8981f0d16', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('59ab24f479e84bd68fccd1cacb6ca16f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5a1e1f865eff4f25ac3f943f15846cef', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5ab3aa4107194e9b9543ac0d6f8732d5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5ad893b2131e411ab1e51d23041de501', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5af3ee4f820b48d998985bf8fb396b3a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5afc72b1edac442d93c9ca8258840f26', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5b1b5b333dbc413e89eed013bc45fc7e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5b5d957b7d8e40deafa6a16965e5edfb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5b627305a3be4a998ebe7500d433ce0c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5bec146dbe114f6bb845d3d8d5545bbb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5c03a9daa6e043709be4ec69e824515d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5c3ab1d56d744eefa00ef38663585c96', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5c99d32307194254bce9e528fcb9d763', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5cba652ec6e0450592d155ade6a037cc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5ce5e86d21a64cd899b8e42d20b1c3cb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5d1694b0c9f34271aca0994224450985', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5d5df72730ba48f1903bd1f4f18bc95f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5d5fba3e59574baeaf2193b5c37fbed3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5d87838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？j', '早餐h', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('5dbed91403eb47e490767d3888404ffb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5dd7b5174eb04af28e1b7086e3af2671', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5e664a33b1c74c7085b32af90a55498c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5ec8c419f87144aa8e290a255dad147f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5f1538a4d57640348eeee7e50343a759', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5fe12c0a38ba4f4a84c968353d93e8ec', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5ff3e6f1ba9b47969a9a88012e2ba4c7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('5fffc181622c4fdc9f8700644854e0ce', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('605953a4389a4edcabb325b609606382', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('607a98aaea2e44c5b2b6cc2dd4ff1b13', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('608333647c064bd396a097e27910242b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('60fe4d01e5cb494fa00e31e3f64b36d2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('61133c09852c4758b04df9d46cad14b1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('611d5265e2044e129fbeb26062eea71a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('616618bd200a4bf5832eccb340e9bb3d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('619494f0d87546d39cb579a21b805c9d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('620c3c5e4756407d82f7ffbf747ce3c4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6292832b6aff4b30a10930b879d5c004', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('62c3614376d944a0a8f55ebb4e234954', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('62cfb93aaa53417db20326040b857666', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('62d6c9dbbf854c52902f62837cef0ad8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('63043638811e489590bc5c649a4871e2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6399df54a574413d98ebf7b46edd6b46', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('63d0b4a4da23409a804bf48ea545a80a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('63fff82aa13b406d8983bef90fe5eb7c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('641112be438e4423b9689d3cbe0914f7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('64adfe7ef20a4f3bbf9753a7840246d3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('64e939b65c31475ba9658da9d3ca69b9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6503045d36a44d1a84991c7826ac8184', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6518f4f7a66543a2bd1e0604c156dd95', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6526bd0974d94f4da91db14187ae8a1c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('65c31984a51d44d8851ac5e15e3f77b1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6627522f95764d40a8ed3e9a98936dfa', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('66421640d0e1462199644b805b335a8b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('665f453bd89c4320ba1a2f78d6bcfd69', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('670030781c03452494b250081f495b00', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('672a09c183194c94b2a5a96c9ff0a75e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('679bceea670f479d86f6bb03b6efd885', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('67a53ce792d94d7ca4e5edea136fa259', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('67aabd1a9f724a93ac3fb6b52e0e4afb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('682404d3e9ef4a5891eeeccb8c01aed7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6832048076d04d07bf809f6e7689ef22', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('68595a46364b4421a906718abaf0c7b9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('688ac845504b4e638bb50318df18d490', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('68b0fa5407f14b229e2423b239701f7e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('69601faebacf4a48acc8aeaa219221df', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6980db5d59e749f08593d682efb402d3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('69e791f3483a435d89e8bb60cfa17a85', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6a481f47f5b64166b6e7c3815b6363e2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6a841882535340a29584a10871c7130f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6ae35b5112f54adf85c27df4fc7ef758', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6b293d518d8042508273814088ef7afd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6b2fc65a59dd4d0ea3fbee11f767f218', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6bba59b828174a99a83a6d03fb9809f9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6beda1c3c24245b99491aa4838281d3a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6c400c32e39446eea06615533e1de727', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6cd4ad4cea5241358a8eb1964a3983fb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6d35a8ac06bf495d87d1db24459a3bde', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6d3a0978434f401799c42545daf369db', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6d442f4ccda7410bbde1c68575ebf77d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6d87838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？k', '早餐j', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('6dfea044685e41bca7ecd0778a9ded8d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6e038dc6f2c04612891b56c500fc1bdb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6e6c43cfaf6f4be8ad44aa2710197c5b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6ef62c013c3f49f18a382e0f39fb3b3c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6ef7630146724033bd4e0b2e3c58d9c5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6f0892ed6b984acd91369a8213a762f0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6f201632d61b49e599915f5522628e7b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6f4dcabf68364accb2f4e9a4af8ecb0f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('6f69ea115e864cdf8cadc9917bdd4aa3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7009de8b1ca4411380e0ffab529562b3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('70318dcb682b4ed9a2b0242baf16f8e9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('70683d067e65423b97266558fc5b9f3e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('70c38af159834a7a9f95db2bfc70ad0c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('70d8066a00af410cbafd6495c6825def', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('72304b6cc3c348f8ad9b15d033d5f1e4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('72600bf71f1f4f62b6b10f896b955ddc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('72910d56c82647cb82c219862e23a161', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('72bc1b5b567b479cb8f1e25503289d79', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('72ee1d0c867346da955ceef8176c5170', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7327b346f18c45c6af85e7be67d187af', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('732d9c69e0e44dd0a508a0e8c8d9bc18', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7345091293b7452d8ddcb5d0d6c1c064', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('734f6c38599d4a7d8e09fa5c7246c1bd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7359fcd8914840a3a3759a8bd241d51c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('736ea76367084c13a736ca3e1b9d3e73', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('73fdabe2e12e4057ae395beb7ab74953', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('74117c5a7f2d4ce18c7ca2735e4be818', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('743f695a86fe49a1882848fc3ae0d456', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7450079da4a449c689e185e88752b09d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7473bdc0a1e848cbbf491eabb5894346', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('74b5a706a0174d98a4147a598bbfabb4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('74dff8395cd14f0ea9ad2a90e43893b5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('74e7f072b89843828f670d4f7c8ee2af', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('74ffef0b55d843efb5b319c94008bb5f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7503eccef9d246dda930150b8c2c0e1e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('75060cccd2fc4919af1345fb38f4c44e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7525b0c2203c404191471a2e81017d8c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7556b20d624c47f88e06d75425f6ec61', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7563feb26057457f99fae3afe0139abf', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('757c320ae47148d4a7deccee4c2e3e30', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('75a7dd778fce48d7bf167e306d8e97e9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7633f45f10a04000aad4a215809b483f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('76462b074f3d4b35bf551bec77b0300b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('76737512c39741eb86012ae3592ee462', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('76d94ca324ac4c7eb3111b54592f8a97', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7733424044a643f48c886b0483950aa9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('778238397c674ce0a55b9fa05ee0ed77', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('77ae8256a68449f6ae0cc44ae3563a23', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('78104ab23007436893fa0444f89dfc91', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('785407f42d144f98aba4756911d04fab', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7894002f48cf406dbfc62f18be308891', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('78c4534255fe4e7a99c58e636d47cb06', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('790238fbd62a49c6871d76f6f5feb967', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7908a268e68b40f7bde5dbddf0a2e0ea', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7948b27e3df94caf809c92f8aa2e56ae', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('79504f88912f4ab19111a7a2704775c5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('79a3e3cfd2bc47368c492664f8716d3a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('79b17f9b41724816a2946ee3eda81fb6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7a0ddce0adc94bf79ef2f13320cf5b29', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7a575f3d182a4a3087c1fa61419eb45a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7a74c4c7f2004ae89e68ee30c5f7aa2d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7b0052b0250b4e1e91d712004c1252c5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7b26e1104da2436589b7bd0f12531fa0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7b8ce763154049e4bfee0bca2ac3f096', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7b907773e7f64703944dfeb0f318d816', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7bd4c3a577914e77a0035206658627cb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7bf0173f52e4440e86aa65493f8ac0d7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7cb45aaa594f4a98bce5f6390091d27d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7ccae45217ec4ce4811a4988886a35a7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7d457f10128a4ae5930cbfdba9b37a9e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7d6474738e8947f1bd00b9eac2620f29', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7d87838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？l', '早餐k', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('7dc04741f0f74294a2e35b654b2ecc45', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7dc1d35940c547c4bd82740680e6c0e1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7e03db1c3b7b46c6966b14d55cead63c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7e0dac5574914831b188a79cc75ec009', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7e377388384f4c168519ed576a2b0557', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7e40285d5511469d819d4796d3699d32', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7e6d9f8803524b1f8ec722b20f7ebe7e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7eb3015200254c758839a0b0b99b31f3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7ed578eeed7f4345b55014a82219d012', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7ee9ceb3be7e4fcd9032f398014044a9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7f1fa06619c7494188873af2439f825a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7f725d040b3e46ec8cb58210b9727a17', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('7ff1778fb55e43edbfd578fd19a3abb3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8069b2746e7f4ebd875dcce47646f13a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('80b69ea4113a4747a417a98e2d123e00', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('80e17c242def49c295e3c276f9baeaf2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8105abc36cb7420a919dcc69a03bdf3f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('819577897e59432fb74de8e56a200aad', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('81ac9549e4504f6ba107cbd6818d0dda', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('81f3adced7e94a15907928317cecd855', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('82414c05528a46a1ab79fa4c6cb7bc51', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('827e451d18e148d8b01ddd40d840c105', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('83193f39d41d4a25afbba4ca1bda1afb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8373d14dbfe54484879821a37eeec7b5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8401b5fa358f426b9bfe5071d0e063bc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('848b0c9eec3f442ba253be91dec72e0d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('84a87b02d3f64289b2201c078da04152', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('84b414c57a984712bd02c5c0069a1167', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('84e6a140472d4f279132d78ef5ee540c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8507e86e77554d5ab4f8c89e78452ff6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8517ee7761644b35be0d8e461a69eecf', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('86058582120a49fbb2f97aa9a01f49c9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8612246271a94dc7b51faa36dea687b0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8649480bd1b84ec59933aa04d228f022', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('86de2d9cd6a14c10a14598dcb71a0e74', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('870e9b2aefa84de4a672948de2a72b7b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('872f2c65a33b48bb9ae15c79635e6551', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('878bbd5470ab4a99b241ce56cc607c23', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('87b10391e5824895b30f091501bc4e5a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('87e93b20a54741b5abb1ee1310e98ff9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8803cd9ad2964cb0b4baee9b9d0b7d74', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('88128a4e2e244710b2107dfe51b4f12d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('88644915d1024fa4b4434bf0d6ec731c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('89280d70a48b4accabd8f1c0f7bd7b7a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8962984356ee44a7a7d4511e5bceb01e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('89721520c32341f59a7d145d57191ad1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8a10941306cf46a28c924e95dd00a816', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8a8f3f5f66bd4bd6beeaa66daf349597', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8a9d14c2654b4982815382c8e772f14f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8aaeed859a374ab591cfe58a810089fc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8af5c13075474e188a08988fb251e803', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8aff3af29d44435da20dc5cce15461dd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8b07e03520a54962a650a6ae4ce2f66f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8b09409551cc462f947a229054219410', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8b2cd3123151475c95eb8623691fa16c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8bb0d743436d4085a35d7e7e6dd3dfe0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8beeb0b3bf8a4ccda65b1d5a0f0af248', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8c5856682a884b81abe21ffb7aabdb88', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8c781a7234a245219b119524deed9d09', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8cecf9f56b0a43b3a3d139df2b9c2065', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8d64cd8880c84e929bbd294bdb1eef32', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8d64e0180f954ccd93bf98aae51dd7fb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8d765e50bced4314bc86a37bbc8d38da', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8d7a9df891c545c9a44ddc3b700fb601', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8d87838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？;', '早餐l', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('8e23750ebd214fb9b7e62b96b25fe495', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8e29b96cce3141eb8ef5567b392c42c5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8f053679e19d4b6e81c4dca75b6c266c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8f542f2c165348878a9b1e55245b3557', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8f82e7b2625543b2baee6fc0d6296888', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8f8a298a953644148024278ab091ed4b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8f92378fd5544615badb79419c61275e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8fce9aa600ea45d1b2d757102aa275b7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('8fe797607c7a46a8ae225470a988b7b2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9005a528fec54b02b437bdf8012c956d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('902708e98a5641978767a0f7897c0fc0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('90275be941c9400984a7cdcfdc09b015', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9037a9a5356040648869b9b6241b6182', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('906706df705c40e5a4826838286349f7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9076a687baa5498cae84b36a8737268f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('90c87f233c154daeb34d37c54d3830e7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('91a5da184e9c4096b13483d0a50f6b7e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('91c2b6c64eaf459a83c9756f41c25a05', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('91e81aa7331d4636b3a5eaa13a2ba60b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('91efe11ab0654909b5a33b2a49ee3952', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('922b09468bf948be8917c08e6909ef2a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('923bbf44d5974068abe3a9f123281c5e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('928a760820ea464ca6b57e0c792d3d56', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('932536afbd0f4ddeae23f399fa5f5bdc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('932ff9aea9484580a973c30e5ca6359b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('935ede1ed8c24c78b0bbfe53f891a5cd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('93957e7b66ce485483de05dd8e84d998', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9446e00f98ff4d6f909311f1862eeea9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('945a2ea2c4064bacbc6bcb4020e09b69', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9481d58b0c5e42fbb8c4645a86687e3f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('94a751a7dabd452795553f43f7eec2fc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('94d1907d5b7c4a04872191e8734b0a4d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('94deb02758ca42deb53e5e302753251e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9501e704b1434413855f8f62091d8c84', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('957464976a6e4b21a68a06e8c0348218', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('964d4f93897c4717a150f1ca9a0a54e1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('96800a1aa6b348288898aa59b894dc60', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('969330f702bc4d8eaef379661bb67289', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('96e191e7fad04ad4b4f5016f364584da', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('97d28657dc97434db29ffa75eb1be0c7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('97e509dfa2fa4936bb06b8c569bd4982', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('980c2a0cbb384c0290d514b54d7b3ca0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9817ea0821a1441eb151e2445bcefcc8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9879fd5532e64f43b73210174ee67c8b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('98967d6343fd46cbb0c4fc70499a97d6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9931ab44cde843e487d11373cef54b64', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9972de45ebf343a4a7739762705b5a5a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('999ced11e2f6453f9dc06fce0c7ac16b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('99f93f1d3ba34266913f09337aa583f6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9a081fb4b1004760a5df779c8949c92e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9a14841f1c814b0f9041e618c4d5985b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9a4d9ec5a09d47ea86606d1bf50bb92d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9a55f935c70744f09ef7daec50e6fa2f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9a63d528e1b743d69cb5824361754385', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9b1fd40d851e4257bdabb83b45c7ab31', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9b88598d872d4847a4e3839cc89d60ec', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9d3add44a78d4138bf73b58f41f94c35', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9d41c5216be54a03b3d24920d439da0c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9d4add6f5fda43c8a3c019e5062ede64', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9d54f6a1af9d4c97bcbc563698171c51', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9d689e9308f04e098f8266964d113a9d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9d87838f24d34c5bbd33a24cd8f2c595', '今天早餐吃的什么呢？m', '早餐bb', 0xE4BB8AE5A4A9E697A9E9A490E59083E79A84E783ADE5B9B2E99DA2);
INSERT INTO `wx_keyword` VALUES ('9d8df6d0a4f5448fa71d34755d1416f2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9dd437977b38403da60f1ab9c817148e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9def456eb3364a0984371462d03c4520', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9e0c5c021ee4408d95ff0215397fa073', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9e280799483049f6ae90598faed3b76a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9e5e976aa21344d0b333ba5e79e864bd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9eb0fad1af624252af7545b391b7884c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9f5a6e2abf0b4ae7a26f7e29c949c97c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9fb1ef20e34a422bbb690ecf763312ea', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('9feab700e8be4106a2d3ce2fb44d50d1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a036339ea7c6412aaf3173d0c91ce85e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a04b5849519f4b95bd547b77a84be693', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a074a3ee14974f77aafd9d5cbd2b655e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a081ef6ee770413ead3feb054a62c38c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a0df3e88f55e4a76aa759fbb64e1a411', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a11973847e1942d1bcde95be9c7c928a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a17e36e00ec74a838ac4c95a7ac10166', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a253f8d23f774764be7fbbddeba460a1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a2586ea874d241afb9f3e1c7c701c096', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a286dc8eac0b40b88c2284dd621dffd7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a2c96a3addaa4f178cb6dcc3f2e61d6b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a317f741ac0f4e6ba9443628161216cf', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a358ee2a222b4d1697b40fe7b3a1b0a7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a3b81a872ca84224b78cbce1303edb54', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a3f9c7cd76124c3596bee7d7b7d7db30', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a431365f83f541ef839f9e436d1d48ef', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a44648cd94404d9a9abc239162a3b865', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a49c25ea382a4238ba7afb67e4f3a993', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a4a75f5c84214da99c7705a3f8f28b17', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a51d70e3400f406499243217684d65e2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a53cd926636f4b3085ec4148edeb6dea', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a56c2cccef314b2fa066a117cd213df4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a5bdf4df369a47f0a367a47825bb3a39', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a6213d77013641df8d013bdae8ab7692', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a68c958e07444ae4b25471e0035908c6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a767e7eab32742fba540ae53c442cc60', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a79427501f444a828c96ece6216b349d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a7db6e0990df4c09823bd854ad67998a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a887e9e1fdf843cc95b15ed6596f03cb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a8add76044144f8882f8a5c6b129289c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a8cd04ac6061477e9bec1b9b49fcc1ac', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a91385c4bf65450681a03ca98c7ec5a6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a91941770c5746069ae071257fc678ab', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a980e3aaecb741c2acfce829ef40a706', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a9890bd91e414dd7b3491410cc954cf7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a9dc3edfa54b47fdbd4a514dcad2a6b5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a9e185abc8de4d2a8f14c66ceff0e0e3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('a9ee8b8d93e74ffab0ec7e6f68ce999b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('aa02b5bb70a14bdb9a2524f21af4918d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('aa3499b2cf5b47b1bfc749d5a860343b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('aa89744875e14fa6962ae40395e4fd2a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('aab33c26076e44bab6916718680c0066', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('aaba72cfe97044558fdd18774e72cdb0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ab1d0966e8ed43b69e4b8384a3286f3c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ab3f0920c4c044de97d657fca82916df', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ab58975314614029aa799aad51965f90', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ab6cc3ede5e446f2a5420612bc1e2fac', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ac014b3b5f7b490280bed61a51d6f627', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ac60a2679f14431f8a254fdeb70d0306', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('acb68971f45b4babadc79e4bdf2450a8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ad85936b86774cf5b4458b705431a505', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('adc6e9ad65b84360873406480d979e9a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('adca6118aaca41d692255e6318d0f840', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ae8735b60f61432488caa6ac65b9fe51', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ae889671ee6043d1aec5ac0bbf421b03', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('af5e32dd74214c399f4c2967e4fec112', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('afd9157b4f214cc8b2e338ee04b3b378', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b124e487c733440ebcddffc77013aee8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b19562c0cf924ef1a906c6b38b1198de', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b1a8d0dc262740c8a8a3f5a57f2df02d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b1afc19e0468475f84ae9c62186403a8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b1d13216db12416b9e9f11c919166c6c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b1f8181b669f4087b1d0fd41bf08957c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b259cef36cf849ae93139fdc9c253e55', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b339e135992f4d3ea55f8d744c84286e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b36949c2d25d4997ae8f5061b0ecd65b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b394a1e6bbfb434ab7db8e71828437df', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b3c20610a3154c85af1cc1570cb5d2bc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b3d30b659bde4699a3a87dfac05a830e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b413389e2c9b4b9bbebe0daf6aec0af0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b4202748731d44b896bde934aef7a2ee', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b4675572c1554937b0111747b0976de6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b4f3b6594a6a4413b5aab20862e001d6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b50c4c562fc940ad8b0c283b491ad746', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b543d6e7e4364b639f5cf5222d7cdd77', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b590c75310ac486fab57b3d87bfa1fba', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b5ae2ce4651549c1a0e84adb71a54471', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b69d4e990859420297f1c86169c8fca8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b6be68533fcf4fd080a89100941f02a6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b6e1124f15f943f9b0338fec818ab9e9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b6fb940fdb1c4cbc8b3380c55a558c47', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b904081fe0c7497d9f2c253315109c13', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b99561b1419347329fd54932b9d8afc0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b99d0e2750dd434ba62fada1b2e6b424', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('b9c1ff0b6e024cdc984a1cda7f42965d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ba0be0603b4c4cbdb3dd9b78188a0983', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ba2fbc5fa775412d8657a3ccb4b83adb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ba37b7de34e54b6bae2c92815b3c641c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ba380c4ac44a4ed9ba8864b156e2fb24', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ba816f3fc4074bc3b41ebd5f9c3ec37b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bafd088358a546f48b3264e5781c6dbf', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bb2968879be64400b21329230630cc38', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bb2ee49538684c6885dc7831a3ba1095', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bb79d72c31ab4664b941a9e5be9a6b12', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bb9c46038d3a47fb977455f966e44dfb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bc30fcd1b4594161991047411d36ab65', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bc3992ca4ab843d2bbe366da819d2412', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bc84e93120344595a384f85f1d4f4650', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bc9279eb3d144752aa589de595f9c46a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bc948dc966344fdd885b3d95c0b9e361', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bc9c69cb5ac04268a82fc2619530680b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bcc4d805ea07420691e3afcb82c9ff60', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bcd6a0bba3a840369b04bd06105bdfe3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bd801a3e97574b1eaf831af68b51fb8a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bd970afbf7404e789ccdafc7ed5bf7c8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bdb7413064924d2cbc6d7f7e054cfa40', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bdd17fe385344660ba21d8fc39d13885', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bdfae6ddf7bf45889a3deaec0b1b7bcf', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('be018486ed394d2d9a6570669864bb6d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('be062a8bb1c34b8d9773801b64cc2d9d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('be10b1c7574442809965a1e746fa3e9b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('be32e34ea456480dad580ecbe3781efa', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('be41fdcb55cc4a4b9aa0a9a72a9637b8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('be6fd692c77b4a0e8b9241dd782b6325', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bebbbd2243ea4dab96cdb6b2a8bc9b70', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('becc2db6bf6347e395f15854161c6664', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('befc38667f4840a4859c58028fe0bc7c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bf27dc576ad04fe58287e08f3087adb9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bf76892f9d314a6ab7fcb5488f92fa27', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('bf9b013a049640699b06973ddbe430e8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c0a3f68ca3c64bfd9da8757e552bbf3a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c0a80e2a7d4b4a07af36779a110d6dfb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c0df77a46a7a45e2b7ca50b260a98068', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c162b643252445fc92be76b6da67211a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c2380e6a8d6e4b00a8887697e133083d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c2a643f977f84a05b895fc3bc6e0743e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c2aa68e7fa72420e9e4717c89e7c037f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c2f036d54c6043e9b2902251db4b6336', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c30604c6c88142cfb25784195a17899d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c30f57f6bced41d78e0bb2df8499e598', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c3189e89374e4ffda93d8783dd3de15c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c34291916a854ca8ac3dfbc4f473e822', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c35d8740cf044aa0bc154a54652ca238', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c381a93de20c457591337cb9f87eefde', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c38e843ef83945b69576f2ecc9388129', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c3f312da1b3c458d85dd794565850ff9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c43ec9eacab14d28afe77c72fdace691', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c47e5ffad2e54d358f05bd69a4f06d00', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c4806212929b4ce38be921da65960bbc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c4ee4ab6f37b465c84d6a9b397e49afa', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c4f24f0ad54049cf9789a4998c9ecc9f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c513242c840442d1867759fa09f4c614', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c53df815323a49818c5f9518956cd7e2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c56fe825416f40439eaf61b464e0a89b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c5a1c6e53afa41198f97f7b0563cc2d5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c5bfa58fe6f448089e9f218c32bafd20', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c603d33b088d400d8f660291765f990b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c63d3c8fff4a473aabde32cd3008ebf0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c68dd940c03f42c6a369066fcf64e0ca', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c74d3a0a59d84206a24d634f66d0d33b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c74fa8b74dab4ac0b5525ca8566ad58c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c79dfc31f2804a3c90697b2541a59d92', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c7f1c48948404045a39abe6174cfee79', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c7fb52f31b184cd8b6b51596cd09f966', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c7fe4a99e1f4447bab106ec95d7479b2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c825e7de1eb043649a846fb50c095848', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('c96bfc58690d45099da8b938cfe1450a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ca58521dca6240ceb2d1463dd2f91f81', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cabd4c9b730a45319ca798e1b17be33c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cad153ef769c4dc4921b00653fb40865', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cadf7c2c4ef84705bb1f8912d9acf82e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cae72668b6584650ab524d5e529ce116', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cb326a37add74dbba179f8d36a578ecb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cb32ef1ac1274d4d8a5e1b540ee0ea00', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cb8ac486dc3c4eac8b7a631b36f31c43', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cb929503f8644a53b2b028d5fab1c183', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cb9cfc869dae4b1db5426cb6663f7aa8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cbd3f2c5ab224207b02c7ac1d1fcdf3d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cbebabad5a54453bab890361c08ae76f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cbebf72acb214d06a3866af7b800ab69', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cc00a0dca9d54e0fa91854e267a3b737', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cc0aa20d41e841c497dcffc1f56d6cf6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cc3ec7e1219c475dbe461dfd5f55c081', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cc8dfba4606a4785a6906db0d0d1ec98', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cd2776b30e4c4431844aef38107122ca', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cd37763d0b9347858bb9d10ce7545351', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cd5507dab44d4b989114d21ef44c0952', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cd6dcf1e39304ac5aeb48fd696049ef9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cd9479ce41f5408bb4a41dd4e8a60340', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cd9c301ab2dc446db8adbdb3f016147e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cdfcc33e804a45e085649eb6e8e4f64e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ce45680e8613497a9df5d00858abd3fb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ce5eb9fe1b214ad58b9db19e287ff451', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ce6f711820154fc09e8a0926c2f3a769', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cf1b12d2e89e42eca8ac5946306a8312', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cf2ae065a92549e9a69773d069c59f5e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cf5a7e948b6e42ce9a95219540c0f91a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('cff8d4b828ff477194b1b5e61b84578c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d090ed86460949a1b090bd6014c2c649', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d12c682e5b30402bbd18c56a3fe607e4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d14b298903fe4e2c83e8461a5923afc7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d17685123f13492b802f4ae13593ff89', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d1dbc4b24d894c708fc681db92077ef3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d2644d9da1b24dc1abf310048e242fce', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d28be811bbf2493ca087df4751d08cd1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d2b64c6b1ff94cc39a46dd62c659e29e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d2c822a97b5948ee932efe8b36be826b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d30be9b2247643f5966f8d741a73e29d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d337d98a808246929212323694a6d2c0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d3453ae8bd0e4a1e9564df03b8ce779a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d34d46f1dbce448a9925e15c0bc4a765', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d3711b00188644aca3bf2803061f5952', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d3e120847c1c4b98be465cb8f9254885', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d416be1aa373421cbe759e8997a321af', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d4c4043aa46b4b17b98833b6dbb297ae', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d53a18d3323a4717aba61b5d02239b8a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d5699100e8c244169f64eb3bca84839b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d65da6a86ce34445a82fc285e0557d42', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d6610a709c2647b9a16603d8fbca2b6a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d67e1dd378724f7097c4829235a75fa1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d6a097a091554710b13bd909b69d644f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d6ed1d71efd14b7585f5b160ea81bdb1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d6f182f29ac14c2ba06c32f3a181152b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d7330e02b8f44e218ae7e50adbdc298f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d74595971c1b45dba38e51589844e3f2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d7b5ed9519a649888dc7441affbb9aa4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d7eb206e87fc485c87817875ca4628a7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d855f2fdf0d444bcab88ae7c76e5e269', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d890452b78d7457fb1a77ff2b361a3b0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d8b70ed496de418b87961de8c7625c87', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d97148f35e38459b9ff93fd625927049', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d9bdd291cb034847a9986d2c3e9d23a5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('da00f24e6c124a94bab637ac21765a86', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('da063da2b4b34da58c8dc59b0467732a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('da3e7153b8b746d4a055fda2b203e3ec', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('da6206d171424c1cb9106f794f876439', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('da705ef8fbf14f3da9a8ea859f2a38df', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('da71e4647e4b4ea7ab3089ede5e20939', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dabe601e37534d5884e65e4e6d3bcc82', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('db37455e427c40988db38ff8fb6a3b9a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('db7e87ebd98f42bebfdc44e34066e92b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('db83b22d14984032b310d339a0195de0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dc07ebc743bc43129add337499f2e8c3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dcff6f966ceb4a9a8fd3ded892b8f08a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dd31c985b3354d4aa76ec75183ebd132', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dd79465b1c894c43acccc26df0a54dd8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dd99825358af4b5f96e94ce38e7df493', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dda24a8c978b4e418acdea1c343a77d8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ddbeb51100e9414faf63728a2f26b03f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('df06d6716bdc48799b83222c3777617c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('df9d9f2b1aa0436f9b7b1e491c7d70d1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dfabd8f8de8c451dbe13fe4534d22c35', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e02988aad8c948f580225bc86a70cc44', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e02c3fe6f65c4936ab55a7bc0321f75d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e0a94a9aac89468b80860d4b1db0e061', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e0f0e0688f114ac48a41a7e618095bde', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e100eccfa3df4ff8971081453d8e42da', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e1b0970cba0148efb835cf6d5dab16e9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e1d04c68a99743c1aaee8d521867f3a6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e1f83f3a124d40aeb784a6d079e5f0f8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e28b39ad00fe4b15a38c3f0f8446e36c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e2c31abaac6e436889e39b92405226f5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e3441e6a536e42129aab802f82c83586', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e37049c6a55440d5ad78b25bca7c98bc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e3c5c5cf2ea74a17bdf3ab5326d2df65', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e3fee26fd07148af972319d900116275', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e483bd8f1cfe4575a51424b60604551d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e487af1934ab485ea73efd3432edec22', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e5107ceecc13451aab7513e7440fc81b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e510f6f80f2249f0a30b07087cf4a524', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e519bf20629c4b2e9396b41b9e0fbd2a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e52213a796374a92af4f26028f9f2821', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e53d2a0b3fbe4bafab0e0a62d00f0f99', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e5419c09ce6b4bb69355472ee0107719', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e5540a9322e94290a14ff35bd41a91e6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e59ea1faba9a42df9a0a1a8d9a8d5abb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e5bb73e6b78d4a1fb8f57aae0025a689', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e61dcf696f424fbc883680d1dc8e4d87', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e65d772aa97c478e8f93496046359106', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e6a900a026144b27a34def7ac445ed03', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e73fd1662a004b8aaa1ee019309300f7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e7882d46aca246a6ab7e5e4d415aa46e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e7917b8915a24b7496c9203bf25f5a74', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e7c5e7f91182490cbd08f7254a0beb79', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e857c1002d5a478b9e7f8d3ed50acc90', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e8d491c173204ba2be5305b088952b30', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e8e28a3db85941fe9ae81371528d4ea9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e9a9c5bf29444afa86268761a8c6b75b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ea744953bc864c699e23cc35e44f49dc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eb2a74f0128040e8a9deae68b3a08143', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eb3a0677f01a4d64a5c7aeff36891b66', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eb46a72755bd42fb87fb35302d2e8600', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ebc376e4efb64542aea064bb8d26058d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ebf21a2181274f91a614c7ab463e5279', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ec224b7f8a9042768fbf2c36f80827f8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ec3378ffb4f4490cbcfb672d9f233d22', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ed02778193a247a78ab6104e33d93b42', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ed3b9f107c1e4800b2ae041f40437f49', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ed3e8a3f49c14fceb286eff379772070', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('edebee21f31347f7946475594f7f028a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ee27b1c484b440afb3b54323b07520a5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eea5b5d84d324ac5ba7b38e863da22c5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eef534bd6e3a4bbbb131a36d45a49387', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ef30a14ddd9e4c3fa2d83f560d116430', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ef4fbcf7149743ceb57375840088880c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ef5ad6af1bdb4f878b6cd31359893df2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ef6b828fb8a24dd9b16def784010b398', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ef761483a9bd4d049432189e9650ce75', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ef817f1c0f0144988ac7424452142a9e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('efb345897ff84ab3baa54c0151dff722', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('efb8644f1daa473691ee6a539c254def', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eff162ffdcca47d3a19f4273ba33111a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f0022c24b050494bb093eb67401cd106', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f06076ac18dd4330b8c19aadce8f1b08', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f0ba7a93bdfd4f1099731e2eaeec936e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f136f3c3a1834d9db752bb403e09171b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f186a3f45b564e4d8611e3d8c011876f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f1bea73f381144cc89a54ffbe6487522', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f21730ba660a4bb5b944dbd86ecbdafe', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f246ffec7ab341e5a0f1ac7a2d0afe6d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f2857415c5de4136ab19e8dd9b407ddb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f2ae270b10e9454daad48708156b692c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f2ec0d6b820548008764770a387b1907', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f300cf2a4fe14b6492b4e25de8fa060f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f311f8e97a63415f96b5d47928159f72', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f4325bed7e6a4efaadd2697f41d51b69', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f4357b41dbee4369bd71cbff570ddd8c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f439a31af92b4c38b8466bd1153ab326', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f4f0f39f68614c3d95a62ae93ced4e3b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f595d1c238a245d69bf1e198f5d09d41', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f5d4394d7006425f85446c0dda7e5f68', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f6103bf7cb174139ad9907a4fef53954', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f61eeb730dde43e085c6545b3654410a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f6277b35244a4b82be9a68c39487a163', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f6306f5238094b64b22e15d0da03450a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f63d4240ded54bce9f248413ee380049', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f66aa3063c7d4bfa8a1a87018c65843f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f6978a793c9a413f8af32a02e366602d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f783463bdff54e668da9670dc9ac903f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f7835a429ff4449baebdefcfa8db3f9d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f7df37e3f46844a0b066b8ec9be22934', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f7e2e7fbbf7945178fb4aaee95705302', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f7ec0e4ef1154475817714e3a532e2f4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f872a7c182354d50ba8ccb7b77424e7c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f89da029d736497eae00a0088f61236f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f8a0f859c79640f38f6bf48099b5c5d8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f8d07eb3c1d94365830a92ca3bc63883', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f8e6c53453f84245971f0d01dea9da76', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f8f6388b3ccc49fcb8acc7d81d9fd716', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f962409b7caa4819baeac26fc4514d34', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f97bb0333be44018b05be24dd979440f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f9aaa09c99144c08accbb1a08e392f87', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f9cf01232f164313ac25fd05e60ed04e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f9f3d97b795947949d700edeb96a5e14', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f9fc4bed7cbe41b6896c4a2dca85f3ea', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fa2b744b512d4d0f9f4144cebafde310', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fa5ca10ba1b840af9857c3c7e85aa8cb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fb0ec12745244155b535ee769c7c5093', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fb7e8a7688d2430c844023406d279384', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fc35b3184f9b468583bd9564add300fa', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fc52906eea6e427181acb2709dbcffee', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fc8dd4ea962345d9b0b7b815ef7a6426', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fd1318c76be74e408a622fdffeef7627', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fd669fa0a4644bd8b3bede30f8d7a078', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fdd8790419dc455fa0035def48e5ee43', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fe82b34b803f4782a1cf24e3dfae3bae', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('febc8bcfd8b643f3a4ccce06d77b6d3d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fed3535b539e4aeda90a8748aa390809', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ffc525375b724db2bfbadc9194ba69bf', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ffe3a92e89664191adccb7860e45043b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);

-- ----------------------------
-- Table structure for `wx_location`
-- ----------------------------
DROP TABLE IF EXISTS `wx_location`;
CREATE TABLE `wx_location` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `open_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `lng` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `lat` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `bd09_lng` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `bd09_lat` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of wx_location
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_message`
-- ----------------------------
DROP TABLE IF EXISTS `wx_message`;
CREATE TABLE `wx_message` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `inouts` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0接收，1发出',
  `datatype` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '数据类型：XML或者JSON，0表示XML，1表示JSON',
  `datacontent` text COLLATE utf8_bin COMMENT '接收或者发出的数据xml或者json',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msgType` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Event` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `EventKey` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ToUserName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `FromUserName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '发送方帐号（一个OpenID）',
  `CreateTime` decimal(20,0) DEFAULT NULL COMMENT '消息创建时间 （11位整型）',
  `MsgId` decimal(64,0) DEFAULT NULL COMMENT '消息id，64位整型',
  `PicUrl` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '图片链接',
  `MediaId` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '图片消息媒体id，可以调用多媒体文件下载接口拉取数据',
  `Title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '消息标题',
  `Description` text COLLATE utf8_bin COMMENT '消息描述',
  `Url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '消息链接',
  `Location_X` decimal(20,10) DEFAULT NULL COMMENT '地理位置维度',
  `Location_Y` decimal(20,10) DEFAULT NULL COMMENT '地理位置经度',
  `Scale` decimal(20,0) DEFAULT NULL COMMENT '地图缩放大小',
  `Labels` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '地理位置信息',
  `Content` text COLLATE utf8_bin COMMENT '文本消息内容',
  `ThumbMediaId` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。',
  `Format` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '语音格式，如amr，speex等',
  `Recognition` text COLLATE utf8_bin COMMENT '语音识别结果，UTF8编码',
  `Latitude` decimal(20,10) DEFAULT NULL COMMENT '地理位置纬度',
  `Longitude` decimal(20,10) DEFAULT NULL COMMENT '地理位置经度',
  `Precisions` decimal(20,10) DEFAULT NULL COMMENT '地理位置精度',
  `Ticket` text COLLATE utf8_bin COMMENT '二维码的ticket，可用来换取二维码图片',
  `MusicURL` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '音乐链接',
  `HQMusicUrl` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '高质量音乐链接，WIFI环境优先使用该链接播放音乐',
  `ArticleCount` decimal(2,0) DEFAULT NULL COMMENT '图文消息个数，限制为10条以内',
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of wx_message
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_role`
-- ----------------------------
DROP TABLE IF EXISTS `wx_role`;
CREATE TABLE `wx_role` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of wx_role
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_user`
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `openId` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户的标识',
  `subscribe` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '关注状态（1是关注，0是未关注），未关注时获取不到其余信息',
  `subscribeTime` decimal(20,0) DEFAULT NULL COMMENT '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
  `nickname` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户的性别（1是男性，2是女性，0是未知）',
  `country` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户所在省份',
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户所在城市',
  `language` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `headImgUrl` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像',
  `groupids` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of wx_user
-- ----------------------------
