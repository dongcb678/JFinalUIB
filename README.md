JFinal高级学习交流QQ群：
	
	309647612

JFinalUIB现在分为3个版本:

	JFinalUIB_V1版本：基于JFinal1.9 + charisma UI
	JFinalUIB_V2版本：基于JFinal2.2 + rapido UI
	JFinalUIB_V3版本：基于JFinal2.2 + metrolab UI
	JFinalUIB_V4版本：基于JFinal3.0 + metrolab UI

GIT版本分支一共有4个版本，7个分支：

	JFinalUIB_V4：（默认分支）
		JFinalUIB_V4代码，基于常规的eclipse和idea项目配置文件构建，可以直接用eclipse和idea打开
		
	JFinalUIB_V4_MAVEN：
		基于maven环境构建的JFinalUIB_V4
		
	JFinalUIB_V3：
		JFinalUIB_V3代码，基于常规的eclipse和idea项目配置文件构建，可以直接用eclipse和idea打开
		
	JFinalUIB_V3_MAVEN：
		基于maven环境构建的JFinalUIB_V3
		
	JFinalUIB_V2：
		JFinalUIB_V2代码，基于常规的eclipse和idea项目配置文件构建，可以直接用eclipse和idea打开
		
	JFinalUIB_V2_MAVEN：
		基于maven环境构建的JFinalUIB_V2
		
	JFinalUIB_V1：
		老版本，几乎停止维护，基于常规的eclipse和idea项目配置文件构建，可以直接用eclipse和idea打开

V1主要信息：

	JFinal1.9 + charisma UI

V2主要变动：

	升级JFinal为2.2、重构项目
	更换UI，新的UI库是rapido UI
	更多数据库支持，现支持PostgreSQL、MySQL、SqlServer、Oracle、DB2

V3主要变动：

	更换UI，新的UI库是metrolab UI
	重构项目，增加权限中间表，规范化处理
	重写了大部分权限相关的代码

V4主要变动：
	
	升级JFinal3.0，V4代码完全从V3迁移过来，只是为了升级JFinal3.0进行了一些修改
	
下面是基于JFinalUIB进行讲解的JFinal原创著作：

	《JFinal极速开发实战》

	百度阅读地址 ：http://yuedu.baidu.com/ebook/3fc54b55d5bbfd0a7956739f

如果觉得此项目对您有帮助，可以进行捐助，谢谢！

![image](http://git.oschina.net/dongcb678/JfinalUIB/raw/2d050d0ddbfee41aa5aa47248f333e35910878dd/doc/捐助/支付宝.jpg)

![image](http://git.oschina.net/dongcb678/JfinalUIB/raw/2d050d0ddbfee41aa5aa47248f333e35910878dd/doc/捐助/微信.jpg)

JDK要求：

	JDK6、JDK7、JDK8都可以，编译级别默认是1.6，可以更高

数据库配置：

	1.数据库备份文件/JFinalUIBV4/doc/数据库
	2.每种数据库目录都有各自的备份恢复说明
	3.数据库配置，修改init.properties，修改db[xx].type和指定数据库连接信息

Eclipse安装配置说明：

	1.用eclipse导入项目，修改受限API调用编译报错，见/JFinalUIBV4/build-lib/eclipse受限API调用设置.png
	2.运行com.platform.config.Run.java类
	
IDEA安装配置说明：
	
	1.用IDEA打开项目
	2.运行com.platform.config.Run.java类，编辑main运行配置，修改JRE路径为本地JDK根路径，千万不要选择本地JRE路径
	
JFinalUIB_V1 、 JFinalUIB_V2 登陆账号密码：
	
	账号：admins
	密码：000000
		
JFinalUIB_V3 、JFinalUIB_V4 登陆账号密码：
	
	账号：admins
	密码：123456

build-lib说明：

	1.此目录都是一些编译依赖包，并不需要发布到运行环境中，
	2.如果你用到了这些jar，请把这些jar移动到WEB-INF\lib目录中，并删除此目录中的jar
	
	jetty-8.1.8：内嵌启动jetty8.1.8依赖的jar
	
	jetty-9.2-jdk7+：内嵌启动jetty9.2依赖的jar
	
	jfinal3：编译jfinal源码用到的jar，这些jar在项目中没用到，不用发布
	
	junit：junit单元测试依赖的jar
	
	postgresql：在JDK6或JDK7中的驱动类
	
	spring：如果启用了spring插件，可以加入这些jar
	