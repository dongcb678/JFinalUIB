package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.beetl.render.MyCaptchaRender;

import org.apache.log4j.Logger;

import com.jfinal.render.Render;

/**
 * 验证码
 * @author 董华健
 */
@Controller(controllerKey = "/jf/authImg")
public class AuthImgController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AuthImgController.class);
	
	public void index() {
		Render render = new MyCaptchaRender();
		render(render);
	}
	
}


