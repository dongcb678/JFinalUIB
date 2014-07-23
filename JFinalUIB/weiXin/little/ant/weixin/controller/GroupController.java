package little.ant.weixin.controller;

import little.ant.pingtai.annotation.ControllerBind;
import little.ant.pingtai.controller.BaseController;
import little.ant.weixin.service.GroupService;

import org.apache.log4j.Logger;

/**
 * 用户分组管理
 * @author 董华健
 */
@ControllerBind(controllerKey = "/jf/wx/group")
public class GroupController extends BaseController {

	private static Logger log = Logger.getLogger(GroupController.class);
	
	private GroupService groupService = new GroupService();
	
	public void index(){
		log.debug("微信用户分组管理：分页");
		groupService.list(splitPage);
		render("/weiXin/group/list.html");
	}
	
}
