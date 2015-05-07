package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_yellowpage")
public class YellowPage extends BaseModel<YellowPage> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(YellowPage.class);
	
	public static final YellowPage dao = new YellowPage();
	
	public static final String colunm_ids = "ids";
	public static final String colunm_address = "address";
	public static final String colunm_contacts = "contacts";
	public static final String colunm_fixphone = "fixphone";
	public static final String colunm_mobile = "mobile";
	public static final String colunm_postcode = "postcode";
	public static final String colunm_qq = "qq";
	public static final String colunm_contentids = "contentids";
	
}
