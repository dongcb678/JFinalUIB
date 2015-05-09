package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.thread.ThreadParamInit;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 用户model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_user")
public class User extends BaseModel<User> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(User.class);
	
	public static final User dao = new User();

	/**
	 * 主键
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 版本号
	 */
	public static final String colunm_version = "version";
	
	/**
	 * 密码连续错误次数
	 */
	public static final String colunm_errorcount = "errorcount";
	
	/**
	 * 排序号
	 */
	public static final String colunm_orderids = "orderids";
	
	/**
	 * 密码
	 */
	public static final String colunm_password = "password";
	
	/**
	 * 密钥
	 */
	public static final String colunm_salt = "salt";
	
	/**
	 * 账号状态
	 */
	public static final String colunm_status = "status";
	
	/**
	 * 账号停用时间
	 */
	public static final String colunm_stopdate = "stopdate";
	
	/**
	 * 账号
	 */
	public static final String colunm_username = "username";
	
	/**
	 * 所在部门ids
	 */
	public static final String colunm_departmentids = "departmentids";
	
	/**
	 * 用户扩展信息ids
	 */
	public static final String colunm_userinfoids = "userinfoids";
	
	/**
	 * 所在岗位ids
	 */
	public static final String colunm_stationids = "stationids";
	
	/**
	 * 行级部门ids
	 */
	public static final String colunm_deptids = "deptids";
	
	/**
	 * 行级人员ids
	 */
	public static final String colunm_userids = "userids";
	
	/**
	 * 所在分组ids
	 */
	public static final String colunm_groupids = "groupids";
	
	/**
	 * 所在部门names
	 */
	public static final String colunm_departmentnames = "departmentnames";
	
	/**
	 * 所在岗位names
	 */
	public static final String colunm_stationnames = "stationnames";
	
	/**
	 * 行级部门names
	 */
	public static final String colunm_deptnames = "deptnames";
	
	/**
	 * 行级人员names
	 */
	public static final String colunm_usernames = "usernames";
	
	/**
	 * 所在分组names
	 */
	public static final String colunm_groupnames = "groupnames";
	
	/**
	 * 关联查询，获取用户详细信息
	 * @return
	 */
	public UserInfo getUserInfo(){
		String userinfoIds = get(colunm_userinfoids);
		if(null != userinfoIds && !userinfoIds.isEmpty()){
			return UserInfo.dao.findById(userinfoIds);
		}
		return null;
	}

	/**
	 * 关联查询，获取用户部门信息
	 * @return
	 */
	public Department getDepartment(){
		String departmentids = get(colunm_departmentids);
		if(null != departmentids && !departmentids.isEmpty()){
			return Department.dao.findById(departmentids);
		}
		return null;
	}

	/**
	 * 关联查询，获取用户岗位信息
	 * @return
	 */
	public Station getStation(){
		String stationids = get(colunm_stationids);
		if(null != stationids && !stationids.isEmpty()){
			return Station.dao.findById(stationids);
		}
		return null;
	}
	
	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		User user = User.dao.findById(ids);
		UserInfo userInfo = user.getUserInfo();
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + ids, user);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr(colunm_username), user);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr(UserInfo.colunm_email), user);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr(UserInfo.colunm_mobile), user);
	}

	/**
	 * 删除缓存
	 */
	public void cacheRemove(String ids){
		User user = User.dao.findById(ids);
		UserInfo userInfo = user.getUserInfo();
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + ids);
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr(colunm_username));
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr(UserInfo.colunm_email));
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr(UserInfo.colunm_mobile));
	}

	/**
	 * 获取缓存
	 * @param ids
	 * @return
	 */
	public User cacheGet(String ids){
		User user = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + ids);
		return user;
	}
	
}
