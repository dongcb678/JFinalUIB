package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_photogallery")
public class Photogallery extends BaseModel<Photogallery> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Photogallery.class);
	
	public static final Photogallery dao = new Photogallery();
	
	public static final String colunm_ids = "ids";
	public static final String colunm_author = "author";
	public static final String colunm_source = "source";
	public static final String colunm_url = "url";
	public static final String colunm_titlepicture = "titlepicture";
	public static final String colunm_titlepicturepath = "titlepicturepath";
	public static final String colunm_contentids = "contentids";
	
}
