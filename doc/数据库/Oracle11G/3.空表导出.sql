
--11G中有个新特性，当表无数据时，不分配segment，以节省空间
　　
--解决方法：
--　　1、insert一行，再rollback就产生segment了。
--　　该方法是在在空表中插入数据，再删除，则产生segment。导出时则可导出空表。
　　
--	2、使用管理员账号登陆，设置deferred_segment_creation 参数
	show parameter deferred_segment_creation ;
	alter system set deferred_segment_creation=false; 
	show parameter deferred_segment_creation ;