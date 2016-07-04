
-- 使用系统管理员账号进行操作

--删除用户
drop user jfinaluibv3 cascade;
drop tablespace jfinaluibv3_temp including contents and datafiles;
drop tablespace jfinaluibv3_data including contents and datafiles;

--创建临时表空间
create temporary tablespace jfinaluibv3_temp
tempfile 'D:\Program Files\jfinaluibv3.dbf'
size 200m
autoextend on
next 50m maxsize 20480m
extent management local;

--创建表空间
create tablespace jfinaluibv3_data
logging
datafile 'D:\Program Files\jfinaluibv3_data.dbf'
size 200m autoextend on   next 50m maxsize 20480m   
extent management local;

--创建用户
create user jfinaluibv3 identified by jfinaluibv3 default tablespace jfinaluibv3_data;

--用户授权
grant resource,connect,dba to jfinaluibv3; 
