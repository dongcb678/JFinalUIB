package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 黄页 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_yellowpage")
public class YellowPage extends BaseModel<YellowPage> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(YellowPage.class);
	
	public static final YellowPage dao = new YellowPage();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 地址
	*/
	public static final String colunm_address = "address";
	
	/**
	* 联系人
	*/
	public static final String colunm_contacts = "contacts";
	
	/**
	* 固话
	*/
	public static final String colunm_fixphone = "fixphone";
	
	/**
	* 移动电话
	*/
	public static final String colunm_mobile = "mobile";
	
	/**
	* 邮编
	*/
	public static final String colunm_postcode = "postcode";
	
	/**
	* 在线qq : 多个逗号隔开，最多5个
	*/
	public static final String colunm_qq = "qq";
	
	/**
	* 内容主键
	*/
	public static final String colunm_contentids = "contentids";
	
	
}
