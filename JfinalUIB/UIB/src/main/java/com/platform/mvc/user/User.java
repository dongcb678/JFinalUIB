package com.platform.mvc.user;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;
import com.platform.mvc.dept.Department;
import com.platform.mvc.station.Station;
import com.platform.mvc.usergroup.UserGroup;
import com.platform.plugin.ParamInitPlugin;
import com.platform.tools.ToolCache;

/**
 * 用户model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = User.table_name)
public class User extends BaseModel<User> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static final Log log = Log.getLog(User.class);
	
	public static final User dao = new User().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_user";
	
	/**
	 * 字段描述：主键 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：密码连续错误次数 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_errorcount = "errorcount";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_orderids = "orderids";
	
	/**
	 * 字段描述：密码 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_password = "password";
	
	/**
	 * 字段描述：密钥 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_salt = "salt";
	
	/**
	 * 字段描述：账号状态 
	 * 字段类型：character  长度：1
	 */
	public static final String column_status = "status";
	
	/**
	 * 字段描述：账号停用时间 
	 * 字段类型：timestamp without time zone  长度：null
	 */
	public static final String column_stopdate = "stopdate";
	
	/**
	 * 字段描述：账号 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_username = "username";

	/**
	 * 字段描述：名称 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_names = "names";
	
	/**
	 * 字段描述：所在部门ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_departmentids = "departmentids";
	
	/**
	 * 字段描述：所在岗位ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_stationids = "stationids";

	/**
	 * 字段描述：身份证号 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_idcard = "idcard";
	
	/**
	 * 字段描述：手机号 
	 * 字段类型：character varying  长度：20
	 */
	public static final String column_mobile = "mobile";

	/**
	 * 字段描述：邮箱 
	 * 字段类型：character varying  长度：100
	 */
	public static final String column_email = "email";

	/**
	 * 字段描述：idea加密key 
	 * 字段类型：character varying  长度：100
	 */
	public static final String column_secretkey = "secretkey";
	
	/**
	 * sqlId : platform.user.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPageSelect = "platform.user.splitPageSelect";

	/**
	 * sqlId : platform.user.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPageFrom = "platform.user.splitPageFrom";

	/**
	 * sqlId : platform.user.paging
	 * 描述：查询所有用户
	 */
	public static final String sqlId_paging = "platform.user.paging";

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

	private String ids;
	private Long version;
	private Long errorcount;
	private Long orderids;
	private String password;
	private String salt;
	private String status;
	private Timestamp stopdate;
	private String username;
	private String names;
	private String departmentids;
	private String stationids;
	private String idcard;
	private String email;
	private String mobile;
	private String secretkey;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setVersion(Long version){
		set(column_version, version);
	}
	public Long getVersion() {
		return get(column_version);
	}
	public void setErrorcount(Long errorcount){
		set(column_errorcount, errorcount);
	}
	public Long getErrorcount() {
		return get(column_errorcount);
	}
	public void setOrderids(Long orderids){
		set(column_orderids, orderids);
	}
	public Long getOrderids() {
		return get(column_orderids);
	}
	public void setPassword(String password){
		set(column_password, password);
	}
	public String getPassword() {
		return get(column_password);
	}
	public void setSalt(String salt){
		set(column_salt, salt);
	}
	public String getSalt() {
		return get(column_salt);
	}
	public void setStatus(String status){
		set(column_status, status);
	}
	public String getStatus() {
		return get(column_status);
	}
	public void setStopdate(Timestamp stopdate){
		set(column_stopdate, stopdate);
	}
	public Timestamp getStopdate() {
		return get(column_stopdate);
	}
	public void setUsername(String username){
		set(column_username, username);
	}
	public String getUsername() {
		return get(column_username);
	}
	public void setNames(String names){
		set(column_names, names);
	}
	public String getNames() {
		return get(column_names);
	}
	public void setDepartmentids(String departmentids){
		set(column_departmentids, departmentids);
	}
	public String getDepartmentids() {
		return get(column_departmentids);
	}
	public void setStationids(String stationids){
		set(column_stationids, stationids);
	}
	public String getStationids() {
		return get(column_stationids);
	}
	public void setEmail(String email){
		set(column_email, email);
	}
	public String getEmail() {
		return get(column_email);
	}
	public void setMobile(String mobile){
		set(column_mobile, mobile);
	}
	public String getMobile() {
		return get(column_mobile);
	}
	public void setIdcard(String idcard){
		set(column_idcard, idcard);
	}
	public String getIdcard() {
		return get(column_idcard);
	}
	public String getSecretkey() {
		return get(column_secretkey);
	}
	public void setSecretkey(String secretkey) {
		set(column_secretkey, secretkey);
	}
	
	/**
	 * 关联查询，获取用户详细信息
	 * @return
	 */
	public UserInfo getUserInfo(){
		return UserInfo.dao.findById(this.getPKValue());
	}

	/**
	 * 关联查询，获取用户部门信息
	 * @return
	 */
	public Department getDepartment(){
		return Department.dao.findById(this.getDepartmentids());
	}

	/**
	 * 关联查询，获取用户岗位信息
	 * @return
	 */
	public Station getStation(){
		return Station.dao.findById(this.getStationids());
	}
	
	/**
	 * 添加或者更新缓存
	 */
	public static void cacheAdd(String ids){
		User user = User.dao.findById(ids);
		if(user != null){
			String sql = getSqlMy("platform.userGroup.findGroupIdsByUserIds");
			List<UserGroup> ugList = UserGroup.dao.find(sql, user.getPKValue());
			user.put("ugList", ugList);
			
			ToolCache.set(ParamInitPlugin.cacheStart_user + ids, user);
			ToolCache.set(ParamInitPlugin.cacheStart_user + user.getStr(column_username), user);
			ToolCache.set(ParamInitPlugin.cacheStart_user + user.getStr(column_mobile), user);
			ToolCache.set(ParamInitPlugin.cacheStart_user + user.getStr(column_email), user);
			ToolCache.set(ParamInitPlugin.cacheStart_user + user.getStr(column_idcard), user);
		}
	}

	/**
	 * 删除缓存
	 */
	public static void cacheRemove(String ids){
		User user = User.dao.findById(ids);
		if(user != null){
			ToolCache.remove(ParamInitPlugin.cacheStart_user + ids);
			ToolCache.remove(ParamInitPlugin.cacheStart_user + user.getStr(column_username));
			ToolCache.remove(ParamInitPlugin.cacheStart_user + user.getStr(column_mobile));
			ToolCache.remove(ParamInitPlugin.cacheStart_user + user.getStr(column_email));
			ToolCache.remove(ParamInitPlugin.cacheStart_user + user.getStr(column_idcard));
		}
	}

	/**
	 * 获取缓存
	 * @param ids
	 * @return
	 */
	public static User cacheGetByUserId(String ids){
		User user = ToolCache.get(ParamInitPlugin.cacheStart_user + ids);
		if(user == null){
			user = User.dao.findById(ids);
			if(user != null){
				cacheAdd(ids);
			}
		}
		return user;
	}

	/**
	 * 获取缓存
	 * @param userName
	 * @return
	 */
	public static User cacheGetByUserName(String userName){
		User user = ToolCache.get(ParamInitPlugin.cacheStart_user + userName);
		if(user == null){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("column", column_username);
			String sql = getSqlByBeetl("platform.user.column", param);
			user = User.dao.findFirst(sql, userName);
			if(user != null){
				cacheAdd(user.getPKValue());
			}
		}
		return user;
	}

	/**
	 * 获取缓存
	 * @param mobile
	 * @return
	 */
	public static User cacheGetByMobile(String mobile){
		User user = ToolCache.get(ParamInitPlugin.cacheStart_user + mobile);
		if(user == null){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("column", column_mobile);
			String sql = getSqlByBeetl("platform.user.column", param);
			user = User.dao.findFirst(sql, mobile);
			if(user != null){
				cacheAdd(user.getPKValue());
			}
		}
		return user;
	}

	/**
	 * 获取缓存
	 * @param email
	 * @return
	 */
	public static User cacheGetByEmail(String email){
		User user = ToolCache.get(ParamInitPlugin.cacheStart_user + email);
		if(user == null){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("column", column_email);
			String sql = getSqlByBeetl("platform.user.column", param);
			user = User.dao.findFirst(sql, email);
			if(user != null){
				cacheAdd(user.getPKValue());
			}
		}
		return user;
	}

	/**
	 * 获取缓存
	 * @param idcard
	 * @return
	 */
	public static User cacheGetByIdcard(String idcard){
		User user = ToolCache.get(ParamInitPlugin.cacheStart_user + idcard);
		if(user == null){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("column", column_idcard);
			String sql = getSqlByBeetl("platform.user.column", param);
			user = User.dao.findFirst(sql, idcard);
			if(user != null){
				cacheAdd(user.getPKValue());
			}
		}
		return user;
	}
	
}
