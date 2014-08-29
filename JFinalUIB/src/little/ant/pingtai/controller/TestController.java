package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.service.OperatorService;
import little.ant.pingtai.service.SysLogService;
import little.ant.weixin.lucene.DocKeyword;

import org.apache.log4j.Logger;

@Controller(controllerKey = "/jf/test")
public class TestController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TestController.class);

	public void operator() {
		OperatorService.service.list(splitPage);
		render("/pingtai/test/operator.html");
	}

	public void sysLog() {
		defaultOrder("startdate", "desc");
		SysLogService.service.list(splitPage);
		render("/pingtai/test/sysLog.html");
	}
	
	public void lucene() {
		new DocKeyword().search(splitPage);
		render("/pingtai/test/lucene.html");
	}
	
	public void autoComplete(){
		String jsArray = "['aa', 'bb', 'cc', 'dd', 'aa2', 'bb2', 'cc2', 'dd2']";
		renderText(jsArray);
	}
	
}


