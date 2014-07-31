package little.ant.pingtai.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.plugin.PropertiesPlugin;
import little.ant.pingtai.service.UploadService;
import little.ant.pingtai.tools.ToolString;

import org.apache.log4j.Logger;

import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;

/**
 * 文件上传
 */
@SuppressWarnings("unused")
@Controller(controllerKey = {"/jf/upload"})
public class UploadController extends BaseController {

	private static Logger log = Logger.getLogger(UploadController.class);
	
	private UploadService uploadService = new UploadService();
	
	/**
	 * 默认是保存到	/WebContent/files/upload
	 * 否则保存到	/WebContent/WEB-INF/files/upload
	 */
	private String pathType;  
	
	public void index() {
		StringBuilder sb = new StringBuilder();
		if(null == pathType || pathType.isEmpty() || pathType.equals("webRoot")){
			pathType = "webRoot";
			sb.append(PathKit.getWebRootPath()).append(File.separator).append("files").append(File.separator).append("upload");
		}else{
			pathType = "WEB-INF";
			sb.append(PathKit.getWebRootPath()).append(File.separator).append("WEB-INF").append(File.separator).append("files").append(File.separator).append("upload");
		}
		
		List<UploadFile> files = getFiles(sb.toString(), (Integer) PropertiesPlugin.getParamMapValue(DictKeys.config_maxPostSize_key), ToolString.encoding);
		
		List<String> list = uploadService.upload(pathType, files);
		renderJson(list);
	}
	
}
