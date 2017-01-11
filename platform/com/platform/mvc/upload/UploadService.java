package com.platform.mvc.upload;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.jfinal.upload.UploadFile;
import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;
import com.platform.tools.ToolRandoms;

@Service(name = UploadService.serviceName)
public class UploadService extends BaseService {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(UploadService.class);

	public static final String serviceName = "uploadService";

	/**
	 * 多文件上传处理
	 * @param pathType
	 * @param files
	 * @return
	 */
	public List<Map<String, String>> upload(String pathType, List<UploadFile> files){
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (UploadFile uploadFile : files) {
			String parameterName = uploadFile.getParameterName();
			String fileName = uploadFile.getFileName();
			String contentType = uploadFile.getContentType();
			String originalFileName = uploadFile.getOriginalFileName();
			
			Upload upload = new Upload();
			upload.set(Upload.column_parametername, parameterName);
			upload.set(Upload.column_filename, fileName);
			upload.set(Upload.column_contenttype, contentType);
			upload.set(Upload.column_originalfilename, originalFileName);
			upload.set(Upload.column_path, pathType);
			upload.save();
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("ids", upload.getPKValue());
			map.put("fileName", fileName);
			map.put("pathType", pathType);
			list.add(map);
		}
		return list;
	}

	/**
	 * 单文件上传处理
	 * @param pathType
	 * @param uploadFile
	 * @param ids
	 * @return
	 */
	public Map<String, String> upload(String pathType, UploadFile uploadFile, String ids){
		if(ids == null || ids.isEmpty()){
			ids = ToolRandoms.getUuid(true);
		}
		
		String parameterName = uploadFile.getParameterName();
		String fileName = uploadFile.getFileName();
		String contentType = uploadFile.getContentType();
		String originalFileName = uploadFile.getOriginalFileName();
		
		Upload upload = new Upload();
		upload.set(Upload.column_parametername, parameterName);
		upload.set(Upload.column_filename, fileName);
		upload.set(Upload.column_contenttype, contentType);
		upload.set(Upload.column_originalfilename, originalFileName);
		upload.set(Upload.column_path, pathType);
		upload.save(ids);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("ids", upload.getPKValue());
		map.put("fileName", fileName);
		map.put("pathType", pathType);
		
		return map;
	}

	/**
	 * 分片文件上传处理
	 * @param pathType
	 * @param uploadFile
	 * @param basePath
	 * @param storePath
	 * @return
	 */
	public Map<String, String> slice(String pathType, UploadFile uploadFile, String basePath, String storePath){
		String originalFileName = uploadFile.getOriginalFileName();
		
		String ext = "";   
        int pot = originalFileName.lastIndexOf(".");   
        if(pot != -1){   
        	ext = originalFileName.substring(pot);   
        }
        
		String parameterName = uploadFile.getParameterName();
		String fileName = ToolRandoms.getUuid(true) + ext;   
		String contentType = uploadFile.getContentType();
		
        File file = new File(storePath);
        file.renameTo(new File(basePath + File.separator + fileName));
        
		Upload upload = new Upload();
		upload.set(Upload.column_parametername, parameterName);
		upload.set(Upload.column_filename, fileName);
		upload.set(Upload.column_contenttype, contentType);
		upload.set(Upload.column_originalfilename, originalFileName);
		upload.set(Upload.column_path, pathType);
		upload.save();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("ids", upload.getPKValue());
		map.put("fileName", fileName);
		map.put("pathType", pathType);
		
		return map;
	}

}
