
-- 使用系统管理员账号进行操作

--删除用户
drop user jfinaluibv4 cascade;
drop tablespace jfinaluibv4_temp including contents and datafiles;
drop tablespace jfinaluibv4_data including contents and datafiles;

--创建临时表空间
create temporary tablespace jfinaluibv4_temp
tempfile 'D:\Program Files\jfinaluibv4.dbf'
size 200m
autoextend on
next 50m maxsize 20480m
extent management local;

--创建表空间
create tablespace jfinaluibv4_data
logging
datafile 'D:\Program Files\jfinaluibv4_data.dbf'
size 200m autoextend on   next 50m maxsize 20480m   
extent management local;

--创建用户
create user jfinaluibv4 identified by jfinaluibv4 default tablespace jfinaluibv4_data;

--用户授权
grant resource,connect,dba to jfinaluibv4; 
