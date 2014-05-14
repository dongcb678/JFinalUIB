package little.ant.pingtai.controller;

import java.util.List;
import java.util.Map;

import little.ant.pingtai.model.Group;
import little.ant.pingtai.model.Role;
import little.ant.pingtai.service.RoleService;
import little.ant.pingtai.validator.RoleValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

public class RoleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(RoleController.class);
	
	private RoleService roleService = new RoleService();

	private List<Group> noCheckedList;
	private List<Group> checkedList;
	
	private String moduleIds;
	private String operatorIds;
	
	public void index() {
		roleService.list(splitPage);
		render("/pingtai/role/list.html");
	}
	
	@Before(RoleValidator.class)
	public void save() {
		ids = roleService.save(getModel(Role.class));
		redirect("/jf/role");
	}
	
	public void edit() {
		setAttr("role", Role.dao.findById(getPara()));
		render("/pingtai/role/update.html");
	}
	
	@Before(RoleValidator.class)
	public void update() {
		roleService.update(getModel(Role.class));
		redirect("/jf/role");
	}
	
	public void delete() {
		roleService.delete(getPara());
		redirect("/jf/role");
	}

	@SuppressWarnings("unchecked")
	public void select(){
		Map<String,Object> map = roleService.select(ids);
		noCheckedList = (List<Group>) map.get("noCheckedList");
		checkedList = (List<Group>) map.get("checkedList");
		render("/pingtai/role/select.html");
	}
	
	public void getOperator(){
		Role role = Role.dao.findById(ids);
		renderJson(role);
	}

	public void setOperator(){
		roleService.setOperator(ids, moduleIds, operatorIds);
		renderJson(ids);
	}
	
}


