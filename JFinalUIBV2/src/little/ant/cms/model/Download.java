package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 下载 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_download")
public class Download extends BaseModel<Download> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Download.class);
	
	public static final Download dao = new Download();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 链接地址
	*/
	public static final String colunm_url = "url";
	
	/**
	* 是否外部链接 : 0否，1是
	*/
	public static final String colunm_islink = "islink";
	
	/**
	* 系统平台 : windows xp，windows 2000，windows 2003等待
	*/
	public static final String colunm_systems = "systems";
	
	/**
	* 软件授权形式
	*/
	public static final String colunm_copytype = "copytype";
	
	/**
	* 软件语言
	*/
	public static final String colunm_language = "language";
	
	/**
	* 软件类型
	*/
	public static final String colunm_classtype = "classtype";
	
	/**
	* 软件版本
	*/
	public static final String colunm_softversion = "softversion";
	
	/**
	* 文件大小
	*/
	public static final String colunm_size = "size";
	
	/**
	* 内容主键
	*/
	public static final String colunm_contentids = "contentids";
	
	
}
