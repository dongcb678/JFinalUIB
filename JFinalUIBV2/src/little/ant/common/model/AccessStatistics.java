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
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 乐观锁
	*/
	public static final String colunm_version = "version";
	
	/**
	* 总数量
	*/
	public static final String colunm_total = "total";
	
	/**
	* 昨日
	*/
	public static final String colunm_yesterday = "yesterday";
	
	/**
	* 今日
	*/
	public static final String colunm_today = "today";
	
	/**
	* 本周
	*/
	public static final String colunm_week = "week";
	
	/**
	* 本月
	*/
	public static final String colunm_month = "month";
	
	/**
	* 最后更新时间
	*/
	public static final String colunm_updatedate = "updatedate";
	
	
}
