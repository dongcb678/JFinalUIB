package com.platform.mvc.station;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 岗位model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = Station.table_name)
public class Station extends BaseModel<Station> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static final Log log = Log.getLog(Station.class);
	
	public static final Station dao = new Station().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_station";
	
	/**
	 * 字段描述：主键 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：描述 
	 * 字段类型：character varying  长度：200
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：图标 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_images = "images";
	
	/**
	 * 字段描述：是否上级节点 
	 * 字段类型：character varying  长度：5
	 */
	public static final String column_isparent = "isparent";
	
	/**
	 * 字段描述：名称 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_names = "names";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_orderids = "orderids";
	
	/**
	 * 字段描述：上级岗位ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_parentstationids = "parentstationids";
	
	/**
	 * sqlId : platform.station.paging
	 * 描述：查询所有岗位
	 */
	public static final String sqlId_paging = "platform.station.paging";

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

	private String ids;
	private Long version;
	private String description;
	private String images;
	private String isparent;
	private String names;
	private Long orderids;
	private String parentstationids;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setVersion(Long version){
		set(column_version, version);
	}
	public Long getVersion() {
		return get(column_version);
	}
	public void setDescription(String description){
		set(column_description, description);
	}
	public String getDescription() {
		return get(column_description);
	}
	public void setImages(String images){
		set(column_images, images);
	}
	public String getImages() {
		return get(column_images);
	}
	public void setIsparent(String isparent){
		set(column_isparent, isparent);
	}
	public String getIsparent() {
		return get(column_isparent);
	}
	public void setNames(String names){
		set(column_names, names);
	}
	public String getNames() {
		return get(column_names);
	}
	public void setOrderids(Long orderids){
		set(column_orderids, orderids);
	}
	public Long getOrderids() {
		return get(column_orderids);
	}
	public void setParentstationids(String parentstationids){
		set(column_parentstationids, parentstationids);
	}
	public String getParentstationids() {
		return get(column_parentstationids);
	}
	
}
