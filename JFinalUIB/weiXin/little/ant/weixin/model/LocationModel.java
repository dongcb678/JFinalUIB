package little.ant.weixin.model;

import org.apache.log4j.Logger;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.model.BaseModel;

@SuppressWarnings("unused")
@Table(tableName="wx_location")
public class LocationModel extends BaseModel<LocationModel> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(LocationModel.class);
	
	public static final LocationModel dao = new LocationModel();
	
}
