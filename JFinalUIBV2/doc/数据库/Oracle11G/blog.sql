
/* Drop Tables */

DROP TABLE test_blog CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE test_blog
(
	-- 主键
	ids varchar2(32) NOT NULL,
	-- 标题
	title varchar2(200),
	-- 内容
	content clob,
	-- 创建时间
	createTime timestamp with time zone,
	PRIMARY KEY (ids)
);



/* Comments */

COMMENT ON COLUMN test_blog.ids IS '主键';
COMMENT ON COLUMN test_blog.title IS '标题';
COMMENT ON COLUMN test_blog.content IS '内容';
COMMENT ON COLUMN test_blog.createTime IS '创建时间';



