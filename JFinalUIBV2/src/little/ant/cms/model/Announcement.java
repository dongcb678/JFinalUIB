package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 公告 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_announcement")
public class Announcement extends BaseModel<Announcement> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Announcement.class);
	
	public static final Announcement dao = new Announcement();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 有效开始时间
	*/
	public static final String colunm_startdate = "startdate";
	
	/**
	* 有效结束时间
	*/
	public static final String colunm_enddate = "enddate";
	
	/**
	* 内容主键
	*/
	public static final String colunm_contentids = "contentids";
	
	
}
