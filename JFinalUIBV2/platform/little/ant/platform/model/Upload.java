package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;

import org.apache.log4j.Logger;

/**
 * 上传文件model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = "pt_upload")
public class Upload extends BaseModel<Upload> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Upload.class);
	
	public static final Upload dao = new Upload();

	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型 ：bigint 
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：参数key 
	 * 字段类型 ：character varying 
	 */
	public static final String column_parametername = "parametername";
	
	/**
	 * 字段描述：文件名 
	 * 字段类型 ：character varying 
	 */
	public static final String column_filename = "filename";
	
	/**
	 * 字段描述：contenttype 
	 * 字段类型 ：character varying 
	 */
	public static final String column_contenttype = "contenttype";
	
	/**
	 * 字段描述：原文件名 
	 * 字段类型 ：character varying 
	 */
	public static final String column_originalfilename = "originalfilename";
	
	/**
	 * 字段描述：存放路径 
	 * 字段类型 ：character varying 
	 */
	public static final String column_path = "path";

	/**
	 * sqlId : platform.upload.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "platform.upload.splitPageSelect";

	/**
	 * sqlId : platform.upload.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "platform.upload.splitPageFrom";

}
