package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 点踩记录 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "blog_trample")
public class Trample extends BaseModel<Trample> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Trample.class);
	
	public static final Trample dao = new Trample();
	
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
	 * 字段描述：分类 
	 * 字段类型 ：character varying 
	 */
	public static final String column_type = "type";
	
	/**
	 * 字段描述：目标ids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_targetids = "targetids";
	
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
	 * sqlId : blog.trample.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "blog.trample.splitPageSelect";

	/**
	 * sqlId : blog.trample.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "blog.trample.splitPageFrom";

	
}
