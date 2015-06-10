package little.ant.common.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 友情链接 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "common_link")
public class Link extends BaseModel<Link> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Link.class);
	
	public static final Link dao = new Link();
	
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
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String column_name = "name";
	
	/**
	 * 字段描述：链接地址 
	 * 字段类型 ：character varying 
	 */
	public static final String column_url = "url";
	
	/**
	 * 字段描述：logo图片 
	 * 字段类型 ：character varying 
	 */
	public static final String column_logo = "logo";
	
	/**
	 * 字段描述：上传文件ids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_uploadids = "uploadids";
	
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
	 * 字段描述：是否逻辑删除 : 0否，1是 
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
	 * 字段描述：排序 
	 * 字段类型 ：bigint 
	 */
	public static final String column_sort = "sort";

	/**
	 * sqlId : common.link.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "common.link.splitPageSelect";

	/**
	 * sqlId : common.link.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "common.link.splitPageFrom";

	
}
