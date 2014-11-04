package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.model.Syslog;
import little.ant.platform.service.SysLogService;

import org.apache.log4j.Logger;

@Controller(controllerKey = "/jf/platform/sysLog")
public class SysLogController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SysLogController.class);
	
	public void index() {
		defaultOrder("startdate", "desc");
		SysLogService.service.list(splitPage);
		render("/platform/sysLog/list.html");
	}

	public void view() {
		setAttr("sysLog", SysLogService.service.view(getPara()));
		render("/platform/sysLog/view.html");
	}
	
	public void delete() {
		Syslog.dao.deleteById(getPara());
		redirect("/jf/platform/sysLog");
	}

}


