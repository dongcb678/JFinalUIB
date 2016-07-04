package com.platform.mvc.image;

import org.apache.log4j.Logger;

import com.jfinal.render.Render;
import com.platform.annotation.Controller;
import com.platform.beetl.render.MyCaptchaRender;
import com.platform.mvc.base.BaseController;

/**
 * 验证码
 * @author 董华健
 */
@Controller(controllerKey = "/platform/authImg")
public class AuthImgController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AuthImgController.class);
	
	public void index() {
		Render render = new MyCaptchaRender();
		render(render);
	}
	
}


