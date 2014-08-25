package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.Syslog;
import little.ant.pingtai.service.SysLogService;

import org.apache.log4j.Logger;

@Controller(controllerKey = "/jf/sysLog")
public class SysLogController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SysLogController.class);
	
	public void index() {
		defaultOrder("startdate", "desc");
		SysLogService.service.list(splitPage);
		render("/pingtai/sysLog/list.html");
	}
	
	public void view() {
		setAttr("sysLog", SysLogService.service.view(getPara()));
		render("/pingtai/sysLog/view.html");
	}
	
	public void delete() {
		Syslog.dao.deleteById(getPara());
		redirect("/jf/sysLog");
	}

}


