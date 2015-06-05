package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 招聘 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "cms_job")
public class Job extends BaseModel<Job> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Job.class);
	
	public static final Job dao = new Job();
	
	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 字段描述：发布开始时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String colunm_startdate = "startdate";
	
	/**
	 * 字段描述：发布截止时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String colunm_enddate = "enddate";
	
	/**
	 * 字段描述：职位类别 : 字典配置 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_type = "type";
	
	/**
	 * 字段描述：工作年限 : 字典进行配置 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_year = "year";
	
	/**
	 * 字段描述：学历 : 字典配置 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_education = "education";
	
	/**
	 * 字段描述：薪水 : 字典配置 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_salary = "salary";
	
	/**
	 * 字段描述：工作地点 : 字典配置 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_address = "address";
	
	/**
	 * 字段描述：工作性质 : 0全职， 1兼职 
	 * 字段类型 ：character 
	 */
	public static final String colunm_nature = "nature";
	
	/**
	 * 字段描述：管理经验 : 0要求， 1不要求 
	 * 字段类型 ：character 
	 */
	public static final String colunm_manage = "manage";
	
	/**
	 * 字段描述：招聘人数 : 字典配置 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_quantity = "quantity";
	
	/**
	 * 字段描述：内容主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_contentids = "contentids";

	/**
	 * sqlId : cms.job.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "cms.job.splitPageSelect";

	/**
	 * sqlId : cms.job.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "cms.job.splitPageFrom";

	
}
