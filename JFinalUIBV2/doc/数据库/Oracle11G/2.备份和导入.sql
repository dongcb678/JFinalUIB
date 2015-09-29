进入命令行窗口操作

--导出使用的命令full=y 
exp jfinaluibv2/jfinaluibv2@orcl file=d:\jfinaluibv2.dmp OWNER=jfinaluibv2 TABLES=(jfinaluibv2)


--导入使用的命令
imp jfinaluibv2/jfinaluibv2@orcl  file=d:\jfinaluibv2.dmp FROMUSER=jfinaluibv2  TOUSER=jfinaluibv2 ignore=y