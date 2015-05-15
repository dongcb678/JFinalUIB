package little.ant.weixin.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = ConstantPlatform.db_dataSource_main, tableName= "wx_user")
public class User extends BaseModel<User> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(User.class);
	
	public static final User dao = new User();
	
}
