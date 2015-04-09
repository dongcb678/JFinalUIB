package little.ant.weixin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.weixin.service.IndexService;

import org.apache.log4j.Logger;

/**
 * 微信控制台主页
 * @author 董华健
 */
@SuppressWarnings("unused")
@Controller(controllerKey = "/jf/wx/index")
public class IndexController extends BaseController {

	private static Logger log = Logger.getLogger(IndexController.class);
	
	public void index(){
		
	}

	/**
	 * 首页content
	 */
	public void content(){
		render("/weiXin/content.html");
	}
	
}
