package com.platform.mvc.upload;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.jfinal.upload.UploadFile;
import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;
import com.platform.tools.ToolRandoms;
import com.platform.tools.security.md.ToolMD5;

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
			Map<String, String> map = upload(pathType, uploadFile, null, null, null, 0L);
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
		return upload(pathType, uploadFile, ids, null, null, 0L);
	}

	/**
	 * 单文件上传处理
	 * @param pathType
	 * @param uploadFile
	 * @param ids
	 * @param describe
	 * @param orderids
	 * @param targetIds
	 * @return
	 */
	public Map<String, String> upload(String pathType, UploadFile uploadFile, String ids, String targetIds, String describe, Long orderids){
		String parameterName = uploadFile.getParameterName();
		String fileName = uploadFile.getFileName();
		String contentType = uploadFile.getContentType();
		String originalFileName = uploadFile.getOriginalFileName();
		long size = uploadFile.getFile().length();

		String basePath = null;
		if(pathType.equals("webInf")){
			basePath = new StringBuffer()
					.append(PathKit.getWebRootPath()).append(File.separator)
					.append(UploadController.path_webInf).append(File.separator)
					.toString();
		} else {
			basePath = new StringBuffer()
					.append(PathKit.getWebRootPath()).append(File.separator)
					.append(UploadController.path_root).append(File.separator)
					.toString();
		}
		
        String md5 = ToolMD5.encodeMD5HexFile(basePath + fileName); // 文件MD5摘要
        
		Upload upload = new Upload();
		upload.set(Upload.column_parametername, parameterName);
		upload.set(Upload.column_filename, fileName);
		upload.set(Upload.column_contenttype, contentType);
		upload.set(Upload.column_originalfilename, originalFileName);
		upload.set(Upload.column_path, pathType);
		upload.setMd5(md5);
		upload.setDescribe(describe);
		upload.setOrderids(orderids);
		upload.setTargetids(targetIds);
		upload.setSize(size);
		if(StrKit.notBlank(ids)){
			upload.save(ids);
		}else{
			upload.save();
		}
		
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
		String originalFileName = uploadFile.getOriginalFileName(); // 原文件名
		String ext = "";   // 后缀
        int pot = originalFileName.lastIndexOf(".");   
        if(pot != -1){   
        	ext = originalFileName.substring(pot);   
        }
		String fileName = ToolRandoms.getUuid(true) + ext;   // 新文件名
		String parameterName = uploadFile.getParameterName();
		String contentType = uploadFile.getContentType();
		long size = uploadFile.getFile().length();
		
        File file = new File(storePath);
        String toPath = new StringBuffer().append(basePath).append(File.separator).append(fileName).toString();
        file.renameTo(new File(toPath));
        
        String md5 = ToolMD5.encodeMD5HexFile(toPath); // 文件MD5摘要
        
		Upload upload = new Upload();
		upload.setParametername(parameterName);
		upload.setFilename(fileName);
		upload.setContenttype(contentType);
		upload.setOriginalfilename(originalFileName);
		upload.setPath(pathType);
		upload.setMd5(md5);
		upload.setSize(size);
		upload.save();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("ids", upload.getPKValue());
		map.put("fileName", fileName);
		map.put("pathType", pathType);
		
		return map;
	}

}
