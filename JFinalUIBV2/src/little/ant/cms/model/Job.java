package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 招聘 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_job")
public class Job extends BaseModel<Job> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Job.class);
	
	public static final Job dao = new Job();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 发布开始时间
	*/
	public static final String colunm_startdate = "startdate";
	
	/**
	* 发布截止时间
	*/
	public static final String colunm_enddate = "enddate";
	
	/**
	* 职位类别 : 字典配置
	*/
	public static final String colunm_type = "type";
	
	/**
	* 工作年限 : 字典进行配置
	*/
	public static final String colunm_year = "year";
	
	/**
	* 学历 : 字典配置
	*/
	public static final String colunm_education = "education";
	
	/**
	* 薪水 : 字典配置
	*/
	public static final String colunm_salary = "salary";
	
	/**
	* 工作地点 : 字典配置
	*/
	public static final String colunm_address = "address";
	
	/**
	* 工作性质 : 0全职， 1兼职
	*/
	public static final String colunm_nature = "nature";
	
	/**
	* 管理经验 : 0要求， 1不要求
	*/
	public static final String colunm_manage = "manage";
	
	/**
	* 招聘人数 : 字典配置
	*/
	public static final String colunm_quantity = "quantity";
	
	/**
	* 内容主键
	*/
	public static final String colunm_contentids = "contentids";
	
	
}
