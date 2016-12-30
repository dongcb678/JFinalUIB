
可以改为jdbcjobstore模式:

	1.quartz.properties中增加配置属性
	
	2.增加MyConnectionProvider数据库连接提供类
	
	3.执行对应的数据库脚本
	
测试结果：

	暂时只对PostgreSQL和MySQL进行了测试
	
	1.MySQL，正常运行
	
	2.PostgreSQL，不能正常运行，定时任务无法触发

	