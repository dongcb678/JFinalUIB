package little.ant.weixin.controller;

import little.ant.pingtai.controller.BaseController;
import little.ant.weixin.service.GroupService;

import org.apache.log4j.Logger;

/**
 * 用户分组管理
 * @author 董华健
 */
public class GroupController extends BaseController {

	private static Logger log = Logger.getLogger(GroupController.class);
	
	private GroupService GroupService = new GroupService();
	
	public void index(){
		
	}
	
}
