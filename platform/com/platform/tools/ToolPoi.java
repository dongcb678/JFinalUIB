package com.platform.tools;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.jfinal.kit.PathKit;
import com.jfinal.log.Log;
import com.platform.plugin.ParamInitPlugin;

/**
 * poi工具类
 * @author 董华健  dongcb678@163.com
 * 描述：建议导出规则是，先定义好excel模板，然后填充数据，这样避免编写很多不必要的样式代码
 */
public abstract class ToolPoi {

	private static final Log log = Log.getLog(ParamInitPlugin.class);

	/**
	 * excel导出
	 * @param templatePath 模板路径
	 */
	public static String export(String templatePath) {
	    // 导出文件存放目录
	    String filePath = PathKit.getWebRootPath() + File.separator + "exportFile";
        File fileDir = new File(filePath);
        if(!fileDir.exists()){
        	fileDir.mkdir();	
        }
        
	    // 导出文件路径
        String path = filePath + File.separator + ToolDateTime.format(new Date(), "yyyyMMddHHmmssSSS") + ".xlsx";
        
        XSSFWorkbook wb = null;
	    SXSSFWorkbook swb = null;
        FileOutputStream os = null;
		try {
			// 1.载入模板
	 		wb = new XSSFWorkbook(new File(templatePath));//初始化HSSFWorkbook对象    
	 		wb.setSheetName(0, "用户信息导出");
		    Sheet sheet = wb.getSheetAt(0);// wb.createSheet("监控点资源状态"); 
		    
		    // 2.读取模板处理好样式
		    
		    
		    // 3.转换成大数据读取模式
		    swb = new SXSSFWorkbook(wb, 1000);//用于大文件导出
			sheet = swb.getSheetAt(0);
			
			// 4.大批量写入数据

		    
	        // 5.保存到本地文件夹
			os = new FileOutputStream(new File(path));
			swb.write(os);  
			
			return path;
		} catch (IOException | InvalidFormatException e) {
			log.error("导出失败：" + e.getMessage());
			e.printStackTrace();
			return null;
		} finally {
			if(null != os){
				try {
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			if(null != wb){
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			if(null != swb){
				try {
					swb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
}
