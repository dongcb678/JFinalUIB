package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 文章 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "blog_article")
public class Article extends BaseModel<Article> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Article.class);
	
	public static final Article dao = new Article();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 乐观锁
	*/
	public static final String colunm_version = "version";
	
	/**
	* 创建人
	*/
	public static final String colunm_createuser = "createuser";
	
	/**
	* 创建时间
	*/
	public static final String colunm_createdate = "createdate";
	
	/**
	* 最后更新人
	*/
	public static final String colunm_updateuser = "updateuser";
	
	/**
	* 最后更新时间
	*/
	public static final String colunm_updatedate = "updatedate";
	
	/**
	* 是否删除
	*/
	public static final String colunm_isdelete = "isdelete";
	
	/**
	* 删除人
	*/
	public static final String colunm_deleteuser = "deleteuser";
	
	/**
	* 删除时间
	*/
	public static final String colunm_deletedate = "deletedate";
	
	/**
	* 是否草稿 : 0否，1是
	*/
	public static final String colunm_draft = "draft";
	
	/**
	* 标题
	*/
	public static final String colunm_title = "title";
	
	/**
	* 摘要
	*/
	public static final String colunm_digest = "digest";
	
	/**
	* 关键字
	*/
	public static final String colunm_keyword = "keyword";
	
	/**
	* 内容
	*/
	public static final String colunm_content = "content";
	
	/**
	* 评论范围 : 0游客和注册用户，1注册用户，2禁止评论
	*/
	public static final String colunm_commentsrange = "commentsrange";
	
	/**
	* 置顶 : 0否，1是
	*/
	public static final String colunm_stick = "stick";
	
	/**
	* 原创 : 0否，1是
	*/
	public static final String colunm_original = "original";
	
	/**
	* 浏览次数
	*/
	public static final String colunm_viewcount = "viewcount";
	
	/**
	* 评论次数
	*/
	public static final String colunm_commentcount = "commentcount";
	
	/**
	* 收藏次数
	*/
	public static final String colunm_favoritecount = "favoritecount";
	
	/**
	* 点赞次数
	*/
	public static final String colunm_praisecount = "praisecount";
	
	/**
	* 踩次数
	*/
	public static final String colunm_tramplecount = "tramplecount";
	
	/**
	* 分类主键
	*/
	public static final String colunm_typeids = "typeids";
	
	
}
