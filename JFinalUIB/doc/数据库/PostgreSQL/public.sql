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

Date: 2014-08-02 21:22:55
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
"names" varchar(25),
"orderids" int8,
"operatorids" varchar(32),
"parentmenuids" varchar(32),
"systemsids" varchar(32),
"isparent" varchar(5)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of pt_menu
-- ----------------------------
INSERT INTO "public"."pt_menu" VALUES ('017173f642e545b8a7b02fc6f5246b2f', '0', '2.png', null, '用户管理', '2', 'dfe9d74fe0ef4220bfcfe6d7bb2f9436', '625f1e0e951a4199a7262e064512e2c7', null, 'false');
INSERT INTO "public"."pt_menu" VALUES ('294ab73cc8274f1fa0663bf9c1bbe4d4', '0', '2.png', null, '配置项', '3', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('297e0cf944f8cce70144f8dce1540069', '0', '8.png', '0', '字典', '8', '8897dbe85b3e4e6989d662495272cf26', '294ab73cc8274f1fa0663bf9c1bbe4d4', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('3ffaf784ef95497b803d7a9f43c9e7a8', '0', '5.png', null, '自动回复', '5', '0773a58c4bdb4858ab062c4a2a4da69a', '625f1e0e951a4199a7262e064512e2c7', null, 'false');
INSERT INTO "public"."pt_menu" VALUES ('4600e755ec5f4dc6a5783a4d097a42f2', '0', '4.png', null, '位置管理', '4', '420d8ebc68ad44dc8188d4c27dc585d1', '625f1e0e951a4199a7262e064512e2c7', null, 'false');
INSERT INTO "public"."pt_menu" VALUES ('4bae83d582744c928cb8c8f419586a31', '0', '2.png', null, '用户权限', '1', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('5f1b30bcc40e4619a2914bbcb98bf1b2', '0', '3.png', null, 'Log4j', '3', '721f7255449c445faf36607c254eea06', 'ed90c7b40be74552bbfa7ac58efdc5fe', null, 'false');
INSERT INTO "public"."pt_menu" VALUES ('625f1e0e951a4199a7262e064512e2c7', '0', '5.png', null, '微信管理', '5', null, '8a40c0353fa828a6013fa898d4ac1100', null, 'true');
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '3.png', '-1', '后台菜单组织结构', '1', null, null, '8a40c0353fa828a6013fa898d4ac0020', 'true');
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0021', '0', '3.png', '2', '用户', '1', '91baed789bc14efdbebb10b49c69ee5b', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0022', '0', '3.png', '2', '分组', '2', '1b0d7476974e4bf9b52f75fb82f87330', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '3.png', '2', '角色', '3', '7ae62737df444d619f8fd376360d160c', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0024', '0', '3.png', '2', '系统', '5', '7eab5f800bab4efb8df1b2e8a0575f73', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0025', '0', '3.png', '2', '功能', '6', '0da15c49299d41a4b720f787d053e3cb', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '8.png', '2', '岗位', '4', '233356b63d8e477fb6e948b703232809', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', '3.png', '2', '部门', '7', 'ad09a1b897744812875c752c2d70f11a', 'a5bf1c38a2ea4b6085d15b830cb80518', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac1100', '0', '3.png', '-1', '后台菜单组织结构', '1', null, null, 'd3a5c976c4c24751b6b00ec775692683', 'true');
INSERT INTO "public"."pt_menu" VALUES ('8a40c0353fa828a6013fa898d4ac2200', '0', '3.png', '-1', '后台菜单组织结构', '1', null, null, '0c1230c98ef34e58947903fab5a4fa85', 'true');
INSERT INTO "public"."pt_menu" VALUES ('a5bf1c38a2ea4b6085d15b830cb80518', '0', '2.png', null, '组织机构', '2', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('aa2b382e85b348e6a9cd0cb967ff4006', '0', '3.png', null, '消息管理', '3', null, '625f1e0e951a4199a7262e064512e2c7', null, 'false');
INSERT INTO "public"."pt_menu" VALUES ('bd5d741147f74a058a03bbb5164f392b', '0', '2.png', null, '数据源', '9', 'd496b161d2564111992687b948862244', 'ed90c7b40be74552bbfa7ac58efdc5fe', '8a40c0353fa828a6013fa898d4ac0020', 'false');
INSERT INTO "public"."pt_menu" VALUES ('ed30f3cd2e9f4e0aa0b950c147035b67', '0', '2.png', null, '分组管理', '2', '2c91467f905a4f5ba9f52830131c8ad9', '625f1e0e951a4199a7262e064512e2c7', null, 'false');
INSERT INTO "public"."pt_menu" VALUES ('ed90c7b40be74552bbfa7ac58efdc5fe', '0', '2.png', null, '系统维护', '2', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'true');
INSERT INTO "public"."pt_menu" VALUES ('f353e484ce074b86b0210f66346d9a80', '0', '9.png', null, '日志', '10', '235d855d7b914d728e434f0f309aa04d', 'ed90c7b40be74552bbfa7ac58efdc5fe', '8a40c0353fa828a6013fa898d4ac0020', 'false');

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
INSERT INTO "public"."pt_resources" VALUES ('02c0c7d15b8141c4831f3ddee6b6b01e', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1882207919', '8103', '3958', '486', '395', '998', '2', '2014-08-01 21:13:19.981+08');
INSERT INTO "public"."pt_resources" VALUES ('06b3595064934769a1473acdff0793d6', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.2141107875', '8103', '3966', '486', '380', '998', '1', '2014-08-01 20:06:12.557+08');
INSERT INTO "public"."pt_resources" VALUES ('112fd72cc3b643dfad5d19c1a891d962', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1567148566', '8103', '3742', '486', '240', '998', '3', '2014-08-01 21:34:21.38+08');
INSERT INTO "public"."pt_resources" VALUES ('134decff611c4f4fb67ac7ab078f38c0', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.3111590506', '8103', '4119', '486', '410', '998', '1', '2014-08-01 20:04:12.808+08');
INSERT INTO "public"."pt_resources" VALUES ('1c0575d4e4c1460a965d44f7925244bb', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1158292528', '8103', '3623', '486', '164', '998', '4', '2014-08-01 21:40:09.811+08');
INSERT INTO "public"."pt_resources" VALUES ('1cd0898ca38a4c13b6ba32541d756660', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1255636997', '8103', '4283', '486', '359', '998', '1', '2014-08-01 20:08:12.559+08');
INSERT INTO "public"."pt_resources" VALUES ('2660f8ce9c754cf9bb1207b50a57e119', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.2192931615', '8103', '4252', '486', '411', '998', '1', '2014-08-02 21:16:14.403+08');
INSERT INTO "public"."pt_resources" VALUES ('2eb0102a20334b45ae8aaccd86aad60f', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1396545667', '8103', '4256', '486', '416', '998', '2', '2014-08-01 21:09:19.98+08');
INSERT INTO "public"."pt_resources" VALUES ('45c3103e596545eba2ab6b16c1ec477c', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1325661054', '8103', '3857', '486', '411', '998', '1', '2014-08-01 21:45:17.759+08');
INSERT INTO "public"."pt_resources" VALUES ('49afd9c2435448b19532ef5b669c7d85', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1782303750', '8103', '4441', '486', '277', '998', '1', '2014-08-01 21:01:19.977+08');
INSERT INTO "public"."pt_resources" VALUES ('4bbdfa1e17a14287bc00f612fd7c86a0', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.2013350485', '8103', '4602', '486', '341', '998', '1', '2014-08-01 20:10:12.559+08');
INSERT INTO "public"."pt_resources" VALUES ('5e8c290eb8c14a4e9d19c214864b884e', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1324629884', '8103', '3948', '486', '250', '998', '1', '2014-08-02 21:18:14.125+08');
INSERT INTO "public"."pt_resources" VALUES ('613af120ad43479ebf6c6f1a7ddda263', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1971991737', '8103', '3753', '486', '274', '998', '2', '2014-08-01 21:32:39.874+08');
INSERT INTO "public"."pt_resources" VALUES ('7dd7e746c9814390aa412c1583094867', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1480207203', '8103', '4427', '486', '267', '998', '1', '2014-08-01 21:03:19.978+08');
INSERT INTO "public"."pt_resources" VALUES ('86073edf383e472e9edf6de13320754e', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.3775276209', '8103', '4395', '486', '299', '998', '1', '2014-08-01 20:57:19.976+08');
INSERT INTO "public"."pt_resources" VALUES ('87c3287655f74dd684f001e4679a4ff8', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1037121550', '8103', '4081', '486', '374', '998', '2', '2014-08-01 21:17:19.982+08');
INSERT INTO "public"."pt_resources" VALUES ('8f139e5f6b7f421dac8d1e70d0d769f9', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1174810471', '8103', '3761', '486', '218', '998', '3', '2014-08-01 21:36:21.378+08');
INSERT INTO "public"."pt_resources" VALUES ('92d62e821f0b4577a078699b4ace4d76', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1501392516', '8103', '4436', '486', '288', '998', '1', '2014-08-01 20:59:19.976+08');
INSERT INTO "public"."pt_resources" VALUES ('9c07e91911a44f1eb9f2e1bbc433cb1f', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.0815414820', '8103', '4091', '486', '410', '998', '1', '2014-08-01 21:31:10.071+08');
INSERT INTO "public"."pt_resources" VALUES ('a4618f131158468aafcbec0ef5fef04b', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1464573499', '8103', '4408', '486', '256', '998', '1', '2014-08-01 21:05:19.979+08');
INSERT INTO "public"."pt_resources" VALUES ('b73d228a34294826b4d18f5d22993eae', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1467795121', '8103', '4234', '486', '407', '998', '2', '2014-08-01 21:11:19.98+08');
INSERT INTO "public"."pt_resources" VALUES ('b9ab072dd65b4cb3b440464c667c8e4d', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.3538894936', '8103', '4208', '486', '309', '998', '1', '2014-08-01 20:55:19.977+08');
INSERT INTO "public"."pt_resources" VALUES ('cee5692d52124df08a44125e1b40b4f0', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1167037695', '8103', '3973', '486', '386', '998', '2', '2014-08-01 21:15:19.981+08');
INSERT INTO "public"."pt_resources" VALUES ('d4f04f81481641e998d85eb37eec5327', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1243037170', '8103', '3712', '486', '387', '998', '2', '2014-08-02 21:20:14.125+08');
INSERT INTO "public"."pt_resources" VALUES ('de163af2aa0e47659c1b456d81a4777d', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1393894401', '8103', '4419', '486', '246', '998', '1', '2014-08-01 21:07:19.98+08');
INSERT INTO "public"."pt_resources" VALUES ('e56a6cada3b64fc6a966857b8427bfaa', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1282345367', '8103', '3686', '486', '206', '998', '3', '2014-08-01 21:38:21.38+08');
INSERT INTO "public"."pt_resources" VALUES ('ee325bc4f6b84ca2b42b217d3dfbc776', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.9607573880', '8103', '4717', '486', '330', '998', '1', '2014-08-01 20:51:19.981+08');
INSERT INTO "public"."pt_resources" VALUES ('fbbc6ee200e44700a1fd65a0025e1ca3', '0', 'Windows 8.1', '192.168.183.1', 'DADI-20140326OR', '4', '0.1566880272', '8103', '4504', '486', '320', '998', '1', '2014-08-01 20:53:19.974+08');

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
INSERT INTO "public"."pt_role" VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '超级管理员', '系统管理员', 'operator_8f9ab71d526c45359c4476f957987e6d,operator_37218fb52ec94fb4bf76209a17916094,operator_c1e991d1f56749298c18ff69d7777e0b,operator_b13b002e2fad4e95bbe0e4dbc9fbdfe1,operator_9a708f39e123455e84b6125774bab1ea,operator_437e05d09dd94720b67c4f230cdebe58,operator_0fb7938c7d614fc389568eb67b442303,operator_91baed789bc14efdbebb10b49c69ee5b,operator_c04adcd019e04cf3ba7c66af721a18dc,operator_f1f6f2c8f026498c8ee64b7a918d06df,operator_5fcac107c80d493d91b53a815d4b297a,operator_d247fb45be724ed2a2bb5c92d73bf6cf,operator_4376888fd74f4247a926529e5da03442,operator_d479dbdc901f4d85a207b9bace6465ac,operator_79039a2260da46b0aabb5a62e8db6c87,operator_1a8b4d8e4411412fa8bb561393563a85,operator_e754dfdb794d4e7db6023c9b089a340c,operator_48db51f20b504c4ab489b1dcfd3ecbd9,operator_bc2c865be6af42cf861294d446fb1c6f,operator_cf26c1d2baa24a8791b3d264154b80d4,operator_b82d86fb7b64498a9c2b8b9a99b3fbeb,operator_10499bc7f9cb4adf99beba00343b4ea6,operator_9f75b47bdc0249e2b493c47384785a72,operator_a1ff68acf9b24c34b347ff21e333cb70,operator_a6623c65480f4f2cb63a4d7673f81e3a,operator_df0aa534655242e4a0bcd638b51a4e03,operator_4a6544ae7a2548ad81c0e3994999023c,operator_f771691134c34174a819b5990310d000,operator_886bd497064b4c9f87d8461ebba421d1,operator_aa126932641f4e068ed8278a332de85d,operator_fb6a0c1e618041bcbbf8cfd41311b1fa,operator_f771691134c34174a819b5990310da56,operator_7ed5eefbbf3d4aa78d0c5b99f3b7010c,operator_1b0d7476974e4bf9b52f75fb82f87330,operator_a5289b2638d845fbb06dedbcdd517f97,operator_c9d013d14cbd4f148fb4562c91803ee8,operator_22926eb196a14b48be775f4880b5ba94,operator_b8339f29d8d84a4ead6454295f87b79c,operator_e037e0bae9a94e549d6b647db49a64a1,operator_a0c01a5248cd4bf38e57945dbb2b98c5,operator_3ee5f986289d4a1990f4e42c9a0caadb,operator_d496b161d2564111992687b948862244,operator_4df80521e66447618796c3cfe02bf239,operator_6569e0d9f2cd4e3a97af4e1b0cd8d2f7,operator_f16cadd8f81e4bef926e09f718db8fe2,operator_091855dd809b418fae88a7fec6d9f246,operator_01aa0c85c8b84ae8aca7f5484336b203,operator_d5c8bdf7a49a4e46b776c05dc9ead484,operator_2be34991827e4e8da8e92f9b9e8bce25,operator_8f79857b31d4475a94c712e997e89c99,operator_12141c1c3be241ca8a868bce9cd610d5,operator_21b0a910ef6e4c60a325d5e57e6e6f65,operator_d1e14e0b7f69478394850d2238214692,operator_74aa20442105408d90f9e6469a3a92b5,operator_8897dbe85b3e4e6989d662495272cf26,operator_7ae62737df444d619f8fd376360d160c,operator_335d1f8f46eb47a18001889f8cc21348,operator_7cc12b5c154a4a9782c518c57e8ab3aa,operator_78c6026c6af44b41a6bef4cdb4cfb414,operator_15566e63f3104c73b4a0b4a784dd11ca,operator_acbceb432b5849aca9e9b284240281ec,operator_d646da8707ae41838fd2ec9bf0d467ee,operator_29c18b3394924c30882da049da14ad99,operator_c0ccfcd127c347a8b9db140e5aa62188,operator_ca0f6da01ada419eaa7739d9790e5b88,operator_233356b63d8e477fb6e948b703232809,operator_362cf247241c4d12b6242301e4a73516,operator_c29ea4cbd9044bc786e9f4584ad840ff,operator_2fbbc9cfb0bf4b5bb504ead155c3423c,operator_c7132250f5054b808bb119122a6ecb52,operator_09b6ce29313c4051ba765de516a9b283,operator_dc750e57b54f4baca78d66969321ee51,operator_21141da4febe4c929abe37126b37fd12,operator_c081c50918f4459f8e36ab8cb4151a61,operator_2fee901117c64e18873f60e8f800713d,operator_7eab5f800bab4efb8df1b2e8a0575f73,operator_32a3e59964204a3c8848e84b864306ae,operator_8bd9c0e14df941cdaf6253cd08dbd9cd,operator_7b4281dd247c4624bee0d8f84c2c2715,operator_c05642442e0a468ebe4f0b7771a803ae,operator_5b249ad344d948b99f58768c323f5f71,operator_0da15c49299d41a4b720f787d053e3cb,operator_cc6bcbee40ab43b2bd5aff6d9385e1fc,operator_83ef85fd17804bb195d0ad3c07f88c30,operator_ad51a6ca95c646ce9c03778eda715734,operator_6daed51284f94923b1c8a6414e646959,operator_1b1a809815574b2a9c1d0e18d692de17,operator_b23b17d4c83242e8a1a8ee8cfcde9907,operator_910955c2192a418995eeab8bf15372e9,operator_ad09a1b897744812875c752c2d70f11a,operator_f82c021dc443419fb2469032af73bf3e,operator_053d330462e1459ca1012c9d29113bc4,operator_58a85040aa9f40cca0bdba6e23e30363,operator_b4ee4ae4391f4243be69e838545d2131,operator_1046389d8525451697f2793185e7d6ee,operator_46e00ef0fd234e9dbf68ed9bbb437d0f,operator_b8218945b8e743f29651569950014511,operator_d115d08591ef4c0eaebef15f8294b287,operator_235d855d7b914d728e434f0f309aa04d,operator_fd9978df5c5a47f298e2d28e21e70b15,operator_8ca8af501522439d8c9249e00db5d78d,operator_dfe9d74fe0ef4220bfcfe6d7bb2f9436,operator_2c91467f905a4f5ba9f52830131c8ad9,operator_481d4d5c0a634c4085c72c990260e58d,operator_420d8ebc68ad44dc8188d4c27dc585d1,operator_5148ea207b974ee197f0bc57060ab1ad,operator_0773a58c4bdb4858ab062c4a2a4da69a,operator_9765e6bb76eb40ab800cb8954822190e,operator_77823e12391a47729a1f82a00bc15c5b,operator_05114c0cbe1f4c2095b3216f13cfb681,operator_6b527ed138c343a89ddf73cf16fef565,operator_dfc7af0979a54e8e9a3f18b7a5d66030,operator_3dd486cd58da467dbd83ae420db14815,operator_721f7255449c445faf36607c254eea06,operator_9c0ae757fc564f27860b975e5792ae6a,operator_5c2bdc059ae24ffda2758a2781bb46da,operator_6566adb7fc6347e7b01a3c47129b5eb5,operator_6324ff9e83654aa0bf7f9d918b636b55,', 'module_8a40c0353fa828a6013fa898d4ac0033,module_8a40c0353fa828a6013fa898d4ac0030,module_8a40c0353fa828a6013fa898d4ac0031,module_8a40c0353fa828a6013fa898d4ac0032,module_8a40c0353fa828a6013fa898d4ac0021,module_8a40c0353fa828a6013fa898d4ac0023,module_297e0cf944e9762e0144e97dfd6e00c9,module_8a40c0353fa828a6013fa898d4ac0024,module_8a40c0353fa828a6013fa898d4ac0025,module_8a40c0353fa828a6013fa898d4ac0026,module_8a40c0353fa828a6013fa898d4ac0027,module_8a40c0353fa828a6013fa898d4ac0028,module_8a40c0353fa828a6013fa898d4ac0029,module_8a40c0353fa828a6013fa898d4ac1100,module_c4e63c4171db4ae2a83f7dfcc2656b0e,module_e6eb0165223447218410f867a9614300,module_417ed3d3cf4d4b7a939613829e8db17d,module_7a35846a305c42abb68601b4f7347289,module_c87c35097a2d4bc898fe6e9b1e280a3d,module_8f53706d4af541588bde334d99d44727,module_8a40c0353fa828a6013fa898d4ac2200,module_f85f516c0b86439087d48a45173ba0e7,module_529d39f773a54ff39eea877f606d74b0,');

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
INSERT INTO "public"."pt_station" VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '应用Java', '8.png', 'false', '应用Java', '3', '8a40c0353fa828a6013fa898d4ac0027', 'operator_37218fb52ec94fb4bf76209a17916094,operator_c1e991d1f56749298c18ff69d7777e0b,operator_b13b002e2fad4e95bbe0e4dbc9fbdfe1,operator_9a708f39e123455e84b6125774bab1ea,operator_437e05d09dd94720b67c4f230cdebe58,operator_0fb7938c7d614fc389568eb67b442303,operator_91baed789bc14efdbebb10b49c69ee5b,operator_c04adcd019e04cf3ba7c66af721a18dc,operator_f1f6f2c8f026498c8ee64b7a918d06df,operator_5fcac107c80d493d91b53a815d4b297a,operator_d247fb45be724ed2a2bb5c92d73bf6cf,operator_4376888fd74f4247a926529e5da03442,operator_d479dbdc901f4d85a207b9bace6465ac,operator_79039a2260da46b0aabb5a62e8db6c87,operator_1a8b4d8e4411412fa8bb561393563a85,operator_e754dfdb794d4e7db6023c9b089a340c,operator_bc2c865be6af42cf861294d446fb1c6f,operator_cf26c1d2baa24a8791b3d264154b80d4,operator_b82d86fb7b64498a9c2b8b9a99b3fbeb,operator_10499bc7f9cb4adf99beba00343b4ea6,operator_9f75b47bdc0249e2b493c47384785a72,operator_a1ff68acf9b24c34b347ff21e333cb70,operator_a6623c65480f4f2cb63a4d7673f81e3a,operator_df0aa534655242e4a0bcd638b51a4e03,operator_4a6544ae7a2548ad81c0e3994999023c,operator_f771691134c34174a819b5990310d000,operator_886bd497064b4c9f87d8461ebba421d1,operator_aa126932641f4e068ed8278a332de85d,operator_fb6a0c1e618041bcbbf8cfd41311b1fa,operator_f771691134c34174a819b5990310da56,operator_7ed5eefbbf3d4aa78d0c5b99f3b7010c,operator_1b0d7476974e4bf9b52f75fb82f87330,operator_a5289b2638d845fbb06dedbcdd517f97,operator_c9d013d14cbd4f148fb4562c91803ee8,operator_22926eb196a14b48be775f4880b5ba94,operator_b8339f29d8d84a4ead6454295f87b79c,operator_e037e0bae9a94e549d6b647db49a64a1,operator_a0c01a5248cd4bf38e57945dbb2b98c5,operator_3ee5f986289d4a1990f4e42c9a0caadb,operator_d496b161d2564111992687b948862244,operator_4df80521e66447618796c3cfe02bf239,operator_f16cadd8f81e4bef926e09f718db8fe2,operator_6569e0d9f2cd4e3a97af4e1b0cd8d2f7,operator_091855dd809b418fae88a7fec6d9f246,operator_01aa0c85c8b84ae8aca7f5484336b203,operator_d5c8bdf7a49a4e46b776c05dc9ead484,operator_2be34991827e4e8da8e92f9b9e8bce25,operator_8f79857b31d4475a94c712e997e89c99,operator_12141c1c3be241ca8a868bce9cd610d5,operator_d1e14e0b7f69478394850d2238214692,operator_21b0a910ef6e4c60a325d5e57e6e6f65,operator_8897dbe85b3e4e6989d662495272cf26,operator_74aa20442105408d90f9e6469a3a92b5,operator_7ae62737df444d619f8fd376360d160c,operator_335d1f8f46eb47a18001889f8cc21348,operator_7cc12b5c154a4a9782c518c57e8ab3aa,operator_78c6026c6af44b41a6bef4cdb4cfb414,operator_15566e63f3104c73b4a0b4a784dd11ca,operator_acbceb432b5849aca9e9b284240281ec,operator_d646da8707ae41838fd2ec9bf0d467ee,operator_29c18b3394924c30882da049da14ad99,operator_c0ccfcd127c347a8b9db140e5aa62188,operator_ca0f6da01ada419eaa7739d9790e5b88,operator_233356b63d8e477fb6e948b703232809,operator_362cf247241c4d12b6242301e4a73516,operator_c29ea4cbd9044bc786e9f4584ad840ff,operator_2fbbc9cfb0bf4b5bb504ead155c3423c,operator_c7132250f5054b808bb119122a6ecb52,operator_09b6ce29313c4051ba765de516a9b283,operator_dc750e57b54f4baca78d66969321ee51,operator_21141da4febe4c929abe37126b37fd12,operator_c081c50918f4459f8e36ab8cb4151a61,operator_2fee901117c64e18873f60e8f800713d,operator_7eab5f800bab4efb8df1b2e8a0575f73,operator_32a3e59964204a3c8848e84b864306ae,operator_8bd9c0e14df941cdaf6253cd08dbd9cd,operator_7b4281dd247c4624bee0d8f84c2c2715,operator_c05642442e0a468ebe4f0b7771a803ae,operator_5b249ad344d948b99f58768c323f5f71,operator_0da15c49299d41a4b720f787d053e3cb,operator_cc6bcbee40ab43b2bd5aff6d9385e1fc,operator_83ef85fd17804bb195d0ad3c07f88c30,operator_ad51a6ca95c646ce9c03778eda715734,operator_6daed51284f94923b1c8a6414e646959,operator_1b1a809815574b2a9c1d0e18d692de17,operator_b23b17d4c83242e8a1a8ee8cfcde9907,operator_910955c2192a418995eeab8bf15372e9,operator_ad09a1b897744812875c752c2d70f11a,operator_f82c021dc443419fb2469032af73bf3e,operator_053d330462e1459ca1012c9d29113bc4,operator_58a85040aa9f40cca0bdba6e23e30363,operator_b4ee4ae4391f4243be69e838545d2131,operator_1046389d8525451697f2793185e7d6ee,operator_46e00ef0fd234e9dbf68ed9bbb437d0f,operator_b8218945b8e743f29651569950014511,operator_d115d08591ef4c0eaebef15f8294b287,operator_235d855d7b914d728e434f0f309aa04d,operator_fd9978df5c5a47f298e2d28e21e70b15,operator_8ca8af501522439d8c9249e00db5d78d,operator_2c91467f905a4f5ba9f52830131c8ad9,operator_481d4d5c0a634c4085c72c990260e58d,operator_5148ea207b974ee197f0bc57060ab1ad,operator_420d8ebc68ad44dc8188d4c27dc585d1,operator_48db51f20b504c4ab489b1dcfd3ecbd9,operator_0773a58c4bdb4858ab062c4a2a4da69a,operator_9765e6bb76eb40ab800cb8954822190e,operator_77823e12391a47729a1f82a00bc15c5b,operator_05114c0cbe1f4c2095b3216f13cfb681,operator_6b527ed138c343a89ddf73cf16fef565,operator_dfc7af0979a54e8e9a3f18b7a5d66030,operator_3dd486cd58da467dbd83ae420db14815,operator_dfe9d74fe0ef4220bfcfe6d7bb2f9436,operator_6566adb7fc6347e7b01a3c47129b5eb5,operator_721f7255449c445faf36607c254eea06,operator_9c0ae757fc564f27860b975e5792ae6a,operator_5c2bdc059ae24ffda2758a2781bb46da,', 'module_8a40c0354328e527014328e884be0016,module_pingTai,module_pingTai00020,module_pingTai0004,module_pingTai00016,module_pingTai0007,module_pingTai00012,module_297e0cf944f8cce70144f8e166a40167,module_pingTai00015,module_pingTai00022,module_pingTai00010,module_pingTai00018,module_pingTai0006,module_pingTai00023,module_pingTai00011,module_8a40c0353fa828a6013fa898d4ac0033,module_8a40c0353fa828a6013fa898d4ac0031,module_8a40c0353fa828a6013fa898d4ac0032,module_8a40c0353fa828a6013fa898d4ac0021,module_8a40c0353fa828a6013fa898d4ac0023,module_297e0cf944e9762e0144e97dfd6e00c9,module_8a40c0353fa828a6013fa898d4ac0022,module_8a40c0353fa828a6013fa898d4ac0024,module_8a40c0353fa828a6013fa898d4ac0025,module_8a40c0353fa828a6013fa898d4ac0026,module_8a40c0353fa828a6013fa898d4ac0027,module_8a40c0353fa828a6013fa898d4ac0028,module_8a40c0353fa828a6013fa898d4ac0029,module_e6eb0165223447218410f867a9614300,module_7a35846a305c42abb68601b4f7347289,module_c87c35097a2d4bc898fe6e9b1e280a3d,module_8f53706d4af541588bde334d99d44727,module_529d39f773a54ff39eea877f606d74b0,module_f85f516c0b86439087d48a45173ba0e7,');
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
INSERT INTO "public"."pt_syslog" VALUES ('0115cd06f95744a2927b761cfafc613b', '0', null, null, '3', '2014-08-02 21:17:59.771', '1406985479771', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:59.797', null, '27', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/dict/view/83f4b0ee56904cbeb5f91696ad804c29', '2014-08-02 21:17:59.77', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '24', '6324ff9e83654aa0bf7f9d918b636b55', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('08bdfba1e2c6415bad51bec7f2ca41a5', '0', null, null, '77', '2014-08-01 21:32:05.026', '1406899925026', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1ejgo0ebyol4uor8prfqdq4vw', null, '2014-08-01 21:32:05.113', null, '89', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/index/content', '2014-08-01 21:32:05.024', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '12', 'aa126932641f4e068ed8278a332de85d', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('0eac5549d0094fc890b5914d707d1dc5', '0', null, null, '39', '2014-08-02 21:17:48.475', '1406985468475', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:48.502', null, '39', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/role/setOperator', '2014-08-02 21:17:48.463', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'd646da8707ae41838fd2ec9bf0d467ee', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('16fbb21214014b6ca1bc216a58763958', '0', null, null, '67', '2014-08-01 21:45:50.405', '1406900750405', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=r2albv6sys5pmut7z5hog8f5', null, '2014-08-01 21:45:50.481', null, '77', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/index/content', '2014-08-01 21:45:50.404', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '10', 'aa126932641f4e068ed8278a332de85d', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('192cd777e01f4df39b88e080af02de52', '0', null, null, '179', '2014-08-01 21:40:42.458', '1406900442458', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1ejgo0ebyol4uor8prfqdq4vw', null, '2014-08-01 21:40:42.646', null, '189', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/index/content', '2014-08-01 21:40:42.457', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '10', 'aa126932641f4e068ed8278a332de85d', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('1a9475a472d543e3ba987502455e983d', '0', null, null, '2', '2014-08-02 21:20:07.558', '1406985607558', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:07.562', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/dict', '/jf/dict/treeTable', '2014-08-02 21:20:07.558', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '2', '2be34991827e4e8da8e92f9b9e8bce25', 'text/plain, */*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('1c3fe0d025b14001acdba4c0a271dd8e', '0', null, null, '754', '2014-08-01 21:31:27.527', '1406899887527', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ', null, '2014-08-01 21:31:28.277', null, '754', '127.0.0.1', 'GET', null, '/jf/login', '2014-08-01 21:31:27.523', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'fb6a0c1e618041bcbbf8cfd41311b1fa', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, null);
INSERT INTO "public"."pt_syslog" VALUES ('1de0467434dc4a5d91e46ea1b172e585', '0', null, null, '13', '2014-08-02 21:17:36.654', '1406985456654', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:36.679', null, '27', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/operator', '2014-08-02 21:17:36.652', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '14', '0da15c49299d41a4b720f787d053e3cb', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('1f20a2eea9ed46d69194a1bf27781e05', '0', null, null, '11', '2014-08-02 21:17:40.474', '1406985460474', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.484', null, '11', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.473', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('265d4e4d4a4e482fa87edae0d2d5cc22', '0', null, null, '8', '2014-08-02 21:17:15.351', '1406985435351', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.357', null, '8', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.349', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('280ad7a7a91342b49f44135aa63b92c8', '0', null, null, '5', '2014-08-02 21:17:15.402', '1406985435402', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.405', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.4', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('294041b30e5d4b229968f896cca19250', '0', null, null, '4', '2014-08-02 21:17:54.872', '1406985474872', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:54.894', null, '23', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/dict', '2014-08-02 21:17:54.871', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '19', '4df80521e66447618796c3cfe02bf239', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('2a26f40b902f4c2cb96bd884d432b421', '0', null, null, '13', '2014-08-02 21:17:15.47', '1406985435470', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.473', null, '13', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.46', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('30954c531fa848d6954f459556ca4d99', '0', null, null, '11', '2014-08-01 21:40:19.921', '1406900419921', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1ejgo0ebyol4uor8prfqdq4vw', null, '2014-08-01 21:40:19.93', null, '11', '127.0.0.1', 'GET', null, '/jf/login', '2014-08-01 21:40:19.919', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'fb6a0c1e618041bcbbf8cfd41311b1fa', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, null);
INSERT INTO "public"."pt_syslog" VALUES ('33919d986622496b9b7afbaab6a53daa', '0', null, null, '4', '2014-08-02 21:17:40.65', '1406985460650', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.653', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.649', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('36288f431a83405085573731730dfca9', '0', null, null, '4', '2014-08-02 21:17:40.608', '1406985460608', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.611', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.607', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('36d52846bf164ae19c0e51479904400d', '0', null, null, '115', '2014-08-02 21:17:15.38', '1406985435380', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.493', null, '115', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.378', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('3703880530be410c8050fc4f21c71778', '0', null, null, '39', '2014-08-02 21:16:46.836', '1406985406836', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ', null, '2014-08-02 21:16:47.248', null, '414', '127.0.0.1', 'GET', null, '/jf/', '2014-08-02 21:16:46.834', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '375', 'f771691134c34174a819b5990310d000', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('3d3751fe6ea64470af060aaaa8d1b085', '0', null, null, '21817', '2014-08-01 21:40:19.952', '1406900419952', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1ejgo0ebyol4uor8prfqdq4vw', null, '2014-08-01 21:40:42.024', null, '22073', '127.0.0.1', 'GET', null, '/jf/', '2014-08-01 21:40:19.951', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '256', 'f771691134c34174a819b5990310d000', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('3f15e629513f4c0199e47f7e32d22f43', '0', null, null, '2', '2014-08-02 21:20:45.154', '1406985645154', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:45.156', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/dict', '/jf/dict/treeTable', '2014-08-02 21:20:45.153', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', '2be34991827e4e8da8e92f9b9e8bce25', 'text/plain, */*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('3ff26d1ef7ed455181b677150dcd9829', '0', null, null, '4', '2014-08-02 21:17:40.564', '1406985460564', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.567', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.563', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('415177a1488248368fdf1ef5e508ed20', '0', null, null, '7', '2014-08-02 21:17:15.25', '1406985435250', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.254', null, '7', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.247', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('421c01c055314e4888dde57febe8471a', '0', null, null, '29', '2014-08-02 21:17:15.362', '1406985435362', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.369', null, '29', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.34', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4378308027b948ecaf05eff0513c841d', '0', null, null, '7', '2014-08-02 21:17:40.652', '1406985460652', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.657', null, '7', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.65', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4616b284976e43dfad9af9436e3fb13d', '0', null, null, '688', '2014-08-02 21:16:46.143', '1406985406143', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ', null, '2014-08-02 21:16:46.828', null, '688', '127.0.0.1', 'GET', null, '/jf/login', '2014-08-02 21:16:46.14', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'fb6a0c1e618041bcbbf8cfd41311b1fa', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, null);
INSERT INTO "public"."pt_syslog" VALUES ('48d7ac1063fd48d48fcd3fce57dad2ae', '0', null, null, '3', '2014-08-02 21:18:09.75', '1406985489750', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:18:09.782', null, '32', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/dict/edit/83f4b0ee56904cbeb5f91696ad804c29', '2014-08-02 21:18:09.75', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '29', '091855dd809b418fae88a7fec6d9f246', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4bc6a08b876a443abd8ca9d5d465774d', '0', null, null, '5', '2014-08-02 21:17:15.244', '1406985435244', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.246', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.241', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4d1ea12cee8f499180e6fc401af72b12', '0', null, null, '7', '2014-08-02 21:17:40.572', '1406985460572', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.576', null, '7', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.569', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4da7325154534fc4970878826a93b46d', '0', null, null, '79', '2014-08-02 21:17:15.381', '1406985435381', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.457', null, '79', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.378', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('4e087ff9333a4163b6ddddd37ecc4291', '0', null, null, '4', '2014-08-02 21:17:15.361', '1406985435361', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.363', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.359', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5228853c51b34ecfb580bb5c3109091b', '0', null, null, '2', '2014-08-02 21:18:06.719', '1406985486719', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:18:06.722', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/dict', '/jf/dict/treeTable', '2014-08-02 21:18:06.719', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', '2be34991827e4e8da8e92f9b9e8bce25', 'text/plain, */*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5382118326534c51b2cc5ca228277b7d', '0', null, null, '11', '2014-08-01 21:32:44.074', '1406899964074', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1ejgo0ebyol4uor8prfqdq4vw', null, '2014-08-01 21:32:44.083', null, '11', '127.0.0.1', 'GET', null, '/jf/login', '2014-08-01 21:32:44.072', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'fb6a0c1e618041bcbbf8cfd41311b1fa', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, null);
INSERT INTO "public"."pt_syslog" VALUES ('55ecdf2b9f474fc1a1d7434c43b8ef91', '0', null, null, '6', '2014-08-02 21:17:40.614', '1406985460614', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.618', null, '6', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.612', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5a90a7df111d45b19267c6732352ec6f', '0', null, null, '1', '2014-08-02 21:20:43.747', '1406985643747', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:43.748', null, '2', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/dict/toUrl?toUrl=/pingtai/dict/treeTableIframe.html', '2014-08-02 21:20:43.746', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', '8897dbe85b3e4e6989d662495272cf26', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5b532ee04d3d40889415a9283b802faa', '0', null, null, '18', '2014-08-02 21:17:15.502', '1406985435502', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.504', null, '18', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.486', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5d68f7fb8f3c4bb3b1904b8744edf6bd', '0', null, null, '5', '2014-08-02 21:17:40.639', '1406985460639', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.643', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.638', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5dae571ad1f44850aea5f3d8185f671a', '0', null, null, '5', '2014-08-02 21:17:39.98', '1406985459980', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:39.984', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/role/getOperator', '2014-08-02 21:17:39.979', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '78c6026c6af44b41a6bef4cdb4cfb414', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('5fac7edc8acc4a5f8264c2e657103484', '0', null, null, '3', '2014-08-02 21:20:08.948', '1406985608948', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:08.952', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/dict/view/83f4b0ee56904cbeb5f91696ad804c29', '2014-08-02 21:20:08.948', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', '6324ff9e83654aa0bf7f9d918b636b55', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('630ecd2e225f404e832e6bfa03d7a6c2', '0', null, null, '2', '2014-08-02 21:20:43.834', '1406985643834', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:43.837', null, '4', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/dict', '2014-08-02 21:20:43.833', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '2', '4df80521e66447618796c3cfe02bf239', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6511f10a6640432ab504f6931b37c143', '0', null, null, '25908', '2014-08-01 21:45:23.771', '1406900723771', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1kt4ftdunku5xr3mzb5qsp7yp', null, '2014-08-01 21:45:50.021', null, '26252', '127.0.0.1', 'GET', null, '/jf/', '2014-08-01 21:45:23.769', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '344', 'f771691134c34174a819b5990310d000', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6600b101607d4bfaa19a55dcb1ed58fb', '0', null, null, '2', '2014-08-02 21:20:06.214', '1406985606214', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:06.216', null, '3', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/dict', '2014-08-02 21:20:06.213', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', '4df80521e66447618796c3cfe02bf239', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('66154a196dd94c468388ca03a67ca90b', '0', null, null, '10', '2014-08-02 21:17:15.502', '1406985435502', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.505', null, '10', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.495', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('66d32b3b93994d908fc7c04f8f3d3506', '0', null, null, '4', '2014-08-02 21:17:38.152', '1406985458152', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:38.172', null, '21', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/role', '2014-08-02 21:17:38.151', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '17', '7ae62737df444d619f8fd376360d160c', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6953a23d72ac48c188f2a9bea135ad3e', '0', null, null, '10', '2014-08-02 21:20:43.703', '1406985643703', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:43.712', null, '10', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/dict/update', '2014-08-02 21:20:43.702', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '8f79857b31d4475a94c712e997e89c99', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('69ce562fd1704d2dbc85860865052c32', '0', null, null, '4', '2014-08-02 21:18:05.069', '1406985485069', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:18:05.073', null, '5', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/dict', '2014-08-02 21:18:05.068', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', '4df80521e66447618796c3cfe02bf239', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6d42ec9fc4e845ffa261c2d475b47b4d', '0', null, null, '15', '2014-08-02 21:17:40.577', '1406985460577', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.58', null, '15', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.565', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6e3972e6dde44a41aa8ce766e990602f', '0', null, null, '5', '2014-08-02 21:17:15.408', '1406985435408', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.411', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.406', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('6f3db04a055f4ac6835b83f599ab5b97', '0', null, null, '9', '2014-08-02 21:17:15.334', '1406985435334', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.339', null, '9', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.33', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('71e2b64c1fe647b2ba8f2da5e0191816', '0', null, null, '9', '2014-08-02 21:17:00.926', '1406985420926', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:00.952', null, '30', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator', '2014-08-02 21:17:00.922', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '21', '0da15c49299d41a4b720f787d053e3cb', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('7277793bc00149cfa5d35022d89d7a30', '0', null, null, '21', '2014-08-02 21:17:15.372', '1406985435372', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.391', null, '21', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.37', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('771a6e9aa6d149fb8fe9ab34732423f7', '0', null, null, '4', '2014-08-02 21:17:15.498', '1406985435498', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.5', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.496', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('7a3b02afb8bd47f1a6f836a5073757fa', '0', null, null, '3', '2014-08-02 21:17:15.394', '1406985435394', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.396', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.393', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('7e69105d99874f8b83bdb22cf4a8d7b2', '0', null, null, '6', '2014-08-02 21:17:40.56', '1406985460560', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.564', null, '6', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.558', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('8195e0b8e855495785fa1df11643d5e9', '0', null, null, '52', '2014-08-02 21:17:15.375', '1406985435375', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.419', null, '52', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.367', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('83984a5123fd454187ceae538c7bf8ec', '0', null, null, '3', '2014-08-02 21:17:56.052', '1406985476052', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:56.084', null, '33', '127.0.0.1', 'POST', 'http://127.1:89/jf/dict', '/jf/dict/treeTable', '2014-08-02 21:17:56.051', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '30', '2be34991827e4e8da8e92f9b9e8bce25', 'text/plain, */*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('890ba261daa641f3a9c7b19e82aef768', '0', null, null, '1', '2014-08-02 21:20:33.054', '1406985633054', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:33.055', null, '2', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/index/toUrl?toUrl=/pingtai/dict/treeTableIframe.html', '2014-08-02 21:20:33.053', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', '8897dbe85b3e4e6989d662495272cf26', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('8b9d768639dd44738551cf848343e9da', '0', null, null, '3', '2014-08-02 21:17:39.97', '1406985459970', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:39.972', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:39.969', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('8c2a73e6676b44b988238c63c76dfe49', '0', null, null, '4', '2014-08-02 21:17:40.657', '1406985460657', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.66', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.656', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('8e951cc0bd7b4e7c931531b2ca127427', '0', null, null, '42', '2014-08-02 21:17:15.415', '1406985435415', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.456', null, '42', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.414', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('93f350a37ccb4fba987bc03d60ac85e4', '0', null, null, '5', '2014-08-02 21:17:40.566', '1406985460566', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.57', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.565', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('966814031b81471484d1658ef54e4e38', '0', null, null, '70', '2014-08-02 21:16:47.621', '1406985407621', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:16:47.702', null, '82', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/index/content', '2014-08-02 21:16:47.62', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '12', 'aa126932641f4e068ed8278a332de85d', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('9824c5800f494d36b2db80465e24d7a5', '0', null, null, '107', '2014-08-02 21:17:15.438', '1406985435438', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.544', null, '107', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.437', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('99893a4701c3410ba5899fa1ad405100', '0', null, null, '10', '2014-08-02 21:17:40.663', '1406985460663', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.671', null, '10', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.661', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('9e385419b1a749418726f184e4b96e2d', '0', null, null, '52351', '2014-08-01 21:32:44.1', '1406899964100', '3', 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1ejgo0ebyol4uor8prfqdq4vw', 'org.postgresql.util.PSQLException: 错误: 语法错误 在 "values" 或附近的
  位置：35', '2014-08-01 21:33:36.602', null, '52503', '127.0.0.1', 'GET', null, '/jf/', '2014-08-01 21:32:44.099', null, '0', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '152', 'f771691134c34174a819b5990310d000', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('9edf836bf29f4375ae9e5ec2196db903', '0', null, null, '5', '2014-08-02 21:17:40.627', '1406985460627', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.631', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.626', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('a30b664732114c46b2bddc46f2ff6e31', '0', null, null, '12', '2014-08-01 21:35:04.004', '1406900104004', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1ejgo0ebyol4uor8prfqdq4vw', null, '2014-08-01 21:35:04.014', null, '12', '127.0.0.1', 'GET', null, '/jf/login', '2014-08-01 21:35:04.002', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'fb6a0c1e618041bcbbf8cfd41311b1fa', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, null);
INSERT INTO "public"."pt_syslog" VALUES ('a66294d145ba438cbeab9228eed0b1d2', '0', null, null, '20', '2014-08-02 21:17:40.475', '1406985460475', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.493', null, '20', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.473', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('aa8c98271418449ebbc66450c6ab4366', '0', null, null, '6', '2014-08-02 21:17:15.247', '1406985435247', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.25', null, '6', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.244', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ae8440d1b8744e3a8b1944915cc5c003', '0', null, null, '10', '2014-08-02 21:17:15.366', '1406985435366', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.368', null, '10', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.358', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('af057cf8057b454080df94f7efea9c2d', '0', null, null, '3', '2014-08-02 21:17:51.505', '1406985471505', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:51.509', null, '5', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/role', '2014-08-02 21:17:51.504', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '2', '7ae62737df444d619f8fd376360d160c', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('af170865dedb4b3a9f25f410e2169d9b', '0', null, null, '11', '2014-08-02 21:17:40.607', '1406985460607', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.613', null, '11', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.602', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('b1a77af53e034cdbaaaa02acb18dbc70', '0', null, null, '1', '2014-08-02 21:17:54.699', '1406985474699', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:54.703', null, '5', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/index/toUrl?toUrl=/pingtai/dict/treeTableIframe.html', '2014-08-02 21:17:54.698', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '4', '8897dbe85b3e4e6989d662495272cf26', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('b37b56822460496197fcf1bb2eb62491', '0', null, null, '9', '2014-08-02 21:17:40.483', '1406985460483', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.489', null, '9', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.48', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('bc7430026d1643b5b9bb4a94a82992e0', '0', null, null, '5', '2014-08-02 21:17:40.62', '1406985460620', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.624', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.619', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('c2d20a478ca9453aa63128b2faa72aa6', '0', null, null, '1', '2014-08-02 21:20:33.163', '1406985633163', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:33.166', null, '3', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/dict', '2014-08-02 21:20:33.163', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '2', '4df80521e66447618796c3cfe02bf239', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('c2e89e88945d430a90f6d8e4401804be', '0', null, null, '3', '2014-08-02 21:18:08.072', '1406985488072', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:18:08.075', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/dict', '/jf/dict/treeTable', '2014-08-02 21:18:08.071', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', '2be34991827e4e8da8e92f9b9e8bce25', 'text/plain, */*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('c5ba995dafa849cbbac6b086f3b00bed', '0', null, null, '107', '2014-08-02 21:17:15.385', '1406985435385', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.489', null, '107', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.382', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('cd52c6b6b4884e8bbe23f89cf95c82d9', '0', null, null, '1', '2014-08-02 21:17:13.281', '1406985433281', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:13.347', null, '67', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/toUrl?toUrl=/pingtai/operator/add.html', '2014-08-02 21:17:13.28', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '66', '910955c2192a418995eeab8bf15372e9', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ce1271e4b09244de8a105eb352bc5b18', '0', null, null, '150', '2014-08-02 21:17:15.389', '1406985435389', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.537', null, '150', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.387', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ce693794cfef42f1b3280f0a08d58540', '0', null, null, '13', '2014-08-02 21:17:40.632', '1406985460632', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.637', null, '13', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.624', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('d0f335daecb04d5da0e2aec3058042e8', '0', null, null, '4', '2014-08-02 21:17:15.345', '1406985435345', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.347', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.343', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('d186aafb0e6e4e869fe8d4c7948a6dc8', '0', null, null, '622', '2014-08-01 21:45:23.133', '1406900723133', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1kt4ftdunku5xr3mzb5qsp7yp', null, '2014-08-01 21:45:23.752', null, '622', '127.0.0.1', 'GET', null, '/jf/login', '2014-08-01 21:45:23.13', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'fb6a0c1e618041bcbbf8cfd41311b1fa', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, null);
INSERT INTO "public"."pt_syslog" VALUES ('d272514b618d435584fcd7f6053f7cb9', '0', null, null, '8', '2014-08-02 21:17:40.636', '1406985460636', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.641', null, '8', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.633', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('d64f2bac946345a2a7e6394d9f00b385', '0', null, null, '2', '2014-08-02 21:17:14.71', '1406985434710', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:14.716', null, '8', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/toUrl', '2014-08-02 21:17:14.708', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '6', '0fb7938c7d614fc389568eb67b442303', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('d72dd331918c4a888d448febf3d8d88c', '0', null, null, '207022', '2014-08-01 21:35:04.023', '1406900104023', '3', 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1ejgo0ebyol4uor8prfqdq4vw', 'org.postgresql.util.PSQLException: 错误: 类型 "values_zhcn" 不存在
  位置：23', '2014-08-01 21:38:31.168', null, '207146', '127.0.0.1', 'GET', null, '/jf/', '2014-08-01 21:35:04.022', null, '0', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '124', 'f771691134c34174a819b5990310d000', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('d7d1c439bff444d3b933471adceb45c6', '0', null, null, '8', '2014-08-02 21:16:54.582', '1406985414582', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:16:54.749', null, '169', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/operator', '2014-08-02 21:16:54.58', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '161', '0da15c49299d41a4b720f787d053e3cb', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('d8e9d3043b81423f945630b41f9bd138', '0', null, null, '3', '2014-08-02 21:20:34.642', '1406985634642', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:34.645', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/dict', '/jf/dict/treeTable', '2014-08-02 21:20:34.641', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', '2be34991827e4e8da8e92f9b9e8bce25', 'text/plain, */*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('dbabc74fab0e4c05991e5e950c95700f', '0', null, null, '2', '2014-08-02 21:17:56.782', '1406985476782', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:56.784', null, '3', '127.0.0.1', 'POST', 'http://127.1:89/jf/dict', '/jf/dict/treeTable', '2014-08-02 21:17:56.781', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', '2be34991827e4e8da8e92f9b9e8bce25', 'text/plain, */*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('dd1ecbfcb2df4118ad87b85652ac73b8', '0', null, null, '35991', '2014-08-01 21:31:28.284', '1406899888284', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ', null, '2014-08-01 21:32:04.619', null, '36338', '127.0.0.1', 'GET', null, '/jf/', '2014-08-01 21:31:28.281', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '347', 'f771691134c34174a819b5990310d000', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', null, null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('dd520c14170f4b3c8be5451b12a3d5bb', '0', null, null, '4', '2014-08-02 21:17:14.764', '1406985434764', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:14.767', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:14.763', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ddfb1e2801c64e9bbee73672c23d88aa', '0', null, null, '11', '2014-08-02 21:20:06.096', '1406985606096', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:06.106', null, '11', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/dict/update', '2014-08-02 21:20:06.095', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '8f79857b31d4475a94c712e997e89c99', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('df05ad87816a41d4b0e123ad7e8531cf', '0', null, null, '17', '2014-08-02 21:17:15.481', '1406985435481', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:15.491', null, '17', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/module/treeData', '2014-08-02 21:17:15.474', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '9a708f39e123455e84b6125774bab1ea', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('df431a94d5d644a5a9c051b8b6f6eb79', '0', null, null, '1', '2014-08-02 21:17:39.914', '1406985459914', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:39.921', null, '8', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/toUrl', '2014-08-02 21:17:39.913', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '7', 'ca0f6da01ada419eaa7739d9790e5b88', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('dfa1bbf5031f4ecda15d9260b8ffbc24', '0', null, null, '29', '2014-08-02 21:17:40.645', '1406985460645', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.673', null, '29', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.644', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('e7154fe4d73b46239209bd15215935ec', '0', null, null, '4', '2014-08-02 21:20:46.381', '1406985646381', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:46.385', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/dict/view/83f4b0ee56904cbeb5f91696ad804c29', '2014-08-02 21:20:46.38', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '1', '6324ff9e83654aa0bf7f9d918b636b55', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ead2b7bf6bbd4cf4b11941df9af2d2d5', '0', null, null, '27', '2014-08-02 21:17:36.578', '1406985456578', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:36.603', null, '27', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/save', '2014-08-02 21:17:36.576', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', 'ad51a6ca95c646ce9c03778eda715734', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ee50e2d8a5e6403ea428a998468e5570', '0', null, null, '9', '2014-08-02 21:17:40.662', '1406985460662', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.669', null, '9', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.66', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('f0702f514c54446e8a1d3b490bc617dc', '0', null, null, '5', '2014-08-02 21:17:40.602', '1406985460602', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.606', null, '5', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.601', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('f0821fe3cbe4485aa9940bcead385bbd', '0', null, null, '2', '2014-08-02 21:20:06.121', '1406985606121', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:06.121', null, '2', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/dict/toUrl?toUrl=/pingtai/dict/treeTableIframe.html', '2014-08-02 21:20:06.119', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '8897dbe85b3e4e6989d662495272cf26', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('f75a54c375b84bc4931a800584879d51', '0', null, null, '1', '2014-08-02 21:18:04.904', '1406985484904', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:18:04.905', null, '1', '127.0.0.1', 'GET', 'http://127.1:89/jf/', '/jf/index/toUrl?toUrl=/pingtai/dict/treeTableIframe.html', '2014-08-02 21:18:04.904', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '8897dbe85b3e4e6989d662495272cf26', '*/*', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('fbb2740705e3486ea3a86fd209274d58', '0', null, null, '4', '2014-08-02 21:17:40.645', '1406985460645', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.648', null, '4', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.644', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('fee1b40808ae421d9b82e255f7be71e9', '0', null, null, '8', '2014-08-02 21:20:35.812', '1406985635812', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:20:35.817', null, '10', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/dict/edit/83f4b0ee56904cbeb5f91696ad804c29', '2014-08-02 21:20:35.807', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '2', '091855dd809b418fae88a7fec6d9f246', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "public"."pt_syslog" VALUES ('ffbf999c65e2495dbe3deae17221e5fd', '0', null, null, '7', '2014-08-02 21:17:40.559', '1406985460559', null, 'current_theme=united; userName=admins; authmark=QXpGME96YnVnR1VWdGlZalFFUGJxK2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCSDV4U2VOZzJpdEU2UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; JSESSIONID=1hzyoy333qrcidnb2a9shlbuh', null, '2014-08-02 21:17:40.562', null, '7', '127.0.0.1', 'POST', 'http://127.1:89/jf/', '/jf/operator/treeData', '2014-08-02 21:17:40.555', null, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '6daed51284f94923b1c8a6414e646959', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', 'keep-alive', '127.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');

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
