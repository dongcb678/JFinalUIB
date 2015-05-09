package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.thread.ThreadParamInit;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 系统功能model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_operator")
public class Operator extends BaseModel<Operator> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Operator.class);
	
	public static final Operator dao = new Operator();

	/**
	 * 主键
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 版本号
	 */
	public static final String colunm_version = "version";
	
	/**
	 * 描述
	 */
	public static final String colunm_description = "description";
	
	/**
	 * 名称
	 */
	public static final String colunm_names = "names";
	
	/**
	 * url数量 : 一个还是多个url，多个用逗号隔开
	 */
	public static final String colunm_onemany = "onemany";
	
	/**
	 * 返回参数keys
	 */
	public static final String colunm_returnparamkeys = "returnparamkeys";
	
	/**
	 * 返回url
	 */
	public static final String colunm_returnurl = "returnurl";
	
	/**
	 * 是否行级过滤
	 */
	public static final String colunm_rowfilter = "rowfilter";
	
	/**
	 * url
	 */
	public static final String colunm_url = "url";
	
	/**
	 * 模块ids
	 */
	public static final String colunm_moduleids = "moduleids";
	
	/**
	 * 是否分页
	 */
	public static final String colunm_splitpage = "splitpage";
	
	/**
	 * 是否重复提交验证
	 */
	public static final String colunm_formtoken = "formtoken";
	
	/**
	 * ip黑名单过滤
	 */
	public static final String colunm_ipblack = "ipblack";
	
	/**
	 * 是否需要权限验证
	 */
	public static final String colunm_privilegess = "privilegess";
	
	/**
	 * 是否记录PV
	 */
	public static final String colunm_ispv = "ispv";
	
	/**
	 * pv类型
	 */
	public static final String colunm_pvtype = "pvtype";
	
	/**
	 * 模块names
	 */
	public static final String colunm_modulenames = "modulenames";
	
	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		Operator operator = Operator.dao.findById(ids);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + ids, operator);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr(colunm_url), operator);
	}

	/**
	 * 删除缓存
	 * @param ids
	 */
	public void cacheRemove(String ids){
		Operator operator = Operator.dao.findById(ids);
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + ids);
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr(colunm_url));
	}

	/**
	 * 获取缓存
	 * @param key
	 * @return
	 */
	public Operator cacheGet(String key){
		Operator operator = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + key);
		return operator;
	}
	
}
