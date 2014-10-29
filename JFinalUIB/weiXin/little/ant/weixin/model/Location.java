package little.ant.weixin.model;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName= "wx_location")
public class Location extends BaseModel<Location> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Location.class);
	
	public static final Location dao = new Location();
	
}
