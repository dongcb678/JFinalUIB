package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantCache;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.plugin.ParamInitPlugin;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 岗位model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = "pt_station")
public class Station extends BaseModelCache<Station> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Station.class);
	
	public static final Station dao = new Station();

	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型 ：bigint 
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：描述 
	 * 字段类型 ：character varying 
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：图标 
	 * 字段类型 ：character varying 
	 */
	public static final String column_images = "images";
	
	/**
	 * 字段描述：是否上级节点 
	 * 字段类型 ：character varying 
	 */
	public static final String column_isparent = "isparent";
	
	/**
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String column_names = "names";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型 ：bigint 
	 */
	public static final String column_orderids = "orderids";
	
	/**
	 * 字段描述：上级岗位ids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_parentstationids = "parentstationids";
	
	/**
	 * 字段描述：拥有的功能ids 
	 * 字段类型 ：text 
	 */
	public static final String column_operatorids = "operatorids";
	
	/**
	 * 字段描述：拥有的功能模块ids 
	 * 字段类型 ：text 
	 */
	public static final String column_moduleids = "moduleids";

	/**
	 * sqlId : platform.station.all
	 * 描述：查询所有岗位
	 */
	public static final String sqlId_all = "platform.station.all";

	/**
	 * sqlId : platform.station.root
	 * 描述：根节点
	 */
	public static final String sqlId_root = "platform.station.root";

	/**
	 * sqlId : platform.station.child
	 * 描述：子节点 
	 */
	public static final String sqlId_child = "platform.station.child";

	/**
	 * sqlId : platform.station.childCount
	 * 描述：子节点数量 
	 */
	public static final String sqlId_childCount = "platform.station.childCount";

	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		CacheKit.put(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_station + ids, Station.dao.findById(ids));
	}

	/**
	 * 删除缓存
	 */
	public void cacheRemove(String ids){
		CacheKit.remove(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_station + ids);
	}

	/**
	 * 获取缓存
	 * @param ids
	 * @return
	 */
	public Station cacheGet(String ids){
		Station station = CacheKit.get(ConstantCache.cache_name_system, ParamInitPlugin.cacheStart_station + ids);
		return station;
	}
	
}
