package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;

import org.apache.log4j.Logger;

/**
 * 上传文件model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_upload")
public class Upload extends BaseModel<Upload> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Upload.class);
	
	public static final Upload dao = new Upload();

	/**
	 * 主键
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 版本号
	 */
	public static final String colunm_version = "version";
	
	/**
	 * 参数key
	 */
	public static final String colunm_parametername = "parametername";
	
	/**
	 * 文件名
	 */
	public static final String colunm_filename = "filename";
	
	/**
	 * contenttype
	 */
	public static final String colunm_contenttype = "contenttype";
	
	/**
	 * 原文件名
	 */
	public static final String colunm_originalfilename = "originalfilename";
	
	/**
	 * 存放路径
	 */
	public static final String colunm_path = "path";
	
}
