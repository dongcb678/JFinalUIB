package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.JobService;
import little.ant.cms.tourist.validator.JobValidator;
import little.ant.cms.model.Job;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/job
 * /jf/cms/tourist/job/save
 * /jf/cms/tourist/job/edit
 * /jf/cms/tourist/job/update
 * /jf/cms/tourist/job/view
 * /jf/cms/tourist/job/delete
 * /common/job/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/job")
public class JobController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(JobController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		JobService.service.list(splitPage);
		render("/cms/tourist/job/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(JobValidator.class)
	public void save() {
		getModel(Job.class).save();
		render("/cms/tourist/job/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Job job = Job.dao.findById(getPara());
		setAttr("job", job);
		render("/cms/tourist/job/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(JobValidator.class)
	public void update() {
		getModel(Job.class).update();
		redirect("/jf/cms/tourist/job");
	}

	/**
	 * 查看
	 */
	public void view() {
		Job job = Job.dao.findById(getPara());
		setAttr("job", job);
		render("/cms/tourist/job/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		JobService.service.delete(param);
		redirect("/jf/cms/tourist/job");
	}
	
}


