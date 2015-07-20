package little.ant.platform.controller;

import org.apache.log4j.Logger;

import little.ant.platform.annotation.Controller;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.Syslog;
import little.ant.platform.service.SysLogService;

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
		defaultOrder(Syslog.column_startdate, "desc");
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Syslog.sqlId_splitPage_select, Syslog.sqlId_splitPage_from);
		render("/platform/sysLog/list.html");
	}

	/**
	 * 查看日志
	 */
	public void view() {
		setAttr("sysLog", SysLogService.service.view(getPara()));
		render("/platform/sysLog/view.html");
	}

	/**
	 * 删除日志
	 */
	public void delete() {
		SysLogService.service.delete(getPara() == null ? ids : getPara());
		redirect("/jf/platform/sysLog");
	}

}


