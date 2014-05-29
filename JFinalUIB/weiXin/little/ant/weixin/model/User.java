package little.ant.weixin.model;

import com.jfinal.plugin.activerecord.Model;

public class User extends Model<User> {
	
	private static final long serialVersionUID = 2051998642258015518L;
	
	public static final User dao = new User();
	
}
