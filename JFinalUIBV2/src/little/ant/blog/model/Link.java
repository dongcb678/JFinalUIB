package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 友情链接 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "blog_link")
public class Link extends BaseModel<Link> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Link.class);
	
	public static final Link dao = new Link();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 乐观锁
	*/
	public static final String colunm_version = "version";
	
	/**
	* 名称
	*/
	public static final String colunm_name = "name";
	
	/**
	* 链接地址
	*/
	public static final String colunm_url = "url";
	
	/**
	* logo图片
	*/
	public static final String colunm_logo = "logo";
	
	/**
	* 上传文件ids
	*/
	public static final String colunm_uploadids = "uploadids";
	
	/**
	* 创建人
	*/
	public static final String colunm_createuser = "createuser";
	
	/**
	* 创建时间
	*/
	public static final String colunm_createdate = "createdate";
	
	/**
	* 最后修改人
	*/
	public static final String colunm_updateuser = "updateuser";
	
	/**
	* 最后修改时间
	*/
	public static final String colunm_updatedate = "updatedate";
	
	/**
	* 是否逻辑删除 : 0否，1是
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
