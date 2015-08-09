package little.ant.weixin.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName= "wx_location")
public class Location extends BaseModel<Location> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Location.class);
	
	public static final Location dao = new Location();

	/**
	 * sqlId : weixin.location.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "weixin.location.splitPageFrom";

}
