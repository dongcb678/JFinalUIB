package little.ant.common.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 广告位置 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "common_location")
public class Location extends BaseModel<Location> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Location.class);
	
	public static final Location dao = new Location();
	
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
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String column_name = "name";
	
	/**
	 * 字段描述：类型 
	 * 字段类型 ：character varying 
	 */
	public static final String column_type = "type";
	
	/**
	 * 字段描述：宽度 
	 * 字段类型 ：bigint 
	 */
	public static final String column_width = "width";
	
	/**
	 * 字段描述：高度 
	 * 字段类型 ：bigint 
	 */
	public static final String column_height = "height";
	
	/**
	 * 字段描述：描述 
	 * 字段类型 ：text 
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：广告数量 
	 * 字段类型 ：bigint 
	 */
	public static final String column_adcount = "adcount";
	
	/**
	 * 字段描述：状态（是否启用） : 0否，1是 
	 * 字段类型 ：character 
	 */
	public static final String column_status = "status";

	/**
	 * sqlId : common.location.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "common.location.splitPageSelect";

	/**
	 * sqlId : common.location.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "common.location.splitPageFrom";

	
}
