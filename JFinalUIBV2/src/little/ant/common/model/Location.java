package little.ant.common.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 广告位置 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "common_location")
public class Location extends BaseModel<Location> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Location.class);
	
	public static final Location dao = new Location();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 乐观锁
	*/
	public static final String colunm_version = "version";
	
	/**
	* 创建人
	*/
	public static final String colunm_createuser = "createuser";
	
	/**
	* 创建时间
	*/
	public static final String colunm_createdate = "createdate";
	
	/**
	* 最后修改人
	*/
	public static final String colunm_updateuser = "updateuser";
	
	/**
	* 最后修改时间
	*/
	public static final String colunm_updatedate = "updatedate";
	
	/**
	* 是否删除
	*/
	public static final String colunm_isdelete = "isdelete";
	
	/**
	* 删除人
	*/
	public static final String colunm_deleteuser = "deleteuser";
	
	/**
	* 删除时间
	*/
	public static final String colunm_deletedate = "deletedate";
	
	/**
	* 名称
	*/
	public static final String colunm_name = "name";
	
	/**
	* 类型
	*/
	public static final String colunm_type = "type";
	
	/**
	* 宽度
	*/
	public static final String colunm_width = "width";
	
	/**
	* 高度
	*/
	public static final String colunm_height = "height";
	
	/**
	* 描述
	*/
	public static final String colunm_description = "description";
	
	/**
	* 广告数量
	*/
	public static final String colunm_adcount = "adcount";
	
	/**
	* 状态（是否启用） : 0否，1是
	*/
	public static final String colunm_status = "status";
	
	
}
