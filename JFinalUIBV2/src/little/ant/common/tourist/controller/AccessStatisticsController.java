package little.ant.common.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.tourist.service.AccessStatisticsService;
import little.ant.common.tourist.validator.AccessStatisticsValidator;
import little.ant.common.model.AccessStatistics;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/tourist/accessStatistics
 * /jf/common/tourist/accessStatistics/save
 * /jf/common/tourist/accessStatistics/edit
 * /jf/common/tourist/accessStatistics/update
 * /jf/common/tourist/accessStatistics/view
 * /jf/common/tourist/accessStatistics/delete
 * /common/accessStatistics/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/tourist/accessStatistics")
public class AccessStatisticsController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AccessStatisticsController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		AccessStatisticsService.service.list(splitPage);
		render("/common/tourist/accessStatistics/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(AccessStatisticsValidator.class)
	public void save() {
		getModel(AccessStatistics.class).save();
		render("/common/tourist/accessStatistics/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		AccessStatistics accessStatistics = AccessStatistics.dao.findById(getPara());
		setAttr("accessStatistics", accessStatistics);
		render("/common/tourist/accessStatistics/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(AccessStatisticsValidator.class)
	public void update() {
		getModel(AccessStatistics.class).update();
		redirect("/jf/common/tourist/accessStatistics");
	}

	/**
	 * 查看
	 */
	public void view() {
		AccessStatistics accessStatistics = AccessStatistics.dao.findById(getPara());
		setAttr("accessStatistics", accessStatistics);
		render("/common/tourist/accessStatistics/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		AccessStatisticsService.service.delete(param);
		redirect("/jf/common/tourist/accessStatistics");
	}
	
}


