package little.ant.pingtai.controller;

import little.ant.pingtai.model.Menu;
import little.ant.pingtai.service.MenuService;
import little.ant.pingtai.validator.MenuValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

public class MenuController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MenuController.class);
	
	private MenuService menuService = new MenuService();

	private String systemsIds;
	private String pIds;
	private String names;
	private int orderIds;
	private String operatorIds;
	
	public void index() {
		render("/pingtai/menu/tree.html");
	}

	public void treeData()  {
		String jsonText = menuService.childNodeData(systemsIds, ids);
		renderJson(jsonText);
	}
	
	@Before(MenuValidator.class)
	public void save() {
		ids = menuService.save(pIds, names, orderIds);
		renderText(ids);
	}
	
	@Before(MenuValidator.class)
	public void update() {
		menuService.update(ids, pIds, names);
		renderText(ids);
	}
	
	public void delete() {
		menuService.delete(ids);
		renderText(ids);
	}

	public void getOperator(){
		Menu menu = Menu.dao.findById(ids);
		renderJson(menu);
	}

	public void setOperator(){
		menuService.setOperator(ids, operatorIds);
		renderJson(ids);
	}
	
}


