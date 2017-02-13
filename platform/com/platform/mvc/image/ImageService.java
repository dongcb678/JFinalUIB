package com.platform.mvc.image;

import com.jfinal.log.Log;
import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;
import com.platform.tools.ToolImageResize;
import com.platform.tools.ToolImageTailor;

@Service(name = ImageService.serviceName)
public class ImageService extends BaseService {

	private static final Log log = Log.getLog(ImageService.class);

	public static final String serviceName = "imageService";

	/**
	 * 图片裁剪
	 * @param type
	 * @param imageName
	 * @param imagePath
	 * @param x
	 * @param y
	 * @param width
	 * @param height
	 * @return
	 */
	public String cut(int type, String imageName, String imagePath, int x, int y, int width, int height){
		try {
			String originalPath = ""; // 原图片路径
			String targetPath = ""; // 目标路径
			
			if(type == 1){ // 头像
				originalPath = "";
				targetPath = "";
				
			} else if(type == 1){ // 内容图片
				originalPath = "";
				targetPath = "";
			} 
			
			// 后缀
			String houZhui = imageName.substring(imageName.lastIndexOf(".") + 1);
			
			// 裁剪
			ToolImageTailor.cut(originalPath, originalPath, x, y, width, height);
			
			// 压缩
			ToolImageResize.resize(originalPath, targetPath + imageName, width, houZhui);
		} catch (Exception e) {
			if(log.isErrorEnabled()) log.error("图片裁剪异常：" + e.getMessage());
			return "error";
		}
		
		return "success";
	}
	
}
