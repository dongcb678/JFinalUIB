package little.ant.pingtai.controller;

import java.util.List;
import java.util.Map;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.GroupModel;
import little.ant.pingtai.model.RoleModel;
import little.ant.pingtai.service.RoleService;
import little.ant.pingtai.validator.RoleValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@SuppressWarnings("unused")
@Controller(controllerKey = "/jf/role")
public class RoleController extends BaseController {
	
	private static Logger log = Logger.getLogger(RoleController.class);
	
	private RoleService roleService = new RoleService();

	private List<GroupModel> noCheckedList;
	private List<GroupModel> checkedList;
	
	private String moduleIds;
	private String operatorIds;
	
	public void index() {
		roleService.list(splitPage);
		render("/pingtai/role/list.html");
	}
	
	@Before(RoleValidator.class)
	public void save() {
		ids = roleService.save(getModel(RoleModel.class));
		redirect("/jf/role");
	}
	
	public void edit() {
		setAttr("role", RoleModel.dao.findById(getPara()));
		render("/pingtai/role/update.html");
	}
	
	@Before(RoleValidator.class)
	public void update() {
		roleService.update(getModel(RoleModel.class));
		redirect("/jf/role");
	}
	
	public void delete() {
		roleService.delete(getPara());
		redirect("/jf/role");
	}

	@SuppressWarnings("unchecked")
	public void select(){
		Map<String,Object> map = roleService.select(ids);
		noCheckedList = (List<GroupModel>) map.get("noCheckedList");
		checkedList = (List<GroupModel>) map.get("checkedList");
		render("/pingtai/role/select.html");
	}
	
	public void getOperator(){
		RoleModel role = RoleModel.dao.findById(ids);
		renderJson(role);
	}

	public void setOperator(){
		roleService.setOperator(ids, moduleIds, operatorIds);
		renderJson(ids);
	}
	
}


