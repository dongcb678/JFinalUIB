package little.ant.test.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 博客表 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "test_blog")
public class TestBlog extends BaseModel<TestBlog> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(TestBlog.class);
	
	public static final TestBlog dao = new TestBlog();
	
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
	 * 字段类型：text  
	 */
	public static final String column_content = "content";
	
	/**
	 * 字段描述：创建时间 
	 * 字段类型：timestamp with time zone  
	 */
	public static final String column_createtime = "createtime";
	
	
	/**
	 * sqlId : test.testBlog.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "test.testBlog.splitPageFrom";
	
}
