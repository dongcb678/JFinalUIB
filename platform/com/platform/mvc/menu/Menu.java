package com.platform.mvc.menu;

import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;
import com.platform.mvc.operator.Operator;

/**
 * 菜单model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = Menu.table_name)
public class Menu extends BaseModel<Menu> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static final Log log = Log.getLog(Menu.class);
	
	public static final Menu dao = new Menu().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_menu";
	
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
	 * 字段描述：图标 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_images = "images";
	
	/**
	 * 字段描述：层级级别 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_levels = "levels";
	
	/**
	 * 字段描述：名称中文简体 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_names_zhcn = "names_zhcn";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_orderids = "orderids";
	
	/**
	 * 字段描述：菜单对应功能ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_operatorids = "operatorids";
	
	/**
	 * 字段描述：上级菜单ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_parentmenuids = "parentmenuids";
	
	/**
	 * 字段描述：所属系统ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_systemsids = "systemsids";
	
	/**
	 * 字段描述：是否上级节点 
	 * 字段类型：character varying  长度：5
	 */
	public static final String column_isparent = "isparent";
	
	/**
	 * 字段描述：名称中文台湾 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_names_zhtw = "names_zhtw";
	
	/**
	 * 字段描述：名称中文香港 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_names_zhhk = "names_zhhk";
	
	/**
	 * 字段描述：名称日文 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_names_ja = "names_ja";
	
	/**
	 * 字段描述：名称英文 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_names_enus = "names_enus";

	/**
	 * sqlId : platform.roleOperator.splitPageSelect
	 * 描述：通用select *
	 */
	public static final String sqlId_splitPageSelect = "platform.menu.splitPageSelect";

	/**
	 * sqlId : platform.roleOperator.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPageFrom = "platform.menu.splitPageFrom";

	/**
	 * sqlId : platform.menu.root
	 * 描述：查询根菜单
	 */
	public static final String sqlId_root = "platform.menu.root";

	/**
	 * sqlId : platform.menu.child
	 * 描述：查询子菜单
	 */
	public static final String sqlId_child = "platform.menu.child";

	/**
	 * sqlId : platform.menu.childCount
	 * 描述：查询子菜单数量
	 */
	public static final String sqlId_childCount = "platform.menu.childCount";

	/**
	 * sqlId : platform.menu.rootId
	 * 描述：查询根菜单id
	 */
	public static final String sqlId_rootId = "platform.menu.rootId";

	/**
	 * sqlId : platform.menu.operator
	 * 描述：查询根菜单，包含对应功能
	 */
	public static final String sqlId_operator = "platform.menu.operator";

	private String ids;
	private Long version;
	private String images;
	private Long levels;
	private String names_zhcn;
	private Long orderids;
	private String operatorids;
	private String parentmenuids;
	private String systemsids;
	private String isparent;
	private String names_zhtw;
	private String names_zhhk;
	private String names_ja;
	private String names_enus;
	
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
	public void setImages(String images){
		set(column_images, images);
	}
	public String getImages() {
		return get(column_images);
	}
	public void setLevels(Long levels){
		set(column_levels, levels);
	}
	public Long getLevels() {
		return get(column_levels);
	}
	public void setNames_zhcn(String names_zhcn){
		set(column_names_zhcn, names_zhcn);
	}
	public String getNames_zhcn() {
		return get(column_names_zhcn);
	}
	public void setOrderids(Long orderids){
		set(column_orderids, orderids);
	}
	public Long getOrderids() {
		return get(column_orderids);
	}
	public void setOperatorids(String operatorids){
		set(column_operatorids, operatorids);
	}
	public String getOperatorids() {
		return get(column_operatorids);
	}
	public void setParentmenuids(String parentmenuids){
		set(column_parentmenuids, parentmenuids);
	}
	public String getParentmenuids() {
		return get(column_parentmenuids);
	}
	public void setSystemsids(String systemsids){
		set(column_systemsids, systemsids);
	}
	public String getSystemsids() {
		return get(column_systemsids);
	}
	public void setIsparent(String isparent){
		set(column_isparent, isparent);
	}
	public String getIsparent() {
		return get(column_isparent);
	}
	public void setNames_zhtw(String names_zhtw){
		set(column_names_zhtw, names_zhtw);
	}
	public String getNames_zhtw() {
		return get(column_names_zhtw);
	}
	public void setNames_zhhk(String names_zhhk){
		set(column_names_zhhk, names_zhhk);
	}
	public String getNames_zhhk() {
		return get(column_names_zhhk);
	}
	public void setNames_ja(String names_ja){
		set(column_names_ja, names_ja);
	}
	public String getNames_ja() {
		return get(column_names_ja);
	}
	public void setNames_enus(String names_enus){
		set(column_names_enus, names_enus);
	}
	public String getNames_enus() {
		return get(column_names_enus);
	}
	
	/**
	 * 根据菜单获取对应的功能，可能为空
	 * @return
	 */
	public Operator getOperator(){
		String operatorIds = get(column_operatorids);
		if(StrKit.notBlank(operatorIds)){
			return Operator.cacheGet(operatorIds);
		}
		return null;
	}
	
}
