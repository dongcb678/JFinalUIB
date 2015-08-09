package little.ant.platform.controller;

import java.util.List;

import little.ant.platform.annotation.Controller;
import little.ant.platform.dto.ZtreeNode;
import little.ant.platform.model.Menu;
import little.ant.platform.service.MenuService;
import little.ant.platform.validator.MenuValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 菜单管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/platform/menu")
public class MenuController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MenuController.class);
	
	private String systemsIds; // 哪个系统下的菜单
	private String pIds; // 菜单上级节点ids
	private String names; // 菜单名称
	private int orderIds; // 菜单排序号
	private String operatorIds; // 菜单对应的功能ids

	/**
	 * 菜单管理首页
	 */
	public void index() {
		render("/platform/menu/tree.html");
	}

	/**
	 * ztree子节点数据
	 */
	public void treeData()  {
		List<ZtreeNode> nodeList = MenuService.service.childNodeData(getCxt(), systemsIds, ids, getI18nPram());
		renderJson(nodeList);
	}

	/**
	 * 保存菜单
	 */
	@Before(MenuValidator.class)
	public void save() {
		ids = MenuService.service.save(pIds, names, orderIds, getI18nPram());
		renderText(ids);
	}

	/**
	 * 更新菜单
	 */
	@Before(MenuValidator.class)
	public void update() {
		MenuService.service.update(ids, pIds, names, getI18nPram());
		renderText(ids);
	}

	/**
	 * 国际化：准备更新菜单
	 */
	public void toEdit() {
		Menu menu = Menu.dao.findById(ids);
		setAttr("menu", menu);
		render("/platform/menu/edit.html");
	}
	
	/**
	 * 国际化：更新菜单
	 */
	public void edit() {
		Menu menu = getModel(Menu.class);
		menu.update();
		menu = Menu.dao.findById(menu.getPKValue());
		redirect("/jf/platform/menu?systemsIds=" + menu.getStr(Menu.column_systemsids));
	}

	/**
	 * 删除菜单
	 */
	public void delete() {
		MenuService.service.delete(ids);
		renderText(ids);
	}
	
	/**
	 * 获取菜单对应的功能
	 */
	public void getOperator(){
		Menu menu = Menu.dao.findById(ids);
		renderJson(menu);
	}

	/**
	 * 设置菜单对应的功能
	 */
	public void setOperator(){
		MenuService.service.setOperator(ids, operatorIds);
		renderJson(ids);
	}
	
}


