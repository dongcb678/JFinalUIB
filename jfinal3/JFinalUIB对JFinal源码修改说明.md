

1.增加sql打印格式化

	SqlReporter的57行，String info = "Sql: " + ToolSqlFormatter.format(String.valueOf(args[0]));

2.增加sql打印参数

	修改Dialect类fillStatement方法，由于Oracle重写了打印方法，所以还修改了OracleDialect类fillStatement方法
	
3.升级jetty9运行项目（暂时退回jfinal自带的jetty8版本）
	
	修改JettyServer类的88-99行
	
4.FreeMarker过时方法处理

	FreeMarkerRender.java
	
5.处理distinct分页支持《2.1中暂未添加》

	修改 Db.java 、DbPro.java、CPI.java， 所有分页方法增加 selectCount 方法
	
6.在Model.java中修改update方法
	
	处理乐观锁，增加了更新sql语句的版本号条件
	
7.视图render增加耗时计算

	ActionHandler.java
	
8.文件下载，IE下中文名称乱码

	视图RenderFactory增加构造参数getFileRender方法，增加参数downloadSaveFileName，
	可以指定下载文件名称，不是使用默认文件路径名作为下载名称
	FileRender中的encodeFileName方法继续使用老版本中GBK编码，新版UTF-8编码导致IE下中文文件名乱码
	保留2.2版本中的downloadSaveFileName参数，增加参数传递方法
	
9.Controller.java
	
	78行增加获取urlPara方法

10.Validator.java

	intercept方法，去掉final，支持BaseValidator重写此方法，增加service实例注入
	把validator声明为类成员变量，方便子类访问

11.TokenManager修改tokenId生成策略

	不再调用random.nextLong()，增加getTokenId()方法，tokenId前缀固定为formToken，方便从redis取keys
	
12.打开Dialect中的去除排序方法

	replaceOrderBy方法继续启用Holder