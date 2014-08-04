/*
Navicat PGSQL Data Transfer

Source Server         : localhost-pg
Source Server Version : 90303
Source Host           : localhost:5432
Source Database       : jfinaluib
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90303
File Encoding         : 65001

Date: 2014-08-04 20:54:06
*/


-- ----------------------------
-- Table structure for "public"."pt_department"
-- ----------------------------
DROP TABLE "public"."pt_department";
CREATE TABLE "public"."pt_department" (
"ids" varchar(32) NOT NULL,
"version" int8,
"allchildnodeids" varchar(2000),
"departmentlevel" int8,
"depttype" char(1),
"description" varchar(200),
"images" varchar(50),
"isparent" varchar(5),
"names" varchar(25),
"orderids" int8,
"url" varchar(100),
"parentdepartmentids" varchar(32),
"principaluserids" varchar(32)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_department
-- ----------------------------
INSERT INTO "public"."pt_department" VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', null, '-1', null, '根节点', '1_open.png', 'true', '公司部门组织结构', '1', '#', null, null);
INSERT INTO "public"."pt_department" VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', null, '0', null, '系统平台部', '2.png', 'true', '系统平台部', '0', null, '8a40c0353fa828a6013fa898d4ac0026', null);
INSERT INTO "public"."pt_department" VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', null, '0', null, '运维部', '3.png', 'false', '运维部', '0', null, '8a40c0353fa828a6013fa898d4ac0027', '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_department" VALUES ('8a40c0353fa828a6013fa898d4ac0029', '0', null, '0', null, '测试账户', '4.png', 'true', '测试部门', '0', null, '8a40c0353fa828a6013fa898d4ac0026', null);
INSERT INTO "public"."pt_department" VALUES ('8a40c0353fa828a6013fa898d4ac0030', '0', null, '0', null, '子部门2', '5.png', 'false', '平台组', '0', null, '8a40c0353fa828a6013fa898d4ac0029', '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_department" VALUES ('b7dd88dc96a748d0a11b52fb56ee5d68', '0', null, null, null, null, '2.png', 'false', '实施组', '2', null, '8a40c0353fa828a6013fa898d4ac0029', null);

-- ----------------------------
-- Table structure for "public"."pt_dict"
-- ----------------------------
DROP TABLE "public"."pt_dict";
CREATE TABLE "public"."pt_dict" (
"ids" varchar(32) NOT NULL,
"version" int8,
"description" varchar(200),
"images" varchar(50),
"names" varchar(25),
"orderids" int8,
"paths" varchar(1000),
"zhuangtai" char(1),
"parentids" varchar(32),
"isparent" varchar(5),
"levels" int8,
"numbers" varchar(50),
"val" varchar(500),
"i18n" char(1),
"val_zhcn" varchar(500),
"val_zhhk" varchar(500),
"val_zhtw" varchar(500),
"val_jp" varchar(500),
"val_enus" varchar(500)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_dict
-- ----------------------------
INSERT INTO "public"."pt_dict" VALUES ('0c78f87750a745bbb59005a6ca0f744a', '0', null, '3.png', 'weixinToken', '3', '100103root/83f4b0ee56904cbeb5f91696ad804c29/0c78f87750a745bbb59005a6ca0f744a', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinToken', '123', null, null, null, null, null, null);
INSERT INTO "public"."pt_dict" VALUES ('7381008292054bccba20224bc33774d7', '0', null, '2.png', 'weixinAppID', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29/7381008292054bccba20224bc33774d7', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppID', '123', null, null, null, null, null, null);
INSERT INTO "public"."pt_dict" VALUES ('8094c60d7a594b36bb0187cbce9c4188', '0', null, '2.png', 'weixinAppSecret', '2', '100103root/83f4b0ee56904cbeb5f91696ad804c29/8094c60d7a594b36bb0187cbce9c4188', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppSecret', '123', null, null, null, null, null, null);
INSERT INTO "public"."pt_dict" VALUES ('83f4b0ee56904cbeb5f91696ad804c29', '2', null, '2.png', '微信配置', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29', null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', '12345', null, null, '12345', '12345', '12345', 'こんにちは', '12345');
INSERT INTO "public"."pt_dict" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '字典树', '1_open.png', '字典树', '1', '100103root', '1', null, 'true', '0', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for "public"."pt_group"
-- ----------------------------
DROP TABLE "public"."pt_group";
CREATE TABLE "public"."pt_group" (
"ids" varchar(32) NOT NULL,
"version" int8,
"description" varchar(200),
"names" varchar(25),
"roleids" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_group
-- ----------------------------
INSERT INTO "public"."pt_group" VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', '系统管理员组', '系统管理员', '8a40c0353fa828a6013fa898d4ac0023,');

-- ----------------------------
-- Table structure for "public"."pt_menu"
-- ----------------------------
DROP TABLE "public"."pt_menu";
CREATE TABLE "public"."pt_menu" (
"ids" varchar(32) NOT NULL,
"version" int8,
"images" varchar(50),
"levels" int8,
"names_zhcn" varchar(25),
"orderids" int8,
"operatorids" varchar(32),
"parentmenuids" varchar(32),
"systemsids" varchar(32),
"isparent" varchar(5),
"names_zhtw" varchar(25),
"names_zhhk" varchar(25),
"names_jp" varchar(25),
"names_enus" varchar(25)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_menu
-- ----------------------------
INSERT INTO "public"."pt_menu" VALUES ('017173f642e545b8a7b02fc6f5246b2f', '0', '2.png', null, '用户管理', '2', 'dfe9d74fe0ef4220bfcfe6d7bb2f9436', '625f1e0e951a4199a7262e064512e2c7', null, 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('294ab73cc8274f1fa0663bf9c1bbe4d4', '0', '2.png', null, '配置项', '3', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('297e0cf944f8cce70144f8dce1540069', '0', '8.png', '0', '字典', '8', '8897dbe85b3e4e6989d662495272cf26', '294ab73cc8274f1fa0663bf9c1bbe4d4', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('3ffaf784ef95497b803d7a9f43c9e7a8', '0', '5.png', null, '自动回复', '5', '0773a58c4bdb4858ab062c4a2a4da69a', '625f1e0e951a4199a7262e064512e2c7', null, 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('4600e755ec5f4dc6a5783a4d097a42f2', '0', '4.png', null, '位置管理', '4', '420d8ebc68ad44dc8188d4c27dc585d1', '625f1e0e951a4199a7262e064512e2c7', null, 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('4bae83d582744c928cb8c8f419586a31', '0', '2.png', null, '用户权限', '1', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('5f1b30bcc40e4619a2914bbcb98bf1b2', '0', '3.png', null, 'Log4j', '3', '721f7255449c445faf36607c254eea06', 'ed90c7b40be74552bbfa7ac58efdc5fe', null, 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('625f1e0e951a4199a7262e064512e2c7', '0', '5.png', null, '微信管理', '5', null, '8a40c0353fa828a6013fa898d4ac1100', null, 'true', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '3.png', '-1', '后台菜单组织结构', '1', null, null, '8a40c0353fa828a6013fa898d4ac0020', 'true', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0021', '0', '3.png', '2', '用户', '1', '91baed789bc14efdbebb10b49c69ee5b', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0022', '0', '3.png', '2', '分组', '2', '1b0d7476974e4bf9b52f75fb82f87330', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '3.png', '2', '角色', '3', '7ae62737df444d619f8fd376360d160c', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0024', '0', '3.png', '2', '系统', '5', '7eab5f800bab4efb8df1b2e8a0575f73', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0025', '0', '3.png', '2', '功能', '6', '0da15c49299d41a4b720f787d053e3cb', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '8.png', '2', '岗位', '4', '233356b63d8e477fb6e948b703232809', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', '3.png', '2', '部门', '7', 'ad09a1b897744812875c752c2d70f11a', 'a5bf1c38a2ea4b6085d15b830cb80518', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac1100', '0', '3.png', '-1', '后台菜单组织结构', '1', null, null, 'd3a5c976c4c24751b6b00ec775692683', 'true', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac2200', '0', '3.png', '-1', '后台菜单组织结构', '1', null, null, '0c1230c98ef34e58947903fab5a4fa85', 'true', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('a5bf1c38a2ea4b6085d15b830cb80518', '0', '2.png', null, '组织机构', '2', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('aa2b382e85b348e6a9cd0cb967ff4006', '0', '3.png', null, '消息管理', '3', null, '625f1e0e951a4199a7262e064512e2c7', null, 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('bd5d741147f74a058a03bbb5164f392b', '0', '2.png', null, '数据源', '9', 'd496b161d2564111992687b948862244', 'ed90c7b40be74552bbfa7ac58efdc5fe', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('ed30f3cd2e9f4e0aa0b950c147035b67', '0', '2.png', null, '分组管理', '2', '2c91467f905a4f5ba9f52830131c8ad9', '625f1e0e951a4199a7262e064512e2c7', null, 'false', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('ed90c7b40be74552bbfa7ac58efdc5fe', '0', '2.png', null, '系统维护', '2', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'true', null, null, null, null);
INSERT INTO "public"."pt_menu" VALUES ('f353e484ce074b86b0210f66346d9a80', '0', '9.png', null, '日志', '10', '235d855d7b914d728e434f0f309aa04d', 'ed90c7b40be74552bbfa7ac58efdc5fe', '8a40c0353fa828a6013fa898d4ac0020', 'false', null, null, null, null);

-- ----------------------------
-- Table structure for "public"."pt_module"
-- ----------------------------
DROP TABLE "public"."pt_module";
CREATE TABLE "public"."pt_module" (
"ids" varchar(32) NOT NULL,
"version" int8,
"description" varchar(200),
"images" varchar(50),
"isparent" varchar(5),
"names" varchar(25),
"orderids" int8,
"parentmoduleids" varchar(32),
"systemsids" varchar(32)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_module
-- ----------------------------
INSERT INTO "public"."pt_module" VALUES ('297e0cf944e9762e0144e97dfd6e00c9', '0', '数据源', '2.png', 'true', '数据源', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('417ed3d3cf4d4b7a939613829e8db17d', '0', null, '3.png', 'true', '消息管理', '3', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "public"."pt_module" VALUES ('529d39f773a54ff39eea877f606d74b0', '0', null, '2.png', 'true', 'Ueditor', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('7a35846a305c42abb68601b4f7347289', '0', null, '4.png', 'true', '主页管理', '4', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '根节点', '3.png', 'true', '根节点', '1', null, '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0021', '0', '后台登陆', '8.png', 'true', '登陆', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0022', '0', '字典', '2.png', 'true', '字典', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '用户分组管理', '2.png', 'true', '分组', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0024', '0', '角色管理', '2.png', 'true', '角色', '3', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0025', '0', '岗位管理', '5.png', 'true', '岗位', '4', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '系统管理', '5.png', 'true', '系统', '5', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', '功能管理', '7.png', 'true', '功能', '6', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', '部门管理', '3.png', 'true', '部门', '7', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0029', '0', '日志管理', '6.png', 'true', '日志', '11', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0030', '0', '用户管理', '3.png', 'true', '用户', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0031', '0', '公共功能', '5.png', 'true', '公共', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0032', '0', '菜单管理', '8.png', 'true', '菜单', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac0033', '0', '模块管理', '7.png', 'true', '模块', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac1100', '0', '根节点', '3.png', 'true', '根节点', '1', null, 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "public"."pt_module" VALUES ('8a40c0353fa828a6013fa898d4ac2200', '0', '根节点', '3.png', 'true', '根节点', '1', null, '0c1230c98ef34e58947903fab5a4fa85');
INSERT INTO "public"."pt_module" VALUES ('8f53706d4af541588bde334d99d44727', '0', null, '6.png', 'true', '自动回复', '6', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "public"."pt_module" VALUES ('c4e63c4171db4ae2a83f7dfcc2656b0e', '0', null, '2.png', 'true', '用户管理', '2', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "public"."pt_module" VALUES ('c87c35097a2d4bc898fe6e9b1e280a3d', '0', null, '5.png', 'true', '位置管理', '5', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "public"."pt_module" VALUES ('e6eb0165223447218410f867a9614300', '0', null, '2.png', 'true', '分组管理', '2', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "public"."pt_module" VALUES ('f85f516c0b86439087d48a45173ba0e7', '0', null, '2.png', 'true', 'Log4j', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');

-- ----------------------------
-- Table structure for "public"."pt_operator"
-- ----------------------------
DROP TABLE "public"."pt_operator";
CREATE TABLE "public"."pt_operator" (
"ids" varchar(32) NOT NULL,
"version" int8,
"description" varchar(200),
"names" varchar(25),
"onemany" char(1),
"returnparamkeys" varchar(100),
"returnurl" varchar(200),
"rowfilter" char(1),
"url" varchar(200),
"moduleids" varchar(32),
"splitpage" char(1),
"formtoken" char(1),
"ipblack" char(1),
"privilege" char(1),
"ispv" char(1),
"pvtype" char(1),
"modulenames" varchar(50)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_operator
-- ----------------------------
INSERT INTO "public"."pt_operator" VALUES ('01aa0c85c8b84ae8aca7f5484336b203', '0', null, '保存', null, null, null, '0', '/jf/dict/save', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('05114c0cbe1f4c2095b3216f13cfb681', '0', null, '保存', null, null, null, '0', '/jf/wx/keyword/save', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "public"."pt_operator" VALUES ('053d330462e1459ca1012c9d29113bc4', '0', null, '获取部门负责人', null, null, null, '0', '/jf/dept/getPrincipal', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "public"."pt_operator" VALUES ('0773a58c4bdb4858ab062c4a2a4da69a', '0', null, '默认主页', null, null, null, '0', '/jf/wx/keyword', '8f53706d4af541588bde334d99d44727', '1', '0', '0', '1', null, null, '自动回复');
INSERT INTO "public"."pt_operator" VALUES ('091855dd809b418fae88a7fec6d9f246', '0', null, '准备更新', null, null, null, '0', '/jf/dict/edit', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('09b6ce29313c4051ba765de516a9b283', '0', null, 'treeData', null, null, null, '0', '/jf/station/treeData', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "public"."pt_operator" VALUES ('0da15c49299d41a4b720f787d053e3cb', '0', null, '默认列表', null, null, null, '0', '/jf/operator', '8a40c0353fa828a6013fa898d4ac0027', '1', '0', '0', '1', null, null, '功能');
INSERT INTO "public"."pt_operator" VALUES ('0fb7938c7d614fc389568eb67b442303', '0', null, '单选', null, null, null, '0', '/pingtai/module/radio.html', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "public"."pt_operator" VALUES ('1046389d8525451697f2793185e7d6ee', '0', null, '更新', null, null, null, '0', '/jf/dept/update', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "public"."pt_operator" VALUES ('10499bc7f9cb4adf99beba00343b4ea6', '0', null, '获取菜单功能', null, null, null, '0', '/jf/menu/getOperator', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "public"."pt_operator" VALUES ('12141c1c3be241ca8a868bce9cd610d5', '0', null, '准备添加', null, null, null, '0', '/pingtai/dict/add.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('15566e63f3104c73b4a0b4a784dd11ca', '0', null, '保存', null, null, null, '0', '/jf/role/save', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "public"."pt_operator" VALUES ('1a8b4d8e4411412fa8bb561393563a85', '0', null, '准备添加', null, null, null, '0', '/pingtai/user/add.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('1b0d7476974e4bf9b52f75fb82f87330', '0', null, '分组默认列表', null, null, null, '0', '/jf/group', '8a40c0353fa828a6013fa898d4ac0023', '1', '0', '0', '1', null, null, '分组');
INSERT INTO "public"."pt_operator" VALUES ('1b1a809815574b2a9c1d0e18d692de17', '0', null, '更新', null, null, null, '0', '/jf/operator/update', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "public"."pt_operator" VALUES ('21141da4febe4c929abe37126b37fd12', '0', null, '多选', null, null, null, '0', '/pingtai/station/checkbox.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "public"."pt_operator" VALUES ('21b0a910ef6e4c60a325d5e57e6e6f65', '0', null, '单选', null, null, null, '0', '/pingtai/dict/radio.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('22926eb196a14b48be775f4880b5ba94', '0', null, '保存', null, null, null, '0', '/jf/group/save', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "public"."pt_operator" VALUES ('233356b63d8e477fb6e948b703232809', '0', null, '默认树', null, null, null, '0', '/jf/station', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "public"."pt_operator" VALUES ('235d855d7b914d728e434f0f309aa04d', '0', null, '默认列表', null, null, null, '0', '/jf/sysLog', '8a40c0353fa828a6013fa898d4ac0029', '1', '0', '0', '1', null, null, '日志');
INSERT INTO "public"."pt_operator" VALUES ('29c18b3394924c30882da049da14ad99', '0', null, '更新', null, null, null, '0', '/jf/role/update', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "public"."pt_operator" VALUES ('2be34991827e4e8da8e92f9b9e8bce25', '0', null, 'treeTableSub', null, null, null, '0', '/jf/dict/treeTable', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('2c91467f905a4f5ba9f52830131c8ad9', '0', null, '默认分组列表', null, null, null, '0', '/jf/wx/group', 'e6eb0165223447218410f867a9614300', '1', '0', '0', '1', null, null, '分组管理');
INSERT INTO "public"."pt_operator" VALUES ('2fbbc9cfb0bf4b5bb504ead155c3423c', '0', null, '保存', null, null, null, '0', '/jf/station/save', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "public"."pt_operator" VALUES ('2fee901117c64e18873f60e8f800713d', '0', null, '单选', null, null, null, '0', '/pingtai/station/radio.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "public"."pt_operator" VALUES ('32a3e59964204a3c8848e84b864306ae', '0', null, '删除', null, null, null, '0', '/jf/systems/delete', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO "public"."pt_operator" VALUES ('335d1f8f46eb47a18001889f8cc21348', '0', null, '删除', null, null, null, '0', '/jf/role/delete', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "public"."pt_operator" VALUES ('362cf247241c4d12b6242301e4a73516', '0', null, '删除', null, null, null, '0', '/jf/station/delete', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "public"."pt_operator" VALUES ('37218fb52ec94fb4bf76209a17916094', '0', null, '默认树', null, null, null, '0', '/jf/module', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "public"."pt_operator" VALUES ('3dd486cd58da467dbd83ae420db14815', '0', null, '准备添加', null, null, null, '0', '/weiXin/keyword/add.html', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "public"."pt_operator" VALUES ('3ee5f986289d4a1990f4e42c9a0caadb', '0', null, '准备添加', null, null, null, '0', '/pingtai/group/add.html', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "public"."pt_operator" VALUES ('420d8ebc68ad44dc8188d4c27dc585d1', '0', null, '位置默认列表', null, null, null, '0', '/jf/wx/location', 'c87c35097a2d4bc898fe6e9b1e280a3d', '1', '0', '0', '1', null, null, '位置管理');
INSERT INTO "public"."pt_operator" VALUES ('423e8c2e2a644bbda0803f46ea8f31e2', '0', null, '准备国际化编辑', null, null, null, '0', '/jf/menu/toEdit', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "public"."pt_operator" VALUES ('4376888fd74f4247a926529e5da03442', '0', null, 'treeData', null, null, null, '0', '/jf/user/treeData', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('437e05d09dd94720b67c4f230cdebe58', '0', null, '更新', null, null, null, '0', '/jf/module/update', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "public"."pt_operator" VALUES ('46e00ef0fd234e9dbf68ed9bbb437d0f', '0', null, '多选', null, null, null, '0', '/pingtai/department/checkbox.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "public"."pt_operator" VALUES ('481d4d5c0a634c4085c72c990260e58d', '0', null, '微信管理主页', null, null, null, '0', '/jf/wx/index/content', '7a35846a305c42abb68601b4f7347289', '0', '0', '0', '1', null, null, '主页管理');
INSERT INTO "public"."pt_operator" VALUES ('48db51f20b504c4ab489b1dcfd3ecbd9', '0', null, '密码变更', null, null, null, '0', '/pingtai/user/passChange.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('4a6544ae7a2548ad81c0e3994999023c', '0', null, '准备设置菜单功能', null, null, null, '0', '/pingtai/menu/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "public"."pt_operator" VALUES ('4df80521e66447618796c3cfe02bf239', '0', null, '默认treeTable', null, null, null, '0', '/jf/dict', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('5148ea207b974ee197f0bc57060ab1ad', '0', null, '删除', null, null, null, '0', '/jf/wx/location/delete', 'c87c35097a2d4bc898fe6e9b1e280a3d', '0', '0', '0', '1', null, null, '位置管理');
INSERT INTO "public"."pt_operator" VALUES ('58a85040aa9f40cca0bdba6e23e30363', '0', null, '保存', null, null, null, '0', '/jf/dept/save', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "public"."pt_operator" VALUES ('5b249ad344d948b99f58768c323f5f71', '0', null, '准备添加', null, null, null, '0', '/pingtai/systems/add.html', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO "public"."pt_operator" VALUES ('5c2bdc059ae24ffda2758a2781bb46da', '0', null, 'log4jServlet', null, null, null, '0', '/se/log4j', 'f85f516c0b86439087d48a45173ba0e7', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO "public"."pt_operator" VALUES ('5fcac107c80d493d91b53a815d4b297a', '0', null, '保存', null, null, null, '0', '/jf/user/save', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('6324ff9e83654aa0bf7f9d918b636b55', '0', null, '查看字典', null, null, null, '0', '/jf/dict/view', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('6566adb7fc6347e7b01a3c47129b5eb5', '0', null, 'ueditor', null, null, null, '0', '/jf/ueditor', '529d39f773a54ff39eea877f606d74b0', '0', '0', '0', '1', null, null, 'Ueditor');
INSERT INTO "public"."pt_operator" VALUES ('6569e0d9f2cd4e3a97af4e1b0cd8d2f7', '0', null, '删除', null, null, null, '0', '/jf/dict/delete', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('6b527ed138c343a89ddf73cf16fef565', '0', null, '更新', null, null, null, '0', '/jf/wx/keyword/update', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "public"."pt_operator" VALUES ('6daed51284f94923b1c8a6414e646959', '0', null, 'treeData', null, null, null, '0', '/jf/operator/treeData', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "public"."pt_operator" VALUES ('721f7255449c445faf36607c254eea06', '0', null, 'iframe', null, null, null, '0', '/pingtai/log4j/iframe.html', 'f85f516c0b86439087d48a45173ba0e7', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO "public"."pt_operator" VALUES ('74aa20442105408d90f9e6469a3a92b5', '0', null, 'treeTableIframe', null, null, null, '0', '/pingtai/dict/treeTableIframe.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('77823e12391a47729a1f82a00bc15c5b', '0', null, '准备更新', null, null, null, '0', '/jf/wx/keyword/edit', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "public"."pt_operator" VALUES ('78c6026c6af44b41a6bef4cdb4cfb414', '0', null, '获取角色功能', null, null, null, '0', '/jf/role/getOperator', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "public"."pt_operator" VALUES ('79039a2260da46b0aabb5a62e8db6c87', '0', null, '查看', null, null, null, '0', '/jf/user/view', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('7ae62737df444d619f8fd376360d160c', '0', null, '默认列表', null, null, null, '0', '/jf/role', '8a40c0353fa828a6013fa898d4ac0024', '1', '0', '0', '1', null, null, '角色');
INSERT INTO "public"."pt_operator" VALUES ('7b4281dd247c4624bee0d8f84c2c2715', '0', null, '保存', null, null, null, '0', '/jf/systems/save', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO "public"."pt_operator" VALUES ('7cc12b5c154a4a9782c518c57e8ab3aa', '0', null, '准备更新', null, null, null, '0', '/jf/role/edit', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "public"."pt_operator" VALUES ('7eab5f800bab4efb8df1b2e8a0575f73', '0', null, '默认列表', null, null, null, '0', '/jf/systems', '8a40c0353fa828a6013fa898d4ac0026', '1', '0', '0', '1', null, null, '系统');
INSERT INTO "public"."pt_operator" VALUES ('7ed5eefbbf3d4aa78d0c5b99f3b7010c', '0', null, '登陆验证', null, null, null, '0', '/jf/login/vali', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO "public"."pt_operator" VALUES ('827a7067a28d442da3ddd834677127af', '0', null, '国际化编辑', null, null, null, '0', '/jf/menu/edit', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "public"."pt_operator" VALUES ('83ef85fd17804bb195d0ad3c07f88c30', '0', null, '准备更新', null, null, null, '0', '/jf/operator/edit', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "public"."pt_operator" VALUES ('886bd497064b4c9f87d8461ebba421d1', '0', null, '首页', null, null, null, '0', '/jf/index', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO "public"."pt_operator" VALUES ('8897dbe85b3e4e6989d662495272cf26', '0', null, 'Iframe', null, null, null, '0', '/pingtai/dict/treeTableIframe.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('8bd9c0e14df941cdaf6253cd08dbd9cd', '0', null, '准备更新', null, null, null, '0', '/jf/systems/edit', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO "public"."pt_operator" VALUES ('8ca8af501522439d8c9249e00db5d78d', '0', null, '查看', null, null, null, '0', '/jf/sysLog/view', '8a40c0353fa828a6013fa898d4ac0029', '0', '0', '0', '1', null, null, '日志');
INSERT INTO "public"."pt_operator" VALUES ('8f79857b31d4475a94c712e997e89c99', '0', null, '更新', null, null, null, '0', '/jf/dict/update', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('910955c2192a418995eeab8bf15372e9', '0', null, '准备添加', null, null, null, '0', '/pingtai/operator/add.html', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "public"."pt_operator" VALUES ('91baed789bc14efdbebb10b49c69ee5b', '0', null, '默认主页列表', null, null, null, '0', '/jf/user', '8a40c0353fa828a6013fa898d4ac0030', '1', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('9765e6bb76eb40ab800cb8954822190e', '0', null, '删除', null, null, null, '0', '/jf/wx/keyword/delete', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "public"."pt_operator" VALUES ('9a708f39e123455e84b6125774bab1ea', '0', null, 'treeData', null, null, null, '0', '/jf/module/treeData', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "public"."pt_operator" VALUES ('9c0ae757fc564f27860b975e5792ae6a', '0', null, 'log4jhtml', null, null, null, '0', '/pingtai/log4j/log4j.html', 'f85f516c0b86439087d48a45173ba0e7', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO "public"."pt_operator" VALUES ('9f75b47bdc0249e2b493c47384785a72', '0', null, '保存', null, null, null, '0', '/jf/menu/save', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "public"."pt_operator" VALUES ('a0c01a5248cd4bf38e57945dbb2b98c5', '0', null, '更新', null, null, null, '0', '/jf/group/update', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "public"."pt_operator" VALUES ('a1ff68acf9b24c34b347ff21e333cb70', '0', null, '设置菜单功能', null, null, null, '0', '/jf/menu/setOperator', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "public"."pt_operator" VALUES ('a5289b2638d845fbb06dedbcdd517f97', '0', null, '删除', null, null, null, '0', '/jf/group/delete', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "public"."pt_operator" VALUES ('a6623c65480f4f2cb63a4d7673f81e3a', '0', null, 'treeData', null, null, null, '0', '/jf/menu/treeData', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "public"."pt_operator" VALUES ('aa126932641f4e068ed8278a332de85d', '0', null, '默认主页', null, null, null, '0', '/jf/index/content', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO "public"."pt_operator" VALUES ('acbceb432b5849aca9e9b284240281ec', '0', null, '分组角色下拉选择', null, null, null, '0', '/jf/role/select', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "public"."pt_operator" VALUES ('ad09a1b897744812875c752c2d70f11a', '0', null, '默认树', null, null, null, '0', '/jf/dept', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "public"."pt_operator" VALUES ('ad51a6ca95c646ce9c03778eda715734', '0', null, '保存', null, null, null, '0', '/jf/operator/save', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "public"."pt_operator" VALUES ('b13b002e2fad4e95bbe0e4dbc9fbdfe1', '0', null, '保存', null, null, null, '0', '/jf/module/save', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "public"."pt_operator" VALUES ('b23b17d4c83242e8a1a8ee8cfcde9907', '0', null, '查看', null, null, null, '0', '/jf/operator/view', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "public"."pt_operator" VALUES ('b4ee4ae4391f4243be69e838545d2131', '0', null, 'treeData', null, null, null, '0', '/jf/dept/treeData', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "public"."pt_operator" VALUES ('b8218945b8e743f29651569950014511', '0', null, '单选', null, null, null, '0', '/pingtai/department/radio.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "public"."pt_operator" VALUES ('b82d86fb7b64498a9c2b8b9a99b3fbeb', '0', null, '删除', null, null, null, '0', '/jf/menu/delete', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "public"."pt_operator" VALUES ('b8339f29d8d84a4ead6454295f87b79c', '0', null, '人员分组设置', null, null, null, '0', '/jf/group/select', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "public"."pt_operator" VALUES ('bc2c865be6af42cf861294d446fb1c6f', '0', null, '单选', null, null, null, '0', '/pingtai/user/radio.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('c04adcd019e04cf3ba7c66af721a18dc', '0', null, '删除', null, null, null, '0', '/jf/user/delete', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('c05642442e0a468ebe4f0b7771a803ae', '0', null, '更新', null, null, null, '0', '/jf/systems/update', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO "public"."pt_operator" VALUES ('c081c50918f4459f8e36ab8cb4151a61', '0', null, '准备岗位功能设置', null, null, null, '0', '/pingtai/station/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "public"."pt_operator" VALUES ('c0ccfcd127c347a8b9db140e5aa62188', '0', null, '准备添加', null, null, null, '0', '/pingtai/role/add.html', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "public"."pt_operator" VALUES ('c1e991d1f56749298c18ff69d7777e0b', '0', null, '删除', null, null, null, '0', '/jf/module/delete', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "public"."pt_operator" VALUES ('c29ea4cbd9044bc786e9f4584ad840ff', '0', null, '获取岗位功能', null, null, null, '0', '/jf/station/getOperator', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "public"."pt_operator" VALUES ('c7132250f5054b808bb119122a6ecb52', '0', null, '设置岗位功能', null, null, null, '0', '/jf/station/setOperator', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "public"."pt_operator" VALUES ('c9d013d14cbd4f148fb4562c91803ee8', '0', null, '准备更新', null, null, null, '0', '/jf/group/edit', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "public"."pt_operator" VALUES ('ca0f6da01ada419eaa7739d9790e5b88', '0', null, '准备角色功能设置', null, null, null, '0', '/pingtai/role/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "public"."pt_operator" VALUES ('cc6bcbee40ab43b2bd5aff6d9385e1fc', '0', null, '删除', null, null, null, '0', '/jf/operator/delete', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "public"."pt_operator" VALUES ('cf26c1d2baa24a8791b3d264154b80d4', '0', null, '默认树', null, null, null, '0', '/jf/menu', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "public"."pt_operator" VALUES ('d115d08591ef4c0eaebef15f8294b287', '0', null, '准备设置部门负责人', null, null, null, '0', '/pingtai/department/userTree.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "public"."pt_operator" VALUES ('d1e14e0b7f69478394850d2238214692', '0', null, '单选', null, null, null, '0', '/pingtai/dict/radio.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('d247fb45be724ed2a2bb5c92d73bf6cf', '0', null, '设置用户的组', null, null, null, '0', '/jf/user/setGroup', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('d479dbdc901f4d85a207b9bace6465ac', '0', null, '更新', null, null, null, '0', '/jf/user/update', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('d496b161d2564111992687b948862244', '0', null, 'iframe', null, null, null, '0', '/pingtai/druid/iframe.html', '297e0cf944e9762e0144e97dfd6e00c9', '0', '0', '0', '1', null, null, '数据源');
INSERT INTO "public"."pt_operator" VALUES ('d5c8bdf7a49a4e46b776c05dc9ead484', '0', null, 'treeData', null, null, null, '0', '/jf/dict/treeData', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('d646da8707ae41838fd2ec9bf0d467ee', '0', null, '设置角色功能', null, null, null, '0', '/jf/role/setOperator', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "public"."pt_operator" VALUES ('dc750e57b54f4baca78d66969321ee51', '0', null, '更新', null, null, null, '0', '/jf/station/update', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "public"."pt_operator" VALUES ('df0aa534655242e4a0bcd638b51a4e03', '0', null, '更新', null, null, null, '0', '/jf/menu/update', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "public"."pt_operator" VALUES ('dfc7af0979a54e8e9a3f18b7a5d66030', '0', null, '查看', null, null, null, '0', '/jf/wx/keyword/view', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "public"."pt_operator" VALUES ('dfe9d74fe0ef4220bfcfe6d7bb2f9436', '0', null, '默认用户列表', null, null, null, '0', '/jf/wx/user', 'c4e63c4171db4ae2a83f7dfcc2656b0e', '1', '0', '0', '1', null, null, '用户管理');
INSERT INTO "public"."pt_operator" VALUES ('e037e0bae9a94e549d6b647db49a64a1', '0', null, '角色设置', null, null, null, '0', '/jf/group/setRole', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "public"."pt_operator" VALUES ('e754dfdb794d4e7db6023c9b089a340c', '0', null, '多选', null, null, null, '0', '/pingtai/user/checkbox.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('f16cadd8f81e4bef926e09f718db8fe2', '0', null, '删除', null, null, null, '0', '/jf/dict/delete', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "public"."pt_operator" VALUES ('f1f6f2c8f026498c8ee64b7a918d06df', '0', null, '准备更新', null, null, null, '0', '/jf/user/edit', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "public"."pt_operator" VALUES ('f771691134c34174a819b5990310d000', '0', null, '首页', null, null, null, '0', '/jf/', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO "public"."pt_operator" VALUES ('f771691134c34174a819b5990310da56', '0', null, '注销', null, null, null, '0', '/jf/login/logout', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO "public"."pt_operator" VALUES ('f82c021dc443419fb2469032af73bf3e', '0', null, '删除', null, null, null, '0', '/jf/dept/delete', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "public"."pt_operator" VALUES ('fb6a0c1e618041bcbbf8cfd41311b1fa', '0', null, '准备登陆', null, null, null, '0', '/jf/login', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO "public"."pt_operator" VALUES ('fd9978df5c5a47f298e2d28e21e70b15', '0', null, '删除', null, null, null, '0', '/jf/sysLog/delete', '8a40c0353fa828a6013fa898d4ac0029', '0', '0', '0', '1', null, null, '日志');

-- ----------------------------
-- Table structure for "public"."pt_resources"
-- ----------------------------
DROP TABLE "public"."pt_resources";
CREATE TABLE "public"."pt_resources" (
"ids" varchar(32) NOT NULL,
"version" int8,
"osname" varchar(200),
"ips" varchar(50),
"hostname" varchar(200),
"cpunumber" int8,
"cpuratio" numeric(20,10),
"phymemory" int8,
"phyfreememory" int8,
"jvmtotalmemory" int8,
"jvmfreememory" int8,
"jvmmaxmemory" int8,
"gccount" int8,
"createdate" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_resources
-- ----------------------------
INSERT INTO "public"."pt_resources" VALUES ('b59f70e468a641829de6caa145d7717b', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1829287966', '8103', '4126', '486', '211', '998', '5', '2014-08-04 20:53:41.7+08');
INSERT INTO "public"."pt_resources" VALUES ('e9fd0eb125db4392ba392e9c1b902d53', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1962437130', '8103', '3490', '486', '253', '998', '5', '2014-08-04 20:51:41.697+08');
INSERT INTO "public"."pt_resources" VALUES ('f81921b0d9ab42089ae21d44251a6792', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1720434018', '8103', '3856', '486', '273', '998', '5', '2014-08-04 20:49:41.699+08');

-- ----------------------------
-- Table structure for "public"."pt_role"
-- ----------------------------
DROP TABLE "public"."pt_role";
CREATE TABLE "public"."pt_role" (
"ids" varchar(32) NOT NULL,
"version" int8,
"description" varchar(200),
"names" varchar(25),
"operatorids" text,
"moduleids" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_role
-- ----------------------------
INSERT INTO "public"."pt_role" VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '超级管理员', '系统管理员', 'operator_8f9ab71d526c45359c4476f957987e6d,operator_37218fb52ec94fb4bf76209a17916094,operator_c1e991d1f56749298c18ff69d7777e0b,operator_b13b002e2fad4e95bbe0e4dbc9fbdfe1,operator_9a708f39e123455e84b6125774bab1ea,operator_437e05d09dd94720b67c4f230cdebe58,operator_0fb7938c7d614fc389568eb67b442303,operator_91baed789bc14efdbebb10b49c69ee5b,operator_c04adcd019e04cf3ba7c66af721a18dc,operator_f1f6f2c8f026498c8ee64b7a918d06df,operator_5fcac107c80d493d91b53a815d4b297a,operator_d247fb45be724ed2a2bb5c92d73bf6cf,operator_4376888fd74f4247a926529e5da03442,operator_d479dbdc901f4d85a207b9bace6465ac,operator_79039a2260da46b0aabb5a62e8db6c87,operator_1a8b4d8e4411412fa8bb561393563a85,operator_e754dfdb794d4e7db6023c9b089a340c,operator_48db51f20b504c4ab489b1dcfd3ecbd9,operator_bc2c865be6af42cf861294d446fb1c6f,operator_cf26c1d2baa24a8791b3d264154b80d4,operator_b82d86fb7b64498a9c2b8b9a99b3fbeb,operator_10499bc7f9cb4adf99beba00343b4ea6,operator_9f75b47bdc0249e2b493c47384785a72,operator_a1ff68acf9b24c34b347ff21e333cb70,operator_a6623c65480f4f2cb63a4d7673f81e3a,operator_df0aa534655242e4a0bcd638b51a4e03,operator_4a6544ae7a2548ad81c0e3994999023c,operator_f771691134c34174a819b5990310d000,operator_886bd497064b4c9f87d8461ebba421d1,operator_aa126932641f4e068ed8278a332de85d,operator_fb6a0c1e618041bcbbf8cfd41311b1fa,operator_f771691134c34174a819b5990310da56,operator_7ed5eefbbf3d4aa78d0c5b99f3b7010c,operator_1b0d7476974e4bf9b52f75fb82f87330,operator_a5289b2638d845fbb06dedbcdd517f97,operator_c9d013d14cbd4f148fb4562c91803ee8,operator_22926eb196a14b48be775f4880b5ba94,operator_b8339f29d8d84a4ead6454295f87b79c,operator_e037e0bae9a94e549d6b647db49a64a1,operator_a0c01a5248cd4bf38e57945dbb2b98c5,operator_3ee5f986289d4a1990f4e42c9a0caadb,operator_d496b161d2564111992687b948862244,operator_4df80521e66447618796c3cfe02bf239,operator_6569e0d9f2cd4e3a97af4e1b0cd8d2f7,operator_f16cadd8f81e4bef926e09f718db8fe2,operator_091855dd809b418fae88a7fec6d9f246,operator_01aa0c85c8b84ae8aca7f5484336b203,operator_d5c8bdf7a49a4e46b776c05dc9ead484,operator_2be34991827e4e8da8e92f9b9e8bce25,operator_8f79857b31d4475a94c712e997e89c99,operator_12141c1c3be241ca8a868bce9cd610d5,operator_21b0a910ef6e4c60a325d5e57e6e6f65,operator_d1e14e0b7f69478394850d2238214692,operator_74aa20442105408d90f9e6469a3a92b5,operator_8897dbe85b3e4e6989d662495272cf26,operator_7ae62737df444d619f8fd376360d160c,operator_335d1f8f46eb47a18001889f8cc21348,operator_7cc12b5c154a4a9782c518c57e8ab3aa,operator_78c6026c6af44b41a6bef4cdb4cfb414,operator_15566e63f3104c73b4a0b4a784dd11ca,operator_acbceb432b5849aca9e9b284240281ec,operator_d646da8707ae41838fd2ec9bf0d467ee,operator_29c18b3394924c30882da049da14ad99,operator_c0ccfcd127c347a8b9db140e5aa62188,operator_ca0f6da01ada419eaa7739d9790e5b88,operator_233356b63d8e477fb6e948b703232809,operator_362cf247241c4d12b6242301e4a73516,operator_c29ea4cbd9044bc786e9f4584ad840ff,operator_2fbbc9cfb0bf4b5bb504ead155c3423c,operator_c7132250f5054b808bb119122a6ecb52,operator_09b6ce29313c4051ba765de516a9b283,operator_dc750e57b54f4baca78d66969321ee51,operator_21141da4febe4c929abe37126b37fd12,operator_c081c50918f4459f8e36ab8cb4151a61,operator_2fee901117c64e18873f60e8f800713d,operator_7eab5f800bab4efb8df1b2e8a0575f73,operator_32a3e59964204a3c8848e84b864306ae,operator_8bd9c0e14df941cdaf6253cd08dbd9cd,operator_7b4281dd247c4624bee0d8f84c2c2715,operator_c05642442e0a468ebe4f0b7771a803ae,operator_5b249ad344d948b99f58768c323f5f71,operator_0da15c49299d41a4b720f787d053e3cb,operator_cc6bcbee40ab43b2bd5aff6d9385e1fc,operator_83ef85fd17804bb195d0ad3c07f88c30,operator_ad51a6ca95c646ce9c03778eda715734,operator_6daed51284f94923b1c8a6414e646959,operator_1b1a809815574b2a9c1d0e18d692de17,operator_b23b17d4c83242e8a1a8ee8cfcde9907,operator_910955c2192a418995eeab8bf15372e9,operator_ad09a1b897744812875c752c2d70f11a,operator_f82c021dc443419fb2469032af73bf3e,operator_053d330462e1459ca1012c9d29113bc4,operator_58a85040aa9f40cca0bdba6e23e30363,operator_b4ee4ae4391f4243be69e838545d2131,operator_1046389d8525451697f2793185e7d6ee,operator_46e00ef0fd234e9dbf68ed9bbb437d0f,operator_b8218945b8e743f29651569950014511,operator_d115d08591ef4c0eaebef15f8294b287,operator_235d855d7b914d728e434f0f309aa04d,operator_fd9978df5c5a47f298e2d28e21e70b15,operator_8ca8af501522439d8c9249e00db5d78d,operator_dfe9d74fe0ef4220bfcfe6d7bb2f9436,operator_2c91467f905a4f5ba9f52830131c8ad9,operator_481d4d5c0a634c4085c72c990260e58d,operator_420d8ebc68ad44dc8188d4c27dc585d1,operator_5148ea207b974ee197f0bc57060ab1ad,operator_0773a58c4bdb4858ab062c4a2a4da69a,operator_9765e6bb76eb40ab800cb8954822190e,operator_77823e12391a47729a1f82a00bc15c5b,operator_05114c0cbe1f4c2095b3216f13cfb681,operator_6b527ed138c343a89ddf73cf16fef565,operator_dfc7af0979a54e8e9a3f18b7a5d66030,operator_3dd486cd58da467dbd83ae420db14815,operator_721f7255449c445faf36607c254eea06,operator_9c0ae757fc564f27860b975e5792ae6a,operator_5c2bdc059ae24ffda2758a2781bb46da,operator_6566adb7fc6347e7b01a3c47129b5eb5,operator_6324ff9e83654aa0bf7f9d918b636b55,operator_827a7067a28d442da3ddd834677127af,operator_423e8c2e2a644bbda0803f46ea8f31e2,', 'module_8a40c0353fa828a6013fa898d4ac0033,module_8a40c0353fa828a6013fa898d4ac0030,module_8a40c0353fa828a6013fa898d4ac0031,module_8a40c0353fa828a6013fa898d4ac0021,module_8a40c0353fa828a6013fa898d4ac0023,module_297e0cf944e9762e0144e97dfd6e00c9,module_8a40c0353fa828a6013fa898d4ac0024,module_8a40c0353fa828a6013fa898d4ac0025,module_8a40c0353fa828a6013fa898d4ac0026,module_8a40c0353fa828a6013fa898d4ac0027,module_8a40c0353fa828a6013fa898d4ac0028,module_8a40c0353fa828a6013fa898d4ac0029,module_8a40c0353fa828a6013fa898d4ac1100,module_c4e63c4171db4ae2a83f7dfcc2656b0e,module_e6eb0165223447218410f867a9614300,module_417ed3d3cf4d4b7a939613829e8db17d,module_7a35846a305c42abb68601b4f7347289,module_c87c35097a2d4bc898fe6e9b1e280a3d,module_8f53706d4af541588bde334d99d44727,module_8a40c0353fa828a6013fa898d4ac2200,module_f85f516c0b86439087d48a45173ba0e7,module_529d39f773a54ff39eea877f606d74b0,');

-- ----------------------------
-- Table structure for "public"."pt_station"
-- ----------------------------
DROP TABLE "public"."pt_station";
CREATE TABLE "public"."pt_station" (
"ids" varchar(32) NOT NULL,
"version" int8,
"description" varchar(200),
"images" varchar(50),
"isparent" varchar(5),
"names" varchar(25),
"orderids" int8,
"parentstationids" varchar(32),
"operatorids" text,
"moduleids" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_station
-- ----------------------------
INSERT INTO "public"."pt_station" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '根节点', '1_open.png', 'true', '岗位组织结构', '1', null, '', '');
INSERT INTO "public"."pt_station" VALUES ('8a40c0353fa828a6013fa898d4ac0021', '0', '人事经理', '2.png', 'false', '人事经理', '6', '8a40c0353fa828a6013fa898d4ac0020', 'operator_520,operator_526,operator_530,operator_527,', 'module_8a40c0353fe0565b0130001,module_8a40c0353fe0565b0130002,');
INSERT INTO "public"."pt_station" VALUES ('8a40c0353fa828a6013fa898d4ac0022', '0', '财务经理', '3.png', 'false', '财务经理', '8', '8a40c0353fa828a6013fa898d4ac0020', '', '');
INSERT INTO "public"."pt_station" VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '行政经理', '4.png', 'false', '行政经理', '7', '8a40c0353fa828a6013fa898d4ac0020', 'operator_520,operator_526,operator_530,operator_529,', 'module_8a40c0353fe0565b0130001,module_8a40c0353fe0565b0130002,');
INSERT INTO "public"."pt_station" VALUES ('8a40c0353fa828a6013fa898d4ac0024', '0', '测试经理', '5.png', 'false', '测试经理', '9', '8a40c0353fa828a6013fa898d4ac0020', '', '');
INSERT INTO "public"."pt_station" VALUES ('8a40c0353fa828a6013fa898d4ac0025', '0', '研发经理', '6.png', 'false', '研发经理', '1', '8a40c0353fa828a6013fa898d4ac0020', '', '');
INSERT INTO "public"."pt_station" VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '应用Java', '8.png', 'false', '应用Java', '3', '8a40c0353fa828a6013fa898d4ac0027', 'operator_37218fb52ec94fb4bf76209a17916094,operator_c1e991d1f56749298c18ff69d7777e0b,operator_b13b002e2fad4e95bbe0e4dbc9fbdfe1,operator_9a708f39e123455e84b6125774bab1ea,operator_437e05d09dd94720b67c4f230cdebe58,operator_0fb7938c7d614fc389568eb67b442303,operator_91baed789bc14efdbebb10b49c69ee5b,operator_c04adcd019e04cf3ba7c66af721a18dc,operator_f1f6f2c8f026498c8ee64b7a918d06df,operator_5fcac107c80d493d91b53a815d4b297a,operator_d247fb45be724ed2a2bb5c92d73bf6cf,operator_4376888fd74f4247a926529e5da03442,operator_d479dbdc901f4d85a207b9bace6465ac,operator_79039a2260da46b0aabb5a62e8db6c87,operator_1a8b4d8e4411412fa8bb561393563a85,operator_e754dfdb794d4e7db6023c9b089a340c,operator_bc2c865be6af42cf861294d446fb1c6f,operator_cf26c1d2baa24a8791b3d264154b80d4,operator_b82d86fb7b64498a9c2b8b9a99b3fbeb,operator_10499bc7f9cb4adf99beba00343b4ea6,operator_9f75b47bdc0249e2b493c47384785a72,operator_a1ff68acf9b24c34b347ff21e333cb70,operator_a6623c65480f4f2cb63a4d7673f81e3a,operator_df0aa534655242e4a0bcd638b51a4e03,operator_4a6544ae7a2548ad81c0e3994999023c,operator_f771691134c34174a819b5990310d000,operator_886bd497064b4c9f87d8461ebba421d1,operator_aa126932641f4e068ed8278a332de85d,operator_fb6a0c1e618041bcbbf8cfd41311b1fa,operator_f771691134c34174a819b5990310da56,operator_7ed5eefbbf3d4aa78d0c5b99f3b7010c,operator_1b0d7476974e4bf9b52f75fb82f87330,operator_a5289b2638d845fbb06dedbcdd517f97,operator_c9d013d14cbd4f148fb4562c91803ee8,operator_22926eb196a14b48be775f4880b5ba94,operator_b8339f29d8d84a4ead6454295f87b79c,operator_e037e0bae9a94e549d6b647db49a64a1,operator_a0c01a5248cd4bf38e57945dbb2b98c5,operator_3ee5f986289d4a1990f4e42c9a0caadb,operator_d496b161d2564111992687b948862244,operator_4df80521e66447618796c3cfe02bf239,operator_f16cadd8f81e4bef926e09f718db8fe2,operator_6569e0d9f2cd4e3a97af4e1b0cd8d2f7,operator_091855dd809b418fae88a7fec6d9f246,operator_01aa0c85c8b84ae8aca7f5484336b203,operator_d5c8bdf7a49a4e46b776c05dc9ead484,operator_2be34991827e4e8da8e92f9b9e8bce25,operator_8f79857b31d4475a94c712e997e89c99,operator_12141c1c3be241ca8a868bce9cd610d5,operator_d1e14e0b7f69478394850d2238214692,operator_21b0a910ef6e4c60a325d5e57e6e6f65,operator_8897dbe85b3e4e6989d662495272cf26,operator_74aa20442105408d90f9e6469a3a92b5,operator_7ae62737df444d619f8fd376360d160c,operator_335d1f8f46eb47a18001889f8cc21348,operator_7cc12b5c154a4a9782c518c57e8ab3aa,operator_78c6026c6af44b41a6bef4cdb4cfb414,operator_15566e63f3104c73b4a0b4a784dd11ca,operator_acbceb432b5849aca9e9b284240281ec,operator_d646da8707ae41838fd2ec9bf0d467ee,operator_29c18b3394924c30882da049da14ad99,operator_c0ccfcd127c347a8b9db140e5aa62188,operator_ca0f6da01ada419eaa7739d9790e5b88,operator_233356b63d8e477fb6e948b703232809,operator_362cf247241c4d12b6242301e4a73516,operator_c29ea4cbd9044bc786e9f4584ad840ff,operator_2fbbc9cfb0bf4b5bb504ead155c3423c,operator_c7132250f5054b808bb119122a6ecb52,operator_09b6ce29313c4051ba765de516a9b283,operator_dc750e57b54f4baca78d66969321ee51,operator_21141da4febe4c929abe37126b37fd12,operator_c081c50918f4459f8e36ab8cb4151a61,operator_2fee901117c64e18873f60e8f800713d,operator_7eab5f800bab4efb8df1b2e8a0575f73,operator_32a3e59964204a3c8848e84b864306ae,operator_8bd9c0e14df941cdaf6253cd08dbd9cd,operator_7b4281dd247c4624bee0d8f84c2c2715,operator_c05642442e0a468ebe4f0b7771a803ae,operator_5b249ad344d948b99f58768c323f5f71,operator_0da15c49299d41a4b720f787d053e3cb,operator_cc6bcbee40ab43b2bd5aff6d9385e1fc,operator_83ef85fd17804bb195d0ad3c07f88c30,operator_ad51a6ca95c646ce9c03778eda715734,operator_6daed51284f94923b1c8a6414e646959,operator_1b1a809815574b2a9c1d0e18d692de17,operator_b23b17d4c83242e8a1a8ee8cfcde9907,operator_910955c2192a418995eeab8bf15372e9,operator_ad09a1b897744812875c752c2d70f11a,operator_f82c021dc443419fb2469032af73bf3e,operator_053d330462e1459ca1012c9d29113bc4,operator_58a85040aa9f40cca0bdba6e23e30363,operator_b4ee4ae4391f4243be69e838545d2131,operator_1046389d8525451697f2793185e7d6ee,operator_46e00ef0fd234e9dbf68ed9bbb437d0f,operator_b8218945b8e743f29651569950014511,operator_d115d08591ef4c0eaebef15f8294b287,operator_235d855d7b914d728e434f0f309aa04d,operator_fd9978df5c5a47f298e2d28e21e70b15,operator_8ca8af501522439d8c9249e00db5d78d,operator_2c91467f905a4f5ba9f52830131c8ad9,operator_481d4d5c0a634c4085c72c990260e58d,operator_5148ea207b974ee197f0bc57060ab1ad,operator_420d8ebc68ad44dc8188d4c27dc585d1,operator_48db51f20b504c4ab489b1dcfd3ecbd9,operator_0773a58c4bdb4858ab062c4a2a4da69a,operator_9765e6bb76eb40ab800cb8954822190e,operator_77823e12391a47729a1f82a00bc15c5b,operator_05114c0cbe1f4c2095b3216f13cfb681,operator_6b527ed138c343a89ddf73cf16fef565,operator_dfc7af0979a54e8e9a3f18b7a5d66030,operator_3dd486cd58da467dbd83ae420db14815,operator_dfe9d74fe0ef4220bfcfe6d7bb2f9436,operator_6566adb7fc6347e7b01a3c47129b5eb5,operator_721f7255449c445faf36607c254eea06,operator_9c0ae757fc564f27860b975e5792ae6a,operator_5c2bdc059ae24ffda2758a2781bb46da,operator_827a7067a28d442da3ddd834677127af,operator_423e8c2e2a644bbda0803f46ea8f31e2,', 'module_8a40c0354328e527014328e884be0016,module_pingTai,module_pingTai00020,module_pingTai0004,module_pingTai00016,module_pingTai0007,module_pingTai00012,module_297e0cf944f8cce70144f8e166a40167,module_pingTai00015,module_pingTai00022,module_pingTai00010,module_pingTai00018,module_pingTai0006,module_pingTai00023,module_pingTai00011,module_8a40c0353fa828a6013fa898d4ac0033,module_8a40c0353fa828a6013fa898d4ac0031,module_8a40c0353fa828a6013fa898d4ac0021,module_8a40c0353fa828a6013fa898d4ac0023,module_297e0cf944e9762e0144e97dfd6e00c9,module_8a40c0353fa828a6013fa898d4ac0022,module_8a40c0353fa828a6013fa898d4ac0024,module_8a40c0353fa828a6013fa898d4ac0025,module_8a40c0353fa828a6013fa898d4ac0026,module_8a40c0353fa828a6013fa898d4ac0027,module_8a40c0353fa828a6013fa898d4ac0028,module_8a40c0353fa828a6013fa898d4ac0029,module_e6eb0165223447218410f867a9614300,module_7a35846a305c42abb68601b4f7347289,module_c87c35097a2d4bc898fe6e9b1e280a3d,module_8f53706d4af541588bde334d99d44727,module_529d39f773a54ff39eea877f606d74b0,module_f85f516c0b86439087d48a45173ba0e7,');
INSERT INTO "public"."pt_station" VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', '应用经理', '7.png', 'true', '应用经理', '2', '8a40c0353fa828a6013fa898d4ac0020', '', '');
INSERT INTO "public"."pt_station" VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', '应用C++', '2.png', 'false', '应用C++', '5', '8a40c0353fa828a6013fa898d4ac0027', '', '');

-- ----------------------------
-- Table structure for "public"."pt_syslog"
-- ----------------------------
DROP TABLE "public"."pt_syslog";
CREATE TABLE "public"."pt_syslog" (
"ids" varchar(32) NOT NULL,
"version" int8,
"actionenddate" timestamp(6),
"actionendtime" int8,
"actionhaoshi" int8,
"actionstartdate" timestamp(6),
"actionstarttime" int8,
"cause" char(1),
"cookie" varchar(1024),
"description" text,
"enddate" timestamp(6),
"endtime" int8,
"haoshi" int8,
"ips" varchar(128),
"method" varchar(4),
"referer" varchar(500),
"requestpath" text,
"startdate" timestamp(6),
"starttime" int8,
"status" char(1),
"useragent" varchar(1000),
"viewhaoshi" int8,
"operatorids" varchar(32),
"accept" varchar(200),
"acceptencoding" varchar(200),
"acceptlanguage" varchar(200),
"connection" varchar(200),
"host" varchar(200),
"xrequestedwith" varchar(200),
"pvids" varchar(32),
"userids" varchar(32)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_syslog
-- ----------------------------
INSERT INTO "public"."pt_syslog" VALUES ('00263cdfe58e47358b4e5d69f3b836ef', '0', null, null, '4', '2014-08-04 20:52:45.846', '1407156765846', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.849', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.845', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('028bd605a8b74409b220e8376f8d6144', '0', null, null, '4', '2014-08-04 20:52:45.851', '1407156765851', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.854', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.85', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('02d6140799ba4c32a71492b13d986921', '0', null, null, '5', '2014-08-04 20:52:45.836', '1407156765836', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.84', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.835', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('02e4309551004fc9a0b6611e20cca2e1', '0', null, null, '3', '2014-08-04 20:52:11.086', '1407156731086', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.088', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.085', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('03602ebaf29c445388965bc4ce678881', '0', null, null, '6', '2014-08-04 20:52:34.133', '1407156754133', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.136', null, '6', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.13', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('03aebcf8f988485f8b3730549e452da4', '0', null, null, '5', '2014-08-04 20:52:34.151', '1407156754151', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.154', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.149', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('07330baad896403f99ef419dff796e9d', '0', null, null, '3', '2014-08-04 20:52:11.015', '1407156731015', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.017', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.014', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('0911f4a9316d4327af0e13d99ae5b025', '0', null, null, '35', '2014-08-04 20:52:45.822', '1407156765822', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.856', null, '35', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.821', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('0c6dda5644d14347998ea57400a71e90', '0', null, null, '10', '2014-08-04 20:52:45.829', '1407156765829', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.837', null, '10', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.827', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('0ce4d7f191b04e87b589e8961d00dd22', '0', null, null, '5', '2014-08-04 20:52:11.101', '1407156731101', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.105', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.1', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('0d33389b8a8143179dedaf2881c3ee9f', '0', null, null, '5', '2014-08-04 20:51:46.557', '1407156706557', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.559', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.554', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('0e68832f4c584941b3a846feeea25178', '0', null, null, '10', '2014-08-04 20:52:45.79', '1407156765790', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.797', null, '10', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.787', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('0fd7f39f8e6441f38cd7aefec9d19e00', '0', null, null, '7', '2014-08-04 20:52:34.145', '1407156754145', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.15', null, '7', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.143', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('1065039c7c6f47e4a437659ab5faff12', '0', null, null, '3', '2014-08-04 20:52:45.256', '1407156765256', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.258', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/getOperator', '2014-08-04 20:52:45.255', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'c29ea4cbd9044bc786e9f4584ad840ff', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('129fd94086b944a784922bfa22df3dae', '0', null, null, '4', '2014-08-04 20:51:46.487', '1407156706487', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.49', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.486', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('13c20da76a554e51b3efd390685b4ae2', '0', null, null, '1', '2014-08-04 20:53:05.508', '1407156785508', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ', null, '2014-08-04 20:53:05.509', null, '1', '127.0.0.1', 'GET', null, '/jf/login', '2014-08-04 20:53:05.508', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'fb6a0c1e618041bcbbf8cfd41311b1fa', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, null);
INSERT INTO "public"."pt_syslog" VALUES ('13e0806595bf4f25b9ee3d9727846157', '0', null, null, '2', '2014-08-04 20:52:11.114', '1407156731114', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.115', null, '2', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.113', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('1a44be3d99a74be89bf0d8ef3db1bef8', '0', null, null, '6', '2014-08-04 20:52:30.371', '1407156750371', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:30.389', null, '19', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/operator', '2014-08-04 20:52:30.37', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '13', '0da15c49299d41a4b720f787d053e3cb', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('1b6ea85aed8b4b128aa12100bf885b9e', '0', null, null, '2', '2014-08-04 20:52:09.04', '1407156729040', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:09.043', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/toUrl?toUrl=/pingtai/operator/add.html', '2014-08-04 20:52:09.039', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '2', '910955c2192a418995eeab8bf15372e9', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('1fe710562138408ea507e2c3e4ce8294', '0', null, null, '5', '2014-08-04 20:51:46.564', '1407156706564', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.566', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.561', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('23877f76601e4365a8ede99ae8513331', '0', null, null, '3', '2014-08-04 20:53:09.713', '1407156789713', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:09.717', null, '5', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/systems', '2014-08-04 20:53:09.712', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '2', '7eab5f800bab4efb8df1b2e8a0575f73', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('2a2cc502ae234c3d830bffd60e215592', '0', null, null, '2', '2014-08-04 20:53:15.117', '1407156795117', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:15.143', null, '26', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/menu/toEdit', '2014-08-04 20:53:15.117', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '24', '423e8c2e2a644bbda0803f46ea8f31e2', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('2ccbd1ca59fc46a9bcbe6bf167cd09cd', '0', null, null, '4', '2014-08-04 20:52:11.125', '1407156731125', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.127', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.123', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('2d73ef49f5164e56bb6f2987a180a6e7', '0', null, null, '2', '2014-08-04 20:52:11.11', '1407156731110', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.111', null, '2', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.109', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('2e03b56f195c4c7bb8f22f4937121853', '0', null, null, '6', '2014-08-04 20:51:46.555', '1407156706555', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.559', null, '6', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.553', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('2eae0232559d4ccdb7a56b1f33635262', '0', null, null, '5', '2014-08-04 20:51:46.581', '1407156706581', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.585', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.58', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('312d3e9218d342429bc464032938bf8e', '0', null, null, '3', '2014-08-04 20:52:43.105', '1407156763105', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:43.107', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/treeData', '2014-08-04 20:52:43.104', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('3257117a319a4beca5e8653db0ad5dfa', '0', null, null, '4', '2014-08-04 20:52:45.752', '1407156765752', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.755', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.751', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('3786eea4dd434df8ae1631667c57d82c', '0', null, null, '2', '2014-08-04 20:52:33.501', '1407156753501', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:33.518', null, '18', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/toUrl', '2014-08-04 20:52:33.5', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '16', 'ca0f6da01ada419eaa7739d9790e5b88', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('39477f8b9aa248268eb47f81c758a5ea', '0', null, null, '3', '2014-08-04 20:52:45.832', '1407156765832', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.834', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.831', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('3ad66934d92b466fbec735b4ee8f6976', '0', null, null, '44', '2014-08-04 20:52:11.107', '1407156731107', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.15', null, '44', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.106', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('3adc8435658b445fa4af06f404459b86', '0', null, null, '6', '2014-08-04 20:51:46.579', '1407156706579', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.583', null, '6', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.577', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('3ae3ef2d25a949ba8dcb2685329fc6a0', '0', null, null, '10', '2014-08-04 20:52:34.056', '1407156754056', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.065', null, '10', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.055', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('3c5752c4630646bfb35f4fd114c3b4e6', '0', null, null, '3', '2014-08-04 20:51:46.591', '1407156706591', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.593', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.59', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('3f9689b4dd4d47a29da14054493dc9e7', '0', null, null, '17', '2014-08-04 20:52:45.785', '1407156765785', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.801', null, '17', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.784', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4007dc3bc14f4d958989c61bb9bf994f', '0', null, null, '3', '2014-08-04 20:52:33.553', '1407156753553', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:33.555', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:33.552', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('41128e61ffae453ba44bee6eb79d9b2e', '0', null, null, '3', '2014-08-04 20:52:11.015', '1407156731015', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.017', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.014', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('445b32478d8d4950b3fbb50590d751e6', '0', null, null, '4', '2014-08-04 20:52:11.021', '1407156731021', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.024', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.02', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4609086da0114010b5c287dac3b74527', '0', null, null, '1', '2014-08-04 20:52:45.18', '1407156765180', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.196', null, '17', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/toUrl', '2014-08-04 20:52:45.179', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '16', 'c081c50918f4459f8e36ab8cb4151a61', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('47020e6dbcb3435791f20c39fe8c62ba', '0', null, null, '5', '2014-08-04 20:52:33.563', '1407156753563', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:33.567', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/role/getOperator', '2014-08-04 20:52:33.562', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '78c6026c6af44b41a6bef4cdb4cfb414', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4760b8bbb4624a388d1b590184a73e0a', '0', null, null, '4', '2014-08-04 20:52:34.165', '1407156754165', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.168', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.164', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4a9a5f61ba7b4d51b37294c015e93c37', '0', null, null, '5', '2014-08-04 20:52:34.157', '1407156754157', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.161', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.156', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4b2f1eaf817a41bab8d4b3a036e9b2c4', '0', null, null, '9', '2014-08-04 20:51:46.576', '1407156706576', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.584', null, '9', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.575', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4f18fe59b2fc4c0987f2686aeac37043', '0', null, null, '3', '2014-08-04 20:52:11.096', '1407156731096', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.098', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.095', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('51a4fd61fdeb463c97acbddf33cfefe9', '0', null, null, '9', '2014-08-04 20:53:09.137', '1407156789137', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:09.158', null, '22', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/operator', '2014-08-04 20:53:09.136', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '13', '0da15c49299d41a4b720f787d053e3cb', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('54a3c944ce4a4f439134c0ddd72712c5', '0', null, null, '3', '2014-08-04 20:51:46.594', '1407156706594', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.596', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.593', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('59c19aaa526f4fc6b3ef9e7c78824ae7', '0', null, null, '3', '2014-08-04 20:51:46.588', '1407156706588', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.589', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.586', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5a7464ca74984674bbc8bcbe32570073', '0', null, null, '18', '2014-08-04 20:52:49.889', '1407156769889', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:49.906', null, '18', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/setOperator', '2014-08-04 20:52:49.888', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'c7132250f5054b808bb119122a6ecb52', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5ac457ded0f84fc8919ec76a1092071d', '0', null, null, '7', '2014-08-04 20:52:34.163', '1407156754163', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.169', null, '7', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.162', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5c11108cf36948aba7ed29629b382b99', '0', null, null, '7', '2014-08-04 20:52:34.133', '1407156754133', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.138', null, '7', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.131', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5e90e93f61f5461c8aec56d55c98fc40', '0', null, null, '14', '2014-08-04 20:52:34.058', '1407156754058', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.07', null, '14', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.056', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5f82f8e2da1b427ba952077bd402d1ec', '0', null, null, '4', '2014-08-04 20:53:12.974', '1407156792974', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:12.976', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/menu/treeData', '2014-08-04 20:53:12.972', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'a6623c65480f4f2cb63a4d7673f81e3a', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('618a92d02fa34eb38864cc36cb38b687', '0', null, null, '4', '2014-08-04 20:52:34.142', '1407156754142', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.145', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.141', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('623cb25394d24e3bbf4ce8a93c1f46d0', '0', null, null, '3', '2014-08-04 20:52:11.122', '1407156731122', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.124', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.121', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6483867b6fb24b5c9cd138580a3dd40e', '0', null, null, '3', '2014-08-04 20:52:32.006', '1407156752006', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:32.035', null, '30', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/role', '2014-08-04 20:52:32.005', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '27', '7ae62737df444d619f8fd376360d160c', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('64e9d5c0faa74af2b41e3094243605ab', '0', null, null, '3', '2014-08-04 20:53:12.406', '1407156792406', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:12.407', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/menu/treeData', '2014-08-04 20:53:12.404', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'a6623c65480f4f2cb63a4d7673f81e3a', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('652823aab52d458aa677ba53313e87d5', '0', null, null, '3', '2014-08-04 20:52:45.785', '1407156765785', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.787', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.784', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6564a739921b4b3888a03706d2b5e0df', '0', null, null, '7', '2014-08-04 20:53:12.972', '1407156792972', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:12.978', null, '7', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/menu/treeData', '2014-08-04 20:53:12.971', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'a6623c65480f4f2cb63a4d7673f81e3a', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('65ad3e25e04b41f7af560c13252a469a', '0', null, null, '3', '2014-08-04 20:52:11.119', '1407156731119', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.12', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.117', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('66061d52ac06497ca884b5e4bf3c66ac', '0', null, null, '27', '2014-08-04 20:51:46.588', '1407156706588', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.592', null, '27', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.565', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('679cdae5a4e3475a852b475abcab125a', '0', null, null, '5', '2014-08-04 20:52:11.093', '1407156731093', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.096', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.091', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('67a3f22db3b54c2ab757fdb6d23ce37f', '0', null, null, '4', '2014-08-04 20:52:43.161', '1407156763161', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:43.164', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/treeData', '2014-08-04 20:52:43.16', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('696088099d7141b1884134f8a749ce37', '0', null, null, '9', '2014-08-04 20:51:42.992', '1407156702992', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:43.064', null, '74', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/operator', '2014-08-04 20:51:42.99', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '65', '0da15c49299d41a4b720f787d053e3cb', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6d92764a00f7425eb07d47771c81bd21', '0', null, null, '3', '2014-08-04 20:53:12.978', '1407156792978', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:12.98', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/menu/treeData', '2014-08-04 20:53:12.977', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'a6623c65480f4f2cb63a4d7673f81e3a', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6db46e4d983f43fe82e90befd47a5676', '0', null, null, '2', '2014-08-04 20:51:46.595', '1407156706595', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.596', null, '2', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.594', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6df870850c044cfe89a361b82a0258a6', '0', null, null, '4', '2014-08-04 20:51:46.574', '1407156706574', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.577', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.573', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6e2f6eb85fda4d58a7de3d704031ccd0', '0', null, null, '3', '2014-08-04 20:51:46.569', '1407156706569', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.571', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.568', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6fe57c1142cf4f4cb217f5ebf28a40c6', '0', null, null, '5', '2014-08-04 20:52:34.171', '1407156754171', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.174', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.169', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('742aa9be7f8744a5be7dff31fa8158a0', '0', null, null, '5', '2014-08-04 20:52:45.826', '1407156765826', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.83', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.825', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('75e730c29a054969a75d01a07aad21e4', '0', null, null, '13', '2014-08-04 20:52:45.787', '1407156765787', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.799', null, '13', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.786', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('7da1d95e2e73491a8c1c5f9100650969', '0', null, null, '5', '2014-08-04 20:52:34.166', '1407156754166', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.17', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.165', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('7e1c61000e2449b39a96efdd189797a9', '0', null, null, '15', '2014-08-04 20:53:05.515', '1407156785515', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ', null, '2014-08-04 20:53:05.536', null, '21', '127.0.0.1', 'GET', null, '/jf/', '2014-08-04 20:53:05.515', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '6', 'f771691134c34174a819b5990310d000', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('7f314592134146c5a11ad1c6aaa1ef2d', '0', null, null, '4', '2014-08-04 20:52:45.842', '1407156765842', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.844', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.84', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('7f51e35f9e01454b92df37568c259c77', '0', null, null, '3', '2014-08-04 20:53:12.981', '1407156792981', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:12.983', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/menu/treeData', '2014-08-04 20:53:12.98', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'a6623c65480f4f2cb63a4d7673f81e3a', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('7f7bfe57a1c54174a2dfc8f02cf69cb3', '0', null, null, '16', '2014-08-04 20:51:46.562', '1407156706562', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.572', null, '16', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.556', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('802b9d2159014c3c836622471f6c747f', '0', null, null, '7', '2014-08-04 20:52:34.159', '1407156754159', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.164', null, '7', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.157', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('8145f5150e8a4672a12349062b2734bc', '0', null, null, '7', '2014-08-04 20:52:30.284', '1407156750284', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:30.29', null, '7', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/save', '2014-08-04 20:52:30.283', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'ad51a6ca95c646ce9c03778eda715734', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('8368b01e52294e30a7484299f2a96727', '0', null, null, '8', '2014-08-04 20:52:11.115', '1407156731115', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.121', null, '8', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.113', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('89126fd14c104fe28269011fd7734445', '0', null, null, '8', '2014-08-04 20:51:46.576', '1407156706576', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.579', null, '8', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.571', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('8f0872117efe4153aea390d87069e45e', '0', null, null, '5', '2014-08-04 20:52:45.851', '1407156765851', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.855', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.85', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('8f1dfec90f2842bcaf0e53f9cfe187f2', '0', null, null, '23', '2014-08-04 20:52:11.109', '1407156731109', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.113', null, '23', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.09', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('92b6e182b9ea48e189b440e39475a424', '0', null, null, '10', '2014-08-04 20:53:05.973', '1407156785973', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:05.983', null, '11', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/index/content', '2014-08-04 20:53:05.972', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', 'aa126932641f4e068ed8278a332de85d', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('92ba39d1ad5f439eaf6e91b03a20144d', '0', null, null, '5', '2014-08-04 20:52:11.101', '1407156731101', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.105', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.1', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('9397e0ccee924875a228c907f1b1a18c', '0', null, null, '3', '2014-08-04 20:52:45.828', '1407156765828', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.83', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.827', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('9584cba510414f72ae7232c1537cdeff', '0', null, null, '1', '2014-08-04 20:52:10.488', '1407156730488', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:10.488', null, '1', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/toUrl', '2014-08-04 20:52:10.487', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '0fb7938c7d614fc389568eb67b442303', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('95f71a976d10438fbec6052326b36c8e', '0', null, null, '5', '2014-08-04 20:52:07.457', '1407156727457', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:07.472', null, '15', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/operator', '2014-08-04 20:52:07.457', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '10', '0da15c49299d41a4b720f787d053e3cb', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('99fc1855d221429b8472192b4de8fff3', '0', null, null, '38', '2014-08-04 20:52:40.66', '1407156760660', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:40.688', null, '38', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/role/setOperator', '2014-08-04 20:52:40.65', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'd646da8707ae41838fd2ec9bf0d467ee', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('9b4453dd3be649a697488898c70e46e6', '0', null, null, '5', '2014-08-04 20:52:34.153', '1407156754153', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.156', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.151', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('9c1b10f439e644439fdb4893609398ca', '0', null, null, '46', '2014-08-04 20:52:34.153', '1407156754153', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.175', null, '46', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.129', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('a571b13456794941841f400110a67ae4', '0', null, null, '3', '2014-08-04 20:52:43.233', '1407156763233', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:43.235', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/treeData', '2014-08-04 20:52:43.232', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('a84e19280afa40adaf39f3a8d122e23b', '0', null, null, '3', '2014-08-04 20:51:46.587', '1407156706587', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.589', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.586', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('a8b823ee281c438691ad01b57800af64', '0', null, null, '11', '2014-08-04 20:52:34.153', '1407156754153', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.163', null, '11', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.152', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('a9b7376e7eb44e4588745590c37b4d68', '0', null, null, '6', '2014-08-04 20:52:45.844', '1407156765844', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.848', null, '6', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.842', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('abdeda75f8f6474baee6d2107b533e18', '0', null, null, '3', '2014-08-04 20:52:45.832', '1407156765832', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.834', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.831', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ac71cf3682f942d081bf1749a7bbd391', '0', null, null, '4', '2014-08-04 20:52:45.752', '1407156765752', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.755', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.751', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('addbeef0fbae4717bd7c541fb8343bd5', '0', null, null, '9', '2014-08-04 20:52:11.1', '1407156731100', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.103', null, '9', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.094', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ae3c70ca372b47bf9ea96c7acc3249f1', '0', null, null, '4', '2014-08-04 20:52:45.836', '1407156765836', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.839', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.835', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('af3b85738c0043aa8bf2143ba212b6fe', '0', null, null, '4', '2014-08-04 20:52:45.823', '1407156765823', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.826', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.822', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('afc78066b53d4b64bda8017d35d08290', '0', null, null, '20', '2014-08-04 20:52:07.422', '1407156727422', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:07.441', null, '20', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/save', '2014-08-04 20:52:07.421', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'ad51a6ca95c646ce9c03778eda715734', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('b16e4261bd0e4591b1ed66186760d012', '0', null, null, '2', '2014-08-04 20:52:11.115', '1407156731115', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.116', null, '2', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.114', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('b2b81dd70d744eca8621f8f278d43646', '0', null, null, '57', '2014-08-04 20:51:35.161', '1407156695161', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:35.227', null, '67', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/index/content', '2014-08-04 20:51:35.16', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '10', 'aa126932641f4e068ed8278a332de85d', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('b6f6034b75c4454aab1426401de4efef', '0', null, null, '5', '2014-08-04 20:52:34.168', '1407156754168', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.171', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.166', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('b7e5035c32414a49af13a1ff33f93d9a', '0', null, null, '5', '2014-08-04 20:52:34.143', '1407156754143', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.145', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.14', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('b8337590b106423dbf83f87285514ec7', '0', null, null, '17', '2014-08-04 20:52:45.841', '1407156765841', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.856', null, '17', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.839', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('b86696dc1e4e49ec88ae95f957a4f178', '0', null, null, '4', '2014-08-04 20:52:11.091', '1407156731091', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.093', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.089', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('b8e203e599074a1683a604565ef2ee5d', '0', null, null, '40', '2014-08-04 20:52:34.132', '1407156754132', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.171', null, '40', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.131', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('b961f54d88ff4085a67a46b3161f73a8', '0', null, null, '5', '2014-08-04 20:52:34.156', '1407156754156', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.16', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.155', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ba6895e1c85b4583bcce83d4e5599ea7', '0', null, null, '1', '2014-08-04 20:51:44.742', '1407156704742', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:44.802', null, '61', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/toUrl?toUrl=/pingtai/operator/add.html', '2014-08-04 20:51:44.741', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '60', '910955c2192a418995eeab8bf15372e9', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ba97305a55304b3d85e8df5f2bf46ff2', '0', null, null, '3', '2014-08-04 20:52:43.233', '1407156763233', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:43.235', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/treeData', '2014-08-04 20:52:43.232', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('bc3cae0e2ee14e6fad35f4d3b9dd500c', '0', null, null, '8', '2014-08-04 20:52:34.137', '1407156754137', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.142', null, '8', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.134', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('c2318d99016f49adb6ee9275b21ad675', '0', null, null, '2', '2014-08-04 20:52:43.158', '1407156763158', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:43.159', null, '2', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/treeData', '2014-08-04 20:52:43.157', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('c33705195ea34a988810aeb4a205574a', '0', null, null, '3', '2014-08-04 20:51:46.591', '1407156706591', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.593', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.59', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('c3ceac4a72614165b8ea5bb2b41f8e41', '0', null, null, '4', '2014-08-04 20:52:34.138', '1407156754138', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.14', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.136', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('c5520fe3556f4d8cb5848501a77c4376', '0', null, null, '6', '2014-08-04 20:52:34.152', '1407156754152', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.155', null, '6', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.149', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('c710a3451a9445d4a7ded2d9dfb736d2', '0', null, null, '1', '2014-08-04 20:52:42.57', '1407156762570', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:42.575', null, '6', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/station', '2014-08-04 20:52:42.569', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '5', '233356b63d8e477fb6e948b703232809', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('c86971fdab2441ff8d48fa9ae89d40d4', '0', null, null, '10', '2014-08-04 20:52:45.791', '1407156765791', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.796', null, '10', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.786', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('c965a4c390c64f838cadfe09d7e0a0da', '0', null, null, '5', '2014-08-04 20:52:43.161', '1407156763161', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:43.165', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/treeData', '2014-08-04 20:52:43.16', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('cbd839cea2f146999003e78310f84708', '0', null, null, '1', '2014-08-04 20:53:12.362', '1407156792362', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:12.363', null, '2', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/menu?systemsIds=d3a5c976c4c24751b6b00ec775692683', '2014-08-04 20:53:12.361', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', 'cf26c1d2baa24a8791b3d264154b80d4', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('d0d999ade02744d7b136fb55e7735c44', '0', null, null, '4', '2014-08-04 20:53:12.977', '1407156792977', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:12.979', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/menu/treeData', '2014-08-04 20:53:12.975', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'a6623c65480f4f2cb63a4d7673f81e3a', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('d4c2c48d7e15467084f6f0fbcc6e4ffc', '0', null, null, '3', '2014-08-04 20:51:46.568', '1407156706568', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.569', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.566', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('d59fd56e2430408f8a540ad3fbb457fb', '0', null, null, '12', '2014-08-04 20:52:43.158', '1407156763158', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:43.168', null, '12', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/treeData', '2014-08-04 20:52:43.156', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('d86e765ec585416796ca9e261c1e08b6', '0', null, null, '3', '2014-08-04 20:51:46.565', '1407156706565', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.567', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.564', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('d8b76c8239904e70a734d580ddf93e98', '0', null, null, '26', '2014-08-04 20:51:34.645', '1407156694645', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ', null, '2014-08-04 20:51:34.735', null, '91', '127.0.0.1', 'GET', null, '/jf/', '2014-08-04 20:51:34.644', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '65', 'f771691134c34174a819b5990310d000', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('dbef3f270c6f4168be44d771a769513a', '0', null, null, '3795', '2014-08-04 20:51:36.427', '1407156696427', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:40.301', null, '3876', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/user', '2014-08-04 20:51:36.425', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '81', '91baed789bc14efdbebb10b49c69ee5b', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('e02cdf08067848feb8ed76304055a989', '0', null, null, '11', '2014-08-04 20:51:46.575', '1407156706575', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.579', null, '11', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.568', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('e04b58187d0c474a9a6a09c1fffc62e0', '0', null, null, '10', '2014-08-04 20:52:11.095', '1407156731095', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.097', null, '10', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.087', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('e18124eeacf046b8922d9b91b3d0f67a', '0', null, null, '5', '2014-08-04 20:51:46.006', '1407156706006', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.009', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.004', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('e22e9782754840a490ccdb5a1089c35b', '0', null, null, '3', '2014-08-04 20:52:11.111', '1407156731111', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.113', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.11', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('e69efca3243246cbb279bf79840bbe23', '0', null, null, '5', '2014-08-04 20:52:34.148', '1407156754148', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.151', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.146', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('e6d738cb810f40f1853beecd957a0d98', '0', null, null, '3', '2014-08-04 20:52:11.107', '1407156731107', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.109', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.106', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('eb3fea554b9b4da1aed28681c8f6d643', '0', null, null, '5', '2014-08-04 20:52:45.753', '1407156765753', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.757', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.752', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('edd2678ffb16440a80128a6a04079454', '0', null, null, '5', '2014-08-04 20:51:46.486', '1407156706486', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.488', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.483', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ee509f3fbeda489396147d3b4cf04901', '0', null, null, '2', '2014-08-04 20:52:45.25', '1407156765250', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.251', null, '2', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.249', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('eedd0f6e91634f5783352940d91c9b8f', '0', null, null, '6', '2014-08-04 20:53:12.903', '1407156792903', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:12.907', null, '6', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/menu/treeData', '2014-08-04 20:53:12.901', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'a6623c65480f4f2cb63a4d7673f81e3a', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('f075a30f4b8c4b07990854c5d1f5859d', '0', null, null, '11', '2014-08-04 20:52:34.062', '1407156754062', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:34.068', null, '11', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:34.057', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('f218e6c3c7d347c8aaeee13d176196f2', '0', null, null, '2', '2014-08-04 20:51:45.947', '1407156705947', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:45.958', null, '13', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/toUrl', '2014-08-04 20:51:45.945', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '11', '0fb7938c7d614fc389568eb67b442303', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('f239411d91e04b3093322929e7221179', '0', null, null, '3', '2014-08-04 20:51:46.562', '1407156706562', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.564', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.561', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('f24201875ac5414d8909ac6752c1a511', '0', null, null, '4', '2014-08-04 20:53:12.952', '1407156792952', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1xi3sejhnmyi210s8r1k6x6xrc', null, '2014-08-04 20:53:12.954', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/menu/treeData', '2014-08-04 20:53:12.95', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'a6623c65480f4f2cb63a4d7673f81e3a', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('f49c64303b6946f1ab2d518718d8b6b1', '0', null, null, '3', '2014-08-04 20:52:42.637', '1407156762637', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:42.639', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/treeData', '2014-08-04 20:52:42.636', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('f7817b3d7579474283e28db1e23627a4', '0', null, null, '4', '2014-08-04 20:52:45.789', '1407156765789', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.792', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.788', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('f874a2260ae84fcea8430a9feb8d0408', '0', null, null, '4', '2014-08-04 20:52:11.117', '1407156731117', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.12', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.116', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('f96ce444c1a94bfcae4f1a2dea2436d8', '0', null, null, '2', '2014-08-04 20:51:34.618', '1407156694618', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ', null, '2014-08-04 20:51:34.62', null, '2', '127.0.0.1', 'GET', null, '/jf/login', '2014-08-04 20:51:34.618', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'fb6a0c1e618041bcbbf8cfd41311b1fa', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, null);
INSERT INTO "public"."pt_syslog" VALUES ('f97a7e27c5844fef90bfa94183dc2fbc', '0', null, null, '6', '2014-08-04 20:52:43.162', '1407156763162', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:43.167', null, '6', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/treeData', '2014-08-04 20:52:43.161', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('fa70a9dd4ef543a39465d2403b704080', '0', null, null, '5', '2014-08-04 20:52:45.849', '1407156765849', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:45.852', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-04 20:52:45.847', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('fbbd1553a79843d89201908710d179cf', '0', null, null, '5', '2014-08-04 20:52:11.086', '1407156731086', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.09', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.085', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('fbc3d1bec4d846c98d435143579d7ba0', '0', null, null, '3', '2014-08-04 20:52:11.122', '1407156731122', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:11.123', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:11.12', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('fce60f62181d4f03afe120a283a56037', '0', null, null, '5', '2014-08-04 20:52:43.159', '1407156763159', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:43.163', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/station/treeData', '2014-08-04 20:52:43.158', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('fdd8996006bb485eaf017368edfae520', '0', null, null, '5', '2014-08-04 20:51:46.571', '1407156706571', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.574', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.569', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ff690e8c67dc41f68eb609882ad16b81', '0', null, null, '5', '2014-08-04 20:51:46.489', '1407156706489', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:51:46.492', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:51:46.487', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ffadcedf2543457aaa7293f585ec98c9', '0', null, null, '5', '2014-08-04 20:52:10.545', '1407156730545', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=i57fs4qvrkri10rr2nk3oj2vh', null, '2014-08-04 20:52:10.548', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-04 20:52:10.543', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');

-- ----------------------------
-- Table structure for "public"."pt_systems"
-- ----------------------------
DROP TABLE "public"."pt_systems";
CREATE TABLE "public"."pt_systems" (
"ids" varchar(32) NOT NULL,
"version" int8,
"description" varchar(200),
"names" varchar(25),
"numbers" varchar(25),
"orderids" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_systems
-- ----------------------------
INSERT INTO "public"."pt_systems" VALUES ('0c1230c98ef34e58947903fab5a4fa85', '0', null, '易信平台', 'yiXin', '3');
INSERT INTO "public"."pt_systems" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '基础平台', '基础平台', 'platform', '1');
INSERT INTO "public"."pt_systems" VALUES ('d3a5c976c4c24751b6b00ec775692683', '0', null, '微信平台', 'weiXin', '2');

-- ----------------------------
-- Table structure for "public"."pt_upload"
-- ----------------------------
DROP TABLE "public"."pt_upload";
CREATE TABLE "public"."pt_upload" (
"ids" varchar(32) NOT NULL,
"version" int8,
"parametername" varchar(50),
"filename" varchar(50),
"contenttype" varchar(100),
"originalfilename" varchar(500),
"path" varchar(500)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_upload
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."pt_user"
-- ----------------------------
DROP TABLE "public"."pt_user";
CREATE TABLE "public"."pt_user" (
"ids" varchar(32) NOT NULL,
"version" int8,
"errorcount" int8,
"orderids" int8,
"password" bytea,
"salt" bytea,
"status" char(1),
"stopdate" timestamp(6),
"username" varchar(50),
"departmentids" varchar(32),
"userinfoids" varchar(32),
"stationids" text,
"deptids" text,
"userids" text,
"groupids" text,
"departmentnames" varchar(25),
"stationnames" text,
"deptnames" text,
"usernames" text,
"groupnames" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_user
-- ----------------------------
INSERT INTO "public"."pt_user" VALUES ('03a44ba0aa4e4905bea726d4da976ba5', '0', '0', '0', E'\\361\\360\\206\\256\\026pU\\321\\030<,\\363~\\353\\020\\357A\\357\\374\\326', E'\\207\\377\\342CWk\\032\\214', '1', null, 'admins', '8a40c0353fa828a6013fa898d4ac0028', '03a44ba0aa4e4905bea726d4da976ba5', '8a40c0353fa828a6013fa898d4ac0026', 'dept_4,dept_2,', 'user_03a44ba0aa4e4905bea726d4da976ba5,', '8a40c0353fa828a6013fa898d4ac0028,', '运维部', '应用Java', '运维部,系统平台部,', 'admins', null);

-- ----------------------------
-- Table structure for "public"."pt_userinfo"
-- ----------------------------
DROP TABLE "public"."pt_userinfo";
CREATE TABLE "public"."pt_userinfo" (
"ids" varchar(32) NOT NULL,
"version" int8,
"address" varchar(300),
"addressinfo" varchar(300),
"avoirdupois" varchar(5),
"birthday" date,
"bloodgroup" varchar(15),
"clientlevelend" timestamp(6),
"clientlevelstart" timestamp(6),
"culture" varchar(30),
"description" varchar(200),
"email" varchar(100),
"finishschooldate" date,
"folk" varchar(20),
"government" varchar(25),
"homepage" varchar(100),
"householder" varchar(20),
"idcard" varchar(25),
"marriage" varchar(20),
"mobile" varchar(20),
"msn" varchar(20),
"names" varchar(25),
"nativityaddress" varchar(20),
"postboy" varchar(6),
"qq" varchar(20),
"schoolname" varchar(20),
"sex" varchar(5),
"speciality" varchar(20),
"stature" varchar(5),
"telephone" varchar(20)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_userinfo
-- ----------------------------
INSERT INTO "public"."pt_userinfo" VALUES ('03a44ba0aa4e4905bea726d4da976ba5', '0', '湖北钟祥', null, '55', '2012-03-07', 'bloodGroup_A', null, null, 'wenHuaChenDu_chuZhong', '湖北钟祥', 'dongcb678@163.com', '2010-10-25', 'folk_han', 'government_dangYuan', 'http://www.4bu4.com', '湖北钟祥', '420881198609285832', 'marriage_no', '13871558042', null, '董华健', '湖北钟祥', '431924', '150584428', '西安外事学院', 'man', '电子商务', '165', '027-65155060');

-- ----------------------------
-- Table structure for "public"."wx_article"
-- ----------------------------
DROP TABLE "public"."wx_article";
CREATE TABLE "public"."wx_article" (
"ids" varchar(32) NOT NULL,
"messageids" varchar(32),
"title" varchar(100),
"description" text,
"picurl" varchar(500),
"url" varchar(500)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."wx_article"."picurl" IS '图片链接，支持JPG、PNG格式，较好的效果为大图640*320，小图80*80';
COMMENT ON COLUMN "public"."wx_article"."url" IS '点击图文消息跳转链接';

-- ----------------------------
-- Records of wx_article
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."wx_file"
-- ----------------------------
DROP TABLE "public"."wx_file";
CREATE TABLE "public"."wx_file" (
"ids" varchar(32) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of wx_file
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."wx_group"
-- ----------------------------
DROP TABLE "public"."wx_group";
CREATE TABLE "public"."wx_group" (
"ids" varchar(32) NOT NULL,
"id" varchar(50),
"name" varchar(50),
"count" numeric(20)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of wx_group
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."wx_keyword"
-- ----------------------------
DROP TABLE "public"."wx_keyword";
CREATE TABLE "public"."wx_keyword" (
"ids" varchar(32) NOT NULL,
"question" varchar(500),
"questionkey" varchar(500),
"answer" text
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."wx_keyword"."question" IS '问题';
COMMENT ON COLUMN "public"."wx_keyword"."questionkey" IS '问题关键字';
COMMENT ON COLUMN "public"."wx_keyword"."answer" IS '答案';

-- ----------------------------
-- Records of wx_keyword
-- ----------------------------
INSERT INTO "public"."wx_keyword" VALUES ('5d87838f24d34c5bbd33a24cd8f2c595', '哈哈', '哈哈，嘿嘿，嘻嘻', '高兴');

-- ----------------------------
-- Table structure for "public"."wx_location"
-- ----------------------------
DROP TABLE "public"."wx_location";
CREATE TABLE "public"."wx_location" (
"ids" varchar(32) NOT NULL,
"open_id" varchar(32),
"lng" varchar(10),
"lat" varchar(10),
"bd09_lng" varchar(10),
"bd09_lat" varchar(10),
"createdate" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of wx_location
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."wx_message"
-- ----------------------------
DROP TABLE "public"."wx_message";
CREATE TABLE "public"."wx_message" (
"ids" varchar(32) NOT NULL,
"inouts" char(1),
"datatype" char(1),
"datacontent" text,
"createdate" timestamptz(6),
"msgtype" varchar(50),
"event" varchar(50),
"eventkey" varchar(50),
"tousername" varchar(50),
"fromusername" varchar(50),
"createtime" numeric(20),
"msgid" numeric(64),
"picurl" varchar(500),
"mediaid" varchar(500),
"title" varchar(100),
"description" text,
"url" varchar(500),
"location_x" numeric(20,10),
"location_y" numeric(20,10),
"scale" numeric(20),
"label" varchar(50),
"content" text,
"thumbmediaid" varchar(500),
"format" varchar(20),
"recognition" text,
"latitude" numeric(20,10),
"longitude" numeric(20,10),
"precisions" numeric(20,10),
"ticket" text,
"musicurl" varchar(500),
"hqmusicurl" varchar(500),
"articlecount" numeric(2)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."wx_message"."inouts" IS '0接收，1发出';
COMMENT ON COLUMN "public"."wx_message"."datatype" IS '数据类型：XML或者JSON，0表示XML，1表示JSON';
COMMENT ON COLUMN "public"."wx_message"."datacontent" IS '接收或者发出的数据xml或者json';
COMMENT ON COLUMN "public"."wx_message"."fromusername" IS '发送方帐号（一个OpenID）';
COMMENT ON COLUMN "public"."wx_message"."createtime" IS '消息创建时间 （11位整型）';
COMMENT ON COLUMN "public"."wx_message"."msgid" IS '消息id，64位整型';
COMMENT ON COLUMN "public"."wx_message"."picurl" IS '图片链接';
COMMENT ON COLUMN "public"."wx_message"."mediaid" IS '图片消息媒体id，可以调用多媒体文件下载接口拉取数据';
COMMENT ON COLUMN "public"."wx_message"."title" IS '消息标题';
COMMENT ON COLUMN "public"."wx_message"."description" IS '消息描述';
COMMENT ON COLUMN "public"."wx_message"."url" IS '消息链接';
COMMENT ON COLUMN "public"."wx_message"."location_x" IS '地理位置维度';
COMMENT ON COLUMN "public"."wx_message"."location_y" IS '地理位置经度';
COMMENT ON COLUMN "public"."wx_message"."scale" IS '地图缩放大小';
COMMENT ON COLUMN "public"."wx_message"."label" IS '地理位置信息';
COMMENT ON COLUMN "public"."wx_message"."content" IS '文本消息内容';
COMMENT ON COLUMN "public"."wx_message"."thumbmediaid" IS '视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。';
COMMENT ON COLUMN "public"."wx_message"."format" IS '语音格式，如amr，speex等';
COMMENT ON COLUMN "public"."wx_message"."recognition" IS '语音识别结果，UTF8编码';
COMMENT ON COLUMN "public"."wx_message"."latitude" IS '地理位置纬度';
COMMENT ON COLUMN "public"."wx_message"."longitude" IS '地理位置经度';
COMMENT ON COLUMN "public"."wx_message"."precisions" IS '地理位置精度';
COMMENT ON COLUMN "public"."wx_message"."ticket" IS '二维码的ticket，可用来换取二维码图片';
COMMENT ON COLUMN "public"."wx_message"."musicurl" IS '音乐链接';
COMMENT ON COLUMN "public"."wx_message"."hqmusicurl" IS '高质量音乐链接，WIFI环境优先使用该链接播放音乐';
COMMENT ON COLUMN "public"."wx_message"."articlecount" IS '图文消息个数，限制为10条以内';

-- ----------------------------
-- Records of wx_message
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."wx_role"
-- ----------------------------
DROP TABLE "public"."wx_role";
CREATE TABLE "public"."wx_role" (
"ids" varchar(32) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of wx_role
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."wx_user"
-- ----------------------------
DROP TABLE "public"."wx_user";
CREATE TABLE "public"."wx_user" (
"ids" varchar(32) NOT NULL,
"openid" varchar(50),
"subscribe" char(1),
"subscribetime" numeric(20),
"nickname" varchar(50),
"sex" char(1),
"country" varchar(50),
"province" varchar(50),
"city" varchar(50),
"language" varchar(50),
"headimgurl" varchar(500),
"groupids" varchar(32)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."wx_user"."openid" IS '用户的标识';
COMMENT ON COLUMN "public"."wx_user"."subscribe" IS '关注状态（1是关注，0是未关注），未关注时获取不到其余信息';
COMMENT ON COLUMN "public"."wx_user"."subscribetime" IS '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间';
COMMENT ON COLUMN "public"."wx_user"."nickname" IS '昵称';
COMMENT ON COLUMN "public"."wx_user"."sex" IS '用户的性别（1是男性，2是女性，0是未知）';
COMMENT ON COLUMN "public"."wx_user"."country" IS '用户所在国家';
COMMENT ON COLUMN "public"."wx_user"."province" IS '用户所在省份';
COMMENT ON COLUMN "public"."wx_user"."city" IS '用户所在城市';
COMMENT ON COLUMN "public"."wx_user"."language" IS '用户的语言，简体中文为zh_CN';
COMMENT ON COLUMN "public"."wx_user"."headimgurl" IS '用户头像';

-- ----------------------------
-- Records of wx_user
-- ----------------------------

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table "public"."pt_department"
-- ----------------------------
ALTER TABLE "public"."pt_department" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."pt_dict"
-- ----------------------------
ALTER TABLE "public"."pt_dict" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."pt_group"
-- ----------------------------
ALTER TABLE "public"."pt_group" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."pt_menu"
-- ----------------------------
ALTER TABLE "public"."pt_menu" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."pt_module"
-- ----------------------------
ALTER TABLE "public"."pt_module" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Indexes structure for table pt_operator
-- ----------------------------
CREATE INDEX "onemanyindex" ON "public"."pt_operator" USING btree ("onemany");
CREATE INDEX "returnparamkeysindex" ON "public"."pt_operator" USING btree ("returnparamkeys");
CREATE INDEX "returnurlindex" ON "public"."pt_operator" USING btree ("returnurl");
CREATE INDEX "rowfilterindex" ON "public"."pt_operator" USING btree ("rowfilter");
CREATE INDEX "urlindex" ON "public"."pt_operator" USING btree ("url");

-- ----------------------------
-- Primary Key structure for table "public"."pt_operator"
-- ----------------------------
ALTER TABLE "public"."pt_operator" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."pt_resources"
-- ----------------------------
ALTER TABLE "public"."pt_resources" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."pt_role"
-- ----------------------------
ALTER TABLE "public"."pt_role" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."pt_station"
-- ----------------------------
ALTER TABLE "public"."pt_station" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."pt_syslog"
-- ----------------------------
ALTER TABLE "public"."pt_syslog" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."pt_systems"
-- ----------------------------
ALTER TABLE "public"."pt_systems" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."pt_upload"
-- ----------------------------
ALTER TABLE "public"."pt_upload" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Indexes structure for table pt_user
-- ----------------------------
CREATE INDEX "usernameindex" ON "public"."pt_user" USING btree ("username");

-- ----------------------------
-- Primary Key structure for table "public"."pt_user"
-- ----------------------------
ALTER TABLE "public"."pt_user" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Indexes structure for table pt_userinfo
-- ----------------------------
CREATE INDEX "bloodgroupindex" ON "public"."pt_userinfo" USING btree ("bloodgroup");
CREATE INDEX "emailindex" ON "public"."pt_userinfo" USING btree ("email");
CREATE INDEX "msnindex" ON "public"."pt_userinfo" USING btree ("msn");
CREATE INDEX "nativityaddressindex" ON "public"."pt_userinfo" USING btree ("nativityaddress");
CREATE INDEX "postboyindex" ON "public"."pt_userinfo" USING btree ("postboy");
CREATE INDEX "schoolnameindex" ON "public"."pt_userinfo" USING btree ("schoolname");
CREATE INDEX "specialityindex" ON "public"."pt_userinfo" USING btree ("speciality");

-- ----------------------------
-- Primary Key structure for table "public"."pt_userinfo"
-- ----------------------------
ALTER TABLE "public"."pt_userinfo" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."wx_article"
-- ----------------------------
ALTER TABLE "public"."wx_article" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."wx_file"
-- ----------------------------
ALTER TABLE "public"."wx_file" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."wx_group"
-- ----------------------------
ALTER TABLE "public"."wx_group" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."wx_keyword"
-- ----------------------------
ALTER TABLE "public"."wx_keyword" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."wx_location"
-- ----------------------------
ALTER TABLE "public"."wx_location" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."wx_message"
-- ----------------------------
ALTER TABLE "public"."wx_message" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."wx_role"
-- ----------------------------
ALTER TABLE "public"."wx_role" ADD PRIMARY KEY ("ids");

-- ----------------------------
-- Primary Key structure for table "public"."wx_user"
-- ----------------------------
ALTER TABLE "public"."wx_user" ADD PRIMARY KEY ("ids");
