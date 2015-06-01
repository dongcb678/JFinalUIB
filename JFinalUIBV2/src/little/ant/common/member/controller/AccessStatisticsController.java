package little.ant.common.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.member.service.AccessStatisticsService;
import little.ant.common.member.validator.AccessStatisticsValidator;
import little.ant.common.model.AccessStatistics;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/member/accessStatistics
 * /jf/common/member/accessStatistics/save
 * /jf/common/member/accessStatistics/edit
 * /jf/common/member/accessStatistics/update
 * /jf/common/member/accessStatistics/view
 * /jf/common/member/accessStatistics/delete
 * /common/accessStatistics/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/member/accessStatistics")
public class AccessStatisticsController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AccessStatisticsController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		AccessStatisticsService.service.list(splitPage);
		render("/common/member/accessStatistics/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(AccessStatisticsValidator.class)
	public void save() {
		getModel(AccessStatistics.class).save();
		render("/common/member/accessStatistics/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		AccessStatistics accessStatistics = AccessStatistics.dao.findById(getPara());
		setAttr("accessStatistics", accessStatistics);
		render("/common/member/accessStatistics/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(AccessStatisticsValidator.class)
	public void update() {
		getModel(AccessStatistics.class).update();
		redirect("/jf/common/member/accessStatistics");
	}

	/**
	 * 查看
	 */
	public void view() {
		AccessStatistics accessStatistics = AccessStatistics.dao.findById(getPara());
		setAttr("accessStatistics", accessStatistics);
		render("/common/member/accessStatistics/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		AccessStatisticsService.service.delete(param);
		redirect("/jf/common/member/accessStatistics");
	}
	
}


