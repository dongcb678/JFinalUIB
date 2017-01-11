package com.platform.mvc.menu;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseController;

/**
 * 菜单管理
 * @author 董华健
 */
@Controller("/platform/menu")
public class MenuController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(MenuController.class);
	
	private MenuService menuService;
	
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
		List<ZtreeNode> nodeList = menuService.childNodeData(getCxt(), systemsIds, ids, geti18nColumnSuffix());
		renderJson(nodeList);
	}

	/**
	 * 保存菜单
	 */
	@Before(MenuValidator.class)
	public void save() {
		ids = menuService.save(pIds, names, orderIds, geti18nColumnSuffix());
		renderText(ids);
	}

	/**
	 * 更新菜单
	 */
	@Before(MenuValidator.class)
	public void update() {
		menuService.update(ids, pIds, names, geti18nColumnSuffix());
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
		redirect("/platform/menu?systemsIds=" + menu.getStr(Menu.column_systemsids));
	}

	/**
	 * 删除菜单
	 */
	public void delete() {
		menuService.delete(ids);
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
		menuService.setOperator(ids, operatorIds);
		renderJson(ids);
	}

	/**
	 * 展示菜单对应的功能和所有功能列表
	 */
	public void list(){
		defaultOrder(" sorder asc, ", " morder asc ");
		menuService.paging(splitPage);
		render("/platform/menu/list.html");
	}
	
	/**
	 * 设置菜单对应的功能
	 */
	public void set() {
		String menuIds = getPara("menuIds");
		String operatorIds = getPara("operatorIds");
		Menu menu = Menu.dao.findById(menuIds);
		menu.setOperatorids(operatorIds);
		menu.update();
		renderSuccess(null, null, null);
	}
}


