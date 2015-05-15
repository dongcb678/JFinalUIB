package little.ant.common.admin.controller;

import little.ant.common.admin.service.AccessStatisticsService;
import little.ant.common.model.AccessStatistics;
import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;

import org.apache.log4j.Logger;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/accessStatistics
 * /jf/common/accessStatistics/view
 * 
 */
@Controller(controllerKey = "/jf/common/accessStatistics")
public class AccessStatisticsController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AccessStatisticsController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		AccessStatisticsService.service.list(splitPage);
		render("/common/accessStatistics/list.html");
	}
	
	/**
	 * 查看
	 */
	public void view() {
		AccessStatistics accessStatistics = AccessStatistics.dao.findById(getPara());
		setAttr("accessStatistics", accessStatistics);
		render("/common/accessStatistics/view.html");
	}
	
}


