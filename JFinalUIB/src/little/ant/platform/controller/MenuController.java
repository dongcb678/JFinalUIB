package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.model.Menu;
import little.ant.platform.service.MenuService;
import little.ant.platform.validator.MenuValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/platform/menu")
public class MenuController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MenuController.class);
	
	private String systemsIds;
	private String pIds;
	private String names;
	private int orderIds;
	private String operatorIds;
	
	public void index() {
		render("/platform/menu/tree.html");
	}

	public void treeData()  {
		String jsonText = MenuService.service.childNodeData(systemsIds, ids, getI18nPram());
		renderJson(jsonText);
	}
	
	@Before(MenuValidator.class)
	public void save() {
		ids = MenuService.service.save(pIds, names, orderIds, getI18nPram());
		renderText(ids);
	}
	
	@Before(MenuValidator.class)
	public void update() {
		MenuService.service.update(ids, pIds, names, getI18nPram());
		renderText(ids);
	}
	
	public void delete() {
		MenuService.service.delete(ids);
		renderText(ids);
	}

	public void getOperator(){
		Menu menu = Menu.dao.findById(ids);
		renderJson(menu);
	}

	public void setOperator(){
		MenuService.service.setOperator(ids, operatorIds);
		renderJson(ids);
	}
	
	/**
	 * 准备更新
	 */
	public void toEdit() {
		Menu menu = Menu.dao.findById(ids);
		setAttr("menu", menu);
		render("/platform/menu/edit.html");
	}
	
	/**
	 * 更新
	 */
	public void edit() {
		Menu menu = getModel(Menu.class);
		menu.update();
		menu = Menu.dao.findById(menu.getStr("ids"));
		redirect("/jf/platform/menu?systemsIds=" + menu.getStr("systemsids"));
	}
}


