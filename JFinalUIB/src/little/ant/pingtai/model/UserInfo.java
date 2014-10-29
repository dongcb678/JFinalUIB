package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.common.DictKeys;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_userinfo")
public class UserInfo extends BaseModel<UserInfo> {

	private static final long serialVersionUID = 2592706064072264621L;

	private static Logger log = Logger.getLogger(UserInfo.class);
	
	public static final UserInfo dao = new UserInfo();
	
}
