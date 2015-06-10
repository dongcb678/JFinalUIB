package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 公告 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "cms_announcement")
public class Announcement extends BaseModel<Announcement> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Announcement.class);
	
	public static final Announcement dao = new Announcement();
	
	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：有效开始时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String column_startdate = "startdate";
	
	/**
	 * 字段描述：有效结束时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String column_enddate = "enddate";
	
	/**
	 * 字段描述：内容主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_contentids = "contentids";

	/**
	 * sqlId : cms.announcement.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "cms.announcement.splitPageSelect";

	/**
	 * sqlId : cms.announcement.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "cms.announcement.splitPageFrom";

	
}
