package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.thread.ThreadParamInit;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 岗位model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_station")
public class Station extends BaseModel<Station> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Station.class);
	
	public static final Station dao = new Station();

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
	 * 图标
	 */
	public static final String colunm_images = "images";
	
	/**
	 * 是否上级节点
	 */
	public static final String colunm_isparent = "isparent";
	
	/**
	 * 名称
	 */
	public static final String colunm_names = "names";
	
	/**
	 * 排序号
	 */
	public static final String colunm_orderids = "orderids";
	
	/**
	 * 上级岗位ids
	 */
	public static final String colunm_parentstationids = "parentstationids";
	
	/**
	 * 拥有的功能ids
	 */
	public static final String colunm_operatorids = "operatorids";
	
	/**
	 * 拥有的功能模块ids
	 */
	public static final String colunm_moduleids = "moduleids";
	
	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_station + ids, Station.dao.findById(ids));
	}

	/**
	 * 删除缓存
	 */
	public void cacheRemove(String ids){
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_station + ids);
	}

	/**
	 * 获取缓存
	 * @param ids
	 * @return
	 */
	public Station cacheGet(String ids){
		Station station = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_station + ids);
		return station;
	}
	
}
