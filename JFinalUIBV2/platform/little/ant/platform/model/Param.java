package little.ant.platform.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantCache;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.plugin.ParamInitPlugin;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 参数model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "pt_param")
public class Param extends BaseModelCache<Param> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Param.class);
	
	public static final Param dao = new Param();

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
	 * 字段描述：图标 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_images = "images";
	
	/**
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_names = "names";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_orderids = "orderids";
	
	/**
	 * 字段描述：tree路径 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_paths = "paths";
	
	/**
	 * 字段描述：状态 
	 * 字段类型 ：character 
	 */
	public static final String colunm_zhuangtai = "zhuangtai";
	
	/**
	 * 字段描述：上级ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_parentids = "parentids";
	
	/**
	 * 字段描述：是否上级节点 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_isparent = "isparent";
	
	/**
	 * 字段描述：层级级别 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_levels = "levels";
	
	/**
	 * 字段描述：编号 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_numbers = "numbers";
	
	/**
	 * 字段描述：值 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_val = "val";
	
	/**
	 * 字段描述：是否国际化 : 0否1是 
	 * 字段类型 ：character 
	 */
	public static final String colunm_i18n = "i18n";
	
	/**
	 * 字段描述：中文简体值 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_val_zhcn = "val_zhcn";
	
	/**
	 * 字段描述：中文香港值 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_val_zhhk = "val_zhhk";
	
	/**
	 * 字段描述：中文台湾值 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_val_zhtw = "val_zhtw";
	
	/**
	 * 字段描述：日文值 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_val_ja = "val_ja";
	
	/**
	 * 字段描述：英文值 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_val_enus = "val_enus";
	
	/**
	 * 字段描述：账号状态 
	 * 字段类型 ：character 
	 */
	public static final String colunm_status = "status";
	
	/**
	 * 根据主键查询参数，带国际化
	 * @param ids 主键
	 * @param i18n 国际化参数
	 * @return
	 */
	public Param getByIds(String ids, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("val", val);
		
		String sql = getSqlByBeetl("platform.param.idAndI18n", paramMap);
		
		Param param = dao.findFirst(sql, ids);
		return param;
	}
	
	/**
	 * 根据编号查询参数
	 * @param number
	 * @return
	 */
	public Param getByNumber(String number){
		String sql = getSql("platform.param.numbers");
		Param param = dao.findFirst(sql, number);
		return param;
	}
	
	/**
	 * 根据编号查询参数，带国际化
	 * @param number 编号
	 * @param i18n 国际化参数
	 * @return
	 */
	public Param getByNumber(String number, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("val", val);
		
		String sql = getSqlByBeetl("platform.param.numbersAndI18n", paramMap);
		
		Param param = dao.findFirst(sql, number);
		return param;
	}

	/**
	 * 查询子节点参数
	 * @return
	 */
	public List<Param> getChild(){
		String sql = getSql("platform.param.child");
		return dao.find(sql, getPKValue());
	}

	/**
	 * 查询子节点参数
	 * @param prentIds
	 * @return
	 */
	public List<Param> getChild(String prentIds){
		String sql = getSql("platform.param.child");
		return dao.find(sql, prentIds);
	}

	/**
	 * 查询子节点参数，国际化
	 * @param prentIds
	 * @param i18n
	 * @return
	 */
	public List<Param> getChild(String prentIds, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = getSqlByBeetl("platform.param.childAndI8n", param);
		
		return dao.find(sql, prentIds);
	}

	/**
	 * 查询父节点参数
	 * @return
	 */
	public Param getParent(){
		String sql = getSql("platform.param.parent");
		return dao.findFirst(sql, get(colunm_parentids));
	}

	/**
	 * 查询父节点参数，国际化
	 * @param i18n
	 * @return
	 */
	public Param getParent(String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = getSqlByBeetl("platform..parentAndI18n", param);
		
		return dao.findFirst(sql, get(colunm_parentids));
	}

	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		Param param = Param.dao.findById(ids);
		List<Param> paramList = param.getChild();
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param + ids, param);
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param + param.getStr(colunm_numbers), param);
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param_child + ids, paramList);
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param_child + param.getStr(colunm_numbers), paramList);
		
		String paramIds = param.getStr("parentids");
		if(null != paramIds){
			Param parent = Param.dao.findById(param.getStr("parentids"));
			if(null != parent){
				List<Param> parentList = parent.getChild();
				CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param_child + parent.getPKValue(), parentList);
				CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param_child + parent.getStr(colunm_numbers), parentList);
			}
		}
	}

	/**
	 * 删除缓存
	 * @param ids
	 */
	public void cacheRemove(String ids){
		Param param = Param.dao.findById(ids);
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param + ids);
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param + param.getStr(colunm_numbers));
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param_child + ids);
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param_child + param.getStr(colunm_numbers));

		String paramIds = param.getStr("parentids");
		if(null != paramIds){
			Param parent = Param.dao.findById(param.getStr("parentids"));
			if(null != parent){
				List<Param> parentList = parent.getChild();
				CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param_child + parent.getPKValue(), parentList);
				CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param_child + parent.getStr(colunm_numbers), parentList);
			}
		}
	}

	/**
	 * 获取缓存
	 * @param key
	 * @return
	 */
	public Param cacheGet(String key){
		Param param = CacheKit.get(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param + key);
		return param;
	}
	
	/**
	 * 获取缓存
	 * @param key
	 * @return
	 */
	public List<Param> cacheGetChild(String key){
		List<Param> paramList = CacheKit.get(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_param_child + key);
		return paramList;
	}
	
}
