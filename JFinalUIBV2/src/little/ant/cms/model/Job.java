package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_job")
public class Job extends BaseModel<Job> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Job.class);
	
	public static final Job dao = new Job();
	
	public static final String colunm_ids = "ids";
	public static final String colunm_startdate = "startdate";
	public static final String colunm_enddate = "enddate";
	public static final String colunm_type = "type";
	public static final String colunm_year = "year";
	public static final String colunm_education = "education";
	public static final String colunm_salary = "salary";
	public static final String colunm_address = "address";
	public static final String colunm_nature = "nature";
	public static final String colunm_manage = "manage";
	public static final String colunm_quantity = "quantity";
	public static final String colunm_contentids = "contentids";
	
}
