
/* Drop Tables */

DROP TABLE IF EXISTS blog_articleComment;
DROP TABLE IF EXISTS blog_article;
DROP TABLE IF EXISTS blog_circleUser;
DROP TABLE IF EXISTS blog_circle;
DROP TABLE IF EXISTS blog_favorite;
DROP TABLE IF EXISTS blog_inform;
DROP TABLE IF EXISTS blog_link;
DROP TABLE IF EXISTS blog_message;
DROP TABLE IF EXISTS blog_moveComment;
DROP TABLE IF EXISTS blog_move;
DROP TABLE IF EXISTS blog_newsDeliver;
DROP TABLE IF EXISTS blog_praise;
DROP TABLE IF EXISTS blog_trample;
DROP TABLE IF EXISTS blog_type;
DROP TABLE IF EXISTS cms_accessStatistics;
DROP TABLE IF EXISTS cms_ad;
DROP TABLE IF EXISTS cms_announcement;
DROP TABLE IF EXISTS cms_answers;
DROP TABLE IF EXISTS cms_questions;
DROP TABLE IF EXISTS cms_comment;
DROP TABLE IF EXISTS cms_yellowPage;
DROP TABLE IF EXISTS cms_download;
DROP TABLE IF EXISTS cms_library;
DROP TABLE IF EXISTS cms_voteItem;
DROP TABLE IF EXISTS cms_vote;
DROP TABLE IF EXISTS cms_job;
DROP TABLE IF EXISTS cms_photoGalleryItem;
DROP TABLE IF EXISTS cms_photoGallery;
DROP TABLE IF EXISTS cms_content;
DROP TABLE IF EXISTS cms_column;
DROP TABLE IF EXISTS cms_ipBlacklist;
DROP TABLE IF EXISTS cms_link;
DROP TABLE IF EXISTS cms_location;
DROP TABLE IF EXISTS cms_sensitiveWord;
DROP TABLE IF EXISTS cms_template;




/* Create Tables */

-- 文章
CREATE TABLE blog_article
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 最后更新人
	updateUser varchar(32),
	-- 最后更新时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 是否草稿 : 0否，1是
	draft char,
	-- 标题
	title varchar(200),
	-- 摘要
	digest varchar(200),
	-- 关键字
	keyword varchar(100),
	-- 内容
	content text,
	-- 评论范围 : 0游客和注册用户，1注册用户，2禁止评论
	commentsRange char,
	-- 置顶 : 0否，1是
	stick char,
	-- 原创 : 0否，1是
	original char,
	-- 浏览次数
	viewCount bigint,
	-- 评论次数
	commentCount bigint,
	-- 收藏次数
	favoriteCount bigint,
	-- 点赞次数
	praiseCount bigint,
	-- 踩次数
	trampleCount bigint,
	-- 分类主键
	typeIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 博文评论
CREATE TABLE blog_articleComment
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 评论内容
	content text NOT NULL,
	-- 评论人
	createUser varchar(32) NOT NULL,
	-- 评论时间
	createDate timestamp with time zone NOT NULL,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 点赞次数
	praiseCount bigint,
	-- 踩次数
	trampleCount bigint,
	-- 上级评论
	pIds varchar(32),
	-- 文章主键
	articleIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 圈子
CREATE TABLE blog_circle
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 圈子名称
	name varchar(50),
	-- 创建人
	createUser varchar(32) NOT NULL,
	-- 创建时间
	createDate timestamp with time zone NOT NULL,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 浏览次数
	viewCount bigint,
	-- 圈子url
	url varchar(200) UNIQUE,
	-- 圈子管理员 : 多个逗号隔开，最多十个
	manageUser varchar(330),
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 圈子成员
CREATE TABLE blog_circleUser
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 创建人
	createUser varchar(32) NOT NULL,
	-- 创建时间
	createDate timestamp with time zone NOT NULL,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 申请加入圈子状态 : 0初始化申请，1申请通过，2不通过
	status char,
	-- 圈子主键
	circleIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 收藏夹
CREATE TABLE blog_favorite
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 标题
	title varchar(200),
	-- url地址
	url varchar(500),
	-- 收藏用户
	createUser varchar(32),
	-- 收藏时间
	createDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 举报
CREATE TABLE blog_inform
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 分类
	type varchar(50),
	-- 目标ids
	targetIds varchar(32),
	-- 举报说明
	explain text,
	-- 处理状态 : 0提交举报,1举报成功,2举报失败
	status char,
	-- 结果说明
	result text,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 友情链接
CREATE TABLE blog_link
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 名称
	name varchar(50) NOT NULL UNIQUE,
	-- 链接地址
	url varchar(100) NOT NULL UNIQUE,
	-- logo图片
	logo varchar(100),
	-- 上传文件ids
	uploadIds varchar(32),
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否逻辑删除 : 0否，1是
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 站内消息
CREATE TABLE blog_message
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 内容
	content text,
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 最后更新人
	updateUser varchar(32),
	-- 最后更新时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 接收人
	receiveUser varchar(32),
	-- 接收时间
	receiveDate timestamp with time zone,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 动弹
CREATE TABLE blog_move
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 内容
	content text,
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 修改人
	updateUser varchar(32),
	-- 修改时间
	updateDate timestamp with time zone,
	-- 是否逻辑删除 : 0否，1是
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 浏览次数
	viewCount bigint,
	-- 评论次数
	commentCount bigint,
	-- 点赞次数
	praiseCount bigint,
	-- 踩次数
	trampleCount bigint,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 动弹评论
CREATE TABLE blog_moveComment
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 评论内容
	content text NOT NULL,
	-- 评论人
	createUser varchar(32) NOT NULL,
	-- 评论时间
	createDate timestamp with time zone NOT NULL,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 点赞次数
	praiseCount bigint,
	-- 踩次数
	trampleCount bigint,
	-- 上级评论
	pIds varchar(32),
	-- 主键
	moveIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 新闻投递
CREATE TABLE blog_newsDeliver
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 分类
	type varchar(50),
	-- 标题
	title varchar(200),
	-- 内容
	content text,
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 最后更新人
	updateUser varchar(32),
	-- 最后更新时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 处理状态 : 0初始化提交，1未阅，2已阅
	status char,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 点赞记录
CREATE TABLE blog_praise
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 分类
	type varchar(50),
	-- 目标ids
	targetIds varchar(32),
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 点踩记录
CREATE TABLE blog_trample
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 分类
	type varchar(50),
	-- 目标ids
	targetIds varchar(32),
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 博文分类
CREATE TABLE blog_type
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 名称
	name varchar(50),
	-- 排序号
	sort bigint,
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 访问统计
CREATE TABLE cms_accessStatistics
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 总数量
	total bigint,
	-- 昨日
	yesterday bigint,
	-- 今日
	today bigint,
	-- 本周
	week bigint,
	-- 本月
	month bigint,
	-- 最后更新时间
	updateDate timestamp with time zone,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 广告
CREATE TABLE cms_ad
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 创建人
	createUser varchar(32) NOT NULL,
	-- 创建时间
	createDate timestamp with time zone NOT NULL,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 浏览次数
	viewCount bigint,
	-- 点击次数
	clickCount bigint,
	-- 广告名称
	name varchar(200),
	-- 广告类型
	type varchar(50),
	-- 广告图片
	imagePath varchar(200),
	-- 图片上传Ids
	imageIds varchar(32),
	-- 启用时间
	startDate timestamp with time zone,
	-- 停用时间
	endDate timestamp with time zone,
	-- 排序
	sort bigint,
	-- 状态（是否启用） : 0否，1是
	status char,
	-- 广告位主键
	locationIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 公告
CREATE TABLE cms_announcement
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 有效开始时间
	startDate timestamp with time zone,
	-- 有效结束时间
	endDate timestamp with time zone,
	-- 内容主键
	contentIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 回答
CREATE TABLE cms_answers
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 评论内容
	content text NOT NULL,
	-- 评论人
	createUser varchar(32) NOT NULL,
	-- 评论时间
	createDate timestamp with time zone NOT NULL,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 点赞次数
	praiseCount bigint,
	-- 踩次数
	trampleCount bigint,
	-- 上级评论
	pIds varchar(32),
	-- 是否最佳答案 : 0否，1是
	answers char,
	-- 主键
	questionsIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 栏目
CREATE TABLE cms_column
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 栏目名称
	name varchar(100) NOT NULL,
	-- 栏目排序
	sort bigint NOT NULL,
	-- 栏目地址
	url varchar(200) NOT NULL UNIQUE,
	-- 上级栏目ids : 0否，1是
	pIds varchar(32),
	-- 栏目等级
	level bigint NOT NULL,
	-- 是否父节点
	isParent char NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 内容评论
CREATE TABLE cms_comment
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 评论内容
	content text NOT NULL,
	-- 评论人
	createUser varchar(32) NOT NULL,
	-- 评论时间
	createDate timestamp with time zone NOT NULL,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 点赞次数
	praiseCount bigint,
	-- 踩次数
	trampleCount bigint,
	-- 上级评论
	pIds varchar(32),
	-- 内容主键
	contentIds varchar(32) NOT NULL UNIQUE,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 内容
CREATE TABLE cms_content
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 创建人
	createUser varchar(32) NOT NULL,
	-- 创建时间
	createDate timestamp with time zone NOT NULL,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 标题
	title varchar(200) NOT NULL,
	-- 标题颜色
	color varchar(10),
	-- 标题加粗
	overstriking char,
	-- 摘要
	digest varchar(200),
	-- 关键字
	keyword varchar(100),
	-- 内容
	content text NOT NULL,
	-- 评论范围 : 0游客和注册用户，1注册用户，2禁止评论
	commentsRange char,
	-- 浏览次数
	viewCount bigint NOT NULL,
	-- 评论次数
	commentCount bigint,
	-- 收藏次数
	favoriteCount bigint,
	-- 点赞次数
	praiseCount bigint,
	-- 踩次数
	trampleCount bigint,
	-- 栏目主键
	colunmIds varchar(32) NOT NULL UNIQUE,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 下载
CREATE TABLE cms_download
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 链接地址
	url varchar(500),
	-- 是否外部链接 : 0否，1是
	isLink char,
	-- 系统平台 : windows xp，windows 2000，windows 2003等待
	systems varchar(100),
	-- 软件授权形式
	copytype varchar(50),
	-- 软件语言
	language varchar(50),
	-- 软件类型
	classtype varchar(50),
	-- 软件版本
	softVersion varchar(20),
	-- 文件大小
	size bigint,
	-- 内容主键
	contentIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- IP黑名单
CREATE TABLE cms_ipBlacklist
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- ip地址
	ip varchar(500),
	-- 到期解除时间
	expiresDate timestamp with time zone,
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 最后修改人
	updateUser varchar(32),
	-- 是否逻辑删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 招聘
CREATE TABLE cms_job
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 发布开始时间
	startDate timestamp with time zone,
	-- 发布截止时间
	endDate timestamp with time zone,
	-- 职位类别 : 字典配置
	type varchar(50),
	-- 工作年限 : 字典进行配置
	year varchar(50),
	-- 学历 : 字典配置
	education varchar(50),
	-- 薪水 : 字典配置
	salary varchar(50),
	-- 工作地点 : 字典配置
	address varchar(50),
	-- 工作性质 : 0全职， 1兼职
	nature char,
	-- 管理经验 : 0要求， 1不要求
	manage char,
	-- 招聘人数 : 字典配置
	quantity varchar(50),
	-- 内容主键
	contentIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 文库
CREATE TABLE cms_library
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 作者
	author varchar(100),
	-- 来源
	source varchar(50),
	-- 来源url
	url varchar(200),
	-- 上传文档ids
	uploadIds varchar(32),
	-- 文档路径
	path varchar(100),
	-- 内容主键
	contentIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 友情链接
CREATE TABLE cms_link
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 名称
	name varchar(50) NOT NULL UNIQUE,
	-- 链接地址
	url varchar(100) NOT NULL UNIQUE,
	-- logo图片
	logo varchar(100),
	-- 上传文件ids
	uploadIds varchar(32),
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否逻辑删除 : 0否，1是
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 广告位置
CREATE TABLE cms_location
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 创建人
	createUser varchar(32) NOT NULL,
	-- 创建时间
	createDate timestamp with time zone NOT NULL,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 名称
	name varchar(200),
	-- 类型
	type varchar(50),
	-- 宽度
	width bigint,
	-- 高度
	height bigint,
	-- 描述
	description text,
	-- 广告数量
	adCount bigint,
	-- 状态（是否启用） : 0否，1是
	status char,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 图片库
CREATE TABLE cms_photoGallery
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 作者
	author varchar(100),
	-- 来源
	source varchar(50),
	-- 来源url
	url varchar(200),
	-- 标题图
	titlePicture varchar(32),
	-- 标题图路径
	titlePicturePath varchar(100),
	-- 内容主键
	contentIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 图片库图片
CREATE TABLE cms_photoGalleryItem
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 创建人
	createUser varchar(32) NOT NULL,
	-- 创建时间
	createDate timestamp with time zone NOT NULL,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 上传ids
	uploadIds varchar(32),
	-- 上传路径
	uploadPath varchar(100),
	-- 主键
	photoGalleryIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 问题
CREATE TABLE cms_questions
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 最佳回答ids
	answersIds varchar(32),
	-- 内容主键
	contentIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 敏感词
CREATE TABLE cms_sensitiveWord
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint,
	-- 敏感词
	sensitiveWord varchar(100),
	-- 敏感级别 : 1高，2中，3低
	level char(1),
	-- 替换词
	replaceWord varchar(100),
	-- 排序
	sort bigint,
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 模板
CREATE TABLE cms_template
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 创建人
	createUser varchar(32),
	-- 创建时间
	createDate timestamp with time zone,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 模板名称
	name varchar(100),
	-- 模板内容
	content text,
	-- 模板类型
	type varchar(32),
	-- 应用目标Ids
	targetIds varchar(32),
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 投票
CREATE TABLE cms_vote
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 投票范围
	voteRange char,
	-- 内容主键
	contentIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 投票项
CREATE TABLE cms_voteItem
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 乐观锁
	version bigint NOT NULL,
	-- 创建人
	createUser varchar(32) NOT NULL,
	-- 创建时间
	createDate timestamp with time zone NOT NULL,
	-- 最后修改人
	updateUser varchar(32),
	-- 最后修改时间
	updateDate timestamp with time zone,
	-- 是否删除
	isDelete char,
	-- 删除人
	deleteUser varchar(32),
	-- 删除时间
	deleteDate timestamp with time zone,
	-- 项名称
	name varchar(100),
	-- 投票次数
	voteCount bigint,
	-- 投票主键
	voteIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;


-- 黄页
CREATE TABLE cms_yellowPage
(
	-- 主键
	ids varchar(32) NOT NULL,
	-- 地址
	address varchar(200),
	-- 联系人
	contacts varchar(50),
	-- 固话
	fixPhone varchar(20),
	-- 移动电话
	mobile varchar(20),
	-- 邮编
	postcode varchar(10),
	-- 在线qq : 多个逗号隔开，最多5个
	qq varchar(100),
	-- 内容主键
	contentIds varchar(32) NOT NULL,
	PRIMARY KEY (ids)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE blog_articleComment
	ADD FOREIGN KEY (articleIds)
	REFERENCES blog_article (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE blog_circleUser
	ADD FOREIGN KEY (circleIds)
	REFERENCES blog_circle (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE blog_moveComment
	ADD FOREIGN KEY (moveIds)
	REFERENCES blog_move (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE blog_article
	ADD FOREIGN KEY (typeIds)
	REFERENCES blog_type (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_content
	ADD FOREIGN KEY (colunmIds)
	REFERENCES cms_column (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_questions
	ADD FOREIGN KEY (contentIds)
	REFERENCES cms_content (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_announcement
	ADD FOREIGN KEY (contentIds)
	REFERENCES cms_content (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_comment
	ADD FOREIGN KEY (contentIds)
	REFERENCES cms_content (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_yellowPage
	ADD FOREIGN KEY (contentIds)
	REFERENCES cms_content (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_download
	ADD FOREIGN KEY (contentIds)
	REFERENCES cms_content (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_library
	ADD FOREIGN KEY (contentIds)
	REFERENCES cms_content (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_vote
	ADD FOREIGN KEY (contentIds)
	REFERENCES cms_content (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_job
	ADD FOREIGN KEY (contentIds)
	REFERENCES cms_content (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_photoGallery
	ADD FOREIGN KEY (contentIds)
	REFERENCES cms_content (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_ad
	ADD FOREIGN KEY (locationIds)
	REFERENCES cms_location (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_photoGalleryItem
	ADD FOREIGN KEY (photoGalleryIds)
	REFERENCES cms_photoGallery (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_answers
	ADD FOREIGN KEY (questionsIds)
	REFERENCES cms_questions (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cms_voteItem
	ADD FOREIGN KEY (voteIds)
	REFERENCES cms_vote (ids)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



/* Comments */

COMMENT ON TABLE blog_article IS '文章';
COMMENT ON COLUMN blog_article.ids IS '主键';
COMMENT ON COLUMN blog_article.version IS '乐观锁';
COMMENT ON COLUMN blog_article.createUser IS '创建人';
COMMENT ON COLUMN blog_article.createDate IS '创建时间';
COMMENT ON COLUMN blog_article.updateUser IS '最后更新人';
COMMENT ON COLUMN blog_article.updateDate IS '最后更新时间';
COMMENT ON COLUMN blog_article.isDelete IS '是否删除';
COMMENT ON COLUMN blog_article.deleteUser IS '删除人';
COMMENT ON COLUMN blog_article.deleteDate IS '删除时间';
COMMENT ON COLUMN blog_article.draft IS '是否草稿 : 0否，1是';
COMMENT ON COLUMN blog_article.title IS '标题';
COMMENT ON COLUMN blog_article.digest IS '摘要';
COMMENT ON COLUMN blog_article.keyword IS '关键字';
COMMENT ON COLUMN blog_article.content IS '内容';
COMMENT ON COLUMN blog_article.commentsRange IS '评论范围 : 0游客和注册用户，1注册用户，2禁止评论';
COMMENT ON COLUMN blog_article.stick IS '置顶 : 0否，1是';
COMMENT ON COLUMN blog_article.original IS '原创 : 0否，1是';
COMMENT ON COLUMN blog_article.viewCount IS '浏览次数';
COMMENT ON COLUMN blog_article.commentCount IS '评论次数';
COMMENT ON COLUMN blog_article.favoriteCount IS '收藏次数';
COMMENT ON COLUMN blog_article.praiseCount IS '点赞次数';
COMMENT ON COLUMN blog_article.trampleCount IS '踩次数';
COMMENT ON COLUMN blog_article.typeIds IS '分类主键';
COMMENT ON TABLE blog_articleComment IS '博文评论';
COMMENT ON COLUMN blog_articleComment.ids IS '主键';
COMMENT ON COLUMN blog_articleComment.version IS '乐观锁';
COMMENT ON COLUMN blog_articleComment.content IS '评论内容';
COMMENT ON COLUMN blog_articleComment.createUser IS '评论人';
COMMENT ON COLUMN blog_articleComment.createDate IS '评论时间';
COMMENT ON COLUMN blog_articleComment.updateUser IS '最后修改人';
COMMENT ON COLUMN blog_articleComment.updateDate IS '最后修改时间';
COMMENT ON COLUMN blog_articleComment.isDelete IS '是否删除';
COMMENT ON COLUMN blog_articleComment.deleteUser IS '删除人';
COMMENT ON COLUMN blog_articleComment.deleteDate IS '删除时间';
COMMENT ON COLUMN blog_articleComment.praiseCount IS '点赞次数';
COMMENT ON COLUMN blog_articleComment.trampleCount IS '踩次数';
COMMENT ON COLUMN blog_articleComment.pIds IS '上级评论';
COMMENT ON COLUMN blog_articleComment.articleIds IS '文章主键';
COMMENT ON TABLE blog_circle IS '圈子';
COMMENT ON COLUMN blog_circle.ids IS '主键';
COMMENT ON COLUMN blog_circle.version IS '乐观锁';
COMMENT ON COLUMN blog_circle.name IS '圈子名称';
COMMENT ON COLUMN blog_circle.createUser IS '创建人';
COMMENT ON COLUMN blog_circle.createDate IS '创建时间';
COMMENT ON COLUMN blog_circle.updateUser IS '最后修改人';
COMMENT ON COLUMN blog_circle.updateDate IS '最后修改时间';
COMMENT ON COLUMN blog_circle.isDelete IS '是否删除';
COMMENT ON COLUMN blog_circle.deleteUser IS '删除人';
COMMENT ON COLUMN blog_circle.deleteDate IS '删除时间';
COMMENT ON COLUMN blog_circle.viewCount IS '浏览次数';
COMMENT ON COLUMN blog_circle.url IS '圈子url';
COMMENT ON COLUMN blog_circle.manageUser IS '圈子管理员 : 多个逗号隔开，最多十个';
COMMENT ON TABLE blog_circleUser IS '圈子成员';
COMMENT ON COLUMN blog_circleUser.ids IS '主键';
COMMENT ON COLUMN blog_circleUser.version IS '乐观锁';
COMMENT ON COLUMN blog_circleUser.createUser IS '创建人';
COMMENT ON COLUMN blog_circleUser.createDate IS '创建时间';
COMMENT ON COLUMN blog_circleUser.updateUser IS '最后修改人';
COMMENT ON COLUMN blog_circleUser.updateDate IS '最后修改时间';
COMMENT ON COLUMN blog_circleUser.isDelete IS '是否删除';
COMMENT ON COLUMN blog_circleUser.deleteUser IS '删除人';
COMMENT ON COLUMN blog_circleUser.deleteDate IS '删除时间';
COMMENT ON COLUMN blog_circleUser.status IS '申请加入圈子状态 : 0初始化申请，1申请通过，2不通过';
COMMENT ON COLUMN blog_circleUser.circleIds IS '圈子主键';
COMMENT ON TABLE blog_favorite IS '收藏夹';
COMMENT ON COLUMN blog_favorite.ids IS '主键';
COMMENT ON COLUMN blog_favorite.version IS '乐观锁';
COMMENT ON COLUMN blog_favorite.title IS '标题';
COMMENT ON COLUMN blog_favorite.url IS 'url地址';
COMMENT ON COLUMN blog_favorite.createUser IS '收藏用户';
COMMENT ON COLUMN blog_favorite.createDate IS '收藏时间';
COMMENT ON COLUMN blog_favorite.isDelete IS '是否删除';
COMMENT ON COLUMN blog_favorite.deleteUser IS '删除人';
COMMENT ON COLUMN blog_favorite.deleteDate IS '删除时间';
COMMENT ON TABLE blog_inform IS '举报';
COMMENT ON COLUMN blog_inform.ids IS '主键';
COMMENT ON COLUMN blog_inform.version IS '乐观锁';
COMMENT ON COLUMN blog_inform.createUser IS '创建人';
COMMENT ON COLUMN blog_inform.createDate IS '创建时间';
COMMENT ON COLUMN blog_inform.isDelete IS '是否删除';
COMMENT ON COLUMN blog_inform.deleteUser IS '删除人';
COMMENT ON COLUMN blog_inform.deleteDate IS '删除时间';
COMMENT ON COLUMN blog_inform.type IS '分类';
COMMENT ON COLUMN blog_inform.targetIds IS '目标ids';
COMMENT ON COLUMN blog_inform.explain IS '举报说明';
COMMENT ON COLUMN blog_inform.status IS '处理状态 : 0提交举报,1举报成功,2举报失败';
COMMENT ON COLUMN blog_inform.result IS '结果说明';
COMMENT ON TABLE blog_link IS '友情链接';
COMMENT ON COLUMN blog_link.ids IS '主键';
COMMENT ON COLUMN blog_link.version IS '乐观锁';
COMMENT ON COLUMN blog_link.name IS '名称';
COMMENT ON COLUMN blog_link.url IS '链接地址';
COMMENT ON COLUMN blog_link.logo IS 'logo图片';
COMMENT ON COLUMN blog_link.uploadIds IS '上传文件ids';
COMMENT ON COLUMN blog_link.createUser IS '创建人';
COMMENT ON COLUMN blog_link.createDate IS '创建时间';
COMMENT ON COLUMN blog_link.updateUser IS '最后修改人';
COMMENT ON COLUMN blog_link.updateDate IS '最后修改时间';
COMMENT ON COLUMN blog_link.isDelete IS '是否逻辑删除 : 0否，1是';
COMMENT ON COLUMN blog_link.deleteUser IS '删除人';
COMMENT ON COLUMN blog_link.deleteDate IS '删除时间';
COMMENT ON TABLE blog_message IS '站内消息';
COMMENT ON COLUMN blog_message.ids IS '主键';
COMMENT ON COLUMN blog_message.version IS '乐观锁';
COMMENT ON COLUMN blog_message.content IS '内容';
COMMENT ON COLUMN blog_message.createUser IS '创建人';
COMMENT ON COLUMN blog_message.createDate IS '创建时间';
COMMENT ON COLUMN blog_message.updateUser IS '最后更新人';
COMMENT ON COLUMN blog_message.updateDate IS '最后更新时间';
COMMENT ON COLUMN blog_message.isDelete IS '是否删除';
COMMENT ON COLUMN blog_message.deleteUser IS '删除人';
COMMENT ON COLUMN blog_message.deleteDate IS '删除时间';
COMMENT ON COLUMN blog_message.receiveUser IS '接收人';
COMMENT ON COLUMN blog_message.receiveDate IS '接收时间';
COMMENT ON TABLE blog_move IS '动弹';
COMMENT ON COLUMN blog_move.ids IS '主键';
COMMENT ON COLUMN blog_move.version IS '乐观锁';
COMMENT ON COLUMN blog_move.content IS '内容';
COMMENT ON COLUMN blog_move.createUser IS '创建人';
COMMENT ON COLUMN blog_move.createDate IS '创建时间';
COMMENT ON COLUMN blog_move.updateUser IS '修改人';
COMMENT ON COLUMN blog_move.updateDate IS '修改时间';
COMMENT ON COLUMN blog_move.isDelete IS '是否逻辑删除 : 0否，1是';
COMMENT ON COLUMN blog_move.deleteUser IS '删除人';
COMMENT ON COLUMN blog_move.deleteDate IS '删除时间';
COMMENT ON COLUMN blog_move.viewCount IS '浏览次数';
COMMENT ON COLUMN blog_move.commentCount IS '评论次数';
COMMENT ON COLUMN blog_move.praiseCount IS '点赞次数';
COMMENT ON COLUMN blog_move.trampleCount IS '踩次数';
COMMENT ON TABLE blog_moveComment IS '动弹评论';
COMMENT ON COLUMN blog_moveComment.ids IS '主键';
COMMENT ON COLUMN blog_moveComment.version IS '乐观锁';
COMMENT ON COLUMN blog_moveComment.content IS '评论内容';
COMMENT ON COLUMN blog_moveComment.createUser IS '评论人';
COMMENT ON COLUMN blog_moveComment.createDate IS '评论时间';
COMMENT ON COLUMN blog_moveComment.updateUser IS '最后修改人';
COMMENT ON COLUMN blog_moveComment.updateDate IS '最后修改时间';
COMMENT ON COLUMN blog_moveComment.isDelete IS '是否删除';
COMMENT ON COLUMN blog_moveComment.deleteUser IS '删除人';
COMMENT ON COLUMN blog_moveComment.deleteDate IS '删除时间';
COMMENT ON COLUMN blog_moveComment.praiseCount IS '点赞次数';
COMMENT ON COLUMN blog_moveComment.trampleCount IS '踩次数';
COMMENT ON COLUMN blog_moveComment.pIds IS '上级评论';
COMMENT ON COLUMN blog_moveComment.moveIds IS '主键';
COMMENT ON TABLE blog_newsDeliver IS '新闻投递';
COMMENT ON COLUMN blog_newsDeliver.ids IS '主键';
COMMENT ON COLUMN blog_newsDeliver.version IS '乐观锁';
COMMENT ON COLUMN blog_newsDeliver.type IS '分类';
COMMENT ON COLUMN blog_newsDeliver.title IS '标题';
COMMENT ON COLUMN blog_newsDeliver.content IS '内容';
COMMENT ON COLUMN blog_newsDeliver.createUser IS '创建人';
COMMENT ON COLUMN blog_newsDeliver.createDate IS '创建时间';
COMMENT ON COLUMN blog_newsDeliver.updateUser IS '最后更新人';
COMMENT ON COLUMN blog_newsDeliver.updateDate IS '最后更新时间';
COMMENT ON COLUMN blog_newsDeliver.isDelete IS '是否删除';
COMMENT ON COLUMN blog_newsDeliver.deleteUser IS '删除人';
COMMENT ON COLUMN blog_newsDeliver.deleteDate IS '删除时间';
COMMENT ON COLUMN blog_newsDeliver.status IS '处理状态 : 0初始化提交，1未阅，2已阅';
COMMENT ON TABLE blog_praise IS '点赞记录';
COMMENT ON COLUMN blog_praise.ids IS '主键';
COMMENT ON COLUMN blog_praise.version IS '乐观锁';
COMMENT ON COLUMN blog_praise.type IS '分类';
COMMENT ON COLUMN blog_praise.targetIds IS '目标ids';
COMMENT ON COLUMN blog_praise.createUser IS '创建人';
COMMENT ON COLUMN blog_praise.createDate IS '创建时间';
COMMENT ON COLUMN blog_praise.isDelete IS '是否删除';
COMMENT ON COLUMN blog_praise.deleteUser IS '删除人';
COMMENT ON COLUMN blog_praise.deleteDate IS '删除时间';
COMMENT ON TABLE blog_trample IS '点踩记录';
COMMENT ON COLUMN blog_trample.ids IS '主键';
COMMENT ON COLUMN blog_trample.version IS '乐观锁';
COMMENT ON COLUMN blog_trample.type IS '分类';
COMMENT ON COLUMN blog_trample.targetIds IS '目标ids';
COMMENT ON COLUMN blog_trample.createUser IS '创建人';
COMMENT ON COLUMN blog_trample.createDate IS '创建时间';
COMMENT ON COLUMN blog_trample.isDelete IS '是否删除';
COMMENT ON COLUMN blog_trample.deleteUser IS '删除人';
COMMENT ON COLUMN blog_trample.deleteDate IS '删除时间';
COMMENT ON TABLE blog_type IS '博文分类';
COMMENT ON COLUMN blog_type.ids IS '主键';
COMMENT ON COLUMN blog_type.version IS '乐观锁';
COMMENT ON COLUMN blog_type.name IS '名称';
COMMENT ON COLUMN blog_type.sort IS '排序号';
COMMENT ON COLUMN blog_type.createUser IS '创建人';
COMMENT ON COLUMN blog_type.createDate IS '创建时间';
COMMENT ON COLUMN blog_type.updateUser IS '最后修改人';
COMMENT ON COLUMN blog_type.updateDate IS '最后修改时间';
COMMENT ON COLUMN blog_type.isDelete IS '是否删除';
COMMENT ON COLUMN blog_type.deleteUser IS '删除人';
COMMENT ON COLUMN blog_type.deleteDate IS '删除时间';
COMMENT ON TABLE cms_accessStatistics IS '访问统计';
COMMENT ON COLUMN cms_accessStatistics.ids IS '主键';
COMMENT ON COLUMN cms_accessStatistics.version IS '乐观锁';
COMMENT ON COLUMN cms_accessStatistics.total IS '总数量';
COMMENT ON COLUMN cms_accessStatistics.yesterday IS '昨日';
COMMENT ON COLUMN cms_accessStatistics.today IS '今日';
COMMENT ON COLUMN cms_accessStatistics.week IS '本周';
COMMENT ON COLUMN cms_accessStatistics.month IS '本月';
COMMENT ON COLUMN cms_accessStatistics.updateDate IS '最后更新时间';
COMMENT ON TABLE cms_ad IS '广告';
COMMENT ON COLUMN cms_ad.ids IS '主键';
COMMENT ON COLUMN cms_ad.version IS '乐观锁';
COMMENT ON COLUMN cms_ad.createUser IS '创建人';
COMMENT ON COLUMN cms_ad.createDate IS '创建时间';
COMMENT ON COLUMN cms_ad.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_ad.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_ad.isDelete IS '是否删除';
COMMENT ON COLUMN cms_ad.deleteUser IS '删除人';
COMMENT ON COLUMN cms_ad.deleteDate IS '删除时间';
COMMENT ON COLUMN cms_ad.viewCount IS '浏览次数';
COMMENT ON COLUMN cms_ad.clickCount IS '点击次数';
COMMENT ON COLUMN cms_ad.name IS '广告名称';
COMMENT ON COLUMN cms_ad.type IS '广告类型';
COMMENT ON COLUMN cms_ad.imagePath IS '广告图片';
COMMENT ON COLUMN cms_ad.imageIds IS '图片上传Ids';
COMMENT ON COLUMN cms_ad.startDate IS '启用时间';
COMMENT ON COLUMN cms_ad.endDate IS '停用时间';
COMMENT ON COLUMN cms_ad.sort IS '排序';
COMMENT ON COLUMN cms_ad.status IS '状态（是否启用） : 0否，1是';
COMMENT ON COLUMN cms_ad.locationIds IS '广告位主键';
COMMENT ON TABLE cms_announcement IS '公告';
COMMENT ON COLUMN cms_announcement.ids IS '主键';
COMMENT ON COLUMN cms_announcement.startDate IS '有效开始时间';
COMMENT ON COLUMN cms_announcement.endDate IS '有效结束时间';
COMMENT ON COLUMN cms_announcement.contentIds IS '内容主键';
COMMENT ON TABLE cms_answers IS '回答';
COMMENT ON COLUMN cms_answers.ids IS '主键';
COMMENT ON COLUMN cms_answers.version IS '乐观锁';
COMMENT ON COLUMN cms_answers.content IS '评论内容';
COMMENT ON COLUMN cms_answers.createUser IS '评论人';
COMMENT ON COLUMN cms_answers.createDate IS '评论时间';
COMMENT ON COLUMN cms_answers.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_answers.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_answers.isDelete IS '是否删除';
COMMENT ON COLUMN cms_answers.deleteUser IS '删除人';
COMMENT ON COLUMN cms_answers.deleteDate IS '删除时间';
COMMENT ON COLUMN cms_answers.praiseCount IS '点赞次数';
COMMENT ON COLUMN cms_answers.trampleCount IS '踩次数';
COMMENT ON COLUMN cms_answers.pIds IS '上级评论';
COMMENT ON COLUMN cms_answers.answers IS '是否最佳答案 : 0否，1是';
COMMENT ON COLUMN cms_answers.questionsIds IS '主键';
COMMENT ON TABLE cms_column IS '栏目';
COMMENT ON COLUMN cms_column.ids IS '主键';
COMMENT ON COLUMN cms_column.version IS '乐观锁';
COMMENT ON COLUMN cms_column.createUser IS '创建人';
COMMENT ON COLUMN cms_column.createDate IS '创建时间';
COMMENT ON COLUMN cms_column.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_column.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_column.isDelete IS '是否删除';
COMMENT ON COLUMN cms_column.deleteUser IS '删除人';
COMMENT ON COLUMN cms_column.deleteDate IS '删除时间';
COMMENT ON COLUMN cms_column.name IS '栏目名称';
COMMENT ON COLUMN cms_column.sort IS '栏目排序';
COMMENT ON COLUMN cms_column.url IS '栏目地址';
COMMENT ON COLUMN cms_column.pIds IS '上级栏目ids : 0否，1是';
COMMENT ON COLUMN cms_column.level IS '栏目等级';
COMMENT ON COLUMN cms_column.isParent IS '是否父节点';
COMMENT ON TABLE cms_comment IS '内容评论';
COMMENT ON COLUMN cms_comment.ids IS '主键';
COMMENT ON COLUMN cms_comment.version IS '乐观锁';
COMMENT ON COLUMN cms_comment.content IS '评论内容';
COMMENT ON COLUMN cms_comment.createUser IS '评论人';
COMMENT ON COLUMN cms_comment.createDate IS '评论时间';
COMMENT ON COLUMN cms_comment.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_comment.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_comment.isDelete IS '是否删除';
COMMENT ON COLUMN cms_comment.deleteUser IS '删除人';
COMMENT ON COLUMN cms_comment.deleteDate IS '删除时间';
COMMENT ON COLUMN cms_comment.praiseCount IS '点赞次数';
COMMENT ON COLUMN cms_comment.trampleCount IS '踩次数';
COMMENT ON COLUMN cms_comment.pIds IS '上级评论';
COMMENT ON COLUMN cms_comment.contentIds IS '内容主键';
COMMENT ON TABLE cms_content IS '内容';
COMMENT ON COLUMN cms_content.ids IS '主键';
COMMENT ON COLUMN cms_content.version IS '乐观锁';
COMMENT ON COLUMN cms_content.createUser IS '创建人';
COMMENT ON COLUMN cms_content.createDate IS '创建时间';
COMMENT ON COLUMN cms_content.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_content.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_content.isDelete IS '是否删除';
COMMENT ON COLUMN cms_content.deleteUser IS '删除人';
COMMENT ON COLUMN cms_content.deleteDate IS '删除时间';
COMMENT ON COLUMN cms_content.title IS '标题';
COMMENT ON COLUMN cms_content.color IS '标题颜色';
COMMENT ON COLUMN cms_content.overstriking IS '标题加粗';
COMMENT ON COLUMN cms_content.digest IS '摘要';
COMMENT ON COLUMN cms_content.keyword IS '关键字';
COMMENT ON COLUMN cms_content.content IS '内容';
COMMENT ON COLUMN cms_content.commentsRange IS '评论范围 : 0游客和注册用户，1注册用户，2禁止评论';
COMMENT ON COLUMN cms_content.viewCount IS '浏览次数';
COMMENT ON COLUMN cms_content.commentCount IS '评论次数';
COMMENT ON COLUMN cms_content.favoriteCount IS '收藏次数';
COMMENT ON COLUMN cms_content.praiseCount IS '点赞次数';
COMMENT ON COLUMN cms_content.trampleCount IS '踩次数';
COMMENT ON COLUMN cms_content.colunmIds IS '栏目主键';
COMMENT ON TABLE cms_download IS '下载';
COMMENT ON COLUMN cms_download.ids IS '主键';
COMMENT ON COLUMN cms_download.url IS '链接地址';
COMMENT ON COLUMN cms_download.isLink IS '是否外部链接 : 0否，1是';
COMMENT ON COLUMN cms_download.systems IS '系统平台 : windows xp，windows 2000，windows 2003等待';
COMMENT ON COLUMN cms_download.copytype IS '软件授权形式';
COMMENT ON COLUMN cms_download.language IS '软件语言';
COMMENT ON COLUMN cms_download.classtype IS '软件类型';
COMMENT ON COLUMN cms_download.softVersion IS '软件版本';
COMMENT ON COLUMN cms_download.size IS '文件大小';
COMMENT ON COLUMN cms_download.contentIds IS '内容主键';
COMMENT ON TABLE cms_ipBlacklist IS 'IP黑名单';
COMMENT ON COLUMN cms_ipBlacklist.ids IS '主键';
COMMENT ON COLUMN cms_ipBlacklist.version IS '乐观锁';
COMMENT ON COLUMN cms_ipBlacklist.ip IS 'ip地址';
COMMENT ON COLUMN cms_ipBlacklist.expiresDate IS '到期解除时间';
COMMENT ON COLUMN cms_ipBlacklist.createUser IS '创建人';
COMMENT ON COLUMN cms_ipBlacklist.createDate IS '创建时间';
COMMENT ON COLUMN cms_ipBlacklist.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_ipBlacklist.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_ipBlacklist.isDelete IS '是否逻辑删除';
COMMENT ON COLUMN cms_ipBlacklist.deleteUser IS '删除人';
COMMENT ON COLUMN cms_ipBlacklist.deleteDate IS '删除时间';
COMMENT ON TABLE cms_job IS '招聘';
COMMENT ON COLUMN cms_job.ids IS '主键';
COMMENT ON COLUMN cms_job.startDate IS '发布开始时间';
COMMENT ON COLUMN cms_job.endDate IS '发布截止时间';
COMMENT ON COLUMN cms_job.type IS '职位类别 : 字典配置';
COMMENT ON COLUMN cms_job.year IS '工作年限 : 字典进行配置';
COMMENT ON COLUMN cms_job.education IS '学历 : 字典配置';
COMMENT ON COLUMN cms_job.salary IS '薪水 : 字典配置';
COMMENT ON COLUMN cms_job.address IS '工作地点 : 字典配置';
COMMENT ON COLUMN cms_job.nature IS '工作性质 : 0全职， 1兼职';
COMMENT ON COLUMN cms_job.manage IS '管理经验 : 0要求， 1不要求';
COMMENT ON COLUMN cms_job.quantity IS '招聘人数 : 字典配置';
COMMENT ON COLUMN cms_job.contentIds IS '内容主键';
COMMENT ON TABLE cms_library IS '文库';
COMMENT ON COLUMN cms_library.ids IS '主键';
COMMENT ON COLUMN cms_library.author IS '作者';
COMMENT ON COLUMN cms_library.source IS '来源';
COMMENT ON COLUMN cms_library.url IS '来源url';
COMMENT ON COLUMN cms_library.uploadIds IS '上传文档ids';
COMMENT ON COLUMN cms_library.path IS '文档路径';
COMMENT ON COLUMN cms_library.contentIds IS '内容主键';
COMMENT ON TABLE cms_link IS '友情链接';
COMMENT ON COLUMN cms_link.ids IS '主键';
COMMENT ON COLUMN cms_link.version IS '乐观锁';
COMMENT ON COLUMN cms_link.name IS '名称';
COMMENT ON COLUMN cms_link.url IS '链接地址';
COMMENT ON COLUMN cms_link.logo IS 'logo图片';
COMMENT ON COLUMN cms_link.uploadIds IS '上传文件ids';
COMMENT ON COLUMN cms_link.createUser IS '创建人';
COMMENT ON COLUMN cms_link.createDate IS '创建时间';
COMMENT ON COLUMN cms_link.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_link.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_link.isDelete IS '是否逻辑删除 : 0否，1是';
COMMENT ON COLUMN cms_link.deleteUser IS '删除人';
COMMENT ON COLUMN cms_link.deleteDate IS '删除时间';
COMMENT ON TABLE cms_location IS '广告位置';
COMMENT ON COLUMN cms_location.ids IS '主键';
COMMENT ON COLUMN cms_location.version IS '乐观锁';
COMMENT ON COLUMN cms_location.createUser IS '创建人';
COMMENT ON COLUMN cms_location.createDate IS '创建时间';
COMMENT ON COLUMN cms_location.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_location.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_location.isDelete IS '是否删除';
COMMENT ON COLUMN cms_location.deleteUser IS '删除人';
COMMENT ON COLUMN cms_location.deleteDate IS '删除时间';
COMMENT ON COLUMN cms_location.name IS '名称';
COMMENT ON COLUMN cms_location.type IS '类型';
COMMENT ON COLUMN cms_location.width IS '宽度';
COMMENT ON COLUMN cms_location.height IS '高度';
COMMENT ON COLUMN cms_location.description IS '描述';
COMMENT ON COLUMN cms_location.adCount IS '广告数量';
COMMENT ON COLUMN cms_location.status IS '状态（是否启用） : 0否，1是';
COMMENT ON TABLE cms_photoGallery IS '图片库';
COMMENT ON COLUMN cms_photoGallery.ids IS '主键';
COMMENT ON COLUMN cms_photoGallery.author IS '作者';
COMMENT ON COLUMN cms_photoGallery.source IS '来源';
COMMENT ON COLUMN cms_photoGallery.url IS '来源url';
COMMENT ON COLUMN cms_photoGallery.titlePicture IS '标题图';
COMMENT ON COLUMN cms_photoGallery.titlePicturePath IS '标题图路径';
COMMENT ON COLUMN cms_photoGallery.contentIds IS '内容主键';
COMMENT ON TABLE cms_photoGalleryItem IS '图片库图片';
COMMENT ON COLUMN cms_photoGalleryItem.ids IS '主键';
COMMENT ON COLUMN cms_photoGalleryItem.version IS '乐观锁';
COMMENT ON COLUMN cms_photoGalleryItem.createUser IS '创建人';
COMMENT ON COLUMN cms_photoGalleryItem.createDate IS '创建时间';
COMMENT ON COLUMN cms_photoGalleryItem.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_photoGalleryItem.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_photoGalleryItem.isDelete IS '是否删除';
COMMENT ON COLUMN cms_photoGalleryItem.deleteUser IS '删除人';
COMMENT ON COLUMN cms_photoGalleryItem.deleteDate IS '删除时间';
COMMENT ON COLUMN cms_photoGalleryItem.uploadIds IS '上传ids';
COMMENT ON COLUMN cms_photoGalleryItem.uploadPath IS '上传路径';
COMMENT ON COLUMN cms_photoGalleryItem.photoGalleryIds IS '主键';
COMMENT ON TABLE cms_questions IS '问题';
COMMENT ON COLUMN cms_questions.ids IS '主键';
COMMENT ON COLUMN cms_questions.answersIds IS '最佳回答ids';
COMMENT ON COLUMN cms_questions.contentIds IS '内容主键';
COMMENT ON TABLE cms_sensitiveWord IS '敏感词';
COMMENT ON COLUMN cms_sensitiveWord.ids IS '主键';
COMMENT ON COLUMN cms_sensitiveWord.version IS '乐观锁';
COMMENT ON COLUMN cms_sensitiveWord.sensitiveWord IS '敏感词';
COMMENT ON COLUMN cms_sensitiveWord.level IS '敏感级别 : 1高，2中，3低';
COMMENT ON COLUMN cms_sensitiveWord.replaceWord IS '替换词';
COMMENT ON COLUMN cms_sensitiveWord.sort IS '排序';
COMMENT ON COLUMN cms_sensitiveWord.createUser IS '创建人';
COMMENT ON COLUMN cms_sensitiveWord.createDate IS '创建时间';
COMMENT ON COLUMN cms_sensitiveWord.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_sensitiveWord.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_sensitiveWord.isDelete IS '是否删除';
COMMENT ON COLUMN cms_sensitiveWord.deleteUser IS '删除人';
COMMENT ON COLUMN cms_sensitiveWord.deleteDate IS '删除时间';
COMMENT ON TABLE cms_template IS '模板';
COMMENT ON COLUMN cms_template.ids IS '主键';
COMMENT ON COLUMN cms_template.version IS '乐观锁';
COMMENT ON COLUMN cms_template.createUser IS '创建人';
COMMENT ON COLUMN cms_template.createDate IS '创建时间';
COMMENT ON COLUMN cms_template.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_template.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_template.isDelete IS '是否删除';
COMMENT ON COLUMN cms_template.deleteUser IS '删除人';
COMMENT ON COLUMN cms_template.deleteDate IS '删除时间';
COMMENT ON COLUMN cms_template.name IS '模板名称';
COMMENT ON COLUMN cms_template.content IS '模板内容';
COMMENT ON COLUMN cms_template.type IS '模板类型';
COMMENT ON COLUMN cms_template.targetIds IS '应用目标Ids';
COMMENT ON TABLE cms_vote IS '投票';
COMMENT ON COLUMN cms_vote.ids IS '主键';
COMMENT ON COLUMN cms_vote.voteRange IS '投票范围';
COMMENT ON COLUMN cms_vote.contentIds IS '内容主键';
COMMENT ON TABLE cms_voteItem IS '投票项';
COMMENT ON COLUMN cms_voteItem.ids IS '主键';
COMMENT ON COLUMN cms_voteItem.version IS '乐观锁';
COMMENT ON COLUMN cms_voteItem.createUser IS '创建人';
COMMENT ON COLUMN cms_voteItem.createDate IS '创建时间';
COMMENT ON COLUMN cms_voteItem.updateUser IS '最后修改人';
COMMENT ON COLUMN cms_voteItem.updateDate IS '最后修改时间';
COMMENT ON COLUMN cms_voteItem.isDelete IS '是否删除';
COMMENT ON COLUMN cms_voteItem.deleteUser IS '删除人';
COMMENT ON COLUMN cms_voteItem.deleteDate IS '删除时间';
COMMENT ON COLUMN cms_voteItem.name IS '项名称';
COMMENT ON COLUMN cms_voteItem.voteCount IS '投票次数';
COMMENT ON COLUMN cms_voteItem.voteIds IS '投票主键';
COMMENT ON TABLE cms_yellowPage IS '黄页';
COMMENT ON COLUMN cms_yellowPage.ids IS '主键';
COMMENT ON COLUMN cms_yellowPage.address IS '地址';
COMMENT ON COLUMN cms_yellowPage.contacts IS '联系人';
COMMENT ON COLUMN cms_yellowPage.fixPhone IS '固话';
COMMENT ON COLUMN cms_yellowPage.mobile IS '移动电话';
COMMENT ON COLUMN cms_yellowPage.postcode IS '邮编';
COMMENT ON COLUMN cms_yellowPage.qq IS '在线qq : 多个逗号隔开，最多5个';
COMMENT ON COLUMN cms_yellowPage.contentIds IS '内容主键';



