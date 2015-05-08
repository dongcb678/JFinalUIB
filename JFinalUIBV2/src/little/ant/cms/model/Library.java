package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 文库 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_library")
public class Library extends BaseModel<Library> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Library.class);
	
	public static final Library dao = new Library();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 作者
	*/
	public static final String colunm_author = "author";
	
	/**
	* 来源
	*/
	public static final String colunm_source = "source";
	
	/**
	* 来源url
	*/
	public static final String colunm_url = "url";
	
	/**
	* 上传文档ids
	*/
	public static final String colunm_uploadids = "uploadids";
	
	/**
	* 文档路径
	*/
	public static final String colunm_path = "path";
	
	/**
	* 内容主键
	*/
	public static final String colunm_contentids = "contentids";
	
	
}
