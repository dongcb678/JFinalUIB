package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 文章 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "blog_article")
public class Article extends BaseModel<Article> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Article.class);
	
	public static final Article dao = new Article();
	
	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：乐观锁 
	 * 字段类型 ：bigint 
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：创建人 
	 * 字段类型 ：character varying 
	 */
	public static final String column_createuser = "createuser";
	
	/**
	 * 字段描述：创建时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String column_createdate = "createdate";
	
	/**
	 * 字段描述：最后更新人 
	 * 字段类型 ：character varying 
	 */
	public static final String column_updateuser = "updateuser";
	
	/**
	 * 字段描述：最后更新时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String column_updatedate = "updatedate";
	
	/**
	 * 字段描述：是否删除 
	 * 字段类型 ：character 
	 */
	public static final String column_isdelete = "isdelete";
	
	/**
	 * 字段描述：删除人 
	 * 字段类型 ：character varying 
	 */
	public static final String column_deleteuser = "deleteuser";
	
	/**
	 * 字段描述：删除时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String column_deletedate = "deletedate";
	
	/**
	 * 字段描述：是否草稿 : 0否，1是 
	 * 字段类型 ：character 
	 */
	public static final String column_draft = "draft";
	
	/**
	 * 字段描述：标题 
	 * 字段类型 ：character varying 
	 */
	public static final String column_title = "title";
	
	/**
	 * 字段描述：摘要 
	 * 字段类型 ：character varying 
	 */
	public static final String column_digest = "digest";
	
	/**
	 * 字段描述：关键字 
	 * 字段类型 ：character varying 
	 */
	public static final String column_keyword = "keyword";
	
	/**
	 * 字段描述：内容 
	 * 字段类型 ：text 
	 */
	public static final String column_content = "content";
	
	/**
	 * 字段描述：评论范围 : 0游客和注册用户，1注册用户，2禁止评论 
	 * 字段类型 ：character 
	 */
	public static final String column_commentsrange = "commentsrange";
	
	/**
	 * 字段描述：置顶 : 0否，1是 
	 * 字段类型 ：character 
	 */
	public static final String column_stick = "stick";
	
	/**
	 * 字段描述：原创 : 0否，1是 
	 * 字段类型 ：character 
	 */
	public static final String column_original = "original";
	
	/**
	 * 字段描述：浏览次数 
	 * 字段类型 ：bigint 
	 */
	public static final String column_viewcount = "viewcount";
	
	/**
	 * 字段描述：评论次数 
	 * 字段类型 ：bigint 
	 */
	public static final String column_commentcount = "commentcount";
	
	/**
	 * 字段描述：收藏次数 
	 * 字段类型 ：bigint 
	 */
	public static final String column_favoritecount = "favoritecount";
	
	/**
	 * 字段描述：点赞次数 
	 * 字段类型 ：bigint 
	 */
	public static final String column_praisecount = "praisecount";
	
	/**
	 * 字段描述：踩次数 
	 * 字段类型 ：bigint 
	 */
	public static final String column_tramplecount = "tramplecount";
	
	/**
	 * 字段描述：分类主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_typeids = "typeids";

	/**
	 * sqlId : blog.article.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "blog.article.splitPageSelect";

	/**
	 * sqlId : blog.article.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "blog.article.splitPageFrom";

	
}
