package little.ant.cms.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.service.JobService;
import little.ant.cms.validator.JobValidator;
import little.ant.cms.model.Job;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/job
 * /jf/cms/job/save
 * /jf/cms/job/edit
 * /jf/cms/job/update
 * /jf/cms/job/view
 * /jf/cms/job/delete
 * /common/job/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/job")
public class JobController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(JobController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		JobService.service.list(splitPage);
		render("/cms/job/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(JobValidator.class)
	public void save() {
		getModel(Job.class).save();
		render("/cms/job/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Job job = Job.dao.findById(getPara());
		setAttr("job", job);
		render("/cms/job/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(JobValidator.class)
	public void update() {
		getModel(Job.class).update();
		redirect("/jf/cms/job");
	}

	/**
	 * 查看
	 */
	public void view() {
		Job job = Job.dao.findById(getPara());
		setAttr("job", job);
		render("/cms/job/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		JobService.service.delete(param);
		redirect("/jf/cms/job");
	}
	
}


