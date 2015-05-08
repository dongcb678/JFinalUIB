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
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 乐观锁
	*/
	public static final String colunm_version = "version";
	
	/**
	* 敏感词
	*/
	public static final String colunm_sensitiveword = "sensitiveword";
	
	/**
	* 敏感级别 : 1高，2中，3低
	*/
	public static final String colunm_level = "level";
	
	/**
	* 替换词
	*/
	public static final String colunm_replaceword = "replaceword";
	
	/**
	* 排序
	*/
	public static final String colunm_sort = "sort";
	
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
	
	
}
