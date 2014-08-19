package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_userinfo")
public class UserInfoModel extends BaseModel<UserInfoModel> {

	private static final long serialVersionUID = 2592706064072264621L;

	private static Logger log = Logger.getLogger(UserInfoModel.class);
	
	public static final UserInfoModel dao = new UserInfoModel();
	
}
