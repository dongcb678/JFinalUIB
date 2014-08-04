package little.ant.pingtai.thread;

import java.util.List;

import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.model.Dict;
import little.ant.pingtai.model.Group;
import little.ant.pingtai.model.Operator;
import little.ant.pingtai.model.Role;
import little.ant.pingtai.model.Station;
import little.ant.pingtai.model.User;
import little.ant.pingtai.model.UserInfo;

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

		log.info("缓存参数初始化 end ...");
	}

	/**
	 * 缓存所有用户
	 * @author 董华健    2012-10-16 下午1:16:48
	 */
	public static void pingtai_cacheUser() {
		List<User> userList = User.dao.find("select * from pt_user");
		for (User user : userList) {
			UserInfo userInfo = user.getUserInfo();
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
		List<Group> groupList = Group.dao.find("select * from pt_group");
		for (Group group : groupList) {
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_group + group.getStr("ids"), group);
		}
		groupList = null;
	}

	/**
	 * 缓存所有角色
	 * @author 董华健    2012-10-16 下午1:17:20
	 */
	public static void pingtai_cacheRole() {
		List<Role> roleList = Role.dao.find("select * from pt_role");
		for (Role role : roleList) {
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_role + role.getStr("ids"), role);
		}
		roleList = null;
	}
	
	/**
	 * 缓存所有的岗位
	 * @author 董华健    2013-07-16 下午1:17:20
	 */
	public static void pingtai_cacheStation() {
		List<Station> stationList = Station.dao.find("select * from pt_station");
		for (Station station : stationList) {
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_station + station.getStr("ids"), station);
		}
		stationList = null;
	}

	/**
	 * 缓存操作
	 * @author 董华健    2012-10-16 下午1:17:12
	 */
	public static void pingtai_cacheOperator() {
		List<Operator> operatorList = Operator.dao.find("select * from pt_operator");
		for (Operator operator : operatorList) {
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
		List<Dict> dictList = Dict.dao.find("select * from pt_dict");
		for (Dict dict : dictList) {
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr("ids"), dict);
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr("numbers"), dict);
			CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + dict.getStr("ids"), dict.getChild());
			dict = null;
		}
		dictList = null;
	}

}
