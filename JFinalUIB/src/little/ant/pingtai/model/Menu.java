package little.ant.pingtai.model;

import little.ant.pingtai.annotation.TableBind;

import org.apache.log4j.Logger;

@TableBind(tableName="pt_menu")
public class Menu extends BaseModel<Menu> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Menu.class);
	
	public static final Menu dao = new Menu();
	
	/**
	 * 根据菜单获取对应的功能，可能为空
	 * @return
	 */
	public Operator getOperator(){
		return Operator.dao.findById(get("operatorids"));
	}
	
}
