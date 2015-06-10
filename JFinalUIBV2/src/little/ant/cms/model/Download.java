package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 下载 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "cms_download")
public class Download extends BaseModel<Download> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Download.class);
	
	public static final Download dao = new Download();
	
	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：链接地址 
	 * 字段类型 ：character varying 
	 */
	public static final String column_url = "url";
	
	/**
	 * 字段描述：是否外部链接 : 0否，1是 
	 * 字段类型 ：character 
	 */
	public static final String column_islink = "islink";
	
	/**
	 * 字段描述：系统平台 : windows xp，windows 2000，windows 2003等待 
	 * 字段类型 ：character varying 
	 */
	public static final String column_systems = "systems";
	
	/**
	 * 字段描述：软件授权形式 
	 * 字段类型 ：character varying 
	 */
	public static final String column_copytype = "copytype";
	
	/**
	 * 字段描述：软件语言 
	 * 字段类型 ：character varying 
	 */
	public static final String column_language = "language";
	
	/**
	 * 字段描述：软件类型 
	 * 字段类型 ：character varying 
	 */
	public static final String column_classtype = "classtype";
	
	/**
	 * 字段描述：软件版本 
	 * 字段类型 ：character varying 
	 */
	public static final String column_softversion = "softversion";
	
	/**
	 * 字段描述：文件大小 
	 * 字段类型 ：bigint 
	 */
	public static final String column_size = "size";
	
	/**
	 * 字段描述：内容主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_contentids = "contentids";

	/**
	 * sqlId : cms.download.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "cms.download.splitPageSelect";

	/**
	 * sqlId : cms.download.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "cms.download.splitPageFrom";

	
}
