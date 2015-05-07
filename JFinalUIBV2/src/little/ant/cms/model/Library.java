package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_library")
public class Library extends BaseModel<Library> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Library.class);
	
	public static final Library dao = new Library();
	
	public static final String colunm_ids = "ids";
	public static final String colunm_author = "author";
	public static final String colunm_source = "source";
	public static final String colunm_url = "url";
	public static final String colunm_uploadids = "uploadids";
	public static final String colunm_path = "path";
	public static final String colunm_contentids = "contentids";
	
}
