package little.ant.common.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 广告位置 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantPlatform.db_dataSource_main, tableName = "common_location")
public class Location extends BaseModel<Location> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Location.class);
	
	public static final Location dao = new Location();
	
	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 字段描述：乐观锁 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_version = "version";
	
	/**
	 * 字段描述：创建人 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_createuser = "createuser";
	
	/**
	 * 字段描述：创建时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String colunm_createdate = "createdate";
	
	/**
	 * 字段描述：最后修改人 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_updateuser = "updateuser";
	
	/**
	 * 字段描述：最后修改时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String colunm_updatedate = "updatedate";
	
	/**
	 * 字段描述：是否删除 
	 * 字段类型 ：character 
	 */
	public static final String colunm_isdelete = "isdelete";
	
	/**
	 * 字段描述：删除人 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_deleteuser = "deleteuser";
	
	/**
	 * 字段描述：删除时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String colunm_deletedate = "deletedate";
	
	/**
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_name = "name";
	
	/**
	 * 字段描述：类型 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_type = "type";
	
	/**
	 * 字段描述：宽度 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_width = "width";
	
	/**
	 * 字段描述：高度 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_height = "height";
	
	/**
	 * 字段描述：描述 
	 * 字段类型 ：text 
	 */
	public static final String colunm_description = "description";
	
	/**
	 * 字段描述：广告数量 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_adcount = "adcount";
	
	/**
	 * 字段描述：状态（是否启用） : 0否，1是 
	 * 字段类型 ：character 
	 */
	public static final String colunm_status = "status";
	
	
}
