
/* Drop Indexes */

DROP INDEX [onemanyindex] ON [pt_operator];
DROP INDEX [returnparamkeysindex] ON [pt_operator];
DROP INDEX [returnurlindex] ON [pt_operator];
DROP INDEX [rowfilterindex] ON [pt_operator];
DROP INDEX [urlindex] ON [pt_operator];
DROP INDEX [usernameindex] ON [pt_user];
DROP INDEX [bloodgroupindex] ON [pt_userinfo];
DROP INDEX [emailindex] ON [pt_userinfo];
DROP INDEX [msnindex] ON [pt_userinfo];
DROP INDEX [nativityaddressindex] ON [pt_userinfo];
DROP INDEX [postboyindex] ON [pt_userinfo];
DROP INDEX [schoolnameindex] ON [pt_userinfo];
DROP INDEX [specialityindex] ON [pt_userinfo];



/* Drop Tables */

IF ObJECt_ID('[pt_department]') IS NOT NULL DROP TABLE [pt_department];
IF ObJECt_ID('[pt_dict]') IS NOT NULL DROP TABLE [pt_dict];
IF ObJECt_ID('[pt_group]') IS NOT NULL DROP TABLE [pt_group];
IF ObJECt_ID('[pt_grouprole]') IS NOT NULL DROP TABLE [pt_grouprole];
IF ObJECt_ID('[pt_menu]') IS NOT NULL DROP TABLE [pt_menu];
IF ObJECt_ID('[pt_module]') IS NOT NULL DROP TABLE [pt_module];
IF ObJECt_ID('[pt_operator]') IS NOT NULL DROP TABLE [pt_operator];
IF ObJECt_ID('[pt_param]') IS NOT NULL DROP TABLE [pt_param];
IF ObJECt_ID('[pt_resources]') IS NOT NULL DROP TABLE [pt_resources];
IF ObJECt_ID('[pt_role]') IS NOT NULL DROP TABLE [pt_role];
IF ObJECt_ID('[pt_roleOperator]') IS NOT NULL DROP TABLE [pt_roleOperator];
IF ObJECt_ID('[pt_station]') IS NOT NULL DROP TABLE [pt_station];
IF ObJECt_ID('[pt_stationOperator]') IS NOT NULL DROP TABLE [pt_stationOperator];
IF ObJECt_ID('[pt_syslog]') IS NOT NULL DROP TABLE [pt_syslog];
IF ObJECt_ID('[pt_systems]') IS NOT NULL DROP TABLE [pt_systems];
IF ObJECt_ID('[pt_upload]') IS NOT NULL DROP TABLE [pt_upload];
IF ObJECt_ID('[pt_user]') IS NOT NULL DROP TABLE [pt_user];
IF ObJECt_ID('[pt_usergroup]') IS NOT NULL DROP TABLE [pt_usergroup];
IF ObJECt_ID('[pt_userinfo]') IS NOT NULL DROP TABLE [pt_userinfo];




/* Create Tables */

-- 部门表
CREATE TABLE [pt_department]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 所有子节点
	[allchildnodeids] varchar(2000),
	-- 节点级别
	[departmentlevel] bigint,
	-- 部门类型
	[depttype] char,
	-- 描述
	[description] varchar(200),
	-- 图片
	[images] varchar(50),
	-- 是否上级节点
	[isparent] varchar(5),
	-- 部门名称
	[names] varchar(25),
	-- 排序号
	[orderids] bigint,
	-- url
	[url] varchar(100),
	-- 上级部门ids
	[parentdepartmentids] varchar(32),
	-- 部门负责人
	[principaluserids] varchar(32),
	PRIMARY KEY ([ids])
);


-- 字典表
CREATE TABLE [pt_dict]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 描述
	[description] varchar(200),
	-- 图片
	[images] varchar(50),
	-- 部门名称
	[names] varchar(25),
	-- 排序号
	[orderids] bigint,
	-- paths
	[paths] varchar(1000),
	-- 状态
	[zhuangtai] char,
	-- 上级节点ids
	[parentids] varchar(32),
	-- 是否上级节点
	[isparent] varchar(5),
	-- 层级级别
	[levels] bigint,
	-- 编号
	[numbers] varchar(50),
	-- 值
	[val] varchar(500),
	-- 是否国际化 : 是否国际化
	[i18n] char,
	-- 中文简体
	[val_zhcn] varchar(500),
	-- 中文香港
	[val_zhhk] varchar(500),
	-- 中文台湾
	[val_zhtw] varchar(500),
	-- 日文
	[val_ja] varchar(500),
	-- 英文
	[val_enus] varchar(500),
	-- 状态
	[status] char,
	PRIMARY KEY ([ids])
);


-- 用户分组表
CREATE TABLE [pt_group]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 描述
	[description] varchar(2000),
	-- 名称
	[names] varchar(50),
	-- 角色ids
	[roleids] text,
	-- 编号
	[numbers] varchar(50),
	PRIMARY KEY ([ids])
);


-- 分组角色
CREATE TABLE [pt_grouprole]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 分组ids
	[groupids] varchar(32),
	-- 角色ids
	[roleids] varchar(32),
	PRIMARY KEY ([ids])
);


-- 菜单表
CREATE TABLE [pt_menu]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 图片
	[images] varchar(50),
	-- 层级级别
	[levels] bigint,
	-- 排序号
	[orderids] bigint,
	-- 功能ids
	[operatorids] varchar(32),
	-- 上级菜单ids
	[parentmenuids] varchar(32),
	-- 所属系统ids
	[systemsids] varchar(32),
	-- 是否上级节点
	[isparent] varchar(5),
	-- names_zhcn
	[names_zhcn] varchar(25),
	-- names_zhhk
	[names_zhhk] varchar(25),
	-- names_zhtw
	[names_zhtw] varchar(25),
	-- names_enus
	[names_enus] varchar(25),
	-- names_ja
	[names_ja] varchar(25),
	-- 菜单链接点击参数
	[param] varchar(200),
	PRIMARY KEY ([ids])
);


-- 功能模块表
CREATE TABLE [pt_module]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 描述
	[description] varchar(200),
	-- 图片
	[images] varchar(50),
	-- 是否上级节点
	[isparent] varchar(5),
	-- 部门名称
	[names] varchar(25),
	-- 排序号
	[orderids] bigint,
	-- 上级模块ids
	[parentmoduleids] varchar(32),
	-- 所属系统ids
	[systemsids] varchar(32),
	PRIMARY KEY ([ids])
);


-- 功能表
CREATE TABLE [pt_operator]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 描述
	[description] varchar(200),
	-- 部门名称
	[names] varchar(25),
	-- url数量 : 功能url一个还是多个，多个用逗号隔开
	[onemany] char,
	-- 返回参数key : 返回参数key,多个逗号隔开
	[returnparamkeys] varchar(100),
	-- 返回目标url地址
	[returnurl] varchar(200),
	-- 是否行过滤
	[rowfilter] char,
	-- 功能url
	[url] varchar(200),
	-- 所属模块
	[moduleids] varchar(32),
	-- 模块名称
	[modulenames] varchar(50),
	-- 是否分页
	[splitpage] char,
	-- 表单token : 是否验证表单重复提交
	[formtoken] char,
	-- IP黑名单 : 是否验证IP
	[ipblack] char,
	-- 是否权限验证
	[privilegess] char,
	-- 是否统计PV
	[ispv] char,
	-- pv类型
	[pvtype] char,
	PRIMARY KEY ([ids])
);


-- 参数表
CREATE TABLE [pt_param]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 描述
	[description] varchar(200),
	-- 图片
	[images] varchar(50),
	-- 部门名称
	[names] varchar(25),
	-- 排序号
	[orderids] bigint,
	-- paths
	[paths] varchar(1000),
	-- 状态
	[zhuangtai] char,
	-- 上级节点ids
	[parentids] varchar(32),
	-- 是否上级节点
	[isparent] varchar(5),
	-- 层级级别
	[levels] bigint,
	-- 编号
	[numbers] varchar(50),
	-- 值
	[val] varchar(500),
	-- 是否国际化 : 是否国际化
	[i18n] char,
	-- 中文简体
	[val_zhcn] varchar(500),
	-- 中文香港
	[val_zhhk] varchar(500),
	-- 中文台湾
	[val_zhtw] varchar(500),
	-- 日文
	[val_ja] varchar(500),
	-- 英文
	[val_enus] varchar(500),
	-- 状态
	[status] char,
	PRIMARY KEY ([ids])
);


-- 资源负载表
CREATE TABLE [pt_resources]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 系统名称
	[osname] varchar(200),
	-- IP地址
	[ips] varchar(50),
	-- 主机名
	[hostname] varchar(200),
	-- cpu数量
	[cpunumber] bigint,
	-- cpu负载
	[cpuratio] decimal(20,10),
	-- 物理内存大小
	[phymemory] bigint,
	-- 内存可用大小
	[phyfreememory] bigint,
	-- jvm总内存
	[jvmtotalmemory] bigint,
	-- jvm可用内存
	[jvmfreememory] bigint,
	-- jvm最大内存
	[jvmmaxmemory] bigint,
	-- gc次数
	[gccount] bigint,
	-- 创建时间
	[createdate] datetime,
	PRIMARY KEY ([ids])
);


-- 角色表
CREATE TABLE [pt_role]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 编号
	[numbers] varchar(50),
	-- 名称
	[names] varchar(50),
	-- 描述
	[description] varchar(2000),
	-- 权限功能ids
	[operatorids] text,
	-- 权限功能模块ids
	[moduleids] text,
	PRIMARY KEY ([ids])
);


-- 角色功能
CREATE TABLE [pt_roleOperator]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 角色ids
	[roleIds] varchar(32),
	-- 功能ids
	[operatorIds] varchar(32),
	PRIMARY KEY ([ids])
);


-- 岗位表
CREATE TABLE [pt_station]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 描述
	[description] varchar(200),
	-- 图片
	[images] varchar(50),
	-- 是否上级节点
	[isparent] varchar(5),
	-- 部门名称
	[names] varchar(25),
	-- 排序号
	[orderids] bigint,
	-- 上级岗位ids
	[parentstationids] varchar(32),
	-- 权限功能ids
	[operatorids] text,
	-- 权限功能模块ids
	[moduleids] text,
	PRIMARY KEY ([ids])
);


-- 岗位功能
CREATE TABLE [pt_stationOperator]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 岗位ids
	[stationids] varchar(32),
	-- 功能ids
	[operatorids] varchar(32),
	PRIMARY KEY ([ids])
);


-- 日志表
CREATE TABLE [pt_syslog]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 开始时间
	[startdate] datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 开始时间
	[starttime] bigint,
	-- 结束时间
	[enddate] datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 结束时间
	[endtime] bigint,
	-- action结束时间
	[actionenddate] datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- action结束时间
	[actionendtime] bigint,
	-- action开始时间
	[actionstartdate] datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- action开始时间
	[actionstarttime] bigint,
	-- action耗时
	[actionhaoshi] bigint,
	-- 视图耗时
	[viewhaoshi] bigint,
	-- 总耗时
	[haoshi] bigint,
	-- cause
	[cause] char,
	-- cookie
	[cookie] varchar(1024),
	-- 描述
	[description] text,
	-- ip地址
	[ips] varchar(128),
	-- 请求方法类型 : get 、 post
	[method] varchar(4),
	-- referer
	[referer] varchar(500),
	-- 请求路径
	[requestpath] text,
	-- 状态
	[status] char,
	-- useragent
	[useragent] varchar(1000),
	-- 功能ids
	[operatorids] varchar(32),
	-- accept
	[accept] varchar(200),
	-- acceptencoding
	[acceptencoding] varchar(200),
	-- acceptlanguage
	[acceptlanguage] varchar(200),
	-- connection
	[connection] varchar(200),
	-- host
	[host] varchar(200),
	-- xrequestedwith
	[xrequestedwith] varchar(200),
	-- pvids
	[pvids] varchar(32),
	-- 操作人ids
	[userids] varchar(32),
	PRIMARY KEY ([ids])
);


-- 系统表
CREATE TABLE [pt_systems]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 描述
	[description] varchar(200),
	-- 部门名称
	[names] varchar(25),
	-- numbers
	[numbers] varchar(25),
	-- 排序号
	[orderids] bigint,
	PRIMARY KEY ([ids])
);


-- 文件上传表
CREATE TABLE [pt_upload]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- parametername
	[parametername] varchar(50),
	-- filename
	[filename] varchar(50),
	-- contenttype
	[contenttype] varchar(100),
	-- originalfilename
	[originalfilename] varchar(500),
	-- path
	[path] varchar(500),
	PRIMARY KEY ([ids])
);


-- 用户表
CREATE TABLE [pt_user]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- 排序号
	[orderids] bigint,
	-- 密码
	[password] varbinary(100),
	-- 密码错误次数
	[errorcount] bigint,
	-- 密钥
	[salt] varbinary(1000),
	-- 状态
	[status] char,
	-- 账号停用时间
	[stopdate] datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 账号
	[username] varchar(50),
	-- 部门ids
	[departmentids] varchar(32),
	-- 部门names
	[departmentnames] varchar(25),
	-- 用户扩展信息ids
	[userinfoids] varchar(32),
	-- 岗位ids
	[stationids] text,
	-- 岗位名称
	[stationnames] text,
	-- 行级过滤部门ids
	[deptids] text,
	-- 行级过滤部门names
	[deptnames] text,
	-- 行级过滤用户ids
	[userids] text,
	-- 行级过滤用户names
	[usernames] text,
	-- 所在组ids
	[groupids] text,
	-- 所在组names
	[groupnames] text,
	PRIMARY KEY ([ids])
);


-- 用户分组
CREATE TABLE [pt_usergroup]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 用户ids
	[userids] varchar(32),
	-- 分组ids
	[groupids] varchar(32),
	PRIMARY KEY ([ids])
);


-- pt_userinfo
CREATE TABLE [pt_userinfo]
(
	-- 主键
	[ids] varchar(32) NOT NULL,
	-- 版本号
	[version] bigint,
	-- address
	[address] varchar(300),
	-- addressinfo
	[addressinfo] varchar(300),
	-- avoirdupois
	[avoirdupois] varchar(5),
	-- birthday
	[birthday] date,
	-- bloodgroup
	[bloodgroup] varchar(15),
	-- clientlevelend
	[clientlevelend] datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- clientlevelstart
	[clientlevelstart] datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- culture
	[culture] varchar(30),
	-- 描述
	[description] varchar(200),
	-- email
	[email] varchar(100),
	-- finishschooldate
	[finishschooldate] date,
	-- folk
	[folk] varchar(20),
	-- government
	[government] varchar(25),
	-- homepage
	[homepage] varchar(100),
	-- householder
	[householder] varchar(20),
	-- idcard
	[idcard] varchar(25),
	-- marriage
	[marriage] varchar(20),
	-- mobile
	[mobile] varchar(20),
	-- msn
	[msn] varchar(20),
	-- 部门名称
	[names] varchar(25),
	-- nativityaddress
	[nativityaddress] varchar(20),
	-- postboy
	[postboy] varchar(6),
	-- qq
	[qq] varchar(20),
	-- schoolname
	[schoolname] varchar(20),
	-- sex
	[sex] varchar(5),
	-- speciality
	[speciality] varchar(20),
	-- stature
	[stature] varchar(5),
	-- telephone
	[telephone] varchar(20),
	PRIMARY KEY ([ids])
);



/* Create Indexes */

CREATE INDEX [onemanyindex] ON [pt_operator] USING BTREE ([onemany]);
CREATE INDEX [returnparamkeysindex] ON [pt_operator] USING BTREE ([returnparamkeys]);
CREATE INDEX [returnurlindex] ON [pt_operator] USING BTREE ([returnurl]);
CREATE INDEX [rowfilterindex] ON [pt_operator] USING BTREE ([rowfilter]);
CREATE INDEX [urlindex] ON [pt_operator] USING BTREE ([url]);
CREATE INDEX [usernameindex] ON [pt_user] USING BTREE ([username]);
CREATE INDEX [bloodgroupindex] ON [pt_userinfo] USING BTREE ([bloodgroup]);
CREATE INDEX [emailindex] ON [pt_userinfo] USING BTREE ([email]);
CREATE INDEX [msnindex] ON [pt_userinfo] USING BTREE ([msn]);
CREATE INDEX [nativityaddressindex] ON [pt_userinfo] USING BTREE ([nativityaddress]);
CREATE INDEX [postboyindex] ON [pt_userinfo] USING BTREE ([postboy]);
CREATE INDEX [schoolnameindex] ON [pt_userinfo] USING BTREE ([schoolname]);
CREATE INDEX [specialityindex] ON [pt_userinfo] USING BTREE ([speciality]);



