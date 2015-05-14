package little.ant.common.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 广告 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "common_ad")
public class Ad extends BaseModel<Ad> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Ad.class);
	
	public static final Ad dao = new Ad();
	
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
	 * 字段描述：浏览次数 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_viewcount = "viewcount";
	
	/**
	 * 字段描述：点击次数 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_clickcount = "clickcount";
	
	/**
	 * 字段描述：广告名称 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_name = "name";
	
	/**
	 * 字段描述：广告类型 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_type = "type";
	
	/**
	 * 字段描述：广告图片 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_imagepath = "imagepath";
	
	/**
	 * 字段描述：图片上传Ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_imageids = "imageids";
	
	/**
	 * 字段描述：启用时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String colunm_startdate = "startdate";
	
	/**
	 * 字段描述：停用时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String colunm_enddate = "enddate";
	
	/**
	 * 字段描述：排序 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_sort = "sort";
	
	/**
	 * 字段描述：状态（是否启用） : 0否，1是 
	 * 字段类型 ：character 
	 */
	public static final String colunm_status = "status";
	
	/**
	 * 字段描述：广告位主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_locationids = "locationids";
	
	
}
