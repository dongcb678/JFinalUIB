package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantCache;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.plugin.ParamInitPlugin;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 人员分组model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "pt_group")
public class Group extends BaseModelCache<Group> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Group.class);
	
	public static final Group dao = new Group();

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
	 * 字段描述：拥有的角色ids 
	 * 字段类型 ：text 
	 */
	public static final String colunm_roleids = "roleids";
	
	/**
	 * 字段描述：编号 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_numbers = "numbers";
	
	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_group + ids, Group.dao.findById(ids));
	}

	/**
	 * 删除缓存
	 */
	public void cacheRemove(String ids){
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_group + ids);
	}

	/**
	 * 获取缓存
	 * @param ids
	 * @return
	 */
	public Group cacheGet(String ids){
		Group group = CacheKit.get(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_group + ids);
		return group;
	}
	
}
