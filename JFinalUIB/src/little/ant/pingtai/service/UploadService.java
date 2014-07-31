package little.ant.pingtai.service;

import java.util.ArrayList;
import java.util.List;

import little.ant.pingtai.model.Upload;

import org.apache.log4j.Logger;

import com.jfinal.upload.UploadFile;

public class UploadService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(UploadService.class);
	
	public List<String> upload(String pathType, List<UploadFile> files){
		List<String> list = new ArrayList<String>();
		for (UploadFile uploadFile : files) {
			String parameterName = uploadFile.getParameterName();
			String fileName = uploadFile.getFileName();
			String contentType = uploadFile.getContentType();
			String originalFileName = uploadFile.getOriginalFileName();
			
			Upload upload = new Upload();
			upload.set("parameterName", parameterName);
			upload.set("fileName", fileName);
			upload.set("contentType", contentType);
			upload.set("originalFileName", originalFileName);
			upload.set("path", pathType);
			upload.save();
			
			list.add(upload.getStr("ids"));
		}
		return list;
	}
	
}
