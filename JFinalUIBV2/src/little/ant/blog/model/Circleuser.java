package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 圈子成员 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "blog_circleuser")
public class Circleuser extends BaseModel<Circleuser> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Circleuser.class);
	
	public static final Circleuser dao = new Circleuser();
	
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
	 * 字段描述：申请加入圈子状态 : 0初始化申请，1申请通过，2不通过 
	 * 字段类型 ：character 
	 */
	public static final String column_status = "status";
	
	/**
	 * 字段描述：圈子主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_circleids = "circleids";

	/**
	 * sqlId : blog.circleuser.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "blog.circleuser.splitPageSelect";

	/**
	 * sqlId : blog.circleuser.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "blog.circleuser.splitPageFrom";

	
}
