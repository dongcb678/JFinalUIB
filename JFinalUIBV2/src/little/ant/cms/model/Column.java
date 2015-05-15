package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 栏目 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantPlatform.db_dataSource_main, tableName = "cms_column")
public class Column extends BaseModel<Column> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Column.class);
	
	public static final Column dao = new Column();
	
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
	 * 字段描述：栏目名称 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_name = "name";
	
	/**
	 * 字段描述：栏目排序 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_sort = "sort";
	
	/**
	 * 字段描述：栏目地址 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_url = "url";
	
	/**
	 * 字段描述：上级栏目ids : 0否，1是 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_pids = "pids";
	
	/**
	 * 字段描述：栏目等级 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_level = "level";
	
	/**
	 * 字段描述：是否父节点 
	 * 字段类型 ：character 
	 */
	public static final String colunm_isparent = "isparent";
	
	
}
