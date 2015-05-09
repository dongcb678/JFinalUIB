
/* Drop Indexes */

DROP INDEX IF EXISTS onemanyindex;
DROP INDEX IF EXISTS returnparamkeysindex;
DROP INDEX IF EXISTS returnurlindex;
DROP INDEX IF EXISTS rowfilterindex;
DROP INDEX IF EXISTS urlindex;
DROP INDEX IF EXISTS usernameindex;
DROP INDEX IF EXISTS bloodgroupindex;
DROP INDEX IF EXISTS emailindex;
DROP INDEX IF EXISTS msnindex;
DROP INDEX IF EXISTS nativityaddressindex;
DROP INDEX IF EXISTS postboyindex;
DROP INDEX IF EXISTS schoolnameindex;
DROP INDEX IF EXISTS specialityindex;



/* Drop Tables */

DROP TABLE IF EXISTS public.pt_department;
DROP TABLE IF EXISTS public.pt_dict;
DROP TABLE IF EXISTS public.pt_group;
DROP TABLE IF EXISTS public.pt_menu;
DROP TABLE IF EXISTS public.pt_module;
DROP TABLE IF EXISTS public.pt_operator;
DROP TABLE IF EXISTS public.pt_param;
DROP TABLE IF EXISTS public.pt_resources;
DROP TABLE IF EXISTS public.pt_role;
DROP TABLE IF EXISTS public.pt_station;
DROP TABLE IF EXISTS public.pt_syslog;
DROP TABLE IF EXISTS public.pt_systems;
DROP TABLE IF EXISTS public.pt_upload;
DROP TABLE IF EXISTS public.pt_user;
DROP TABLE IF EXISTS public.pt_userinfo;
DROP TABLE IF EXISTS public.wx_article;
DROP TABLE IF EXISTS public.wx_file;
DROP TABLE IF EXISTS public.wx_group;
DROP TABLE IF EXISTS public.wx_keyword;
DROP TABLE IF EXISTS public.wx_location;
DROP TABLE IF EXISTS public.wx_message;
DROP TABLE IF EXISTS public.wx_role;
DROP TABLE IF EXISTS public.wx_user;




/* Create Tables */

-- 部门表
CREATE TABLE public.pt_department
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 所有子节点ids
	allchildnodeids varchar(2000),
	-- 部门级别
	departmentlevel bigint,
	-- 部门类型
	depttype char,
	-- 描述
	description varchar(200),
	-- 图标
	images varchar(50),
	-- 是否上级节点
	isparent varchar(5),
	-- 名称
	names varchar(25),
	-- 排序号
	orderids bigint,
	-- url
	url varchar(100),
	-- 上级ids
	parentdepartmentids varchar(32),
	-- 负责人ids
	principaluserids varchar(32),
	CONSTRAINT pt_department_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 字典表
CREATE TABLE public.pt_dict
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 描述
	description varchar(200),
	-- 图标
	images varchar(50),
	-- 名称
	names varchar(25),
	-- 排序号
	orderids bigint,
	-- tree路径
	paths varchar(1000),
	-- 状态
	zhuangtai char,
	-- 上级ids
	parentids varchar(32),
	-- 是否上级节点
	isparent varchar(5),
	-- 层级级别
	levels bigint,
	-- 编号
	numbers varchar(50),
	-- 值
	val varchar(500),
	-- 是否国际化 : 0否1是
	i18n char,
	-- 中文简体值
	val_zhcn varchar(500),
	-- 中文香港值
	val_zhhk varchar(500),
	-- 中文台湾值
	val_zhtw varchar(500),
	-- 日文值
	val_ja varchar(500),
	-- 英文值
	val_enus varchar(500),
	-- 账号状态
	status char,
	CONSTRAINT portal_common_fenleishu_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- pt_group
CREATE TABLE public.pt_group
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 名称
	names varchar(50),
	-- 编号
	numbers varchar(50),
	-- 拥有的角色ids
	roleids text,
	-- 描述
	description varchar(2000),
	CONSTRAINT pt_group_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 菜单表
CREATE TABLE public.pt_menu
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 图标
	images varchar(50),
	-- 层级级别
	levels bigint,
	-- 排序号
	orderids bigint,
	-- 菜单对应功能ids
	operatorids varchar(32),
	-- 上级菜单ids
	parentmenuids varchar(32),
	-- 所属系统ids
	systemsids varchar(32),
	-- 是否上级节点
	isparent varchar(5),
	-- 名称中文简体
	names_zhcn varchar(25),
	-- 名称中文台湾
	names_zhtw varchar(25),
	-- 名称中文香港
	names_zhhk varchar(25),
	-- 名称日文
	names_ja varchar(25),
	-- 名称英文
	names_enus varchar(25),
	CONSTRAINT pt_menu_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 模块表
CREATE TABLE public.pt_module
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 名称
	names varchar(25),
	-- 上级模块ids
	parentmoduleids varchar(32),
	-- 所属系统ids
	systemsids varchar(32),
	-- 排序号
	orderids bigint,
	-- 图标
	images varchar(50),
	-- 描述
	description varchar(200),
	-- 是否上级节点
	isparent varchar(5),
	CONSTRAINT pt_module_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 功能表
CREATE TABLE public.pt_operator
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 名称
	names varchar(25),
	-- url
	url varchar(200),
	-- 描述
	description varchar(200),
	-- url数量 : 一个还是多个url，多个用逗号隔开
	onemany char,
	-- 返回参数keys
	returnparamkeys varchar(100),
	-- 返回url
	returnurl varchar(200),
	-- 是否行级过滤
	rowfilter char,
	-- 模块ids
	moduleids varchar(32),
	-- 模块names
	modulenames varchar(50),
	-- 是否分页
	splitpage char,
	-- 是否重复提交验证
	formtoken char,
	-- ip黑名单过滤
	ipblack char,
	-- 是否需要权限验证
	privilegess char,
	-- 是否记录PV
	ispv char,
	-- pv类型
	pvtype char,
	CONSTRAINT pt_operator_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 参数表
CREATE TABLE public.pt_param
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 描述
	description varchar(200),
	-- 图标
	images varchar(50),
	-- 名称
	names varchar(25),
	-- 排序号
	orderids bigint,
	-- tree路径
	paths varchar(1000),
	-- 状态
	zhuangtai char,
	-- 上级ids
	parentids varchar(32),
	-- 是否上级节点
	isparent varchar(5),
	-- 层级级别
	levels bigint,
	-- 编号
	numbers varchar(50),
	-- 值
	val varchar(500),
	-- 是否国际化 : 0否1是
	i18n char,
	-- 中文简体值
	val_zhcn varchar(500),
	-- 中文香港值
	val_zhhk varchar(500),
	-- 中文台湾值
	val_zhtw varchar(500),
	-- 日文值
	val_ja varchar(500),
	-- 英文值
	val_enus varchar(500),
	-- 账号状态
	status char,
	CONSTRAINT pt_param_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 资源表
CREATE TABLE public.pt_resources
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 系统名称
	osname varchar(200),
	-- ip地址
	ips varchar(50),
	-- 主机名称
	hostname varchar(200),
	-- cpu数量
	cpunumber bigint,
	-- cpu使用率
	cpuratio numeric(20,10),
	-- 物理内存
	phymemory bigint,
	-- 物理可用内存
	phyfreememory bigint,
	-- jvm总内存
	jvmtotalmemory bigint,
	-- jvm可用内存
	jvmfreememory bigint,
	-- jvm最大内存
	jvmmaxmemory bigint,
	-- gc次数
	gccount bigint,
	-- 创建时间
	createdate timestamp with time zone,
	CONSTRAINT pt_resources_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 角色表
CREATE TABLE public.pt_role
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 名称
	names varchar(50),
	-- 描述
	description varchar(2000),
	-- 编号
	numbers varchar(50),
	-- 拥有的功能模块ids
	moduleids text,
	-- 拥有的功能ids
	operatorids text,
	CONSTRAINT pt_role_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 岗位表
CREATE TABLE public.pt_station
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 名称
	names varchar(25),
	-- 上级岗位ids
	parentstationids varchar(32),
	-- 是否上级节点
	isparent varchar(5),
	-- 图标
	images varchar(50),
	-- 描述
	description varchar(200),
	-- 排序号
	orderids bigint,
	-- 拥有的功能ids
	operatorids text,
	-- 拥有的功能模块ids
	moduleids text,
	CONSTRAINT pt_station_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 日志表
CREATE TABLE public.pt_syslog
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- action结束时间
	actionenddate timestamp,
	-- action结束时间
	actionendtime bigint,
	-- action耗时
	actionhaoshi bigint,
	-- action开始时间
	actionstartdate timestamp,
	-- action开始时间
	actionstarttime bigint,
	-- 失败原因 : 0没有权限,1URL不存在,2未登录,3业务代码异常
	cause char,
	-- cookie数据
	cookie varchar(1024),
	-- 描述
	description text,
	-- 结束时间
	enddate timestamp,
	-- 结束时间
	endtime bigint,
	-- 耗时
	haoshi bigint,
	-- 客户端ip
	ips varchar(128),
	-- 访问方法
	method varchar(4),
	-- 源引用
	referer varchar(500),
	-- 请求路径
	requestpath text,
	-- 开始时间
	startdate timestamp,
	-- 开始时间
	starttime bigint,
	-- 账号状态
	status char,
	-- useragent
	useragent varchar(1000),
	-- 视图耗时
	viewhaoshi bigint,
	-- 菜单对应功能ids
	operatorids varchar(32),
	-- accept
	accept varchar(200),
	-- acceptencoding
	acceptencoding varchar(200),
	-- acceptlanguage
	acceptlanguage varchar(200),
	-- connection
	connection varchar(200),
	-- host
	host varchar(200),
	-- xrequestedwith
	xrequestedwith varchar(200),
	-- pvids
	pvids varchar(32),
	-- 访问用户ids
	userids varchar(32),
	CONSTRAINT pt_syslog_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 系统表
CREATE TABLE public.pt_systems
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 名称
	names varchar(25),
	-- 编号
	numbers varchar(25),
	-- 排序号
	orderids bigint,
	-- 描述
	description varchar(200),
	CONSTRAINT pt_system_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 文件上传表
CREATE TABLE public.pt_upload
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 参数key
	parametername varchar(50),
	-- 文件名
	filename varchar(50),
	-- contenttype
	contenttype varchar(100),
	-- 原文件名
	originalfilename varchar(500),
	-- 存放路径
	path varchar(500),
	CONSTRAINT pt_upload_ids PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 用户表
CREATE TABLE public.pt_user
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 账号
	username varchar(50),
	-- 用户扩展信息ids
	userinfoids varchar(32),
	-- 密码连续错误次数
	errorcount bigint,
	-- 排序号
	orderids bigint,
	-- 密码
	password bytea,
	-- 密钥
	salt bytea,
	-- 账号状态
	status char,
	-- 账号停用时间
	stopdate timestamp,
	-- 所在部门ids
	departmentids varchar(32),
	-- 所在部门names
	departmentnames varchar(25),
	-- 所在分组ids
	groupids text,
	-- 所在分组names
	groupnames text,
	-- 所在岗位ids
	stationids text,
	-- 所在岗位names
	stationnames text,
	-- 行级部门ids
	deptids text,
	-- 行级部门names
	deptnames text,
	-- 行级人员ids
	userids text,
	-- 行级人员names
	usernames text,
	CONSTRAINT pt_user_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 用户扩展信息表
CREATE TABLE public.pt_userinfo
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 版本号
	version bigint,
	-- 名称
	names varchar(25),
	-- 性别
	sex varchar(5),
	-- 生日
	birthday date,
	-- 身份证号
	idcard varchar(25),
	-- 手机号
	mobile varchar(20),
	-- 邮箱
	email varchar(100),
	-- 电话
	telephone varchar(20),
	-- 地址
	address varchar(300),
	-- 地址扩展
	addressinfo varchar(300),
	-- 邮编
	postboy varchar(6),
	-- 主页
	homepage varchar(100),
	-- 学校名称
	schoolname varchar(20),
	-- 毕业时间
	finishschooldate date,
	-- 体重
	avoirdupois varchar(5),
	-- 血型
	bloodgroup varchar(15),
	-- clientlevelend
	clientlevelend timestamp,
	-- clientlevelstart
	clientlevelstart timestamp,
	-- 文化程度
	culture varchar(30),
	-- 描述
	description varchar(200),
	-- 民族
	folk varchar(20),
	-- 政治面貌
	government varchar(25),
	-- 户口所在地
	householder varchar(20),
	-- 婚姻状况
	marriage varchar(20),
	-- msn账号
	msn varchar(20),
	-- qq账号
	qq varchar(20),
	-- 出生地
	nativityaddress varchar(20),
	-- 专业
	speciality varchar(20),
	-- 身高
	stature varchar(5),
	CONSTRAINT pt_userinfo_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- wx_article
CREATE TABLE public.wx_article
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- messageids
	messageids varchar(32),
	-- title
	title varchar(100),
	-- 描述
	description text,
	-- picurl : 图片链接，支持JPG、PNG格式，较好的效果为大图640*320，小图80*80
	picurl varchar(500),
	-- 链接 : 点击图文消息跳转链接
	url varchar(500),
	CONSTRAINT wx_article_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- wx_file
CREATE TABLE public.wx_file
(
	-- 主键
	ids varchar(32) NOT NULL,
	CONSTRAINT wx_file_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- wx_group
CREATE TABLE public.wx_group
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- id
	id varchar(50),
	-- name
	name varchar(50),
	-- count
	count numeric(20),
	CONSTRAINT wx_group_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- wx_keyword
CREATE TABLE public.wx_keyword
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 问题
	question varchar(500),
	-- 问题关键字
	questionkey varchar(500),
	-- 答案
	answer text,
	CONSTRAINT wx_keyword_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- wx_location
CREATE TABLE public.wx_location
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- open_id
	open_id varchar(32),
	-- lng
	lng varchar(50),
	-- lat
	lat varchar(50),
	-- bd09_lng
	bd09_lng varchar(50),
	-- bd09_lat
	bd09_lat varchar(50),
	-- createdate
	createdate timestamp,
	CONSTRAINT wx_userlocation_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- wx_message
CREATE TABLE public.wx_message
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- inouts : 0接收，1发出
	inouts char,
	-- datatype : 数据类型：XML或者JSON，0表示XML，1表示JSON
	datatype char,
	-- datacontent : 接收或者发出的数据xml或者json
	datacontent text,
	-- 创建时间
	createdate timestamp with time zone,
	-- msgtype
	msgtype varchar(50),
	-- event
	event varchar(50),
	-- eventkey
	eventkey varchar(50),
	-- tousername
	tousername varchar(50),
	-- fromusername : 发送方帐号（一个OpenID）
	fromusername varchar(50),
	-- createtime : 消息创建时间 （11位整型）
	createtime numeric(20),
	-- msgid : 消息id，64位整型
	msgid numeric(64),
	-- picurl : 图片链接
	picurl varchar(500),
	-- mediaid : 图片消息媒体id，可以调用多媒体文件下载接口拉取数据
	mediaid varchar(500),
	-- title : 消息标题
	title varchar(100),
	-- description : 消息描述
	description text,
	-- url : 消息链接
	url varchar(500),
	-- location_x : 地理位置维度
	location_x numeric(20,10),
	-- location_y : 地理位置经度
	location_y numeric(20,10),
	-- scale : 地图缩放大小
	scale numeric(20),
	-- labels : 地理位置信息
	labels varchar(50),
	-- content : 文本消息内容
	content text,
	-- thumbmediaid : 视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
	thumbmediaid varchar(500),
	-- format : 语音格式，如amr，speex等
	format varchar(20),
	-- recognition : 语音识别结果，UTF8编码
	recognition text,
	-- latitude : 地理位置纬度
	latitude numeric(20,10),
	-- longitude : 地理位置经度
	longitude numeric(20,10),
	-- precisions : 地理位置精度
	precisions numeric(20,10),
	-- ticket : 二维码的ticket，可用来换取二维码图片
	ticket text,
	-- musicurl : 音乐链接
	musicurl varchar(500),
	-- hqmusicurl : 高质量音乐链接，WIFI环境优先使用该链接播放音乐
	hqmusicurl varchar(500),
	-- articlecount : 图文消息个数，限制为10条以内
	articlecount numeric(2),
	CONSTRAINT wx_message_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- wx_role
CREATE TABLE public.wx_role
(
	-- 主键
	ids varchar(32) NOT NULL,
	CONSTRAINT wx_role_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;


-- wx_user
CREATE TABLE public.wx_user
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 用户的标识 : 用户的标识
	openid varchar(50),
	-- 关注状态 : 关注状态（1是关注，0是未关注），未关注时获取不到其余信息
	subscribe char,
	-- 用户关注时间 : 用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间
	subscribetime numeric(20),
	-- 昵称
	nickname varchar(50),
	-- sex : 用户的性别（1是男性，2是女性，0是未知）
	sex char,
	-- country : 用户所在国家
	country varchar(50),
	-- province : 用户所在省份
	province varchar(50),
	-- city : 用户所在城市
	city varchar(50),
	-- language : 用户的语言，简体中文为zh_CN
	language varchar(50),
	-- headimgurl : 用户头像
	headimgurl varchar(500),
	-- groupids
	groupids varchar(32),
	CONSTRAINT wx_user_pkey PRIMARY KEY (ids)
) WITHOUT OIDS;



/* Create Indexes */

CREATE INDEX onemanyindex ON public.pt_operator USING BTREE (onemany);
CREATE INDEX returnparamkeysindex ON public.pt_operator USING BTREE (returnparamkeys);
CREATE INDEX returnurlindex ON public.pt_operator USING BTREE (returnurl);
CREATE INDEX rowfilterindex ON public.pt_operator USING BTREE (rowfilter);
CREATE INDEX urlindex ON public.pt_operator USING BTREE (url);
CREATE INDEX usernameindex ON public.pt_user USING BTREE (username);
CREATE INDEX bloodgroupindex ON public.pt_userinfo USING BTREE (bloodgroup);
CREATE INDEX emailindex ON public.pt_userinfo USING BTREE (email);
CREATE INDEX msnindex ON public.pt_userinfo USING BTREE (msn);
CREATE INDEX nativityaddressindex ON public.pt_userinfo USING BTREE (nativityaddress);
CREATE INDEX postboyindex ON public.pt_userinfo USING BTREE (postboy);
CREATE INDEX schoolnameindex ON public.pt_userinfo USING BTREE (schoolname);
CREATE INDEX specialityindex ON public.pt_userinfo USING BTREE (speciality);



/* Comments */

COMMENT ON TABLE public.pt_department IS '部门表';
COMMENT ON COLUMN public.pt_department.ids IS '主键';
COMMENT ON COLUMN public.pt_department.version IS '版本号';
COMMENT ON COLUMN public.pt_department.allchildnodeids IS '所有子节点ids';
COMMENT ON COLUMN public.pt_department.departmentlevel IS '部门级别';
COMMENT ON COLUMN public.pt_department.depttype IS '部门类型';
COMMENT ON COLUMN public.pt_department.description IS '描述';
COMMENT ON COLUMN public.pt_department.images IS '图标';
COMMENT ON COLUMN public.pt_department.isparent IS '是否上级节点';
COMMENT ON COLUMN public.pt_department.names IS '名称';
COMMENT ON COLUMN public.pt_department.orderids IS '排序号';
COMMENT ON COLUMN public.pt_department.url IS 'url';
COMMENT ON COLUMN public.pt_department.parentdepartmentids IS '上级ids';
COMMENT ON COLUMN public.pt_department.principaluserids IS '负责人ids';
COMMENT ON TABLE public.pt_dict IS '字典表';
COMMENT ON COLUMN public.pt_dict.ids IS '主键';
COMMENT ON COLUMN public.pt_dict.version IS '版本号';
COMMENT ON COLUMN public.pt_dict.description IS '描述';
COMMENT ON COLUMN public.pt_dict.images IS '图标';
COMMENT ON COLUMN public.pt_dict.names IS '名称';
COMMENT ON COLUMN public.pt_dict.orderids IS '排序号';
COMMENT ON COLUMN public.pt_dict.paths IS 'tree路径';
COMMENT ON COLUMN public.pt_dict.zhuangtai IS '状态';
COMMENT ON COLUMN public.pt_dict.parentids IS '上级ids';
COMMENT ON COLUMN public.pt_dict.isparent IS '是否上级节点';
COMMENT ON COLUMN public.pt_dict.levels IS '层级级别';
COMMENT ON COLUMN public.pt_dict.numbers IS '编号';
COMMENT ON COLUMN public.pt_dict.val IS '值';
COMMENT ON COLUMN public.pt_dict.i18n IS '是否国际化 : 0否1是';
COMMENT ON COLUMN public.pt_dict.val_zhcn IS '中文简体值';
COMMENT ON COLUMN public.pt_dict.val_zhhk IS '中文香港值';
COMMENT ON COLUMN public.pt_dict.val_zhtw IS '中文台湾值';
COMMENT ON COLUMN public.pt_dict.val_ja IS '日文值';
COMMENT ON COLUMN public.pt_dict.val_enus IS '英文值';
COMMENT ON COLUMN public.pt_dict.status IS '账号状态';
COMMENT ON TABLE public.pt_group IS 'pt_group';
COMMENT ON COLUMN public.pt_group.ids IS '主键';
COMMENT ON COLUMN public.pt_group.version IS '版本号';
COMMENT ON COLUMN public.pt_group.names IS '名称';
COMMENT ON COLUMN public.pt_group.numbers IS '编号';
COMMENT ON COLUMN public.pt_group.roleids IS '拥有的角色ids';
COMMENT ON COLUMN public.pt_group.description IS '描述';
COMMENT ON TABLE public.pt_menu IS '菜单表';
COMMENT ON COLUMN public.pt_menu.ids IS '主键';
COMMENT ON COLUMN public.pt_menu.version IS '版本号';
COMMENT ON COLUMN public.pt_menu.images IS '图标';
COMMENT ON COLUMN public.pt_menu.levels IS '层级级别';
COMMENT ON COLUMN public.pt_menu.orderids IS '排序号';
COMMENT ON COLUMN public.pt_menu.operatorids IS '菜单对应功能ids';
COMMENT ON COLUMN public.pt_menu.parentmenuids IS '上级菜单ids';
COMMENT ON COLUMN public.pt_menu.systemsids IS '所属系统ids';
COMMENT ON COLUMN public.pt_menu.isparent IS '是否上级节点';
COMMENT ON COLUMN public.pt_menu.names_zhcn IS '名称中文简体';
COMMENT ON COLUMN public.pt_menu.names_zhtw IS '名称中文台湾';
COMMENT ON COLUMN public.pt_menu.names_zhhk IS '名称中文香港';
COMMENT ON COLUMN public.pt_menu.names_ja IS '名称日文';
COMMENT ON COLUMN public.pt_menu.names_enus IS '名称英文';
COMMENT ON TABLE public.pt_module IS '模块表';
COMMENT ON COLUMN public.pt_module.ids IS '主键';
COMMENT ON COLUMN public.pt_module.version IS '版本号';
COMMENT ON COLUMN public.pt_module.names IS '名称';
COMMENT ON COLUMN public.pt_module.parentmoduleids IS '上级模块ids';
COMMENT ON COLUMN public.pt_module.systemsids IS '所属系统ids';
COMMENT ON COLUMN public.pt_module.orderids IS '排序号';
COMMENT ON COLUMN public.pt_module.images IS '图标';
COMMENT ON COLUMN public.pt_module.description IS '描述';
COMMENT ON COLUMN public.pt_module.isparent IS '是否上级节点';
COMMENT ON TABLE public.pt_operator IS '功能表';
COMMENT ON COLUMN public.pt_operator.ids IS '主键';
COMMENT ON COLUMN public.pt_operator.version IS '版本号';
COMMENT ON COLUMN public.pt_operator.names IS '名称';
COMMENT ON COLUMN public.pt_operator.url IS 'url';
COMMENT ON COLUMN public.pt_operator.description IS '描述';
COMMENT ON COLUMN public.pt_operator.onemany IS 'url数量 : 一个还是多个url，多个用逗号隔开';
COMMENT ON COLUMN public.pt_operator.returnparamkeys IS '返回参数keys';
COMMENT ON COLUMN public.pt_operator.returnurl IS '返回url';
COMMENT ON COLUMN public.pt_operator.rowfilter IS '是否行级过滤';
COMMENT ON COLUMN public.pt_operator.moduleids IS '模块ids';
COMMENT ON COLUMN public.pt_operator.modulenames IS '模块names';
COMMENT ON COLUMN public.pt_operator.splitpage IS '是否分页';
COMMENT ON COLUMN public.pt_operator.formtoken IS '是否重复提交验证';
COMMENT ON COLUMN public.pt_operator.ipblack IS 'ip黑名单过滤';
COMMENT ON COLUMN public.pt_operator.privilegess IS '是否需要权限验证';
COMMENT ON COLUMN public.pt_operator.ispv IS '是否记录PV';
COMMENT ON COLUMN public.pt_operator.pvtype IS 'pv类型';
COMMENT ON TABLE public.pt_param IS '参数表';
COMMENT ON COLUMN public.pt_param.ids IS '主键';
COMMENT ON COLUMN public.pt_param.version IS '版本号';
COMMENT ON COLUMN public.pt_param.description IS '描述';
COMMENT ON COLUMN public.pt_param.images IS '图标';
COMMENT ON COLUMN public.pt_param.names IS '名称';
COMMENT ON COLUMN public.pt_param.orderids IS '排序号';
COMMENT ON COLUMN public.pt_param.paths IS 'tree路径';
COMMENT ON COLUMN public.pt_param.zhuangtai IS '状态';
COMMENT ON COLUMN public.pt_param.parentids IS '上级ids';
COMMENT ON COLUMN public.pt_param.isparent IS '是否上级节点';
COMMENT ON COLUMN public.pt_param.levels IS '层级级别';
COMMENT ON COLUMN public.pt_param.numbers IS '编号';
COMMENT ON COLUMN public.pt_param.val IS '值';
COMMENT ON COLUMN public.pt_param.i18n IS '是否国际化 : 0否1是';
COMMENT ON COLUMN public.pt_param.val_zhcn IS '中文简体值';
COMMENT ON COLUMN public.pt_param.val_zhhk IS '中文香港值';
COMMENT ON COLUMN public.pt_param.val_zhtw IS '中文台湾值';
COMMENT ON COLUMN public.pt_param.val_ja IS '日文值';
COMMENT ON COLUMN public.pt_param.val_enus IS '英文值';
COMMENT ON COLUMN public.pt_param.status IS '账号状态';
COMMENT ON TABLE public.pt_resources IS '资源表';
COMMENT ON COLUMN public.pt_resources.ids IS '主键';
COMMENT ON COLUMN public.pt_resources.version IS '版本号';
COMMENT ON COLUMN public.pt_resources.osname IS '系统名称';
COMMENT ON COLUMN public.pt_resources.ips IS 'ip地址';
COMMENT ON COLUMN public.pt_resources.hostname IS '主机名称';
COMMENT ON COLUMN public.pt_resources.cpunumber IS 'cpu数量';
COMMENT ON COLUMN public.pt_resources.cpuratio IS 'cpu使用率';
COMMENT ON COLUMN public.pt_resources.phymemory IS '物理内存';
COMMENT ON COLUMN public.pt_resources.phyfreememory IS '物理可用内存';
COMMENT ON COLUMN public.pt_resources.jvmtotalmemory IS 'jvm总内存';
COMMENT ON COLUMN public.pt_resources.jvmfreememory IS 'jvm可用内存';
COMMENT ON COLUMN public.pt_resources.jvmmaxmemory IS 'jvm最大内存';
COMMENT ON COLUMN public.pt_resources.gccount IS 'gc次数';
COMMENT ON COLUMN public.pt_resources.createdate IS '创建时间';
COMMENT ON TABLE public.pt_role IS '角色表';
COMMENT ON COLUMN public.pt_role.ids IS '主键';
COMMENT ON COLUMN public.pt_role.version IS '版本号';
COMMENT ON COLUMN public.pt_role.names IS '名称';
COMMENT ON COLUMN public.pt_role.description IS '描述';
COMMENT ON COLUMN public.pt_role.numbers IS '编号';
COMMENT ON COLUMN public.pt_role.moduleids IS '拥有的功能模块ids';
COMMENT ON COLUMN public.pt_role.operatorids IS '拥有的功能ids';
COMMENT ON TABLE public.pt_station IS '岗位表';
COMMENT ON COLUMN public.pt_station.ids IS '主键';
COMMENT ON COLUMN public.pt_station.version IS '版本号';
COMMENT ON COLUMN public.pt_station.names IS '名称';
COMMENT ON COLUMN public.pt_station.parentstationids IS '上级岗位ids';
COMMENT ON COLUMN public.pt_station.isparent IS '是否上级节点';
COMMENT ON COLUMN public.pt_station.images IS '图标';
COMMENT ON COLUMN public.pt_station.description IS '描述';
COMMENT ON COLUMN public.pt_station.orderids IS '排序号';
COMMENT ON COLUMN public.pt_station.operatorids IS '拥有的功能ids';
COMMENT ON COLUMN public.pt_station.moduleids IS '拥有的功能模块ids';
COMMENT ON TABLE public.pt_syslog IS '日志表';
COMMENT ON COLUMN public.pt_syslog.ids IS '主键';
COMMENT ON COLUMN public.pt_syslog.version IS '版本号';
COMMENT ON COLUMN public.pt_syslog.actionenddate IS 'action结束时间';
COMMENT ON COLUMN public.pt_syslog.actionendtime IS 'action结束时间';
COMMENT ON COLUMN public.pt_syslog.actionhaoshi IS 'action耗时';
COMMENT ON COLUMN public.pt_syslog.actionstartdate IS 'action开始时间';
COMMENT ON COLUMN public.pt_syslog.actionstarttime IS 'action开始时间';
COMMENT ON COLUMN public.pt_syslog.cause IS '失败原因 : 0没有权限,1URL不存在,2未登录,3业务代码异常';
COMMENT ON COLUMN public.pt_syslog.cookie IS 'cookie数据';
COMMENT ON COLUMN public.pt_syslog.description IS '描述';
COMMENT ON COLUMN public.pt_syslog.enddate IS '结束时间';
COMMENT ON COLUMN public.pt_syslog.endtime IS '结束时间';
COMMENT ON COLUMN public.pt_syslog.haoshi IS '耗时';
COMMENT ON COLUMN public.pt_syslog.ips IS '客户端ip';
COMMENT ON COLUMN public.pt_syslog.method IS '访问方法';
COMMENT ON COLUMN public.pt_syslog.referer IS '源引用';
COMMENT ON COLUMN public.pt_syslog.requestpath IS '请求路径';
COMMENT ON COLUMN public.pt_syslog.startdate IS '开始时间';
COMMENT ON COLUMN public.pt_syslog.starttime IS '开始时间';
COMMENT ON COLUMN public.pt_syslog.status IS '账号状态';
COMMENT ON COLUMN public.pt_syslog.useragent IS 'useragent';
COMMENT ON COLUMN public.pt_syslog.viewhaoshi IS '视图耗时';
COMMENT ON COLUMN public.pt_syslog.operatorids IS '菜单对应功能ids';
COMMENT ON COLUMN public.pt_syslog.accept IS 'accept';
COMMENT ON COLUMN public.pt_syslog.acceptencoding IS 'acceptencoding';
COMMENT ON COLUMN public.pt_syslog.acceptlanguage IS 'acceptlanguage';
COMMENT ON COLUMN public.pt_syslog.connection IS 'connection';
COMMENT ON COLUMN public.pt_syslog.host IS 'host';
COMMENT ON COLUMN public.pt_syslog.xrequestedwith IS 'xrequestedwith';
COMMENT ON COLUMN public.pt_syslog.pvids IS 'pvids';
COMMENT ON COLUMN public.pt_syslog.userids IS '访问用户ids';
COMMENT ON TABLE public.pt_systems IS '系统表';
COMMENT ON COLUMN public.pt_systems.ids IS '主键';
COMMENT ON COLUMN public.pt_systems.version IS '版本号';
COMMENT ON COLUMN public.pt_systems.names IS '名称';
COMMENT ON COLUMN public.pt_systems.numbers IS '编号';
COMMENT ON COLUMN public.pt_systems.orderids IS '排序号';
COMMENT ON COLUMN public.pt_systems.description IS '描述';
COMMENT ON TABLE public.pt_upload IS '文件上传表';
COMMENT ON COLUMN public.pt_upload.ids IS '主键';
COMMENT ON COLUMN public.pt_upload.version IS '版本号';
COMMENT ON COLUMN public.pt_upload.parametername IS '参数key';
COMMENT ON COLUMN public.pt_upload.filename IS '文件名';
COMMENT ON COLUMN public.pt_upload.contenttype IS 'contenttype';
COMMENT ON COLUMN public.pt_upload.originalfilename IS '原文件名';
COMMENT ON COLUMN public.pt_upload.path IS '存放路径';
COMMENT ON TABLE public.pt_user IS '用户表';
COMMENT ON COLUMN public.pt_user.ids IS '主键';
COMMENT ON COLUMN public.pt_user.version IS '版本号';
COMMENT ON COLUMN public.pt_user.username IS '账号';
COMMENT ON COLUMN public.pt_user.userinfoids IS '用户扩展信息ids';
COMMENT ON COLUMN public.pt_user.errorcount IS '密码连续错误次数';
COMMENT ON COLUMN public.pt_user.orderids IS '排序号';
COMMENT ON COLUMN public.pt_user.password IS '密码';
COMMENT ON COLUMN public.pt_user.salt IS '密钥';
COMMENT ON COLUMN public.pt_user.status IS '账号状态';
COMMENT ON COLUMN public.pt_user.stopdate IS '账号停用时间';
COMMENT ON COLUMN public.pt_user.departmentids IS '所在部门ids';
COMMENT ON COLUMN public.pt_user.departmentnames IS '所在部门names';
COMMENT ON COLUMN public.pt_user.groupids IS '所在分组ids';
COMMENT ON COLUMN public.pt_user.groupnames IS '所在分组names';
COMMENT ON COLUMN public.pt_user.stationids IS '所在岗位ids';
COMMENT ON COLUMN public.pt_user.stationnames IS '所在岗位names';
COMMENT ON COLUMN public.pt_user.deptids IS '行级部门ids';
COMMENT ON COLUMN public.pt_user.deptnames IS '行级部门names';
COMMENT ON COLUMN public.pt_user.userids IS '行级人员ids';
COMMENT ON COLUMN public.pt_user.usernames IS '行级人员names';
COMMENT ON TABLE public.pt_userinfo IS '用户扩展信息表';
COMMENT ON COLUMN public.pt_userinfo.ids IS '主键';
COMMENT ON COLUMN public.pt_userinfo.version IS '版本号';
COMMENT ON COLUMN public.pt_userinfo.names IS '名称';
COMMENT ON COLUMN public.pt_userinfo.sex IS '性别';
COMMENT ON COLUMN public.pt_userinfo.birthday IS '生日';
COMMENT ON COLUMN public.pt_userinfo.idcard IS '身份证号';
COMMENT ON COLUMN public.pt_userinfo.mobile IS '手机号';
COMMENT ON COLUMN public.pt_userinfo.email IS '邮箱';
COMMENT ON COLUMN public.pt_userinfo.telephone IS '电话';
COMMENT ON COLUMN public.pt_userinfo.address IS '地址';
COMMENT ON COLUMN public.pt_userinfo.addressinfo IS '地址扩展';
COMMENT ON COLUMN public.pt_userinfo.postboy IS '邮编';
COMMENT ON COLUMN public.pt_userinfo.homepage IS '主页';
COMMENT ON COLUMN public.pt_userinfo.schoolname IS '学校名称';
COMMENT ON COLUMN public.pt_userinfo.finishschooldate IS '毕业时间';
COMMENT ON COLUMN public.pt_userinfo.avoirdupois IS '体重';
COMMENT ON COLUMN public.pt_userinfo.bloodgroup IS '血型';
COMMENT ON COLUMN public.pt_userinfo.clientlevelend IS 'clientlevelend';
COMMENT ON COLUMN public.pt_userinfo.clientlevelstart IS 'clientlevelstart';
COMMENT ON COLUMN public.pt_userinfo.culture IS '文化程度';
COMMENT ON COLUMN public.pt_userinfo.description IS '描述';
COMMENT ON COLUMN public.pt_userinfo.folk IS '民族';
COMMENT ON COLUMN public.pt_userinfo.government IS '政治面貌';
COMMENT ON COLUMN public.pt_userinfo.householder IS '户口所在地';
COMMENT ON COLUMN public.pt_userinfo.marriage IS '婚姻状况';
COMMENT ON COLUMN public.pt_userinfo.msn IS 'msn账号';
COMMENT ON COLUMN public.pt_userinfo.qq IS 'qq账号';
COMMENT ON COLUMN public.pt_userinfo.nativityaddress IS '出生地';
COMMENT ON COLUMN public.pt_userinfo.speciality IS '专业';
COMMENT ON COLUMN public.pt_userinfo.stature IS '身高';
COMMENT ON TABLE public.wx_article IS 'wx_article';
COMMENT ON COLUMN public.wx_article.ids IS '主键';
COMMENT ON COLUMN public.wx_article.messageids IS 'messageids';
COMMENT ON COLUMN public.wx_article.title IS 'title';
COMMENT ON COLUMN public.wx_article.description IS '描述';
COMMENT ON COLUMN public.wx_article.picurl IS 'picurl : 图片链接，支持JPG、PNG格式，较好的效果为大图640*320，小图80*80';
COMMENT ON COLUMN public.wx_article.url IS '链接 : 点击图文消息跳转链接';
COMMENT ON TABLE public.wx_file IS 'wx_file';
COMMENT ON COLUMN public.wx_file.ids IS '主键';
COMMENT ON TABLE public.wx_group IS 'wx_group';
COMMENT ON COLUMN public.wx_group.ids IS '主键';
COMMENT ON COLUMN public.wx_group.id IS 'id';
COMMENT ON COLUMN public.wx_group.name IS 'name';
COMMENT ON COLUMN public.wx_group.count IS 'count';
COMMENT ON TABLE public.wx_keyword IS 'wx_keyword';
COMMENT ON COLUMN public.wx_keyword.ids IS '主键';
COMMENT ON COLUMN public.wx_keyword.question IS '问题';
COMMENT ON COLUMN public.wx_keyword.questionkey IS '问题关键字';
COMMENT ON COLUMN public.wx_keyword.answer IS '答案';
COMMENT ON TABLE public.wx_location IS 'wx_location';
COMMENT ON COLUMN public.wx_location.ids IS '主键';
COMMENT ON COLUMN public.wx_location.open_id IS 'open_id';
COMMENT ON COLUMN public.wx_location.lng IS 'lng';
COMMENT ON COLUMN public.wx_location.lat IS 'lat';
COMMENT ON COLUMN public.wx_location.bd09_lng IS 'bd09_lng';
COMMENT ON COLUMN public.wx_location.bd09_lat IS 'bd09_lat';
COMMENT ON COLUMN public.wx_location.createdate IS 'createdate';
COMMENT ON TABLE public.wx_message IS 'wx_message';
COMMENT ON COLUMN public.wx_message.ids IS '主键';
COMMENT ON COLUMN public.wx_message.inouts IS 'inouts : 0接收，1发出';
COMMENT ON COLUMN public.wx_message.datatype IS 'datatype : 数据类型：XML或者JSON，0表示XML，1表示JSON';
COMMENT ON COLUMN public.wx_message.datacontent IS 'datacontent : 接收或者发出的数据xml或者json';
COMMENT ON COLUMN public.wx_message.createdate IS '创建时间';
COMMENT ON COLUMN public.wx_message.msgtype IS 'msgtype';
COMMENT ON COLUMN public.wx_message.event IS 'event';
COMMENT ON COLUMN public.wx_message.eventkey IS 'eventkey';
COMMENT ON COLUMN public.wx_message.tousername IS 'tousername';
COMMENT ON COLUMN public.wx_message.fromusername IS 'fromusername : 发送方帐号（一个OpenID）';
COMMENT ON COLUMN public.wx_message.createtime IS 'createtime : 消息创建时间 （11位整型）';
COMMENT ON COLUMN public.wx_message.msgid IS 'msgid : 消息id，64位整型';
COMMENT ON COLUMN public.wx_message.picurl IS 'picurl : 图片链接';
COMMENT ON COLUMN public.wx_message.mediaid IS 'mediaid : 图片消息媒体id，可以调用多媒体文件下载接口拉取数据';
COMMENT ON COLUMN public.wx_message.title IS 'title : 消息标题';
COMMENT ON COLUMN public.wx_message.description IS 'description : 消息描述';
COMMENT ON COLUMN public.wx_message.url IS 'url : 消息链接';
COMMENT ON COLUMN public.wx_message.location_x IS 'location_x : 地理位置维度';
COMMENT ON COLUMN public.wx_message.location_y IS 'location_y : 地理位置经度';
COMMENT ON COLUMN public.wx_message.scale IS 'scale : 地图缩放大小';
COMMENT ON COLUMN public.wx_message.labels IS 'labels : 地理位置信息';
COMMENT ON COLUMN public.wx_message.content IS 'content : 文本消息内容';
COMMENT ON COLUMN public.wx_message.thumbmediaid IS 'thumbmediaid : 视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。';
COMMENT ON COLUMN public.wx_message.format IS 'format : 语音格式，如amr，speex等';
COMMENT ON COLUMN public.wx_message.recognition IS 'recognition : 语音识别结果，UTF8编码';
COMMENT ON COLUMN public.wx_message.latitude IS 'latitude : 地理位置纬度';
COMMENT ON COLUMN public.wx_message.longitude IS 'longitude : 地理位置经度';
COMMENT ON COLUMN public.wx_message.precisions IS 'precisions : 地理位置精度';
COMMENT ON COLUMN public.wx_message.ticket IS 'ticket : 二维码的ticket，可用来换取二维码图片';
COMMENT ON COLUMN public.wx_message.musicurl IS 'musicurl : 音乐链接';
COMMENT ON COLUMN public.wx_message.hqmusicurl IS 'hqmusicurl : 高质量音乐链接，WIFI环境优先使用该链接播放音乐';
COMMENT ON COLUMN public.wx_message.articlecount IS 'articlecount : 图文消息个数，限制为10条以内';
COMMENT ON TABLE public.wx_role IS 'wx_role';
COMMENT ON COLUMN public.wx_role.ids IS '主键';
COMMENT ON TABLE public.wx_user IS 'wx_user';
COMMENT ON COLUMN public.wx_user.ids IS '主键';
COMMENT ON COLUMN public.wx_user.openid IS '用户的标识 : 用户的标识';
COMMENT ON COLUMN public.wx_user.subscribe IS '关注状态 : 关注状态（1是关注，0是未关注），未关注时获取不到其余信息';
COMMENT ON COLUMN public.wx_user.subscribetime IS '用户关注时间 : 用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间';
COMMENT ON COLUMN public.wx_user.nickname IS '昵称';
COMMENT ON COLUMN public.wx_user.sex IS 'sex : 用户的性别（1是男性，2是女性，0是未知）';
COMMENT ON COLUMN public.wx_user.country IS 'country : 用户所在国家';
COMMENT ON COLUMN public.wx_user.province IS 'province : 用户所在省份';
COMMENT ON COLUMN public.wx_user.city IS 'city : 用户所在城市';
COMMENT ON COLUMN public.wx_user.language IS 'language : 用户的语言，简体中文为zh_CN';
COMMENT ON COLUMN public.wx_user.headimgurl IS 'headimgurl : 用户头像';
COMMENT ON COLUMN public.wx_user.groupids IS 'groupids';



