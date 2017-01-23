进入命令行窗口操作

--导出使用的命令full=y 
exp jfinaluibv4/jfinaluibv4@orcl file=d:\jfinaluibv4.dmp OWNER=jfinaluibv4 TABLES=(jfinaluibv4)
exp jfinaluibv4/jfinaluibv4@orcl OWNER=jfinaluibv4 file=d:\jfinaluibv4.dmp

--导入使用的命令
imp jfinaluibv4/jfinaluibv4@orcl  file=d:\jfinaluibv4.dmp FROMUSER=jfinaluibv4  TOUSER=jfinaluibv4 ignore=y
