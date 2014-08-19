package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_menu")
public class MenuModel extends BaseModel<MenuModel> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(MenuModel.class);
	
	public static final MenuModel dao = new MenuModel();
	
	/**
	 * 根据菜单获取对应的功能，可能为空
	 * @return
	 */
	public OperatorModel getOperator(){
		return OperatorModel.dao.findById(get("operatorids"));
	}
	
}
