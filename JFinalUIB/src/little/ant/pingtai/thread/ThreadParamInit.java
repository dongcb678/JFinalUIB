package little.ant.pingtai.thread;

import java.util.List;

import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.model.DictModel;
import little.ant.pingtai.model.GroupModel;
import little.ant.pingtai.model.OperatorModel;
import little.ant.pingtai.model.ParamModel;
import little.ant.pingtai.model.RoleModel;
import little.ant.pingtai.model.StationModel;
import little.ant.pingtai.model.UserModel;
import little.ant.pingtai.model.UserInfoModel;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 系统初始化缓存操作类
 * @author 董华健  2012-10-16 下午1:16:56
 */
public class ThreadParamInit extends Thread {
	
	private static Logger log = Logger.getLogger(ThreadParamInit.class);
	
	public static String cacheStart_user = "user_";
	public static String cacheStart_group = "group_";
	public static String cacheStart_role = "role_";
	public static String cacheStart_station = "station_";
	public static String cacheStart_operator = "operator_";
	public static String cacheStart_dict = "dict_";
	public static String cacheStart_dict_child =  "dict_child_";
	public static String cacheStart_param = "param_";
	public static String cacheStart_param_child =  "param_child_";
	
	@Override
	public void run() {
		log.info("缓存参数初始化 start ...");

		// 1.缓存用户
		pingtai_cacheUser();

		// 2.缓存组
		pingtai_cacheGroup();

		// 3.缓存角色
		pingtai_cacheRole();

		// 4.缓存岗位
		pingtai_cacheStation();

		// 5.缓存功能
		pingtai_cacheOperator();

		// 6.缓存字典
		pingtai_cacheDict();

		// 6.缓存参数
		pingtai_cacheParam();

		log.info("缓存参数初始化 end ...");
	}

	/**
	 * 缓存所有用户
	 * @author 董华健    2012-10-16 下午1:16:48
	 */
	public static void pingtai_cacheUser() {
		String sql = ToolSqlXml.getSql("pingtai.user.all");
		List<UserModel> userList = UserModel.dao.find(sql);
		for (UserModel user : userList) {
			UserInfoModel userInfo = user.getUserInfo();
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr("ids"), user);
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr("username"), user);
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr("email"), user);
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr("mobile"), user);
			user = null;
		}
		userList = null;
	}

	/**
	 * 缓存所有组
	 * @author 董华健    2012-10-16 下午1:17:20
	 */
	public static void pingtai_cacheGroup() {
		String sql = ToolSqlXml.getSql("pingtai.group.all");
		List<GroupModel> groupList = GroupModel.dao.find(sql);
		for (GroupModel group : groupList) {
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_group + group.getStr("ids"), group);
		}
		groupList = null;
	}

	/**
	 * 缓存所有角色
	 * @author 董华健    2012-10-16 下午1:17:20
	 */
	public static void pingtai_cacheRole() {
		String sql = ToolSqlXml.getSql("pingtai.role.all");
		List<RoleModel> roleList = RoleModel.dao.find(sql);
		for (RoleModel role : roleList) {
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_role + role.getStr("ids"), role);
		}
		roleList = null;
	}
	
	/**
	 * 缓存所有的岗位
	 * @author 董华健    2013-07-16 下午1:17:20
	 */
	public static void pingtai_cacheStation() {
		String sql = ToolSqlXml.getSql("pingtai.station.all");
		List<StationModel> stationList = StationModel.dao.find(sql);
		for (StationModel station : stationList) {
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_station + station.getStr("ids"), station);
		}
		stationList = null;
	}

	/**
	 * 缓存操作
	 * @author 董华健    2012-10-16 下午1:17:12
	 */
	public static void pingtai_cacheOperator() {
		String sql = ToolSqlXml.getSql("pingtai.operator.all");
		List<OperatorModel> operatorList = OperatorModel.dao.find(sql);
		for (OperatorModel operator : operatorList) {
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr("ids"), operator);
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr("url"), operator);
			operator = null;
		}
		operatorList = null;
	}

	/**
	 * 缓存业务字典
	 * @author 董华健    2012-10-16 下午1:17:04
	 */
	public static void pingtai_cacheDict() {
		String sql = ToolSqlXml.getSql("pingtai.dict.all");
		List<DictModel> dictList = DictModel.dao.find(sql);
		for (DictModel dict : dictList) {
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr("ids"), dict);
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr("numbers"), dict);
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + dict.getStr("ids"), dict.getChild());
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + dict.getStr("numbers"), dict.getChild());
			dict = null;
		}
		dictList = null;
	}

	/**
	 * 缓存业务参数
	 * @author 董华健    2012-10-16 下午1:17:04
	 */
	public static void pingtai_cacheParam() {
		String sql = ToolSqlXml.getSql("pingtai.param.all");
		List<ParamModel> paramList = ParamModel.dao.find(sql);
		for (ParamModel param : paramList) {
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param + param.getStr("ids"), param);
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param + param.getStr("numbers"), param);
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + param.getStr("ids"), param.getChild());
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + param.getStr("numbers"), param.getChild());
			param = null;
		}
		paramList = null;
	}

}
