package little.ant.common.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.service.AccessStatisticsService;
import little.ant.common.validator.AccessStatisticsValidator;
import little.ant.common.model.AccessStatistics;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/accessStatistics
 * /jf/common/accessStatistics/save
 * /jf/common/accessStatistics/edit
 * /jf/common/accessStatistics/update
 * /jf/common/accessStatistics/view
 * /jf/common/accessStatistics/delete
 * /common/accessStatistics/add.html
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
	 * 保存
	 */
	@Before(AccessStatisticsValidator.class)
	public void save() {
		getModel(AccessStatistics.class).save();
		render("/common/accessStatistics/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		AccessStatistics accessStatistics = AccessStatistics.dao.findById(getPara());
		setAttr("accessStatistics", accessStatistics);
		render("/common/accessStatistics/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(AccessStatisticsValidator.class)
	public void update() {
		getModel(AccessStatistics.class).update();
		redirect("/jf/common/accessStatistics");
	}

	/**
	 * 查看
	 */
	public void view() {
		AccessStatistics accessStatistics = AccessStatistics.dao.findById(getPara());
		setAttr("accessStatistics", accessStatistics);
		render("/common/accessStatistics/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		AccessStatisticsService.service.delete(param);
		redirect("/jf/common/accessStatistics");
	}
	
}


