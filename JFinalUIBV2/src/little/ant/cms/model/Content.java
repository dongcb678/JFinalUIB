package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 内容 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_content")
public class Content extends BaseModel<Content> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Content.class);
	
	public static final Content dao = new Content();
	
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
	 * 字段描述：创建人 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_createuser = "createuser";
	
	/**
	 * 字段描述：创建时间 
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
	 * 字段描述：标题 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_title = "title";
	
	/**
	 * 字段描述：标题颜色 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_color = "color";
	
	/**
	 * 字段描述：标题加粗 
	 * 字段类型 ：character 
	 */
	public static final String colunm_overstriking = "overstriking";
	
	/**
	 * 字段描述：摘要 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_digest = "digest";
	
	/**
	 * 字段描述：关键字 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_keyword = "keyword";
	
	/**
	 * 字段描述：内容 
	 * 字段类型 ：text 
	 */
	public static final String colunm_content = "content";
	
	/**
	 * 字段描述：评论范围 : 0游客和注册用户，1注册用户，2禁止评论 
	 * 字段类型 ：character 
	 */
	public static final String colunm_commentsrange = "commentsrange";
	
	/**
	 * 字段描述：浏览次数 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_viewcount = "viewcount";
	
	/**
	 * 字段描述：评论次数 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_commentcount = "commentcount";
	
	/**
	 * 字段描述：收藏次数 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_favoritecount = "favoritecount";
	
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
	 * 字段描述：栏目主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_colunmids = "colunmids";
	
	
}
