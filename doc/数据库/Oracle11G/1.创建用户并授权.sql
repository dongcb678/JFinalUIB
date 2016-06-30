
-- 使用系统管理员账号进行操作

--删除用户
drop user jfinaluibv2 cascade;
drop tablespace jfinaluibv2_temp including contents and datafiles;
drop tablespace jfinaluibv2_data including contents and datafiles;

--创建临时表空间
create temporary tablespace jfinaluibv2_temp
tempfile 'D:\Program Files\jfinaluibv2.dbf'
size 200m
autoextend on
next 50m maxsize 20480m
extent management local;

--创建表空间
create tablespace jfinaluibv2_data
logging
datafile 'D:\Program Files\jfinaluibv2_data.dbf'
size 200m autoextend on   next 50m maxsize 20480m   
extent management local;

--创建用户
create user jfinaluibv2 identified by jfinaluibv2 default tablespace jfinaluibv2_data;

--用户授权
grant resource,connect,dba to jfinaluibv2; 
