package little.ant.platform.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import little.ant.platform.annotation.Controller;
import little.ant.platform.common.DictKeys;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.service.UploadService;
import little.ant.platform.tools.ToolString;

import org.apache.log4j.Logger;

import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;

/**
 * 文件上传
 */
@SuppressWarnings("unused")
@Controller(controllerKey = {"/jf/platform/upload"})
public class UploadController extends BaseController {

	private static Logger log = Logger.getLogger(UploadController.class);
	
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
			pathType = "webInf";
			sb.append(PathKit.getWebRootPath()).append(File.separator).append("WEB-INF").append(File.separator).append("files").append(File.separator).append("upload");
		}
		
		List<UploadFile> files = getFiles(sb.toString(), ((Integer) PropertiesPlugin.getParamMapValue(DictKeys.config_maxPostSize_key)).intValue(), ToolString.encoding);
		
		List<Map<String, String>> list = UploadService.service.upload(pathType, files);
		renderJson(list);
	}
	
	/**
	 * 文件列表
	 */
	public void list() {
		UploadService.service.list(splitPage);
		render("/platform/upload/list.html");
	}

	/**
	 * 删除文件
	 */
	public void delete() {
		UploadService.service.delete(getPara() == null ? ids : getPara());
		redirect("/jf/platform/upload/list");
	}

	
}
