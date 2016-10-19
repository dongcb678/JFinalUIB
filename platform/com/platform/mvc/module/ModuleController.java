package com.platform.mvc.module;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseController;

/**
 * 模块管理
 * @author 董华健
 */
@Controller("/platform/module")
public class ModuleController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ModuleController.class);
	
	private ModuleService moduleService;
	
	private String systemsIds; // 哪个系统下的模块
	private String pIds; // 上级模块ids
	private String names; // 模块名称
	private int orderIds; // 模块排序号
	
	/**
	 * 模块tree首页
	 */
	public void index() {
		render("/platform/module/tree.html");
	}

	/**
	 * 模块tree数据
	 */
	public void treeData()  {
		List<ZtreeNode> nodeList = moduleService.childNodeData(getCxt(), systemsIds, ids);
		renderJson(nodeList);
	}

	/**
	 * 保存模块
	 */
	@Before(ModuleValidator.class)
	public void save() {
		ids = moduleService.save(pIds, names, orderIds);
		renderText(ids);
	}

	/**
	 * 更新模块
	 */
	@Before(ModuleValidator.class)
	public void update() {
		moduleService.update(ids, pIds, names);
		renderText(ids);
	}

	/**
	 * 删除模块
	 */
	public void delete() {
		moduleService.delete(ids);
		renderText(ids);
	}

}


