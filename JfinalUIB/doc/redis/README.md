

1. 解压redis-latest.zip

	解压后修改redis.windows.conf配置文件

2. 设置密码

	放开注释行requirepass foobared，密码为foobared
	
3. 设置maxheap <bytes>

	增加行 maxheap 1024000000
	
4. 启动

	C:\Users\Administrator\Desktop\redis-windows-master\downloads\redis-latest>redis-server redis.windows.conf