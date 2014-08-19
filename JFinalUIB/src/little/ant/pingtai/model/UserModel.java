package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_user")
public class UserModel extends BaseModel<UserModel> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(UserModel.class);
	
	public static final UserModel dao = new UserModel();
	
	/**
	 * 关联查询，获取用户详细信息
	 * @return
	 */
	public UserInfoModel getUserInfo(){
		return UserInfoModel.dao.findById(get("userinfoids"));
	}

	/**
	 * 关联查询，获取用户部门信息
	 * @return
	 */
	public DepartmentModel getDepartment(){
		return DepartmentModel.dao.findById(get("departmentids"));
	}

	/**
	 * 关联查询，获取用户岗位信息
	 * @return
	 */
	public StationModel getStation(){
		return StationModel.dao.findById(get("stationids"));
	}
	
}
