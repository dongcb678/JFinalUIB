package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;

import org.apache.log4j.Logger;

/**
 * 资源负载model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = "pt_resources")
public class Resources extends BaseModel<Resources> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Resources.class);
	
	public static final Resources dao = new Resources();
	
}
