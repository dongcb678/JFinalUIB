
-- 使用系统管理员账号操作

--删除用户
drop user jfinaluib cascade;
drop tablespace jfinaluib_temp including contents and datafiles;
drop tablespace jfinaluib_data including contents and datafiles;

--创建临时表空间
create temporary tablespace jfinaluib_temp
tempfile 'D:\Program Files\jfinaluib.dbf'
size 200m
autoextend on
next 50m maxsize 20480m
extent management local;

--创建表空间
create tablespace jfinaluib_data
logging
datafile 'D:\Program Files\jfinaluib_data.dbf'
size 200m autoextend on   next 50m maxsize 20480m   
extent management local;

--创建用户
create user jfinaluib identified by jfinaluib default tablespace jfinaluib_data;

--用户授权
grant resource,connect,dba to jfinaluib; 
