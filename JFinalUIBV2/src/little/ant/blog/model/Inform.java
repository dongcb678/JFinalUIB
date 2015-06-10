package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 举报 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "blog_inform")
public class Inform extends BaseModel<Inform> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Inform.class);
	
	public static final Inform dao = new Inform();
	
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
	 * 字段描述：举报说明 
	 * 字段类型 ：text 
	 */
	public static final String column_explain = "explain";
	
	/**
	 * 字段描述：处理状态 : 0提交举报,1举报成功,2举报失败 
	 * 字段类型 ：character 
	 */
	public static final String column_status = "status";
	
	/**
	 * 字段描述：结果说明 
	 * 字段类型 ：text 
	 */
	public static final String column_result = "result";

	/**
	 * sqlId : blog.inform.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "blog.inform.splitPageSelect";

	/**
	 * sqlId : blog.inform.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "blog.inform.splitPageFrom";

	
}
