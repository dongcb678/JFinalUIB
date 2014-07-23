package little.ant.pingtai.model;

import little.ant.pingtai.annotation.TableBind;

import org.apache.log4j.Logger;

@TableBind(tableName="pt_userinfo")
public class UserInfo extends BaseModel<UserInfo> {

	private static final long serialVersionUID = 2592706064072264621L;

	private static Logger log = Logger.getLogger(UserInfo.class);
	
	public static final UserInfo dao = new UserInfo();
	
}
