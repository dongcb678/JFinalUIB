进入命令行窗口操作

--导出使用的命令  full=y  TABLES=(jfinaluib)
exp jfinaluib/jfinaluib@orcl file=d:\jfinaluib.dmp OWNER=jfinaluib


--导入使用的命令
imp jfinaluib/jfinaluib@orcl  file=d:\jfinaluib.dmp FROMUSER=jfinaluib  TOUSER=jfinaluib ignore=y