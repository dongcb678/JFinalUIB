package little.ant.weixin.model;

import little.ant.pingtai.annotation.TableBind;
import little.ant.pingtai.model.BaseModel;

import org.apache.log4j.Logger;

@TableBind(tableName="wx_user")
public class User extends BaseModel<User> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(User.class);
	
	public static final User dao = new User();
	
}
