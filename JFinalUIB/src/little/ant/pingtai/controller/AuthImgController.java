package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.beetl.MyCaptchaRender;

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


