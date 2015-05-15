package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.thread.ThreadParamInit;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 系统功能model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantPlatform.db_dataSource_main, tableName = "pt_operator")
public class Operator extends BaseModel<Operator> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Operator.class);
	
	public static final Operator dao = new Operator();

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
	 * 字段描述：描述 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_description = "description";
	
	/**
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_names = "names";
	
	/**
	 * 字段描述：url数量 : 一个还是多个url，多个用逗号隔开 
	 * 字段类型 ：character 
	 */
	public static final String colunm_onemany = "onemany";
	
	/**
	 * 字段描述：返回参数keys 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_returnparamkeys = "returnparamkeys";
	
	/**
	 * 字段描述：返回url 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_returnurl = "returnurl";
	
	/**
	 * 字段描述：是否行级过滤 
	 * 字段类型 ：character 
	 */
	public static final String colunm_rowfilter = "rowfilter";
	
	/**
	 * 字段描述：url 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_url = "url";
	
	/**
	 * 字段描述：模块ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_moduleids = "moduleids";
	
	/**
	 * 字段描述：是否分页 
	 * 字段类型 ：character 
	 */
	public static final String colunm_splitpage = "splitpage";
	
	/**
	 * 字段描述：是否重复提交验证 
	 * 字段类型 ：character 
	 */
	public static final String colunm_formtoken = "formtoken";
	
	/**
	 * 字段描述：ip黑名单过滤 
	 * 字段类型 ：character 
	 */
	public static final String colunm_ipblack = "ipblack";
	
	/**
	 * 字段描述：是否需要权限验证 
	 * 字段类型 ：character 
	 */
	public static final String colunm_privilegess = "privilegess";
	
	/**
	 * 字段描述：是否记录PV 
	 * 字段类型 ：character 
	 */
	public static final String colunm_ispv = "ispv";
	
	/**
	 * 字段描述：pv类型 
	 * 字段类型 ：character 
	 */
	public static final String colunm_pvtype = "pvtype";
	
	/**
	 * 字段描述：模块names 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_modulenames = "modulenames";
	
	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		Operator operator = Operator.dao.findById(ids);
		CacheKit.put(ConstantPlatform.cache_name_system, ThreadParamInit.cacheStart_operator + ids, operator);
		CacheKit.put(ConstantPlatform.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr(colunm_url), operator);
	}

	/**
	 * 删除缓存
	 * @param ids
	 */
	public void cacheRemove(String ids){
		Operator operator = Operator.dao.findById(ids);
		CacheKit.remove(ConstantPlatform.cache_name_system, ThreadParamInit.cacheStart_operator + ids);
		CacheKit.remove(ConstantPlatform.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr(colunm_url));
	}

	/**
	 * 获取缓存
	 * @param key
	 * @return
	 */
	public Operator cacheGet(String key){
		Operator operator = CacheKit.get(ConstantPlatform.cache_name_system, ThreadParamInit.cacheStart_operator + key);
		return operator;
	}
	
}
