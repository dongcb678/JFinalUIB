package little.ant.platform.controller;

import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

import little.ant.platform.annotation.Controller;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.ZtreeNode;
import little.ant.platform.model.Operator;
import little.ant.platform.service.OperatorService;
import little.ant.platform.validator.OperatorValidator;

/**
 * 功能管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/platform/operator")
public class OperatorController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(OperatorController.class);
	
	private String moduleIds; // 功能对应的模块
	
	/**
	 * 功能管理列表页
	 */
	public void index() {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Operator.sqlId_splitPage_select, Operator.sqlId_splitPage_from);
		render("/platform/operator/list.html");
	}

	/**
	 * 保存功能
	 */
	@Before(OperatorValidator.class)
	public void save() {
		ids = OperatorService.service.save(getModel(Operator.class));
		redirect("/jf/platform/operator");
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
		OperatorService.service.update(getModel(Operator.class));
		redirect("/jf/platform/operator");
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
		OperatorService.service.delete(getPara() == null ? ids : getPara());
		redirect("/jf/platform/operator");
	}

	/**
	 * 功能treeData
	 */
	public void treeData() {
		List<ZtreeNode> nodeList = OperatorService.service.treeData(moduleIds);
		renderJson(nodeList);
	}
	
	/**
	 * 功能treeData，一次性加载
	 */
	public void tree() {
		List<ZtreeNode> nodeList = OperatorService.service.tree();
		renderJson(nodeList);
	}
}


