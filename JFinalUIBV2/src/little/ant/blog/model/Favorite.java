package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 收藏夹 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "blog_favorite")
public class Favorite extends BaseModel<Favorite> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Favorite.class);
	
	public static final Favorite dao = new Favorite();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 乐观锁
	*/
	public static final String colunm_version = "version";
	
	/**
	* 标题
	*/
	public static final String colunm_title = "title";
	
	/**
	* url地址
	*/
	public static final String colunm_url = "url";
	
	/**
	* 收藏用户
	*/
	public static final String colunm_createuser = "createuser";
	
	/**
	* 收藏时间
	*/
	public static final String colunm_createdate = "createdate";
	
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
	
	
}
