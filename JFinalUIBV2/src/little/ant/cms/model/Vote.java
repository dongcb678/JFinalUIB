package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 投票 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "cms_vote")
public class Vote extends BaseModel<Vote> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Vote.class);
	
	public static final Vote dao = new Vote();
	
	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：投票范围 
	 * 字段类型 ：character 
	 */
	public static final String column_voterange = "voterange";
	
	/**
	 * 字段描述：内容主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_contentids = "contentids";

	/**
	 * sqlId : cms.vote.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "cms.vote.splitPageSelect";

	/**
	 * sqlId : cms.vote.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "cms.vote.splitPageFrom";

	
}
