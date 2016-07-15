package com.platform.mvc.upload;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.kit.PropKit;
import com.jfinal.upload.UploadFile;
import com.platform.annotation.Controller;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.base.BaseModel;
import com.platform.tools.ToolString;

/**
 * 文件上传
 */
@Controller(controllerKey = {"/platform/upload"})
public class UploadController extends BaseController {

	private static Logger log = Logger.getLogger(UploadController.class);
	
	private UploadService uploadService;
	
	/**
	 * 文件存放路径
	 */
	private String pathType;  
	
	/**
	 * 文件上传处理
	 */
	public void index() {
		String path = null;
		if(null != pathType && pathType.equals("webInf")){ // pathType = "webInf"
			log.info("指定保存到/WebRoot/WEB-INF/files/upload");
			path = "WEB-INF" + File.separator + "files" + File.separator + "/upload";
			
		} else {
			log.info("默认保存到/WebRoot/files/upload");
			path = "files" + File.separator + "/upload";
		}
		
		List<UploadFile> files = getFiles(path, PropKit.getInt(ConstantInit.config_maxPostSize_key), ToolString.encoding);
		
		List<Map<String, String>> list = uploadService.upload(pathType, files);
		renderJson(list);
	}
	
	/**
	 * 文件列表
	 */
	public void list() {
		paging(ConstantInit.db_dataSource_main, splitPage, BaseModel.sqlId_splitPageSelect, Upload.sqlId_splitPageFrom);
		render("/platform/upload/list.html");
	}

	/**
	 * 删除文件
	 */
	public void delete() {
		uploadService.delete("pt_upload", getPara() == null ? ids : getPara());
		redirect("/platform/upload/list");
	}

	
}
