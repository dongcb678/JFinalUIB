package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_download")
public class Download extends BaseModel<Download> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Download.class);
	
	public static final Download dao = new Download();
	
	public static final String colunm_ids = "ids";
	public static final String colunm_url = "url";
	public static final String colunm_islink = "islink";
	public static final String colunm_systems = "systems";
	public static final String colunm_copytype = "copytype";
	public static final String colunm_language = "language";
	public static final String colunm_classtype = "classtype";
	public static final String colunm_softversion = "softversion";
	public static final String colunm_size = "size";
	public static final String colunm_contentids = "contentids";
	
}
