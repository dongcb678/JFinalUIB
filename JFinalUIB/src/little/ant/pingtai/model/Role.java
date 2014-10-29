package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.thread.ThreadParamInit;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_role")
public class Role extends BaseModel<Role> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Role.class);
	
	public static final Role dao = new Role();

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
