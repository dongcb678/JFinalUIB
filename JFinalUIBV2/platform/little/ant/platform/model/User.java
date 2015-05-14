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
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_version = "version";
	
	/**
	 * 字段描述：密码连续错误次数 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_errorcount = "errorcount";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_orderids = "orderids";
	
	/**
	 * 字段描述：密码 
	 * 字段类型 ：bytea 
	 */
	public static final String colunm_password = "password";
	
	/**
	 * 字段描述：密钥 
	 * 字段类型 ：bytea 
	 */
	public static final String colunm_salt = "salt";
	
	/**
	 * 字段描述：账号状态 
	 * 字段类型 ：character 
	 */
	public static final String colunm_status = "status";
	
	/**
	 * 字段描述：账号停用时间 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String colunm_stopdate = "stopdate";
	
	/**
	 * 字段描述：账号 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_username = "username";
	
	/**
	 * 字段描述：所在部门ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_departmentids = "departmentids";
	
	/**
	 * 字段描述：用户扩展信息ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_userinfoids = "userinfoids";
	
	/**
	 * 字段描述：所在岗位ids 
	 * 字段类型 ：text 
	 */
	public static final String colunm_stationids = "stationids";
	
	/**
	 * 字段描述：行级部门ids 
	 * 字段类型 ：text 
	 */
	public static final String colunm_deptids = "deptids";
	
	/**
	 * 字段描述：行级人员ids 
	 * 字段类型 ：text 
	 */
	public static final String colunm_userids = "userids";
	
	/**
	 * 字段描述：所在分组ids 
	 * 字段类型 ：text 
	 */
	public static final String colunm_groupids = "groupids";
	
	/**
	 * 字段描述：所在部门names 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_departmentnames = "departmentnames";
	
	/**
	 * 字段描述：所在岗位names 
	 * 字段类型 ：text 
	 */
	public static final String colunm_stationnames = "stationnames";
	
	/**
	 * 字段描述：行级部门names 
	 * 字段类型 ：text 
	 */
	public static final String colunm_deptnames = "deptnames";
	
	/**
	 * 字段描述：行级人员names 
	 * 字段类型 ：text 
	 */
	public static final String colunm_usernames = "usernames";
	
	/**
	 * 字段描述：所在分组names 
	 * 字段类型 ：text 
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
