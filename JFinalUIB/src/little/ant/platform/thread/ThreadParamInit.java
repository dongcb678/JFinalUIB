package little.ant.platform.thread;

import java.util.List;

import little.ant.platform.model.Dict;
import little.ant.platform.model.Group;
import little.ant.platform.model.Operator;
import little.ant.platform.model.Param;
import little.ant.platform.model.Role;
import little.ant.platform.model.Station;
import little.ant.platform.model.User;
import little.ant.platform.tools.ToolSqlXml;

import org.apache.log4j.Logger;

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
		List<User> userList = User.dao.find(sql);
		for (User user : userList) {
			User.dao.cacheAdd(user.getStr("ids"));
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
		List<Group> groupList = Group.dao.find(sql);
		for (Group group : groupList) {
			Group.dao.cacheAdd(group.getStr("ids"));
		}
		groupList = null;
	}

	/**
	 * 缓存所有角色
	 * @author 董华健    2012-10-16 下午1:17:20
	 */
	public static void pingtai_cacheRole() {
		String sql = ToolSqlXml.getSql("pingtai.role.all");
		List<Role> roleList = Role.dao.find(sql);
		for (Role role : roleList) {
			Role.dao.cacheAdd(role.getStr("ids"));
		}
		roleList = null;
	}
	
	/**
	 * 缓存所有的岗位
	 * @author 董华健    2013-07-16 下午1:17:20
	 */
	public static void pingtai_cacheStation() {
		String sql = ToolSqlXml.getSql("pingtai.station.all");
		List<Station> stationList = Station.dao.find(sql);
		for (Station station : stationList) {
			Station.dao.cacheAdd(station.getStr("ids"));
		}
		stationList = null;
	}

	/**
	 * 缓存操作
	 * @author 董华健    2012-10-16 下午1:17:12
	 */
	public static void pingtai_cacheOperator() {
		String sql = ToolSqlXml.getSql("pingtai.operator.all");
		List<Operator> operatorList = Operator.dao.find(sql);
		for (Operator operator : operatorList) {
			Operator.dao.cacheAdd(operator.getStr("ids"));
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
		List<Dict> dictList = Dict.dao.find(sql);
		for (Dict dict : dictList) {
			Dict.dao.cacheAdd(dict.getStr("ids"));
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
		List<Param> paramList = Param.dao.find(sql);
		for (Param param : paramList) {
			Param.dao.cacheAdd(param.getStr("ids"));
			param = null;
		}
		paramList = null;
	}

}
