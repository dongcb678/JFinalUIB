package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 问题 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantPlatform.db_dataSource_main, tableName = "cms_questions")
public class Questions extends BaseModel<Questions> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Questions.class);
	
	public static final Questions dao = new Questions();
	
	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 字段描述：最佳回答ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_answersids = "answersids";
	
	/**
	 * 字段描述：内容主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_contentids = "contentids";
	
	
}
