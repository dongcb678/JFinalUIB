package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_user")
public class User extends BaseModel<User> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(User.class);
	
	public static final User dao = new User();
	
	/**
	 * 关联查询，获取用户详细信息
	 * @return
	 */
	public UserInfo getUserInfo(){
		return UserInfo.dao.findById(get("userinfoids"));
	}

	/**
	 * 关联查询，获取用户部门信息
	 * @return
	 */
	public Department getDepartment(){
		return Department.dao.findById(get("departmentids"));
	}

	/**
	 * 关联查询，获取用户岗位信息
	 * @return
	 */
	public Station getStation(){
		return Station.dao.findById(get("stationids"));
	}
	
}
