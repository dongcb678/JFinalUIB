package little.ant.pingtai.controller;

import java.util.List;
import java.util.Map;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.Group;
import little.ant.pingtai.service.GroupService;
import little.ant.pingtai.validator.GroupValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/group")
public class GroupController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(GroupController.class);
	
	private GroupService groupService = new GroupService();
	
	private List<Group> noCheckedList;
	private List<Group> checkedList;
	private String roleIds;
	
	public void index() {
		groupService.list(splitPage);
		render("/pingtai/group/list.html");
	}
	
	@Before(GroupValidator.class)
	public void save() {
		ids = groupService.save(getModel(Group.class));
		redirect("/jf/group");
	}
	
	public void edit() {
		setAttr("group", Group.dao.findById(getPara()));
		render("/pingtai/group/update.html");
	}
	
	@Before(GroupValidator.class)
	public void update() {
		groupService.update(getModel(Group.class));
		redirect("/jf/group");
	}
	
	public void delete() {
		groupService.delete(getPara());
		redirect("/jf/group");
	}
	
	@SuppressWarnings("unchecked")
	public void select(){
		Map<String,Object> map = groupService.select(ids);
		noCheckedList = (List<Group>) map.get("noCheckedList");
		checkedList = (List<Group>) map.get("checkedList");
		render("/pingtai/group/select.html");
	}

	public void setRole(){
		groupService.setRole(ids, roleIds);
		renderText(ids);
	}
}


