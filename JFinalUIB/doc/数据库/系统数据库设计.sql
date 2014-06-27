SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Indexes */

DROP INDEX onemanyindex ON pt_operator;
DROP INDEX returnparamkeysindex ON pt_operator;
DROP INDEX returnurlindex ON pt_operator;
DROP INDEX rowfilterindex ON pt_operator;
DROP INDEX urlindex ON pt_operator;
DROP INDEX usernameindex ON pt_user;
DROP INDEX bloodgroupindex ON pt_userinfo;
DROP INDEX emailindex ON pt_userinfo;
DROP INDEX msnindex ON pt_userinfo;
DROP INDEX nativityaddressindex ON pt_userinfo;
DROP INDEX postboyindex ON pt_userinfo;
DROP INDEX schoolnameindex ON pt_userinfo;
DROP INDEX specialityindex ON pt_userinfo;



/* Drop Tables */

DROP TABLE pt_department;
DROP TABLE pt_dict;
DROP TABLE pt_group;
DROP TABLE pt_menu;
DROP TABLE pt_module;
DROP TABLE pt_operator;
DROP TABLE pt_resources;
DROP TABLE pt_role;
DROP TABLE pt_station;
DROP TABLE pt_syslog;
DROP TABLE pt_systems;
DROP TABLE pt_user;
DROP TABLE pt_userinfo;




/* Create Tables */

CREATE TABLE pt_department
(
	ids varchar(32) NOT NULL,
	version bigint,
	allchildnodeids varchar(2000),
	departmentlevel bigint,
	depttype char(1),
	osname varchar(200),
	images varchar(50),
	isparent varchar(5),
	ips varchar(50),
	orderids bigint,
	url varchar(100),
	parentdepartmentids varchar(32),
	principaluserids varchar(32),
	CONSTRAINT pt_department_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_dict
(
	ids varchar(32) NOT NULL,
	version bigint,
	osname varchar(200),
	images varchar(50),
	ips varchar(50),
	orderids bigint,
	paths varchar(1000),
	zhuangtai char(1),
	parentids varchar(32),
	isparent varchar(5),
	levels bigint,
	CONSTRAINT portal_common_fenleishu_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_group
(
	ids varchar(32) NOT NULL,
	version bigint,
	osname varchar(200),
	ips varchar(50),
	roleids text,
	CONSTRAINT pt_group_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_menu
(
	ids varchar(32) NOT NULL,
	version bigint,
	images varchar(50),
	levels bigint,
	ips varchar(50),
	orderids bigint,
	operatorids varchar(32),
	parentmenuids varchar(32),
	systemsids varchar(32),
	isparent varchar(5),
	CONSTRAINT pt_menu_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_module
(
	ids varchar(32) NOT NULL,
	version bigint,
	osname varchar(200),
	images varchar(50),
	isparent varchar(5),
	ips varchar(50),
	orderids bigint,
	parentmoduleids varchar(32),
	systemsids varchar(32),
	CONSTRAINT pt_module_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_operator
(
	ids varchar(32) NOT NULL,
	version bigint,
	osname varchar(200),
	ips varchar(50),
	onemany char(1),
	returnparamkeys varchar(100),
	returnurl varchar(200),
	rowfilter char(1),
	url varchar(200),
	moduleids varchar(32),
	splitpage char(1),
	formtoken char(1),
	ipblack char(1),
	privilege char(1),
	ispv char(1),
	pvtype char(1),
	modulenames varchar(50),
	CONSTRAINT pt_operator_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_resources
(
	ids varchar(32) NOT NULL,
	version bigint,
	osname varchar(200),
	ips varchar(50),
	hostname varchar(200),
	cpunumber bigint,
	cpuratio decimal(20,10),
	phymemory bigint,
	phyfreememory bigint,
	jvmtotalmemory bigint,
	jvmfreememory bigint,
	jvmmaxmemory bigint,
	gccount bigint,
	CONSTRAINT pt_resources_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_role
(
	ids varchar(32) NOT NULL,
	version bigint,
	osname varchar(200),
	ips varchar(50),
	operatorids text,
	moduleids text,
	CONSTRAINT pt_role_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_station
(
	ids varchar(32) NOT NULL,
	version bigint,
	osname varchar(200),
	images varchar(50),
	isparent varchar(5),
	ips varchar(50),
	orderids bigint,
	parentstationids varchar(32),
	operatorids text,
	moduleids text,
	CONSTRAINT pt_station_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_syslog
(
	ids varchar(32) NOT NULL,
	version bigint,
	actionenddate timestamp,
	actionendtime bigint,
	actionhaoshi bigint,
	actionstartdate timestamp,
	actionstarttime bigint,
	cause char(1),
	cookie varchar(1024),
	description text,
	enddate timestamp,
	endtime bigint,
	haoshi bigint,
	ips varchar(128),
	method varchar(4),
	referer varchar(500),
	requestpath text,
	startdate timestamp,
	starttime bigint,
	status char(1),
	useragent varchar(200),
	viewhaoshi bigint,
	operatorids varchar(32),
	accept varchar(200),
	acceptencoding varchar(200),
	acceptlanguage varchar(200),
	connection varchar(200),
	host varchar(200),
	xrequestedwith varchar(200),
	pvids varchar(32),
	userids varchar(32),
	CONSTRAINT pt_syslog_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_systems
(
	ids varchar(32) NOT NULL,
	version bigint,
	osname varchar(200),
	ips varchar(50),
	numbers varchar(25),
	orderids bigint,
	CONSTRAINT pt_system_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_user
(
	ids varchar(32) NOT NULL,
	version bigint,
	errorcount bigint,
	orderids bigint,
	password blob,
	salt blob,
	status char(1),
	stopdate timestamp,
	username varchar(50),
	departmentids varchar(32),
	userinfoids varchar(32),
	stationids text,
	deptids text,
	userids text,
	groupids text,
	departmentnames varchar(25),
	stationnames text,
	deptnames text,
	usernames text,
	groupnames text,
	CONSTRAINT pt_user_pkey PRIMARY KEY (ids)
);


CREATE TABLE pt_userinfo
(
	ids varchar(32) NOT NULL,
	version bigint,
	address varchar(300),
	addressinfo varchar(300),
	avoirdupois varchar(5),
	birthday date,
	bloodgroup varchar(15),
	clientlevelend timestamp,
	clientlevelstart timestamp,
	culture varchar(30),
	osname varchar(200),
	email varchar(100),
	finishschooldate date,
	folk varchar(20),
	government varchar(25),
	homepage varchar(100),
	householder varchar(20),
	idcard varchar(25),
	marriage varchar(20),
	mobile varchar(20),
	msn varchar(20),
	ips varchar(50),
	nativityaddress varchar(20),
	postboy varchar(6),
	qq varchar(20),
	schoolname varchar(20),
	sex varchar(5),
	speciality varchar(20),
	stature varchar(5),
	telephone varchar(20),
	CONSTRAINT pt_userinfo_pkey PRIMARY KEY (ids)
);



/* Create Indexes */

CREATE INDEX onemanyindex USING BTREE ON pt_operator (onemany ASC);
CREATE INDEX returnparamkeysindex USING BTREE ON pt_operator (returnparamkeys ASC);
CREATE INDEX returnurlindex USING BTREE ON pt_operator (returnurl ASC);
CREATE INDEX rowfilterindex USING BTREE ON pt_operator (rowfilter ASC);
CREATE INDEX urlindex USING BTREE ON pt_operator (url ASC);
CREATE INDEX usernameindex USING BTREE ON pt_user (username ASC);
CREATE INDEX bloodgroupindex USING BTREE ON pt_userinfo (bloodgroup ASC);
CREATE INDEX emailindex USING BTREE ON pt_userinfo (email ASC);
CREATE INDEX msnindex USING BTREE ON pt_userinfo (msn ASC);
CREATE INDEX nativityaddressindex USING BTREE ON pt_userinfo (nativityaddress ASC);
CREATE INDEX postboyindex USING BTREE ON pt_userinfo (postboy ASC);
CREATE INDEX schoolnameindex USING BTREE ON pt_userinfo (schoolname ASC);
CREATE INDEX specialityindex USING BTREE ON pt_userinfo (speciality ASC);



