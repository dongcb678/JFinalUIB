package little.ant.platform.service;

import little.ant.platform.tools.ToolImageResize;
import little.ant.platform.tools.ToolImageTailor;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class ImageService extends BaseService {

	private static Logger log = Logger.getLogger(ImageService.class);

	public static final ImageService service = Enhancer.enhance(ImageService.class, Tx.class);
	
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
			log.error("图片裁剪异常：" + e.getMessage());
			return "error";
		}
		
		return "success";
	}
	
}
