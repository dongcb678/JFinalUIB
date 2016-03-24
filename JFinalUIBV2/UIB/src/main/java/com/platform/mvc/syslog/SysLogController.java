package com.platform.mvc.syslog;

import org.apache.log4j.Logger;

import com.platform.annotation.Controller;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseController;

/**
 * 系统日志管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/platform/sysLog")
public class SysLogController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SysLogController.class);
	
	/**
	 * 日志管理列表
	 */
	public void index() {
		defaultOrder(Syslog.column_startdate, "desc"); // 默认排序方式，指定列名和排序方式
		paging(ConstantInit.db_dataSource_main, splitPage, Syslog.sqlId_splitPageSelect, Syslog.sqlId_splitPageFrom);
		render("/platform/sysLog/list.html");
	}

	/**
	 * 查看日志
	 */
	public void view() {
		Syslog log =  Syslog.dao.findFirst(getSql(Syslog.sqlId_view), getPara());
		setAttr("sysLog", log);
		render("/platform/sysLog/view.html");
	}

	/**
	 * 删除日志
	 */
	public void delete() {
		SysLogService.service.delete("pt_syslog", getPara() == null ? ids : getPara());
		redirect("/jf/platform/sysLog");
	}

}


