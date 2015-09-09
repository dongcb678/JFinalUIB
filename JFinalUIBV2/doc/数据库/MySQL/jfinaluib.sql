/*
Navicat MySQL Data Transfer

Source Server         : localhost-mysql
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : jfinaluibv2

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2015-09-09 16:55:42
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
  `roleids` text COLLATE utf8_bin,
  `numbers` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_group
-- ----------------------------
INSERT INTO `pt_group` VALUES ('8a40c0353fa828a6013fa898d4ac0028', '4', '系统管理员组', '超级管理员', 0x38613430633033353366613832386136303133666138393864346163303032332C, 'SuperAdmin');

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
INSERT INTO `pt_menu` VALUES ('297e0cf944f8cce70144f8dce1540069', '2', '8.png', '0', '8', '74aa20442105408d90f9e6469a3a92b5', '294ab73cc8274f1fa0663bf9c1bbe4d4', '8a40c0353fa828a6013fa898d4ac0020', 'false', '字典管理', '字典管理', '字典管理', 'dictionary management', '辞書の管理', null);
INSERT INTO `pt_menu` VALUES ('3272e2e0a7cd4d7f8e1e88abe9d70ae4', '1', '2.png', null, '2', '06244cf3520c49e8a45cbde82a53fa5e', '294ab73cc8274f1fa0663bf9c1bbe4d4', null, 'false', '参数管理', '参数管理', '参数管理', 'Parameter management', 'パラメータの管理', null);
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
INSERT INTO `pt_module` VALUES ('297e0cf944e9762e0144e97dfd6e00c9', '0', '数据源', '2.png', 'true', '数据源', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('3bf4c1829bf447979865fc4d2ab75801', '0', null, '2.png', 'true', 'Log4j', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('3dec44186175424cbee2d05ffbb690dd', '0', null, '2.png', 'true', 'Upload', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('3e048ee263c344318e9c4995a5cd35e0', '0', null, '2.png', 'true', '验证码', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('4090cac06e15459789bc5154eef67e4e', '0', null, '2.png', 'true', 'Ueditor', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO `pt_module` VALUES ('417ed3d3cf4d4b7a939613829e8db17d', '0', null, '3.png', 'true', '消息管理', '3', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO `pt_module` VALUES ('58a33495466b466496de45dc116e577e', '0', null, '2.png', 'true', '资源负载', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
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
INSERT INTO `pt_operator` VALUES ('01aa0c85c8b84ae8aca7f5484336b203', '1', null, '保存', null, null, null, '0', '/jf/platform/dict/save', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('05114c0cbe1f4c2095b3216f13cfb681', '0', null, '保存', null, null, null, '0', '/jf/wx/keyword/save', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('053d330462e1459ca1012c9d29113bc4', '0', null, '获取部门负责人', null, null, null, '0', '/jf/platform/dept/getPrincipal', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('06244cf3520c49e8a45cbde82a53fa5e', '0', null, 'treeTableIframe', null, null, null, '0', '/platform/param/treeTableIframe.html', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('0773a58c4bdb4858ab062c4a2a4da69a', '0', null, '默认主页', null, null, null, '0', '/jf/wx/keyword', '8f53706d4af541588bde334d99d44727', '1', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('091855dd809b418fae88a7fec6d9f246', '0', null, '准备更新', null, null, null, '0', '/jf/platform/dict/edit', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('09b6ce29313c4051ba765de516a9b283', '0', null, 'treeData', null, null, null, '0', '/jf/platform/station/treeData', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('0da15c49299d41a4b720f787d053e3cb', '0', null, '默认列表', null, null, null, '0', '/jf/platform/operator', '8a40c0353fa828a6013fa898d4ac0027', '1', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('0fb7938c7d614fc389568eb67b442303', '0', null, '单选', null, null, null, '0', '/platform/module/radio.html', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('1046389d8525451697f2793185e7d6ee', '0', null, '更新', null, null, null, '0', '/jf/platform/dept/update', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('10499bc7f9cb4adf99beba00343b4ea6', '0', null, '获取菜单功能', null, null, null, '0', '/jf/platform/menu/getOperator', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('12141c1c3be241ca8a868bce9cd610d5', '0', null, '准备添加', null, null, null, '0', '/platform/dict/add.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('15495beebe984cd19dc30d65676c4c4d', '0', null, '负载', null, null, null, '0', '/jf/platform/resources', '58a33495466b466496de45dc116e577e', '0', '0', '0', '1', null, null, '资源负载');
INSERT INTO `pt_operator` VALUES ('1553d9a97a4b4063a46f4be41e7adedd', '0', null, 'lucene', null, null, null, '0', '/jf/platform/test/lucene', 'e86e5bc9ae5d44e78a48543cf348ca82', '1', '0', '0', '1', null, null, 'test');
INSERT INTO `pt_operator` VALUES ('15566e63f3104c73b4a0b4a784dd11ca', '0', null, '保存', null, null, null, '0', '/jf/platform/role/save', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('1a8b4d8e4411412fa8bb561393563a85', '0', null, '准备添加', null, null, null, '0', '/platform/user/add.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('1b0d7476974e4bf9b52f75fb82f87330', '0', null, '分组默认列表', null, null, null, '0', '/jf/platform/group', '8a40c0353fa828a6013fa898d4ac0023', '1', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('1b1a809815574b2a9c1d0e18d692de17', '0', null, '更新', null, null, null, '0', '/jf/platform/operator/update', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('21141da4febe4c929abe37126b37fd12', '0', null, '多选', null, null, null, '0', '/platform/station/checkbox.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('21b0a910ef6e4c60a325d5e57e6e6f65', '0', null, '单选', null, null, null, '0', '/platform/dict/radio.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('22926eb196a14b48be775f4880b5ba94', '0', null, '保存', null, null, null, '0', '/jf/platform/group/save', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('233356b63d8e477fb6e948b703232809', '0', null, '默认树', null, null, null, '0', '/jf/platform/station', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('235d855d7b914d728e434f0f309aa04d', '0', null, '默认列表', null, null, null, '0', '/jf/platform/sysLog', '8a40c0353fa828a6013fa898d4ac0029', '1', '0', '0', '1', null, null, '日志');
INSERT INTO `pt_operator` VALUES ('271a4ae9860341e6a30602070268e1e4', '0', null, '锁屏', null, null, null, '0', '/platform/login/lock_screen.html', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('29c18b3394924c30882da049da14ad99', '0', null, '更新', null, null, null, '0', '/jf/platform/role/update', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('2b7f6e28f9a74854b7399e8740b765fd', '0', null, 'log4jServlet', null, null, null, '0', '/se/log4j', '3bf4c1829bf447979865fc4d2ab75801', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO `pt_operator` VALUES ('2be34991827e4e8da8e92f9b9e8bce25', '0', null, 'treeTableSub', null, null, null, '0', '/jf/platform/dict/treeTable', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('2c91467f905a4f5ba9f52830131c8ad9', '0', null, '默认分组列表', null, null, null, '0', '/jf/wx/group', 'e6eb0165223447218410f867a9614300', '1', '0', '0', '1', null, null, '分组管理');
INSERT INTO `pt_operator` VALUES ('2fbbc9cfb0bf4b5bb504ead155c3423c', '0', null, '保存', null, null, null, '0', '/jf/platform/station/save', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('2fee901117c64e18873f60e8f800713d', '0', null, '单选', null, null, null, '0', '/platform/station/radio.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('32a3e59964204a3c8848e84b864306ae', '0', null, '删除', null, null, null, '0', '/jf/platform/systems/delete', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('335d1f8f46eb47a18001889f8cc21348', '0', null, '删除', null, null, null, '0', '/jf/platform/role/delete', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('362cf247241c4d12b6242301e4a73516', '0', null, '删除', null, null, null, '0', '/jf/platform/station/delete', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('36d3b89e378b451ca89d1a41a3c53e10', '1', null, 'iframe', null, null, null, '0', '/platform/log4j/iframe.html', '3bf4c1829bf447979865fc4d2ab75801', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO `pt_operator` VALUES ('37218fb52ec94fb4bf76209a17916094', '0', null, '默认树', null, null, null, '0', '/jf/platform/module', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('37a9a6966448469f9d9abe2e8aeb1b9e', '0', null, 'Upload', null, null, null, '0', '/jf/platform/upload', '3dec44186175424cbee2d05ffbb690dd', '0', '0', '0', '1', null, null, 'Upload');
INSERT INTO `pt_operator` VALUES ('38f3871f789c4936b37d17ea4823da58', '0', null, '锁屏密码验证', null, null, null, '0', '/jf/platform/login/pass', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('3b1e7c5d5e0e461c90e1f0032f679a25', '0', null, '查看', null, null, null, '0', '/jf/platform/dict/view', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('3b6a8f61e20e4bf2943421af2119e9b9', '0', null, '准备添加', null, null, null, '0', '/platform/param/add.html', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('3bfc62720fef4706b22c78d69d27a275', '0', null, '刷新缓存', null, null, null, '0', '/jf/platform/resources/refreshParamCache', '58a33495466b466496de45dc116e577e', '0', '0', '0', '1', null, null, '资源负载');
INSERT INTO `pt_operator` VALUES ('3dd486cd58da467dbd83ae420db14815', '0', null, '准备添加', null, null, null, '0', '/weiXin/keyword/add.html', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('3ee5f986289d4a1990f4e42c9a0caadb', '0', null, '准备添加', null, null, null, '0', '/platform/group/add.html', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('420d8ebc68ad44dc8188d4c27dc585d1', '0', null, '位置默认列表', null, null, null, '0', '/jf/wx/location', 'c87c35097a2d4bc898fe6e9b1e280a3d', '1', '0', '0', '1', null, null, '位置管理');
INSERT INTO `pt_operator` VALUES ('4376888fd74f4247a926529e5da03442', '0', null, 'treeData', null, null, null, '0', '/jf/platform/user/treeData', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('437e05d09dd94720b67c4f230cdebe58', '0', null, '更新', null, null, null, '0', '/jf/platform/module/update', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('45cf6e8f9c254e509399deda080f0e20', '0', null, '功能列表', null, null, null, '0', '/jf/platform/test/operator', 'e86e5bc9ae5d44e78a48543cf348ca82', '1', '0', '0', '1', null, null, 'test');
INSERT INTO `pt_operator` VALUES ('46e00ef0fd234e9dbf68ed9bbb437d0f', '0', null, '多选', null, null, null, '0', '/platform/department/checkbox.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('481d4d5c0a634c4085c72c990260e58d', '0', null, '微信管理主页', null, null, null, '0', '/jf/wx/index/content', '7a35846a305c42abb68601b4f7347289', '0', '0', '0', '1', null, null, '主页管理');
INSERT INTO `pt_operator` VALUES ('48db51f20b504c4ab489b1dcfd3ecbd9', '0', null, '密码变更', null, null, null, '0', '/platform/user/passChange.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('4a05ffcfe351476391a036937eaf733f', '0', null, '删除', null, null, null, '0', '/jf/platform/param/delete', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('4a6544ae7a2548ad81c0e3994999023c', '0', null, '准备设置菜单功能', null, null, null, '0', '/platform/menu/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('4c501cf7b83f4b058a05be15127c8edb', '0', null, '授权后的回调请求处理', null, null, null, '0', '/jf/wx/message/oauth2', '417ed3d3cf4d4b7a939613829e8db17d', '0', '0', '0', '0', null, null, '消息管理');
INSERT INTO `pt_operator` VALUES ('4df80521e66447618796c3cfe02bf239', '0', null, '默认treeTable', null, null, null, '0', '/jf/platform/dict', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('4f7a5bd18e1e4ed3849a94c48c14c5a1', '0', null, '验证邮箱是否存在', null, null, null, '0', '/jf/platform/login/valiMailBox', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('5148ea207b974ee197f0bc57060ab1ad', '0', null, '删除', null, null, null, '0', '/jf/wx/location/delete', 'c87c35097a2d4bc898fe6e9b1e280a3d', '0', '0', '0', '1', null, null, '位置管理');
INSERT INTO `pt_operator` VALUES ('58a85040aa9f40cca0bdba6e23e30363', '0', null, '保存', null, null, null, '0', '/jf/platform/dept/save', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('5982350f7d0e4b2ca72de64300d75223', '0', null, 'treeTable', null, null, null, '0', '/jf/platform/param/treeTable', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('5b249ad344d948b99f58768c323f5f71', '0', null, '准备添加', null, null, null, '0', '/platform/systems/add.html', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('5c15cf5c3761419a9029e4e094c8f53c', '0', null, '验证手机号是否存在', null, null, null, '0', '/jf/platform/login/valiMobile', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('5fcac107c80d493d91b53a815d4b297a', '0', null, '保存', null, null, null, '0', '/jf/platform/user/save', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('6131942dd2644790b80df13c14fb3ae8', '0', null, '保存', null, null, null, '0', '/jf/platform/param/save', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('6569e0d9f2cd4e3a97af4e1b0cd8d2f7', '0', null, '删除', null, null, null, '0', '/jf/platform/dict/delete', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('666f50e0f3b04f4ba43bcb4e719c1e8d', '0', null, '验证码', null, null, null, '0', '/jf/platform/authImg', '3e048ee263c344318e9c4995a5cd35e0', '0', '0', '0', '0', null, null, '验证码');
INSERT INTO `pt_operator` VALUES ('6b527ed138c343a89ddf73cf16fef565', '0', null, '更新', null, null, null, '0', '/jf/wx/keyword/update', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('6daed51284f94923b1c8a6414e646959', '0', null, 'treeData', null, null, null, '0', '/jf/platform/operator/treeData', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('74aa20442105408d90f9e6469a3a92b5', '0', null, 'treeTableIframe', null, null, null, '0', '/platform/dict/treeTableIframe.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('77823e12391a47729a1f82a00bc15c5b', '0', null, '准备更新', null, null, null, '0', '/jf/wx/keyword/edit', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('78c6026c6af44b41a6bef4cdb4cfb414', '0', null, '获取角色功能', null, null, null, '0', '/jf/platform/role/getOperator', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('79039a2260da46b0aabb5a62e8db6c87', '0', null, '查看', null, null, null, '0', '/jf/platform/user/view', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('7ae62737df444d619f8fd376360d160c', '0', null, '默认列表', null, null, null, '0', '/jf/platform/role', '8a40c0353fa828a6013fa898d4ac0024', '1', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('7b4281dd247c4624bee0d8f84c2c2715', '0', null, '保存', null, null, null, '0', '/jf/platform/systems/save', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('7cc12b5c154a4a9782c518c57e8ab3aa', '0', null, '准备更新', null, null, null, '0', '/jf/platform/role/edit', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('7eab5f800bab4efb8df1b2e8a0575f73', '0', null, '默认列表', null, null, null, '0', '/jf/platform/systems', '8a40c0353fa828a6013fa898d4ac0026', '1', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('7ed5eefbbf3d4aa78d0c5b99f3b7010c', '0', null, '登陆验证', null, null, null, '0', '/jf/platform/login/vali', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('83ef85fd17804bb195d0ad3c07f88c30', '0', null, '准备更新', null, null, null, '0', '/jf/platform/operator/edit', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('86a502729bda46f0b607c2b4c6531bd3', '0', null, '自动补全', null, null, null, '0', '/jf/platform/test/autoComplete', 'e86e5bc9ae5d44e78a48543cf348ca82', '0', '0', '0', '1', null, null, 'test');
INSERT INTO `pt_operator` VALUES ('886bd497064b4c9f87d8461ebba421d1', '0', null, '首页', null, null, null, '0', '/jf/platform/index', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('8bd9c0e14df941cdaf6253cd08dbd9cd', '0', null, '准备更新', null, null, null, '0', '/jf/platform/systems/edit', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('8ca8af501522439d8c9249e00db5d78d', '0', null, '查看', null, null, null, '0', '/jf/platform/sysLog/view', '8a40c0353fa828a6013fa898d4ac0029', '0', '0', '0', '1', null, null, '日志');
INSERT INTO `pt_operator` VALUES ('8f79857b31d4475a94c712e997e89c99', '0', null, '更新', null, null, null, '0', '/jf/platform/dict/update', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('910955c2192a418995eeab8bf15372e9', '0', null, '准备添加', null, null, null, '0', '/platform/operator/add.html', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('91baed789bc14efdbebb10b49c69ee5b', '0', null, '默认主页列表', null, null, null, '0', '/jf/platform/user', '8a40c0353fa828a6013fa898d4ac0030', '1', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('91f78713c3084b6e9b7419e2a97c7dac', '0', null, '查看', null, null, null, '0', '/jf/platform/param/view', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('9765e6bb76eb40ab800cb8954822190e', '0', null, '删除', null, null, null, '0', '/jf/wx/keyword/delete', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('99a42a467bbf4e829fd0706507c9f7a7', '0', null, 'log4jHtml', null, null, null, '0', '/platform/log4j/log4j.html', '3bf4c1829bf447979865fc4d2ab75801', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO `pt_operator` VALUES ('9a708f39e123455e84b6125774bab1ea', '0', null, 'treeData', null, null, null, '0', '/jf/platform/module/treeData', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('9ee4ee562eaa475a95f45d3daeb0220a', '0', null, '单选', null, null, null, '0', '/platform/param/radio.html', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('9f75b47bdc0249e2b493c47384785a72', '0', null, '保存', null, null, null, '0', '/jf/platform/menu/save', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('a0c01a5248cd4bf38e57945dbb2b98c5', '0', null, '更新', null, null, null, '0', '/jf/platform/group/update', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('a1ff68acf9b24c34b347ff21e333cb70', '0', null, '设置菜单功能', null, null, null, '0', '/jf/platform/menu/setOperator', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('a5289b2638d845fbb06dedbcdd517f97', '0', null, '删除', null, null, null, '0', '/jf/platform/group/delete', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('a6623c65480f4f2cb63a4d7673f81e3a', '0', null, 'treeData', null, null, null, '0', '/jf/platform/menu/treeData', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('aa126932641f4e068ed8278a332de85d', '0', null, '默认主页', null, null, null, '0', '/jf/platform/index/content', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('acbceb432b5849aca9e9b284240281ec', '0', null, '分组角色下拉选择', null, null, null, '0', '/jf/platform/role/select', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('ad09a1b897744812875c752c2d70f11a', '0', null, '默认树', null, null, null, '0', '/jf/platform/dept', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('ad51a6ca95c646ce9c03778eda715734', '0', null, '保存', null, null, null, '0', '/jf/platform/operator/save', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('afe893c6be744c4f98187b084ac832e7', '0', null, '编辑更新菜单', null, null, null, '0', '/jf/platform/menu/edit', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('b13b002e2fad4e95bbe0e4dbc9fbdfe1', '0', null, '保存', null, null, null, '0', '/jf/platform/module/save', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('b23b17d4c83242e8a1a8ee8cfcde9907', '0', null, '查看', null, null, null, '0', '/jf/platform/operator/view', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('b352e4246e754a9691bcc9011f445665', '0', null, 'treeData', null, null, null, '0', '/jf/platform/param/treeData', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('b3af8fb65a00418c966b8f2a5ac97400', '0', null, '验证身份证是否存在', null, null, null, '0', '/jf/platform/login/valiIdcard', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('b4ee4ae4391f4243be69e838545d2131', '0', null, 'treeData', null, null, null, '0', '/jf/platform/dept/treeData', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('b8218945b8e743f29651569950014511', '0', null, '单选', null, null, null, '0', '/platform/department/radio.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('b82d86fb7b64498a9c2b8b9a99b3fbeb', '0', null, '删除', null, null, null, '0', '/jf/platform/menu/delete', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('b8339f29d8d84a4ead6454295f87b79c', '0', null, '人员分组设置', null, null, null, '0', '/jf/platform/group/select', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('bc2c865be6af42cf861294d446fb1c6f', '0', null, '单选', null, null, null, '0', '/platform/user/radio.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('bcf8cf5ad0734dc785cba716ab437c93', '0', null, '验证账号是否存在', null, null, null, '0', '/jf/platform/login/valiUserName', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('beeaa7f4b2444430a6732ecc83c453a2', '0', null, '编辑', null, null, null, '0', '/jf/platform/param/edit', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('c04adcd019e04cf3ba7c66af721a18dc', '0', null, '删除', null, null, null, '0', '/jf/platform/user/delete', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('c05642442e0a468ebe4f0b7771a803ae', '0', null, '更新', null, null, null, '0', '/jf/platform/systems/update', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO `pt_operator` VALUES ('c081c50918f4459f8e36ab8cb4151a61', '0', null, '准备岗位功能设置', null, null, null, '0', '/platform/station/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('c0ccfcd127c347a8b9db140e5aa62188', '0', null, '准备添加', null, null, null, '0', '/platform/role/add.html', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('c1e991d1f56749298c18ff69d7777e0b', '0', null, '删除', null, null, null, '0', '/jf/platform/module/delete', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO `pt_operator` VALUES ('c29ea4cbd9044bc786e9f4584ad840ff', '0', null, '获取岗位功能', null, null, null, '0', '/jf/platform/station/getOperator', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('c7132250f5054b808bb119122a6ecb52', '0', null, '设置岗位功能', null, null, null, '0', '/jf/platform/station/setOperator', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('c9d013d14cbd4f148fb4562c91803ee8', '0', null, '准备更新', null, null, null, '0', '/jf/platform/group/edit', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('ca0f6da01ada419eaa7739d9790e5b88', '0', null, '准备角色功能设置', null, null, null, '0', '/platform/role/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('cc6bcbee40ab43b2bd5aff6d9385e1fc', '0', null, '删除', null, null, null, '0', '/jf/platform/operator/delete', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO `pt_operator` VALUES ('cf26c1d2baa24a8791b3d264154b80d4', '0', null, '默认树', null, null, null, '0', '/jf/platform/menu', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('d115d08591ef4c0eaebef15f8294b287', '0', null, '准备设置部门负责人', null, null, null, '0', '/platform/department/userTree.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('d1b453799d62485b82e027b96b596ccd', '0', null, 'ueditor', null, null, null, '0', '/jf/platform/ueditor', '4090cac06e15459789bc5154eef67e4e', '0', '0', '0', '1', null, null, 'Ueditor');
INSERT INTO `pt_operator` VALUES ('d247fb45be724ed2a2bb5c92d73bf6cf', '0', null, '设置用户的组', null, null, null, '0', '/jf/platform/user/setGroup', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('d479dbdc901f4d85a207b9bace6465ac', '0', null, '更新', null, null, null, '0', '/jf/platform/user/update', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('d496b161d2564111992687b948862244', '0', null, 'iframe', null, null, null, '0', '/platform/druid/iframe.html', '297e0cf944e9762e0144e97dfd6e00c9', '0', '0', '0', '1', null, null, '数据源');
INSERT INTO `pt_operator` VALUES ('d5c8bdf7a49a4e46b776c05dc9ead484', '0', null, 'treeData', null, null, null, '0', '/jf/platform/dict/treeData', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO `pt_operator` VALUES ('d646da8707ae41838fd2ec9bf0d467ee', '0', null, '设置角色功能', null, null, null, '0', '/jf/platform/role/setOperator', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO `pt_operator` VALUES ('dad107c1aeb0419b8004d57f9d70223e', '0', null, '更新', null, null, null, '0', '/jf/platform/param/update', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('dc750e57b54f4baca78d66969321ee51', '0', null, '更新', null, null, null, '0', '/jf/platform/station/update', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO `pt_operator` VALUES ('df0aa534655242e4a0bcd638b51a4e03', '0', null, '更新', null, null, null, '0', '/jf/platform/menu/update', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('dfa8256651a84269869c35ca1f10cae5', '0', null, '日之分页', null, null, null, '0', '/jf/platform/test/sysLog', 'e86e5bc9ae5d44e78a48543cf348ca82', '1', '0', '0', '1', null, null, 'test');
INSERT INTO `pt_operator` VALUES ('dfc7af0979a54e8e9a3f18b7a5d66030', '0', null, '查看', null, null, null, '0', '/jf/wx/keyword/view', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO `pt_operator` VALUES ('dfe9d74fe0ef4220bfcfe6d7bb2f9436', '0', null, '默认用户列表', null, null, null, '0', '/jf/wx/user', 'c4e63c4171db4ae2a83f7dfcc2656b0e', '1', '0', '0', '1', null, null, '用户管理');
INSERT INTO `pt_operator` VALUES ('e037e0bae9a94e549d6b647db49a64a1', '0', null, '角色设置', null, null, null, '0', '/jf/platform/group/setRole', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO `pt_operator` VALUES ('e754dfdb794d4e7db6023c9b089a340c', '0', null, '多选', null, null, null, '0', '/platform/user/checkbox.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('ee781545af7144a18f30b5492ee49fc8', '0', null, '刷新SQL', null, null, null, '0', '/jf/platform/resources/refreshSqlCache', '58a33495466b466496de45dc116e577e', '0', '0', '0', '1', null, null, '资源负载');
INSERT INTO `pt_operator` VALUES ('f1f6f2c8f026498c8ee64b7a918d06df', '0', null, '准备更新', null, null, null, '0', '/jf/platform/user/edit', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO `pt_operator` VALUES ('f57388d139034099932c36a955df625a', '0', null, '准备编辑菜单', null, null, null, '0', '/jf/platform/menu/toEdit', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO `pt_operator` VALUES ('f771691134c34174a819b5990310d000', '0', null, '首页', null, null, null, '0', '/jf/platform/', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('f771691134c34174a819b5990310da56', '0', null, '注销', null, null, null, '0', '/jf/platform/login/logout', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('f7c220a81ba843938f8ccb108bec9c03', '0', null, '参数主页', null, null, null, '0', '/jf/platform/param', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO `pt_operator` VALUES ('f82c021dc443419fb2469032af73bf3e', '0', null, '删除', null, null, null, '0', '/jf/platform/dept/delete', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO `pt_operator` VALUES ('fb6a0c1e618041bcbbf8cfd41311b1fa', '0', null, '准备登陆', null, null, null, '0', '/jf/platform/login', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO `pt_operator` VALUES ('fd9978df5c5a47f298e2d28e21e70b15', '0', null, '删除', null, null, null, '0', '/jf/platform/sysLog/delete', '8a40c0353fa828a6013fa898d4ac0029', '0', '0', '0', '1', null, null, '日志');
INSERT INTO `pt_operator` VALUES ('fe0be0443cba4a5993b6d5f91eae8e89', '0', null, '接收消息', null, null, null, '0', '/jf/wx/message', '417ed3d3cf4d4b7a939613829e8db17d', '0', '0', '0', '0', null, null, '消息管理');

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
  `operatorids` text COLLATE utf8_bin,
  `moduleids` text COLLATE utf8_bin,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pt_role
-- ----------------------------
INSERT INTO `pt_role` VALUES ('8a40c0353fa828a6013fa898d4ac0023', '2', 'SuperAdmin', '超级管理员', '超级管理员', 0x6F70657261746F725F38663961623731643532366334353335396334343736663935373938376536642C6F70657261746F725F33373231386662353265633934666234626637363230396131373931363039342C6F70657261746F725F63316539393164316635363734393239386331386666363964373737376530622C6F70657261746F725F62313362303032653266616434653935626265306534646263396662646665312C6F70657261746F725F39613730386633396531323334353565383462363132353737346261623165612C6F70657261746F725F34333765303564303964643934373230623637633466323330636465626535382C6F70657261746F725F30666237393338633764363134666333383935363865623637623434323330332C6F70657261746F725F39316261656437383962633134656664626562623130623439633639656535622C6F70657261746F725F63303461646364303139653034636633626137633636616637323161313864632C6F70657261746F725F66316636663263386630323634393863386565363462376139313864303664662C6F70657261746F725F35666361633130376338306434393364393162353361383135643462323937612C6F70657261746F725F64323437666234356265373234656432613262623563393264373362663663662C6F70657261746F725F34333736383838666437346634323437613932363532396535646130333434322C6F70657261746F725F64343739646264633930316634643835613230376239626163653634363561632C6F70657261746F725F37393033396132323630646134366230616162623561363265386462366338372C6F70657261746F725F31613862346438653434313134313266613862623536313339333536336138352C6F70657261746F725F65373534646664623739346434653764623630323363396230383961333430632C6F70657261746F725F34386462353166323062353034633461623438396231646366643365636264392C6F70657261746F725F62633263383635626536616634326366383631323934643434366662316336662C6F70657261746F725F63663236633164326261613234613837393162336432363431353462383064342C6F70657261746F725F62383264383666623762363434393861396332623862396139396233666265622C6F70657261746F725F31303439396263376639636234616466393962656261303033343362346561362C6F70657261746F725F39663735623437626463303234396532623439336334373338343738356137322C6F70657261746F725F61316666363861636639623234633334623334376666323165333333636237302C6F70657261746F725F61363632336336353438306634663263623633613464373637336638316533612C6F70657261746F725F64663061613533343635353234326534613062636436333862353161346530332C6F70657261746F725F34613635343461653761323534386164383163306533393934393939303233632C6F70657261746F725F66373731363931313334633334313734613831396235393930333130643030302C6F70657261746F725F38383662643439373036346234633966383764383436316562626134323164312C6F70657261746F725F61613132363933323634316634653036386564383237386133333264653835642C6F70657261746F725F66623661306331653631383034316263626266386366643431333131623166612C6F70657261746F725F66373731363931313334633334313734613831396235393930333130646135362C6F70657261746F725F37656435656566626266336434616137386430633562393966336237303130632C6F70657261746F725F31623064373437363937346534626639623532663735666238326638373333302C6F70657261746F725F61353238396232363338643834356662623036646564626364643531376639372C6F70657261746F725F63396430313364313463626434663134386662343536326339313830336565382C6F70657261746F725F32323932366562313936613134623438626537373566343838306235626139342C6F70657261746F725F62383333396632396438643834613465616436343534323935663837623739632C6F70657261746F725F65303337653062616539613934653534396436623634376462343961363461312C6F70657261746F725F61306330316135323438636434626633386535373934356462623262393863352C6F70657261746F725F33656535663938363238396434613139393066346534326339613063616164622C6F70657261746F725F64343936623136316432353634313131393932363837623934383836323234342C6F70657261746F725F34646638303532316536363434373631383739366333636665303262663233392C6F70657261746F725F36353639653064396632636434653361393761663465316230636438643266372C6F70657261746F725F66313663616464386638316534626566393236653039663731386462386665322C6F70657261746F725F30393138353564643830396234313866616538386137666563366439663234362C6F70657261746F725F30316161306338356338623834616538616361376635343834333336623230332C6F70657261746F725F64356338626466376134396134653436623737366330356463396561643438342C6F70657261746F725F32626533343939313832376534653864613865393266396239653862636532352C6F70657261746F725F38663739383537623331643434373561393463373132653939376538396339392C6F70657261746F725F31323134316331633362653234316361386138363862636539636436313064352C6F70657261746F725F32316230613931306566366534633630613332356435653537653665366636352C6F70657261746F725F64316531346530623766363934373833393438353064323233383231343639322C6F70657261746F725F37346161323034343231303534303864393066396536343639613361393262352C6F70657261746F725F38383937646265383562336534653639383964363632343935323732636632362C6F70657261746F725F37616536323733376466343434643631396638666433373633363064313630632C6F70657261746F725F33333564316638663436656234376131383030313838396638636332313334382C6F70657261746F725F37636331326235633135346134613937383263353138633537653861623361612C6F70657261746F725F37386336303236633661663434623431613662656634636462346366623431342C6F70657261746F725F31353536366536336633313034633733623461306234613738346464313163612C6F70657261746F725F61636263656234333262353834396163613965396232383432343032383165632C6F70657261746F725F64363436646138373037616534313833386664326563396266306434363765652C6F70657261746F725F32396331386233333934393234633330383832646130343964613134616439392C6F70657261746F725F63306363666364313237633334376138623964623134306535616136323138382C6F70657261746F725F63613066366461303161646134313965616137373339643937393065356238382C6F70657261746F725F32333333353662363364386534373766623665393438623730333233323830392C6F70657261746F725F33363263663234373234316334643132623632343233303165346137333531362C6F70657261746F725F63323965613463626439303434626337383665396634353834616438343066662C6F70657261746F725F32666262633963666230626634623562623530346561643135356333343233632C6F70657261746F725F63373133323235306635303534623830386262313139313232613665636235322C6F70657261746F725F30396236636532393331336334303531626137363564653531366139623238332C6F70657261746F725F64633735306535376235346634626163613738643636393639333231656535312C6F70657261746F725F32313134316461346665626534633932396162653337313236623337666431322C6F70657261746F725F63303831633530393138663434353966386533366162386362343135316136312C6F70657261746F725F32666565393031313137633634653138383733663630653866383030373133642C6F70657261746F725F37656162356638303062616234656662386466316232653861303537356637332C6F70657261746F725F33326133653539393634323034613363383834386538346238363433303661652C6F70657261746F725F38626439633065313464663934316364616636323533636430386462643963642C6F70657261746F725F37623432383164643234376334363234626565306438663834633263323731352C6F70657261746F725F63303536343234343265306134363865626534663062373737316138303361652C6F70657261746F725F35623234396164333434643934386239396635383736386333323366356637312C6F70657261746F725F30646131356334393239396434316134623732306637383764303533653363622C6F70657261746F725F63633662636265653430616234336232626435616666366439333835653166632C6F70657261746F725F38336566383566643137383034626231393564306164336330376638386333302C6F70657261746F725F61643531613663613935633634366365396330333737386564613731353733342C6F70657261746F725F36646165643531323834663934393233623163386136343134653634363935392C6F70657261746F725F31623161383039383135353734623261396331643065313864363932646531372C6F70657261746F725F62323362313764346338333234326538613161386565386366636465393930372C6F70657261746F725F39313039353563323139326134313839393565656162386266313533373265392C6F70657261746F725F61643039613162383937373434383132383735633735326332643730663131612C6F70657261746F725F66383263303231646334343334313966623234363930333261663733626633652C6F70657261746F725F30353364333330343632653134353963613130313263396432393131336263342C6F70657261746F725F35386138353034306161396634306363613062646261366532336533303336332C6F70657261746F725F62346565346165343339316634323433626536396538333835343564323133312C6F70657261746F725F31303436333839643835323534353136393766323739333138356537643665652C6F70657261746F725F34366530306566306664323334653964626636386564396262623433376430662C6F70657261746F725F62383231383934356238653734336632393635313536393935303031343531312C6F70657261746F725F64313135643038353931656634633065616562656631356638323934623238372C6F70657261746F725F32333564383535643762393134643732386534333466306633303961613034642C6F70657261746F725F66643939373864663563356134376632393865326432386532316537306231352C6F70657261746F725F38636138616635303135323234333964386339323439653030646235643738642C6F70657261746F725F64666539643734666530656634323230626663666536643762623266393433362C6F70657261746F725F32633931343637663930356134663562613966353238333031333163386164392C6F70657261746F725F34383164346435633061363334633430383563373263393930323630653538642C6F70657261746F725F34323064386562633638616434346463383138386434633237646335383564312C6F70657261746F725F35313438656132303762393734656531393766306263353730363061623161642C6F70657261746F725F30373733613538633462646234383538616230363263346132613464613639612C6F70657261746F725F39373635653662623736656234306162383030636238393534383232313930652C6F70657261746F725F37373832336531323339316134373732396131663832613030626331356335622C6F70657261746F725F30353131346330636265316634633230393562333231366631336366623638312C6F70657261746F725F36623532376564313338633334336138396464663733636631366665663536352C6F70657261746F725F64666337616630393739613534653865396133663138623761356436363033302C6F70657261746F725F33646434383663643538646134363764626438336165343230646231343831352C6F70657261746F725F33366433623839653337386234353163613839643161343161336335336531302C6F70657261746F725F39396134326134363762626634653832396664303730363530376339663761372C6F70657261746F725F32623766366532386639613734383534623733393965383734306237363566642C6F70657261746F725F64316234353337393964363234383562383265303237623936623539366363642C6F70657261746F725F33376139613639363634343834363966396439616265326538616562316239652C6F70657261746F725F33623165376335643565306534363163393065316630303332663637396132352C6F70657261746F725F61666538393363366265373434633466393831383762303834616338333265372C6F70657261746F725F66353733383864313339303334303939393332633336613935356466363235612C6F70657261746F725F66376332323061383162613834333933386638636362313038626563396330332C6F70657261746F725F34613035666663666533353134373633393161303336393337656166373333662C6F70657261746F725F62656561613766346232343434343330613637333265636338336334353361322C6F70657261746F725F36313331393432646432363434373930623830646631336331346662336165382C6F70657261746F725F62333532653432343665373534613936393162636339303131663434353636352C6F70657261746F725F35393832333530663764306534623263613732646536343330306437353232332C6F70657261746F725F64616431303763316165623034313962383030346435376639643730323233652C6F70657261746F725F39316637383731336333303834623665396237343139653261393763376461632C6F70657261746F725F33623661386636316532306534626632393433343231616632313139653962392C6F70657261746F725F39656534656535363265616134373561393566343564336461656230323230612C6F70657261746F725F30363234346366333532306334396538613435636264653832613533666135652C6F70657261746F725F36363666353065306633623034663462613433626362346537313963316538642C6F70657261746F725F34356366366538663963323534653530393339396465646130383066306532302C6F70657261746F725F64666138323536363531613834323639383639633335636131663130636165352C6F70657261746F725F31353533643961393761346234303633613436663462653431653761646564642C6F70657261746F725F38366135303237323962646134366630623630376332623463363533316264332C6F70657261746F725F31353439356265656265393834636431396463333064363536373663346334642C6F70657261746F725F33386633383731663738396334393336623337643137656134383233646135382C6F70657261746F725F62336166386662363561303034313863393636623866326135616339373430302C6F70657261746F725F34663761356264313865316534656433383439613934633438633134633561312C6F70657261746F725F35633135636635633337363134313961393032396534653039346338663533632C6F70657261746F725F32373161346165393836303334316536613330363032303730323638653165342C6F70657261746F725F62636638636635616430373334646337383563626137313661623433376339332C6F70657261746F725F33626663363237323066656634373036623232633738643639643237613237352C6F70657261746F725F65653738313534356166373134346131386633306235343932656534396663382C6F70657261746F725F66653062653034343363626134613539393362366435663931656165386538392C6F70657261746F725F34633530316366376238336634623035386130356265313531323763386564622C, 0x6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033332C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033302C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033312C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032312C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032332C6D6F64756C655F32393765306366393434653937363265303134346539376466643665303063392C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032342C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032352C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032362C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032372C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032382C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032392C6D6F64756C655F38613430633033353366613832386136303133666138393864346163313130302C6D6F64756C655F63346536336334313731646234616532613833663764666363323635366230652C6D6F64756C655F65366562303136353232333434373231383431306638363761393631343330302C6D6F64756C655F34313765643364336366346434623761393339363133383239653864623137642C6D6F64756C655F37613335383436613330356334326162623638363031623466373334373238392C6D6F64756C655F63383763333530393761326434626338393866653665396231653238306133642C6D6F64756C655F38663533373036643461663534313538386264653333346439396434343732372C6D6F64756C655F38613430633033353366613832386136303133666138393864346163323230302C6D6F64756C655F33626634633138323962663434373937393836356663346432616237353830312C6D6F64756C655F34303930636163303665313534353937383962633531353465656636376534652C6D6F64756C655F33646563343431383631373534323463626565326430356666626236393064642C6D6F64756C655F38613162353162623666616534666163383539316634663338376432353066662C6D6F64756C655F33653034386565323633633334343331386539633439393561356364333565302C6D6F64756C655F65383665356263396165356434346537386134383534336366333438636138322C);

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
INSERT INTO `pt_station` VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '应用Java', '8.png', 'false', '应用Java', '3', '8a40c0353fa828a6013fa898d4ac0027', 0x6F70657261746F725F33373231386662353265633934666234626637363230396131373931363039342C6F70657261746F725F63316539393164316635363734393239386331386666363964373737376530622C6F70657261746F725F62313362303032653266616434653935626265306534646263396662646665312C6F70657261746F725F39613730386633396531323334353565383462363132353737346261623165612C6F70657261746F725F34333765303564303964643934373230623637633466323330636465626535382C6F70657261746F725F30666237393338633764363134666333383935363865623637623434323330332C6F70657261746F725F66373731363931313334633334313734613831396235393930333130643030302C6F70657261746F725F38383662643439373036346234633966383764383436316562626134323164312C6F70657261746F725F61613132363933323634316634653036386564383237386133333264653835642C6F70657261746F725F66623661306331653631383034316263626266386366643431333131623166612C6F70657261746F725F66373731363931313334633334313734613831396235393930333130646135362C6F70657261746F725F37656435656566626266336434616137386430633562393966336237303130632C6F70657261746F725F63663236633164326261613234613837393162336432363431353462383064342C6F70657261746F725F62383264383666623762363434393861396332623862396139396233666265622C6F70657261746F725F31303439396263376639636234616466393962656261303033343362346561362C6F70657261746F725F39663735623437626463303234396532623439336334373338343738356137322C6F70657261746F725F61316666363861636639623234633334623334376666323165333333636237302C6F70657261746F725F61363632336336353438306634663263623633613464373637336638316533612C6F70657261746F725F64663061613533343635353234326534613062636436333862353161346530332C6F70657261746F725F34613635343461653761323534386164383163306533393934393939303233632C6F70657261746F725F39316261656437383962633134656664626562623130623439633639656535622C6F70657261746F725F63303461646364303139653034636633626137633636616637323161313864632C6F70657261746F725F66316636663263386630323634393863386565363462376139313864303664662C6F70657261746F725F35666361633130376338306434393364393162353361383135643462323937612C6F70657261746F725F64323437666234356265373234656432613262623563393264373362663663662C6F70657261746F725F34333736383838666437346634323437613932363532396535646130333434322C6F70657261746F725F64343739646264633930316634643835613230376239626163653634363561632C6F70657261746F725F37393033396132323630646134366230616162623561363265386462366338372C6F70657261746F725F31613862346438653434313134313266613862623536313339333536336138352C6F70657261746F725F65373534646664623739346434653764623630323363396230383961333430632C6F70657261746F725F34386462353166323062353034633461623438396231646366643365636264392C6F70657261746F725F62633263383635626536616634326366383631323934643434366662316336662C6F70657261746F725F64343936623136316432353634313131393932363837623934383836323234342C6F70657261746F725F31623064373437363937346534626639623532663735666238326638373333302C6F70657261746F725F61353238396232363338643834356662623036646564626364643531376639372C6F70657261746F725F63396430313364313463626434663134386662343536326339313830336565382C6F70657261746F725F32323932366562313936613134623438626537373566343838306235626139342C6F70657261746F725F62383333396632396438643834613465616436343534323935663837623739632C6F70657261746F725F65303337653062616539613934653534396436623634376462343961363461312C6F70657261746F725F61306330316135323438636434626633386535373934356462623262393863352C6F70657261746F725F33656535663938363238396434613139393066346534326339613063616164622C6F70657261746F725F34646638303532316536363434373631383739366333636665303262663233392C6F70657261746F725F36353639653064396632636434653361393761663465316230636438643266372C6F70657261746F725F66313663616464386638316534626566393236653039663731386462386665322C6F70657261746F725F30393138353564643830396234313866616538386137666563366439663234362C6F70657261746F725F30316161306338356338623834616538616361376635343834333336623230332C6F70657261746F725F64356338626466376134396134653436623737366330356463396561643438342C6F70657261746F725F32626533343939313832376534653864613865393266396239653862636532352C6F70657261746F725F38663739383537623331643434373561393463373132653939376538396339392C6F70657261746F725F31323134316331633362653234316361386138363862636539636436313064352C6F70657261746F725F32316230613931306566366534633630613332356435653537653665366636352C6F70657261746F725F64316531346530623766363934373833393438353064323233383231343639322C6F70657261746F725F37346161323034343231303534303864393066396536343639613361393262352C6F70657261746F725F38383937646265383562336534653639383964363632343935323732636632362C6F70657261746F725F37616536323733376466343434643631396638666433373633363064313630632C6F70657261746F725F33333564316638663436656234376131383030313838396638636332313334382C6F70657261746F725F37636331326235633135346134613937383263353138633537653861623361612C6F70657261746F725F37386336303236633661663434623431613662656634636462346366623431342C6F70657261746F725F31353536366536336633313034633733623461306234613738346464313163612C6F70657261746F725F61636263656234333262353834396163613965396232383432343032383165632C6F70657261746F725F64363436646138373037616534313833386664326563396266306434363765652C6F70657261746F725F32396331386233333934393234633330383832646130343964613134616439392C6F70657261746F725F63306363666364313237633334376138623964623134306535616136323138382C6F70657261746F725F63613066366461303161646134313965616137373339643937393065356238382C6F70657261746F725F32333333353662363364386534373766623665393438623730333233323830392C6F70657261746F725F33363263663234373234316334643132623632343233303165346137333531362C6F70657261746F725F63323965613463626439303434626337383665396634353834616438343066662C6F70657261746F725F32666262633963666230626634623562623530346561643135356333343233632C6F70657261746F725F63373133323235306635303534623830386262313139313232613665636235322C6F70657261746F725F30396236636532393331336334303531626137363564653531366139623238332C6F70657261746F725F64633735306535376235346634626163613738643636393639333231656535312C6F70657261746F725F32313134316461346665626534633932396162653337313236623337666431322C6F70657261746F725F63303831633530393138663434353966386533366162386362343135316136312C6F70657261746F725F32666565393031313137633634653138383733663630653866383030373133642C6F70657261746F725F37656162356638303062616234656662386466316232653861303537356637332C6F70657261746F725F33326133653539393634323034613363383834386538346238363433303661652C6F70657261746F725F38626439633065313464663934316364616636323533636430386462643963642C6F70657261746F725F37623432383164643234376334363234626565306438663834633263323731352C6F70657261746F725F63303536343234343265306134363865626534663062373737316138303361652C6F70657261746F725F35623234396164333434643934386239396635383736386333323366356637312C6F70657261746F725F30646131356334393239396434316134623732306637383764303533653363622C6F70657261746F725F63633662636265653430616234336232626435616666366439333835653166632C6F70657261746F725F38336566383566643137383034626231393564306164336330376638386333302C6F70657261746F725F61643531613663613935633634366365396330333737386564613731353733342C6F70657261746F725F36646165643531323834663934393233623163386136343134653634363935392C6F70657261746F725F31623161383039383135353734623261396331643065313864363932646531372C6F70657261746F725F62323362313764346338333234326538613161386565386366636465393930372C6F70657261746F725F39313039353563323139326134313839393565656162386266313533373265392C6F70657261746F725F61643039613162383937373434383132383735633735326332643730663131612C6F70657261746F725F66383263303231646334343334313966623234363930333261663733626633652C6F70657261746F725F30353364333330343632653134353963613130313263396432393131336263342C6F70657261746F725F35386138353034306161396634306363613062646261366532336533303336332C6F70657261746F725F62346565346165343339316634323433626536396538333835343564323133312C6F70657261746F725F31303436333839643835323534353136393766323739333138356537643665652C6F70657261746F725F34366530306566306664323334653964626636386564396262623433376430662C6F70657261746F725F62383231383934356238653734336632393635313536393935303031343531312C6F70657261746F725F64313135643038353931656634633065616562656631356638323934623238372C6F70657261746F725F32333564383535643762393134643732386534333466306633303961613034642C6F70657261746F725F66643939373864663563356134376632393865326432386532316537306231352C6F70657261746F725F38636138616635303135323234333964386339323439653030646235643738642C6F70657261746F725F64666539643734666530656634323230626663666536643762623266393433362C6F70657261746F725F32633931343637663930356134663562613966353238333031333163386164392C6F70657261746F725F34383164346435633061363334633430383563373263393930323630653538642C6F70657261746F725F34323064386562633638616434346463383138386434633237646335383564312C6F70657261746F725F35313438656132303762393734656531393766306263353730363061623161642C6F70657261746F725F30373733613538633462646234383538616230363263346132613464613639612C6F70657261746F725F39373635653662623736656234306162383030636238393534383232313930652C6F70657261746F725F37373832336531323339316134373732396131663832613030626331356335622C6F70657261746F725F30353131346330636265316634633230393562333231366631336366623638312C6F70657261746F725F36623532376564313338633334336138396464663733636631366665663536352C6F70657261746F725F64666337616630393739613534653865396133663138623761356436363033302C6F70657261746F725F33646434383663643538646134363764626438336165343230646231343831352C6F70657261746F725F33366433623839653337386234353163613839643161343161336335336531302C6F70657261746F725F39396134326134363762626634653832396664303730363530376339663761372C6F70657261746F725F32623766366532386639613734383534623733393965383734306237363566642C6F70657261746F725F64316234353337393964363234383562383265303237623936623539366363642C6F70657261746F725F33376139613639363634343834363966396439616265326538616562316239652C6F70657261746F725F33623165376335643565306534363163393065316630303332663637396132352C6F70657261746F725F66376332323061383162613834333933386638636362313038626563396330332C6F70657261746F725F34613035666663666533353134373633393161303336393337656166373333662C6F70657261746F725F62656561613766346232343434343330613637333265636338336334353361322C6F70657261746F725F36313331393432646432363434373930623830646631336331346662336165382C6F70657261746F725F62333532653432343665373534613936393162636339303131663434353636352C6F70657261746F725F35393832333530663764306534623263613732646536343330306437353232332C6F70657261746F725F64616431303763316165623034313962383030346435376639643730323233652C6F70657261746F725F39316637383731336333303834623665396237343139653261393763376461632C6F70657261746F725F33623661386636316532306534626632393433343231616632313139653962392C6F70657261746F725F39656534656535363265616134373561393566343564336461656230323230612C6F70657261746F725F30363234346366333532306334396538613435636264653832613533666135652C6F70657261746F725F36363666353065306633623034663462613433626362346537313963316538642C6F70657261746F725F66353733383864313339303334303939393332633336613935356466363235612C6F70657261746F725F61666538393363366265373434633466393831383762303834616338333265372C6F70657261746F725F62336166386662363561303034313863393636623866326135616339373430302C6F70657261746F725F34663761356264313865316534656433383439613934633438633134633561312C6F70657261746F725F35633135636635633337363134313961393032396534653039346338663533632C6F70657261746F725F62636638636635616430373334646337383563626137313661623433376339332C6F70657261746F725F38366135303237323962646134366630623630376332623463363533316264332C6F70657261746F725F31353533643961393761346234303633613436663462653431653761646564642C6F70657261746F725F34356366366538663963323534653530393339396465646130383066306532302C6F70657261746F725F64666138323536363531613834323639383639633335636131663130636165352C6F70657261746F725F31353439356265656265393834636431396463333064363536373663346334642C6F70657261746F725F33626663363237323066656634373036623232633738643639643237613237352C6F70657261746F725F65653738313534356166373134346131386633306235343932656534396663382C6F70657261746F725F66653062653034343363626134613539393362366435663931656165386538392C6F70657261746F725F34633530316366376238336634623035386130356265313531323763386564622C6F70657261746F725F32373161346165393836303334316536613330363032303730323638653165342C6F70657261746F725F33386633383731663738396334393336623337643137656134383233646135382C, 0x6D6F64756C655F38613430633033353433323865353237303134333238653838346265303031362C6D6F64756C655F70696E675461692C6D6F64756C655F70696E6754616930303032302C6D6F64756C655F70696E67546169303030342C6D6F64756C655F70696E6754616930303031362C6D6F64756C655F70696E67546169303030372C6D6F64756C655F70696E6754616930303031322C6D6F64756C655F32393765306366393434663863636537303134346638653136366134303136372C6D6F64756C655F70696E6754616930303031352C6D6F64756C655F70696E6754616930303032322C6D6F64756C655F70696E6754616930303031302C6D6F64756C655F70696E6754616930303031382C6D6F64756C655F70696E67546169303030362C6D6F64756C655F70696E6754616930303032332C6D6F64756C655F70696E6754616930303031312C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032302C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033332C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032312C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033312C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303033302C6D6F64756C655F32393765306366393434653937363265303134346539376466643665303063392C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032332C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032342C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032352C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032362C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032372C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032382C6D6F64756C655F38613430633033353366613832386136303133666138393864346163303032392C6D6F64756C655F38613430633033353366613832386136303133666138393864346163313130302C6D6F64756C655F63346536336334313731646234616532613833663764666363323635366230652C6D6F64756C655F65366562303136353232333434373231383431306638363761393631343330302C6D6F64756C655F34313765643364336366346434623761393339363133383239653864623137642C6D6F64756C655F37613335383436613330356334326162623638363031623466373334373238392C6D6F64756C655F63383763333530393761326434626338393866653665396231653238306133642C6D6F64756C655F38663533373036643461663534313538386264653333346439396434343732372C6D6F64756C655F38613430633033353366613832386136303133666138393864346163323230302C6D6F64756C655F33626634633138323962663434373937393836356663346432616237353830312C6D6F64756C655F34303930636163303665313534353937383962633531353465656636376534652C6D6F64756C655F33646563343431383631373534323463626565326430356666626236393064642C6D6F64756C655F38613162353162623666616534666163383539316634663338376432353066662C6D6F64756C655F33653034386565323633633334343331386539633439393561356364333565302C);
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
INSERT INTO `pt_upload` VALUES ('0f2cc2d5c8ea4181bd6e257ee944a125', '0', 'file', '290036efa2384bdb85d4d5d2a4f642fe.png', 'image/png', 'IP.png', 'webRoot');
INSERT INTO `pt_upload` VALUES ('1226549a9de748d9add36dfed9160369', '0', 'file', '1ffa644236054ec190d7fc0ac33e3033.jpg', 'image/jpeg', '20130519_122955_8208.jpg', 'webRoot');
INSERT INTO `pt_upload` VALUES ('282f52e6af2743c1971afe2b25b22dbd', '0', 'file', 'c739d3b2155642b5876a4b61ca30f405.jpg', 'image/jpeg', 'yy.jpg', 'webRoot');
INSERT INTO `pt_upload` VALUES ('3e6243bce6d34d78a85ba6c907de3b0d', '0', 'file', '6e43b4a0b16043aaa55f970202644482.bmp', 'image/bmp', 'ip.bmp', 'webRoot');
INSERT INTO `pt_upload` VALUES ('9c9c66b2796341b19327228e257d1ca9', '0', 'file', '99eb488c98274390b33d6b35b9b4e57b.jpg', 'image/jpeg', 'code.jpg', 'webRoot');
INSERT INTO `pt_upload` VALUES ('a2e07cd887524aa9b8737a6b803c88ab', '0', 'file', '866006669c6f4d118d2a2593866ee027.jpg', 'image/jpeg', 'code.jpg', 'webRoot');
INSERT INTO `pt_upload` VALUES ('ebf38b8979fd4116a66176a1ba8a9acd', '0', 'file', 'bd8b6cb6a41e4f73b5bfbdcf1f90f3ff.png', 'image/png', 'XXX.png', 'webRoot');

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
INSERT INTO `pt_user` VALUES ('03a44ba0aa4e4905bea726d4da976ba5', '6', '0', '0', 0xF1F086AE167055D1183C2CF37EEB10EF41EFFCD6, 0x87FFE243576B1A8C, '1', '2015-03-26 19:16:26', 'admins', '8a40c0353fa828a6013fa898d4ac0028', '03a44ba0aa4e4905bea726d4da976ba5', 0x3861343063303335336661383238613630313366613839386434616330303236, 0x646570745F342C646570745F322C, 0x757365725F30336134346261306161346534393035626561373236643464613937366261352C, 0x38613430633033353366613832386136303133666138393864346163303032382C, '运维部', 0xE5BA94E794A84A617661, 0xE8BF90E7BBB4E983A82CE7B3BBE7BB9FE5B9B3E58FB0E983A82C, 0x61646D696E73, null);

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
INSERT INTO `pt_userinfo` VALUES ('03a44ba0aa4e4905bea726d4da976ba5', '6', '湖北钟祥', null, '55', '2012-03-07', 'bloodGroup_A', '2015-03-26 19:16:26', '2014-06-09 11:21:13', 'wenHuaChenDu_chuZhong', '湖北钟祥', 'dongcb678@163.com', '2010-10-25', 'folk_han', 'government_dangYuan', 'http://www.4bu4.com', '湖北钟祥', '420881198609285832', 'marriage_no', '13871558042', null, '董华健', '湖北钟祥', '431924', '150584428', '西安外事学院', 'man', '电子商务', '165', '027-65155060');

-- ----------------------------
-- Table structure for `test_blog`
-- ----------------------------
DROP TABLE IF EXISTS `test_blog`;
CREATE TABLE `test_blog` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8_bin COMMENT '内容',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of test_blog
-- ----------------------------

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
INSERT INTO `wx_keyword` VALUES ('d0465d02b6da472384e1277ea6b05a64', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d04bb9cdbe5b4e9cab55a46ddb791d85', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d07216b54c5e42159d59c28f9ca7680a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d0a9bd3fe58545a79739cebd768dc28d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d0ea8bbc5d2342c98ea50f56c7c637e7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d156978a81f0499e9a2377aa91c164ce', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d1dacee0f0dc43fcace54ed1cd807312', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d2ae9f12b349417db0f8e2feef1f7e41', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d2d0e1ab8f6d426c96626b3af00dd061', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d2fe6d7b162640aab87c559d479b7364', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d3173412b4e9449fb5d4a6100fa88e64', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d36a51a11762415d8ab1601ca0ea7c73', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d43a300e10cb4f5786a6fbbfac3979b5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d4574ae832f148328e12655014cacd8f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d487657970bf4b1b9bbec24d2fffb462', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d4a5060fdea6471699acd4a44d078e2a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d4e700cae3e64fd9be2ee5b25c0046ca', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d55623185ccd4bd1af0d09c53883842a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d556fdc4a682400cb9abbdd70f7d962b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d55861b7abd8444e99d69f9fc15ee2ee', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d590732d60f849f58477e775a70b6eab', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d5938dcab21f450d8aeb283cc5a833a0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d59471330444431081de2dc7452a9bb9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d5ba696a563642a2aa2e8894b50f1bcc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d63d44985f1a459cb29c035955bde7c0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d63e31802a4149aba7335d5eae46516f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d76d06035f3c4c97a645e3752e8e4354', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d7ab7af4a9f04c0f9a58a332aa1ce0e4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d8132da103b4459492f5b339e14af263', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d8370a1ebe454c5bb3f843d64f8f34ae', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d88c1b100e4944b6ad1e671ff19190bd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d977193bffa94f8294d5cfc4c9f7d0c4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('d9cce2394ac54765836a2221b231b659', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('da8d914da42d4d1a9f1b448409c669c5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('daaf053cdf7b4a5b81112b61e331fb87', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dabd93cd69be489e8c092e8a2933eb53', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('db065cf0d9be450e97461bfb392a1b70', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('db093d5b8b9849a0a6888d9290d76ad2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('db890bb0b8cd4da0b9c29c0fcd9fe566', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dbb4fa4c8b9644ed8c88cf0c1870bfc7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dbcdbf25b4fe49638da79ae480ecff66', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dc29fef018684e138917417b1978e8f2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dc3e0102270c4e44b671b5b91f72964e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dca540de56fb47b690f9764bb0f0e8a9', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dcf15d9b1e7e4f929f4b3e6c60781d86', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dd18750450de41c6ba2c1ba51475cf3d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dd61e2a4dde14bbba4006281389e7206', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ddcdba43ed6e433fa2b40d9497c2999d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ddd124ea2fca498a92098f3455dc589f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('de18ecef51aa406d91c97c489e0add6c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('dec221a58dbf4054b36d85d13b769f9f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('df1a365f2c8b4cbab12f1161881614a8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('df24f6b8a7374e1fbb33e689b40d9114', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('df65ce6281e647c5bcffdfdcf6d9b248', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('df74fd59822a4bc98c4e48792b51d4c2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('df82a35489b44bcdb812c521e116752a', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('df8789088a0a42f3bdc625b15e44caff', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('df89f4bc15ee409497c068b0679d0d4c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('df90cd6fcbfd42078467af9cbd7a1ad6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e01fe5b573c14be08c228d46b0f3a3de', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e02c0e9511e14462905f03e749718ffb', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e1262c0e2cf04c3c8723dd362560ba46', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e1e6625d6b9148c6ad88d0ba3a3556f1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e28ea734ea5c40ca8efc3c1b5a985b07', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e305c4ea8d9e4601bb0ac1fcda094ab5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e370a3ea1a944897af434c4854ec1494', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e3db3b2d7ac142f693a7b8668b4b8fa4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e3f88e8f4769471cbd1290ea47a32a1b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e42a30eabb2847fbb20ce558aaa8bf16', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e4376336a0f84c63bdf62e178baf19ec', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e4858b3ec34743d78403a1d16a26dc8d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e4b23a07f43c409cb8df06518426053b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e4fac0c633b149629a816d5a2630d0c2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e5041c5062e8424badf601eaadcf3e90', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e514b84d445f489e9a715c27586930ad', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e53c31e45a324f00bbc15c4c39e5fda7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e547a7db67b44e76bcbd37a809c188a5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e54c894f4e4b4a9f915a4dc12f8fd3e6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e5590e79868f4efa8c5607a18aeabe26', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e58d3fe4d54c4cda924151cb860736d0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e5bb712385a7407ea7b91c7eb6671617', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e5e7cfe78ca941198f6aabcad0bc0d45', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e5fe35adb7384578ac691ab103cb5f70', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e63a4efdd723484badc69a98c9cf6234', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e6c3caf7a6dd4b30b8d6e452e41102fd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e702d20c01ae42d4bbcb2db668912827', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e73cc519e7fb47d3b9606c97fae80a03', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e75659f3d6be45c78b675d15037232f7', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e770307d1c8c492ca732119055c79ce1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e8021daeab8e4dd3bd56267d16352cff', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e82b975efa93474b9c77dfce7f2944ed', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e83089880d5046448925e9bf0c5c7601', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e8860bc98adb4ccbb2d8a1f4f63f7112', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e8a987179dd541a1bd002e0dfc68910d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e9125d95fdd74f27bf04df688bcfbaf1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('e99b33c4dabc4cbd8a6a70f07fd54006', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eaa10d2075ae40d0b497b8cb39b6072f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eabd6e2e9e644afeab6cb59ba2ea239d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eb0ce7df9c334b758224d2c560b47159', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eb19c44684b34435a71630895928fa01', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eb6a65d6aabd4c6b82dc81c86b8b463f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eb7e3f2d9a92438491c3264ff5b7b70d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eba18837dae74ab986b2873bc7f7908f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eba7a15fcb5d4fecba6a4a9a188d0fb8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ebe51815e29947ba90c3ef03013f387d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ec1481801a28444f8d5ec0cc8222ae7d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ec2b285b4e9b489283199d425d241fca', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ec2d6ecccb6643cab0ed49825b25ead0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ec67877a28a74efca0a995f83caafd55', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ec7e9b4ffb194cd09ad3cd001892de51', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ec95f843e99146478f17333647a94ba4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('eca4946ef8ab48dfa337aad393a89253', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ecaa3e3ffbd54ab484b21102d2eb856e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ecac123a72074daaa347ce806d6d8549', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ed04f9800b5444e9b12513bceb379af5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ed92783986ad4482b99f1784e397e69e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ed92e0bea91244e19fe64019a863bc7c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('edf61b0df87a41af94f04569a3dcfecc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ee880a8f65904049a94af237d4d51853', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ef5383f91a75451fb3fe0cd9854006ab', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('efaaef70e2ac44db9eaca05765a24d88', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f06facbf4e5347fdb991fab522880545', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f0b8f2c5f1b4482bb54b6b797b86c5cc', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f146c3b5783f4fa08aaefd2adeb44d56', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f188c562b1284c6483655b7c16616733', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f18c48807e4f45e0883bb3adb775bff1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f20088d74b2442da99b8188c385949de', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f297c26405b545d499bea2c842bf792d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f2bc802150b94578814d5b5df113da35', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f2c2b2ee34354dc8b30e4a0ae8113f2c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f42d747e82f04835be959d7459b9e09e', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f46e1bd8fa8047cfb017447cf471c393', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f4a813d4dfeb4fca96eef8d6194006c0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f4c40e5792dd46e0ae0345d7fc63cde2', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f4eeade29a5b4adbab9792dbc01dee04', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f4f5382eace64f22864c96ed9bfaa7ce', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f5789b77d19d48baa6595ce5b1172eba', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f5aeb41280d948fdb06b679732905dfd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f609050359b747eaaa790fd4e2a96e57', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f65c84d0258b4df1b3750131227bdb2c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f6aae4f34c6445cfa057a7f55a3f0c2b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f726773dfd2d4d9487132bda426c60c4', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f73b38217df949d9a3334d6bd9977dde', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f7cb28f28a854fc0a432a2551bd0380b', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f7cfe59172e347908f8392e171a7cdea', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f8017fcfe8ff431886cedcd17fd1df09', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f82992eca1874e978ee1f9794004f602', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f83dccf234de411982b9703441e4e259', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f8605c9cd99d4cb48f64858d992ccb71', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f8607cb6c8134efe810bab8bcf92eb80', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f863ed59552247fc95cccb27655a91cd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f869337189c34f288b6d75664c86208c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f87f63d4ef8c436bbf6730c24f4a02c5', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f89f2761953749e6be88804f489c5f6f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f92f84dce35f4e32b2b4f61c9a58a55d', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f98a0dc9e8c442f68de3efed33acb3c0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('f9e4ecf0158d4ee9bf3404aa8d72e636', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fa235c2c46b041aeb9f170800c3090b8', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fa2403537603400ca528ff3b54ee62a0', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fa391b19b7d04adf93712f424ee1ce05', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fa577d109a2c44b79c54376a50a83722', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fa5a3f204a9e4bc8834f610f2e2cbc4c', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fa62a6b30d264ddb9885209d571621ff', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fa688b651b514587a4021bc638aa5b3f', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fa7b2fe4533f455991b1b9daf1d855a1', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fa9c57bb5f5042d49638acf072b01241', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('faedd3609c3b4434b00fab0faf2b1707', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fb0e6cca249e4d778d38c5e68983d4f6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fb557289ffd944309c1cf3c8805095ed', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fbd66c87fb91455cbacca1291ad4e711', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fc35b3ca304043efa92b90f225bb1484', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fc37987d1d5842fba34e18ff1febf805', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fd644edb0b6d4c60bf254594c0b91bf6', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fe3f5a27b45d409cb360c827e173b4ea', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('fe7799268dbc41db888de35ddab8c1cd', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ff1e59e23ef0451caaac5e547068bada', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ff2d33c85be0492cbc7e7d597d4f10ff', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ff9d68150aa541f694c35488396c1851', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);
INSERT INTO `wx_keyword` VALUES ('ffbec8790b254055a6ca7d1cdc59d4e3', '你喜欢的歌手是谁？你早餐喜欢吃什么？', '歌手，早餐', 0xE6AD8CE6898BE69C89E58898E5BEB7E58D8EE5BCA0E5ADA6E58F8BEFBC8CE697A9E9A490E5989BE5B0B1E698AFE99DA2E58C85E5928CE7899BE5A5B6E592AFEFBC8CE598BFE598BF);

-- ----------------------------
-- Table structure for `wx_location`
-- ----------------------------
DROP TABLE IF EXISTS `wx_location`;
CREATE TABLE `wx_location` (
  `ids` varchar(32) COLLATE utf8_bin NOT NULL,
  `open_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `lng` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `lat` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `bd09_lng` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `bd09_lat` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of wx_location
-- ----------------------------
INSERT INTO `wx_location` VALUES ('efb2705cf2954705bc852530a3153374', 'fromUser', '113.358803', '23.134521', '113.36532234852', '23.140328961348', '2014-11-19 10:33:52');

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
INSERT INTO `wx_message` VALUES ('14cf744fb52045968b46e3036889139e', '0', '0', 0x3C786D6C3E3C546F557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F546F557365724E616D653E3C46726F6D557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F46726F6D557365724E616D653E3C43726561746554696D653E313334383833313836303C2F43726561746554696D653E3C4D7367547970653E3C215B43444154415B696D6167655D5D3E3C2F4D7367547970653E3C50696355726C3E3C215B43444154415B7468697320697320612075726C5D5D3E3C2F50696355726C3E3C4D6564696149643E3C215B43444154415B6D656469615F69645D5D3E3C2F4D6564696149643E3C4D736749643E313233343536373839303132333435363C2F4D736749643E3C2F786D6C3E, '2014-11-19 10:17:16', 'image', null, null, 'toUser', 'fromUser', '1348831860', null, 'this is a url', 'media_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('2fb08eb1337f401f8b4e8602b68e0976', '1', '0', 0x3C786D6C3E0A20203C546F557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F546F557365724E616D653E0A20203C46726F6D557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F46726F6D557365724E616D653E0A20203C43726561746554696D653E3C215B43444154415B313431363336343433313531355D5D3E3C2F43726561746554696D653E0A20203C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E0A20203C436F6E74656E743E3C215B43444154415B5BE68489E5BFAB5DE68890E58A9FE68EA5E694B6E682A8E79A84E4BD8DE7BDAEEFBC810A0AE682A8E58FAFE4BBA5E8BE93E585A5E6909CE7B4A2E585B3E994AEE8AF8DE88EB7E58F96E591A8E8BEB9E4BFA1E681AFE4BA86EFBC8CE4BE8BE5A682EFBC9A0A2020202020202020E99984E8BF9141544D0A2020202020202020E99984E8BF914B54560A2020202020202020E99984E8BF91E58E95E689800AE5BF85E9A1BBE4BBA5E2809CE99984E8BF91E2809DE4B8A4E4B8AAE5AD97E5BC80E5A4B4EFBC815D5D3E3C2F436F6E74656E743E0A3C2F786D6C3E, '2014-11-19 10:33:52', 'text', null, null, 'fromUser', 'toUser', '1416364431515', null, null, null, null, null, null, null, null, null, null, 0x5BE68489E5BFAB5DE68890E58A9FE68EA5E694B6E682A8E79A84E4BD8DE7BDAEEFBC810A0AE682A8E58FAFE4BBA5E8BE93E585A5E6909CE7B4A2E585B3E994AEE8AF8DE88EB7E58F96E591A8E8BEB9E4BFA1E681AFE4BA86EFBC8CE4BE8BE5A682EFBC9A0A2020202020202020E99984E8BF9141544D0A2020202020202020E99984E8BF914B54560A2020202020202020E99984E8BF91E58E95E689800AE5BF85E9A1BBE4BBA5E2809CE99984E8BF91E2809DE4B8A4E4B8AAE5AD97E5BC80E5A4B4EFBC81, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('37b17020129148109c29a0a83b27e278', '0', '0', 0x3C786D6C3E3C546F557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F546F557365724E616D653E3C46726F6D557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F46726F6D557365724E616D653E3C43726561746554696D653E313335373239303931333C2F43726561746554696D653E3C4D7367547970653E3C215B43444154415B766F6963655D5D3E3C2F4D7367547970653E3C4D6564696149643E3C215B43444154415B6D656469615F69645D5D3E3C2F4D6564696149643E3C466F726D61743E3C215B43444154415B466F726D61745D5D3E3C2F466F726D61743E3C4D736749643E313233343536373839303132333435363C2F4D736749643E3C2F786D6C3E, '2014-11-19 10:21:28', 'voice', null, null, 'toUser', 'fromUser', '1357290913', null, null, 'media_id', null, null, null, null, null, null, null, null, null, 'Format', null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('3e89a26ac15b4ffb9b846cd167486bc1', '1', '0', 0x3C786D6C3E0A20203C546F557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F546F557365724E616D653E0A20203C46726F6D557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F46726F6D557365724E616D653E0A20203C43726561746554696D653E3C215B43444154415B313431363336323631313035305D5D3E3C2F43726561746554696D653E0A20203C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E0A20203C436F6E74656E743E3C215B43444154415BE69687E69CACE6B688E681AF5D5D3E3C2F436F6E74656E743E0A3C2F786D6C3E, '2014-11-19 10:03:46', 'text', null, null, 'fromUser', 'toUser', '1416362611050', null, null, null, null, null, null, null, null, null, null, 0xE69687E69CACE6B688E681AF, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('54ea143411de4dbd9a21b2870b08bfd9', '1', '0', 0x3C6C6974746C652E616E742E77656978696E2E626F2E6D6573736167652E526573706F6E73654D7367546578743E0A20203C546F557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F546F557365724E616D653E0A20203C46726F6D557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F46726F6D557365724E616D653E0A20203C43726561746554696D653E3C215B43444154415B313431363336313536333338315D5D3E3C2F43726561746554696D653E0A20203C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E0A20203C436F6E74656E743E3C215B43444154415BE69687E69CACE6B688E681AF5D5D3E3C2F436F6E74656E743E0A3C2F6C6974746C652E616E742E77656978696E2E626F2E6D6573736167652E526573706F6E73654D7367546578743E, '2014-11-19 09:46:09', 'text', null, null, 'fromUser', 'toUser', '1416361563381', null, null, null, null, null, null, null, null, null, null, 0xE69687E69CACE6B688E681AF, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('6b461d63bbcc4c00b8846552c4e1f329', '1', '0', 0x3C786D6C3E0A20203C546F557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F546F557365724E616D653E0A20203C46726F6D557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F46726F6D557365724E616D653E0A20203C43726561746554696D653E3C215B43444154415B313431363336353338373235335D5D3E3C2F43726561746554696D653E0A20203C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E0A20203C436F6E74656E743E3C215B43444154415BE682A8E782B9E587BBE79A84E595A5E993BEE68EA5E591A2EFBC9F5D5D3E3C2F436F6E74656E743E0A3C2F786D6C3E, '2014-11-19 10:49:47', 'text', null, null, 'fromUser', 'toUser', '1416365387253', null, null, null, null, null, null, null, null, null, null, 0xE682A8E782B9E587BBE79A84E595A5E993BEE68EA5E591A2EFBC9F, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('72b9ae005ea64451a763067b6e49a34b', '1', '0', 0x3C786D6C3E0A20203C546F557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F546F557365724E616D653E0A20203C46726F6D557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F46726F6D557365724E616D653E0A20203C43726561746554696D653E3C215B43444154415B313431363336333639323331305D5D3E3C2F43726561746554696D653E0A20203C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E0A20203C436F6E74656E743E3C215B43444154415B5D5D3E3C2F436F6E74656E743E0A3C2F786D6C3E, '2014-11-19 10:21:34', 'text', null, null, 'fromUser', 'toUser', '1416363692310', null, null, null, null, null, null, null, null, null, null, '', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('76e2eca7b7fe403bbde2648d00a7fba0', '0', '0', 0x3C786D6C3E3C546F557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F546F557365724E616D653E3C46726F6D557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F46726F6D557365724E616D653E3C43726561746554696D653E313335313737363336303C2F43726561746554696D653E3C4D7367547970653E3C215B43444154415B6C6F636174696F6E5D5D3E3C2F4D7367547970653E3C4C6F636174696F6E5F583E32332E3133343532313C2F4C6F636174696F6E5F583E3C4C6F636174696F6E5F593E3131332E3335383830333C2F4C6F636174696F6E5F593E3C5363616C653E32303C2F5363616C653E3C4C6162656C3E3C215B43444154415BE4BD8DE7BDAEE4BFA1E681AF5D5D3E3C2F4C6162656C3E3C4D736749643E313233343536373839303132333435363C2F4D736749643E3C2F786D6C3E20, '2014-11-19 10:33:45', 'location', null, null, 'toUser', 'fromUser', '1351776360', null, null, null, null, null, null, '23.1345210000', '113.3588030000', '20', '位置信息', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('9a319aef0e5743fdb84d720e89c1b2f7', '0', '0', 0x3C786D6C3E3C546F557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F546F557365724E616D653E3C46726F6D557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F46726F6D557365724E616D653E3C43726561746554696D653E313335373239303931333C2F43726561746554696D653E3C4D7367547970653E3C215B43444154415B766964656F5D5D3E3C2F4D7367547970653E3C4D6564696149643E3C215B43444154415B6D656469615F69645D5D3E3C2F4D6564696149643E3C5468756D624D6564696149643E3C215B43444154415B7468756D625F6D656469615F69645D5D3E3C2F5468756D624D6564696149643E3C4D736749643E313233343536373839303132333435363C2F4D736749643E3C2F786D6C3E, '2014-11-19 10:27:01', 'video', null, null, 'toUser', 'fromUser', '1357290913', null, null, 'media_id', null, null, null, null, null, null, null, null, 'thumb_media_id', null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('a078c5fa1429467cbb8184f72be2e934', '1', '0', 0x3C786D6C3E0A20203C546F557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F546F557365724E616D653E0A20203C46726F6D557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F46726F6D557365724E616D653E0A20203C43726561746554696D653E3C215B43444154415B313431363336333839323634315D5D3E3C2F43726561746554696D653E0A20203C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E0A20203C436F6E74656E743E3C215B43444154415B5D5D3E3C2F436F6E74656E743E0A3C2F786D6C3E, '2014-11-19 10:24:53', 'text', null, null, 'fromUser', 'toUser', '1416363892641', null, null, null, null, null, null, null, null, null, null, '', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('a2b8ba473c184ad69c0297a2b4c5974a', '1', '0', 0x3C786D6C3E0A20203C546F557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F546F557365724E616D653E0A20203C46726F6D557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F46726F6D557365724E616D653E0A20203C43726561746554696D653E3C215B43444154415B313431363336333935393337305D5D3E3C2F43726561746554696D653E0A20203C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E0A20203C436F6E74656E743E3C215B43444154415BE59BBEE78987E5B7B2E7BB8FE694B6E588B0EFBC810A0AE591A8E8BEB9E6909CE7B4A2E4B8BAE682A8E79A84E587BAE8A18CE4BF9DE9A9BEE68AA4E888AAEFBC8CE4B8BAE682A8E68F90E4BE9BE4B893E4B89AE79A84E591A8E8BEB9E7949FE6B4BBE68C87E58D97EFBC8CE59B9EE5A48DE2809CE99984E8BF91E2809DE5BC80E5A78BE4BD93E9AA8CE590A7EFBC815D5D3E3C2F436F6E74656E743E0A3C2F786D6C3E, '2014-11-19 10:25:59', 'text', null, null, 'fromUser', 'toUser', '1416363959370', null, null, null, null, null, null, null, null, null, null, 0xE59BBEE78987E5B7B2E7BB8FE694B6E588B0EFBC810A0AE591A8E8BEB9E6909CE7B4A2E4B8BAE682A8E79A84E587BAE8A18CE4BF9DE9A9BEE68AA4E888AAEFBC8CE4B8BAE682A8E68F90E4BE9BE4B893E4B89AE79A84E591A8E8BEB9E7949FE6B4BBE68C87E58D97EFBC8CE59B9EE5A48DE2809CE99984E8BF91E2809DE5BC80E5A78BE4BD93E9AA8CE590A7EFBC81, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('a6de440190634c5384640ffb6c42ecbb', '1', '0', 0x3C786D6C3E0A20203C546F557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F546F557365724E616D653E0A20203C46726F6D557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F46726F6D557365724E616D653E0A20203C43726561746554696D653E3C215B43444154415B313431363336343032303734335D5D3E3C2F43726561746554696D653E0A20203C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E0A20203C436F6E74656E743E3C215B43444154415BE59BBEE78987E5B7B2E7BB8FE694B6E588B0EFBC810A0AE591A8E8BEB9E6909CE7B4A2E4B8BAE682A8E79A84E587BAE8A18CE4BF9DE9A9BEE68AA4E888AAEFBC8CE4B8BAE682A8E68F90E4BE9BE4B893E4B89AE79A84E591A8E8BEB9E7949FE6B4BBE68C87E58D97EFBC8CE59B9EE5A48DE2809CE99984E8BF91E2809DE5BC80E5A78BE4BD93E9AA8CE590A7EFBC815D5D3E3C2F436F6E74656E743E0A3C2F786D6C3E, '2014-11-19 10:27:01', 'text', null, null, 'fromUser', 'toUser', '1416364020743', null, null, null, null, null, null, null, null, null, null, 0xE59BBEE78987E5B7B2E7BB8FE694B6E588B0EFBC810A0AE591A8E8BEB9E6909CE7B4A2E4B8BAE682A8E79A84E587BAE8A18CE4BF9DE9A9BEE68AA4E888AAEFBC8CE4B8BAE682A8E68F90E4BE9BE4B893E4B89AE79A84E591A8E8BEB9E7949FE6B4BBE68C87E58D97EFBC8CE59B9EE5A48DE2809CE99984E8BF91E2809DE5BC80E5A78BE4BD93E9AA8CE590A7EFBC81, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('a85a47008da74094ad5218c4f7dfd027', '0', '0', 0x3C786D6C3E3C546F557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F546F557365724E616D653E3C46726F6D557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F46726F6D557365724E616D653E203C43726561746554696D653E313334383833313836303C2F43726561746554696D653E3C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E3C436F6E74656E743E3C215B43444154415B74686973206973206120746573745D5D3E3C2F436F6E74656E743E3C4D736749643E313233343536373839303132333435363C2F4D736749643E3C2F786D6C3E, '2014-11-19 10:03:26', 'text', null, null, 'toUser', 'fromUser', '1348831860', null, null, null, null, null, null, null, null, null, null, 0x7468697320697320612074657374, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('b0b0294b8e154f01b5fa24609141994b', '0', '0', 0x3C786D6C3E3C546F557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F546F557365724E616D653E3C46726F6D557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F46726F6D557365724E616D653E3C43726561746554696D653E313335313737363336303C2F43726561746554696D653E3C4D7367547970653E3C215B43444154415B6C696E6B5D5D3E3C2F4D7367547970653E3C5469746C653E3C215B43444154415BE585ACE4BC97E5B9B3E58FB0E5AE98E7BD91E993BEE68EA55D5D3E3C2F5469746C653E3C4465736372697074696F6E3E3C215B43444154415BE585ACE4BC97E5B9B3E58FB0E5AE98E7BD91E993BEE68EA55D5D3E3C2F4465736372697074696F6E3E3C55726C3E3C215B43444154415B75726C5D5D3E3C2F55726C3E3C4D736749643E313233343536373839303132333435363C2F4D736749643E3C2F786D6C3E20, '2014-11-19 10:49:47', 'link', null, null, 'toUser', 'fromUser', '1351776360', null, null, null, '公众平台官网链接', 0xE585ACE4BC97E5B9B3E58FB0E5AE98E7BD91E993BEE68EA5, 'url', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('b6bc978cebb3426aa2e3acb30761790a', '1', '0', 0x3C786D6C3E0A20203C546F557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F546F557365724E616D653E0A20203C46726F6D557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F46726F6D557365724E616D653E0A20203C43726561746554696D653E3C215B43444154415B313431363336333433363238325D5D3E3C2F43726561746554696D653E0A20203C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E0A20203C436F6E74656E743E3C215B43444154415BE59BBEE78987E5B7B2E7BB8FE694B6E588B0EFBC810A0AE591A8E8BEB9E6909CE7B4A2E4B8BAE682A8E79A84E587BAE8A18CE4BF9DE9A9BEE68AA4E888AAEFBC8CE4B8BAE682A8E68F90E4BE9BE4B893E4B89AE79A84E591A8E8BEB9E7949FE6B4BBE68C87E58D97EFBC8CE59B9EE5A48DE2809CE99984E8BF91E2809DE5BC80E5A78BE4BD93E9AA8CE590A7EFBC815D5D3E3C2F436F6E74656E743E0A3C2F786D6C3E, '2014-11-19 10:17:16', 'text', null, null, 'fromUser', 'toUser', '1416363436282', null, null, null, null, null, null, null, null, null, null, 0xE59BBEE78987E5B7B2E7BB8FE694B6E588B0EFBC810A0AE591A8E8BEB9E6909CE7B4A2E4B8BAE682A8E79A84E587BAE8A18CE4BF9DE9A9BEE68AA4E888AAEFBC8CE4B8BAE682A8E68F90E4BE9BE4B893E4B89AE79A84E591A8E8BEB9E7949FE6B4BBE68C87E58D97EFBC8CE59B9EE5A48DE2809CE99984E8BF91E2809DE5BC80E5A78BE4BD93E9AA8CE590A7EFBC81, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('b7d534c37d724f52bfe7f585a27c6dca', '0', '0', 0x3C786D6C3E3C546F557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F546F557365724E616D653E3C46726F6D557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F46726F6D557365724E616D653E203C43726561746554696D653E313334383833313836303C2F43726561746554696D653E3C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E3C436F6E74656E743E3C215B43444154415B74686973206973206120746573745D5D3E3C2F436F6E74656E743E3C4D736749643E313233343536373839303132333435363C2F4D736749643E3C2F786D6C3E, '2014-11-19 09:42:13', 'text', null, null, 'toUser', 'fromUser', '1348831860', null, null, null, null, null, null, null, null, null, null, 0x7468697320697320612074657374, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('c06460561178463196c12ea832a5ef74', '0', '0', 0x3C786D6C3E3C546F557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F546F557365724E616D653E3C46726F6D557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F46726F6D557365724E616D653E3C43726561746554696D653E313334383833313836303C2F43726561746554696D653E3C4D7367547970653E3C215B43444154415B696D6167655D5D3E3C2F4D7367547970653E3C50696355726C3E3C215B43444154415B7468697320697320612075726C5D5D3E3C2F50696355726C3E3C4D6564696149643E3C215B43444154415B6D656469615F69645D5D3E3C2F4D6564696149643E3C4D736749643E313233343536373839303132333435363C2F4D736749643E3C2F786D6C3E, '2014-11-19 10:16:09', 'image', null, null, 'toUser', 'fromUser', '1348831860', null, 'this is a url', 'media_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('c7649527bb904dec80157be85a61ab2d', '1', '0', 0x3C786D6C3E0A20203C546F557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F546F557365724E616D653E0A20203C46726F6D557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F46726F6D557365724E616D653E0A20203C43726561746554696D653E3C215B43444154415B313431363336333338383134345D5D3E3C2F43726561746554696D653E0A20203C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E0A20203C436F6E74656E743E3C215B43444154415BE59BBEE78987E5B7B2E7BB8FE694B6E588B0EFBC810A0AE591A8E8BEB9E6909CE7B4A2E4B8BAE682A8E79A84E587BAE8A18CE4BF9DE9A9BEE68AA4E888AAEFBC8CE4B8BAE682A8E68F90E4BE9BE4B893E4B89AE79A84E591A8E8BEB9E7949FE6B4BBE68C87E58D97EFBC8CE59B9EE5A48DE2809CE99984E8BF91E2809DE5BC80E5A78BE4BD93E9AA8CE590A7EFBC815D5D3E3C2F436F6E74656E743E0A3C2F786D6C3E, '2014-11-19 10:16:35', 'text', null, null, 'fromUser', 'toUser', '1416363388144', null, null, null, null, null, null, null, null, null, null, 0xE59BBEE78987E5B7B2E7BB8FE694B6E588B0EFBC810A0AE591A8E8BEB9E6909CE7B4A2E4B8BAE682A8E79A84E587BAE8A18CE4BF9DE9A9BEE68AA4E888AAEFBC8CE4B8BAE682A8E68F90E4BE9BE4B893E4B89AE79A84E591A8E8BEB9E7949FE6B4BBE68C87E58D97EFBC8CE59B9EE5A48DE2809CE99984E8BF91E2809DE5BC80E5A78BE4BD93E9AA8CE590A7EFBC81, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('e0eb722b51a944739b67f2b2245579fd', '1', '0', 0x3C6C6974746C652E616E742E77656978696E2E626F2E6D6573736167652E526573706F6E73654D7367546578743E0A20203C546F557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F546F557365724E616D653E0A20203C46726F6D557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F46726F6D557365724E616D653E0A20203C43726561746554696D653E3C215B43444154415B313431363336313333333130325D5D3E3C2F43726561746554696D653E0A20203C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E0A20203C436F6E74656E743E3C215B43444154415BE69687E69CACE6B688E681AF5D5D3E3C2F436F6E74656E743E0A3C2F6C6974746C652E616E742E77656978696E2E626F2E6D6573736167652E526573706F6E73654D7367546578743E, '2014-11-19 09:42:13', 'text', null, null, 'fromUser', 'toUser', '1416361333102', null, null, null, null, null, null, null, null, null, null, 0xE69687E69CACE6B688E681AF, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('ea33925a715b4366ad838ad27df16622', '0', '0', 0x3C786D6C3E3C546F557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F546F557365724E616D653E3C46726F6D557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F46726F6D557365724E616D653E203C43726561746554696D653E313334383833313836303C2F43726561746554696D653E3C4D7367547970653E3C215B43444154415B746578745D5D3E3C2F4D7367547970653E3C436F6E74656E743E3C215B43444154415B74686973206973206120746573745D5D3E3C2F436F6E74656E743E3C4D736749643E313233343536373839303132333435363C2F4D736749643E3C2F786D6C3E, '2014-11-19 09:45:55', 'text', null, null, 'toUser', 'fromUser', '1348831860', null, null, null, null, null, null, null, null, null, null, 0x7468697320697320612074657374, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('ee740ab7d09b40f4bb6d622cbb21465f', '0', '0', 0x3C786D6C3E3C546F557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F546F557365724E616D653E3C46726F6D557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F46726F6D557365724E616D653E3C43726561746554696D653E313335373239303931333C2F43726561746554696D653E3C4D7367547970653E3C215B43444154415B766964656F5D5D3E3C2F4D7367547970653E3C4D6564696149643E3C215B43444154415B6D656469615F69645D5D3E3C2F4D6564696149643E3C5468756D624D6564696149643E3C215B43444154415B7468756D625F6D656469615F69645D5D3E3C2F5468756D624D6564696149643E3C4D736749643E313233343536373839303132333435363C2F4D736749643E3C2F786D6C3E, '2014-11-19 10:25:59', 'video', null, null, 'toUser', 'fromUser', '1357290913', null, null, 'media_id', null, null, null, null, null, null, null, null, 'thumb_media_id', null, null, null, null, null, null, null, null, null);
INSERT INTO `wx_message` VALUES ('f69902983f9a4f158699a00b08618bdd', '0', '0', 0x3C786D6C3E3C546F557365724E616D653E3C215B43444154415B746F557365725D5D3E3C2F546F557365724E616D653E3C46726F6D557365724E616D653E3C215B43444154415B66726F6D557365725D5D3E3C2F46726F6D557365724E616D653E3C43726561746554696D653E313335373239303931333C2F43726561746554696D653E3C4D7367547970653E3C215B43444154415B766F6963655D5D3E3C2F4D7367547970653E3C4D6564696149643E3C215B43444154415B6D656469615F69645D5D3E3C2F4D6564696149643E3C466F726D61743E3C215B43444154415B466F726D61745D5D3E3C2F466F726D61743E3C4D736749643E313233343536373839303132333435363C2F4D736749643E3C2F786D6C3E, '2014-11-19 10:24:53', 'voice', null, null, 'toUser', 'fromUser', '1357290913', null, null, 'media_id', null, null, null, null, null, null, null, null, null, 'Format', null, null, null, null, null, null, null, null);

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
