package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 新闻投递 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "blog_newsdeliver")
public class NewsDeliver extends BaseModel<NewsDeliver> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(NewsDeliver.class);
	
	public static final NewsDeliver dao = new NewsDeliver();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 乐观锁
	*/
	public static final String colunm_version = "version";
	
	/**
	* 分类
	*/
	public static final String colunm_type = "type";
	
	/**
	* 标题
	*/
	public static final String colunm_title = "title";
	
	/**
	* 内容
	*/
	public static final String colunm_content = "content";
	
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
	* 处理状态 : 0初始化提交，1未阅，2已阅
	*/
	public static final String colunm_status = "status";
	
	
}
