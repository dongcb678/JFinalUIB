package little.ant.platform.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.common.SplitPage;
import little.ant.platform.model.Upload;

import org.apache.log4j.Logger;

import com.jfinal.upload.UploadFile;

public class UploadService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(UploadService.class);

	public static final UploadService service = MyTxProxy.newProxy(UploadService.class);
	
	public List<Map<String, String>> upload(String pathType, List<UploadFile> files){
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (UploadFile uploadFile : files) {
			String parameterName = uploadFile.getParameterName();
			String fileName = uploadFile.getFileName();
			String contentType = uploadFile.getContentType();
			String originalFileName = uploadFile.getOriginalFileName();
			
			Upload upload = new Upload();
			upload.set(Upload.colunm_parametername, parameterName);
			upload.set(Upload.colunm_filename, fileName);
			upload.set(Upload.colunm_contenttype, contentType);
			upload.set(Upload.colunm_originalfilename, originalFileName);
			upload.set(Upload.colunm_path, pathType);
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
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select * ";
		splitPageBase(ConstantPlatform.db_dataSource_main, splitPage, select, "platform.upload.splitPage");
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String logIds : idsArr) {
			Upload.dao.deleteById(logIds);
		}
	}
	
}
