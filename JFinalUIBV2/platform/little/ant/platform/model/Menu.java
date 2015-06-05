package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;

import org.apache.log4j.Logger;

/**
 * 菜单model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "pt_menu")
public class Menu extends BaseModel<Menu> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Menu.class);
	
	public static final Menu dao = new Menu();

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
	 * 字段描述：图标 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_images = "images";
	
	/**
	 * 字段描述：层级级别 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_levels = "levels";
	
	/**
	 * 字段描述：名称中文简体 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_names_zhcn = "names_zhcn";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_orderids = "orderids";
	
	/**
	 * 字段描述：菜单对应功能ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_operatorids = "operatorids";
	
	/**
	 * 字段描述：上级菜单ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_parentmenuids = "parentmenuids";
	
	/**
	 * 字段描述：所属系统ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_systemsids = "systemsids";
	
	/**
	 * 字段描述：是否上级节点 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_isparent = "isparent";
	
	/**
	 * 字段描述：名称中文台湾 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_names_zhtw = "names_zhtw";
	
	/**
	 * 字段描述：名称中文香港 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_names_zhhk = "names_zhhk";
	
	/**
	 * 字段描述：名称日文 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_names_ja = "names_ja";
	
	/**
	 * 字段描述：名称英文 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_names_enus = "names_enus";

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

	/**
	 * 根据菜单获取对应的功能，可能为空
	 * @return
	 */
	public Operator getOperator(){
		String operatorIds = get(colunm_operatorids);
		if(null != operatorIds && !operatorIds.isEmpty()){
			return Operator.dao.findById(operatorIds);
		}
		return null;
	}
	
}
