package little.ant.common.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 访问统计 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "common_accessstatistics")
public class AccessStatistics extends BaseModel<AccessStatistics> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(AccessStatistics.class);
	
	public static final AccessStatistics dao = new AccessStatistics();
	
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
	 * 字段描述：总数量 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_total = "total";
	
	/**
	 * 字段描述：昨日 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_yesterday = "yesterday";
	
	/**
	 * 字段描述：今日 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_today = "today";
	
	/**
	 * 字段描述：本周 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_week = "week";
	
	/**
	 * 字段描述：本月 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_month = "month";
	
	/**
	 * 字段描述：最后更新时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String colunm_updatedate = "updatedate";
	
	
}
