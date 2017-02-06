/*
Navicat SQL Server Data Transfer

Source Server         : localhost-sqlserver
Source Server Version : 105000
Source Host           : 127.0.0.1:1433
Source Database       : jfinaluibv3
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 105000
File Encoding         : 65001

Date: 2017-01-23 14:50:45
*/


-- ----------------------------
-- Table structure for [dbo].[pt_department]
-- ----------------------------
DROP TABLE [dbo].[pt_department]
GO
CREATE TABLE [dbo].[pt_department] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[allchildnodeids] varchar(2000) NULL ,
[departmentlevel] bigint NULL ,
[depttype] char(1) NULL ,
[description] varchar(200) NULL ,
[images] varchar(50) NULL ,
[isparent] varchar(5) NULL ,
[names] varchar(25) NULL ,
[orderids] bigint NULL ,
[url] varchar(100) NULL ,
[parentdepartmentids] varchar(32) NULL ,
[principaluserids] varchar(32) NULL 
)


GO

-- ----------------------------
-- Records of pt_department
-- ----------------------------
INSERT INTO [dbo].[pt_department] ([ids], [version], [allchildnodeids], [departmentlevel], [depttype], [description], [images], [isparent], [names], [orderids], [url], [parentdepartmentids], [principaluserids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0026', N'0', null, N'-1', null, N'根节点', N'1_open.png', N'true', N'公司部门组织结构', N'1', N'#', null, null);
GO
INSERT INTO [dbo].[pt_department] ([ids], [version], [allchildnodeids], [departmentlevel], [depttype], [description], [images], [isparent], [names], [orderids], [url], [parentdepartmentids], [principaluserids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0027', N'0', null, N'0', null, N'系统平台部', N'2.png', N'true', N'系统平台部', N'0', null, N'8a40c0353fa828a6013fa898d4ac0026', null);
GO
INSERT INTO [dbo].[pt_department] ([ids], [version], [allchildnodeids], [departmentlevel], [depttype], [description], [images], [isparent], [names], [orderids], [url], [parentdepartmentids], [principaluserids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0028', N'0', null, N'0', null, N'运维部', N'3.png', N'false', N'运维部', N'0', null, N'8a40c0353fa828a6013fa898d4ac0027', N'03a44ba0aa4e4905bea726d4da976ba5');
GO
INSERT INTO [dbo].[pt_department] ([ids], [version], [allchildnodeids], [departmentlevel], [depttype], [description], [images], [isparent], [names], [orderids], [url], [parentdepartmentids], [principaluserids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0029', N'0', null, N'0', null, N'测试账户', N'4.png', N'true', N'测试部门', N'0', null, N'8a40c0353fa828a6013fa898d4ac0026', null);
GO
INSERT INTO [dbo].[pt_department] ([ids], [version], [allchildnodeids], [departmentlevel], [depttype], [description], [images], [isparent], [names], [orderids], [url], [parentdepartmentids], [principaluserids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0030', N'0', null, N'0', null, N'子部门2', N'5.png', N'true', N'平台组', N'0', null, N'8a40c0353fa828a6013fa898d4ac0029', N'03a44ba0aa4e4905bea726d4da976ba5');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_dict]
-- ----------------------------
DROP TABLE [dbo].[pt_dict]
GO
CREATE TABLE [dbo].[pt_dict] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[description] varchar(200) NULL ,
[images] varchar(50) NULL ,
[names] varchar(25) NULL ,
[orderids] bigint NULL ,
[paths] varchar(1000) NULL ,
[zhuangtai] char(1) NULL ,
[parentids] varchar(32) NULL ,
[isparent] varchar(5) NULL ,
[levels] bigint NULL ,
[numbers] varchar(50) NULL ,
[val] varchar(500) NULL ,
[i18n] char(1) NULL ,
[val_zhcn] varchar(500) NULL ,
[val_zhhk] varchar(500) NULL ,
[val_zhtw] varchar(500) NULL ,
[val_ja] varchar(500) NULL ,
[val_enus] varchar(500) NULL ,
[status] char(1) NULL 
)


GO

-- ----------------------------
-- Records of pt_dict
-- ----------------------------
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'0c78f87750a745bbb59005a6ca0f744a', N'0', null, N'3.png', N'weixinToken', N'3', N'100103root/83f4b0ee56904cbeb5f91696ad804c29/0c78f87750a745bbb59005a6ca0f744a', N'1', N'83f4b0ee56904cbeb5f91696ad804c29', N'false', N'2', N'weixinToken', N'123', N'1', null, null, null, null, null, N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'10c3fc9a884a4cfc91f47e197913fd50', N'1', null, N'2.png', N'钟祥市', N'1', N'100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/10c3fc9a884a4cfc91f47e197913fd50', N'1', N'a1f14efbb8cb4e44a30bd32194d0f24b', N'true', N'3', N'zhongXiangShi', null, null, N'钟祥市', N'钟祥市', N'钟祥市', N'钟祥市', N'钟祥市', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'18a137a0b92944ba857b5dec39b4fa69', N'0', null, N'2.png', N'河南省', N'2', N'100103root/31b6516f36d44fc280b82affc270c479/18a137a0b92944ba857b5dec39b4fa69', N'1', N'31b6516f36d44fc280b82affc270c479', N'false', N'2', N'heNanSheng', null, N'1', N'河南省', N'河南省', N'河南省', N'河南省', N'河南省', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'3082e48992104e3ca8c2f542bbcfbe63', N'0', null, N'2.png', N'三室一厅', N'1', N'100103root/56e8bdbc8d77460da17e473ee30906b0/3082e48992104e3ca8c2f542bbcfbe63', N'1', N'56e8bdbc8d77460da17e473ee30906b0', N'false', N'2', N'sanShiYiTing', null, N'1', N'三室一厅', N'三室一厅', N'三室一厅', N'三室一厅', N'三室一厅', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'31b6516f36d44fc280b82affc270c479', N'2', null, N'2.png', N'省市区', N'1', N'100103root/31b6516f36d44fc280b82affc270c479', N'1', N'8a40c0353fa828a6013fa898d4ac0020', N'true', N'1', N'shengShiQu', null, null, N'省市区', N'省市区', N'省市区', N'省市区', N'省市区', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'325acbd77f5b43a894ec4ef53ba20914', N'0', null, N'2.png', N'洪山区', N'1', N'100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902/325acbd77f5b43a894ec4ef53ba20914', N'1', N'64659405a79a4ecb9f116ae84ec55902', N'false', N'4', N'hongShanQu', null, N'1', N'洪山区', N'洪山区', N'洪山区', N'洪山区', N'洪山区', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'405dc683656a4b328de5d5a19d1662d3', N'0', null, N'2.png', N'胡集镇', N'1', N'100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/10c3fc9a884a4cfc91f47e197913fd50/405dc683656a4b328de5d5a19d1662d3', null, N'10c3fc9a884a4cfc91f47e197913fd50', N'false', N'4', N'huJiZhen', null, N'1', N'胡集镇', N'胡集镇', N'胡集镇', N'胡集镇', N'胡集镇', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'56e8bdbc8d77460da17e473ee30906b0', N'0', null, N'2.png', N'房屋结构', N'2', N'100103root/56e8bdbc8d77460da17e473ee30906b0', N'1', N'8a40c0353fa828a6013fa898d4ac0020', N'true', N'1', N'fangWuJieGou', null, N'1', N'房屋结构', N'房屋结构', N'房屋结构', N'房屋结构', N'房屋结构', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'64659405a79a4ecb9f116ae84ec55902', N'0', null, N'2.png', N'武汉市', N'2', N'100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902', N'1', N'a1f14efbb8cb4e44a30bd32194d0f24b', N'true', N'3', N'wuHanShi', null, N'1', N'武汉市', N'武汉市', N'武汉市', N'武汉市', N'武汉市', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'7381008292054bccba20224bc33774d7', N'6', null, N'2.png', N'weixinAppID', N'1', N'100103root/83f4b0ee56904cbeb5f91696ad804c29/7381008292054bccba20224bc33774d7', N'1', N'83f4b0ee56904cbeb5f91696ad804c29', N'false', N'2', N'weixinAppID', N'123', N'1', N'1234', N'1234', N'1234', N'1234', N'1234', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'8094c60d7a594b36bb0187cbce9c4188', N'0', null, N'2.png', N'weixinAppSecret', N'2', N'100103root/83f4b0ee56904cbeb5f91696ad804c29/8094c60d7a594b36bb0187cbce9c4188', N'1', N'83f4b0ee56904cbeb5f91696ad804c29', N'false', N'2', N'weixinAppSecret', N'123', N'1', null, null, null, null, null, N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'83f4b0ee56904cbeb5f91696ad804c29', N'0', null, N'2.png', N'微信配置', N'1', N'100103root/83f4b0ee56904cbeb5f91696ad804c29', N'1', N'8a40c0353fa828a6013fa898d4ac0020', N'true', N'1', N'weixinConfig', null, N'1', null, null, null, null, null, N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'8a40c0353fa828a6013fa898d4ac0020', N'0', N'字典树', N'1_open.png', N'字典树', N'1', N'100103root', N'1', null, N'true', N'0', null, null, N'0', null, null, null, null, null, N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'a1f14efbb8cb4e44a30bd32194d0f24b', N'0', null, N'2.png', N'湖北省', N'1', N'100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b', N'1', N'31b6516f36d44fc280b82affc270c479', N'true', N'2', N'huBeiSheng', null, N'1', N'湖北省', N'湖北省', N'湖北省', N'湖北省', N'湖北省', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'a929cbf789a74107a74aec88c0bcc8fe', N'0', null, N'2.png', N'柴湖镇', N'1', N'100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/10c3fc9a884a4cfc91f47e197913fd50/a929cbf789a74107a74aec88c0bcc8fe', null, N'10c3fc9a884a4cfc91f47e197913fd50', N'false', N'4', N'chaiHuZhen', null, N'1', N'柴湖镇', N'柴湖镇', N'柴湖镇', N'柴湖镇', N'柴湖镇', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'bf1bf96a123447c58b7f181d3e4e6099', N'0', null, N'2.png', N'两室一厅', N'2', N'100103root/56e8bdbc8d77460da17e473ee30906b0/bf1bf96a123447c58b7f181d3e4e6099', N'1', N'56e8bdbc8d77460da17e473ee30906b0', N'false', N'2', N'laingshiyiting', null, N'1', N'两室一厅', N'两室一厅', N'两室一厅', N'两室一厅', N'两室一厅', N'1');
GO
INSERT INTO [dbo].[pt_dict] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'ddbe84891d8b4632ac0dc2bd36f7f323', N'0', null, N'2.png', N'江岸区', N'2', N'100103root/31b6516f36d44fc280b82affc270c479/a1f14efbb8cb4e44a30bd32194d0f24b/64659405a79a4ecb9f116ae84ec55902/ddbe84891d8b4632ac0dc2bd36f7f323', N'1', N'64659405a79a4ecb9f116ae84ec55902', N'false', N'4', N'jiangAnQu', null, N'1', N'江岸区', N'江岸区', N'江岸区', N'江岸区', N'江岸区', N'1');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_group]
-- ----------------------------
DROP TABLE [dbo].[pt_group]
GO
CREATE TABLE [dbo].[pt_group] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[description] varchar(2000) NULL ,
[names] varchar(50) NULL ,
[roleids] text NULL ,
[numbers] varchar(50) NULL 
)


GO

-- ----------------------------
-- Records of pt_group
-- ----------------------------
INSERT INTO [dbo].[pt_group] ([ids], [version], [description], [names], [roleids], [numbers]) VALUES (N'8a40c0353fa828a6013fa898d4ac0028', N'4', N'系统管理员组', N'超级管理员', N'8a40c0353fa828a6013fa898d4ac0023,', N'SuperAdmin');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_grouprole]
-- ----------------------------
DROP TABLE [dbo].[pt_grouprole]
GO
CREATE TABLE [dbo].[pt_grouprole] (
[ids] varchar(32) NOT NULL ,
[groupids] varchar(32) NULL ,
[roleids] varchar(32) NULL 
)


GO

-- ----------------------------
-- Records of pt_grouprole
-- ----------------------------
INSERT INTO [dbo].[pt_grouprole] ([ids], [groupids], [roleids]) VALUES (N'b0afd556f2e6421298f6aca3ef226afa', N'8a40c0353fa828a6013fa898d4ac0028', N'8a40c0353fa828a6013fa898d4ac0023');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_menu]
-- ----------------------------
DROP TABLE [dbo].[pt_menu]
GO
CREATE TABLE [dbo].[pt_menu] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[images] varchar(50) NULL ,
[levels] bigint NULL ,
[orderids] bigint NULL ,
[operatorids] varchar(32) NULL ,
[parentmenuids] varchar(32) NULL ,
[systemsids] varchar(32) NULL ,
[isparent] varchar(5) NULL ,
[names_zhcn] varchar(25) NULL ,
[names_zhhk] varchar(25) NULL ,
[names_zhtw] varchar(25) NULL ,
[names_enus] varchar(25) NULL ,
[names_ja] varchar(25) NULL ,
[param] varchar(200) NULL 
)


GO

-- ----------------------------
-- Records of pt_menu
-- ----------------------------
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'017173f642e545b8a7b02fc6f5246b2f', N'0', N'2.png', null, N'2', N'dfe9d74fe0ef4220bfcfe6d7bb2f9436', N'625f1e0e951a4199a7262e064512e2c7', null, N'false', N'用户管理', null, null, null, null, null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'294ab73cc8274f1fa0663bf9c1bbe4d4', N'1', N'2.png', null, N'3', null, N'8a40c0353fa828a6013fa898d4ac0020', N'8a40c0353fa828a6013fa898d4ac0020', N'true', N'配置项', N'配置项', N'配置项', N'Configuration item', N'構成項目', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'297e0cf944f8cce70144f8dce1540069', N'2', N'8.png', N'0', N'8', N'8897dbe85b3e4e6989d662495272cf26', N'294ab73cc8274f1fa0663bf9c1bbe4d4', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'字典管理', N'字典管理', N'字典管理', N'dictionary management', N'辞書の管理', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'3272e2e0a7cd4d7f8e1e88abe9d70ae4', N'1', N'2.png', null, N'2', N'9adcc4c40e3148988e5003aaedbb4948', N'294ab73cc8274f1fa0663bf9c1bbe4d4', null, N'false', N'参数管理', N'参数管理', N'参数管理', N'Parameter management', N'パラメータの管理', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'3ffaf784ef95497b803d7a9f43c9e7a8', N'0', N'5.png', null, N'5', N'0773a58c4bdb4858ab062c4a2a4da69a', N'625f1e0e951a4199a7262e064512e2c7', null, N'false', N'自动回复', null, null, null, null, null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'4600e755ec5f4dc6a5783a4d097a42f2', N'0', N'4.png', null, N'4', N'420d8ebc68ad44dc8188d4c27dc585d1', N'625f1e0e951a4199a7262e064512e2c7', null, N'false', N'位置管理', null, null, null, null, null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'4bae83d582744c928cb8c8f419586a31', N'1', N'2.png', null, N'1', null, N'8a40c0353fa828a6013fa898d4ac0020', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'用户权限', N'用户权限', N'用户权限', N'User privilege', N'ユーザの権限', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'625f1e0e951a4199a7262e064512e2c7', N'0', N'5.png', null, N'5', null, N'8a40c0353fa828a6013fa898d4ac1100', null, N'true', N'微信管理', null, null, null, null, null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'75e3b493276146eb839ed9fb3285e829', N'1', N'4.png', null, N'4', N'15495beebe984cd19dc30d65676c4c4d', N'ed90c7b40be74552bbfa7ac58efdc5fe', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'资源负载', N'资源负载', N'资源负载', N'资源负载', N'资源负载', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'8a40c0353fa828a6013fa898d4ac0020', N'1', N'3.png', N'-1', N'1', null, null, N'8a40c0353fa828a6013fa898d4ac0020', N'true', N'菜单管理', N'菜单管理', N'菜单管理', N'Menu management', N'管理メニュー', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'8a40c0353fa828a6013fa898d4ac0021', N'1', N'3.png', N'2', N'1', N'91baed789bc14efdbebb10b49c69ee5b', N'4bae83d582744c928cb8c8f419586a31', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'用户管理', N'用户管理', N'用户管理', N'User management', N'ユーザーの管理', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'8a40c0353fa828a6013fa898d4ac0022', N'1', N'3.png', N'2', N'2', N'1b0d7476974e4bf9b52f75fb82f87330', N'4bae83d582744c928cb8c8f419586a31', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'分组管理', N'分组管理', N'分组管理', N'Group management', N'グループの管理', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'8a40c0353fa828a6013fa898d4ac0023', N'1', N'3.png', N'2', N'3', N'7ae62737df444d619f8fd376360d160c', N'4bae83d582744c928cb8c8f419586a31', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'角色管理', N'角色管理', N'角色管理', N'Role management', N'キャラクターの管理', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'8a40c0353fa828a6013fa898d4ac0024', N'1', N'3.png', N'2', N'5', N'7eab5f800bab4efb8df1b2e8a0575f73', N'4bae83d582744c928cb8c8f419586a31', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'系统管理', N'系统管理', N'系统管理', N'System management', N'システム管理', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'8a40c0353fa828a6013fa898d4ac0025', N'1', N'3.png', N'2', N'6', N'0da15c49299d41a4b720f787d053e3cb', N'4bae83d582744c928cb8c8f419586a31', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'功能管理', N'功能管理', N'功能管理', N'Functional management', N'機能管理', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'8a40c0353fa828a6013fa898d4ac0026', N'1', N'8.png', N'2', N'4', N'233356b63d8e477fb6e948b703232809', N'4bae83d582744c928cb8c8f419586a31', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'岗位管理', N'岗位管理', N'岗位管理', N'Post management', N'ポストの管理', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'8a40c0353fa828a6013fa898d4ac0027', N'1', N'3.png', N'2', N'7', N'ad09a1b897744812875c752c2d70f11a', N'a5bf1c38a2ea4b6085d15b830cb80518', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'部门管理', N'部门管理', N'部门管理', N'Department management', N'部門の管理', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'8a40c0353fa828a6013fa898d4ac1100', N'0', N'3.png', N'-1', N'1', null, null, N'd3a5c976c4c24751b6b00ec775692683', N'true', N'后台菜单组织结构', null, null, null, null, null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'8a40c0353fa828a6013fa898d4ac2200', N'0', N'3.png', N'-1', N'1', null, null, N'0c1230c98ef34e58947903fab5a4fa85', N'true', N'后台菜单组织结构', null, null, null, null, null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'9fd1692ae1fc4f3dab4f0fca7c2a6d68', N'1', N'3.png', null, N'3', N'36d3b89e378b451ca89d1a41a3c53e10', N'ed90c7b40be74552bbfa7ac58efdc5fe', null, N'false', N'在线Log4j', N'在线Log4j', N'在线Log4j', N'Online Log4j', N'オンラインLog4j', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'a5bf1c38a2ea4b6085d15b830cb80518', N'1', N'2.png', null, N'2', null, N'8a40c0353fa828a6013fa898d4ac0020', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'组织机构', N'组织机构', N'组织机构', N'Organization', N'組織機構', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'aa2b382e85b348e6a9cd0cb967ff4006', N'0', N'3.png', null, N'3', null, N'625f1e0e951a4199a7262e064512e2c7', null, N'false', N'消息管理', null, null, null, null, null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'bd5d741147f74a058a03bbb5164f392b', N'1', N'2.png', null, N'9', N'd496b161d2564111992687b948862244', N'ed90c7b40be74552bbfa7ac58efdc5fe', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'数据源', N'数据源', N'数据源', N'Data source', N'データソース', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'cdfd617ec645490f98a64bf36102d44f', N'6', N'6.png', null, N'6', null, N'625f1e0e951a4199a7262e064512e2c7', null, N'false', N'新增菜单12', N'新增菜单13', N'新增菜单14', N'222', N'111', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'ed30f3cd2e9f4e0aa0b950c147035b67', N'0', N'2.png', null, N'2', N'2c91467f905a4f5ba9f52830131c8ad9', N'625f1e0e951a4199a7262e064512e2c7', null, N'false', N'分组管理', null, null, null, null, null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'ed90c7b40be74552bbfa7ac58efdc5fe', N'1', N'2.png', null, N'2', null, N'8a40c0353fa828a6013fa898d4ac0020', N'8a40c0353fa828a6013fa898d4ac0020', N'true', N'系统维护', N'系统维护', N'系统维护', N'System maintenance', N'システムのメンテナンス', null);
GO
INSERT INTO [dbo].[pt_menu] ([ids], [version], [images], [levels], [orderids], [operatorids], [parentmenuids], [systemsids], [isparent], [names_zhcn], [names_zhhk], [names_zhtw], [names_enus], [names_ja], [param]) VALUES (N'f353e484ce074b86b0210f66346d9a80', N'1', N'9.png', null, N'10', N'235d855d7b914d728e434f0f309aa04d', N'ed90c7b40be74552bbfa7ac58efdc5fe', N'8a40c0353fa828a6013fa898d4ac0020', N'false', N'系统日志', N'系统日志', N'系统日志', N'The system log', N'システムログ', null);
GO

-- ----------------------------
-- Table structure for [dbo].[pt_module]
-- ----------------------------
DROP TABLE [dbo].[pt_module]
GO
CREATE TABLE [dbo].[pt_module] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[description] varchar(200) NULL ,
[images] varchar(50) NULL ,
[isparent] varchar(5) NULL ,
[names] varchar(25) NULL ,
[orderids] bigint NULL ,
[parentmoduleids] varchar(32) NULL ,
[systemsids] varchar(32) NULL 
)


GO

-- ----------------------------
-- Records of pt_module
-- ----------------------------
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'297e0cf944e9762e0144e97dfd6e00c9', N'0', N'数据源', N'2.png', N'true', N'数据源', N'2', N'ec01ee2ea97a4ff1b2371304b8d0fe34', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'33a6f5664a194da8bc2394826cc25bc3', N'0', null, N'2.png', N'true', N'岗位功能', N'2', N'6c4e642b911e468dbdcb62c9b4669eb3', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'377c7b7a896b43d0992c630d62bd596d', N'0', null, N'2.png', N'true', N'用户岗位', N'2', N'6c4e642b911e468dbdcb62c9b4669eb3', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'417ed3d3cf4d4b7a939613829e8db17d', N'0', null, N'3.png', N'true', N'消息管理', N'3', N'8a40c0353fa828a6013fa898d4ac1100', N'd3a5c976c4c24751b6b00ec775692683');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'4c343ddf030d4e17b6db83465600778b', N'0', null, N'2.png', N'true', N'验证码', N'2', N'75f9bd430f4a4ec7b0a71928e15ea5f7', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'529d39f773a54ff39eea877f606d74b0', N'0', null, N'2.png', N'true', N'Ueditor', N'2', N'75f9bd430f4a4ec7b0a71928e15ea5f7', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'625e895224aa424693149208c9d4073e', N'0', null, N'2.png', N'true', N'分组角色', N'2', N'6c4e642b911e468dbdcb62c9b4669eb3', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'68422887e56645728038cdde08caef9a', N'0', null, N'2.png', N'true', N'Test', N'2', N'8a40c0353fa828a6013fa898d4ac0020', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'6c4e642b911e468dbdcb62c9b4669eb3', N'0', null, N'2.png', N'true', N'权限', N'2', N'8a40c0353fa828a6013fa898d4ac0020', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'75f9bd430f4a4ec7b0a71928e15ea5f7', N'0', null, N'2.png', N'true', N'通用功能', N'2', N'8a40c0353fa828a6013fa898d4ac0020', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'7a35846a305c42abb68601b4f7347289', N'0', null, N'4.png', N'true', N'主页管理', N'4', N'8a40c0353fa828a6013fa898d4ac1100', N'd3a5c976c4c24751b6b00ec775692683');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'7cbeac9418c946a2bda0c6aabf23c276', N'0', null, N'2.png', N'true', N'博客', N'2', N'68422887e56645728038cdde08caef9a', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0020', N'0', N'根节点', N'3.png', N'true', N'根节点', N'1', null, N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0021', N'0', N'后台登陆', N'8.png', N'true', N'登陆', N'1', N'6c4e642b911e468dbdcb62c9b4669eb3', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0022', N'0', N'字典', N'2.png', N'true', N'字典', N'2', N'eabc054760164b4cb730c4f5c2a4d305', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0023', N'0', N'用户分组管理', N'2.png', N'true', N'分组', N'2', N'6c4e642b911e468dbdcb62c9b4669eb3', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0024', N'0', N'角色管理', N'2.png', N'true', N'角色', N'3', N'6c4e642b911e468dbdcb62c9b4669eb3', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0025', N'0', N'岗位管理', N'5.png', N'true', N'岗位', N'4', N'cbe70ed41ad040938cfd7bcc5f4f0c58', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0026', N'0', N'系统管理', N'5.png', N'true', N'系统', N'5', N'cbe70ed41ad040938cfd7bcc5f4f0c58', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0027', N'0', N'功能管理', N'7.png', N'true', N'功能', N'6', N'6c4e642b911e468dbdcb62c9b4669eb3', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0028', N'0', N'部门管理', N'3.png', N'true', N'部门', N'7', N'cbe70ed41ad040938cfd7bcc5f4f0c58', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0029', N'0', N'日志管理', N'6.png', N'true', N'日志', N'11', N'ec01ee2ea97a4ff1b2371304b8d0fe34', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0030', N'0', N'用户管理', N'3.png', N'true', N'用户', N'1', N'cbe70ed41ad040938cfd7bcc5f4f0c58', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0031', N'0', N'公共功能', N'5.png', N'true', N'公共', N'1', N'75f9bd430f4a4ec7b0a71928e15ea5f7', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0032', N'0', N'菜单管理', N'8.png', N'true', N'菜单', N'1', N'6c4e642b911e468dbdcb62c9b4669eb3', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0033', N'0', N'模块管理', N'7.png', N'true', N'模块', N'1', N'6c4e642b911e468dbdcb62c9b4669eb3', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac1100', N'0', N'根节点', N'3.png', N'true', N'根节点', N'1', null, N'd3a5c976c4c24751b6b00ec775692683');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8a40c0353fa828a6013fa898d4ac2200', N'0', N'根节点', N'3.png', N'true', N'根节点', N'1', null, N'0c1230c98ef34e58947903fab5a4fa85');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8d7a260e02674bd3873656deb716202e', N'0', null, N'4.png', N'false', N'上传文件', N'4', N'75f9bd430f4a4ec7b0a71928e15ea5f7', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'8f53706d4af541588bde334d99d44727', N'0', null, N'6.png', N'true', N'自动回复', N'6', N'8a40c0353fa828a6013fa898d4ac1100', N'd3a5c976c4c24751b6b00ec775692683');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'c4ab6b8d50434ddf8fa0ec106fcfc6ea', N'0', null, N'2.png', N'true', N'角色功能', N'2', N'6c4e642b911e468dbdcb62c9b4669eb3', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'c4e63c4171db4ae2a83f7dfcc2656b0e', N'0', null, N'2.png', N'true', N'用户管理', N'2', N'8a40c0353fa828a6013fa898d4ac1100', N'd3a5c976c4c24751b6b00ec775692683');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'c87c35097a2d4bc898fe6e9b1e280a3d', N'0', null, N'5.png', N'true', N'位置管理', N'5', N'8a40c0353fa828a6013fa898d4ac1100', N'd3a5c976c4c24751b6b00ec775692683');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'c9cbb508c11b4b10aeac87a4f3ebc340', N'0', null, N'2.png', N'true', N'资源负载', N'2', N'ec01ee2ea97a4ff1b2371304b8d0fe34', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'cbe70ed41ad040938cfd7bcc5f4f0c58', N'0', null, N'2.png', N'true', N'组织机构', N'2', N'8a40c0353fa828a6013fa898d4ac0020', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'e6eb0165223447218410f867a9614300', N'0', null, N'2.png', N'true', N'分组管理', N'2', N'8a40c0353fa828a6013fa898d4ac1100', N'd3a5c976c4c24751b6b00ec775692683');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'eabc054760164b4cb730c4f5c2a4d305', N'0', null, N'2.png', N'true', N'配置项', N'2', N'8a40c0353fa828a6013fa898d4ac0020', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'ec01ee2ea97a4ff1b2371304b8d0fe34', N'0', null, N'2.png', N'true', N'运维', N'2', N'8a40c0353fa828a6013fa898d4ac0020', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'f2496d3a9635448280b28fbc373f6db6', N'0', null, N'2.png', N'true', N'新增模块9', N'2', N'cbe70ed41ad040938cfd7bcc5f4f0c58', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'f7fbc8e3ee59405dabe02e18d562abf4', N'0', null, N'2.png', N'true', N'用户分组', N'2', N'6c4e642b911e468dbdcb62c9b4669eb3', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'f85f516c0b86439087d48a45173ba0e7', N'0', null, N'2.png', N'true', N'Log4j', N'2', N'ec01ee2ea97a4ff1b2371304b8d0fe34', N'8a40c0353fa828a6013fa898d4ac0020');
GO
INSERT INTO [dbo].[pt_module] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentmoduleids], [systemsids]) VALUES (N'ffeeb72e053a4a86a4fe242642877a44', N'0', null, N'2.png', N'true', N'参数管理', N'2', N'eabc054760164b4cb730c4f5c2a4d305', N'8a40c0353fa828a6013fa898d4ac0020');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_operator]
-- ----------------------------
DROP TABLE [dbo].[pt_operator]
GO
CREATE TABLE [dbo].[pt_operator] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[description] text NULL ,
[names] varchar(25) NULL ,
[onemany] char(1) NULL ,
[returnparamkeys] varchar(100) NULL ,
[returnurl] varchar(200) NULL ,
[rowfilter] char(1) NULL ,
[url] varchar(200) NULL ,
[moduleids] varchar(32) NULL ,
[modulenames] varchar(50) NULL ,
[splitpage] char(1) NULL ,
[formtoken] char(1) NULL ,
[ipblack] char(1) NULL ,
[privilegess] char(1) NULL ,
[ispv] char(1) NULL ,
[pvtype] char(1) NULL ,
[csrf] char(1) NULL ,
[referer] char(1) NULL ,
[method] char(1) NULL ,
[syslog] char(1) NULL ,
[enctype] char(1) NULL 
)


GO

-- ----------------------------
-- Records of pt_operator
-- ----------------------------
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'01aa0c85c8b84ae8aca7f5484336b203', N'0', null, N'保存', null, null, null, N'0', N'/platform/dict/save', N'8a40c0353fa828a6013fa898d4ac0022', N'字典', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'0478826a46df4f20b12f4043a97f8209', N'0', null, N'验证码', null, null, null, N'0', N'/platform/authImg', N'4c343ddf030d4e17b6db83465600778b', N'验证码', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'05114c0cbe1f4c2095b3216f13cfb681', N'0', null, N'保存', null, null, null, N'0', N'/wx/keyword/save', N'8f53706d4af541588bde334d99d44727', N'自动回复', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'053d330462e1459ca1012c9d29113bc4', N'0', null, N'获取部门负责人', null, null, null, N'0', N'/platform/dept/getPrincipal', N'8a40c0353fa828a6013fa898d4ac0028', N'部门', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'0773a58c4bdb4858ab062c4a2a4da69a', N'0', null, N'默认主页', null, null, null, N'0', N'/wx/keyword', N'8f53706d4af541588bde334d99d44727', N'自动回复', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'08a96d5dd37f49459eeb02eebeb0a78c', N'0', null, N'列表', null, null, null, N'0', N'/platform/roleOperator', N'c4ab6b8d50434ddf8fa0ec106fcfc6ea', N'角色功能', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'091855dd809b418fae88a7fec6d9f246', N'0', null, N'准备更新', null, null, null, N'0', N'/platform/dict/edit', N'8a40c0353fa828a6013fa898d4ac0022', N'字典', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'09b6ce29313c4051ba765de516a9b283', N'0', null, N'treeData', null, null, null, N'0', N'/platform/station/treeData', N'8a40c0353fa828a6013fa898d4ac0025', N'岗位', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'09dbbe046d6e469d8a5ba12e29abc522', N'0', null, N'菜单功能列表', null, null, null, N'0', N'/platform/menu/list', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'0da15c49299d41a4b720f787d053e3cb', N'0', null, N'默认列表', null, null, null, N'0', N'/platform/operator', N'8a40c0353fa828a6013fa898d4ac0027', N'功能', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'0fb7938c7d614fc389568eb67b442303', N'0', null, N'单选', null, null, null, N'0', N'/platform/module/radio.html', N'8a40c0353fa828a6013fa898d4ac0033', N'模块', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'1046389d8525451697f2793185e7d6ee', N'0', null, N'更新', null, null, null, N'0', N'/platform/dept/update', N'8a40c0353fa828a6013fa898d4ac0028', N'部门', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'10499bc7f9cb4adf99beba00343b4ea6', N'0', null, N'获取菜单功能', null, null, null, N'0', N'/platform/menu/getOperator', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'12141c1c3be241ca8a868bce9cd610d5', N'0', null, N'准备添加', null, null, null, N'0', N'/platform/dict/add.html', N'8a40c0353fa828a6013fa898d4ac0022', N'字典', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'1329f58a0eed44e195dec78bddc591b6', N'0', null, N'单文件分片上传', null, null, null, N'0', N'/platform/upload/slice', N'8d7a260e02674bd3873656deb716202e', N'上传文件', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'15566e63f3104c73b4a0b4a784dd11ca', N'0', null, N'保存', null, null, null, N'0', N'/platform/role/save', N'8a40c0353fa828a6013fa898d4ac0024', N'角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'18f50e0f48ef4dd9bec85f5612ab10c0', N'0', null, N'功能列表', null, null, null, N'0', N'/platform/test/operator', N'68422887e56645728038cdde08caef9a', N'Test', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'1a8b4d8e4411412fa8bb561393563a85', N'0', null, N'准备添加', null, null, null, N'0', N'/platform/user/add.html', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'1b0d7476974e4bf9b52f75fb82f87330', N'0', null, N'分组默认列表', null, null, null, N'0', N'/platform/group', N'8a40c0353fa828a6013fa898d4ac0023', N'分组', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'1b1a809815574b2a9c1d0e18d692de17', N'0', null, N'更新', null, null, null, N'0', N'/platform/operator/update', N'8a40c0353fa828a6013fa898d4ac0027', N'功能', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'1d2b6919b80a4a21821adc3efcda77b2', N'0', null, N'列表', null, null, null, N'0', N'/platform/upload/list', N'8d7a260e02674bd3873656deb716202e', N'上传文件', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'1f05b6496a494f488e4cacd2a449c37a', N'0', null, N'删除', null, null, null, N'0', N'/platform/stationOperator/del', N'33a6f5664a194da8bc2394826cc25bc3', N'岗位功能', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'21141da4febe4c929abe37126b37fd12', N'0', null, N'多选', null, null, null, N'0', N'/platform/station/checkbox.html', N'8a40c0353fa828a6013fa898d4ac0025', N'岗位', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'21b0a910ef6e4c60a325d5e57e6e6f65', N'0', null, N'单选', null, null, null, N'0', N'/platform/dict/radio.html', N'8a40c0353fa828a6013fa898d4ac0022', N'字典', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'22926eb196a14b48be775f4880b5ba94', N'0', null, N'保存', null, null, null, N'0', N'/platform/group/save', N'8a40c0353fa828a6013fa898d4ac0023', N'分组', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'2329f58a0eed44e195dec78bddc591b7', N'0', null, N'多文件分片上传', null, null, null, N'0', N'/platform/upload/slices', N'8d7a260e02674bd3873656deb716202e', N'上传文件', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'233356b63d8e477fb6e948b703232809', N'0', null, N'默认树', null, null, null, N'0', N'/platform/station', N'8a40c0353fa828a6013fa898d4ac0025', N'岗位', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'235d855d7b914d728e434f0f309aa04d', N'0', null, N'默认列表', null, null, null, N'0', N'/platform/sysLog', N'8a40c0353fa828a6013fa898d4ac0029', N'日志', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'235d855d7b914d728e434f0f309ab041', N'0', null, N'导出', null, null, null, N'0', N'/platform/sysLog/export', N'8a40c0353fa828a6013fa898d4ac0029', N'日志', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'29c18b3394924c30882da049da14ad99', N'0', null, N'更新', null, null, null, N'0', N'/platform/role/update', N'8a40c0353fa828a6013fa898d4ac0024', N'角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'2bd0e8f116f9420692a81d1723cecf5c', N'0', null, N'日志列表', null, null, null, N'0', N'/platform/test/sysLog', N'68422887e56645728038cdde08caef9a', N'Test', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'2be34991827e4e8da8e92f9b9e8bce25', N'0', null, N'treeTableSub', null, null, null, N'0', N'/platform/dict/treeTable', N'8a40c0353fa828a6013fa898d4ac0022', N'字典', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'2c2063e17dc742a3b9c330b84c5dfa6a', N'0', null, N'自动补全', null, null, null, N'0', N'/platform/test/autoComplete', N'68422887e56645728038cdde08caef9a', N'Test', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'2c91467f905a4f5ba9f52830131c8ad9', N'0', null, N'默认分组列表', null, null, null, N'0', N'/wx/group', N'e6eb0165223447218410f867a9614300', N'分组管理', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'2e32e08e495b4ccea6148774e9f91182', N'0', null, N'查看', null, null, null, N'0', N'/platform/param/view', N'ffeeb72e053a4a86a4fe242642877a44', N'参数管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'2fbbc9cfb0bf4b5bb504ead155c3423c', N'0', null, N'保存', null, null, null, N'0', N'/platform/station/save', N'8a40c0353fa828a6013fa898d4ac0025', N'岗位', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'2fee901117c64e18873f60e8f800713d', N'0', null, N'单选', null, null, null, N'0', N'/platform/station/radio.html', N'8a40c0353fa828a6013fa898d4ac0025', N'岗位', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'3085a3b0c20d4f3aaa7c2d27fe986aba', N'0', null, N'博客添加', null, null, null, N'0', N'/test/blog/add.html', N'7cbeac9418c946a2bda0c6aabf23c276', N'博客', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'30bf01ffe1cb4ed39e92c6600ea39e93', N'0', null, N'添加', null, null, null, N'0', N'/platform/groupRole/addRole', N'625e895224aa424693149208c9d4073e', N'分组角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'32a3e59964204a3c8848e84b864306ae', N'0', null, N'删除', null, null, null, N'0', N'/platform/systems/delete', N'8a40c0353fa828a6013fa898d4ac0026', N'系统', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'3329f58a0eed44e195dec78bddc591b8', N'0', null, N'验证文件md5', null, null, null, N'0', N'/platform/upload/md5', N'8d7a260e02674bd3873656deb716202e', N'上传文件', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'335d1f8f46eb47a18001889f8cc21348', N'0', null, N'删除', null, null, null, N'0', N'/platform/role/delete', N'8a40c0353fa828a6013fa898d4ac0024', N'角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'351851fb7fce48f9a0ff6747971715ac', N'0', null, N'lucene', null, null, null, N'0', N'/platform/test/lucene', N'68422887e56645728038cdde08caef9a', N'Test', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'362cf247241c4d12b6242301e4a73516', N'0', null, N'删除', null, null, null, N'0', N'/platform/station/delete', N'8a40c0353fa828a6013fa898d4ac0025', N'岗位', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'37218fb52ec94fb4bf76209a17916094', N'0', null, N'默认树', null, null, null, N'0', N'/platform/module', N'8a40c0353fa828a6013fa898d4ac0033', N'模块', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'39d82b5574b540b88d3723b36eb3e577', N'0', null, N'验证手机号是否存在', null, null, null, N'0', N'/platform/login/valiMobile', N'8a40c0353fa828a6013fa898d4ac0021', N'登陆', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'3da96263a14343eaa7b409a93ec9e1db', N'0', null, N'treeTable', null, null, null, N'0', N'/platform/param/treeTable', N'ffeeb72e053a4a86a4fe242642877a44', N'参数管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'3dd486cd58da467dbd83ae420db14815', N'0', null, N'准备添加', null, null, null, N'0', N'/weiXin/keyword/add.html', N'8f53706d4af541588bde334d99d44727', N'自动回复', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'3e4e9e72dab243d38a1785d157c24cb6', N'0', null, N'博客更新', null, null, null, N'0', N'/test/blog/update', N'7cbeac9418c946a2bda0c6aabf23c276', N'博客', N'0', N'1', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'3ee5f986289d4a1990f4e42c9a0caadb', N'0', null, N'准备添加', null, null, null, N'0', N'/platform/group/add.html', N'8a40c0353fa828a6013fa898d4ac0023', N'分组', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'420d8ebc68ad44dc8188d4c27dc585d1', N'0', null, N'位置默认列表', null, null, null, N'0', N'/wx/location', N'c87c35097a2d4bc898fe6e9b1e280a3d', N'位置管理', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'423e8c2e2a644bbda0803f46ea8f31e2', N'0', null, N'准备国际化编辑', null, null, null, N'0', N'/platform/menu/toEdit', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'4376888fd74f4247a926529e5da03442', N'0', null, N'treeData', null, null, null, N'0', N'/platform/user/treeData', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'437e05d09dd94720b67c4f230cdebe58', N'0', null, N'更新', null, null, null, N'0', N'/platform/module/update', N'8a40c0353fa828a6013fa898d4ac0033', N'模块', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'46b7269a26044dfebb4edd06a2f9cd83', N'0', null, N'博客列表', null, null, null, N'0', N'/test/blog', N'7cbeac9418c946a2bda0c6aabf23c276', N'博客', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'46e00ef0fd234e9dbf68ed9bbb437d0f', N'0', null, N'多选', null, null, null, N'0', N'/platform/department/checkbox.html', N'8a40c0353fa828a6013fa898d4ac0028', N'部门', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'481d4d5c0a634c4085c72c990260e58d', N'0', null, N'微信管理主页', null, null, null, N'0', N'/wx/index/content', N'7a35846a305c42abb68601b4f7347289', N'主页管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'483bdacba04f4663986e6339166e8321', N'0', null, N'验证账号是否存在', null, null, null, N'0', N'/platform/login/valiUserName', N'8a40c0353fa828a6013fa898d4ac0021', N'登陆', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'48db51f20b504c4ab489b1dcfd3ecbd9', N'0', null, N'密码变更', null, null, null, N'0', N'/platform/user/passChange.html', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'4959d88b8ca64eb19310c30799faa07c', N'0', null, N'准备添加', null, null, null, N'0', N'/platform/param/add.html', N'ffeeb72e053a4a86a4fe242642877a44', N'参数管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'4a6544ae7a2548ad81c0e3994999023c', N'0', null, N'准备设置菜单功能', null, null, null, N'0', N'/platform/menu/operatorTree.html', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'4bebccaa8f0c4bfbaa2ff89f00706100', N'0', null, N'博客编辑', null, null, null, N'0', N'/test/blog/edit', N'7cbeac9418c946a2bda0c6aabf23c276', N'博客', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'4df80521e66447618796c3cfe02bf239', N'0', null, N'默认treeTable', null, null, null, N'0', N'/platform/dict', N'8a40c0353fa828a6013fa898d4ac0022', N'字典', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'4e03be6af2c74dae99a131a1ab3569f6', N'0', null, N'编辑', null, null, null, N'0', N'/platform/param/edit', N'ffeeb72e053a4a86a4fe242642877a44', N'参数管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'5148ea207b974ee197f0bc57060ab1ad', N'0', null, N'删除', null, null, null, N'0', N'/wx/location/delete', N'c87c35097a2d4bc898fe6e9b1e280a3d', N'位置管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'58a85040aa9f40cca0bdba6e23e30363', N'0', null, N'保存', null, null, null, N'0', N'/platform/dept/save', N'8a40c0353fa828a6013fa898d4ac0028', N'部门', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'5b249ad344d948b99f58768c323f5f71', N'0', null, N'准备添加', null, null, null, N'0', N'/platform/systems/add.html', N'8a40c0353fa828a6013fa898d4ac0026', N'系统', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'5b47ae382f42421682852f889c176d49', N'0', null, N'验证身份证是否存在', null, null, null, N'0', N'/platform/login/valiIdcard', N'8a40c0353fa828a6013fa898d4ac0021', N'登陆', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'5c2bdc059ae24ffda2758a2781bb46da', N'0', null, N'log4jServlet', null, null, null, N'0', N'/se/log4j', N'f85f516c0b86439087d48a45173ba0e7', N'Log4j', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'5d6f2bb8faa948108081492179d0c0ad', N'0', null, N'删除', null, null, null, N'0', N'/platform/upload/delete', N'8d7a260e02674bd3873656deb716202e', N'上传文件', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'5fcac107c80d493d91b53a815d4b297a', N'0', null, N'保存', null, null, null, N'0', N'/platform/user/save', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'61da3d9c60704621aa60d1da4553a264', N'0', null, N'添加', null, null, null, N'0', N'/platform/userGroup/addGroup', N'f7fbc8e3ee59405dabe02e18d562abf4', N'用户分组', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'6324ff9e83654aa0bf7f9d918b636b55', N'0', null, N'查看字典', null, null, null, N'0', N'/platform/dict/view', N'8a40c0353fa828a6013fa898d4ac0022', N'字典', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'6566adb7fc6347e7b01a3c47129b5eb5', N'0', null, N'ueditor', null, null, null, N'0', N'/platform/ueditor', N'529d39f773a54ff39eea877f606d74b0', N'Ueditor', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'6569e0d9f2cd4e3a97af4e1b0cd8d2f7', N'0', null, N'删除', null, null, null, N'0', N'/platform/dict/delete', N'8a40c0353fa828a6013fa898d4ac0022', N'字典', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'671ce1e6167840baaa6d27f4f04574c9', N'0', null, N'主页', null, null, null, N'0', N'/platform/param', N'ffeeb72e053a4a86a4fe242642877a44', N'参数管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'6b527ed138c343a89ddf73cf16fef565', N'0', null, N'更新', null, null, null, N'0', N'/wx/keyword/update', N'8f53706d4af541588bde334d99d44727', N'自动回复', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'6daed51284f94923b1c8a6414e646959', N'0', null, N'treeData', null, null, null, N'0', N'/platform/operator/treeData', N'8a40c0353fa828a6013fa898d4ac0027', N'功能', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'721f7255449c445faf36607c254eea06', N'0', null, N'iframe', null, null, null, N'0', N'/platform/log4j/iframe.html', N'f85f516c0b86439087d48a45173ba0e7', N'Log4j', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'77823e12391a47729a1f82a00bc15c5b', N'0', null, N'准备更新', null, null, null, N'0', N'/wx/keyword/edit', N'8f53706d4af541588bde334d99d44727', N'自动回复', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'78c6026c6af44b41a6bef4cdb4cfb414', N'0', null, N'获取角色功能', null, null, null, N'0', N'/platform/role/getOperator', N'8a40c0353fa828a6013fa898d4ac0024', N'角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'79039a2260da46b0aabb5a62e8db6c87', N'0', null, N'查看', null, null, null, N'0', N'/platform/user/view', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'7ae62737df444d619f8fd376360d160c', N'0', null, N'默认列表', null, null, null, N'0', N'/platform/role', N'8a40c0353fa828a6013fa898d4ac0024', N'角色', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'7b4281dd247c4624bee0d8f84c2c2715', N'0', null, N'保存', null, null, null, N'0', N'/platform/systems/save', N'8a40c0353fa828a6013fa898d4ac0026', N'系统', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'7bd7ca42560140ee8573b2ade6388f3e', N'0', null, N'用户分组选择', null, null, null, N'0', N'/platform/userGroup/select', N'f7fbc8e3ee59405dabe02e18d562abf4', N'用户分组', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'7cc12b5c154a4a9782c518c57e8ab3aa', N'0', null, N'准备更新', null, null, null, N'0', N'/platform/role/edit', N'8a40c0353fa828a6013fa898d4ac0024', N'角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'7eab5f800bab4efb8df1b2e8a0575f73', N'0', null, N'默认列表', null, null, null, N'0', N'/platform/systems', N'8a40c0353fa828a6013fa898d4ac0026', N'系统', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'7ed5eefbbf3d4aa78d0c5b99f3b7010c', N'0', null, N'登陆验证', null, null, null, N'0', N'/platform/login/vali', N'8a40c0353fa828a6013fa898d4ac0021', N'登陆', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'827a7067a28d442da3ddd834677127af', N'0', null, N'国际化编辑', null, null, null, N'0', N'/platform/menu/edit', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'8329f58a0eed44e195dec78bddc591b5', N'0', null, N'上传', null, null, null, N'0', N'/platform/upload', N'8d7a260e02674bd3873656deb716202e', N'上传文件', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'83ef85fd17804bb195d0ad3c07f88c30', N'0', null, N'准备更新', null, null, null, N'0', N'/platform/operator/edit', N'8a40c0353fa828a6013fa898d4ac0027', N'功能', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'88298fbd650d49f492e268816feffd15', N'0', null, N'验证邮箱是否存在', null, null, null, N'0', N'/platform/login/valiMailBox', N'8a40c0353fa828a6013fa898d4ac0021', N'登陆', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'886bd497064b4c9f87d8461ebba421d1', N'0', null, N'首页', null, null, null, N'0', N'/platform/index', N'8a40c0353fa828a6013fa898d4ac0021', N'登陆', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'8897dbe85b3e4e6989d662495272cf26', N'0', null, N'Iframe', null, null, null, N'0', N'/platform/dict/treeTableIframe.html', N'8a40c0353fa828a6013fa898d4ac0022', N'字典', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'8b1c1c86385642f2b6c97930b44bbbcf', N'0', null, N'单选', null, null, null, N'0', N'/platform/param/radio.html', N'ffeeb72e053a4a86a4fe242642877a44', N'参数管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'8bd9c0e14df941cdaf6253cd08dbd9cd', N'0', null, N'准备更新', null, null, null, N'0', N'/platform/systems/edit', N'8a40c0353fa828a6013fa898d4ac0026', N'系统', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'8ca8af501522439d8c9249e00db5d78d', N'0', null, N'查看', null, null, null, N'0', N'/platform/sysLog/view', N'8a40c0353fa828a6013fa898d4ac0029', N'日志', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'8f79857b31d4475a94c712e997e89c99', N'0', null, N'更新', null, null, null, N'0', N'/platform/dict/update', N'8a40c0353fa828a6013fa898d4ac0022', N'字典', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'90c3cee940ea4211a714f5111d24ff5d', N'0', null, N'treeData', null, null, null, N'0', N'/platform/param/treeData', N'ffeeb72e053a4a86a4fe242642877a44', N'参数管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'910955c2192a418995eeab8bf15372e9', N'0', null, N'准备添加', null, null, null, N'0', N'/platform/operator/add.html', N'8a40c0353fa828a6013fa898d4ac0027', N'功能', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'91baed789bc14efdbebb10b49c69ee5b', N'0', null, N'默认主页列表', null, null, null, N'0', N'/platform/user', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'9750ea3ee4474711b9acbda8d5b87ee7', N'0', null, N'删除', null, null, null, N'0', N'/platform/groupRole/delRole', N'625e895224aa424693149208c9d4073e', N'分组角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'9765e6bb76eb40ab800cb8954822190e', N'0', null, N'删除', null, null, null, N'0', N'/wx/keyword/delete', N'8f53706d4af541588bde334d99d44727', N'自动回复', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'9a708f39e123455e84b6125774bab1ea', N'0', null, N'treeData', null, null, null, N'0', N'/platform/module/treeData', N'8a40c0353fa828a6013fa898d4ac0033', N'模块', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'9adcc4c40e3148988e5003aaedbb4948', N'0', null, N'treeTableIframe', null, null, null, N'0', N'/platform/param/treeTableIframe.html', N'ffeeb72e053a4a86a4fe242642877a44', N'参数管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'9c0ae757fc564f27860b975e5792ae6a', N'0', null, N'log4jhtml', null, null, null, N'0', N'/platform/log4j/log4j.html', N'f85f516c0b86439087d48a45173ba0e7', N'Log4j', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'9f75b47bdc0249e2b493c47384785a72', N'0', null, N'保存', null, null, null, N'0', N'/platform/menu/save', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'a0c01a5248cd4bf38e57945dbb2b98c5', N'0', null, N'更新', null, null, null, N'0', N'/platform/group/update', N'8a40c0353fa828a6013fa898d4ac0023', N'分组', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'a0d2897ee9194378819e78538189faa0', N'0', null, N'列表', null, null, null, N'0', N'/platform/stationOperator', N'33a6f5664a194da8bc2394826cc25bc3', N'岗位功能', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'a1ff68acf9b24c34b347ff21e333cb70', N'0', null, N'设置菜单功能', null, null, null, N'0', N'/platform/menu/setOperator', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'a2727f19f7cd4a038dd1a94f042a8cf1', N'0', null, N'博客保存', null, null, null, N'0', N'/test/blog/save', N'7cbeac9418c946a2bda0c6aabf23c276', N'博客', N'0', N'1', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'a498a20dd4824b8fb103202360669de4', N'0', null, N'菜单功能设置', null, null, null, N'0', N'/platform/menu/set', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'a5289b2638d845fbb06dedbcdd517f97', N'0', null, N'删除', null, null, null, N'0', N'/platform/group/delete', N'8a40c0353fa828a6013fa898d4ac0023', N'分组', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'a6623c65480f4f2cb63a4d7673f81e3a', N'0', null, N'treeData', null, null, null, N'0', N'/platform/menu/treeData', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'aa126932641f4e068ed8278a332de85d', N'0', null, N'默认主页', null, null, null, N'0', N'/platform/index/content', N'8a40c0353fa828a6013fa898d4ac0021', N'登陆', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'acbceb432b5849aca9e9b284240281ec', N'0', null, N'分组角色下拉选择', null, null, null, N'0', N'/platform/role/select', N'8a40c0353fa828a6013fa898d4ac0024', N'角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'ad09a1b897744812875c752c2d70f11a', N'0', null, N'默认树', null, null, null, N'0', N'/platform/dept', N'8a40c0353fa828a6013fa898d4ac0028', N'部门', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'ad51a6ca95c646ce9c03778eda715734', N'0', null, N'保存', null, null, null, N'0', N'/platform/operator/save', N'8a40c0353fa828a6013fa898d4ac0027', N'功能', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'b13b002e2fad4e95bbe0e4dbc9fbdfe1', N'0', null, N'保存', null, null, null, N'0', N'/platform/module/save', N'8a40c0353fa828a6013fa898d4ac0033', N'模块', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'b23b17d4c83242e8a1a8ee8cfcde9907', N'0', null, N'查看', null, null, null, N'0', N'/platform/operator/view', N'8a40c0353fa828a6013fa898d4ac0027', N'功能', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'b4ee4ae4391f4243be69e838545d2131', N'0', null, N'treeData', null, null, null, N'0', N'/platform/dept/treeData', N'8a40c0353fa828a6013fa898d4ac0028', N'部门', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'b8218945b8e743f29651569950014511', N'0', null, N'单选', null, null, null, N'0', N'/platform/department/radio.html', N'8a40c0353fa828a6013fa898d4ac0028', N'部门', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'b82d86fb7b64498a9c2b8b9a99b3fbeb', N'0', null, N'删除', null, null, null, N'0', N'/platform/menu/delete', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'b8339f29d8d84a4ead6454295f87b79c', N'0', null, N'人员分组设置', null, null, null, N'0', N'/platform/group/select', N'8a40c0353fa828a6013fa898d4ac0023', N'分组', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'bc2c865be6af42cf861294d446fb1c6f', N'0', null, N'单选', null, null, null, N'0', N'/platform/user/radio.html', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'c04adcd019e04cf3ba7c66af721a18dc', N'0', null, N'删除', null, null, null, N'0', N'/platform/user/delete', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'c05642442e0a468ebe4f0b7771a803ae', N'0', null, N'更新', null, null, null, N'0', N'/platform/systems/update', N'8a40c0353fa828a6013fa898d4ac0026', N'系统', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'c081c50918f4459f8e36ab8cb4151a61', N'0', null, N'准备岗位功能设置', null, null, null, N'0', N'/platform/station/operatorTree.html', N'8a40c0353fa828a6013fa898d4ac0025', N'岗位', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'c0ccfcd127c347a8b9db140e5aa62188', N'0', null, N'准备添加', null, null, null, N'0', N'/platform/role/add.html', N'8a40c0353fa828a6013fa898d4ac0024', N'角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'c1e991d1f56749298c18ff69d7777e0b', N'0', null, N'删除', null, null, null, N'0', N'/platform/module/delete', N'8a40c0353fa828a6013fa898d4ac0033', N'模块', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'c29ea4cbd9044bc786e9f4584ad840ff', N'0', null, N'获取岗位功能', null, null, null, N'0', N'/platform/station/getOperator', N'8a40c0353fa828a6013fa898d4ac0025', N'岗位', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'c7132250f5054b808bb119122a6ecb52', N'0', null, N'设置岗位功能', null, null, null, N'0', N'/platform/station/setOperator', N'8a40c0353fa828a6013fa898d4ac0025', N'岗位', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'c9d013d14cbd4f148fb4562c91803ee8', N'0', null, N'准备更新', null, null, null, N'0', N'/platform/group/edit', N'8a40c0353fa828a6013fa898d4ac0023', N'分组', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'ca0f6da01ada419eaa7739d9790e5b88', N'0', null, N'准备角色功能设置', null, null, null, N'0', N'/platform/role/operatorTree.html', N'8a40c0353fa828a6013fa898d4ac0024', N'角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'cc6bcbee40ab43b2bd5aff6d9385e1fc', N'0', null, N'删除', null, null, null, N'0', N'/platform/operator/delete', N'8a40c0353fa828a6013fa898d4ac0027', N'功能', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'cc88acee3a664c58861a872c351385e6', N'0', null, N'选择', null, null, null, N'0', N'/platform/groupRole/select', N'625e895224aa424693149208c9d4073e', N'分组角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'ccf9b69e151840a28be75d8443b70273', N'0', null, N'更新', null, null, null, N'0', N'/platform/param/update', N'ffeeb72e053a4a86a4fe242642877a44', N'参数管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'cf26c1d2baa24a8791b3d264154b80d4', N'0', null, N'默认树', null, null, null, N'0', N'/platform/menu', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'd115d08591ef4c0eaebef15f8294b287', N'0', null, N'准备设置部门负责人', null, null, null, N'0', N'/platform/department/userTree.html', N'8a40c0353fa828a6013fa898d4ac0028', N'部门', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'd247fb45be724ed2a2bb5c92d73bf6cf', N'0', null, N'设置用户的组', null, null, null, N'0', N'/platform/user/setGroup', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'd479dbdc901f4d85a207b9bace6465ac', N'0', null, N'更新', null, null, null, N'0', N'/platform/user/update', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'd496b161d2564111992687b948862244', N'0', null, N'iframe', null, null, null, N'0', N'/platform/druid/iframe.html', N'297e0cf944e9762e0144e97dfd6e00c9', N'数据源', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'd5c8bdf7a49a4e46b776c05dc9ead484', N'0', null, N'treeData', null, null, null, N'0', N'/platform/dict/treeData', N'8a40c0353fa828a6013fa898d4ac0022', N'字典', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'd646da8707ae41838fd2ec9bf0d467ee', N'0', null, N'设置角色功能', null, null, null, N'0', N'/platform/role/setOperator', N'8a40c0353fa828a6013fa898d4ac0024', N'角色', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'da6077ec1f354a409d0385b2c063e044', N'0', null, N'添加功能', null, null, null, N'0', N'/platform/roleOperator/add', N'c4ab6b8d50434ddf8fa0ec106fcfc6ea', N'角色功能', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'dc750e57b54f4baca78d66969321ee51', N'0', null, N'更新', null, null, null, N'0', N'/platform/station/update', N'8a40c0353fa828a6013fa898d4ac0025', N'岗位', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'df0aa534655242e4a0bcd638b51a4e03', N'0', null, N'更新', null, null, null, N'0', N'/platform/menu/update', N'8a40c0353fa828a6013fa898d4ac0032', N'菜单', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'dfc7af0979a54e8e9a3f18b7a5d66030', N'0', null, N'查看', null, null, null, N'0', N'/wx/keyword/view', N'8f53706d4af541588bde334d99d44727', N'自动回复', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'dfe9d74fe0ef4220bfcfe6d7bb2f9436', N'0', null, N'默认用户列表', null, null, null, N'0', N'/wx/user', N'c4e63c4171db4ae2a83f7dfcc2656b0e', N'用户管理', N'1', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'e037e0bae9a94e549d6b647db49a64a1', N'0', null, N'角色设置', null, null, null, N'0', N'/platform/group/setRole', N'8a40c0353fa828a6013fa898d4ac0023', N'分组', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'e1ac811d2a16495d927f994dd006e824', N'0', null, N'删除', null, null, null, N'0', N'/platform/param/delete', N'ffeeb72e053a4a86a4fe242642877a44', N'参数管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'e2cead0f68ac4a2d98765264578a9f83', N'0', null, N'删除', null, null, null, N'0', N'/platform/userGroup/delGroup', N'f7fbc8e3ee59405dabe02e18d562abf4', N'用户分组', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'e4f182b4009e48a58673134324b2ec56', N'0', null, N'资源负载', null, null, null, N'0', N'/platform/resources', N'c9cbb508c11b4b10aeac87a4f3ebc340', N'资源负载', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'e754dfdb794d4e7db6023c9b089a340c', N'0', null, N'多选', null, null, null, N'0', N'/platform/user/checkbox.html', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'ee27f5c23b6d4217b3b66295a3506a40', N'0', null, N'删除功能', null, null, null, N'0', N'/platform/roleOperator/del', N'c4ab6b8d50434ddf8fa0ec106fcfc6ea', N'角色功能', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'f1f6f2c8f026498c8ee64b7a918d06df', N'0', null, N'准备更新', null, null, null, N'0', N'/platform/user/edit', N'8a40c0353fa828a6013fa898d4ac0030', N'用户', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'f604f021cba44b6fb96115265e557521', N'0', null, N'添加', null, null, null, N'0', N'/platform/stationOperator/add', N'33a6f5664a194da8bc2394826cc25bc3', N'岗位功能', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'f771691134c34174a819b5990310d000', N'0', null, N'首页', null, null, null, N'0', N'/platform/', N'8a40c0353fa828a6013fa898d4ac0021', N'登陆', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'f771691134c34174a819b5990310da56', N'0', null, N'注销', null, null, null, N'0', N'/platform/login/logout', N'8a40c0353fa828a6013fa898d4ac0021', N'登陆', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'f82c021dc443419fb2469032af73bf3e', N'0', null, N'删除', null, null, null, N'0', N'/platform/dept/delete', N'8a40c0353fa828a6013fa898d4ac0028', N'部门', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'fb487ba403254ce8843b39a768422f04', N'0', null, N'保存', null, null, null, N'0', N'/platform/param/save', N'ffeeb72e053a4a86a4fe242642877a44', N'参数管理', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'fb6a0c1e618041bcbbf8cfd41311b1fa', N'0', null, N'准备登陆', null, null, null, N'0', N'/platform/login', N'8a40c0353fa828a6013fa898d4ac0021', N'登陆', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'fd9978df5c5a47f298e2d28e21e70b15', N'0', null, N'删除', null, null, null, N'0', N'/platform/sysLog/delete', N'8a40c0353fa828a6013fa898d4ac0029', N'日志', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'fdaeeb41691d460b8f142066d1f79927', N'0', null, N'博客删除', null, null, null, N'0', N'/test/blog/delete', N'7cbeac9418c946a2bda0c6aabf23c276', N'博客', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO
INSERT INTO [dbo].[pt_operator] ([ids], [version], [description], [names], [onemany], [returnparamkeys], [returnurl], [rowfilter], [url], [moduleids], [modulenames], [splitpage], [formtoken], [ipblack], [privilegess], [ispv], [pvtype], [csrf], [referer], [method], [syslog], [enctype]) VALUES (N'ff91363b32424fa399e44cc0dfd688e9', N'0', null, N'博客查看', null, null, null, N'0', N'/test/blog/view', N'7cbeac9418c946a2bda0c6aabf23c276', N'博客', N'0', N'0', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'1', N'0');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_param]
-- ----------------------------
DROP TABLE [dbo].[pt_param]
GO
CREATE TABLE [dbo].[pt_param] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[description] varchar(200) NULL ,
[images] varchar(50) NULL ,
[names] varchar(25) NULL ,
[orderids] bigint NULL ,
[paths] varchar(1000) NULL ,
[zhuangtai] char(1) NULL ,
[parentids] varchar(32) NULL ,
[isparent] varchar(5) NULL ,
[levels] bigint NULL ,
[numbers] varchar(50) NULL ,
[val] varchar(500) NULL ,
[i18n] char(1) NULL ,
[val_zhcn] varchar(500) NULL ,
[val_zhhk] varchar(500) NULL ,
[val_zhtw] varchar(500) NULL ,
[val_ja] varchar(500) NULL ,
[val_enus] varchar(500) NULL ,
[status] char(1) NULL 
)


GO

-- ----------------------------
-- Records of pt_param
-- ----------------------------
INSERT INTO [dbo].[pt_param] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'0c78f87750a745bbb59005a6ca0f744a', N'1', null, N'3.png', N'weixinToken', N'3', N'100103root/83f4b0ee56904cbeb5f91696ad804c29/0c78f87750a745bbb59005a6ca0f744a', null, N'83f4b0ee56904cbeb5f91696ad804c29', N'false', N'2', N'weixinToken', N'weixinchat', N'0', N'weixinchat', N'weixinchat', N'weixinchat', N'weixinchat', N'weixinchat', N'1');
GO
INSERT INTO [dbo].[pt_param] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'7381008292054bccba20224bc33774d7', N'7', null, N'2.png', N'weixinAppID', N'1', N'100103root/83f4b0ee56904cbeb5f91696ad804c29/7381008292054bccba20224bc33774d7', null, N'83f4b0ee56904cbeb5f91696ad804c29', N'false', N'2', N'weixinAppID', N'123', N'0', N'1234', N'1234', N'1234', N'1234', N'1234', N'1');
GO
INSERT INTO [dbo].[pt_param] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'8094c60d7a594b36bb0187cbce9c4188', N'0', null, N'2.png', N'weixinAppSecret', N'2', N'100103root/83f4b0ee56904cbeb5f91696ad804c29/8094c60d7a594b36bb0187cbce9c4188', null, N'83f4b0ee56904cbeb5f91696ad804c29', N'false', N'2', N'weixinAppSecret', N'123', N'0', null, null, null, null, null, N'1');
GO
INSERT INTO [dbo].[pt_param] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'83f4b0ee56904cbeb5f91696ad804c29', N'0', null, N'2.png', N'微信配置', N'1', N'100103root/83f4b0ee56904cbeb5f91696ad804c29', null, N'8a40c0353fa828a6013fa898d4ac0020', N'true', N'1', N'weixinConfig', null, N'0', null, null, null, null, null, N'1');
GO
INSERT INTO [dbo].[pt_param] ([ids], [version], [description], [images], [names], [orderids], [paths], [zhuangtai], [parentids], [isparent], [levels], [numbers], [val], [i18n], [val_zhcn], [val_zhhk], [val_zhtw], [val_ja], [val_enus], [status]) VALUES (N'8a40c0353fa828a6013fa898d4ac0020', N'0', N'参数树', N'1_open.png', N'参数树', N'1', N'100103root', N'1', null, N'true', N'0', null, null, N'0', null, null, null, null, null, N'1');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_resources]
-- ----------------------------
DROP TABLE [dbo].[pt_resources]
GO
CREATE TABLE [dbo].[pt_resources] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[osname] varchar(200) NULL ,
[ips] varchar(50) NULL ,
[hostname] varchar(200) NULL ,
[cpunumber] bigint NULL ,
[cpuratio] decimal(20,10) NULL ,
[phymemory] bigint NULL ,
[phyfreememory] bigint NULL ,
[jvmtotalmemory] bigint NULL ,
[jvmfreememory] bigint NULL ,
[jvmmaxmemory] bigint NULL ,
[gccount] bigint NULL ,
[createdate] datetime NULL 
)


GO

-- ----------------------------
-- Records of pt_resources
-- ----------------------------

-- ----------------------------
-- Table structure for [dbo].[pt_role]
-- ----------------------------
DROP TABLE [dbo].[pt_role]
GO
CREATE TABLE [dbo].[pt_role] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[numbers] varchar(50) NULL ,
[names] varchar(50) NULL ,
[description] varchar(2000) NULL ,
[operatorids] text NULL ,
[moduleids] text NULL 
)


GO

-- ----------------------------
-- Records of pt_role
-- ----------------------------
INSERT INTO [dbo].[pt_role] ([ids], [version], [numbers], [names], [description], [operatorids], [moduleids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0023', N'2', N'SuperAdmin', N'超级管理员', N'超级管理员', N'operator_8f9ab71d526c45359c4476f957987e6d,operator_37218fb52ec94fb4bf76209a17916094,operator_c1e991d1f56749298c18ff69d7777e0b,operator_b13b002e2fad4e95bbe0e4dbc9fbdfe1,operator_9a708f39e123455e84b6125774bab1ea,operator_437e05d09dd94720b67c4f230cdebe58,operator_0fb7938c7d614fc389568eb67b442303,operator_91baed789bc14efdbebb10b49c69ee5b,operator_c04adcd019e04cf3ba7c66af721a18dc,operator_f1f6f2c8f026498c8ee64b7a918d06df,operator_5fcac107c80d493d91b53a815d4b297a,operator_d247fb45be724ed2a2bb5c92d73bf6cf,operator_4376888fd74f4247a926529e5da03442,operator_d479dbdc901f4d85a207b9bace6465ac,operator_79039a2260da46b0aabb5a62e8db6c87,operator_1a8b4d8e4411412fa8bb561393563a85,operator_e754dfdb794d4e7db6023c9b089a340c,operator_48db51f20b504c4ab489b1dcfd3ecbd9,operator_bc2c865be6af42cf861294d446fb1c6f,operator_cf26c1d2baa24a8791b3d264154b80d4,operator_b82d86fb7b64498a9c2b8b9a99b3fbeb,operator_10499bc7f9cb4adf99beba00343b4ea6,operator_9f75b47bdc0249e2b493c47384785a72,operator_a1ff68acf9b24c34b347ff21e333cb70,operator_a6623c65480f4f2cb63a4d7673f81e3a,operator_df0aa534655242e4a0bcd638b51a4e03,operator_4a6544ae7a2548ad81c0e3994999023c,operator_f771691134c34174a819b5990310d000,operator_886bd497064b4c9f87d8461ebba421d1,operator_aa126932641f4e068ed8278a332de85d,operator_fb6a0c1e618041bcbbf8cfd41311b1fa,operator_f771691134c34174a819b5990310da56,operator_7ed5eefbbf3d4aa78d0c5b99f3b7010c,operator_1b0d7476974e4bf9b52f75fb82f87330,operator_a5289b2638d845fbb06dedbcdd517f97,operator_c9d013d14cbd4f148fb4562c91803ee8,operator_22926eb196a14b48be775f4880b5ba94,operator_b8339f29d8d84a4ead6454295f87b79c,operator_e037e0bae9a94e549d6b647db49a64a1,operator_a0c01a5248cd4bf38e57945dbb2b98c5,operator_3ee5f986289d4a1990f4e42c9a0caadb,operator_d496b161d2564111992687b948862244,operator_4df80521e66447618796c3cfe02bf239,operator_6569e0d9f2cd4e3a97af4e1b0cd8d2f7,operator_f16cadd8f81e4bef926e09f718db8fe2,operator_091855dd809b418fae88a7fec6d9f246,operator_01aa0c85c8b84ae8aca7f5484336b203,operator_d5c8bdf7a49a4e46b776c05dc9ead484,operator_2be34991827e4e8da8e92f9b9e8bce25,operator_8f79857b31d4475a94c712e997e89c99,operator_12141c1c3be241ca8a868bce9cd610d5,operator_21b0a910ef6e4c60a325d5e57e6e6f65,operator_d1e14e0b7f69478394850d2238214692,operator_74aa20442105408d90f9e6469a3a92b5,operator_8897dbe85b3e4e6989d662495272cf26,operator_7ae62737df444d619f8fd376360d160c,operator_335d1f8f46eb47a18001889f8cc21348,operator_7cc12b5c154a4a9782c518c57e8ab3aa,operator_78c6026c6af44b41a6bef4cdb4cfb414,operator_15566e63f3104c73b4a0b4a784dd11ca,operator_acbceb432b5849aca9e9b284240281ec,operator_d646da8707ae41838fd2ec9bf0d467ee,operator_29c18b3394924c30882da049da14ad99,operator_c0ccfcd127c347a8b9db140e5aa62188,operator_ca0f6da01ada419eaa7739d9790e5b88,operator_233356b63d8e477fb6e948b703232809,operator_362cf247241c4d12b6242301e4a73516,operator_c29ea4cbd9044bc786e9f4584ad840ff,operator_2fbbc9cfb0bf4b5bb504ead155c3423c,operator_c7132250f5054b808bb119122a6ecb52,operator_09b6ce29313c4051ba765de516a9b283,operator_dc750e57b54f4baca78d66969321ee51,operator_21141da4febe4c929abe37126b37fd12,operator_c081c50918f4459f8e36ab8cb4151a61,operator_2fee901117c64e18873f60e8f800713d,operator_7eab5f800bab4efb8df1b2e8a0575f73,operator_32a3e59964204a3c8848e84b864306ae,operator_8bd9c0e14df941cdaf6253cd08dbd9cd,operator_7b4281dd247c4624bee0d8f84c2c2715,operator_c05642442e0a468ebe4f0b7771a803ae,operator_5b249ad344d948b99f58768c323f5f71,operator_0da15c49299d41a4b720f787d053e3cb,operator_cc6bcbee40ab43b2bd5aff6d9385e1fc,operator_83ef85fd17804bb195d0ad3c07f88c30,operator_ad51a6ca95c646ce9c03778eda715734,operator_6daed51284f94923b1c8a6414e646959,operator_1b1a809815574b2a9c1d0e18d692de17,operator_b23b17d4c83242e8a1a8ee8cfcde9907,operator_910955c2192a418995eeab8bf15372e9,operator_ad09a1b897744812875c752c2d70f11a,operator_f82c021dc443419fb2469032af73bf3e,operator_053d330462e1459ca1012c9d29113bc4,operator_58a85040aa9f40cca0bdba6e23e30363,operator_b4ee4ae4391f4243be69e838545d2131,operator_1046389d8525451697f2793185e7d6ee,operator_46e00ef0fd234e9dbf68ed9bbb437d0f,operator_b8218945b8e743f29651569950014511,operator_d115d08591ef4c0eaebef15f8294b287,operator_235d855d7b914d728e434f0f309aa04d,operator_fd9978df5c5a47f298e2d28e21e70b15,operator_8ca8af501522439d8c9249e00db5d78d,operator_dfe9d74fe0ef4220bfcfe6d7bb2f9436,operator_2c91467f905a4f5ba9f52830131c8ad9,operator_481d4d5c0a634c4085c72c990260e58d,operator_420d8ebc68ad44dc8188d4c27dc585d1,operator_5148ea207b974ee197f0bc57060ab1ad,operator_0773a58c4bdb4858ab062c4a2a4da69a,operator_9765e6bb76eb40ab800cb8954822190e,operator_77823e12391a47729a1f82a00bc15c5b,operator_05114c0cbe1f4c2095b3216f13cfb681,operator_6b527ed138c343a89ddf73cf16fef565,operator_dfc7af0979a54e8e9a3f18b7a5d66030,operator_3dd486cd58da467dbd83ae420db14815,operator_36d3b89e378b451ca89d1a41a3c53e10,operator_99a42a467bbf4e829fd0706507c9f7a7,operator_2b7f6e28f9a74854b7399e8740b765fd,operator_d1b453799d62485b82e027b96b596ccd,operator_37a9a6966448469f9d9abe2e8aeb1b9e,operator_3b1e7c5d5e0e461c90e1f0032f679a25,operator_afe893c6be744c4f98187b084ac832e7,operator_f57388d139034099932c36a955df625a,operator_f7c220a81ba843938f8ccb108bec9c03,operator_4a05ffcfe351476391a036937eaf733f,operator_beeaa7f4b2444430a6732ecc83c453a2,operator_6131942dd2644790b80df13c14fb3ae8,operator_b352e4246e754a9691bcc9011f445665,operator_5982350f7d0e4b2ca72de64300d75223,operator_dad107c1aeb0419b8004d57f9d70223e,operator_91f78713c3084b6e9b7419e2a97c7dac,operator_3b6a8f61e20e4bf2943421af2119e9b9,operator_9ee4ee562eaa475a95f45d3daeb0220a,operator_06244cf3520c49e8a45cbde82a53fa5e,operator_666f50e0f3b04f4ba43bcb4e719c1e8d,operator_45cf6e8f9c254e509399deda080f0e20,operator_dfa8256651a84269869c35ca1f10cae5,operator_1553d9a97a4b4063a46f4be41e7adedd,operator_86a502729bda46f0b607c2b4c6531bd3,operator_15495beebe984cd19dc30d65676c4c4d,operator_38f3871f789c4936b37d17ea4823da58,operator_b3af8fb65a00418c966b8f2a5ac97400,operator_4f7a5bd18e1e4ed3849a94c48c14c5a1,operator_5c15cf5c3761419a9029e4e094c8f53c,operator_271a4ae9860341e6a30602070268e1e4,operator_bcf8cf5ad0734dc785cba716ab437c93,operator_3bfc62720fef4706b22c78d69d27a275,operator_ee781545af7144a18f30b5492ee49fc8,operator_fe0be0443cba4a5993b6d5f91eae8e89,operator_4c501cf7b83f4b058a05be15127c8edb,', N'module_8a40c0353fa828a6013fa898d4ac0033,module_8a40c0353fa828a6013fa898d4ac0030,module_8a40c0353fa828a6013fa898d4ac0031,module_8a40c0353fa828a6013fa898d4ac0021,module_8a40c0353fa828a6013fa898d4ac0023,module_297e0cf944e9762e0144e97dfd6e00c9,module_8a40c0353fa828a6013fa898d4ac0024,module_8a40c0353fa828a6013fa898d4ac0025,module_8a40c0353fa828a6013fa898d4ac0026,module_8a40c0353fa828a6013fa898d4ac0027,module_8a40c0353fa828a6013fa898d4ac0028,module_8a40c0353fa828a6013fa898d4ac0029,module_8a40c0353fa828a6013fa898d4ac1100,module_c4e63c4171db4ae2a83f7dfcc2656b0e,module_e6eb0165223447218410f867a9614300,module_417ed3d3cf4d4b7a939613829e8db17d,module_7a35846a305c42abb68601b4f7347289,module_c87c35097a2d4bc898fe6e9b1e280a3d,module_8f53706d4af541588bde334d99d44727,module_8a40c0353fa828a6013fa898d4ac2200,module_3bf4c1829bf447979865fc4d2ab75801,module_4090cac06e15459789bc5154eef67e4e,module_3dec44186175424cbee2d05ffbb690dd,module_8a1b51bb6fae4fac8591f4f387d250ff,module_3e048ee263c344318e9c4995a5cd35e0,module_e86e5bc9ae5d44e78a48543cf348ca82,');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_roleOperator]
-- ----------------------------
DROP TABLE [dbo].[pt_roleOperator]
GO
CREATE TABLE [dbo].[pt_roleOperator] (
[ids] varchar(32) NOT NULL ,
[roleIds] varchar(32) NULL ,
[operatorIds] varchar(32) NULL 
)


GO

-- ----------------------------
-- Records of pt_roleOperator
-- ----------------------------
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'021a2c6466994f258c57659b45026593', N'8a40c0353fa828a6013fa898d4ac0023', N'3e4e9e72dab243d38a1785d157c24cb6');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'03f99ab1f9104620b619fec5eaed0480', N'8a40c0353fa828a6013fa898d4ac0023', N'e037e0bae9a94e549d6b647db49a64a1');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'053476ee46c44552beac3c3ef14fa037', N'8a40c0353fa828a6013fa898d4ac0023', N'6daed51284f94923b1c8a6414e646959');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'064f21920eeb481c86ae50879cd09d34', N'8a40c0353fa828a6013fa898d4ac0023', N'a0c01a5248cd4bf38e57945dbb2b98c5');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'07e6c367e68a437e87126b3345b7ff44', N'8a40c0353fa828a6013fa898d4ac0023', N'a2727f19f7cd4a038dd1a94f042a8cf1');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'0814045ac9ec4230a0b391e425a59540', N'8a40c0353fa828a6013fa898d4ac0023', N'79039a2260da46b0aabb5a62e8db6c87');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'09c97f5c18ac4b40bfb2d514d69b22b7', N'8a40c0353fa828a6013fa898d4ac0023', N'7b4281dd247c4624bee0d8f84c2c2715');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'0a08705ce1dd44c8b64ffb4af78d57d4', N'8a40c0353fa828a6013fa898d4ac0023', N'b4ee4ae4391f4243be69e838545d2131');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'0a1c22befe984c6cbbb49ca98c85ca08', N'8a40c0353fa828a6013fa898d4ac0023', N'483bdacba04f4663986e6339166e8321');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'0bdcecb579304334a80dd169197bc7f1', N'8a40c0353fa828a6013fa898d4ac0023', N'827a7067a28d442da3ddd834677127af');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'0cfbb583544d43c7aca70f991ad0f746', N'8a40c0353fa828a6013fa898d4ac0023', N'7eab5f800bab4efb8df1b2e8a0575f73');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'0d57b3a3c5264e1e997b18183074d535', N'8a40c0353fa828a6013fa898d4ac0023', N'a6623c65480f4f2cb63a4d7673f81e3a');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'0dfd8909022e48caa30a3bb9f7e48f1e', N'8a40c0353fa828a6013fa898d4ac0023', N'12141c1c3be241ca8a868bce9cd610d5');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'0e5432e4c8834200a58fd13a118cd0ce', N'8a40c0353fa828a6013fa898d4ac0023', N'2c91467f905a4f5ba9f52830131c8ad9');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'0f58a58a34984332af791d1767b7ab0a', N'8a40c0353fa828a6013fa898d4ac0023', N'8ca8af501522439d8c9249e00db5d78d');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'0f9c37f0970d4f3981ddbef662f0f861', N'8a40c0353fa828a6013fa898d4ac0023', N'1b1a809815574b2a9c1d0e18d692de17');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'121ba805f7514e64bb415ffc9bf61180', N'8a40c0353fa828a6013fa898d4ac0023', N'5c2bdc059ae24ffda2758a2781bb46da');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'129675d8bb95482aaca4b3ef673a4c0a', N'8a40c0353fa828a6013fa898d4ac0023', N'77823e12391a47729a1f82a00bc15c5b');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'12a9ee5e7eca44c5ba6e79dedfbc4049', N'8a40c0353fa828a6013fa898d4ac0023', N'2c2063e17dc742a3b9c330b84c5dfa6a');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'1322a73d36824bf9bcde729eba789e84', N'8a40c0353fa828a6013fa898d4ac0023', N'7ae62737df444d619f8fd376360d160c');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'139064e3c70c4e00babba49593146b1a', N'8a40c0353fa828a6013fa898d4ac0023', N'1b0d7476974e4bf9b52f75fb82f87330');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'1491b0d0f9fb406e92f1a990fb8268fe', N'8a40c0353fa828a6013fa898d4ac0023', N'dfe9d74fe0ef4220bfcfe6d7bb2f9436');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'16e9ecd28cc842048a16f8304f3fd571', N'8a40c0353fa828a6013fa898d4ac0023', N'18f50e0f48ef4dd9bec85f5612ab10c0');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'1a0b60e808e145989a031277b83efae6', N'8a40c0353fa828a6013fa898d4ac0023', N'8329f58a0eed44e195dec78bddc591b5');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'1c26cfb2d7d94ad38ce0c553644f9ddd', N'8a40c0353fa828a6013fa898d4ac0023', N'091855dd809b418fae88a7fec6d9f246');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'1cd441db6daf407492d9b32a597232b1', N'8a40c0353fa828a6013fa898d4ac0023', N'08a96d5dd37f49459eeb02eebeb0a78c');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'1d18394cb6ed4f71b60c2eb3f8b511d9', N'8a40c0353fa828a6013fa898d4ac0023', N'8897dbe85b3e4e6989d662495272cf26');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'1f5bd29eabd84310b935ac26e4865aa8', N'8a40c0353fa828a6013fa898d4ac0023', N'1f05b6496a494f488e4cacd2a449c37a');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'20d039c9d09d427e802607a4d026300b', N'8a40c0353fa828a6013fa898d4ac0023', N'3da96263a14343eaa7b409a93ec9e1db');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'22eb103099d2495f98d1bc4dc449933a', N'8a40c0353fa828a6013fa898d4ac0023', N'f604f021cba44b6fb96115265e557521');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'2336da1b46bb47629cd265869b3f7308', N'8a40c0353fa828a6013fa898d4ac0023', N'0da15c49299d41a4b720f787d053e3cb');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'260a75c9b59644eeb72a3fd8966cf5c9', N'8a40c0353fa828a6013fa898d4ac0023', N'cc88acee3a664c58861a872c351385e6');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'26d880cfc63f48b5ad42fc170d69693e', N'8a40c0353fa828a6013fa898d4ac0023', N'b8218945b8e743f29651569950014511');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'27274973f3e54783ae986912b84d91bc', N'8a40c0353fa828a6013fa898d4ac0023', N'6569e0d9f2cd4e3a97af4e1b0cd8d2f7');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'2897ed0986344de0a790c1c315381a43', N'8a40c0353fa828a6013fa898d4ac0023', N'4a6544ae7a2548ad81c0e3994999023c');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'2a0b60e808e145989a031277b83efae7', N'8a40c0353fa828a6013fa898d4ac0023', N'1329f58a0eed44e195dec78bddc591b6');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'2a0b60e808e145989a031277b83efae8', N'8a40c0353fa828a6013fa898d4ac0023', N'2329f58a0eed44e195dec78bddc591b7');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'2a0b60e808e145989a031277b83efae9', N'8a40c0353fa828a6013fa898d4ac0023', N'3329f58a0eed44e195dec78bddc591b8');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'2b0fc857882b4fd0a068d8ddaf514eab', N'8a40c0353fa828a6013fa898d4ac0023', N'053d330462e1459ca1012c9d29113bc4');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'2bc4654b3cc74eccad6ff320ede62385', N'8a40c0353fa828a6013fa898d4ac0023', N'cc6bcbee40ab43b2bd5aff6d9385e1fc');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'2c2d096b627e4d3681f494e4ef38e6f0', N'8a40c0353fa828a6013fa898d4ac0023', N'b13b002e2fad4e95bbe0e4dbc9fbdfe1');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'2c4b1fd860a4423a8590460f0b438ce0', N'8a40c0353fa828a6013fa898d4ac0023', N'9adcc4c40e3148988e5003aaedbb4948');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'2cbe2ac6fb8949e7be60da86395c5c88', N'8a40c0353fa828a6013fa898d4ac0023', N'd5c8bdf7a49a4e46b776c05dc9ead484');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'2e1c21e46cd24d828de30f883f131f26', N'8a40c0353fa828a6013fa898d4ac0023', N'fdaeeb41691d460b8f142066d1f79927');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'308307140623475bbbd3812288c68a4b', N'8a40c0353fa828a6013fa898d4ac0023', N'01aa0c85c8b84ae8aca7f5484336b203');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'32042be89a574cefaa2697f2d7fee41a', N'8a40c0353fa828a6013fa898d4ac0023', N'9750ea3ee4474711b9acbda8d5b87ee7');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'3601e3cd19e842f4bbf2d438857a7c68', N'8a40c0353fa828a6013fa898d4ac0023', N'29c18b3394924c30882da049da14ad99');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'382c564f5d6e4d11b17b2b729c8d30d0', N'8a40c0353fa828a6013fa898d4ac0023', N'3ee5f986289d4a1990f4e42c9a0caadb');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'38829184b84a44eeb82e00a8db46d3a2', N'8a40c0353fa828a6013fa898d4ac0023', N'4df80521e66447618796c3cfe02bf239');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'3bd650048f764fbf93a427c31a27274c', N'8a40c0353fa828a6013fa898d4ac0023', N'8bd9c0e14df941cdaf6253cd08dbd9cd');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'3c6b00c1db03430cb7e78880e4f283ec', N'8a40c0353fa828a6013fa898d4ac0023', N'ad09a1b897744812875c752c2d70f11a');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'3d6a531acb2a4b199be1bd541f85caf4', N'8a40c0353fa828a6013fa898d4ac0023', N'5b47ae382f42421682852f889c176d49');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'3f60245dacb14844a6968a2884edaf07', N'8a40c0353fa828a6013fa898d4ac0023', N'e2cead0f68ac4a2d98765264578a9f83');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'40707f58daee4d81b19b214c52eeb6a7', N'8a40c0353fa828a6013fa898d4ac0023', N'c29ea4cbd9044bc786e9f4584ad840ff');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'41a43064ffa240ee9e9c84dff0d9e371', N'8a40c0353fa828a6013fa898d4ac0023', N'e1ac811d2a16495d927f994dd006e824');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'41ed858aaaae4fc2bc1f197fe295af52', N'8a40c0353fa828a6013fa898d4ac0023', N'e4f182b4009e48a58673134324b2ec56');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'42fbd1334a0849f6a06db739c11280f1', N'8a40c0353fa828a6013fa898d4ac0023', N'f771691134c34174a819b5990310d000');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'43666165e4dd4cf3901e690613e47a66', N'8a40c0353fa828a6013fa898d4ac0023', N'46b7269a26044dfebb4edd06a2f9cd83');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'461c341a4da84a828fd720559c8116a4', N'8a40c0353fa828a6013fa898d4ac0023', N'09b6ce29313c4051ba765de516a9b283');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'46b9e0e47ad347dcb53e123c466db2a4', N'8a40c0353fa828a6013fa898d4ac0023', N'b82d86fb7b64498a9c2b8b9a99b3fbeb');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'46f79be38d3340a0a752ef2f53ae661a', N'8a40c0353fa828a6013fa898d4ac0023', N'91baed789bc14efdbebb10b49c69ee5b');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'476fd5e99b214541aefd5c81982f624d', N'8a40c0353fa828a6013fa898d4ac0023', N'a498a20dd4824b8fb103202360669de4');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'48db3f1015414972b274fcee382b5283', N'8a40c0353fa828a6013fa898d4ac0023', N'7ed5eefbbf3d4aa78d0c5b99f3b7010c');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'4ce7264311a3437db22445df4b643066', N'8a40c0353fa828a6013fa898d4ac0023', N'30bf01ffe1cb4ed39e92c6600ea39e93');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'4ddf4f2e1b9b495ebadeaef3029fd410', N'8a40c0353fa828a6013fa898d4ac0023', N'235d855d7b914d728e434f0f309aa04d');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'4eae708ad5974a57b0accc638eadac99', N'8a40c0353fa828a6013fa898d4ac0023', N'fb6a0c1e618041bcbbf8cfd41311b1fa');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'521239b354cb482ba643238799d17e43', N'8a40c0353fa828a6013fa898d4ac0023', N'481d4d5c0a634c4085c72c990260e58d');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'535104b0d1d841eda391e58f2427fccc', N'8a40c0353fa828a6013fa898d4ac0023', N'4bebccaa8f0c4bfbaa2ff89f00706100');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'5459dad86a584a598ad51c10fcee1f7c', N'8a40c0353fa828a6013fa898d4ac0023', N'671ce1e6167840baaa6d27f4f04574c9');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'574921333dd64e4b8e4956436a698ec5', N'8a40c0353fa828a6013fa898d4ac0023', N'3085a3b0c20d4f3aaa7c2d27fe986aba');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'598267639b534e7ca95a8248b7e1250a', N'8a40c0353fa828a6013fa898d4ac0023', N'c7132250f5054b808bb119122a6ecb52');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'5d0a48f1e78844cb9ed82c71b720f961', N'8a40c0353fa828a6013fa898d4ac0023', N'aa126932641f4e068ed8278a332de85d');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'5fcb0597c6494021b0cb167161227d75', N'8a40c0353fa828a6013fa898d4ac0023', N'4376888fd74f4247a926529e5da03442');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'612117075c2d47c09df60c7ec316a466', N'8a40c0353fa828a6013fa898d4ac0023', N'437e05d09dd94720b67c4f230cdebe58');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'623d81207a5142638a8ba821dff1dbc3', N'8a40c0353fa828a6013fa898d4ac0023', N'da6077ec1f354a409d0385b2c063e044');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'65bfac49893b406db04811795ff89f50', N'8a40c0353fa828a6013fa898d4ac0023', N'a5289b2638d845fbb06dedbcdd517f97');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'65ee6094c4254096ab682c2699045fbe', N'8a40c0353fa828a6013fa898d4ac0023', N'37218fb52ec94fb4bf76209a17916094');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'6678e6fe003f43cc974fe6843da8688f', N'8a40c0353fa828a6013fa898d4ac0023', N'21b0a910ef6e4c60a325d5e57e6e6f65');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'6779f7b61b354ff88f4b72d6bab43c60', N'8a40c0353fa828a6013fa898d4ac0023', N'22926eb196a14b48be775f4880b5ba94');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'6aff9f7ef6344466a81de2c7eae4526a', N'8a40c0353fa828a6013fa898d4ac0023', N'9765e6bb76eb40ab800cb8954822190e');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'6b79fc49b2ed47e788c17fe41f217881', N'8a40c0353fa828a6013fa898d4ac0023', N'ccf9b69e151840a28be75d8443b70273');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'6beeb6d1ee5544d49d03bfec34ceb56a', N'8a40c0353fa828a6013fa898d4ac0023', N'f82c021dc443419fb2469032af73bf3e');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'6bf45b956cae4a1abed8865aa135fb6f', N'8a40c0353fa828a6013fa898d4ac0023', N'15566e63f3104c73b4a0b4a784dd11ca');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'6e3f829795a843b3b6f1044d7d19fbdb', N'8a40c0353fa828a6013fa898d4ac0023', N'233356b63d8e477fb6e948b703232809');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'71b8572ae55c41c4ba79151001166116', N'8a40c0353fa828a6013fa898d4ac0023', N'5b249ad344d948b99f58768c323f5f71');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'71d7a275c84044e9b5cc1562f4bf3396', N'8a40c0353fa828a6013fa898d4ac0023', N'6324ff9e83654aa0bf7f9d918b636b55');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'71eebd3168454ea0951e7182cf00e3c9', N'8a40c0353fa828a6013fa898d4ac0023', N'90c3cee940ea4211a714f5111d24ff5d');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'7396df5d012b412e9651805a4458a982', N'8a40c0353fa828a6013fa898d4ac0023', N'0773a58c4bdb4858ab062c4a2a4da69a');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'7611c160125a4b92ba67a6e924597ddb', N'8a40c0353fa828a6013fa898d4ac0023', N'1046389d8525451697f2793185e7d6ee');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'76e452d549b341b88fd8d5d51844d4f1', N'8a40c0353fa828a6013fa898d4ac0023', N'5fcac107c80d493d91b53a815d4b297a');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'7a42d1b5ab884d7098f913c16bcc7b48', N'8a40c0353fa828a6013fa898d4ac0023', N'c081c50918f4459f8e36ab8cb4151a61');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'7b5c188e225d4fb9982e8973c1a49e90', N'8a40c0353fa828a6013fa898d4ac0023', N'39d82b5574b540b88d3723b36eb3e577');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'7e3f2af3206846fd8e35be1520e474e8', N'8a40c0353fa828a6013fa898d4ac0023', N'09dbbe046d6e469d8a5ba12e29abc522');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'7fd3982f773b4a8987ab69cfd101af11', N'8a40c0353fa828a6013fa898d4ac0023', N'6b527ed138c343a89ddf73cf16fef565');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'814f34aa1cde4a6a9c37e5966ed4ed5b', N'8a40c0353fa828a6013fa898d4ac0023', N'58a85040aa9f40cca0bdba6e23e30363');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'81b4dfa9ce5a4bc09e77e361b3bd5e6d', N'8a40c0353fa828a6013fa898d4ac0023', N'335d1f8f46eb47a18001889f8cc21348');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'82b6a5c1589b4a75b472a858462f9a5c', N'8a40c0353fa828a6013fa898d4ac0023', N'5148ea207b974ee197f0bc57060ab1ad');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'848474d1de20428ca6749f49b3e260da', N'8a40c0353fa828a6013fa898d4ac0023', N'd496b161d2564111992687b948862244');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'85da45980b4247f0abc6e09ffafd7f8f', N'8a40c0353fa828a6013fa898d4ac0023', N'2fee901117c64e18873f60e8f800713d');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'8718e76a4ed14c609501acf0efe44c61', N'8a40c0353fa828a6013fa898d4ac0023', N'2be34991827e4e8da8e92f9b9e8bce25');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'87e0d85628b24118b9506babc049e6e7', N'8a40c0353fa828a6013fa898d4ac0023', N'88298fbd650d49f492e268816feffd15');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'8be5e404ae3149eb87eb0d3e32c178be', N'8a40c0353fa828a6013fa898d4ac0023', N'c9d013d14cbd4f148fb4562c91803ee8');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'8d6b0c75af9340afaf812bdc9b737df7', N'8a40c0353fa828a6013fa898d4ac0023', N'b8339f29d8d84a4ead6454295f87b79c');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'905956517a0f48a59c7481507c3dc2c4', N'8a40c0353fa828a6013fa898d4ac0023', N'4e03be6af2c74dae99a131a1ab3569f6');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'93192c14c94c4aab86520e29bc8cf3a8', N'8a40c0353fa828a6013fa898d4ac0023', N'351851fb7fce48f9a0ff6747971715ac');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'942227d7d02342d9a3d4d0cedc272a88', N'8a40c0353fa828a6013fa898d4ac0023', N'886bd497064b4c9f87d8461ebba421d1');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'98ea132c9f3c41f7a14e75a54b25cb4b', N'8a40c0353fa828a6013fa898d4ac0023', N'cf26c1d2baa24a8791b3d264154b80d4');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'9bb5bde523264234b36f6a6f1790b097', N'8a40c0353fa828a6013fa898d4ac0023', N'fb487ba403254ce8843b39a768422f04');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'9f84e5533e804e709c2f63eb2e958729', N'8a40c0353fa828a6013fa898d4ac0023', N'a1ff68acf9b24c34b347ff21e333cb70');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'a11a562993784cabb5ae5d9ce3bda6cd', N'8a40c0353fa828a6013fa898d4ac0023', N'2bd0e8f116f9420692a81d1723cecf5c');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'a303d192041f40468970a75118d2b3e6', N'8a40c0353fa828a6013fa898d4ac0023', N'a0d2897ee9194378819e78538189faa0');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'a3a679f9187d4bd8819c77e67dfae367', N'8a40c0353fa828a6013fa898d4ac0023', N'4959d88b8ca64eb19310c30799faa07c');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'a77dc935e8c0491e9c272bcfd67fa7c1', N'8a40c0353fa828a6013fa898d4ac0023', N'2fbbc9cfb0bf4b5bb504ead155c3423c');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'a851dde123ab4697b74225e8725f4633', N'8a40c0353fa828a6013fa898d4ac0023', N'ad51a6ca95c646ce9c03778eda715734');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'ac26282436074fad81655fd5d639454f', N'8a40c0353fa828a6013fa898d4ac0023', N'd646da8707ae41838fd2ec9bf0d467ee');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'ac2b6a038db74fe39664222aae93d1ff', N'8a40c0353fa828a6013fa898d4ac0023', N'32a3e59964204a3c8848e84b864306ae');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'ac4a6c8005de4afca3aa04f82b0f64d1', N'8a40c0353fa828a6013fa898d4ac0023', N'ee27f5c23b6d4217b3b66295a3506a40');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'ac74144a8d7d4d5790073c0387d7a20c', N'8a40c0353fa828a6013fa898d4ac0023', N'c04adcd019e04cf3ba7c66af721a18dc');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'aedaaa19e1da475d8f9a71c4217a80b9', N'8a40c0353fa828a6013fa898d4ac0023', N'235d855d7b914d728e434f0f309ab041');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'aee1eb6feb4943798513c1770a41e9ae', N'8a40c0353fa828a6013fa898d4ac0023', N'acbceb432b5849aca9e9b284240281ec');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'b0bfdc9cfedf407cabd2964630c4262e', N'8a40c0353fa828a6013fa898d4ac0023', N'f771691134c34174a819b5990310da56');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'b1eb78ff76de482bb88e0fb8acca7d5a', N'8a40c0353fa828a6013fa898d4ac0023', N'78c6026c6af44b41a6bef4cdb4cfb414');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'b5bb8efe0adc4a62a606d768c61e10e8', N'8a40c0353fa828a6013fa898d4ac0023', N'6566adb7fc6347e7b01a3c47129b5eb5');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'b8481bf5a29e41d8994b11542bae9a46', N'8a40c0353fa828a6013fa898d4ac0023', N'721f7255449c445faf36607c254eea06');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'b91ff9778e70437da2c875f433fb9cf7', N'8a40c0353fa828a6013fa898d4ac0023', N'f1f6f2c8f026498c8ee64b7a918d06df');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'b9370c02cc8248f2aa415e0f5c2b083c', N'8a40c0353fa828a6013fa898d4ac0023', N'bc2c865be6af42cf861294d446fb1c6f');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'bafd8455940a46d9af5b42fa6d01aeba', N'8a40c0353fa828a6013fa898d4ac0023', N'1d2b6919b80a4a21821adc3efcda77b2');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'bee5de9aa4714491b9cda9b3430aefd0', N'8a40c0353fa828a6013fa898d4ac0023', N'5d6f2bb8faa948108081492179d0c0ad');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'c0a5951482284b10ba6d7c7e0c5131fc', N'8a40c0353fa828a6013fa898d4ac0023', N'8b1c1c86385642f2b6c97930b44bbbcf');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'c433c6229611482f812595ed46c8c87b', N'8a40c0353fa828a6013fa898d4ac0023', N'd479dbdc901f4d85a207b9bace6465ac');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'c8193e0665dc466f81c1785cf9a06eb5', N'8a40c0353fa828a6013fa898d4ac0023', N'e754dfdb794d4e7db6023c9b089a340c');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'c9f24b55cf28484db39e137ea4fa35df', N'8a40c0353fa828a6013fa898d4ac0023', N'df0aa534655242e4a0bcd638b51a4e03');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'cb88488a98ad4f17b2b0c23f3d386344', N'8a40c0353fa828a6013fa898d4ac0023', N'c05642442e0a468ebe4f0b7771a803ae');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'cbd5349f6175452fba4aae0b628e9cce', N'8a40c0353fa828a6013fa898d4ac0023', N'61da3d9c60704621aa60d1da4553a264');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'cede53073ad749bc9bb4621249c92852', N'8a40c0353fa828a6013fa898d4ac0023', N'8f79857b31d4475a94c712e997e89c99');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'd233b60121504d9ca79138c0778fdd8a', N'8a40c0353fa828a6013fa898d4ac0023', N'9a708f39e123455e84b6125774bab1ea');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'd32280e50ef74270803dfaac49b7b5b2', N'8a40c0353fa828a6013fa898d4ac0023', N'dfc7af0979a54e8e9a3f18b7a5d66030');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'd4c6a7deed2847e8bad34b69a559a53e', N'8a40c0353fa828a6013fa898d4ac0023', N'0478826a46df4f20b12f4043a97f8209');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'd4f1296a506e48c39291e2b55a5deb33', N'8a40c0353fa828a6013fa898d4ac0023', N'2e32e08e495b4ccea6148774e9f91182');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'db0dcaa30f7948c59d857da13eb368ef', N'8a40c0353fa828a6013fa898d4ac0023', N'1a8b4d8e4411412fa8bb561393563a85');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'dc7210d217c54f09ac800e47b2cabf69', N'8a40c0353fa828a6013fa898d4ac0023', N'ff91363b32424fa399e44cc0dfd688e9');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'dcaaf233f3344fa183ea6fcf4838107f', N'8a40c0353fa828a6013fa898d4ac0023', N'c0ccfcd127c347a8b9db140e5aa62188');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'dd46b92bb26f4bc1b474c157d60245f8', N'8a40c0353fa828a6013fa898d4ac0023', N'362cf247241c4d12b6242301e4a73516');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'df4ce9dce40941e6b97ac7ef6caa0878', N'8a40c0353fa828a6013fa898d4ac0023', N'dc750e57b54f4baca78d66969321ee51');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'df5eca83889a4057b2a1581bcfc84c52', N'8a40c0353fa828a6013fa898d4ac0023', N'48db51f20b504c4ab489b1dcfd3ecbd9');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e00da5f72a8545e58f41723e4aaf9815', N'8a40c0353fa828a6013fa898d4ac0023', N'10499bc7f9cb4adf99beba00343b4ea6');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e060f34c9f1744d1aeb1e01a920158ba', N'8a40c0353fa828a6013fa898d4ac0023', N'21141da4febe4c929abe37126b37fd12');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e0613568a4df4bfb8e6a6b4a691775e8', N'8a40c0353fa828a6013fa898d4ac0023', N'420d8ebc68ad44dc8188d4c27dc585d1');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e32d74ddaae549cc830a6f030a4508c6', N'8a40c0353fa828a6013fa898d4ac0023', N'46e00ef0fd234e9dbf68ed9bbb437d0f');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e3e0093504904769a12d7814a90ecc5e', N'8a40c0353fa828a6013fa898d4ac0023', N'9f75b47bdc0249e2b493c47384785a72');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e50e023a31e34903816644e3246f740b', N'8a40c0353fa828a6013fa898d4ac0023', N'9c0ae757fc564f27860b975e5792ae6a');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e54f1e31da9a4f728f66fdfd94d0bb5b', N'8a40c0353fa828a6013fa898d4ac0023', N'b23b17d4c83242e8a1a8ee8cfcde9907');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e597c74ee6d44858b3c99b157b3e92e8', N'8a40c0353fa828a6013fa898d4ac0023', N'd247fb45be724ed2a2bb5c92d73bf6cf');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e62ace3aeff74b18a215dc41dfece9e0', N'8a40c0353fa828a6013fa898d4ac0023', N'd115d08591ef4c0eaebef15f8294b287');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e6685532fd524e7380a560b4ecdb00da', N'8a40c0353fa828a6013fa898d4ac0023', N'7cc12b5c154a4a9782c518c57e8ab3aa');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e81aad2c22d746d9902630ff3c521fcf', N'8a40c0353fa828a6013fa898d4ac0023', N'c1e991d1f56749298c18ff69d7777e0b');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e87c7e1f682e421bad56c9f97f5c3d2e', N'8a40c0353fa828a6013fa898d4ac0023', N'423e8c2e2a644bbda0803f46ea8f31e2');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'e9f51cc82e6641cc9a4889a696f2977b', N'8a40c0353fa828a6013fa898d4ac0023', N'910955c2192a418995eeab8bf15372e9');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'ec385c4831f145e286b528e077d450d6', N'8a40c0353fa828a6013fa898d4ac0023', N'05114c0cbe1f4c2095b3216f13cfb681');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'edae7d1fceea4a2ea20a7ec403686277', N'8a40c0353fa828a6013fa898d4ac0023', N'3dd486cd58da467dbd83ae420db14815');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'eeed83d366eb4083968cfdae9dba28b1', N'8a40c0353fa828a6013fa898d4ac0023', N'ca0f6da01ada419eaa7739d9790e5b88');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'f0141c6068f74b8a95c3bf732c0111b8', N'8a40c0353fa828a6013fa898d4ac0023', N'7bd7ca42560140ee8573b2ade6388f3e');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'f2cfb3f642f64fdc80daecf002266bb9', N'8a40c0353fa828a6013fa898d4ac0023', N'0fb7938c7d614fc389568eb67b442303');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'f7dcf386fcf4407b863c923290200154', N'8a40c0353fa828a6013fa898d4ac0023', N'83ef85fd17804bb195d0ad3c07f88c30');
GO
INSERT INTO [dbo].[pt_roleOperator] ([ids], [roleIds], [operatorIds]) VALUES (N'fec66e284bd8410bbcf863da0f9fe91d', N'8a40c0353fa828a6013fa898d4ac0023', N'fd9978df5c5a47f298e2d28e21e70b15');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_station]
-- ----------------------------
DROP TABLE [dbo].[pt_station]
GO
CREATE TABLE [dbo].[pt_station] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[description] varchar(200) NULL ,
[images] varchar(50) NULL ,
[isparent] varchar(5) NULL ,
[names] varchar(25) NULL ,
[orderids] bigint NULL ,
[parentstationids] varchar(32) NULL ,
[operatorids] text NULL ,
[moduleids] text NULL 
)


GO

-- ----------------------------
-- Records of pt_station
-- ----------------------------
INSERT INTO [dbo].[pt_station] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentstationids], [operatorids], [moduleids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0020', N'0', N'根节点', N'1_open.png', N'true', N'岗位组织结构', N'1', null, N'', N'');
GO
INSERT INTO [dbo].[pt_station] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentstationids], [operatorids], [moduleids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0021', N'0', N'人事经理', N'2.png', N'false', N'人事经理', N'6', N'8a40c0353fa828a6013fa898d4ac0020', N'operator_520,operator_526,operator_530,operator_527,', N'module_8a40c0353fe0565b0130001,module_8a40c0353fe0565b0130002,');
GO
INSERT INTO [dbo].[pt_station] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentstationids], [operatorids], [moduleids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0022', N'0', N'财务经理', N'3.png', N'false', N'财务经理', N'8', N'8a40c0353fa828a6013fa898d4ac0020', N'', N'');
GO
INSERT INTO [dbo].[pt_station] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentstationids], [operatorids], [moduleids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0023', N'0', N'行政经理', N'4.png', N'false', N'行政经理', N'7', N'8a40c0353fa828a6013fa898d4ac0020', N'operator_520,operator_526,operator_530,operator_529,', N'module_8a40c0353fe0565b0130001,module_8a40c0353fe0565b0130002,');
GO
INSERT INTO [dbo].[pt_station] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentstationids], [operatorids], [moduleids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0024', N'0', N'测试经理', N'5.png', N'false', N'测试经理111', N'9', N'8a40c0353fa828a6013fa898d4ac0020', N'', N'');
GO
INSERT INTO [dbo].[pt_station] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentstationids], [operatorids], [moduleids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0025', N'0', N'研发经理', N'6.png', N'false', N'研发经理', N'1', N'8a40c0353fa828a6013fa898d4ac0020', N'', N'');
GO
INSERT INTO [dbo].[pt_station] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentstationids], [operatorids], [moduleids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0026', N'0', N'应用Java', N'8.png', N'false', N'应用Java', N'3', N'8a40c0353fa828a6013fa898d4ac0027', N'operator_37218fb52ec94fb4bf76209a17916094,operator_c1e991d1f56749298c18ff69d7777e0b,operator_b13b002e2fad4e95bbe0e4dbc9fbdfe1,operator_9a708f39e123455e84b6125774bab1ea,operator_437e05d09dd94720b67c4f230cdebe58,operator_0fb7938c7d614fc389568eb67b442303,operator_f771691134c34174a819b5990310d000,operator_886bd497064b4c9f87d8461ebba421d1,operator_aa126932641f4e068ed8278a332de85d,operator_fb6a0c1e618041bcbbf8cfd41311b1fa,operator_f771691134c34174a819b5990310da56,operator_7ed5eefbbf3d4aa78d0c5b99f3b7010c,operator_cf26c1d2baa24a8791b3d264154b80d4,operator_b82d86fb7b64498a9c2b8b9a99b3fbeb,operator_10499bc7f9cb4adf99beba00343b4ea6,operator_9f75b47bdc0249e2b493c47384785a72,operator_a1ff68acf9b24c34b347ff21e333cb70,operator_a6623c65480f4f2cb63a4d7673f81e3a,operator_df0aa534655242e4a0bcd638b51a4e03,operator_4a6544ae7a2548ad81c0e3994999023c,operator_91baed789bc14efdbebb10b49c69ee5b,operator_c04adcd019e04cf3ba7c66af721a18dc,operator_f1f6f2c8f026498c8ee64b7a918d06df,operator_5fcac107c80d493d91b53a815d4b297a,operator_d247fb45be724ed2a2bb5c92d73bf6cf,operator_4376888fd74f4247a926529e5da03442,operator_d479dbdc901f4d85a207b9bace6465ac,operator_79039a2260da46b0aabb5a62e8db6c87,operator_1a8b4d8e4411412fa8bb561393563a85,operator_e754dfdb794d4e7db6023c9b089a340c,operator_48db51f20b504c4ab489b1dcfd3ecbd9,operator_bc2c865be6af42cf861294d446fb1c6f,operator_d496b161d2564111992687b948862244,operator_1b0d7476974e4bf9b52f75fb82f87330,operator_a5289b2638d845fbb06dedbcdd517f97,operator_c9d013d14cbd4f148fb4562c91803ee8,operator_22926eb196a14b48be775f4880b5ba94,operator_b8339f29d8d84a4ead6454295f87b79c,operator_e037e0bae9a94e549d6b647db49a64a1,operator_a0c01a5248cd4bf38e57945dbb2b98c5,operator_3ee5f986289d4a1990f4e42c9a0caadb,operator_4df80521e66447618796c3cfe02bf239,operator_6569e0d9f2cd4e3a97af4e1b0cd8d2f7,operator_f16cadd8f81e4bef926e09f718db8fe2,operator_091855dd809b418fae88a7fec6d9f246,operator_01aa0c85c8b84ae8aca7f5484336b203,operator_d5c8bdf7a49a4e46b776c05dc9ead484,operator_2be34991827e4e8da8e92f9b9e8bce25,operator_8f79857b31d4475a94c712e997e89c99,operator_12141c1c3be241ca8a868bce9cd610d5,operator_21b0a910ef6e4c60a325d5e57e6e6f65,operator_d1e14e0b7f69478394850d2238214692,operator_74aa20442105408d90f9e6469a3a92b5,operator_8897dbe85b3e4e6989d662495272cf26,operator_7ae62737df444d619f8fd376360d160c,operator_335d1f8f46eb47a18001889f8cc21348,operator_7cc12b5c154a4a9782c518c57e8ab3aa,operator_78c6026c6af44b41a6bef4cdb4cfb414,operator_15566e63f3104c73b4a0b4a784dd11ca,operator_acbceb432b5849aca9e9b284240281ec,operator_d646da8707ae41838fd2ec9bf0d467ee,operator_29c18b3394924c30882da049da14ad99,operator_c0ccfcd127c347a8b9db140e5aa62188,operator_ca0f6da01ada419eaa7739d9790e5b88,operator_233356b63d8e477fb6e948b703232809,operator_362cf247241c4d12b6242301e4a73516,operator_c29ea4cbd9044bc786e9f4584ad840ff,operator_2fbbc9cfb0bf4b5bb504ead155c3423c,operator_c7132250f5054b808bb119122a6ecb52,operator_09b6ce29313c4051ba765de516a9b283,operator_dc750e57b54f4baca78d66969321ee51,operator_21141da4febe4c929abe37126b37fd12,operator_c081c50918f4459f8e36ab8cb4151a61,operator_2fee901117c64e18873f60e8f800713d,operator_7eab5f800bab4efb8df1b2e8a0575f73,operator_32a3e59964204a3c8848e84b864306ae,operator_8bd9c0e14df941cdaf6253cd08dbd9cd,operator_7b4281dd247c4624bee0d8f84c2c2715,operator_c05642442e0a468ebe4f0b7771a803ae,operator_5b249ad344d948b99f58768c323f5f71,operator_0da15c49299d41a4b720f787d053e3cb,operator_cc6bcbee40ab43b2bd5aff6d9385e1fc,operator_83ef85fd17804bb195d0ad3c07f88c30,operator_ad51a6ca95c646ce9c03778eda715734,operator_6daed51284f94923b1c8a6414e646959,operator_1b1a809815574b2a9c1d0e18d692de17,operator_b23b17d4c83242e8a1a8ee8cfcde9907,operator_910955c2192a418995eeab8bf15372e9,operator_ad09a1b897744812875c752c2d70f11a,operator_f82c021dc443419fb2469032af73bf3e,operator_053d330462e1459ca1012c9d29113bc4,operator_58a85040aa9f40cca0bdba6e23e30363,operator_b4ee4ae4391f4243be69e838545d2131,operator_1046389d8525451697f2793185e7d6ee,operator_46e00ef0fd234e9dbf68ed9bbb437d0f,operator_b8218945b8e743f29651569950014511,operator_d115d08591ef4c0eaebef15f8294b287,operator_235d855d7b914d728e434f0f309aa04d,operator_fd9978df5c5a47f298e2d28e21e70b15,operator_8ca8af501522439d8c9249e00db5d78d,operator_dfe9d74fe0ef4220bfcfe6d7bb2f9436,operator_2c91467f905a4f5ba9f52830131c8ad9,operator_481d4d5c0a634c4085c72c990260e58d,operator_420d8ebc68ad44dc8188d4c27dc585d1,operator_5148ea207b974ee197f0bc57060ab1ad,operator_0773a58c4bdb4858ab062c4a2a4da69a,operator_9765e6bb76eb40ab800cb8954822190e,operator_77823e12391a47729a1f82a00bc15c5b,operator_05114c0cbe1f4c2095b3216f13cfb681,operator_6b527ed138c343a89ddf73cf16fef565,operator_dfc7af0979a54e8e9a3f18b7a5d66030,operator_3dd486cd58da467dbd83ae420db14815,operator_36d3b89e378b451ca89d1a41a3c53e10,operator_99a42a467bbf4e829fd0706507c9f7a7,operator_2b7f6e28f9a74854b7399e8740b765fd,operator_d1b453799d62485b82e027b96b596ccd,operator_37a9a6966448469f9d9abe2e8aeb1b9e,operator_3b1e7c5d5e0e461c90e1f0032f679a25,operator_f7c220a81ba843938f8ccb108bec9c03,operator_4a05ffcfe351476391a036937eaf733f,operator_beeaa7f4b2444430a6732ecc83c453a2,operator_6131942dd2644790b80df13c14fb3ae8,operator_b352e4246e754a9691bcc9011f445665,operator_5982350f7d0e4b2ca72de64300d75223,operator_dad107c1aeb0419b8004d57f9d70223e,operator_91f78713c3084b6e9b7419e2a97c7dac,operator_3b6a8f61e20e4bf2943421af2119e9b9,operator_9ee4ee562eaa475a95f45d3daeb0220a,operator_06244cf3520c49e8a45cbde82a53fa5e,operator_666f50e0f3b04f4ba43bcb4e719c1e8d,operator_f57388d139034099932c36a955df625a,operator_afe893c6be744c4f98187b084ac832e7,operator_b3af8fb65a00418c966b8f2a5ac97400,operator_4f7a5bd18e1e4ed3849a94c48c14c5a1,operator_5c15cf5c3761419a9029e4e094c8f53c,operator_bcf8cf5ad0734dc785cba716ab437c93,operator_86a502729bda46f0b607c2b4c6531bd3,operator_1553d9a97a4b4063a46f4be41e7adedd,operator_45cf6e8f9c254e509399deda080f0e20,operator_dfa8256651a84269869c35ca1f10cae5,operator_15495beebe984cd19dc30d65676c4c4d,operator_3bfc62720fef4706b22c78d69d27a275,operator_ee781545af7144a18f30b5492ee49fc8,operator_fe0be0443cba4a5993b6d5f91eae8e89,operator_4c501cf7b83f4b058a05be15127c8edb,operator_271a4ae9860341e6a30602070268e1e4,operator_38f3871f789c4936b37d17ea4823da58,', N'module_8a40c0354328e527014328e884be0016,module_pingTai,module_pingTai00020,module_pingTai0004,module_pingTai00016,module_pingTai0007,module_pingTai00012,module_297e0cf944f8cce70144f8e166a40167,module_pingTai00015,module_pingTai00022,module_pingTai00010,module_pingTai00018,module_pingTai0006,module_pingTai00023,module_pingTai00011,module_8a40c0353fa828a6013fa898d4ac0020,module_8a40c0353fa828a6013fa898d4ac0033,module_8a40c0353fa828a6013fa898d4ac0021,module_8a40c0353fa828a6013fa898d4ac0031,module_8a40c0353fa828a6013fa898d4ac0030,module_297e0cf944e9762e0144e97dfd6e00c9,module_8a40c0353fa828a6013fa898d4ac0023,module_8a40c0353fa828a6013fa898d4ac0024,module_8a40c0353fa828a6013fa898d4ac0025,module_8a40c0353fa828a6013fa898d4ac0026,module_8a40c0353fa828a6013fa898d4ac0027,module_8a40c0353fa828a6013fa898d4ac0028,module_8a40c0353fa828a6013fa898d4ac0029,module_8a40c0353fa828a6013fa898d4ac1100,module_c4e63c4171db4ae2a83f7dfcc2656b0e,module_e6eb0165223447218410f867a9614300,module_417ed3d3cf4d4b7a939613829e8db17d,module_7a35846a305c42abb68601b4f7347289,module_c87c35097a2d4bc898fe6e9b1e280a3d,module_8f53706d4af541588bde334d99d44727,module_8a40c0353fa828a6013fa898d4ac2200,module_3bf4c1829bf447979865fc4d2ab75801,module_4090cac06e15459789bc5154eef67e4e,module_3dec44186175424cbee2d05ffbb690dd,module_8a1b51bb6fae4fac8591f4f387d250ff,module_3e048ee263c344318e9c4995a5cd35e0,');
GO
INSERT INTO [dbo].[pt_station] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentstationids], [operatorids], [moduleids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0027', N'0', N'应用经理', N'7.png', N'true', N'应用经理', N'2', N'8a40c0353fa828a6013fa898d4ac0020', N'', N'');
GO
INSERT INTO [dbo].[pt_station] ([ids], [version], [description], [images], [isparent], [names], [orderids], [parentstationids], [operatorids], [moduleids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0028', N'0', N'应用C++', N'2.png', N'false', N'应用C++', N'5', N'8a40c0353fa828a6013fa898d4ac0027', N'', N'');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_stationOperator]
-- ----------------------------
DROP TABLE [dbo].[pt_stationOperator]
GO
CREATE TABLE [dbo].[pt_stationOperator] (
[ids] varchar(32) NOT NULL ,
[stationids] varchar(32) NULL ,
[operatorids] varchar(32) NULL 
)


GO

-- ----------------------------
-- Records of pt_stationOperator
-- ----------------------------
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'00502f4cf0c24bd68cf98691cbd92279', N'8a40c0353fa828a6013fa898d4ac0026', N'1f05b6496a494f488e4cacd2a449c37a');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'02ac78ef2c574e56afc9bb37b296d947', N'8a40c0353fa828a6013fa898d4ac0026', N'da6077ec1f354a409d0385b2c063e044');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'0314a857a41a463296a4f646d14dd02b', N'8a40c0353fa828a6013fa898d4ac0026', N'7ed5eefbbf3d4aa78d0c5b99f3b7010c');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'07297e25620e43928ddd21de0cc0e3da', N'8a40c0353fa828a6013fa898d4ac0026', N'10499bc7f9cb4adf99beba00343b4ea6');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'0753f83d4b9749e581a0d4b5388a64c5', N'8a40c0353fa828a6013fa898d4ac0026', N'c9d013d14cbd4f148fb4562c91803ee8');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'077005c2e19d498b8c4e24b7988fa1f5', N'8a40c0353fa828a6013fa898d4ac0026', N'2e32e08e495b4ccea6148774e9f91182');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'07d0294bb41e47bd9e531ad8d6cf4037', N'8a40c0353fa828a6013fa898d4ac0026', N'fb487ba403254ce8843b39a768422f04');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'0a8e21a3952d4307a198ebef2a62ee27', N'8a40c0353fa828a6013fa898d4ac0026', N'362cf247241c4d12b6242301e4a73516');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'0aed618e795d4eb4ae11cef12f0a9a05', N'8a40c0353fa828a6013fa898d4ac0026', N'235d855d7b914d728e434f0f309aa04d');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'0c6421b8174144b19ad0ad112bb6f230', N'8a40c0353fa828a6013fa898d4ac0026', N'2c2063e17dc742a3b9c330b84c5dfa6a');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'0fcb2abde5bb497da08ec6965a475f38', N'8a40c0353fa828a6013fa898d4ac0026', N'48db51f20b504c4ab489b1dcfd3ecbd9');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'11354618ab2a41e38ea7af6c4bdeaa34', N'8a40c0353fa828a6013fa898d4ac0026', N'437e05d09dd94720b67c4f230cdebe58');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'11cc4d801a6c480984774295dbef07c3', N'8a40c0353fa828a6013fa898d4ac0026', N'12141c1c3be241ca8a868bce9cd610d5');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'153c3eb1fa6046f187ec7e528a6b4cbc', N'8a40c0353fa828a6013fa898d4ac0026', N'9f75b47bdc0249e2b493c47384785a72');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'16a5d266dec74e5383bd39d9113d33f9', N'8a40c0353fa828a6013fa898d4ac0026', N'4e03be6af2c74dae99a131a1ab3569f6');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'16b501a5dd354d4fbc3ab90b5868ab7e', N'8a40c0353fa828a6013fa898d4ac0026', N'b8339f29d8d84a4ead6454295f87b79c');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'171ee8ac60f34b1bb6707788f6d1e1e6', N'8a40c0353fa828a6013fa898d4ac0026', N'f771691134c34174a819b5990310da56');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'17757d37e01e474caa7f1aa00aa49c59', N'8a40c0353fa828a6013fa898d4ac0026', N'c7132250f5054b808bb119122a6ecb52');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'177bfc023f02485196e0fcc6b4124510', N'8a40c0353fa828a6013fa898d4ac0026', N'd247fb45be724ed2a2bb5c92d73bf6cf');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'187de98458444712bc7e8bc38b5fc78f', N'8a40c0353fa828a6013fa898d4ac0026', N'1a8b4d8e4411412fa8bb561393563a85');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'19535ce9d32b4d4da6255eee9755a9af', N'8a40c0353fa828a6013fa898d4ac0026', N'7cc12b5c154a4a9782c518c57e8ab3aa');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'19851b764a044cba974c9e5aa102ceef', N'8a40c0353fa828a6013fa898d4ac0026', N'30bf01ffe1cb4ed39e92c6600ea39e93');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'1bcb0fa822004becb90426cc24bfa033', N'8a40c0353fa828a6013fa898d4ac0026', N'f771691134c34174a819b5990310d000');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'1c688e36f32c4885b95ecb10e54eeb21', N'8a40c0353fa828a6013fa898d4ac0026', N'7eab5f800bab4efb8df1b2e8a0575f73');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'1d9e2ba7549344cd9eaee78ae46813b7', N'8a40c0353fa828a6013fa898d4ac0026', N'c081c50918f4459f8e36ab8cb4151a61');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'1dfc77c086694b43a0904b6668b848b3', N'8a40c0353fa828a6013fa898d4ac0026', N'3dd486cd58da467dbd83ae420db14815');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'1ec4e181cdd14199a17054c37391d86a', N'8a40c0353fa828a6013fa898d4ac0026', N'ca0f6da01ada419eaa7739d9790e5b88');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'1fba3ec512b84337be1058c17052b82c', N'8a40c0353fa828a6013fa898d4ac0026', N'dfe9d74fe0ef4220bfcfe6d7bb2f9436');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'20e52832a59a4830a336f32b2fc8421f', N'8a40c0353fa828a6013fa898d4ac0026', N'b4ee4ae4391f4243be69e838545d2131');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'23855c2fed254537bdb5080ac723dfb7', N'8a40c0353fa828a6013fa898d4ac0026', N'e037e0bae9a94e549d6b647db49a64a1');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'23dcc95be308435a8b76fe05ed933406', N'8a40c0353fa828a6013fa898d4ac0026', N'483bdacba04f4663986e6339166e8321');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'25eecf20d8454b029326831e48fe96ec', N'8a40c0353fa828a6013fa898d4ac0026', N'5148ea207b974ee197f0bc57060ab1ad');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'27a107010397418498de98b2cd4ea85d', N'8a40c0353fa828a6013fa898d4ac0026', N'fb6a0c1e618041bcbbf8cfd41311b1fa');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'28ec713379a94469952df240c6a4550b', N'8a40c0353fa828a6013fa898d4ac0026', N'351851fb7fce48f9a0ff6747971715ac');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'2daa51b270ba4fb6aa6d4f1eaf1bb00c', N'8a40c0353fa828a6013fa898d4ac0026', N'3e4e9e72dab243d38a1785d157c24cb6');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'2ef9ddc95cee4c53ad03a3ddb465d1ed', N'8a40c0353fa828a6013fa898d4ac0026', N'46e00ef0fd234e9dbf68ed9bbb437d0f');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'2f2e74a589cf4d17bf9600599d18b505', N'8a40c0353fa828a6013fa898d4ac0026', N'8897dbe85b3e4e6989d662495272cf26');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'2f66b1e0f89e42bcaf2f493b7cb95272', N'8a40c0353fa828a6013fa898d4ac0026', N'c0ccfcd127c347a8b9db140e5aa62188');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'2fa388e8fd8a48218b6941c7cad57a05', N'8a40c0353fa828a6013fa898d4ac0026', N'c29ea4cbd9044bc786e9f4584ad840ff');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'32a3f0baa91a493b93dd0533e37876b8', N'8a40c0353fa828a6013fa898d4ac0026', N'4a6544ae7a2548ad81c0e3994999023c');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'32d7c0dfe9884d3496bcd2a1b9f4ab04', N'8a40c0353fa828a6013fa898d4ac0026', N'df0aa534655242e4a0bcd638b51a4e03');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'340522c11889454685865fe7d915fcb5', N'8a40c0353fa828a6013fa898d4ac0026', N'233356b63d8e477fb6e948b703232809');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'353a9045f0d9492197e228e562b366ae', N'8a40c0353fa828a6013fa898d4ac0026', N'f82c021dc443419fb2469032af73bf3e');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'3710db5a86414e7d96e15bfaa5d474bf', N'8a40c0353fa828a6013fa898d4ac0026', N'b8218945b8e743f29651569950014511');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'3884b26baa0a46c790b423035346f3e1', N'8a40c0353fa828a6013fa898d4ac0026', N'd646da8707ae41838fd2ec9bf0d467ee');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'3976e4ce61104d2fa9979ad4414a52ad', N'8a40c0353fa828a6013fa898d4ac0026', N'61da3d9c60704621aa60d1da4553a264');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'3a19b275fc9b4ed1af13b5c0cbbc9839', N'8a40c0353fa828a6013fa898d4ac0026', N'c1e991d1f56749298c18ff69d7777e0b');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'3b37d007ad2a4393aba200661b08cc60', N'8a40c0353fa828a6013fa898d4ac0026', N'2fee901117c64e18873f60e8f800713d');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'3e37137580f740e7944de46949656b00', N'8a40c0353fa828a6013fa898d4ac0026', N'0478826a46df4f20b12f4043a97f8209');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'4265a12c57cd4f98ac3a486852efa881', N'8a40c0353fa828a6013fa898d4ac0026', N'cc88acee3a664c58861a872c351385e6');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'4592e55302274567b73da0d11dd90d20', N'8a40c0353fa828a6013fa898d4ac0026', N'6569e0d9f2cd4e3a97af4e1b0cd8d2f7');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'478aeeb582084963bc360fe6da40babb', N'8a40c0353fa828a6013fa898d4ac0026', N'3da96263a14343eaa7b409a93ec9e1db');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'4ceb54a2dc474f3f95f7d7f1e692dcd9', N'8a40c0353fa828a6013fa898d4ac0026', N'90c3cee940ea4211a714f5111d24ff5d');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'4df6f2638f4442dca9a5e3e9359c7de1', N'8a40c0353fa828a6013fa898d4ac0026', N'9750ea3ee4474711b9acbda8d5b87ee7');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'4f8ea806583743dabc90a50aac487958', N'8a40c0353fa828a6013fa898d4ac0026', N'9765e6bb76eb40ab800cb8954822190e');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'50c0423cd3504f89a21085a2bb94560e', N'8a40c0353fa828a6013fa898d4ac0026', N'39d82b5574b540b88d3723b36eb3e577');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'5127119fe83047558d9ccb22902a89b4', N'8a40c0353fa828a6013fa898d4ac0026', N'a6623c65480f4f2cb63a4d7673f81e3a');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'538eafde5f5e42609981c4760c79df4c', N'8a40c0353fa828a6013fa898d4ac0026', N'6324ff9e83654aa0bf7f9d918b636b55');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'5559248f2f4041239bf1abc94c7e2d0e', N'8a40c0353fa828a6013fa898d4ac0026', N'88298fbd650d49f492e268816feffd15');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'57421907b0b3489ea333b7c417e635e1', N'8a40c0353fa828a6013fa898d4ac0026', N'6b527ed138c343a89ddf73cf16fef565');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'582e360a54364cf4937140b8b76d004d', N'8a40c0353fa828a6013fa898d4ac0026', N'77823e12391a47729a1f82a00bc15c5b');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'5973a8b38b6844e4ab98dccca8651d85', N'8a40c0353fa828a6013fa898d4ac0026', N'acbceb432b5849aca9e9b284240281ec');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'5a9784012bce4d728e6547bd089f849c', N'8a40c0353fa828a6013fa898d4ac0026', N'aa126932641f4e068ed8278a332de85d');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'5b14361097994fcb86d12991ae355dfd', N'8a40c0353fa828a6013fa898d4ac0026', N'15566e63f3104c73b4a0b4a784dd11ca');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'5c1f785ed3cf46be9fb0b7e32f528f54', N'8a40c0353fa828a6013fa898d4ac0026', N'423e8c2e2a644bbda0803f46ea8f31e2');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'5c64a1bb5d3f4bff8a3e36d0e7bcede1', N'8a40c0353fa828a6013fa898d4ac0026', N'21141da4febe4c929abe37126b37fd12');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'5e80e37a8195482ab79b200b124f192b', N'8a40c0353fa828a6013fa898d4ac0026', N'8bd9c0e14df941cdaf6253cd08dbd9cd');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'606474f45001428085bc32389410f209', N'8a40c0353fa828a6013fa898d4ac0026', N'5b47ae382f42421682852f889c176d49');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'60c21a81cfe4457f8181583dc94f7fa6', N'8a40c0353fa828a6013fa898d4ac0026', N'091855dd809b418fae88a7fec6d9f246');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'655adf858cd64f80bb8ab1f048950008', N'8a40c0353fa828a6013fa898d4ac0026', N'1b0d7476974e4bf9b52f75fb82f87330');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'67e5e6767cc049e6a3e216b21e036c25', N'8a40c0353fa828a6013fa898d4ac0026', N'4bebccaa8f0c4bfbaa2ff89f00706100');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'67ef52dc4fb24ba8a5862f859c5f650f', N'8a40c0353fa828a6013fa898d4ac0026', N'91baed789bc14efdbebb10b49c69ee5b');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'6a0c5de6e62440da86c4c3bec873bbad', N'8a40c0353fa828a6013fa898d4ac0026', N'a2727f19f7cd4a038dd1a94f042a8cf1');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'6efc736d451c4be0a7369a6e5b52bb7d', N'8a40c0353fa828a6013fa898d4ac0026', N'e2cead0f68ac4a2d98765264578a9f83');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'710ef10e206a406f8e4266b61ed7f603', N'8a40c0353fa828a6013fa898d4ac0026', N'4376888fd74f4247a926529e5da03442');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'7119cd163424438dbb369f236ca95e48', N'8a40c0353fa828a6013fa898d4ac0026', N'f604f021cba44b6fb96115265e557521');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'7384588cb54e4461ad4b6d1b4b9fff15', N'8a40c0353fa828a6013fa898d4ac0026', N'ee27f5c23b6d4217b3b66295a3506a40');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'79ca251be03347869e5031d592b9536d', N'8a40c0353fa828a6013fa898d4ac0026', N'fdaeeb41691d460b8f142066d1f79927');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'7f98538b125d4f84b274b81e1ef4f95d', N'8a40c0353fa828a6013fa898d4ac0026', N'7bd7ca42560140ee8573b2ade6388f3e');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'802ecb2bb69143d5ba89bacfad4cb794', N'8a40c0353fa828a6013fa898d4ac0026', N'58a85040aa9f40cca0bdba6e23e30363');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'830dcc9ea4d54c83aa261b93a40834a8', N'8a40c0353fa828a6013fa898d4ac0026', N'ccf9b69e151840a28be75d8443b70273');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'8335a5122d3d4ea7ba608d6b152b548a', N'8a40c0353fa828a6013fa898d4ac0026', N'2bd0e8f116f9420692a81d1723cecf5c');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'836547167f4e47b1b02ee5d23c1d7ce3', N'8a40c0353fa828a6013fa898d4ac0026', N'7ae62737df444d619f8fd376360d160c');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'83ca6ac5d4854b0e8d5cb94ca04fc633', N'8a40c0353fa828a6013fa898d4ac0026', N'420d8ebc68ad44dc8188d4c27dc585d1');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'884840dd5cb14653a708e895d7f20473', N'8a40c0353fa828a6013fa898d4ac0026', N'21b0a910ef6e4c60a325d5e57e6e6f65');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'8a12f74f06f547e08132c632f2e75215', N'8a40c0353fa828a6013fa898d4ac0026', N'5fcac107c80d493d91b53a815d4b297a');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'8b4410c4f75c47eca03fcd8f0c5491ae', N'8a40c0353fa828a6013fa898d4ac0026', N'ad51a6ca95c646ce9c03778eda715734');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'8ca3b4dd6f0d4aebad4db75ea8b93525', N'8a40c0353fa828a6013fa898d4ac0026', N'c04adcd019e04cf3ba7c66af721a18dc');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'8cfddbf64e4f4b72b354bf82d87fe525', N'8a40c0353fa828a6013fa898d4ac0026', N'dfc7af0979a54e8e9a3f18b7a5d66030');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'8d17b3c5831a429585d46f778d316a8d', N'8a40c0353fa828a6013fa898d4ac0026', N'fd9978df5c5a47f298e2d28e21e70b15');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'8d1f1e2309eb42a0b417f799d1107079', N'8a40c0353fa828a6013fa898d4ac0026', N'4df80521e66447618796c3cfe02bf239');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'8e281cc556434f05b78b4c2a02de1463', N'8a40c0353fa828a6013fa898d4ac0026', N'886bd497064b4c9f87d8461ebba421d1');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'8f06cd6b36a140a788514a36f80c38b1', N'8a40c0353fa828a6013fa898d4ac0026', N'8b1c1c86385642f2b6c97930b44bbbcf');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'8f0e619fee124ee09779e7043baaa9ca', N'8a40c0353fa828a6013fa898d4ac0026', N'0fb7938c7d614fc389568eb67b442303');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'8f5895aea5e944eb8250cabba2c4b320', N'8a40c0353fa828a6013fa898d4ac0026', N'a0c01a5248cd4bf38e57945dbb2b98c5');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'9029854f53214a3296531926fc06b357', N'8a40c0353fa828a6013fa898d4ac0026', N'05114c0cbe1f4c2095b3216f13cfb681');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'9210ef1ed90743eca910e6311bc919c9', N'8a40c0353fa828a6013fa898d4ac0026', N'2be34991827e4e8da8e92f9b9e8bce25');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'94d9dd332adf4da18703b7ea4666617d', N'8a40c0353fa828a6013fa898d4ac0026', N'2fbbc9cfb0bf4b5bb504ead155c3423c');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'9716e5bd908447658fa4ba28242373e5', N'8a40c0353fa828a6013fa898d4ac0026', N'b23b17d4c83242e8a1a8ee8cfcde9907');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'99b4a86646fb4c889aa900ec86d3c21a', N'8a40c0353fa828a6013fa898d4ac0026', N'6566adb7fc6347e7b01a3c47129b5eb5');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'9a165d64aea94588aec25bc7198207f4', N'8a40c0353fa828a6013fa898d4ac0026', N'd5c8bdf7a49a4e46b776c05dc9ead484');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'9b2366e6df3244c0b7663c76a7ed52ee', N'8a40c0353fa828a6013fa898d4ac0026', N'335d1f8f46eb47a18001889f8cc21348');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'a197dce7400e491989a6cb3e6f463d0f', N'8a40c0353fa828a6013fa898d4ac0026', N'9a708f39e123455e84b6125774bab1ea');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'a2625d85ccff4b098697236d2934e94c', N'8a40c0353fa828a6013fa898d4ac0026', N'46b7269a26044dfebb4edd06a2f9cd83');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'a2d1614dce624e06933a84e3111f36d4', N'8a40c0353fa828a6013fa898d4ac0026', N'6daed51284f94923b1c8a6414e646959');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'a556af7e9e45497ebbb9e6a9ba57ada4', N'8a40c0353fa828a6013fa898d4ac0026', N'09b6ce29313c4051ba765de516a9b283');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'a6a0ed877d50441ab588a45640da3dc2', N'8a40c0353fa828a6013fa898d4ac0026', N'd479dbdc901f4d85a207b9bace6465ac');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'a860c5db7b9142babef25426561bd48a', N'8a40c0353fa828a6013fa898d4ac0026', N'f1f6f2c8f026498c8ee64b7a918d06df');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'a913798ec9214f8c87d6ed628bec4e8f', N'8a40c0353fa828a6013fa898d4ac0026', N'a1ff68acf9b24c34b347ff21e333cb70');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'a9e033ee2bc0477f91576490eb4ee6cd', N'8a40c0353fa828a6013fa898d4ac0026', N'827a7067a28d442da3ddd834677127af');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'aa60fd299e3c4b5282ecea6727fe3c45', N'8a40c0353fa828a6013fa898d4ac0026', N'4959d88b8ca64eb19310c30799faa07c');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'aaee4022b84e4373b2e586f7488d9368', N'8a40c0353fa828a6013fa898d4ac0026', N'cc6bcbee40ab43b2bd5aff6d9385e1fc');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'b1aeb99260cc4ce39e783193bdd348c9', N'8a40c0353fa828a6013fa898d4ac0026', N'e4f182b4009e48a58673134324b2ec56');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'b30ce8795d834b2787e53f41d3714c0c', N'8a40c0353fa828a6013fa898d4ac0026', N'83ef85fd17804bb195d0ad3c07f88c30');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'b3d491ee10dd43ef8f29243eb31bef95', N'8a40c0353fa828a6013fa898d4ac0026', N'd115d08591ef4c0eaebef15f8294b287');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'b458e2ce27bd44f0a31a5f0793acc434', N'8a40c0353fa828a6013fa898d4ac0026', N'8f79857b31d4475a94c712e997e89c99');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'b50ac327cbde47babd13106c99c8dbdd', N'8a40c0353fa828a6013fa898d4ac0026', N'481d4d5c0a634c4085c72c990260e58d');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'b548070c4da8400481a4e9ea805e48ff', N'8a40c0353fa828a6013fa898d4ac0026', N'b82d86fb7b64498a9c2b8b9a99b3fbeb');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'ba3a698ab8fe4c6bbad58c215d2c9a71', N'8a40c0353fa828a6013fa898d4ac0026', N'b13b002e2fad4e95bbe0e4dbc9fbdfe1');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'c082ff78bd6f46529066bf3be1934d89', N'8a40c0353fa828a6013fa898d4ac0026', N'9c0ae757fc564f27860b975e5792ae6a');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'c1c59c73e4d447939f250c41e668f276', N'8a40c0353fa828a6013fa898d4ac0026', N'0773a58c4bdb4858ab062c4a2a4da69a');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'c1e9d0f4c8d14a93a287d12a1729d6d5', N'8a40c0353fa828a6013fa898d4ac0026', N'e1ac811d2a16495d927f994dd006e824');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'c37ab72ab967407ab1f1f35eebe6ceea', N'8a40c0353fa828a6013fa898d4ac0026', N'dc750e57b54f4baca78d66969321ee51');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'c77f667641e044a499c999aa48c147da', N'8a40c0353fa828a6013fa898d4ac0026', N'910955c2192a418995eeab8bf15372e9');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'c92ebef135d44cd7a1303b661e12812a', N'8a40c0353fa828a6013fa898d4ac0026', N'c05642442e0a468ebe4f0b7771a803ae');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'ca68408ea43c42a088d8be77429d50bd', N'8a40c0353fa828a6013fa898d4ac0026', N'78c6026c6af44b41a6bef4cdb4cfb414');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'cac39f7a75dd499988e19ed1923bd973', N'8a40c0353fa828a6013fa898d4ac0026', N'd496b161d2564111992687b948862244');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'cacb4fee167e445f96484295dfcfb34a', N'8a40c0353fa828a6013fa898d4ac0026', N'7b4281dd247c4624bee0d8f84c2c2715');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'ccedf261952a46aba525d866d54c4cee', N'8a40c0353fa828a6013fa898d4ac0026', N'22926eb196a14b48be775f4880b5ba94');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'cd37af6893f84ea78b676c39460d877b', N'8a40c0353fa828a6013fa898d4ac0026', N'01aa0c85c8b84ae8aca7f5484336b203');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'cee8c9b275ba4de3a1bd42f728d907b1', N'8a40c0353fa828a6013fa898d4ac0026', N'9adcc4c40e3148988e5003aaedbb4948');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'cfe54a80698243fcb9e10afd065a011e', N'8a40c0353fa828a6013fa898d4ac0026', N'cf26c1d2baa24a8791b3d264154b80d4');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'd0ef1362d1ff43c8a25eea07f4447244', N'8a40c0353fa828a6013fa898d4ac0026', N'671ce1e6167840baaa6d27f4f04574c9');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'd0f6c77416d7443fb08459b9eaa0f9d6', N'8a40c0353fa828a6013fa898d4ac0026', N'a0d2897ee9194378819e78538189faa0');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'd40d3b1a7044480a96ff5f78c222e15e', N'8a40c0353fa828a6013fa898d4ac0026', N'5c2bdc059ae24ffda2758a2781bb46da');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'db91cffbaa8a4043948715e35ee96408', N'8a40c0353fa828a6013fa898d4ac0026', N'721f7255449c445faf36607c254eea06');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'dbbd5d1929394401b468f816595235a0', N'8a40c0353fa828a6013fa898d4ac0026', N'08a96d5dd37f49459eeb02eebeb0a78c');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'dc0f0346b7ef4b76b84cc036f97ab23f', N'8a40c0353fa828a6013fa898d4ac0026', N'37218fb52ec94fb4bf76209a17916094');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'dfc925c3f9984304955fc8293810ddcb', N'8a40c0353fa828a6013fa898d4ac0026', N'e754dfdb794d4e7db6023c9b089a340c');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'e0968a2e83794d37a280638bd0359dfd', N'8a40c0353fa828a6013fa898d4ac0026', N'1b1a809815574b2a9c1d0e18d692de17');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'e0a9173a2d584fc0b5bb5665a7941171', N'8a40c0353fa828a6013fa898d4ac0026', N'2c91467f905a4f5ba9f52830131c8ad9');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'e1c2318018ac4fe4ac0eb36c6c6fb797', N'8a40c0353fa828a6013fa898d4ac0026', N'1046389d8525451697f2793185e7d6ee');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'e26b70cfb6ce477c8fae7688187b8235', N'8a40c0353fa828a6013fa898d4ac0026', N'a5289b2638d845fbb06dedbcdd517f97');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'eadf28f160604847833c4f1d88ed4715', N'8a40c0353fa828a6013fa898d4ac0026', N'18f50e0f48ef4dd9bec85f5612ab10c0');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'ebec92a266d5413e8442b47fe37aa7e2', N'8a40c0353fa828a6013fa898d4ac0026', N'29c18b3394924c30882da049da14ad99');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'ec31d96b679a4f09957e203f274ec5ae', N'8a40c0353fa828a6013fa898d4ac0026', N'bc2c865be6af42cf861294d446fb1c6f');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'ec65641ec125424187243d8530f6b56c', N'8a40c0353fa828a6013fa898d4ac0026', N'053d330462e1459ca1012c9d29113bc4');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'edfae92ea85d4532977ead9c4e772117', N'8a40c0353fa828a6013fa898d4ac0026', N'0da15c49299d41a4b720f787d053e3cb');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'eff46328c2dc41a38de09ee76f1b4584', N'8a40c0353fa828a6013fa898d4ac0026', N'5b249ad344d948b99f58768c323f5f71');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'f1f05094d7b649ab94c90669714a1d14', N'8a40c0353fa828a6013fa898d4ac0026', N'8ca8af501522439d8c9249e00db5d78d');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'f423cb2b3bee47d29e20259bba7186ad', N'8a40c0353fa828a6013fa898d4ac0026', N'ad09a1b897744812875c752c2d70f11a');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'f4ae287215d54609a5d5934263a62753', N'8a40c0353fa828a6013fa898d4ac0026', N'32a3e59964204a3c8848e84b864306ae');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'f83cdeaef7934597a3706e39d7ff3d72', N'8a40c0353fa828a6013fa898d4ac0026', N'ff91363b32424fa399e44cc0dfd688e9');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'f97d8f7f69db42b5af558571b2c00e1b', N'8a40c0353fa828a6013fa898d4ac0026', N'3ee5f986289d4a1990f4e42c9a0caadb');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'fc86de2044414d72b1e4b1ec782d735e', N'8a40c0353fa828a6013fa898d4ac0026', N'3085a3b0c20d4f3aaa7c2d27fe986aba');
GO
INSERT INTO [dbo].[pt_stationOperator] ([ids], [stationids], [operatorids]) VALUES (N'fecc208b276240a69dfc6cfac333d73d', N'8a40c0353fa828a6013fa898d4ac0026', N'79039a2260da46b0aabb5a62e8db6c87');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_syslog]
-- ----------------------------
DROP TABLE [dbo].[pt_syslog]
GO
CREATE TABLE [dbo].[pt_syslog] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[startdate] datetime NULL DEFAULT ('0000-00-00 00:00:00') ,
[starttime] bigint NULL ,
[enddate] datetime NULL DEFAULT ('0000-00-00 00:00:00') ,
[endtime] bigint NULL ,
[actionenddate] datetime NULL DEFAULT (getdate()) ,
[actionendtime] bigint NULL ,
[actionstartdate] datetime NULL DEFAULT ('0000-00-00 00:00:00') ,
[actionstarttime] bigint NULL ,
[actionhaoshi] bigint NULL ,
[viewhaoshi] bigint NULL ,
[haoshi] bigint NULL ,
[cause] char(1) NULL ,
[cookie] varchar(1024) NULL ,
[description] text NULL ,
[ips] varchar(128) NULL ,
[method] varchar(4) NULL ,
[referer] varchar(500) NULL ,
[requestpath] text NULL ,
[status] char(1) NULL ,
[useragent] varchar(1000) NULL ,
[operatorids] varchar(32) NULL ,
[accept] varchar(200) NULL ,
[acceptencoding] varchar(200) NULL ,
[acceptlanguage] varchar(200) NULL ,
[connection] varchar(200) NULL ,
[host] varchar(200) NULL ,
[xrequestedwith] varchar(200) NULL ,
[pvids] varchar(32) NULL ,
[userids] varchar(32) NULL 
)


GO

-- ----------------------------
-- Records of pt_syslog
-- ----------------------------

-- ----------------------------
-- Table structure for [dbo].[pt_systems]
-- ----------------------------
DROP TABLE [dbo].[pt_systems]
GO
CREATE TABLE [dbo].[pt_systems] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[description] varchar(200) NULL ,
[names] varchar(25) NULL ,
[numbers] varchar(25) NULL ,
[orderids] bigint NULL 
)


GO

-- ----------------------------
-- Records of pt_systems
-- ----------------------------
INSERT INTO [dbo].[pt_systems] ([ids], [version], [description], [names], [numbers], [orderids]) VALUES (N'0c1230c98ef34e58947903fab5a4fa85', N'0', null, N'易信平台', N'yiXin', N'3');
GO
INSERT INTO [dbo].[pt_systems] ([ids], [version], [description], [names], [numbers], [orderids]) VALUES (N'8a40c0353fa828a6013fa898d4ac0020', N'0', N'基础平台', N'基础平台', N'platform', N'1');
GO
INSERT INTO [dbo].[pt_systems] ([ids], [version], [description], [names], [numbers], [orderids]) VALUES (N'd3a5c976c4c24751b6b00ec775692683', N'0', null, N'微信平台', N'weiXin', N'2');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_upload]
-- ----------------------------
DROP TABLE [dbo].[pt_upload]
GO
CREATE TABLE [dbo].[pt_upload] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[parametername] varchar(50) NULL ,
[filename] varchar(50) NULL ,
[contenttype] varchar(100) NULL ,
[originalfilename] varchar(500) NULL ,
[path] varchar(500) NULL ,
[md5] varchar(100) NULL ,
[targetids] varchar(32) NULL ,
[describe] text NULL ,
[orderids] bigint NULL ,
[size] bigint NULL 
)


GO

-- ----------------------------
-- Records of pt_upload
-- ----------------------------

-- ----------------------------
-- Table structure for [dbo].[pt_user]
-- ----------------------------
DROP TABLE [dbo].[pt_user]
GO
CREATE TABLE [dbo].[pt_user] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[orderids] bigint NULL ,
[errorcount] bigint NULL ,
[status] char(1) NULL ,
[stopdate] datetime NULL DEFAULT (getdate()) ,
[username] varchar(50) NULL ,
[departmentids] varchar(32) NULL ,
[email] varchar(100) NULL ,
[idcard] varchar(25) NULL ,
[mobile] varchar(20) NULL ,
[names] varchar(25) NULL ,
[password] varchar(500) NULL ,
[salt] varchar(500) NULL ,
[stationids] varchar(32) NULL ,
[secretkey] varchar(100) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'pt_user', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'pt_user'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'pt_user'
GO

-- ----------------------------
-- Records of pt_user
-- ----------------------------
INSERT INTO [dbo].[pt_user] ([ids], [version], [orderids], [errorcount], [status], [stopdate], [username], [departmentids], [email], [idcard], [mobile], [names], [password], [salt], [stationids], [secretkey]) VALUES (N'03a44ba0aa4e4905bea726d4da976ba5', N'6', N'0', N'4', N'1', N'2016-02-01 09:54:57.820', N'admins', N'8a40c0353fa828a6013fa898d4ac0028', N'dongcb678@163.com', N'430881198609285833', N'13871558042', N'管理员', N'kOkaSEILIwNt3WtQs9htKQUdTsU=', N'OXT9j9IRMno=', N'8a40c0353fa828a6013fa898d4ac0026', N'N4aJzr8KltvVIFwbzdXdhQ==');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_usergroup]
-- ----------------------------
DROP TABLE [dbo].[pt_usergroup]
GO
CREATE TABLE [dbo].[pt_usergroup] (
[ids] varchar(32) NOT NULL ,
[userids] varchar(32) NULL ,
[groupids] varchar(32) NULL 
)


GO

-- ----------------------------
-- Records of pt_usergroup
-- ----------------------------
INSERT INTO [dbo].[pt_usergroup] ([ids], [userids], [groupids]) VALUES (N'5ccf0b1d605c49938fa8c4369c8a34c6', N'03a44ba0aa4e4905bea726d4da976ba5', N'8a40c0353fa828a6013fa898d4ac0028');
GO
INSERT INTO [dbo].[pt_usergroup] ([ids], [userids], [groupids]) VALUES (N'baeadb794a5241a888cd9346f07212a8', N'3f33600d631e4b67af6f5d850d4a78de', N'8a40c0353fa828a6013fa898d4ac0028');
GO

-- ----------------------------
-- Table structure for [dbo].[pt_userinfo]
-- ----------------------------
DROP TABLE [dbo].[pt_userinfo]
GO
CREATE TABLE [dbo].[pt_userinfo] (
[ids] varchar(32) NOT NULL ,
[version] bigint NULL ,
[address] varchar(300) NULL ,
[addressinfo] varchar(300) NULL ,
[avoirdupois] varchar(5) NULL ,
[birthday] date NULL ,
[bloodgroup] varchar(15) NULL ,
[clientlevelend] datetime NULL DEFAULT (getdate()) ,
[clientlevelstart] datetime NULL DEFAULT ('0000-00-00 00:00:00') ,
[culture] varchar(30) NULL ,
[description] varchar(200) NULL ,
[finishschooldate] date NULL ,
[folk] varchar(20) NULL ,
[government] varchar(25) NULL ,
[homepage] varchar(100) NULL ,
[householder] varchar(20) NULL ,
[marriage] varchar(20) NULL ,
[msn] varchar(20) NULL ,
[nativityaddress] varchar(20) NULL ,
[postboy] varchar(6) NULL ,
[qq] varchar(20) NULL ,
[schoolname] varchar(20) NULL ,
[sex] varchar(5) NULL ,
[speciality] varchar(20) NULL ,
[stature] varchar(5) NULL ,
[telephone] varchar(20) NULL 
)


GO

-- ----------------------------
-- Records of pt_userinfo
-- ----------------------------
INSERT INTO [dbo].[pt_userinfo] ([ids], [version], [address], [addressinfo], [avoirdupois], [birthday], [bloodgroup], [clientlevelend], [clientlevelstart], [culture], [description], [finishschooldate], [folk], [government], [homepage], [householder], [marriage], [msn], [nativityaddress], [postboy], [qq], [schoolname], [sex], [speciality], [stature], [telephone]) VALUES (N'03a44ba0aa4e4905bea726d4da976ba5', N'6', N'湖北钟祥', null, N'55', N'2012-03-07', N'bloodGroup_A', N'2015-03-26 19:16:26.000', N'2014-06-09 11:21:13.000', N'wenHuaChenDu_chuZhong', N'湖北钟祥', N'2010-10-25', N'folk_han', N'government_dangYuan', N'http://www.4bu4.com', N'湖北钟祥', N'marriage_no', null, N'湖北钟祥', N'431924', N'150584428', N'西安外事学院', N'man', N'电子商务', N'165', N'027-65155060');
GO

-- ----------------------------
-- Table structure for [dbo].[test_blog]
-- ----------------------------
DROP TABLE [dbo].[test_blog]
GO
CREATE TABLE [dbo].[test_blog] (
[ids] varchar(32) NOT NULL ,
[title] varchar(200) NULL ,
[content] text NULL ,
[createTime] datetimeoffset(7) NULL 
)


GO

-- ----------------------------
-- Records of test_blog
-- ----------------------------

-- ----------------------------
-- Indexes structure for table pt_department
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_department]
-- ----------------------------
ALTER TABLE [dbo].[pt_department] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_dict
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_dict]
-- ----------------------------
ALTER TABLE [dbo].[pt_dict] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_group
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_group]
-- ----------------------------
ALTER TABLE [dbo].[pt_group] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_grouprole
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_grouprole]
-- ----------------------------
ALTER TABLE [dbo].[pt_grouprole] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_menu
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_menu]
-- ----------------------------
ALTER TABLE [dbo].[pt_menu] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_module
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_module]
-- ----------------------------
ALTER TABLE [dbo].[pt_module] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_operator
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_operator]
-- ----------------------------
ALTER TABLE [dbo].[pt_operator] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_param
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_param]
-- ----------------------------
ALTER TABLE [dbo].[pt_param] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_resources
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_resources]
-- ----------------------------
ALTER TABLE [dbo].[pt_resources] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_role
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_role]
-- ----------------------------
ALTER TABLE [dbo].[pt_role] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_roleOperator
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_roleOperator]
-- ----------------------------
ALTER TABLE [dbo].[pt_roleOperator] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_station
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_station]
-- ----------------------------
ALTER TABLE [dbo].[pt_station] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_stationOperator
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_stationOperator]
-- ----------------------------
ALTER TABLE [dbo].[pt_stationOperator] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_syslog
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_syslog]
-- ----------------------------
ALTER TABLE [dbo].[pt_syslog] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_systems
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_systems]
-- ----------------------------
ALTER TABLE [dbo].[pt_systems] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_upload
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_upload]
-- ----------------------------
ALTER TABLE [dbo].[pt_upload] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_user
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_user]
-- ----------------------------
ALTER TABLE [dbo].[pt_user] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_usergroup
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_usergroup]
-- ----------------------------
ALTER TABLE [dbo].[pt_usergroup] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table pt_userinfo
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[pt_userinfo]
-- ----------------------------
ALTER TABLE [dbo].[pt_userinfo] ADD PRIMARY KEY ([ids])
GO

-- ----------------------------
-- Indexes structure for table test_blog
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[test_blog]
-- ----------------------------
ALTER TABLE [dbo].[test_blog] ADD PRIMARY KEY ([ids])
GO
