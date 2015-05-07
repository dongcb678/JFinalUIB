package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_announcement")
public class Announcement extends BaseModel<Announcement> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Announcement.class);
	
	public static final Announcement dao = new Announcement();
	
	public static final String colunm_ids = "ids";
	public static final String colunm_startdate = "startdate";
	public static final String colunm_enddate = "enddate";
	public static final String colunm_contentids = "contentids";
	
}
