package com.platform.plugin;

import java.text.MessageFormat;
import java.util.List;

import com.jfinal.log.Log;
import com.jfinal.plugin.IPlugin;
import com.platform.constant.ConstantInit;
import com.platform.constant.ConstantRender;
import com.platform.dto.DataBase;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.dict.Dict;
import com.platform.mvc.group.Group;
import com.platform.mvc.grouprole.GroupRoleService;
import com.platform.mvc.operator.Operator;
import com.platform.mvc.param.Param;
import com.platform.mvc.station.Station;
import com.platform.mvc.stationoperator.StationOperatorService;
import com.platform.mvc.user.User;
import com.platform.tools.ToolCache;
import com.platform.tools.ToolDataBase;
import com.platform.tools.ToolSqlXml;

/**
 * 系统初始化缓存操作类
 * @author 董华健  2012-10-16 下午1:16:56
 */
public class ParamInitPlugin implements IPlugin {
	
	private static final Log log = Log.getLog(ParamInitPlugin.class);

	/**
	 * 数据批处理大小，每批次处理一万行
	 */
	protected static final int splitDataSize = 10000;
	
    /**
     * 用户缓存key前缀
     */
	public static String cacheStart_user = "user_";

    /**
     * 分组功能缓存key前缀
     */
	public static String cacheStart_group_operator = "group_operator_";

    /**
     * 岗位功能缓存key前缀
     */
	public static String cacheStart_station_operator = "station_operator_";
    
	/**
     * 功能缓存key前缀
     */
	public static String cacheStart_operator = "operator_";
    
	/**
     * 字典缓存key前缀
     */
	public static String cacheStart_dict = "dict_";
    
	/**
     * 字典子节点缓存key前缀
     */
	public static String cacheStart_dict_child =  "dict_child_";
    
	/**
     * 参数缓存key前缀
     */
	public static String cacheStart_param = "param_";
    
	/**
     * 参数子节点缓存key前缀
     */
	public static String cacheStart_param_child =  "param_child_";

	@Override
	public boolean start() {
		if(log.isInfoEnabled()) log.info("缓存参数初始化 start ...");

		// 1.缓存用户
		platform_cacheUser();
		
		// 2.缓存组
		platform_cacheGroupOperator();

		// 3.缓存岗位
		platform_cacheStationOperator();

		// 4.缓存功能
		platform_cacheOperator();

		// 5.缓存字典
		platform_cacheDict();

		// 6.缓存参数
		platform_cacheParam();

		if(log.isInfoEnabled()) log.info("缓存参数初始化 end ...");
		return true;
	}

	@Override
	public boolean stop() {
		return true;
	}

	/**
	 * 缓存所有用户
	 * @author 董华健    2012-10-16 下午1:16:48
	 */
	public static void platform_cacheUser() {
		if(log.isInfoEnabled()) log.info("缓存加载：User start");
		
		DataBase dataBase = ToolDataBase.getDbMap(ConstantInit.db_dataSource_main);
		String db_type = dataBase.getType();
		
		String sql = ToolSqlXml.getSqlMy(User.sqlId_paging, null, ConstantRender.sql_renderType_beetl);
		
		long batchCount = BaseService.getBatchCount(ConstantInit.db_dataSource_main, " from pt_user ", splitDataSize);
		List<User> userList = null;
		for (long i = 0; i < batchCount; i++) {
			if(db_type.equals(ConstantInit.db_type_postgresql) || db_type.equals(ConstantInit.db_type_mysql)){
				userList = User.dao.find(sql, splitDataSize, i * splitDataSize); // start 0
				
			}else if(db_type.equals(ConstantInit.db_type_oracle) || db_type.equals(ConstantInit.db_type_db2)){
				userList = User.dao.find(sql, (i + 1) * splitDataSize, i == 0 ? 1 : (i * splitDataSize + 1)); // start 1
			
			}else if(db_type.equals(ConstantInit.db_type_sqlserver)){
				String topSql = MessageFormat.format(sql, splitDataSize, i * splitDataSize);  // start 0
				userList = User.dao.find(topSql);
			}
			
			for (User user : userList) {
				User.cacheAdd(user.getPKValue());
			}
			userList = null;
		}
		if(log.isInfoEnabled()) log.info("缓存加载：User end");
	}

	/**
	 * 缓存所有组功能
	 * @author 董华健    2012-10-16 下午1:17:20
	 */
	public static void platform_cacheGroupOperator() {
		if(log.isInfoEnabled()) log.info("缓存加载：Group Operator start");
		DataBase dataBase = ToolDataBase.getDbMap(ConstantInit.db_dataSource_main);
		String db_type = dataBase.getType();
		
		String sql = ToolSqlXml.getSqlMy(Group.sqlId_paging, null, ConstantRender.sql_renderType_beetl);
		
		long batchCount = BaseService.getBatchCount(ConstantInit.db_dataSource_main, " from pt_group ", splitDataSize);
		List<Group> groupList = null;
		for (long i = 0; i < batchCount; i++) {
			if(db_type.equals(ConstantInit.db_type_postgresql) || db_type.equals(ConstantInit.db_type_mysql)){
				groupList = Group.dao.find(sql, splitDataSize, i * splitDataSize);
				
			}else if(db_type.equals(ConstantInit.db_type_oracle) || db_type.equals(ConstantInit.db_type_db2)){
				groupList = Group.dao.find(sql, (i + 1) * splitDataSize, i == 0 ? 1 : (i * splitDataSize + 1)); // start 1

			}else if(db_type.equals(ConstantInit.db_type_sqlserver)){
				String topSql = MessageFormat.format(sql, splitDataSize, i * splitDataSize);
				groupList = Group.dao.find(topSql);
			}
			
			for (Group group : groupList) {
				GroupRoleService.cacheAdd(group.getPKValue());
			}
			groupList = null;
		}
		
		if(log.isInfoEnabled()) log.info("缓存加载：Group Operator end");
	}

	/**
	 * 缓存所有的岗位功能
	 * @author 董华健    2013-07-16 下午1:17:20
	 */
	public static void platform_cacheStationOperator() {
		if(log.isInfoEnabled()) log.info("缓存加载：Station Operator start");
		DataBase dataBase = ToolDataBase.getDbMap(ConstantInit.db_dataSource_main);
		String db_type = dataBase.getType();
		
		String sql = ToolSqlXml.getSqlMy(Station.sqlId_paging, null, ConstantRender.sql_renderType_beetl);
		
		long batchCount = BaseService.getBatchCount(ConstantInit.db_dataSource_main, " from pt_station ", splitDataSize);
		List<Station> stationList = null;
		for (long i = 0; i < batchCount; i++) {
			if(db_type.equals(ConstantInit.db_type_postgresql) || db_type.equals(ConstantInit.db_type_mysql)){
				stationList = Station.dao.find(sql, splitDataSize, i * splitDataSize);
				
			}else if(db_type.equals(ConstantInit.db_type_oracle) || db_type.equals(ConstantInit.db_type_db2)){
				stationList = Station.dao.find(sql, (i + 1) * splitDataSize, i == 0 ? 1 : (i * splitDataSize + 1)); // start 1

			}else if(db_type.equals(ConstantInit.db_type_sqlserver)){
				String topSql = MessageFormat.format(sql, splitDataSize, i * splitDataSize);
				stationList = Station.dao.find(topSql);
			}
			
			for (Station station : stationList) {
				StationOperatorService.cacheAdd(station.getPKValue());
			}
			stationList = null;
		}
		
		if(log.isInfoEnabled()) log.info("缓存加载：Station Operator end");
	}

	/**
	 * 缓存操作
	 * @author 董华健    2012-10-16 下午1:17:12
	 */
	public static void platform_cacheOperator() {
		if(log.isInfoEnabled()) log.info("缓存加载：Operator start");
		DataBase dataBase = ToolDataBase.getDbMap(ConstantInit.db_dataSource_main);
		String db_type = dataBase.getType();
		
		String sql = ToolSqlXml.getSqlMy(Operator.sqlId_paging, null, ConstantRender.sql_renderType_beetl);
		
		long batchCount = BaseService.getBatchCount(ConstantInit.db_dataSource_main, " from pt_operator ", splitDataSize);
		List<Operator> operatorList = null;
		for (long i = 0; i < batchCount; i++) {
			if(db_type.equals(ConstantInit.db_type_postgresql) || db_type.equals(ConstantInit.db_type_mysql)){
				operatorList = Operator.dao.find(sql, splitDataSize, i * splitDataSize);
				
			}else if(db_type.equals(ConstantInit.db_type_oracle) || db_type.equals(ConstantInit.db_type_db2)){
				operatorList = Operator.dao.find(sql, (i + 1) * splitDataSize, i == 0 ? 1 : (i * splitDataSize + 1)); // start 1

			}else if(db_type.equals(ConstantInit.db_type_sqlserver)){
				String topSql = MessageFormat.format(sql, splitDataSize, i * splitDataSize);
				operatorList = Operator.dao.find(topSql);
			}
			
			for (Operator operator : operatorList) {
//				long t1 = System.currentTimeMillis();
				ToolCache.set(ParamInitPlugin.cacheStart_operator + operator.getPKValue(), operator);
//				long t2 = System.currentTimeMillis();
				ToolCache.set(ParamInitPlugin.cacheStart_operator + operator.getStr(Operator.column_url), operator);
//				long t3 = System.currentTimeMillis();
//				System.out.println("time1 = " + (t2-t1) + "  time2 = " + (t3-t2));
			}
			operatorList = null;
		}
		
		if(log.isInfoEnabled()) log.info("缓存加载：Operator end");
	}

	/**
	 * 缓存业务字典
	 * @author 董华健    2012-10-16 下午1:17:04
	 */
	public static void platform_cacheDict() {
		if(log.isInfoEnabled()) log.info("缓存加载：Dict start");
		String sql = ToolSqlXml.getSqlMy(Dict.sqlId_all);
		List<Dict> dictList = Dict.dao.find(sql);
		for (Dict dict : dictList) {
			Dict.dao.cacheAdd(dict.getPKValue());
			dict = null;
		}
		if(log.isInfoEnabled()) log.info("缓存加载：Dict end, size = " + dictList.size());
		dictList = null;
	}

	/**
	 * 缓存业务参数
	 * @author 董华健    2012-10-16 下午1:17:04
	 */
	public static void platform_cacheParam() {
		if(log.isInfoEnabled()) log.info("缓存加载：Param start");
		String sql = ToolSqlXml.getSqlMy(Param.sqlId_all);
		List<Param> paramList = Param.dao.find(sql);
		for (Param param : paramList) {
			Param.dao.cacheAdd(param.getPKValue());
			param = null;
		}
		if(log.isInfoEnabled()) log.info("缓存加载：Param end, size = " + paramList.size());
		paramList = null;
	}

}
