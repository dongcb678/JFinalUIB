package com.platform.mvc.syslog;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.annotation.Service;
import com.platform.constant.ConstantI18n;
import com.platform.constant.ConstantInit;
import com.platform.dto.SplitPage;
import com.platform.mvc.base.BaseService;
import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolPoi;

@Service(name = SysLogService.serviceName)
public class SysLogService extends BaseService {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(SysLogService.class);

	public static final String serviceName = "sysLogService";
	
	/**
	 * 定时清理数据
	 */
	public void timerDataClear(){
		Date date = ToolDateTime.getDate(-365, 0, 0, 0, 0); // 设置时间为365天前
		Timestamp timestamp = ToolDateTime.getSqlTimestamp(date);
		Db.use(ConstantInit.db_dataSource_main).update(getSqlMy(Syslog.sqlId_clear), timestamp);
	}
	
	/**
	 * 导出
	 * @param splitPage
	 * @return
	 */
	public String export(Map<String, String> i18n, SplitPage splitPage){
		SXSSFWorkbook wb = new SXSSFWorkbook();
		Sheet sheet = wb.createSheet(i18n.get(ConstantI18n.admin_sysLog_common_name));
		
		// 表头
		int cellIndex = 0;
		Row rowHead = sheet.createRow(0);
		
		Cell cell0 = rowHead.createCell(cellIndex++);
		cell0.setCellValue(i18n.get(ConstantI18n.admin_sysLog_common_synames));
		
		Cell cell1 = rowHead.createCell(cellIndex++);
		cell1.setCellValue(i18n.get(ConstantI18n.admin_sysLog_common_mnames));

		Cell cell2 = rowHead.createCell(cellIndex++);
		cell2.setCellValue(i18n.get(ConstantI18n.admin_sysLog_property_oname));

		Cell cell3 = rowHead.createCell(cellIndex++);
		cell3.setCellValue(i18n.get(ConstantI18n.admin_sysLog_property_username));

		Cell cell4 = rowHead.createCell(cellIndex++);
		cell4.setCellValue(i18n.get(ConstantI18n.admin_sysLog_property_status));

		Cell cell5 = rowHead.createCell(cellIndex++);
		cell5.setCellValue(i18n.get(ConstantI18n.admin_sysLog_property_ips));

		Cell cell6 = rowHead.createCell(cellIndex++);
		cell6.setCellValue(i18n.get(ConstantI18n.admin_sysLog_property_startdate));

		Cell cell7 = rowHead.createCell(cellIndex++);
		cell7.setCellValue(i18n.get(ConstantI18n.admin_sysLog_property_actionhaoshi));

		Cell cell8 = rowHead.createCell(cellIndex++);
		cell8.setCellValue(i18n.get(ConstantI18n.admin_sysLog_property_viewhaoshi));

		Cell cell9 = rowHead.createCell(cellIndex++);
		cell9.setCellValue(i18n.get(ConstantI18n.admin_sysLog_property_haoshi));

		// 表头样式
		ToolPoi.setHeadStyle(wb, rowHead.cellIterator());

		// 表头宽度
		sheet.setColumnWidth(0, 10 * 256);
		sheet.setColumnWidth(1, 15 * 256);
		sheet.setColumnWidth(2, 40 * 256);
		sheet.setColumnWidth(3, 15 * 256);
		sheet.setColumnWidth(4, 20 * 256);
		sheet.setColumnWidth(5, 15 * 256);
		sheet.setColumnWidth(6, 25 * 256);
		sheet.setColumnWidth(7, 15 * 256);
		sheet.setColumnWidth(8, 15 * 256);
		sheet.setColumnWidth(9, 15 * 256);
		
		// 基本样式
		XSSFColor color = new XSSFColor(new java.awt.Color(255, 255, 255));
		Font font = ToolPoi.createFont(wb, Font.BOLDWEIGHT_NORMAL, Font.COLOR_NORMAL, (short) 10);
		CellStyle style = ToolPoi.createBorderCellStyle(wb, HSSFColor.WHITE.index, color, CellStyle.ALIGN_CENTER, font);
		
		// 样式换行
		CellStyle wrap = wb.createCellStyle();
		wrap.cloneStyleFrom(style);
		wrap.setWrapText(true);

		 // 绿色
		XSSFCellStyle blue = (XSSFCellStyle)wb.createCellStyle();
		blue.cloneStyleFrom(style);
		blue.setFillForegroundColor(new XSSFColor(new java.awt.Color(0, 164, 137)));

		 // 红色
		XSSFCellStyle red = (XSSFCellStyle)wb.createCellStyle();
		red.cloneStyleFrom(style);
		red.setFillForegroundColor(new XSSFColor(new java.awt.Color(243, 123, 83)));
		
		List<?> list = splitPage.getList();

		// 处理监控点数据
		for (int i = 0; i < list.size(); i++) {
			Record record = (Record) list.get(i);
			// 创建行
			Row row = sheet.createRow(i + 1);
			
			Cell c0 = row.createCell(0);
			c0.setCellStyle(style);
			c0.setCellValue(record.getStr("synames"));
			
			Cell c1 = row.createCell(1);
			c1.setCellStyle(style);
			c1.setCellValue(record.getStr("mnames"));
			
			Cell c2 = row.createCell(2);
			c2.setCellStyle(wrap);
			c2.setCellValue(record.getStr("onames") + ":" + record.getStr("ourl"));
			
			Cell c3 = row.createCell(3);
			c3.setCellStyle(wrap);
			c3.setCellValue(record.getStr("username"));
			
			Cell c4 = row.createCell(4);
			c4.setCellStyle(record.getStr("status").equals("1") ? blue : red);
			c4.setCellValue(record.getStr("status").equals("1") ? 
					i18n.get(ConstantI18n.admin_sysLog_property_status_success) : 
						i18n.get(ConstantI18n.admin_sysLog_property_status_error));
			
			Cell c5 = row.createCell(5);
			c5.setCellStyle(style);
			c5.setCellValue(record.getStr("ips"));
			
			Cell c6 = row.createCell(6);
			c6.setCellStyle(style);
			c6.setCellValue(ToolDateTime.format(record.getTimestamp("startdate"), ToolDateTime.pattern_ymd_hms_s));
			
			Cell c7 = row.createCell(7);
			c7.setCellStyle(style);
			c7.setCellValue(record.getNumber("actionhaoshi").intValue());
			
			Cell c8 = row.createCell(8);
			c8.setCellStyle(style);
			c8.setCellValue(record.getNumber("viewhaoshi").intValue());
			
			Cell c9 = row.createCell(9);
			int haoshi = record.getNumber("haoshi").intValue();
			c9.setCellStyle(haoshi > 500 ? blue : red);
			c9.setCellValue(haoshi);
		}
		
		String path = ToolPoi.writeExcel(wb, i18n.get(ConstantI18n.admin_sysLog_common_name));

		return path;
	}
	
}
