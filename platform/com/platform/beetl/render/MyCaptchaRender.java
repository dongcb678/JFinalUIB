package com.platform.beetl.render;

import org.apache.log4j.Logger;

import com.jfinal.render.Render;
import com.platform.tools.ToolRandoms;

/**
 * 验证码
 * @author 董华健
 */
public class MyCaptchaRender extends Render {

	private static Logger log = Logger.getLogger(MyCaptchaRender.class);

	@Override
	public void render() {
		int number = ToolRandoms.number(3);
		if (number == 0) {
			JpegCaptcha.out(response); // jpeg格式验证码
			
		} else if (number == 1) {
			PngCaptcha png = new PngCaptcha(150, 40, 5); // png格式验证码
			png.out(response);
			
		} else if (number == 2) {
			GifCaptcha captcha = new GifCaptcha(150, 40, 5); // gif格式动画验证码
			captcha.out(response);
		}
	}

}
