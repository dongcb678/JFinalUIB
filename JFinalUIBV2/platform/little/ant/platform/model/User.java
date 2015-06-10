package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantCache;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.plugin.ParamInitPlugin;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 用户model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "pt_user")
public class User extends BaseModelCache<User> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(User.class);
	
	public static final User dao = new User();

	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型 ：bigint 
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：密码连续错误次数 
	 * 字段类型 ：bigint 
	 */
	public static final String column_errorcount = "errorcount";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型 ：bigint 
	 */
	public static final String column_orderids = "orderids";
	
	/**
	 * 字段描述：密码 
	 * 字段类型 ：bytea 
	 */
	public static final String column_password = "password";
	
	/**
	 * 字段描述：密钥 
	 * 字段类型 ：bytea 
	 */
	public static final String column_salt = "salt";
	
	/**
	 * 字段描述：账号状态 
	 * 字段类型 ：character 
	 */
	public static final String column_status = "status";
	
	/**
	 * 字段描述：账号停用时间 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String column_stopdate = "stopdate";
	
	/**
	 * 字段描述：账号 
	 * 字段类型 ：character varying 
	 */
	public static final String column_username = "username";
	
	/**
	 * 字段描述：所在部门ids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_departmentids = "departmentids";
	
	/**
	 * 字段描述：用户扩展信息ids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_userinfoids = "userinfoids";
	
	/**
	 * 字段描述：所在岗位ids 
	 * 字段类型 ：text 
	 */
	public static final String column_stationids = "stationids";
	
	/**
	 * 字段描述：行级部门ids 
	 * 字段类型 ：text 
	 */
	public static final String column_deptids = "deptids";
	
	/**
	 * 字段描述：行级人员ids 
	 * 字段类型 ：text 
	 */
	public static final String column_userids = "userids";
	
	/**
	 * 字段描述：所在分组ids 
	 * 字段类型 ：text 
	 */
	public static final String column_groupids = "groupids";
	
	/**
	 * 字段描述：所在部门names 
	 * 字段类型 ：character varying 
	 */
	public static final String column_departmentnames = "departmentnames";
	
	/**
	 * 字段描述：所在岗位names 
	 * 字段类型 ：text 
	 */
	public static final String column_stationnames = "stationnames";
	
	/**
	 * 字段描述：行级部门names 
	 * 字段类型 ：text 
	 */
	public static final String column_deptnames = "deptnames";
	
	/**
	 * 字段描述：行级人员names 
	 * 字段类型 ：text 
	 */
	public static final String column_usernames = "usernames";
	
	/**
	 * 字段描述：所在分组names 
	 * 字段类型 ：text 
	 */
	public static final String column_groupnames = "groupnames";

	/**
	 * sqlId : platform.user.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "platform.user.splitPageSelect";

	/**
	 * sqlId : platform.user.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "platform.user.splitPageFrom";

	/**
	 * sqlId : platform.user.all
	 * 描述：查询所有用户
	 */
	public static final String sqlId_all = "platform.user.all";

	/**
	 * sqlId : platform.user.treeUserNode
	 * 描述：根据部门Id查询，人员树节点数据 
	 */
	public static final String sqlId_treeUserNode = "platform.user.treeUserNode";

	/**
	 * sqlId : platform.user.column
	 * 描述：查询用户，自定义字段和值
	 */
	public static final String sqlId_column = "platform.user.column";

	/**
	 * sqlId : platform.user.stop
	 * 描述：停用账户
	 */
	public static final String sqlId_stop = "platform.user.stop";

	/**
	 * sqlId : platform.user.start
	 * 描述：启用停用账户
	 */
	public static final String sqlId_start = "platform.user.start";

	/**
	 * 关联查询，获取用户详细信息
	 * @return
	 */
	public UserInfo getUserInfo(){
		String userinfoIds = get(column_userinfoids);
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
		String departmentids = get(column_departmentids);
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
		String stationids = get(column_stationids);
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
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_user + ids, user);
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_user + user.getStr(column_username), user);
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_user + userInfo.getStr(UserInfo.column_email), user);
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_user + userInfo.getStr(UserInfo.column_mobile), user);
	}

	/**
	 * 删除缓存
	 */
	public void cacheRemove(String ids){
		User user = User.dao.findById(ids);
		UserInfo userInfo = user.getUserInfo();
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_user + ids);
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_user + user.getStr(column_username));
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_user + userInfo.getStr(UserInfo.column_email));
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_user + userInfo.getStr(UserInfo.column_mobile));
	}

	/**
	 * 获取缓存
	 * @param ids
	 * @return
	 */
	public User cacheGet(String ids){
		User user = CacheKit.get(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_user + ids);
		return user;
	}
	
}
