package little.ant.weixin.utils;

import org.apache.log4j.Logger;

public class ToolMedia {
	
	private static Logger log = Logger.getLogger(ToolMedia.class);

	// 上传多媒体文件
	public static String weixin_media_upload_url = "http://file.api.weixin.qq.com/cgi-bin/media/upload";
	
	// 下载多媒体文件
	public static String weixin_media_get_url = "http://file.api.weixin.qq.com/cgi-bin/media/get";
	
	
	
}
