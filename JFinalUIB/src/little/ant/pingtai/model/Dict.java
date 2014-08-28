package little.ant.pingtai.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.thread.ThreadParamInit;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

@SuppressWarnings("unused")
@Table(tableName="pt_dict")
public class Dict extends BaseModel<Dict> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Dict.class);
	
	public static final Dict dao = new Dict();

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
		
		String sql = ToolSqlXml.getSql("pingtai.dict.idAndI18n", param);
		
		Dict dict = dao.findFirst(sql, ids);
		
		return dict;
	}
	
	/**
	 * 根据编号查询字典
	 * @param number
	 * @return
	 */
	public Dict getByNumber(String number){
		String sql = ToolSqlXml.getSql("pingtai.dict.numbers");
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
		
		String sql = ToolSqlXml.getSql("pingtai.dict.numbersAndI18n", param);
		
		Dict dict = dao.findFirst(sql, number);
		
		return dict;
	}

	/**
	 * 查询子节点字典
	 * @return
	 */
	public List<Dict> getChild(){
		String sql = ToolSqlXml.getSql("pingtai.dict.child");
		return dao.find(sql, get("ids"));
	}

	/**
	 * 查询子节点字典
	 * @param prentIds
	 * @return
	 */
	public List<Dict> getChild(String prentIds){
		String sql = ToolSqlXml.getSql("pingtai.dict.child");
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
		
		String sql = ToolSqlXml.getSql("pingtai.dict.childAndI8n", param);
		
		return dao.find(sql, prentIds);
	}

	/**
	 * 查询父节点字典
	 * @return
	 */
	public List<Dict> getParent(){
		String sql = ToolSqlXml.getSql("pingtai.dict.parent");
		return dao.find(sql, get("parentids"));
	}

	/**
	 * 查询父节点字典，国际化
	 * @param i18n
	 * @return
	 */
	public List<Dict> getParent(String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = ToolSqlXml.getSql("pingtai.dict.parentAndI18n", param);
		
		return dao.find(sql, get("parentids"));
	}

	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		Dict dict = Dict.dao.findById(ids);
		List<Dict> dictList = dict.getChild();
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + ids, dict);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr("numbers"), dict);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + ids, dictList);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + dict.getStr("numbers"), dictList);

		String parentIds = dict.getStr("parentids");
		if(null != parentIds){
			Dict parent = Dict.dao.findById(parentIds);
			if(null != parent){
				List<Dict> parentList = parent.getChild();
				CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + parent.getStr("ids"), parentList);
				CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + parent.getStr("numbers"), parentList);
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
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr("numbers"));
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + ids);
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + dict.getStr("numbers"));

		String parentIds = dict.getStr("parentids");
		if(null != parentIds){
			Dict parent = Dict.dao.findById(parentIds);
			if(null != parent){
				List<Dict> parentList = parent.getChild();
				CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + parent.getStr("ids"), parentList);
				CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + parent.getStr("numbers"), parentList);
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
