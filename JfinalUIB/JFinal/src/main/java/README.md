### JAVA 极速WEB+ORM框架 JFinal

	JFinal 是基于 Java 语言的极速 WEB + ORM 框架，其核心设计目标是开发迅速、代码量少、学习简单、功能强大、轻量级、易扩展、Restful。
	在拥有Java语言所有优势的同时再拥有ruby、python等动态语言的开发效率！为您节约更多时间，去陪恋人、家人和朋友 ;)

#### JFinal有如下主要特点

	- MVC架构，设计精巧，使用简单
	- 遵循COC原则，零配置，无xml
	- 独创Db + Record模式，灵活便利
	- ActiveRecord支持，使数据库开发极致快速
	- 自动加载修改后的java文件，开发过程中无需重启web server
	- AOP支持，拦截器配置灵活，功能强大
	- Plugin体系结构，扩展性强
	- 多视图支持，支持FreeMarker、JSP、Velocity
	- 强大的Validator后端校验功能
	- 功能齐全，拥有struts2的绝大部分功能
	- 体积小仅218K，且无第三方依赖

**JFinal 极速开发QQ群欢迎您的加入: 
	
	322076903、432462639**

#### 以下是JFinal实现Blog管理的示例：

	**1. 控制器(支持FreeMarker、JSP、Velocity、JSON等等以及自定义视图渲染)**
	
	```java
	@Before(BlogInterceptor.class)
	public class BlogController extends Controller {
	    public void index() {
	        setAttr("blogList", Blog.dao.find("select * from blog"));
	    }
	    public void add() {
	    }
	
	    @Before(BlogValidator.class)
	    public void save() {
	        getModel(Blog.class).save();
	    }
	
	    public void edit() {
	        setAttr("blog", Blog.dao.findById(getParaToInt()));
	    }
	
	    @Before(BlogValidator.class)
	    public void update() {
	        getModel(Blog.class).update();
	    }
	
	    public void delete() {
	        Blog.dao.deleteById(getParaToInt());
	    }
	}
	```

	**2.Model(无xml、无annotaion、无attribute、无getter、无setter)**
	
	```java
	public class Blog extends Model<Blog> {
	    public static final Blog dao = new Blog();
	}
	```

	**3.Validator(API引导式校验，比xml校验方便N倍，有代码检查不易出错)**
	
	```java
	public class BlogValidator extends Validator {
	    protected void validate(Controller controller) {
	        validateRequiredString("blog.title", "titleMsg", "请输入Blog标题!");
	        validateRequiredString("blog.content", "contentMsg", "请输入Blog内容!");
	    }
	
	    protected void handleError(Controller controller) {
	        controller.keepModel(Blog.class);
	    }
	}
	```

	**4.拦截器(在此demo中仅为示例，本demo不需要此拦截器)**
	
	```java
	public class BlogInterceptor implements Interceptor {
	    public void intercept(Invocation inv) {
	        System.out.println("Before invoking " + inv.getActionKey());
	        inv.invoke();
	        System.out.println("After invoking " + inv.getActionKey());
	    }
	}
	```

**JFinal 官方网站：

	[http://www.jfinal.com](http://www.jfinal.com)**

JFinal 2.2 发布，用JFinal开发，就这么定了！

	JFinal 2.2 主要针对于 2.1 版本中反馈集中的几个问题进行改进，
	另外也让jfinal 2.1非最终版用户升为统一的版本。
	
	1：paginate方法改进
	   在2.1 版中使用了正则对paginate方法匹配 select 与 group by 元素，
	为了性能采用粗放的正则时，则无法实现复杂sql的精确匹配，
	而为了精确匹配使用细致冗长的正则时，则性能急剧下降，简单sql
	相对于复杂sql甚至有上千倍的性能差距，权衡之下2.2 版
	弃用对select、group by的正则匹配，拆分sql为
	select及sqlExceptSelect，事实证明此法简单、粗爆、高效、可靠
	
	   此外，对 paginate 方法添加了 boolean isGroupBySql参数重载方法，
	用于强制指定sql语句是否为grup by sql
	
	2：改进ModelRecordElResolver
	  添加setResolveBeanAsModel(boolean) ，设置为true时，用于指定在JSP/jstl中，
	对待合体后的Bean仍然采用老版本对待Model的方式输出数据，也即使用 Model.get(String attr)
	而非Bean的getter方法输出数据，有利于在关联查询时输出无 getter 方法的字段值。
	建议mysql数据表中的字段采用驼峰命名，表名采用下划线方式命名便于win与linux间移植
	
	注意：这里所指的 Bean 仅仅指用 BaseModelGenerator 生成的实现了 IBean接口后的类文件
	
	使用方法,在 YourJFinalConfig 中创建方法，并调用本方法：
	public void afterJFinalStart() {
	  ModelRecordElResolver.setResolveBeanAsModel(true);
	}
	
	 当老版本项目升级到 jfinal 2.2 并且使用了生成器生成Bean，但又想保持原来的jsp输出方式，可将该变量设置为true
	
	3：maven升级坐标，已推送至中心库，可立即升级
	<dependency>
		<groupId>com.jfinal</groupId>
		<artifactId>jfinal</artifactId>
		<version>2.2</version>
	</dependency>
	强烈建议 jfinal 2.1 升级至 2.2
	
	change log：
	1：改进paginate，sql参数为 select与sqlExceptSelect，简单、粗爆、高效、可靠。
	2：添加boolean isGroupBy 的pagiante重载方法，用于强制指定sql语句是否为grup by sql
	3：改进ModelRecordElResolver，添加setResolveBeanAsModel()，使用生成器生成的实现了IBean接口的 Class 将被当成 Model来处理
	4：改进Controller中cookie操作，默认path值设置为"/"，避免某些浏览器不支持无默认path
	5：Jackson、JFinalJson 中 private 可见性改为protected，便于扩展出个性化 json 转换实现
	6：改进CaptchaRender,添加CaptchaRender.setCaptchaName()方法便于定义captchName，cookie的path设置为 "/"
	7：改进Model、Db 的 paginate 方法
	8：FileRender.encodeFileName() 改为 protected 便于扩展，字符集改为使用 getEncoding() 来获取

jfinal 3.0 changelog
	
	1：添加 JFinal Template Engine，将极速开发贯彻到 View 层
	2：增强 active record 模块，添加 sql 动态生成与管理功能，三个 API 搞定 mybatis 的核心功能
	3：增强 Routes，添加 addInterceptor()，可为每组 Controller 统一配置 Interceptor
	4：增强 Routes，添加 setBaseViewPath()，可为每组 Controller 统一配置 baseViewPath
	5：增强 render 模块，支持所有 Controller.renderXxx() 方法的定制，淘汰了原来的三个接口
	6：添加 Controller.renderToString()，在控制器中利用模板引擎生成 email、短信或 HTML片段等内容，极致便捷
	7：添加 QrCodeRender 以及 renderQrCode() 方法，极速生成二维码
	8：添加 captcha 验证码模块，引入全面的扩展接口，提升安全性
	9：添加 Cron4jPlugin，极速支持任务调度
	10：添加Model.dao() 方法，解决小白误用 dao 所带来的线程安全问题
	11：增强 JFinalJson 添加对 primitive 数组、Enumeration、Collection 类型支持
	12：添加 MixedJsonFactory，使用 JFinalJson 转 json，使用 fastjons 做反向序列化转 object
	13：添加 Controller.renderTemplate()，支持主视图为其它模板引擎时混合使用 JFinal Template Engine
	14：去掉 Dialect.replaceOrderBy() 中对 orderby 的 replace操作，解决paginate方法无法支持部分复杂 order by 子句问题
	15：添加 JFinal.start(String webAppDir, int port, String context)方法，更好地支持 IDEA 环境下使用集成的jetty启动项目
	16：添加 Controller.getHeader()，有利于微信小程序开发
	17：添加 DbKit.getConfigSet()，便于更深入的扩展开发
	18：增强 ActionReporter，支持指定输出方式，添加 url 输出，以及指定参数最大输出长度
	19：StrKit、HashKit 添加 slowEquals 方法用于密码验证
	20：Model.getConfig() 的可见性由 private 改为 protected
	21：CacheInterceptor 的 buildCacheName、buildCacheKey 改为 protected 便于扩展
	22：改进 HashKit.generateSalt()，添加 generateSaltForSha256()与 generateSaltForSha512()
	23：添加 Generator.setGenerateChainSetter() 方法，支持 baseModel 生成链式 setter 方法 
	24：改进 TableBuilder，去掉 build() 中判断 size 为 0 的优化，便于探知据库是否连接成功
	25：改进 Redis Cache.lrange()，处理 jedis 返回 null的情况
	26：增强，添加Model.filter() 方法，便于实现过滤 XSS 脚本这类功能
	27：增强 Ret，改为继承自 HashMap，并添加 ok() fail() 系列方法，有利于 javascript 下的 if(ret.isFail) 判断
	28：添加 JMap，便于快捷链式构建大量参数
	29：改进 active record 模块，支持对所有 Config 进行动态管理
	30：ActiveRecordPlugin 添加 addSqlTemplate()、setBaseSqlTemplatePath() 等 sql 管理有关方法
	31：Model、Db 添加 getSql()、getSqlPara()、find(SqlPara)、findFirst(SqlPara) 等方法支持 sql 管理
	32：TokenManager 的 new Timer 添加 true 参数，变为 demon 线程
	33：ModelGenerator 中的 generateDaoInModel 改为 false，提倡 dao对象声明在 Service 层中
	34：JettyServer.changeClassLoader() 中添加 webApp.setClassLoader(jfcl)，解决热加载时单例问题
	35：增强 ModelRecordElResolver，IBean类型先尝试 getter 方法，getter不存在则调用get(String)方法
	36：增强 CacheInterceptor、RenderInfo，便于扩展支持更多类型 Render
	37：优化 StrKit.isBlank()，并添加 getRandomUUID() 方法
	38：改进 I18nInterceptor，解决 switchView 情况下 getRender() 为 null 问题，添加一个实用构造方法
	39：改进 TypeConverter，加强对 Timestamp 的支持范围
	40：改进 ActionException，保留类型转换 404 异常的 errorMessage
	41：改进 ActiveRecordPlugin，oracle 默认事务级别设置为 TRANSACTION_READ_COMMITTED
	42：改进 Db、DbPro，添加 queryShort 系列方法
	43：改进 JsonRender，支持 renderJson(null)
	44：添加 Validator.getActionMethodName() 方法
	45：XmlRender 改为使用 JFinal Template Engine 实现
	46：HttpKit.post() 支持 data 值为 null 的情况
	47：去掉 JFinalFilter final 修饰，便于定制扩展
	48：删除 Constants.setBaseViewPath()，已被 Routes 完全取代
	49：com.jfinal.token.Token.java 两个构造方法改为 public，便于扩展
	50：Page 添加默认构造方法支持 fastjson 这类第三方工具的反向序列化，isLastPage() 方法的逻辑改为 pageNum >= totalPage，添加 toString()方法
	
