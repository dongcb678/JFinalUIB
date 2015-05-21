package little.ant.platform.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.tools.ToolImageResize;
import little.ant.platform.tools.ToolImageTailor;
import little.ant.platform.tools.ToolOS;

import org.apache.log4j.Logger;

public class ImageService extends BaseService {

	private static Logger log = Logger.getLogger(ImageService.class);

	public static final ImageService service = MyTxProxy.newProxy(ImageService.class);
	
	/**
	 * 图片裁剪
	 * @param type
	 * @param imageName
	 * @param imagePath
	 * @param x1
	 * @param y1
	 * @param w
	 * @param h
	 * @return
	 */
	public String cut(int type, String imageName, String imagePath, int x1, int y1, int w, int h){
		try {
			String osPath = ToolOS.getOsPathType();
			
			String originalPath = ""; // 原图片路径
			String targetPath = ""; // 目标路径
			int width = 0;
			
			if(type == 1){ // 头像
				originalPath = "";
				targetPath = "";
				width = 200;
			} else if(type == 1){ // 内容图片
				originalPath = "";
				targetPath = "";
				width = 200;
			} 
			
			// 裁剪
			ToolImageTailor tailor = new ToolImageTailor(x1, y1, w, h);
			tailor.setSrcpath(originalPath);
			tailor.setSubpath(originalPath);
			tailor.cut();
			
			// 压缩
			String houZhui = imageName.substring(imageName.lastIndexOf(".") + 1);// 后缀
			ToolImageResize.resize(originalPath, targetPath + imageName, width, houZhui);
		} catch (Exception e) {
			log.error("图片裁剪异常：" + e.getMessage());
			return "error";
		}
		
		return "success";
	}
	
}
