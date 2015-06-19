package little.ant.platform.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.model.Upload;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;

public class UploadService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(UploadService.class);

	public static final UploadService service = Enhancer.enhance(UploadService.class, Tx.class);
	
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
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Upload.sqlId_splitPage_select, Upload.sqlId_splitPage_from);
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
