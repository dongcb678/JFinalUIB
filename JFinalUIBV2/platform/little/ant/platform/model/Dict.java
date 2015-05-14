package little.ant.platform.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.thread.ThreadParamInit;
import little.ant.platform.tools.ToolSqlXml;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 字典model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_dict")
public class Dict extends BaseModel<Dict> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Dict.class);
	
	public static final Dict dao = new Dict();

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
	 * 根据主键查询字典，带国际化
	 * @param ids 主键
	 * @param i18n 国际化参数
	 * @return
	 */
	public Dict getByIds(String ids, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = getSqlByBeetl("platform.dict.idAndI18n", param);
		
		Dict dict = dao.findFirst(sql, ids);
		
		return dict;
	}
	
	/**
	 * 根据编号查询字典
	 * @param number
	 * @return
	 */
	public Dict getByNumber(String number){
		String sql = getSql("platform.dict.numbers");
		Dict dict = dao.findFirst(sql, number);
		return dict;
	}
	
	/**
	 * 根据编号查询字典，带国际化
	 * @param number 编号
	 * @param i18n 国际化参数
	 * @return
	 */
	public Dict getByNumber(String number, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = getSqlByBeetl("platform.dict.numbersAndI18n", param);
		
		Dict dict = dao.findFirst(sql, number);
		
		return dict;
	}

	/**
	 * 查询子节点字典
	 * @return
	 */
	public List<Dict> getChild(){
		String sql = getSql("platform.dict.child");
		return dao.find(sql, getPKValue());
	}

	/**
	 * 查询子节点字典
	 * @param prentIds
	 * @return
	 */
	public List<Dict> getChild(String prentIds){
		String sql = getSql("platform.dict.child");
		return dao.find(sql, prentIds);
	}

	/**
	 * 查询子节点字典，国际化
	 * @param prentIds
	 * @param i18n
	 * @return
	 */
	public List<Dict> getChild(String prentIds, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = getSqlByBeetl("platform.dict.childAndI8n", param);
		
		return dao.find(sql, prentIds);
	}

	/**
	 * 查询父节点字典
	 * @return
	 */
	public Dict getParent(){
		String sql = getSql("platform.dict.parent");
		return dao.findFirst(sql, get(colunm_parentids));
	}

	/**
	 * 查询父节点字典，国际化
	 * @param i18n
	 * @return
	 */
	public Dict getParent(String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = getSqlByBeetl("platform.dict.parentAndI18n", param);
		
		return dao.findFirst(sql, get(colunm_parentids));
	}

	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		Dict dict = Dict.dao.findById(ids);
		List<Dict> dictList = dict.getChild();
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + ids, dict);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr(colunm_numbers), dict);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + ids, dictList);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + dict.getStr(colunm_numbers), dictList);

		String parentIds = dict.getStr("parentids");
		if(null != parentIds){
			Dict parent = Dict.dao.findById(parentIds);
			if(null != parent){
				List<Dict> parentList = parent.getChild();
				CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + parent.getPKValue(), parentList);
				CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + parent.getStr(colunm_numbers), parentList);
			}
		}
	}

	/**
	 * 删除缓存
	 * @param ids
	 */
	public void cacheRemove(String ids){
		Dict dict = Dict.dao.findById(ids);
		
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + ids);
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr(colunm_numbers));
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + ids);
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + dict.getStr(colunm_numbers));

		String parentIds = dict.getStr("parentids");
		if(null != parentIds){
			Dict parent = Dict.dao.findById(parentIds);
			if(null != parent){
				List<Dict> parentList = parent.getChild();
				CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + parent.getPKValue(), parentList);
				CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + parent.getStr(colunm_numbers), parentList);
			}
		}
	}

	/**
	 * 获取缓存
	 * @param key
	 * @return
	 */
	public Dict cacheGet(String key){
		Dict dict = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + key);
		return dict;
	}
	
	/**
	 * 获取缓存
	 * @param key
	 * @return
	 */
	public List<Dict> cacheGetChild(String key){
		List<Dict> dictList = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + key);
		return dictList;
	}
	
}
