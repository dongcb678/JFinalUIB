package com.test.mvc.blog;

import java.sql.Timestamp;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 博客表 model
 * @author 董华健  dongcb678@163.com
 */
@SuppressWarnings("unused")
@Table(tableName = "test_blog")
public class Blog extends BaseModel<Blog> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static final Log log = Log.getLog(Blog.class);
	
	public static final Blog dao = new Blog().dao();
	
	/**
	 * 字段描述：主键 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：标题 
	 * 字段类型：character varying  长度：200
	 */
	public static final String column_title = "title";
	
	/**
	 * 字段描述：内容 
	 * 字段类型：text  长度：null
	 */
	public static final String column_content = "content";
	
	/**
	 * 字段描述：创建时间 
	 * 字段类型：timestamp with time zone  长度：null
	 */
	public static final String column_createtime = "createtime";
	
	
	/**
	 * sqlId : test.blog.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPageFrom = "test.blog.splitPageFrom";

	private String ids;
	private String title;
	private String content;
	private String createtime;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setTitle(String title){
		set(column_title, title);
	}
	public String getTitle() {
		return get(column_title);
	}
	public void setContent(String content){
		set(column_content, content);
	}
	public String getContent() {
		return get(column_content);
	}
	public void setCreatetime(Timestamp createtime){
		set(column_createtime, createtime);
	}
	public Timestamp getCreatetime() {
		return get(column_createtime);
	}
	
}
