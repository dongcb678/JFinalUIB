package com.platform.mvc.operator;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;
import com.platform.annotation.Table;
import com.platform.constant.ConstantCache;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModelCache;
import com.platform.plugin.ParamInitPlugin;

/**
 * 系统功能model
 * @author 董华健
 */
@SuppressWarnings("unused")
//@Table(tableName = "pt_operator")
public class Operator extends BaseModelCache<Operator> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Operator.class);
	
	public static final Operator dao = new Operator();

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
	 * 字段描述：描述 
	 * 字段类型 ：character varying 
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String column_names = "names";
	
	/**
	 * 字段描述：url数量 : 一个还是多个url，多个用逗号隔开 
	 * 字段类型 ：character 
	 */
	public static final String column_onemany = "onemany";
	
	/**
	 * 字段描述：返回参数keys 
	 * 字段类型 ：character varying 
	 */
	public static final String column_returnparamkeys = "returnparamkeys";
	
	/**
	 * 字段描述：返回url 
	 * 字段类型 ：character varying 
	 */
	public static final String column_returnurl = "returnurl";
	
	/**
	 * 字段描述：是否行级过滤 
	 * 字段类型 ：character 
	 */
	public static final String column_rowfilter = "rowfilter";
	
	/**
	 * 字段描述：url 
	 * 字段类型 ：character varying 
	 */
	public static final String column_url = "url";
	
	/**
	 * 字段描述：模块ids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_moduleids = "moduleids";
	
	/**
	 * 字段描述：是否分页 
	 * 字段类型 ：character 
	 */
	public static final String column_splitpage = "splitpage";
	
	/**
	 * 字段描述：是否重复提交验证 
	 * 字段类型 ：character 
	 */
	public static final String column_formtoken = "formtoken";
	
	/**
	 * 字段描述：ip黑名单过滤 
	 * 字段类型 ：character 
	 */
	public static final String column_ipblack = "ipblack";
	
	/**
	 * 字段描述：是否需要权限验证 
	 * 字段类型 ：character 
	 */
	public static final String column_privilegess = "privilegess";
	
	/**
	 * 字段描述：是否记录PV 
	 * 字段类型 ：character 
	 */
	public static final String column_ispv = "ispv";
	
	/**
	 * 字段描述：pv类型 
	 * 字段类型 ：character 
	 */
	public static final String column_pvtype = "pvtype";
	
	/**
	 * 字段描述：模块names 
	 * 字段类型 ：character varying 
	 */
	public static final String column_modulenames = "modulenames";

	/**
	 * sqlId : platform.operator.all
	 * 描述：查询所有功能
	 */
	public static final String sqlId_all = "platform.operator.all";

	/**
	 * sqlId : platform.operator.rootModule
	 * 描述：获取模块根节点
	 */
	public static final String sqlId_rootModule = "platform.operator.rootModule";

	/**
	 * sqlId : platform.operator.childModule
	 * 描述：获取模块子节点
	 */
	public static final String sqlId_childModule = "platform.operator.childModule";

	/**
	 * sqlId : platform.operator.byModuleIds
	 * 描述：获取模块下面的功能
	 */
	public static final String sqlId_byModuleIds = "platform.operator.byModuleIds";

	/**
	 * sqlId : platform.operator.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "platform.operator.splitPageSelect";

	/**
	 * sqlId : platform.operator.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "platform.operator.splitPageFrom";

	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		Operator operator = Operator.dao.findById(ids);
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_operator + ids, operator);
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_operator + operator.getStr(column_url), operator);
	}

	/**
	 * 删除缓存
	 * @param ids
	 */
	public void cacheRemove(String ids){
		Operator operator = Operator.dao.findById(ids);
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_operator + ids);
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_operator + operator.getStr(column_url));
	}

	/**
	 * 获取缓存
	 * @param key
	 * @return
	 */
	public Operator cacheGet(String key){
		Operator operator = CacheKit.get(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_operator + key);
		return operator;
	}
	
}
