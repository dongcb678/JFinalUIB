package com.platform.mvc.upload;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 上传文件model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = Upload.table_name)
public class Upload extends BaseModel<Upload> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static final Log log = Log.getLog(Upload.class);
	
	public static final Upload dao = new Upload().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_upload";
	
	/**
	 * 字段描述：主键 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：参数key 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_parametername = "parametername";
	
	/**
	 * 字段描述：文件名 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_filename = "filename";
	
	/**
	 * 字段描述：contenttype 
	 * 字段类型：character varying  长度：100
	 */
	public static final String column_contenttype = "contenttype";
	
	/**
	 * 字段描述：原文件名 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_originalfilename = "originalfilename";
	
	/**
	 * 字段描述：存放路径 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_path = "path";

	/**
	 * 字段描述：文件MD5摘要
	 * 字段类型：character varying  长度：100
	 */
	public static final String column_md5 = "md5";

	/**
	 * 字段描述：文件描述
	 * 字段类型：text 
	 */
	public static final String column_describe = "describe";
	
	/**
	 * 字段描述：文件依赖目标ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_targetids = "targetids";

	/**
	 * 字段描述：排序号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_orderids = "orderids";

	/**
	 * 字段描述：文件大小，字节
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_size = "size";
	
	/**
	 * sqlId : platform.upload.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPageFrom = "platform.upload.splitPageFrom";

	/**
	 * sqlId : platform.upload.md5
	 * 描述：md5查询
	 */
	public static final String sqlId_md5 = "platform.upload.md5";

	private String ids;
	private Long version;
	private String parametername;
	private String filename;
	private String contenttype;
	private String originalfilename;
	private String path;
	private String md5;
	private String describe;
	private String targetids;
	private Long orderids;
	private Long size;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setVersion(Long version){
		set(column_version, version);
	}
	public Long getVersion() {
		return get(column_version);
	}
	public void setParametername(String parametername){
		set(column_parametername, parametername);
	}
	public String getParametername() {
		return get(column_parametername);
	}
	public void setFilename(String filename){
		set(column_filename, filename);
	}
	public String getFilename() {
		return get(column_filename);
	}
	public void setContenttype(String contenttype){
		set(column_contenttype, contenttype);
	}
	public String getContenttype() {
		return get(column_contenttype);
	}
	public void setOriginalfilename(String originalfilename){
		set(column_originalfilename, originalfilename);
	}
	public String getOriginalfilename() {
		return get(column_originalfilename);
	}
	public void setPath(String path){
		set(column_path, path);
	}
	public String getPath() {
		return get(column_path);
	}
	public String getMd5() {
		return get(column_md5);
	}
	public void setMd5(String md5) {
		set(column_md5, md5);
	}
	public String getDescribe() {
		return get(column_describe);
	}
	public void setDescribe(String describe) {
		set(column_describe, describe);
	}
	public String getTargetids() {
		return get(column_targetids);
	}
	public void setTargetids(String targetids) {
		set(column_targetids, targetids);
	}
	public Long getOrderids() {
		return get(column_orderids);
	}
	public void setOrderids(Long orderids) {
		set(column_orderids, orderids);
	}
	public Long getSize() {
		return get(column_size);
	}
	public void setSize(Long size) {
		set(column_size, size);
	}
	
}
