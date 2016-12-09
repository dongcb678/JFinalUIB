package com.platform.mvc.operator;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseController;

/**
 * 功能管理
 * @author 董华健
 */
@Controller("/platform/operator")
public class OperatorController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(OperatorController.class);
	
	private OperatorService operatorService;

	private String moduleIds; // 功能对应的模块
	
	/**
	 * 功能管理列表页
	 */
	public void index() {
		paging(splitPage, Operator.sqlId_splitPageSelect, Operator.sqlId_splitPageFrom);
		render("/platform/operator/list.html");
	}

	/**
	 * 保存功能
	 */
	@Before(OperatorValidator.class)
	public void save() {
		ids = operatorService.save(getModel(Operator.class));
		forwardAction("/platform/operator/backOff");
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
		forwardAction("/platform/operator/backOff");
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
		forwardAction("/platform/operator/backOff");
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


