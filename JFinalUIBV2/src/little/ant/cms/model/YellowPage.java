package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 黄页 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantPlatform.db_dataSource_main, tableName = "cms_yellowpage")
public class YellowPage extends BaseModel<YellowPage> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(YellowPage.class);
	
	public static final YellowPage dao = new YellowPage();
	
	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 字段描述：地址 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_address = "address";
	
	/**
	 * 字段描述：联系人 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_contacts = "contacts";
	
	/**
	 * 字段描述：固话 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_fixphone = "fixphone";
	
	/**
	 * 字段描述：移动电话 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_mobile = "mobile";
	
	/**
	 * 字段描述：邮编 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_postcode = "postcode";
	
	/**
	 * 字段描述：在线qq : 多个逗号隔开，最多5个 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_qq = "qq";
	
	/**
	 * 字段描述：内容主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_contentids = "contentids";
	
	
}
