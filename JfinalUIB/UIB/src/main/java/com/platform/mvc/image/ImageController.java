package com.platform.mvc.image;

import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;

/**
 * 图片裁剪
 * @author 董华健
 */
@Controller("/platform/image")
public class ImageController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ImageController.class);

	private ImageService imageService;
	
	public int type;
	public String imageName;
	public String imagePath;
	
	public int x1;	// 
	public int y1;	// 
	public int x2;	// 
	public int y2;	// 
	public int w;	// 
	public int h;	// 
	
	public void index() {
		String result = imageService.cut(type, imageName, imagePath, x1, y1, w, h);
		renderText(result);
	}
	
}


