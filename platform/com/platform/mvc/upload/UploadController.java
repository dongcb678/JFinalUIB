package com.platform.mvc.upload;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.NotAction;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.upload.UploadFile;
import com.platform.annotation.Controller;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.base.BaseModel;
import com.platform.tools.ToolDirFile;
import com.platform.tools.ToolString;

/**
 * 文件上传
 */
@Controller({"/platform/upload"})
public class UploadController extends BaseController {

	//	private static final Log log = Log.getLog(UploadController.class);
	
	/**
	 * 默认保存到/WebRoot/files/upload
	 */
	public static final String path_root = "files" + File.separator + "upload";
	
	/**
	 * 指定保存到/WebRoot/WEB-INF/files/upload
	 */
	public static final String path_webInf = "WEB-INF" + File.separator + "files" + File.separator + "upload";
	
	/**
	 * 分片上传临时目录
	 */
	public static final String path_temp = "WEB-INF" + File.separator + "files" + File.separator + "temp";
	
	/**
	 * 文件存放路径，使用get方式提交，此参数放在URL中，否则在getFile之前无法获取
	 */
	private String pathType;
	
	private UploadService uploadService;
	
	/**
	 * 获取路径
	 * @return
	 */
	@Before(NotAction.class)
	public String path(){
		if(null != pathType && pathType.equals("webInf")){
			return path_webInf;
		} else {
			pathType = "webRoot";
			return path_root;
		}
	}
	
	/**
	 * 所有文件一次上传
	 */
	public void index() {
		String path = path();
		List<UploadFile> files = getFiles(path, PropKit.getInt(ConstantInit.config_maxPostSize_key), ToolString.encoding);
		List<Map<String, String>> list = uploadService.upload(pathType, files);
		renderJson(list);
	}
	
	/**
	 * 单个文件，分片上传
	 */
	public void slice(){
		try {
			// 1.临时文件
			UploadFile uploadFile = getFiles(path_temp, PropKit.getInt(ConstantInit.config_maxPostSize_key), ToolString.encoding).get(0);

			// 2.目标文件路径
			String basePath = new StringBuffer()
					.append(PathKit.getWebRootPath()).append(File.separator).append(path())
					.append(File.separator).toString();
			String storePath = new StringBuffer()
					.append(basePath).append(getCUserIds()).append("-").append(uploadFile.getOriginalFileName()).toString();
			
			// 3.写入
			File tempFile = uploadFile.getFile(); // 临时文件
			ToolDirFile.writeFile(storePath, tempFile); // 追加临时文件到目标文件
			tempFile.delete(); // 删除临时文件

			// 4.分片处理
		    String chunk = getPara("chunk"); // webupload自带的参数，当前分片索引，从0开始
	        if(StrKit.isBlank(chunk)){ // 4.1不分片的情况，文件小于分片大小，比如指定的5MB
	        	Map<String, String> upload = uploadService.slice(pathType, uploadFile, basePath, storePath);
	    		renderSuccess(null, upload, "小于分片大小，一次上传成功");
	    		
	        }else{ // 4.2分片的情况
	        	int chunks = getParaToInt("chunks"); // webupload自带的参数，分片总数
	            if (Integer.valueOf(chunk) == (chunks - 1)) { // 最后一个分片
	            	Map<String, String> upload = uploadService.slice(pathType, uploadFile, basePath, storePath);
		        	renderSuccess(null, upload, "所有分片上传成功");
		        	
	            } else { // 起始或中间分片
		        	renderSuccess(chunk, chunks, "分片" + (chunk + 1) + "上传成功");
	            }
	        }
		} catch (Exception e) {
			renderError(null, null, "上传失败");
		}
	}
	
	/**
	 * 多个文件，分片上传
	 */
	public void slices(){
		try {
			// 1.临时文件
			UploadFile uploadFile = getFiles(path_temp, PropKit.getInt(ConstantInit.config_maxPostSize_key), ToolString.encoding).get(0);

			// 2.目标文件路径
			String basePath = new StringBuffer()
					.append(PathKit.getWebRootPath()).append(File.separator).append(path())
					.append(File.separator).toString();
			String storePath = new StringBuffer()
					.append(basePath).append(getCUserIds()).append("-").append(uploadFile.getOriginalFileName()).toString();
			
			// 3.写入
			File tempFile = uploadFile.getFile(); // 临时文件
			ToolDirFile.writeFile(storePath, tempFile); // 追加临时文件到目标文件
			tempFile.delete(); // 删除临时文件
			
			// 4.分片处理
			String chunk = getPara("chunk");
	        if(StrKit.isBlank(chunk)){ // 4.1不分片的情况，文件小于分片大小，比如指定的5MB
	        	Map<String, String> upload = uploadService.slice(pathType, uploadFile, basePath, storePath);
	    		renderSuccess(null, upload, "小于分片大小，一次上传成功");
	        	
	        }else{ // 4.2分片的情况
				int chunks = getParaToInt("chunks"); // 总分片数
	            if (Integer.valueOf(chunk) == (chunks - 1)) { // 最后一个分片
	            	Map<String, String> upload = uploadService.slice(pathType, uploadFile, basePath, storePath);
		        	renderSuccess(null, upload, "所有分片上传成功");
		        	
	            } else { // 起始或中间分片
		        	renderSuccess(chunk, chunks, "分片" + (chunk + 1) + "上传成功");
	            }
	        }
		} catch (Exception e) {
			renderError(null, null, "上传失败");
		}
	}
	
	/**
	 * 验证文件MD5摘要是否存在
	 */
	public void md5(){
		String md5 = getPara();
		String sql = getSqlMy(Upload.sqlId_md5);
		long count = Db.use(ConstantInit.db_dataSource_main).queryNumber(sql, md5).longValue();
		renderSuccess(null, count, null);
	}
	
	/**
	 * 文件列表
	 */
	public void list() {
		paging(splitPage, BaseModel.sqlId_splitPageSelect, Upload.sqlId_splitPageFrom);
		render("/platform/upload/list.html");
	}
	
	/**
	 * 删除文件
	 */
	public void delete() {
		uploadService.baseDelete(Upload.table_name, getPara() == null ? ids : getPara());
		redirect("/platform/upload/list");
	}
	
}
