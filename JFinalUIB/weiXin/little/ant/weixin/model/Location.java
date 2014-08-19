package little.ant.weixin.model;

import org.apache.log4j.Logger;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.model.BaseModel;

@SuppressWarnings("unused")
@Table(tableName="wx_location")
public class Location extends BaseModel<Location> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Location.class);
	
	public static final Location dao = new Location();
	
}
