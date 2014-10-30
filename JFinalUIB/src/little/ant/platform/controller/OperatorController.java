package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.model.Operator;
import little.ant.platform.service.OperatorService;
import little.ant.platform.validator.OperatorValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/operator")
public class OperatorController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(OperatorController.class);
	
	private String moduleIds;
	
	public void index() {
		OperatorService.service.list(splitPage);
		render("/pingtai/operator/list.html");
	}

	@Before(OperatorValidator.class)
	public void save() {
		ids = OperatorService.service.save(getModel(Operator.class));
		redirect("/jf/operator");
	}
	
	public void edit() {
		setAttr("operator", Operator.dao.findById(getPara()));
		render("/pingtai/operator/update.html");
	}
	
	@Before(OperatorValidator.class)
	public void update() {
		OperatorService.service.update(getModel(Operator.class));
		redirect("/jf/operator");
	}

	public void view() {
		setAttr("operator", Operator.dao.findById(getPara()));
		render("/pingtai/operator/view.html");
	}
	
	public void delete() {
		OperatorService.service.delete(getPara());
		redirect("/jf/operator");
	}
	
	public void treeData() {
		String json = OperatorService.service.childNodeData(moduleIds);
		renderJson(json);
	}
}


