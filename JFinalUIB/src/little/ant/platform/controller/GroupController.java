package little.ant.platform.controller;

import java.util.List;
import java.util.Map;

import little.ant.platform.annotation.Controller;
import little.ant.platform.model.Group;
import little.ant.platform.service.GroupService;
import little.ant.platform.validator.GroupValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@SuppressWarnings("unused")
@Controller(controllerKey = "/jf/platform/group")
public class GroupController extends BaseController {

	private static Logger log = Logger.getLogger(GroupController.class);
	
	private List<Group> noCheckedList;
	private List<Group> checkedList;
	private String roleIds;
	
	public void index() {
		GroupService.service.list(splitPage);
		render("/platform/group/list.html");
	}
	
	@Before(GroupValidator.class)
	public void save() {
		ids = GroupService.service.save(getModel(Group.class));
		redirect("/jf/platform/group");
	}
	
	public void edit() {
		setAttr("group", Group.dao.findById(getPara()));
		render("/platform/group/update.html");
	}
	
	@Before(GroupValidator.class)
	public void update() {
		GroupService.service.update(getModel(Group.class));
		redirect("/jf/platform/group");
	}
	
	public void delete() {
		GroupService.service.delete(getPara());
		redirect("/jf/platform/group");
	}
	
	@SuppressWarnings("unchecked")
	public void select(){
		Map<String,Object> map = GroupService.service.select(ids);
		noCheckedList = (List<Group>) map.get("noCheckedList");
		checkedList = (List<Group>) map.get("checkedList");
		render("/platform/group/select.html");
	}

	public void setRole(){
		GroupService.service.setRole(ids, roleIds);
		renderText(ids);
	}
}


