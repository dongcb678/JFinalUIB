package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 圈子 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "blog_circle")
public class Circle extends BaseModel<Circle> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Circle.class);
	
	public static final Circle dao = new Circle();
	
	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：乐观锁 
	 * 字段类型 ：bigint 
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：圈子名称 
	 * 字段类型 ：character varying 
	 */
	public static final String column_name = "name";
	
	/**
	 * 字段描述：创建人 
	 * 字段类型 ：character varying 
	 */
	public static final String column_createuser = "createuser";
	
	/**
	 * 字段描述：创建时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String column_createdate = "createdate";
	
	/**
	 * 字段描述：最后修改人 
	 * 字段类型 ：character varying 
	 */
	public static final String column_updateuser = "updateuser";
	
	/**
	 * 字段描述：最后修改时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String column_updatedate = "updatedate";
	
	/**
	 * 字段描述：是否删除 
	 * 字段类型 ：character 
	 */
	public static final String column_isdelete = "isdelete";
	
	/**
	 * 字段描述：删除人 
	 * 字段类型 ：character varying 
	 */
	public static final String column_deleteuser = "deleteuser";
	
	/**
	 * 字段描述：删除时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String column_deletedate = "deletedate";
	
	/**
	 * 字段描述：浏览次数 
	 * 字段类型 ：bigint 
	 */
	public static final String column_viewcount = "viewcount";
	
	/**
	 * 字段描述：圈子url 
	 * 字段类型 ：character varying 
	 */
	public static final String column_url = "url";
	
	/**
	 * 字段描述：圈子管理员 : 多个逗号隔开，最多十个 
	 * 字段类型 ：character varying 
	 */
	public static final String column_manageuser = "manageuser";

	/**
	 * sqlId : blog.circle.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "blog.circle.splitPageSelect";

	/**
	 * sqlId : blog.circle.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "blog.circle.splitPageFrom";

	
}
