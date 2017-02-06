package com.platform.mvc.syslog;

import java.io.File;

import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.constant.ConstantSplitPage;
import com.platform.mvc.base.BaseController;

/**
 * 系统日志管理
 * @author 董华健
 */
@Controller("/platform/sysLog")
public class SysLogController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(SysLogController.class);
	
	private SysLogService sysLogService;
	
	/**
	 * 日志列表
	 */
	public void index() {
		defaultOrder("s.startdate", "desc"); // 默认排序方式，指定列名和排序方式
		paging(splitPage, Syslog.sqlId_splitPageSelect, Syslog.sqlId_splitPageFrom);
		render("/platform/sysLog/list.html");
	}

	/**
	 * 日志导出
	 */
	public void export() {
		defaultOrder(Syslog.column_startdate, "desc"); // 默认排序方式，指定列名和排序方式
		splitPage.setExport(true); // 是否导出 
		splitPage.setPageNumber(1); // 只能是第一页
		splitPage.setPageSize(ConstantSplitPage.default_export_maxSize); // 单页最大导出数据量
		paging(splitPage, Syslog.sqlId_splitPageSelect, Syslog.sqlId_splitPageFrom);
		String path = sysLogService.export(getI18nMap(), splitPage);
		renderFile(new File(path));
	}

	/**
	 * 查看日志
	 */
	public void view() {
		Syslog log =  Syslog.dao.findFirst(getSqlMy(Syslog.sqlId_view), getPara());
		setAttr("sysLog", log);
		render("/platform/sysLog/view.html");
	}

	/**
	 * 删除日志
	 */
	public void delete() {
		sysLogService.baseDelete(Syslog.table_name, getPara() == null ? ids : getPara());
		forwardAction("/platform/sysLog/backOff");
	}

}


