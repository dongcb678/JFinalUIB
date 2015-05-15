package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 回答 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantPlatform.db_dataSource_main, tableName = "cms_answers")
public class Answers extends BaseModel<Answers> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Answers.class);
	
	public static final Answers dao = new Answers();
	
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
	 * 字段描述：评论内容 
	 * 字段类型 ：text 
	 */
	public static final String colunm_content = "content";
	
	/**
	 * 字段描述：评论人 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_createuser = "createuser";
	
	/**
	 * 字段描述：评论时间 
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
	 * 字段描述：点赞次数 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_praisecount = "praisecount";
	
	/**
	 * 字段描述：踩次数 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_tramplecount = "tramplecount";
	
	/**
	 * 字段描述：上级评论 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_pids = "pids";
	
	/**
	 * 字段描述：是否最佳答案 : 0否，1是 
	 * 字段类型 ：character 
	 */
	public static final String colunm_answers = "answers";
	
	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_questionsids = "questionsids";
	
	
}
