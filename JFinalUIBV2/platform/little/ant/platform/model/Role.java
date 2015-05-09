package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.thread.ThreadParamInit;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 角色model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_role")
public class Role extends BaseModel<Role> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Role.class);
	
	public static final Role dao = new Role();

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
	 * 拥有的功能ids
	 */
	public static final String colunm_operatorids = "operatorids";
	
	/**
	 * 拥有的功能模块ids
	 */
	public static final String colunm_moduleids = "moduleids";
	
	/**
	 * 编号
	 */
	public static final String colunm_numbers = "numbers";
	
	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_role + ids, Role.dao.findById(ids));
	}

	/**
	 * 删除缓存
	 */
	public void cacheRemove(String ids){
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_role + ids);
	}

	/**
	 * 获取缓存
	 * @param key
	 * @return
	 */
	public Role cacheGet(String key){
		Role role = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_role + key);
		return role;
	}
	
}
