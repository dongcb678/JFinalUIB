package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.thread.ThreadParamInit;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 人员分组model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = "pt_group")
public class Group extends BaseModel<Group> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Group.class);
	
	public static final Group dao = new Group();

	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_group + ids, Group.dao.findById(ids));
	}

	/**
	 * 删除缓存
	 */
	public void cacheRemove(String ids){
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_group + ids);
	}

	/**
	 * 获取缓存
	 * @param ids
	 * @return
	 */
	public Group cacheGet(String ids){
		Group group = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_group + ids);
		return group;
	}
	
}
