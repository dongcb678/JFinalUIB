package little.ant.common.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "common_accessstatistics")
public class AccessStatistics extends BaseModel<AccessStatistics> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(AccessStatistics.class);
	
	public static final AccessStatistics dao = new AccessStatistics();
	
	public static final String colunm_ids = "ids";
	public static final String colunm_version = "version";
	public static final String colunm_total = "total";
	public static final String colunm_yesterday = "yesterday";
	public static final String colunm_today = "today";
	public static final String colunm_week = "week";
	public static final String colunm_month = "month";
	public static final String colunm_updatedate = "updatedate";
	
}
