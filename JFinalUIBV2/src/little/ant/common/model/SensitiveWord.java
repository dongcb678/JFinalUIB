package little.ant.common.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 敏感词 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "common_sensitiveword")
public class SensitiveWord extends BaseModel<SensitiveWord> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(SensitiveWord.class);
	
	public static final SensitiveWord dao = new SensitiveWord();
	
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
	 * 字段描述：敏感词 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_sensitiveword = "sensitiveword";
	
	/**
	 * 字段描述：敏感级别 : 1高，2中，3低 
	 * 字段类型 ：character 
	 */
	public static final String colunm_level = "level";
	
	/**
	 * 字段描述：替换词 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_replaceword = "replaceword";
	
	/**
	 * 字段描述：排序 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_sort = "sort";
	
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
	
	
}
