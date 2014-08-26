/*
Navicat Oracle Data Transfer
Oracle Client Version : 10.2.0.5.0

Source Server         : localhost-oracle
Source Server Version : 110200
Source Host           : localhost:1521
Source Schema         : SCOTT

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2014-08-26 15:42:09
*/


-- ----------------------------
-- Table structure for "SCOTT"."PT_DEPARTMENT"
-- ----------------------------
DROP TABLE "SCOTT"."PT_DEPARTMENT";
CREATE TABLE "SCOTT"."PT_DEPARTMENT" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"ALLCHILDNODEIDS" VARCHAR2(2000 BYTE) NULL ,
"DEPARTMENTLEVEL" NUMBER(19) NULL ,
"DEPTTYPE" CHAR(1 BYTE) NULL ,
"DESCRIPTION" VARCHAR2(200 BYTE) NULL ,
"IMAGES" VARCHAR2(50 BYTE) NULL ,
"ISPARENT" VARCHAR2(5 BYTE) NULL ,
"NAMES" VARCHAR2(25 BYTE) NULL ,
"ORDERIDS" NUMBER(19) NULL ,
"URL" VARCHAR2(100 BYTE) NULL ,
"PARENTDEPARTMENTIDS" VARCHAR2(32 BYTE) NULL ,
"PRINCIPALUSERIDS" VARCHAR2(32 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_DEPARTMENT
-- ----------------------------
INSERT INTO "SCOTT"."PT_DEPARTMENT" VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', null, '-1', null, '根节点', '1_open.png', 'true', '公司部门组织结构', '1', '#', null, null);
INSERT INTO "SCOTT"."PT_DEPARTMENT" VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', null, '0', null, '系统平台部', '2.png', 'true', '系统平台部', '0', null, '8a40c0353fa828a6013fa898d4ac0026', null);
INSERT INTO "SCOTT"."PT_DEPARTMENT" VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', null, '0', null, '运维部', '3.png', 'false', '运维部', '0', null, '8a40c0353fa828a6013fa898d4ac0027', '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_DEPARTMENT" VALUES ('8a40c0353fa828a6013fa898d4ac0029', '0', null, '0', null, '测试账户', '4.png', 'true', '测试部门', '0', null, '8a40c0353fa828a6013fa898d4ac0026', null);
INSERT INTO "SCOTT"."PT_DEPARTMENT" VALUES ('8a40c0353fa828a6013fa898d4ac0030', '0', null, '0', null, '子部门2', '5.png', 'false', '平台组', '0', null, '8a40c0353fa828a6013fa898d4ac0029', '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_DEPARTMENT" VALUES ('b7dd88dc96a748d0a11b52fb56ee5d68', '0', null, null, null, null, '2.png', 'false', '实施组', '2', null, '8a40c0353fa828a6013fa898d4ac0029', null);

-- ----------------------------
-- Table structure for "SCOTT"."PT_DICT"
-- ----------------------------
DROP TABLE "SCOTT"."PT_DICT";
CREATE TABLE "SCOTT"."PT_DICT" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"DESCRIPTION" VARCHAR2(200 BYTE) NULL ,
"IMAGES" VARCHAR2(50 BYTE) NULL ,
"NAMES" VARCHAR2(25 BYTE) NULL ,
"ORDERIDS" NUMBER(19) NULL ,
"PATHS" VARCHAR2(1000 BYTE) NULL ,
"ZHUANGTAI" CHAR(1 BYTE) NULL ,
"PARENTIDS" VARCHAR2(32 BYTE) NULL ,
"ISPARENT" VARCHAR2(5 BYTE) NULL ,
"LEVELS" NUMBER(19) NULL ,
"NUMBERS" VARCHAR2(50 BYTE) NULL ,
"VAL" VARCHAR2(500 BYTE) NULL ,
"I18N" CHAR(1 BYTE) NULL ,
"VAL_ZHCN" VARCHAR2(500 BYTE) NULL ,
"VAL_ZHHK" VARCHAR2(500 BYTE) NULL ,
"VAL_ZHTW" VARCHAR2(500 BYTE) NULL ,
"VAL_JA" VARCHAR2(500 BYTE) NULL ,
"VAL_ENUS" VARCHAR2(500 BYTE) NULL ,
"STATUS" CHAR(1 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_DICT
-- ----------------------------
INSERT INTO "SCOTT"."PT_DICT" VALUES ('0c78f87750a745bbb59005a6ca0f744a', '0', null, '3.png', 'weixinToken', '3', '100103root/83f4b0ee56904cbeb5f91696ad804c29/0c78f87750a745bbb59005a6ca0f744a', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinToken', '123', '1', null, null, null, null, null, '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('10c3fc9a884a4cfc91f47e197913fd50', '1', null, '2.png', '钟祥市', '1', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/10c3fc9a884a4cfc91f47e197913fd50', null, 'a1f14efbb8cb4e44a30bd32194d0f24b', 'false', '3', 'zhongXiangShi', null, null, '钟祥市', '钟祥市', '钟祥市', '钟祥市', '钟祥市', '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('18a137a0b92944ba857b5dec39b4fa69', '0', null, '2.png', '河南省', '2', '100103root/31b6516f36d44fc280b82affc270c479/18a137a0b92944ba857b5dec39b4fa69', null, '31b6516f36d44fc280b82affc270c479', 'false', '2', 'heNanSheng', null, '1', '河南省', '河南省', '河南省', '河南省', '河南省', '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('3082e48992104e3ca8c2f542bbcfbe63', '0', null, '2.png', '三室一厅', '1', '100103root/56e8bdbc8d77460da17e473ee30906b0/3082e48992104e3ca8c2f542bbcfbe63', null, '56e8bdbc8d77460da17e473ee30906b0', 'false', '2', 'sanShiYiTing', null, '1', '三室一厅', '三室一厅', '三室一厅', '三室一厅', '三室一厅', '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('31b6516f36d44fc280b82affc270c479', '2', null, '2.png', '省市区', '1', '100103root/31b6516f36d44fc280b82affc270c479', null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'shengShiQu', null, null, '省市区', '省市区', '省市区', '省市区', '省市区', '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('325acbd77f5b43a894ec4ef53ba20914', '0', null, '2.png', '洪山区', '1', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902/325acbd77f5b43a894ec4ef53ba20914', null, '64659405a79a4ecb9f116ae84ec55902', 'false', '4', 'hongShanQu', null, '1', '洪山区', '洪山区', '洪山区', '洪山区', '洪山区', '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('56e8bdbc8d77460da17e473ee30906b0', '0', null, '2.png', '房屋结构', '2', '100103root/56e8bdbc8d77460da17e473ee30906b0', null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'fangWuJieGou', null, '1', '房屋结构', '房屋结构', '房屋结构', '房屋结构', '房屋结构', '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('64659405a79a4ecb9f116ae84ec55902', '0', null, '2.png', '武汉市', '2', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902', null, 'a1f14efbb8cb4e44a30bd32194d0f24b', 'true', '3', 'wuHanShi', null, '1', '武汉市', '武汉市', '武汉市', '武汉市', '武汉市', '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('7381008292054bccba20224bc33774d7', '6', null, '2.png', 'weixinAppID', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29/7381008292054bccba20224bc33774d7', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppID', '123', '1', '1234', '1234', '1234', '1234', '1234', '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('8094c60d7a594b36bb0187cbce9c4188', '0', null, '2.png', 'weixinAppSecret', '2', '100103root/83f4b0ee56904cbeb5f91696ad804c29/8094c60d7a594b36bb0187cbce9c4188', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppSecret', '123', '1', null, null, null, null, null, '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('83f4b0ee56904cbeb5f91696ad804c29', '0', null, '2.png', '微信配置', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29', null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'weixinConfig', null, '1', null, null, null, null, null, '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '字典树', '1_open.png', '字典树', '1', '100103root', '1', null, 'true', '0', null, null, '0', null, null, null, null, null, '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('a1f14efbb8cb4e44a30bd32194d0f24b', '0', null, '2.png', '湖北省', '1', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b', null, '31b6516f36d44fc280b82affc270c479', 'true', '2', 'huBeiSheng', null, '1', '湖北省', '湖北省', '湖北省', '湖北省', '湖北省', '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('bf1bf96a123447c58b7f181d3e4e6099', '0', null, '2.png', '两室一厅', '2', '100103root/56e8bdbc8d77460da17e473ee30906b0/bf1bf96a123447c58b7f181d3e4e6099', null, '56e8bdbc8d77460da17e473ee30906b0', 'false', '2', 'laingshiyiting', null, '1', '两室一厅', '两室一厅', '两室一厅', '两室一厅', '两室一厅', '1');
INSERT INTO "SCOTT"."PT_DICT" VALUES ('ddbe84891d8b4632ac0dc2bd36f7f323', '0', null, '2.png', '江岸区', '2', '100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902/ddbe84891d8b4632ac0dc2bd36f7f323', null, '64659405a79a4ecb9f116ae84ec55902', 'false', '4', 'jiangAnQu', null, '1', '江岸区', '江岸区', '江岸区', '江岸区', '江岸区', '1');

-- ----------------------------
-- Table structure for "SCOTT"."PT_GROUP"
-- ----------------------------
DROP TABLE "SCOTT"."PT_GROUP";
CREATE TABLE "SCOTT"."PT_GROUP" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"DESCRIPTION" VARCHAR2(200 BYTE) NULL ,
"NAMES" VARCHAR2(25 BYTE) NULL ,
"ROLEIDS" CLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_GROUP
-- ----------------------------
INSERT INTO "SCOTT"."PT_GROUP" VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', '系统管理员组', '系统管理员', '8a40c0353fa828a6013fa898d4ac0023,');

-- ----------------------------
-- Table structure for "SCOTT"."PT_MENU"
-- ----------------------------
DROP TABLE "SCOTT"."PT_MENU";
CREATE TABLE "SCOTT"."PT_MENU" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"IMAGES" VARCHAR2(50 BYTE) NULL ,
"LEVELS" NUMBER(19) NULL ,
"ORDERIDS" NUMBER(19) NULL ,
"OPERATORIDS" VARCHAR2(32 BYTE) NULL ,
"PARENTMENUIDS" VARCHAR2(32 BYTE) NULL ,
"SYSTEMSIDS" VARCHAR2(32 BYTE) NULL ,
"ISPARENT" VARCHAR2(5 BYTE) NULL ,
"NAMES_ZHCN" VARCHAR2(50 BYTE) NULL ,
"NAMES_ZHHK" VARCHAR2(50 BYTE) NULL ,
"NAMES_ZHTW" VARCHAR2(50 BYTE) NULL ,
"NAMES_ENUS" VARCHAR2(50 BYTE) NULL ,
"NAMES_JA" VARCHAR2(50 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_MENU
-- ----------------------------
INSERT INTO "SCOTT"."PT_MENU" VALUES ('017173f642e545b8a7b02fc6f5246b2f', '0', '2.png', null, '2', 'dfe9d74fe0ef4220bfcfe6d7bb2f9436', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '用户管理', null, null, null, null);
INSERT INTO "SCOTT"."PT_MENU" VALUES ('294ab73cc8274f1fa0663bf9c1bbe4d4', '1', '2.png', null, '3', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'true', '配置项', '配置项', '配置项', 'Configuration item', '構成項目');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('297e0cf944f8cce70144f8dce1540069', '2', '8.png', '0', '8', '74aa20442105408d90f9e6469a3a92b5', '294ab73cc8274f1fa0663bf9c1bbe4d4', '8a40c0353fa828a6013fa898d4ac0020', 'false', '字典管理', '字典管理', '字典管理', 'dictionary management', '辞書の管理');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('3272e2e0a7cd4d7f8e1e88abe9d70ae4', '1', '2.png', null, '2', '06244cf3520c49e8a45cbde82a53fa5e', '294ab73cc8274f1fa0663bf9c1bbe4d4', null, 'false', '参数管理', '参数管理', '参数管理', 'Parameter management', 'パラメータの管理');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('3ffaf784ef95497b803d7a9f43c9e7a8', '0', '5.png', null, '5', '0773a58c4bdb4858ab062c4a2a4da69a', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '自动回复', null, null, null, null);
INSERT INTO "SCOTT"."PT_MENU" VALUES ('4600e755ec5f4dc6a5783a4d097a42f2', '0', '4.png', null, '4', '420d8ebc68ad44dc8188d4c27dc585d1', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '位置管理', null, null, null, null);
INSERT INTO "SCOTT"."PT_MENU" VALUES ('4bae83d582744c928cb8c8f419586a31', '1', '2.png', null, '1', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false', '用户权限', '用户权限', '用户权限', 'User privilege', 'ユーザの権限');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('625f1e0e951a4199a7262e064512e2c7', '0', '5.png', null, '5', null, '8a40c0353fa828a6013fa898d4ac1100', null, 'true', '微信管理', null, null, null, null);
INSERT INTO "SCOTT"."PT_MENU" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '1', '3.png', '-1', '1', null, null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '菜单管理', '菜单管理', '菜单管理', 'Menu management', '管理メニュー');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('8a40c0353fa828a6013fa898d4ac0021', '1', '3.png', '2', '1', '91baed789bc14efdbebb10b49c69ee5b', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '用户管理', '用户管理', '用户管理', 'User management', 'ユーザーの管理');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('8a40c0353fa828a6013fa898d4ac0022', '1', '3.png', '2', '2', '1b0d7476974e4bf9b52f75fb82f87330', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '分组管理', '分组管理', '分组管理', 'Group management', 'グループの管理');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('8a40c0353fa828a6013fa898d4ac0023', '1', '3.png', '2', '3', '7ae62737df444d619f8fd376360d160c', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '角色管理', '角色管理', '角色管理', 'Role management', 'キャラクターの管理');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('8a40c0353fa828a6013fa898d4ac0024', '1', '3.png', '2', '5', '7eab5f800bab4efb8df1b2e8a0575f73', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '系统管理', '系统管理', '系统管理', 'System management', 'システム管理');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('8a40c0353fa828a6013fa898d4ac0025', '1', '3.png', '2', '6', '0da15c49299d41a4b720f787d053e3cb', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '功能管理', '功能管理', '功能管理', 'Functional management', '機能管理');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('8a40c0353fa828a6013fa898d4ac0026', '1', '8.png', '2', '4', '233356b63d8e477fb6e948b703232809', '4bae83d582744c928cb8c8f419586a31', '8a40c0353fa828a6013fa898d4ac0020', 'false', '岗位管理', '岗位管理', '岗位管理', 'Post management', 'ポストの管理');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('8a40c0353fa828a6013fa898d4ac0027', '1', '3.png', '2', '7', 'ad09a1b897744812875c752c2d70f11a', 'a5bf1c38a2ea4b6085d15b830cb80518', '8a40c0353fa828a6013fa898d4ac0020', 'false', '部门管理', '部门管理', '部门管理', 'Department management', '部門の管理');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('8a40c0353fa828a6013fa898d4ac1100', '0', '3.png', '-1', '1', null, null, 'd3a5c976c4c24751b6b00ec775692683', 'true', '后台菜单组织结构', null, null, null, null);
INSERT INTO "SCOTT"."PT_MENU" VALUES ('8a40c0353fa828a6013fa898d4ac2200', '0', '3.png', '-1', '1', null, null, '0c1230c98ef34e58947903fab5a4fa85', 'true', '后台菜单组织结构', null, null, null, null);
INSERT INTO "SCOTT"."PT_MENU" VALUES ('9fd1692ae1fc4f3dab4f0fca7c2a6d68', '1', '3.png', null, '3', '36d3b89e378b451ca89d1a41a3c53e10', 'ed90c7b40be74552bbfa7ac58efdc5fe', null, 'false', '在线Log4j', '在线Log4j', '在线Log4j', 'Online Log4j', 'オンラインLog4j');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('a5bf1c38a2ea4b6085d15b830cb80518', '1', '2.png', null, '2', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'false', '组织机构', '组织机构', '组织机构', 'Organization', '組織機構');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('aa2b382e85b348e6a9cd0cb967ff4006', '0', '3.png', null, '3', null, '625f1e0e951a4199a7262e064512e2c7', null, 'false', '消息管理', null, null, null, null);
INSERT INTO "SCOTT"."PT_MENU" VALUES ('bd5d741147f74a058a03bbb5164f392b', '1', '2.png', null, '9', 'd496b161d2564111992687b948862244', 'ed90c7b40be74552bbfa7ac58efdc5fe', '8a40c0353fa828a6013fa898d4ac0020', 'false', '数据源', '数据源', '数据源', 'Data source', 'データソース');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('cdfd617ec645490f98a64bf36102d44f', '6', '6.png', null, '6', null, '625f1e0e951a4199a7262e064512e2c7', null, 'false', '新增菜单12', '新增菜单13', '新增菜单14', '222', '111');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('ed30f3cd2e9f4e0aa0b950c147035b67', '0', '2.png', null, '2', '2c91467f905a4f5ba9f52830131c8ad9', '625f1e0e951a4199a7262e064512e2c7', null, 'false', '分组管理', null, null, null, null);
INSERT INTO "SCOTT"."PT_MENU" VALUES ('ed90c7b40be74552bbfa7ac58efdc5fe', '1', '2.png', null, '2', null, '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020', 'true', '系统维护', '系统维护', '系统维护', 'System maintenance', 'システムのメンテナンス');
INSERT INTO "SCOTT"."PT_MENU" VALUES ('f353e484ce074b86b0210f66346d9a80', '1', '9.png', null, '10', '235d855d7b914d728e434f0f309aa04d', 'ed90c7b40be74552bbfa7ac58efdc5fe', '8a40c0353fa828a6013fa898d4ac0020', 'false', '系统日志', '系统日志', '系统日志', 'The system log', 'システムログ');

-- ----------------------------
-- Table structure for "SCOTT"."PT_MODULE"
-- ----------------------------
DROP TABLE "SCOTT"."PT_MODULE";
CREATE TABLE "SCOTT"."PT_MODULE" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"DESCRIPTION" VARCHAR2(200 BYTE) NULL ,
"IMAGES" VARCHAR2(50 BYTE) NULL ,
"ISPARENT" VARCHAR2(5 BYTE) NULL ,
"NAMES" VARCHAR2(25 BYTE) NULL ,
"ORDERIDS" NUMBER(19) NULL ,
"PARENTMODULEIDS" VARCHAR2(32 BYTE) NULL ,
"SYSTEMSIDS" VARCHAR2(32 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_MODULE
-- ----------------------------
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('297e0cf944e9762e0144e97dfd6e00c9', '0', '数据源', '2.png', 'true', '数据源', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('3bf4c1829bf447979865fc4d2ab75801', '0', null, '2.png', 'true', 'Log4j', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('3dec44186175424cbee2d05ffbb690dd', '0', null, '2.png', 'true', 'Upload', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('3e048ee263c344318e9c4995a5cd35e0', '0', null, '2.png', 'true', '验证码', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('4090cac06e15459789bc5154eef67e4e', '0', null, '2.png', 'true', 'Ueditor', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('417ed3d3cf4d4b7a939613829e8db17d', '0', null, '3.png', 'true', '消息管理', '3', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('7a35846a305c42abb68601b4f7347289', '0', null, '4.png', 'true', '主页管理', '4', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a1b51bb6fae4fac8591f4f387d250ff', '0', null, '2.png', 'true', '参数', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '根节点', '3.png', 'true', '根节点', '1', null, '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0021', '0', '后台登陆', '8.png', 'true', '登陆', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0022', '0', '字典', '2.png', 'true', '字典', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '用户分组管理', '2.png', 'true', '分组', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0024', '0', '角色管理', '2.png', 'true', '角色', '3', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0025', '0', '岗位管理', '5.png', 'true', '岗位', '4', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '系统管理', '5.png', 'true', '系统', '5', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', '功能管理', '7.png', 'true', '功能', '6', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', '部门管理', '3.png', 'true', '部门', '7', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0029', '0', '日志管理', '6.png', 'true', '日志', '11', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0030', '0', '用户管理', '3.png', 'true', '用户', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0031', '0', '公共功能', '5.png', 'true', '公共', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0032', '0', '菜单管理', '8.png', 'true', '菜单', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac0033', '0', '模块管理', '7.png', 'true', '模块', '1', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac1100', '0', '根节点', '3.png', 'true', '根节点', '1', null, 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8a40c0353fa828a6013fa898d4ac2200', '0', '根节点', '3.png', 'true', '根节点', '1', null, '0c1230c98ef34e58947903fab5a4fa85');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('8f53706d4af541588bde334d99d44727', '0', null, '6.png', 'true', '自动回复', '6', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('c4e63c4171db4ae2a83f7dfcc2656b0e', '0', null, '2.png', 'true', '用户管理', '2', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('c87c35097a2d4bc898fe6e9b1e280a3d', '0', null, '5.png', 'true', '位置管理', '5', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('e6eb0165223447218410f867a9614300', '0', null, '2.png', 'true', '分组管理', '2', '8a40c0353fa828a6013fa898d4ac1100', 'd3a5c976c4c24751b6b00ec775692683');
INSERT INTO "SCOTT"."PT_MODULE" VALUES ('51652586b48a4c509075a50d9e28a730', '0', null, '2.png', 'true', '测试模块', '2', '8a40c0353fa828a6013fa898d4ac0020', '8a40c0353fa828a6013fa898d4ac0020');

-- ----------------------------
-- Table structure for "SCOTT"."PT_OPERATOR"
-- ----------------------------
DROP TABLE "SCOTT"."PT_OPERATOR";
CREATE TABLE "SCOTT"."PT_OPERATOR" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"DESCRIPTION" VARCHAR2(200 BYTE) NULL ,
"NAMES" VARCHAR2(50 BYTE) NULL ,
"ONEMANY" CHAR(1 BYTE) NULL ,
"RETURNPARAMKEYS" VARCHAR2(100 BYTE) NULL ,
"RETURNURL" VARCHAR2(200 BYTE) NULL ,
"ROWFILTER" CHAR(1 BYTE) NULL ,
"URL" VARCHAR2(200 BYTE) NULL ,
"MODULEIDS" VARCHAR2(32 BYTE) NULL ,
"SPLITPAGE" CHAR(1 BYTE) NULL ,
"FORMTOKEN" CHAR(1 BYTE) NULL ,
"IPBLACK" CHAR(1 BYTE) NULL ,
"PRIVILEGESS" CHAR(1 BYTE) NULL ,
"ISPV" CHAR(1 BYTE) NULL ,
"PVTYPE" CHAR(1 BYTE) NULL ,
"MODULENAMES" VARCHAR2(50 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_OPERATOR
-- ----------------------------
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('01aa0c85c8b84ae8aca7f5484336b203', '0', null, '保存', null, null, null, '0', '/jf/dict/save', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('05114c0cbe1f4c2095b3216f13cfb681', '0', null, '保存', null, null, null, '0', '/jf/wx/keyword/save', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('053d330462e1459ca1012c9d29113bc4', '0', null, '获取部门负责人', null, null, null, '0', '/jf/dept/getPrincipal', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('06244cf3520c49e8a45cbde82a53fa5e', '0', null, 'treeTableIframe', null, null, null, '0', '/pingtai/param/treeTableIframe.html', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('0773a58c4bdb4858ab062c4a2a4da69a', '0', null, '默认主页', null, null, null, '0', '/jf/wx/keyword', '8f53706d4af541588bde334d99d44727', '1', '0', '0', '1', null, null, '自动回复');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('091855dd809b418fae88a7fec6d9f246', '0', null, '准备更新', null, null, null, '0', '/jf/dict/edit', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('09b6ce29313c4051ba765de516a9b283', '0', null, 'treeData', null, null, null, '0', '/jf/station/treeData', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('0da15c49299d41a4b720f787d053e3cb', '0', null, '默认列表', null, null, null, '0', '/jf/operator', '8a40c0353fa828a6013fa898d4ac0027', '1', '0', '0', '1', null, null, '功能');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('0fb7938c7d614fc389568eb67b442303', '0', null, '单选', null, null, null, '0', '/pingtai/module/radio.html', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('1046389d8525451697f2793185e7d6ee', '0', null, '更新', null, null, null, '0', '/jf/dept/update', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('10499bc7f9cb4adf99beba00343b4ea6', '0', null, '获取菜单功能', null, null, null, '0', '/jf/menu/getOperator', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('12141c1c3be241ca8a868bce9cd610d5', '0', null, '准备添加', null, null, null, '0', '/pingtai/dict/add.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('15566e63f3104c73b4a0b4a784dd11ca', '0', null, '保存', null, null, null, '0', '/jf/role/save', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('1a8b4d8e4411412fa8bb561393563a85', '0', null, '准备添加', null, null, null, '0', '/pingtai/user/add.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('1b0d7476974e4bf9b52f75fb82f87330', '0', null, '分组默认列表', null, null, null, '0', '/jf/group', '8a40c0353fa828a6013fa898d4ac0023', '1', '0', '0', '1', null, null, '分组');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('1b1a809815574b2a9c1d0e18d692de17', '0', null, '更新', null, null, null, '0', '/jf/operator/update', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('21141da4febe4c929abe37126b37fd12', '0', null, '多选', null, null, null, '0', '/pingtai/station/checkbox.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('21b0a910ef6e4c60a325d5e57e6e6f65', '0', null, '单选', null, null, null, '0', '/pingtai/dict/radio.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('22926eb196a14b48be775f4880b5ba94', '0', null, '保存', null, null, null, '0', '/jf/group/save', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('233356b63d8e477fb6e948b703232809', '0', null, '默认树', null, null, null, '0', '/jf/station', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('235d855d7b914d728e434f0f309aa04d', '0', null, '默认列表', null, null, null, '0', '/jf/sysLog', '8a40c0353fa828a6013fa898d4ac0029', '1', '0', '0', '1', null, null, '日志');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('29c18b3394924c30882da049da14ad99', '0', null, '更新', null, null, null, '0', '/jf/role/update', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('2b7f6e28f9a74854b7399e8740b765fd', '0', null, 'log4jServlet', null, null, null, '0', '/se/log4j', '3bf4c1829bf447979865fc4d2ab75801', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('2be34991827e4e8da8e92f9b9e8bce25', '0', null, 'treeTableSub', null, null, null, '0', '/jf/dict/treeTable', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('2c91467f905a4f5ba9f52830131c8ad9', '0', null, '默认分组列表', null, null, null, '0', '/jf/wx/group', 'e6eb0165223447218410f867a9614300', '1', '0', '0', '1', null, null, '分组管理');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('2fbbc9cfb0bf4b5bb504ead155c3423c', '0', null, '保存', null, null, null, '0', '/jf/station/save', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('2fee901117c64e18873f60e8f800713d', '0', null, '单选', null, null, null, '0', '/pingtai/station/radio.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('32a3e59964204a3c8848e84b864306ae', '0', null, '删除', null, null, null, '0', '/jf/systems/delete', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('335d1f8f46eb47a18001889f8cc21348', '0', null, '删除', null, null, null, '0', '/jf/role/delete', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('362cf247241c4d12b6242301e4a73516', '0', null, '删除', null, null, null, '0', '/jf/station/delete', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('36d3b89e378b451ca89d1a41a3c53e10', '0', null, 'iframe', null, null, null, '0', '/pingtai/log4j/iframe.html', '3bf4c1829bf447979865fc4d2ab75801', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('37218fb52ec94fb4bf76209a17916094', '0', null, '默认树', null, null, null, '0', '/jf/module', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('37a9a6966448469f9d9abe2e8aeb1b9e', '0', null, 'Upload', null, null, null, '0', '/jf/upload', '3dec44186175424cbee2d05ffbb690dd', '0', '0', '0', '1', null, null, 'Upload');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('3b1e7c5d5e0e461c90e1f0032f679a25', '0', null, '查看', null, null, null, '0', '/jf/dict/view', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('3b6a8f61e20e4bf2943421af2119e9b9', '0', null, '准备添加', null, null, null, '0', '/pingtai/param/add.html', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('3dd486cd58da467dbd83ae420db14815', '0', null, '准备添加', null, null, null, '0', '/weiXin/keyword/add.html', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('3ee5f986289d4a1990f4e42c9a0caadb', '0', null, '准备添加', null, null, null, '0', '/pingtai/group/add.html', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('420d8ebc68ad44dc8188d4c27dc585d1', '0', null, '位置默认列表', null, null, null, '0', '/jf/wx/location', 'c87c35097a2d4bc898fe6e9b1e280a3d', '1', '0', '0', '1', null, null, '位置管理');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('4376888fd74f4247a926529e5da03442', '0', null, 'treeData', null, null, null, '0', '/jf/user/treeData', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('437e05d09dd94720b67c4f230cdebe58', '0', null, '更新', null, null, null, '0', '/jf/module/update', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('46e00ef0fd234e9dbf68ed9bbb437d0f', '0', null, '多选', null, null, null, '0', '/pingtai/department/checkbox.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('481d4d5c0a634c4085c72c990260e58d', '0', null, '微信管理主页', null, null, null, '0', '/jf/wx/index/content', '7a35846a305c42abb68601b4f7347289', '0', '0', '0', '1', null, null, '主页管理');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('48db51f20b504c4ab489b1dcfd3ecbd9', '0', null, '密码变更', null, null, null, '0', '/pingtai/user/passChange.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('4a05ffcfe351476391a036937eaf733f', '0', null, '删除', null, null, null, '0', '/jf/param/delete', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('4a6544ae7a2548ad81c0e3994999023c', '0', null, '准备设置菜单功能', null, null, null, '0', '/pingtai/menu/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('4df80521e66447618796c3cfe02bf239', '0', null, '默认treeTable', null, null, null, '0', '/jf/dict', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('5148ea207b974ee197f0bc57060ab1ad', '0', null, '删除', null, null, null, '0', '/jf/wx/location/delete', 'c87c35097a2d4bc898fe6e9b1e280a3d', '0', '0', '0', '1', null, null, '位置管理');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('58a85040aa9f40cca0bdba6e23e30363', '0', null, '保存', null, null, null, '0', '/jf/dept/save', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('5982350f7d0e4b2ca72de64300d75223', '0', null, 'treeTable', null, null, null, '0', '/jf/param/treeTable', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('5b249ad344d948b99f58768c323f5f71', '0', null, '准备添加', null, null, null, '0', '/pingtai/systems/add.html', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('5fcac107c80d493d91b53a815d4b297a', '0', null, '保存', null, null, null, '0', '/jf/user/save', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('6131942dd2644790b80df13c14fb3ae8', '0', null, '保存', null, null, null, '0', '/jf/param/save', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('6569e0d9f2cd4e3a97af4e1b0cd8d2f7', '0', null, '删除', null, null, null, '0', '/jf/dict/delete', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('666f50e0f3b04f4ba43bcb4e719c1e8d', '0', null, '验证码', null, null, null, '0', '/jf/authImg', '3e048ee263c344318e9c4995a5cd35e0', '0', '0', '0', '0', null, null, '验证码');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('6b527ed138c343a89ddf73cf16fef565', '0', null, '更新', null, null, null, '0', '/jf/wx/keyword/update', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('6daed51284f94923b1c8a6414e646959', '0', null, 'treeData', null, null, null, '0', '/jf/operator/treeData', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('74aa20442105408d90f9e6469a3a92b5', '0', null, 'treeTableIframe', null, null, null, '0', '/pingtai/dict/treeTableIframe.html', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('77823e12391a47729a1f82a00bc15c5b', '0', null, '准备更新', null, null, null, '0', '/jf/wx/keyword/edit', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('78c6026c6af44b41a6bef4cdb4cfb414', '0', null, '获取角色功能', null, null, null, '0', '/jf/role/getOperator', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('79039a2260da46b0aabb5a62e8db6c87', '0', null, '查看', null, null, null, '0', '/jf/user/view', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('7ae62737df444d619f8fd376360d160c', '0', null, '默认列表', null, null, null, '0', '/jf/role', '8a40c0353fa828a6013fa898d4ac0024', '1', '0', '0', '1', null, null, '角色');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('7b4281dd247c4624bee0d8f84c2c2715', '0', null, '保存', null, null, null, '0', '/jf/systems/save', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('7cc12b5c154a4a9782c518c57e8ab3aa', '0', null, '准备更新', null, null, null, '0', '/jf/role/edit', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('7eab5f800bab4efb8df1b2e8a0575f73', '0', null, '默认列表', null, null, null, '0', '/jf/systems', '8a40c0353fa828a6013fa898d4ac0026', '1', '0', '0', '1', null, null, '系统');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('7ed5eefbbf3d4aa78d0c5b99f3b7010c', '0', null, '登陆验证', null, null, null, '0', '/jf/login/vali', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('83ef85fd17804bb195d0ad3c07f88c30', '0', null, '准备更新', null, null, null, '0', '/jf/operator/edit', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('886bd497064b4c9f87d8461ebba421d1', '0', null, '首页', null, null, null, '0', '/jf/index', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('8bd9c0e14df941cdaf6253cd08dbd9cd', '0', null, '准备更新', null, null, null, '0', '/jf/systems/edit', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('8ca8af501522439d8c9249e00db5d78d', '0', null, '查看', null, null, null, '0', '/jf/sysLog/view', '8a40c0353fa828a6013fa898d4ac0029', '0', '0', '0', '1', null, null, '日志');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('8f79857b31d4475a94c712e997e89c99', '0', null, '更新', null, null, null, '0', '/jf/dict/update', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('910955c2192a418995eeab8bf15372e9', '0', null, '准备添加', null, null, null, '0', '/pingtai/operator/add.html', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('91baed789bc14efdbebb10b49c69ee5b', '0', null, '默认主页列表', null, null, null, '0', '/jf/user', '8a40c0353fa828a6013fa898d4ac0030', '1', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('91f78713c3084b6e9b7419e2a97c7dac', '0', null, '查看', null, null, null, '0', '/jf/param/view', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('9765e6bb76eb40ab800cb8954822190e', '0', null, '删除', null, null, null, '0', '/jf/wx/keyword/delete', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('99a42a467bbf4e829fd0706507c9f7a7', '0', null, 'log4jHtml', null, null, null, '0', '/pingtai/log4j/log4j.html', '3bf4c1829bf447979865fc4d2ab75801', '0', '0', '0', '1', null, null, 'Log4j');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('9a708f39e123455e84b6125774bab1ea', '0', null, 'treeData', null, null, null, '0', '/jf/module/treeData', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('9ee4ee562eaa475a95f45d3daeb0220a', '0', null, '单选', null, null, null, '0', '/pingtai/param/radio.html', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('9f75b47bdc0249e2b493c47384785a72', '0', null, '保存', null, null, null, '0', '/jf/menu/save', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('a0c01a5248cd4bf38e57945dbb2b98c5', '0', null, '更新', null, null, null, '0', '/jf/group/update', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('a1ff68acf9b24c34b347ff21e333cb70', '0', null, '设置菜单功能', null, null, null, '0', '/jf/menu/setOperator', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('a5289b2638d845fbb06dedbcdd517f97', '0', null, '删除', null, null, null, '0', '/jf/group/delete', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('a6623c65480f4f2cb63a4d7673f81e3a', '0', null, 'treeData', null, null, null, '0', '/jf/menu/treeData', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('aa126932641f4e068ed8278a332de85d', '0', null, '默认主页', null, null, null, '0', '/jf/index/content', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('acbceb432b5849aca9e9b284240281ec', '0', null, '分组角色下拉选择', null, null, null, '0', '/jf/role/select', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('ad09a1b897744812875c752c2d70f11a', '0', null, '默认树', null, null, null, '0', '/jf/dept', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('ad51a6ca95c646ce9c03778eda715734', '0', null, '保存', null, null, null, '0', '/jf/operator/save', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('afe893c6be744c4f98187b084ac832e7', '0', null, '编辑更新菜单', null, null, null, '0', '/jf/menu/edit', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('b13b002e2fad4e95bbe0e4dbc9fbdfe1', '0', null, '保存', null, null, null, '0', '/jf/module/save', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('b23b17d4c83242e8a1a8ee8cfcde9907', '0', null, '查看', null, null, null, '0', '/jf/operator/view', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('b352e4246e754a9691bcc9011f445665', '0', null, 'treeData', null, null, null, '0', '/jf/param/treeData', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('b4ee4ae4391f4243be69e838545d2131', '0', null, 'treeData', null, null, null, '0', '/jf/dept/treeData', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('b8218945b8e743f29651569950014511', '0', null, '单选', null, null, null, '0', '/pingtai/department/radio.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('b82d86fb7b64498a9c2b8b9a99b3fbeb', '0', null, '删除', null, null, null, '0', '/jf/menu/delete', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('b8339f29d8d84a4ead6454295f87b79c', '0', null, '人员分组设置', null, null, null, '0', '/jf/group/select', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('bc2c865be6af42cf861294d446fb1c6f', '0', null, '单选', null, null, null, '0', '/pingtai/user/radio.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('beeaa7f4b2444430a6732ecc83c453a2', '0', null, '编辑', null, null, null, '0', '/jf/param/edit', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('c04adcd019e04cf3ba7c66af721a18dc', '0', null, '删除', null, null, null, '0', '/jf/user/delete', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('c05642442e0a468ebe4f0b7771a803ae', '0', null, '更新', null, null, null, '0', '/jf/systems/update', '8a40c0353fa828a6013fa898d4ac0026', '0', '0', '0', '1', null, null, '系统');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('c081c50918f4459f8e36ab8cb4151a61', '0', null, '准备岗位功能设置', null, null, null, '0', '/pingtai/station/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('c0ccfcd127c347a8b9db140e5aa62188', '0', null, '准备添加', null, null, null, '0', '/pingtai/role/add.html', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('c1e991d1f56749298c18ff69d7777e0b', '0', null, '删除', null, null, null, '0', '/jf/module/delete', '8a40c0353fa828a6013fa898d4ac0033', '0', '0', '0', '1', null, null, '模块');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('c29ea4cbd9044bc786e9f4584ad840ff', '0', null, '获取岗位功能', null, null, null, '0', '/jf/station/getOperator', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('c7132250f5054b808bb119122a6ecb52', '0', null, '设置岗位功能', null, null, null, '0', '/jf/station/setOperator', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('c9d013d14cbd4f148fb4562c91803ee8', '0', null, '准备更新', null, null, null, '0', '/jf/group/edit', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('ca0f6da01ada419eaa7739d9790e5b88', '0', null, '准备角色功能设置', null, null, null, '0', '/pingtai/role/operatorTree.html', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('cc6bcbee40ab43b2bd5aff6d9385e1fc', '0', null, '删除', null, null, null, '0', '/jf/operator/delete', '8a40c0353fa828a6013fa898d4ac0027', '0', '0', '0', '1', null, null, '功能');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('cf26c1d2baa24a8791b3d264154b80d4', '0', null, '默认树', null, null, null, '0', '/jf/menu', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('d115d08591ef4c0eaebef15f8294b287', '0', null, '准备设置部门负责人', null, null, null, '0', '/pingtai/department/userTree.html', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('d1b453799d62485b82e027b96b596ccd', '0', null, 'ueditor', null, null, null, '0', '/jf/ueditor', '4090cac06e15459789bc5154eef67e4e', '0', '0', '0', '1', null, null, 'Ueditor');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('d247fb45be724ed2a2bb5c92d73bf6cf', '0', null, '设置用户的组', null, null, null, '0', '/jf/user/setGroup', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('d479dbdc901f4d85a207b9bace6465ac', '0', null, '更新', null, null, null, '0', '/jf/user/update', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('d496b161d2564111992687b948862244', '0', null, 'iframe', null, null, null, '0', '/pingtai/druid/iframe.html', '297e0cf944e9762e0144e97dfd6e00c9', '0', '0', '0', '1', null, null, '数据源');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('d5c8bdf7a49a4e46b776c05dc9ead484', '0', null, 'treeData', null, null, null, '0', '/jf/dict/treeData', '8a40c0353fa828a6013fa898d4ac0022', '0', '0', '0', '1', null, null, '字典');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('d646da8707ae41838fd2ec9bf0d467ee', '0', null, '设置角色功能', null, null, null, '0', '/jf/role/setOperator', '8a40c0353fa828a6013fa898d4ac0024', '0', '0', '0', '1', null, null, '角色');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('dad107c1aeb0419b8004d57f9d70223e', '0', null, '更新', null, null, null, '0', '/jf/param/update', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('dc750e57b54f4baca78d66969321ee51', '0', null, '更新', null, null, null, '0', '/jf/station/update', '8a40c0353fa828a6013fa898d4ac0025', '0', '0', '0', '1', null, null, '岗位');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('df0aa534655242e4a0bcd638b51a4e03', '0', null, '更新', null, null, null, '0', '/jf/menu/update', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('dfc7af0979a54e8e9a3f18b7a5d66030', '0', null, '查看', null, null, null, '0', '/jf/wx/keyword/view', '8f53706d4af541588bde334d99d44727', '0', '0', '0', '1', null, null, '自动回复');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('dfe9d74fe0ef4220bfcfe6d7bb2f9436', '0', null, '默认用户列表', null, null, null, '0', '/jf/wx/user', 'c4e63c4171db4ae2a83f7dfcc2656b0e', '1', '0', '0', '1', null, null, '用户管理');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('e037e0bae9a94e549d6b647db49a64a1', '0', null, '角色设置', null, null, null, '0', '/jf/group/setRole', '8a40c0353fa828a6013fa898d4ac0023', '0', '0', '0', '1', null, null, '分组');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('e754dfdb794d4e7db6023c9b089a340c', '0', null, '多选', null, null, null, '0', '/pingtai/user/checkbox.html', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('f1f6f2c8f026498c8ee64b7a918d06df', '0', null, '准备更新', null, null, null, '0', '/jf/user/edit', '8a40c0353fa828a6013fa898d4ac0030', '0', '0', '0', '1', null, null, '用户');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('f57388d139034099932c36a955df625a', '0', null, '准备编辑菜单', null, null, null, '0', '/jf/menu/toEdit', '8a40c0353fa828a6013fa898d4ac0032', '0', '0', '0', '1', null, null, '菜单');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('f771691134c34174a819b5990310d000', '0', null, '首页', null, null, null, '0', '/jf/', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('f771691134c34174a819b5990310da56', '0', null, '注销', null, null, null, '0', '/jf/login/logout', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '1', null, null, '登陆');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('f7c220a81ba843938f8ccb108bec9c03', '0', null, '参数主页', null, null, null, '0', '/jf/param', '8a1b51bb6fae4fac8591f4f387d250ff', '0', '0', '0', '1', null, null, '参数');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('f82c021dc443419fb2469032af73bf3e', '0', null, '删除', null, null, null, '0', '/jf/dept/delete', '8a40c0353fa828a6013fa898d4ac0028', '0', '0', '0', '1', null, null, '部门');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('fb6a0c1e618041bcbbf8cfd41311b1fa', '0', null, '准备登陆', null, null, null, '0', '/jf/login', '8a40c0353fa828a6013fa898d4ac0021', '0', '0', '0', '0', null, null, '登陆');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('fd9978df5c5a47f298e2d28e21e70b15', '0', null, '删除', null, null, null, '0', '/jf/sysLog/delete', '8a40c0353fa828a6013fa898d4ac0029', '0', '0', '0', '1', null, null, '日志');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('5c18dca7733c48e79d1bcfc4cc4873c2', '0', null, '功能分页', null, null, null, '0', '/jf/test/operator', '51652586b48a4c509075a50d9e28a730', '1', '0', '0', '1', null, null, '测试模块');
INSERT INTO "SCOTT"."PT_OPERATOR" VALUES ('d9ac75ce25984861aa5ad36c940eaecc', '0', null, '日志分页', null, null, null, '0', '/jf/test/sysLog', '51652586b48a4c509075a50d9e28a730', '1', '0', '0', '1', null, null, '测试模块');

-- ----------------------------
-- Table structure for "SCOTT"."PT_PARAM"
-- ----------------------------
DROP TABLE "SCOTT"."PT_PARAM";
CREATE TABLE "SCOTT"."PT_PARAM" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"DESCRIPTION" VARCHAR2(200 BYTE) NULL ,
"IMAGES" VARCHAR2(50 BYTE) NULL ,
"NAMES" VARCHAR2(25 BYTE) NULL ,
"ORDERIDS" NUMBER(19) NULL ,
"PATHS" VARCHAR2(1000 BYTE) NULL ,
"ZHUANGTAI" CHAR(1 BYTE) NULL ,
"PARENTIDS" VARCHAR2(32 BYTE) NULL ,
"ISPARENT" VARCHAR2(5 BYTE) NULL ,
"LEVELS" NUMBER(19) NULL ,
"NUMBERS" VARCHAR2(50 BYTE) NULL ,
"VAL" VARCHAR2(500 BYTE) NULL ,
"I18N" CHAR(1 BYTE) NULL ,
"VAL_ZHCN" VARCHAR2(500 BYTE) NULL ,
"VAL_ZHHK" VARCHAR2(500 BYTE) NULL ,
"VAL_ZHTW" VARCHAR2(500 BYTE) NULL ,
"VAL_JA" VARCHAR2(500 BYTE) NULL ,
"VAL_ENUS" VARCHAR2(500 BYTE) NULL ,
"STATUS" CHAR(1 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_PARAM
-- ----------------------------
INSERT INTO "SCOTT"."PT_PARAM" VALUES ('0c78f87750a745bbb59005a6ca0f744a', '0', null, '3.png', 'weixinToken', '3', '100103root/83f4b0ee56904cbeb5f91696ad804c29/0c78f87750a745bbb59005a6ca0f744a', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinToken', '123', '1', null, null, null, null, null, '1');
INSERT INTO "SCOTT"."PT_PARAM" VALUES ('7381008292054bccba20224bc33774d7', '7', null, '2.png', 'weixinAppID', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29/7381008292054bccba20224bc33774d7', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppID', '123', null, '1234', '1234', '1234', '1234', '1234', '1');
INSERT INTO "SCOTT"."PT_PARAM" VALUES ('8094c60d7a594b36bb0187cbce9c4188', '0', null, '2.png', 'weixinAppSecret', '2', '100103root/83f4b0ee56904cbeb5f91696ad804c29/8094c60d7a594b36bb0187cbce9c4188', null, '83f4b0ee56904cbeb5f91696ad804c29', 'false', '2', 'weixinAppSecret', '123', '1', null, null, null, null, null, '1');
INSERT INTO "SCOTT"."PT_PARAM" VALUES ('83f4b0ee56904cbeb5f91696ad804c29', '0', null, '2.png', '微信配置', '1', '100103root/83f4b0ee56904cbeb5f91696ad804c29', null, '8a40c0353fa828a6013fa898d4ac0020', 'true', '1', 'weixinConfig', null, '1', null, null, null, null, null, '1');
INSERT INTO "SCOTT"."PT_PARAM" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '参数树', '1_open.png', '参数树', '1', '100103root', '1', null, 'true', '0', null, null, '0', null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for "SCOTT"."PT_RESOURCES"
-- ----------------------------
DROP TABLE "SCOTT"."PT_RESOURCES";
CREATE TABLE "SCOTT"."PT_RESOURCES" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"OSNAME" VARCHAR2(200 BYTE) NULL ,
"IPS" VARCHAR2(50 BYTE) NULL ,
"HOSTNAME" VARCHAR2(200 BYTE) NULL ,
"CPUNUMBER" NUMBER(19) NULL ,
"CPURATIO" NUMBER(20,10) NULL ,
"PHYMEMORY" NUMBER(19) NULL ,
"PHYFREEMEMORY" NUMBER(19) NULL ,
"JVMTOTALMEMORY" NUMBER(19) NULL ,
"JVMFREEMEMORY" NUMBER(19) NULL ,
"JVMMAXMEMORY" NUMBER(19) NULL ,
"GCCOUNT" NUMBER(19) NULL ,
"CREATEDATE" TIMESTAMP(6)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_RESOURCES
-- ----------------------------
INSERT INTO "SCOTT"."PT_RESOURCES" VALUES ('e62d6934d5ac481f9a717d9407cac138', '0', 'Windows 7', '10.192.66.8', 'PC-DONGHUAJIAN', '4', '0.0840207203', '3993', '402', '480', '259', '939', '4', TO_TIMESTAMP(' 2014-08-26 15:28:49:882000', 'YYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "SCOTT"."PT_RESOURCES" VALUES ('74209764471b4c0bb06b2b69cea5c12c', '0', 'Windows 7', '10.192.66.8', 'PC-DONGHUAJIAN', '4', '1', '3993', '686', '480', '397', '939', '1', TO_TIMESTAMP(' 2014-08-26 15:40:56:222000', 'YYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for "SCOTT"."PT_ROLE"
-- ----------------------------
DROP TABLE "SCOTT"."PT_ROLE";
CREATE TABLE "SCOTT"."PT_ROLE" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"DESCRIPTION" VARCHAR2(200 BYTE) NULL ,
"NAMES" VARCHAR2(25 BYTE) NULL ,
"OPERATORIDS" LONG NULL ,
"MODULEIDS" CLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_ROLE
-- ----------------------------
INSERT INTO "SCOTT"."PT_ROLE" VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '超级管理员', '系统管理员', HexToRaw('6F70657261746F725F38663961623731643532366334353335396334343736663935373938376536642C6F70657261746F725F33373231386662353265633934666234626637363230396131373931363039342C6F70657261746F725F63316539393164316635363734393239386331386666363964373737376530622C6F70657261746F725F62313362303032653266616434653935626265306534646263396662646665312C6F70657261746F725F39613730386633396531323334353565383462363132353737346261623165612C6F70657261746F725F34333765303564303964643934373230623637633466323330636465626535382C6F70657261746F725F30666237393338633764363134666333383935363865623637623434323330332C6F70657261746F725F39316261656437383962633134656664626562623130623439633639656535622C6F70657261746F725F63303461646364303139653034636633626137633636616637323161313864632C6F70657261746F725F66316636663263386630323634393863386565363462376139313864303664662C6F70657261746F725F35666361633130376338306434393364393162353361383135643462323937612C6F70657261746F725F64323437666234356265373234656432613262623563393264373362663663662C6F70657261746F725F34333736383838666437346634323437613932363532396535646130333434322C6F70657261746F725F64343739646264633930316634643835613230376239626163653634363561632C6F70657261746F725F37393033396132323630646134366230616162623561363265386462366338372C6F70657261746F725F31613862346438653434313134313266613862623536313339333536336138352C6F70657261746F725F65373534646664623739346434653764623630323363396230383961333430632C6F70657261746F725F34386462353166323062353034633461623438396231646366643365636264392C6F70657261746F725F62633263383635626536616634326366383631323934643434366662316336662C6F70657261746F725F63663236633164326261613234613837393162336432363431353462383064342C6F70657261746F725F62383264383666623762363434393861396332623862396139396233666265622C6F70657261746F725F31303439396263376639636234616466393962656261303033343362346561362C6F70657261746F725F39663735623437626463303234396532623439336334373338343738356137322C6F70657261746F725F61316666363861636639623234633334623334376666323165333333636237302C6F70657261746F725F61363632336336353438306634663263623633613464373637336638316533612C6F70657261746F725F64663061613533343635353234326534613062636436333862353161346530332C6F70657261746F725F34613635343461653761323534386164383163306533393934393939303233632C6F70657261746F725F66373731363931313334633334313734613831396235393930333130643030302C6F70657261746F725F38383662643439373036346234633966383764383436316562626134323164312C6F70657261746F725F61613132363933323634316634653036386564383237386133333264653835642C6F70657261746F725F66623661306331653631383034316263626266386366643431333131623166612C6F70657261746F725F66373731363931313334633334313734613831396235393930333130646135362C6F70657261746F725F37656435656566626266336434616137386430633562393966336237303130632C6F70657261746F725F31623064373437363937346534626639623532663735666238326638373333302C6F70657261746F725F61353238396232363338643834356662623036646564626364643531376639372C6F70657261746F725F63396430313364313463626434663134386662343536326339313830336565382C6F70657261746F725F32323932366562313936613134623438626537373566343838306235626139342C6F70657261746F725F62383333396632396438643834613465616436343534323935663837623739632C6F70657261746F725F65303337653062616539613934653534396436623634376462343961363461312C6F70657261746F725F61306330316135323438636434626633386535373934356462623262393863352C6F70657261746F725F33656535663938363238396434613139393066346534326339613063616164622C6F70657261746F725F64343936623136316432353634313131393932363837623934383836323234342C6F70657261746F725F34646638303532316536363434373631383739366333636665303262663233392C6F70657261746F725F36353639653064396632636434653361393761663465316230636438643266372C6F70657261746F725F66313663616464386638316534626566393236653039663731386462386665322C6F70657261746F725F30393138353564643830396234313866616538386137666563366439663234362C6F70657261746F725F30316161306338356338623834616538616361376635343834333336623230332C6F70657261746F725F64356338626466376134396134653436623737366330356463396561643438342C6F70657261746F725F32626533343939313832376534653864613865393266396239653862636532352C6F70657261746F725F38663739383537623331643434373561393463373132653939376538396339392C6F70657261746F725F31323134316331633362653234316361386138363862636539636436313064352C6F70657261746F725F32316230613931306566366534633630613332356435653537653665366636352C6F70657261746F725F64316531346530623766363934373833393438353064323233383231343639322C6F70657261746F725F37346161323034343231303534303864393066396536343639613361393262352C6F70657261746F725F38383937646265383562336534653639383964363632343935323732636632362C6F70657261746F725F37616536323733376466343434643631396638666433373633363064313630632C6F70657261746F725F33333564316638663436656234376131383030313838396638636332313334382C6F70657261746F725F37636331326235633135346134613937383263353138633537653861623361612C6F70657261746F725F37386336303236633661663434623431613662656634636462346366623431342C6F70657261746F725F31353536366536336633313034633733623461306234613738346464313163612C6F70657261746F725F61636263656234333262353834396163613965396232383432343032383165632C6F70657261746F725F64363436646138373037616534313833386664326563396266306434363765652C6F70657261746F725F32396331386233333934393234633330383832646130343964613134616439392C6F70657261746F725F63306363666364313237633334376138623964623134306535616136323138382C6F70657261746F725F63613066366461303161646134313965616137373339643937393065356238382C6F70657261746F725F32333333353662363364386534373766623665393438623730333233323830392C6F70657261746F725F33363263663234373234316334643132623632343233303165346137333531362C6F70657261746F725F63323965613463626439303434626337383665396634353834616438343066662C6F70657261746F725F32666262633963666230626634623562623530346561643135356333343233632C6F70657261746F725F63373133323235306635303534623830386262313139313232613665636235322C6F70657261746F725F30396236636532393331336334303531626137363564653531366139623238332C6F70657261746F725F64633735306535376235346634626163613738643636393639333231656535312C6F70657261746F725F32313134316461346665626534633932396162653337313236623337666431322C6F70657261746F725F63303831633530393138663434353966386533366162386362343135316136312C6F70657261746F725F32666565393031313137633634653138383733663630653866383030373133642C6F70657261746F725F37656162356638303062616234656662386466316232653861303537356637332C6F70657261746F725F33326133653539393634323034613363383834386538346238363433303661652C6F70657261746F725F38626439633065313464663934316364616636323533636430386462643963642C6F70657261746F725F37623432383164643234376334363234626565306438663834633263323731352C6F70657261746F725F63303536343234343265306134363865626534663062373737316138303361652C6F70657261746F725F35623234396164333434643934386239396635383736386333323366356637312C6F70657261746F725F30646131356334393239396434316134623732306637383764303533653363622C6F70657261746F725F63633662636265653430616234336232626435616666366439333835653166632C6F70657261746F725F38336566383566643137383034626231393564306164336330376638386333302C6F70657261746F725F61643531613663613935633634366365396330333737386564613731353733342C6F70657261746F725F36646165643531323834663934393233623163386136343134653634363935392C6F70657261746F725F31623161383039383135353734623261396331643065313864363932646531372C6F70657261746F725F62323362313764346338333234326538613161386565386366636465393930372C6F70657261746F725F39313039353563323139326134313839393565656162386266313533373265392C6F70657261746F725F61643039613162383937373434383132383735633735326332643730663131612C6F70657261746F725F66383263303231646334343334313966623234363930333261663733626633652C6F70657261746F725F30353364333330343632653134353963613130313263396432393131336263342C6F70657261746F725F35386138353034306161396634306363613062646261366532336533303336332C6F70657261746F725F62346565346165343339316634323433626536396538333835343564323133312C6F70657261746F725F31303436333839643835323534353136393766323739333138356537643665652C6F70657261746F725F34366530306566306664323334653964626636386564396262623433376430662C6F70657261746F725F62383231383934356238653734336632393635313536393935303031343531312C6F70657261746F725F64313135643038353931656634633065616562656631356638323934623238372C6F70657261746F725F32333564383535643762393134643732386534333466306633303961613034642C6F70657261746F725F66643939373864663563356134376632393865326432386532316537306231352C6F70657261746F725F38636138616635303135323234333964386339323439653030646235643738642C6F70657261746F725F64666539643734666530656634323230626663666536643762623266393433362C6F70657261746F725F32633931343637663930356134663562613966353238333031333163386164392C6F70657261746F725F34383164346435633061363334633430383563373263393930323630653538642C6F70657261746F725F34323064386562633638616434346463383138386434633237646335383564312C6F70657261746F725F35313438656132303762393734656531393766306263353730363061623161642C6F70657261746F725F30373733613538633462646234383538616230363263346132613464613639612C6F70657261746F725F39373635653662623736656234306162383030636238393534383232313930652C6F70657261746F725F37373832336531323339316134373732396131663832613030626331356335622C6F70657261746F725F30353131346330636265316634633230393562333231366631336366623638312C6F70657261746F725F36623532376564313338633334336138396464663733636631366665663536352C6F70657261746F725F64666337616630393739613534653865396133663138623761356436363033302C6F70657261746F725F33646434383663643538646134363764626438336165343230646231343831352C6F70657261746F725F33366433623839653337386234353163613839643161343161336335336531302C6F70657261746F725F39396134326134363762626634653832396664303730363530376339663761372C6F70657261746F725F32623766366532386639613734383534623733393965383734306237363566642C6F70657261746F725F64316234353337393964363234383562383265303237623936623539366363642C6F70657261746F725F33376139613639363634343834363966396439616265326538616562316239652C6F70657261746F725F33623165376335643565306534363163393065316630303332663637396132352C6F70657261746F725F61666538393363366265373434633466393831383762303834616338333265372C6F70657261746F725F66353733383864313339303334303939393332633336613935356466363235612C6F70657261746F725F66376332323061383162613834333933386638636362313038626563396330332C6F70657261746F725F34613035666663666533353134373633393161303336393337656166373333662C6F70657261746F725F62656561613766346232343434343330613637333265636338336334353361322C6F70657261746F725F36313331393432646432363434373930623830646631336331346662336165382C6F70657261746F725F62333532653432343665373534613936393162636339303131663434353636352C6F70657261746F725F35393832333530663764306534623263613732646536343330306437353232332C6F70657261746F725F64616431303763316165623034313962383030346435376639643730323233652C6F70657261746F725F39316637383731336333303834623665396237343139653261393763376461632C6F70657261746F725F33623661386636316532306534626632393433343231616632313139653962392C6F70657261746F725F39656534656535363265616134373561393566343564336461656230323230612C6F70657261746F725F30363234346366333532306334396538613435636264653832613533666135652C6F70657261746F725F36363666353065306633623034663462613433626362346537313963316538642C6F70657261746F725F35633138646361373733336334386537396431626366633463633438373363322C6F70657261746F725F64396163373563653235393834383631616135616433366339343065616563632C00'), 'module_8a40c0353fa828a6013fa898d4ac0033,module_8a40c0353fa828a6013fa898d4ac0030,module_8a40c0353fa828a6013fa898d4ac0031,module_8a40c0353fa828a6013fa898d4ac0021,module_8a40c0353fa828a6013fa898d4ac0023,module_297e0cf944e9762e0144e97dfd6e00c9,module_8a40c0353fa828a6013fa898d4ac0024,module_8a40c0353fa828a6013fa898d4ac0025,module_8a40c0353fa828a6013fa898d4ac0026,module_8a40c0353fa828a6013fa898d4ac0027,module_8a40c0353fa828a6013fa898d4ac0028,module_8a40c0353fa828a6013fa898d4ac0029,module_8a40c0353fa828a6013fa898d4ac1100,module_c4e63c4171db4ae2a83f7dfcc2656b0e,module_e6eb0165223447218410f867a9614300,module_417ed3d3cf4d4b7a939613829e8db17d,module_7a35846a305c42abb68601b4f7347289,module_c87c35097a2d4bc898fe6e9b1e280a3d,module_8f53706d4af541588bde334d99d44727,module_8a40c0353fa828a6013fa898d4ac2200,module_3bf4c1829bf447979865fc4d2ab75801,module_4090cac06e15459789bc5154eef67e4e,module_3dec44186175424cbee2d05ffbb690dd,module_8a1b51bb6fae4fac8591f4f387d250ff,module_3e048ee263c344318e9c4995a5cd35e0,');

-- ----------------------------
-- Table structure for "SCOTT"."PT_STATION"
-- ----------------------------
DROP TABLE "SCOTT"."PT_STATION";
CREATE TABLE "SCOTT"."PT_STATION" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"DESCRIPTION" VARCHAR2(200 BYTE) NULL ,
"IMAGES" VARCHAR2(50 BYTE) NULL ,
"ISPARENT" VARCHAR2(5 BYTE) NULL ,
"NAMES" VARCHAR2(25 BYTE) NULL ,
"ORDERIDS" NUMBER(19) NULL ,
"PARENTSTATIONIDS" VARCHAR2(32 BYTE) NULL ,
"OPERATORIDS" CLOB NULL ,
"MODULEIDS" CLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_STATION
-- ----------------------------
INSERT INTO "SCOTT"."PT_STATION" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '根节点', '1_open.png', 'true', '岗位组织结构', '1', null, null, null);
INSERT INTO "SCOTT"."PT_STATION" VALUES ('8a40c0353fa828a6013fa898d4ac0021', '0', '人事经理', '2.png', 'false', '人事经理', '6', '8a40c0353fa828a6013fa898d4ac0020', 'operator_520,operator_526,operator_530,operator_527,', 'module_8a40c0353fe0565b0130001,module_8a40c0353fe0565b0130002,');
INSERT INTO "SCOTT"."PT_STATION" VALUES ('8a40c0353fa828a6013fa898d4ac0022', '0', '财务经理', '3.png', 'false', '财务经理', '8', '8a40c0353fa828a6013fa898d4ac0020', null, null);
INSERT INTO "SCOTT"."PT_STATION" VALUES ('8a40c0353fa828a6013fa898d4ac0023', '0', '行政经理', '4.png', 'false', '行政经理', '7', '8a40c0353fa828a6013fa898d4ac0020', 'operator_520,operator_526,operator_530,operator_529,', 'module_8a40c0353fe0565b0130001,module_8a40c0353fe0565b0130002,');
INSERT INTO "SCOTT"."PT_STATION" VALUES ('8a40c0353fa828a6013fa898d4ac0024', '0', '测试经理', '5.png', 'false', '测试经理111', '9', '8a40c0353fa828a6013fa898d4ac0020', null, null);
INSERT INTO "SCOTT"."PT_STATION" VALUES ('8a40c0353fa828a6013fa898d4ac0025', '0', '研发经理', '6.png', 'false', '研发经理', '1', '8a40c0353fa828a6013fa898d4ac0020', null, null);
INSERT INTO "SCOTT"."PT_STATION" VALUES ('8a40c0353fa828a6013fa898d4ac0026', '0', '应用Java', '8.png', 'false', '应用Java', '3', '8a40c0353fa828a6013fa898d4ac0027', 'operator_91baed789bc14efdbebb10b49c69ee5b,operator_c04adcd019e04cf3ba7c66af721a18dc,operator_f1f6f2c8f026498c8ee64b7a918d06df,operator_5fcac107c80d493d91b53a815d4b297a,', null);
INSERT INTO "SCOTT"."PT_STATION" VALUES ('8a40c0353fa828a6013fa898d4ac0027', '0', '应用经理', '7.png', 'true', '应用经理', '2', '8a40c0353fa828a6013fa898d4ac0020', null, null);
INSERT INTO "SCOTT"."PT_STATION" VALUES ('8a40c0353fa828a6013fa898d4ac0028', '0', '应用C++', '2.png', 'false', '应用C++', '5', '8a40c0353fa828a6013fa898d4ac0027', null, null);

-- ----------------------------
-- Table structure for "SCOTT"."PT_SYSLOG"
-- ----------------------------
DROP TABLE "SCOTT"."PT_SYSLOG";
CREATE TABLE "SCOTT"."PT_SYSLOG" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"ACTIONENDDATE" TIMESTAMP(6)  NULL ,
"ACTIONENDTIME" NUMBER(19) NULL ,
"ACTIONHAOSHI" NUMBER(19) NULL ,
"ACTIONSTARTDATE" TIMESTAMP(6)  NULL ,
"ACTIONSTARTTIME" NUMBER(19) NULL ,
"CAUSE" CHAR(1 BYTE) NULL ,
"COOKIE" VARCHAR2(1024 BYTE) NULL ,
"DESCRIPTION" CLOB NULL ,
"ENDDATE" TIMESTAMP(6)  NULL ,
"ENDTIME" NUMBER(19) NULL ,
"HAOSHI" NUMBER(19) NULL ,
"IPS" VARCHAR2(128 BYTE) NULL ,
"METHOD" VARCHAR2(4 BYTE) NULL ,
"REFERER" VARCHAR2(500 BYTE) NULL ,
"REQUESTPATH" CLOB NULL ,
"STARTDATE" TIMESTAMP(6)  NULL ,
"STARTTIME" NUMBER(19) NULL ,
"STATUS" CHAR(1 BYTE) NULL ,
"USERAGENT" VARCHAR2(200 BYTE) NULL ,
"VIEWHAOSHI" NUMBER(19) NULL ,
"OPERATORIDS" VARCHAR2(32 BYTE) NULL ,
"ACCEPT" VARCHAR2(200 BYTE) NULL ,
"ACCEPTENCODING" VARCHAR2(200 BYTE) NULL ,
"ACCEPTLANGUAGE" VARCHAR2(200 BYTE) NULL ,
"CONNECTION" VARCHAR2(200 BYTE) NULL ,
"HOST" VARCHAR2(200 BYTE) NULL ,
"XREQUESTEDWITH" VARCHAR2(200 BYTE) NULL ,
"PVIDS" VARCHAR2(32 BYTE) NULL ,
"USERIDS" VARCHAR2(32 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_SYSLOG
-- ----------------------------
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('a505fe5de8fd4b9c9bd5ba0eaec02cb8', '0', null, null, '5', TO_TIMESTAMP(' 2014-08-26 15:41:31:827000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038891827', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:31:831000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '5', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:31:826000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('627905dd3ea5439ab6620b96bc44e456', '0', null, null, '2', TO_TIMESTAMP(' 2014-08-26 15:41:32:427000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038892427', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:32:429000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '4', '127.0.0.1', 'GET', 'http://127.0.0.1:89/jf/', '/jf/station', TO_TIMESTAMP(' 2014-08-26 15:41:32:425000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '2', '233356b63d8e477fb6e948b703232809', '*/*', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('dc43d8df8cd54c368c207bdfc46ba60e', '0', null, null, '3', TO_TIMESTAMP(' 2014-08-26 15:41:33:083000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038893083', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:33:085000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '3', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:33:082000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('0cffbcccb1c045b4a9ef9938eeab55f8', '0', null, null, '4', TO_TIMESTAMP(' 2014-08-26 15:41:33:178000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038893178', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:33:181000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '4', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:33:177000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('812cb1f20a9146d2b587ea7d4a826376', '0', null, null, '6', TO_TIMESTAMP(' 2014-08-26 15:41:33:906000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038893906', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:33:918000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '13', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/test/operator?pageSize=10', TO_TIMESTAMP(' 2014-08-26 15:41:33:905000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '7', '5c18dca7733c48e79d1bcfc4cc4873c2', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('5441c56a77fb4815a55c9df2e2f51df7', '0', null, null, '11', TO_TIMESTAMP(' 2014-08-26 15:41:34:021000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038894021', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:34:041000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '21', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/test/sysLog?pageSize=10', TO_TIMESTAMP(' 2014-08-26 15:41:34:020000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '10', 'd9ac75ce25984861aa5ad36c940eaecc', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('0739e28fbcf24997a900218ad18fdb19', '0', null, null, '71', TO_TIMESTAMP(' 2014-08-26 15:41:39:982000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038899982', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:40:058000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '80', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/test/sysLog', TO_TIMESTAMP(' 2014-08-26 15:41:39:978000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '9', 'd9ac75ce25984861aa5ad36c940eaecc', '*/*', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('e5b902c06c284ff892dc76ae4bcd48e5', '0', null, null, '3', TO_TIMESTAMP(' 2014-08-26 15:41:45:470000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038905470', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:45:478000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '9', '127.0.0.1', 'GET', 'http://127.0.0.1:89/jf/', '/jf/user', TO_TIMESTAMP(' 2014-08-26 15:41:45:469000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '6', '91baed789bc14efdbebb10b49c69ee5b', '*/*', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('3d7418187bee40e6afbb3c478a78e163', '0', null, null, '5', TO_TIMESTAMP(' 2014-08-26 15:41:31:820000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038891820', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:31:823000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '5', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:31:818000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('d5558da4c1db46339c18e5921e4110a4', '0', null, null, '4', TO_TIMESTAMP(' 2014-08-26 15:41:32:467000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038892467', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:32:470000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '4', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:32:466000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('7923888044ce4be180d6ed3bd199e3b6', '0', null, null, '42', TO_TIMESTAMP(' 2014-08-26 15:41:32:946000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038892946', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:32:988000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '42', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:32:946000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('e231ca965bff4a48818af1c021a40e0b', '0', null, null, '8', TO_TIMESTAMP(' 2014-08-26 15:41:33:090000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038893090', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:33:095000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '8', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:33:087000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('25bf40d62b0f4d918c5cf8da6b85efec', '0', null, null, '6', TO_TIMESTAMP(' 2014-08-26 15:41:33:105000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038893105', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:33:110000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '6', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:33:104000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('5610d4903d9f45d3bbc2d6d4d9ca5c53', '0', null, null, '6', TO_TIMESTAMP(' 2014-08-26 15:41:33:121000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038893121', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:33:125000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '6', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:33:119000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('310a1872c33446c384851d37c17221d9', '0', null, null, '5', TO_TIMESTAMP(' 2014-08-26 15:41:31:742000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038891742', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:31:745000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '5', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:31:740000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('3a69687dcd78405bb1c903b1235a3ed1', '0', null, null, '7', TO_TIMESTAMP(' 2014-08-26 15:41:31:766000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038891766', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:31:771000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '7', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:31:764000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('1b4233f2f06d4f0cabc4fc2d2a9cd368', '0', null, null, '5', TO_TIMESTAMP(' 2014-08-26 15:41:33:183000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038893183', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:33:186000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '5', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:33:181000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('a26f16e629034b228c36bc0e47d52f72', '0', null, null, '9', TO_TIMESTAMP(' 2014-08-26 15:41:33:820000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038893820', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:33:830000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '11', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/index/content', TO_TIMESTAMP(' 2014-08-26 15:41:33:819000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '2', 'aa126932641f4e068ed8278a332de85d', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('73be1db0e55643b2967c9ac5d4bc3fb7', '0', null, null, '798', TO_TIMESTAMP(' 2014-08-26 15:41:16:364000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038876364', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=1k8zon1d8dxd673u6ut3gaapt', null, TO_TIMESTAMP(' 2014-08-26 15:41:16:705000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '958', '127.0.0.1', 'GET', 'http://127.0.0.1:89/jf/', '/jf/user', TO_TIMESTAMP(' 2014-08-26 15:41:15:747000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '160', '91baed789bc14efdbebb10b49c69ee5b', '*/*', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('ff109f58dae045d5b4698800ab072c3f', '0', null, null, '73', TO_TIMESTAMP(' 2014-08-26 15:41:18:912000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038878912', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:19:030000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '120', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/index/content', TO_TIMESTAMP(' 2014-08-26 15:41:18:910000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '47', 'aa126932641f4e068ed8278a332de85d', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('177ae13532924344b207270fb49ecdde', '0', null, null, '31', TO_TIMESTAMP(' 2014-08-26 15:41:19:063000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038879063', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:19:143000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '84', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/test/operator?pageSize=10', TO_TIMESTAMP(' 2014-08-26 15:41:19:059000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '53', '5c18dca7733c48e79d1bcfc4cc4873c2', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('e007b86d213e4087b516e7945d5b830c', '0', null, null, '6', TO_TIMESTAMP(' 2014-08-26 15:41:31:737000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038891737', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:31:739000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '6', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:31:733000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('dd566104364e494a948c6dd7d098936e', '0', null, null, '7', TO_TIMESTAMP(' 2014-08-26 15:41:31:773000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038891773', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:31:777000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '7', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:31:770000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('a487124b02ec44a291974b542525b6b3', '0', null, null, '5', TO_TIMESTAMP(' 2014-08-26 15:41:33:098000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038893098', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:33:102000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '5', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:33:097000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('b8a5bf82eaf84db4a1cee8d1f7c4782a', '0', null, null, '4', TO_TIMESTAMP(' 2014-08-26 15:41:33:115000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038893115', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:33:118000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '4', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:33:114000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('71344392493548c3945d5118ebf0f500', '0', null, null, '19', TO_TIMESTAMP(' 2014-08-26 15:41:19:240000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038879240', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:19:303000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '65', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/test/sysLog?pageSize=10', TO_TIMESTAMP(' 2014-08-26 15:41:19:238000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '46', 'd9ac75ce25984861aa5ad36c940eaecc', 'text/html, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('5b7f62d51fac4aaebe7edeccf2cdc872', '0', null, null, '15', TO_TIMESTAMP(' 2014-08-26 15:41:22:946000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038882946', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:22:969000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '24', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/test/operator', TO_TIMESTAMP(' 2014-08-26 15:41:22:945000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '9', '5c18dca7733c48e79d1bcfc4cc4873c2', '*/*', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('ddca3b1a491a4c4799cb2ab1cadad935', '0', null, null, '28', TO_TIMESTAMP(' 2014-08-26 15:41:28:606000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038888606', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:28:687000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '82', '127.0.0.1', 'GET', 'http://127.0.0.1:89/jf/', '/jf/operator', TO_TIMESTAMP(' 2014-08-26 15:41:28:605000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '54', '0da15c49299d41a4b720f787d053e3cb', '*/*', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('8259e79e46dd40848a4394079b8f06f9', '0', null, null, '2', TO_TIMESTAMP(' 2014-08-26 15:41:31:061000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038891061', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:31:066000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '6', '127.0.0.1', 'GET', 'http://127.0.0.1:89/jf/', '/jf/station', TO_TIMESTAMP(' 2014-08-26 15:41:31:060000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '4', '233356b63d8e477fb6e948b703232809', '*/*', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('234ab5b95b554b79b0a2d56f64e5d523', '0', null, null, '8', TO_TIMESTAMP(' 2014-08-26 15:41:31:264000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038891264', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:31:266000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '8', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:31:258000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('7d4306b437bc4f9bbd38e5ca826921d7', '0', null, null, '3', TO_TIMESTAMP(' 2014-08-26 15:41:31:709000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038891709', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:31:711000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '3', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:31:708000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('549255f1b7c8410cb1514ec6fa63c4f6', '0', null, null, '2', TO_TIMESTAMP(' 2014-08-26 15:41:31:744000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038891744', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:31:746000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '2', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:31:744000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');
INSERT INTO "SCOTT"."PT_SYSLOG" VALUES ('975ca77469fb49c1918d05ed8c345874', '0', null, null, '3', TO_TIMESTAMP(' 2014-08-26 15:41:31:760000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1409038891760', null, 'current_theme=spacelab; authCode=K29DY3JhVWFUMXc9; userName=admins; authmark=T0s3dFFMbTBjUUQ2UENYdjVZRlQwT2E1NURXYTF5TXpBay8zZ0ppN040SDd1bWI5OVFtTlJkdTh1ZVRnbU1Cem42MGxBVEx1U2lOUVBKYTNDdmhiVGpNL1VKQkVKdHJ5U0xFZXJ3aFpCd0pobUJRTWQvbWNCRFYzMFZ3aXM0dU02UzloU1F6aldXVGhxWjBnNjk2Y29sMmVtSDdlR3A5alZ4aGdvNnZWNGRZenRHbWUyNTRRbmc9PQ; language=zh_cn; mailbox=dongcb678@163.com; JSESSIONID=zb4omfph2bf81l752rvsfbra7', null, TO_TIMESTAMP(' 2014-08-26 15:41:31:762000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '3', '127.0.0.1', 'POST', 'http://127.0.0.1:89/jf/', '/jf/station/treeData', TO_TIMESTAMP(' 2014-08-26 15:41:31:759000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', '0', '09b6ce29313c4051ba765de516a9b283', 'text/plain, */*; q=0.01', 'gzip, deflate', 'zh-cn,en-us;q=0.9,ja;q=0.7,zh-hk;q=0.6,zh-tw;q=0.4,zh;q=0.3,en;q=0.1', 'keep-alive', '127.0.0.1:89', 'XMLHttpRequest', null, '03a44ba0aa4e4905bea726d4da976ba5');

-- ----------------------------
-- Table structure for "SCOTT"."PT_SYSTEMS"
-- ----------------------------
DROP TABLE "SCOTT"."PT_SYSTEMS";
CREATE TABLE "SCOTT"."PT_SYSTEMS" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"DESCRIPTION" VARCHAR2(200 BYTE) NULL ,
"NAMES" VARCHAR2(25 BYTE) NULL ,
"NUMBERS" VARCHAR2(25 BYTE) NULL ,
"ORDERIDS" NUMBER(19) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_SYSTEMS
-- ----------------------------
INSERT INTO "SCOTT"."PT_SYSTEMS" VALUES ('0c1230c98ef34e58947903fab5a4fa85', '0', null, '易信平台', 'yiXin', '3');
INSERT INTO "SCOTT"."PT_SYSTEMS" VALUES ('8a40c0353fa828a6013fa898d4ac0020', '0', '基础平台', '基础平台', 'platform', '1');
INSERT INTO "SCOTT"."PT_SYSTEMS" VALUES ('d3a5c976c4c24751b6b00ec775692683', '0', null, '微信平台', 'weiXin', '2');

-- ----------------------------
-- Table structure for "SCOTT"."PT_UPLOAD"
-- ----------------------------
DROP TABLE "SCOTT"."PT_UPLOAD";
CREATE TABLE "SCOTT"."PT_UPLOAD" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"PARAMETERNAME" VARCHAR2(50 BYTE) NULL ,
"FILENAME" VARCHAR2(50 BYTE) NULL ,
"CONTENTTYPE" VARCHAR2(100 BYTE) NULL ,
"ORIGINALFILENAME" VARCHAR2(500 BYTE) NULL ,
"PATH" VARCHAR2(500 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_UPLOAD
-- ----------------------------

-- ----------------------------
-- Table structure for "SCOTT"."PT_USER"
-- ----------------------------
DROP TABLE "SCOTT"."PT_USER";
CREATE TABLE "SCOTT"."PT_USER" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"ERRORCOUNT" NUMBER(19) NULL ,
"ORDERIDS" NUMBER(19) NULL ,
"PASSWORD" BLOB NULL ,
"SALT" BLOB NULL ,
"STATUS" CHAR(1 BYTE) NULL ,
"STOPDATE" TIMESTAMP(6)  DEFAULT CURRENT_TIMESTAMP  NULL ,
"USERNAME" VARCHAR2(50 BYTE) NULL ,
"DEPARTMENTIDS" VARCHAR2(32 BYTE) NULL ,
"USERINFOIDS" VARCHAR2(32 BYTE) NULL ,
"STATIONIDS" CLOB NULL ,
"DEPTIDS" CLOB NULL ,
"USERIDS" CLOB NULL ,
"GROUPIDS" CLOB NULL ,
"DEPARTMENTNAMES" VARCHAR2(25 BYTE) NULL ,
"STATIONNAMES" CLOB NULL ,
"DEPTNAMES" CLOB NULL ,
"USERNAMES" CLOB NULL ,
"GROUPNAMES" CLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_USER
-- ----------------------------
INSERT INTO "SCOTT"."PT_USER" VALUES ('03a44ba0aa4e4905bea726d4da976ba5', '0', '0', '0', HexToRaw('F1F086AE167055D1183C2CF37EEB10EF41EFFCD6'), HexToRaw('87FFE243576B1A8C'), '1', null, 'admins', '8a40c0353fa828a6013fa898d4ac0028', '03a44ba0aa4e4905bea726d4da976ba5', '8a40c0353fa828a6013fa898d4ac0026', 'dept_4,dept_2,', 'user_03a44ba0aa4e4905bea726d4da976ba5,', '8a40c0353fa828a6013fa898d4ac0028,', '运维部', '应用Java', '运维部,系统平台部,', 'admins', null);

-- ----------------------------
-- Table structure for "SCOTT"."PT_USERINFO"
-- ----------------------------
DROP TABLE "SCOTT"."PT_USERINFO";
CREATE TABLE "SCOTT"."PT_USERINFO" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"VERSION" NUMBER(19) NULL ,
"ADDRESS" VARCHAR2(300 BYTE) NULL ,
"ADDRESSINFO" VARCHAR2(300 BYTE) NULL ,
"AVOIRDUPOIS" VARCHAR2(5 BYTE) NULL ,
"BIRTHDAY" DATE NULL ,
"BLOODGROUP" VARCHAR2(15 BYTE) NULL ,
"CLIENTLEVELEND" TIMESTAMP(6)  DEFAULT CURRENT_TIMESTAMP  NULL ,
"CLIENTLEVELSTART" TIMESTAMP(6)  NULL ,
"CULTURE" VARCHAR2(30 BYTE) NULL ,
"DESCRIPTION" VARCHAR2(200 BYTE) NULL ,
"EMAIL" VARCHAR2(100 BYTE) NULL ,
"FINISHSCHOOLDATE" DATE NULL ,
"FOLK" VARCHAR2(20 BYTE) NULL ,
"GOVERNMENT" VARCHAR2(25 BYTE) NULL ,
"HOMEPAGE" VARCHAR2(100 BYTE) NULL ,
"HOUSEHOLDER" VARCHAR2(20 BYTE) NULL ,
"IDCARD" VARCHAR2(25 BYTE) NULL ,
"MARRIAGE" VARCHAR2(20 BYTE) NULL ,
"MOBILE" VARCHAR2(20 BYTE) NULL ,
"MSN" VARCHAR2(20 BYTE) NULL ,
"NAMES" VARCHAR2(25 BYTE) NULL ,
"NATIVITYADDRESS" VARCHAR2(20 BYTE) NULL ,
"POSTBOY" VARCHAR2(6 BYTE) NULL ,
"QQ" VARCHAR2(20 BYTE) NULL ,
"SCHOOLNAME" VARCHAR2(20 BYTE) NULL ,
"SEX" VARCHAR2(5 BYTE) NULL ,
"SPECIALITY" VARCHAR2(20 BYTE) NULL ,
"STATURE" VARCHAR2(5 BYTE) NULL ,
"TELEPHONE" VARCHAR2(20 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PT_USERINFO
-- ----------------------------
INSERT INTO "SCOTT"."PT_USERINFO" VALUES ('03a44ba0aa4e4905bea726d4da976ba5', '0', '湖北钟祥', null, '55', null, 'bloodGroup_A', null, null, 'wenHuaChenDu_chuZhong', '湖北钟祥', 'dongcb678@163.com', null, 'folk_han', 'government_dangYuan', null, '湖北钟祥', '420881198609285832', 'marriage_no', '13871558042', null, '董华健', '湖北钟祥', '431924', '150584428', '西安外事学院', 'man', '电子商务', '165', '027-65155060');

-- ----------------------------
-- Table structure for "SCOTT"."WX_ARTICLE"
-- ----------------------------
DROP TABLE "SCOTT"."WX_ARTICLE";
CREATE TABLE "SCOTT"."WX_ARTICLE" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"MESSAGEIDS" VARCHAR2(32 BYTE) NULL ,
"TITLE" VARCHAR2(100 BYTE) NULL ,
"DESCRIPTION" CLOB NULL ,
"PICURL" VARCHAR2(500 BYTE) NULL ,
"URL" VARCHAR2(500 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of WX_ARTICLE
-- ----------------------------

-- ----------------------------
-- Table structure for "SCOTT"."WX_FILE"
-- ----------------------------
DROP TABLE "SCOTT"."WX_FILE";
CREATE TABLE "SCOTT"."WX_FILE" (
"IDS" VARCHAR2(32 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of WX_FILE
-- ----------------------------

-- ----------------------------
-- Table structure for "SCOTT"."WX_GROUP"
-- ----------------------------
DROP TABLE "SCOTT"."WX_GROUP";
CREATE TABLE "SCOTT"."WX_GROUP" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"ID" VARCHAR2(50 BYTE) NULL ,
"NAME" VARCHAR2(50 BYTE) NULL ,
"COUNT" NUMBER(20) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of WX_GROUP
-- ----------------------------

-- ----------------------------
-- Table structure for "SCOTT"."WX_KEYWORD"
-- ----------------------------
DROP TABLE "SCOTT"."WX_KEYWORD";
CREATE TABLE "SCOTT"."WX_KEYWORD" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"QUESTION" VARCHAR2(500 BYTE) NULL ,
"QUESTIONKEY" VARCHAR2(500 BYTE) NULL ,
"ANSWER" CLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of WX_KEYWORD
-- ----------------------------

-- ----------------------------
-- Table structure for "SCOTT"."WX_LOCATION"
-- ----------------------------
DROP TABLE "SCOTT"."WX_LOCATION";
CREATE TABLE "SCOTT"."WX_LOCATION" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"OPEN_ID" VARCHAR2(32 BYTE) NULL ,
"LNG" VARCHAR2(10 BYTE) NULL ,
"LAT" VARCHAR2(10 BYTE) NULL ,
"BD09_LNG" VARCHAR2(10 BYTE) NULL ,
"BD09_LAT" VARCHAR2(10 BYTE) NULL ,
"CREATEDATE" TIMESTAMP(6)  DEFAULT CURRENT_TIMESTAMP  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of WX_LOCATION
-- ----------------------------

-- ----------------------------
-- Table structure for "SCOTT"."WX_MESSAGE"
-- ----------------------------
DROP TABLE "SCOTT"."WX_MESSAGE";
CREATE TABLE "SCOTT"."WX_MESSAGE" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"INOUTS" CHAR(1 BYTE) NULL ,
"DATATYPE" CHAR(1 BYTE) NULL ,
"DATACONTENT" CLOB NULL ,
"CREATEDATE" TIMESTAMP(6)  DEFAULT CURRENT_TIMESTAMP  NOT NULL ,
"MSGTYPE" VARCHAR2(50 BYTE) NULL ,
"EVENT" VARCHAR2(50 BYTE) NULL ,
"EVENTKEY" VARCHAR2(50 BYTE) NULL ,
"TOUSERNAME" VARCHAR2(50 BYTE) NULL ,
"FROMUSERNAME" VARCHAR2(50 BYTE) NULL ,
"CREATETIME" NUMBER(20) NULL ,
"MSGID" NUMBER(38) NULL ,
"PICURL" VARCHAR2(500 BYTE) NULL ,
"MEDIAID" VARCHAR2(500 BYTE) NULL ,
"TITLE" VARCHAR2(100 BYTE) NULL ,
"DESCRIPTION" CLOB NULL ,
"URL" VARCHAR2(500 BYTE) NULL ,
"LOCATION_X" NUMBER(20,10) NULL ,
"LOCATION_Y" NUMBER(20,10) NULL ,
"SCALE" NUMBER(20) NULL ,
"LABELS" VARCHAR2(50 BYTE) NULL ,
"CONTENT" CLOB NULL ,
"THUMBMEDIAID" VARCHAR2(500 BYTE) NULL ,
"FORMAT" VARCHAR2(20 BYTE) NULL ,
"RECOGNITION" CLOB NULL ,
"LATITUDE" NUMBER(20,10) NULL ,
"LONGITUDE" NUMBER(20,10) NULL ,
"PRECISIONS" NUMBER(20,10) NULL ,
"TICKET" CLOB NULL ,
"MUSICURL" VARCHAR2(500 BYTE) NULL ,
"HQMUSICURL" VARCHAR2(500 BYTE) NULL ,
"ARTICLECOUNT" NUMBER(2) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of WX_MESSAGE
-- ----------------------------

-- ----------------------------
-- Table structure for "SCOTT"."WX_ROLE"
-- ----------------------------
DROP TABLE "SCOTT"."WX_ROLE";
CREATE TABLE "SCOTT"."WX_ROLE" (
"IDS" VARCHAR2(32 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of WX_ROLE
-- ----------------------------

-- ----------------------------
-- Table structure for "SCOTT"."WX_USER"
-- ----------------------------
DROP TABLE "SCOTT"."WX_USER";
CREATE TABLE "SCOTT"."WX_USER" (
"IDS" VARCHAR2(32 BYTE) NOT NULL ,
"OPENID" VARCHAR2(50 BYTE) NULL ,
"SUBSCRIBE" CHAR(1 BYTE) NULL ,
"SUBSCRIBETIME" NUMBER(20) NULL ,
"NICKNAME" VARCHAR2(50 BYTE) NULL ,
"SEX" CHAR(1 BYTE) NULL ,
"COUNTRY" VARCHAR2(50 BYTE) NULL ,
"PROVINCE" VARCHAR2(50 BYTE) NULL ,
"CITY" VARCHAR2(50 BYTE) NULL ,
"LANGUAGE" VARCHAR2(50 BYTE) NULL ,
"HEADIMGURL" VARCHAR2(500 BYTE) NULL ,
"GROUPIDS" VARCHAR2(32 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of WX_USER
-- ----------------------------

-- ----------------------------
-- Indexes structure for table PT_DEPARTMENT
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_DEPARTMENT"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_DEPARTMENT" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_DEPARTMENT"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_DEPARTMENT" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_DICT
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_DICT"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_DICT" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_DICT"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_DICT" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_GROUP
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_GROUP"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_GROUP" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_GROUP"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_GROUP" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_MENU
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_MENU"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_MENU" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_MENU"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_MENU" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_MODULE
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_MODULE"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_MODULE" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_MODULE"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_MODULE" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_OPERATOR
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_OPERATOR"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_OPERATOR" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_OPERATOR"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_OPERATOR" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_PARAM
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_PARAM"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_PARAM" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_PARAM"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_PARAM" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_RESOURCES
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_RESOURCES"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_RESOURCES" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_RESOURCES"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_RESOURCES" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_ROLE
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_ROLE"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_ROLE" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_ROLE"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_ROLE" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_STATION
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_STATION"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_STATION" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_STATION"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_STATION" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_SYSLOG
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_SYSLOG"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_SYSLOG" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_SYSLOG"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_SYSLOG" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_SYSTEMS
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_SYSTEMS"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_SYSTEMS" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_SYSTEMS"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_SYSTEMS" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_UPLOAD"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_UPLOAD" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table PT_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_USER"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_USER" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_USER"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_USER" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table PT_USERINFO
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."PT_USERINFO"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_USERINFO" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."PT_USERINFO"
-- ----------------------------
ALTER TABLE "SCOTT"."PT_USERINFO" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table WX_ARTICLE
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."WX_ARTICLE"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_ARTICLE" ADD CHECK ("IDS" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_ARTICLE" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."WX_ARTICLE"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_ARTICLE" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table WX_FILE
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."WX_FILE"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_FILE" ADD CHECK ("IDS" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_FILE" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."WX_FILE"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_FILE" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table WX_GROUP
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."WX_GROUP"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_GROUP" ADD CHECK ("IDS" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_GROUP" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."WX_GROUP"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_GROUP" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table WX_KEYWORD
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."WX_KEYWORD"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_KEYWORD" ADD CHECK ("IDS" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_KEYWORD" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."WX_KEYWORD"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_KEYWORD" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table WX_LOCATION
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."WX_LOCATION"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_LOCATION" ADD CHECK ("IDS" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_LOCATION" ADD CHECK ("CREATEDATE" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_LOCATION" ADD CHECK ("IDS" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_LOCATION" ADD CHECK ("CREATEDATE" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."WX_LOCATION"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_LOCATION" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table WX_MESSAGE
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."WX_MESSAGE"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_MESSAGE" ADD CHECK ("IDS" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_MESSAGE" ADD CHECK ("CREATEDATE" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_MESSAGE" ADD CHECK ("IDS" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_MESSAGE" ADD CHECK ("CREATEDATE" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."WX_MESSAGE"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_MESSAGE" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table WX_ROLE
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."WX_ROLE"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_ROLE" ADD CHECK ("IDS" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_ROLE" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."WX_ROLE"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_ROLE" ADD PRIMARY KEY ("IDS");

-- ----------------------------
-- Indexes structure for table WX_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table "SCOTT"."WX_USER"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_USER" ADD CHECK ("IDS" IS NOT NULL);
ALTER TABLE "SCOTT"."WX_USER" ADD CHECK ("IDS" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SCOTT"."WX_USER"
-- ----------------------------
ALTER TABLE "SCOTT"."WX_USER" ADD PRIMARY KEY ("IDS");
