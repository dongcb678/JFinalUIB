package com.platform.mvc.operator;

import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.platform.annotation.Controller;
import com.platform.constant.ConstantInit;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseController;

/**
 * 功能管理
 * @author 董华健
 */
@Controller(controllerKey = "/platform/operator")
public class OperatorController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(OperatorController.class);
	
	private OperatorService operatorService;
	
	private String moduleIds; // 功能对应的模块
	
	/**
	 * 功能管理列表页
	 */
	public void index() {
		paging(ConstantInit.db_dataSource_main, splitPage, Operator.sqlId_splitPageSelect, Operator.sqlId_splitPageFrom);
		render("/platform/operator/list.html");
	}

	/**
	 * 保存功能
	 */
	@Before(OperatorValidator.class)
	public void save() {
		ids = operatorService.save(getModel(Operator.class));
		redirect("/platform/operator");
	}

	/**
	 * 准备更新功能
	 */
	public void edit() {
		setAttr("operator", Operator.dao.findById(getPara()));
		render("/platform/operator/update.html");
	}

	/**
	 * 更新功能
	 */
	@Before(OperatorValidator.class)
	public void update() {
		operatorService.update(getModel(Operator.class));
		redirect("/platform/operator");
	}

	/**
	 * 查看功能
	 */
	public void view() {
		setAttr("operator", Operator.dao.findById(getPara()));
		render("/platform/operator/view.html");
	}

	/**
	 * 删除功能
	 */
	public void delete() {
		operatorService.delete(getPara() == null ? ids : getPara());
		redirect("/platform/operator");
	}

	/**
	 * 功能treeData
	 */
	public void treeData() {
		List<ZtreeNode> nodeList = operatorService.treeData(getCxt(), moduleIds);
		renderJson(nodeList);
	}
	
	/**
	 * 功能treeData，一次性加载
	 */
	public void tree() {
		List<ZtreeNode> nodeList = operatorService.tree(getCxt());
		renderJson(nodeList);
	}
}


