进入命令行窗口操作

--导出使用的命令full=y 
exp jfinaluibv3/jfinaluibv3@orcl file=d:\jfinaluibv3.dmp OWNER=jfinaluibv3 TABLES=(jfinaluibv3)
exp jfinaluibv3/jfinaluibv3@orcl OWNER=jfinaluibv3 file=d:\jfinaluibv3.dmp

--导入使用的命令
imp jfinaluibv3/jfinaluibv3@orcl  file=d:\jfinaluibv3.dmp FROMUSER=jfinaluibv3  TOUSER=jfinaluibv3 ignore=y
