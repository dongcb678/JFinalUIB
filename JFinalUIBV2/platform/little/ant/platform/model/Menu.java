package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;

import org.apache.log4j.Logger;

/**
 * 菜单model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_menu")
public class Menu extends BaseModel<Menu> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Menu.class);
	
	public static final Menu dao = new Menu();

	/**
	 * 主键
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 版本号
	 */
	public static final String colunm_version = "version";
	
	/**
	 * 图标
	 */
	public static final String colunm_images = "images";
	
	/**
	 * 层级级别
	 */
	public static final String colunm_levels = "levels";
	
	/**
	 * 名称中文简体
	 */
	public static final String colunm_names_zhcn = "names_zhcn";
	
	/**
	 * 排序号
	 */
	public static final String colunm_orderids = "orderids";
	
	/**
	 * 菜单对应功能ids
	 */
	public static final String colunm_operatorids = "operatorids";
	
	/**
	 * 上级菜单ids
	 */
	public static final String colunm_parentmenuids = "parentmenuids";
	
	/**
	 * 所属系统ids
	 */
	public static final String colunm_systemsids = "systemsids";
	
	/**
	 * 是否上级节点
	 */
	public static final String colunm_isparent = "isparent";
	
	/**
	 * 名称中文台湾
	 */
	public static final String colunm_names_zhtw = "names_zhtw";
	
	/**
	 * 名称中文香港
	 */
	public static final String colunm_names_zhhk = "names_zhhk";
	
	/**
	 * 名称日文
	 */
	public static final String colunm_names_ja = "names_ja";
	
	/**
	 * 名称英文
	 */
	public static final String colunm_names_enus = "names_enus";
	
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
