package little.ant.platform.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;

import little.ant.platform.annotation.Controller;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;
import little.ant.platform.model.Upload;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.service.UploadService;
import little.ant.platform.tools.ToolString;

/**
 * 文件上传
 */
@Controller(controllerKey = {"/jf/platform/upload"})
public class UploadController extends BaseController {

	private static Logger log = Logger.getLogger(UploadController.class);
	
	private static String path_web_root = null;
	private static String path_web_inf = null;
	
	/**
	 * 构造函数，初始化文件存放路径
	 */
	public UploadController(){
		if(path_web_root == null || path_web_root.isEmpty()){
			log.info("保存到/WebRoot/files/upload");
			StringBuilder web_root = new StringBuilder();
			web_root.append(PathKit.getWebRootPath()).append(File.separator).append("files").append(File.separator).append("upload");
			path_web_root = web_root.toString();
			
			log.info("保存到/WebRoot/WEB-INF/files/upload");
			StringBuilder web_inf = new StringBuilder();
			web_inf.append(PathKit.getWebRootPath()).append(File.separator).append("WEB-INF").append(File.separator).append("files").append(File.separator).append("upload");
			path_web_inf = web_inf.toString();
		}
	}

	/**
	 * 文件存放路径
	 */
	private String pathType;  
	
	/**
	 * 文件上传处理
	 */
	public void index() {
		String path = null;
		if(null != pathType && pathType.equals("webRoot")){//pathType = "webRoot";
			path = path_web_root;
			
		}else if(null != pathType && pathType.equals("webInf")){//pathType = "webInf";
			path = path_web_inf;
			
		} else {
			log.error("保存到路径错误，必须传递pathType值");
		}
		
		List<UploadFile> files = getFiles(path, ((Integer) PropertiesPlugin.getParamMapValue(ConstantInit.config_maxPostSize_key)).intValue(), ToolString.encoding);
		
		List<Map<String, String>> list = UploadService.service.upload(pathType, files);
		renderJson(list);
	}
	
	/**
	 * 文件列表
	 */
	public void list() {
		paging(ConstantInit.db_dataSource_main, splitPage, BaseModel.sqlId_splitPage_select, Upload.sqlId_splitPage_from);
		render("/platform/upload/list.html");
	}

	/**
	 * 删除文件
	 */
	public void delete() {
		UploadService.service.delete("pt_upload", getPara() == null ? ids : getPara());
		redirect("/jf/platform/upload/list");
	}

	
}
