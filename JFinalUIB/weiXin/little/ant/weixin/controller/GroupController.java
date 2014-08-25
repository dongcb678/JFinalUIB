package little.ant.weixin.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.controller.BaseController;
import little.ant.weixin.service.GroupService;

import org.apache.log4j.Logger;

/**
 * 用户分组管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/wx/group")
public class GroupController extends BaseController {

	private static Logger log = Logger.getLogger(GroupController.class);
	
	public void index(){
		log.debug("微信用户分组管理：分页");
		GroupService.service.list(splitPage);
		render("/weiXin/group/list.html");
	}
	
}
