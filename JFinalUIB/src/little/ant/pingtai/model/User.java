package little.ant.pingtai.model;

public class User extends BaseModel<User> {

	private static final long serialVersionUID = 6761767368352810428L;
	
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
