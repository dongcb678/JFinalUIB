package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.JobService;
import little.ant.cms.admin.validator.JobValidator;
import little.ant.cms.model.Job;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/admin/job
 * /jf/cms/admin/job/save
 * /jf/cms/admin/job/edit
 * /jf/cms/admin/job/update
 * /jf/cms/admin/job/view
 * /jf/cms/admin/job/delete
 * /common/admin/job/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/job")
public class JobController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(JobController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		JobService.service.list(splitPage);
		render("/cms/admin/job/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(JobValidator.class)
	public void save() {
		getModel(Job.class).save();
		render("/cms/admin/job/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Job job = Job.dao.findById(getPara());
		setAttr("job", job);
		render("/cms/admin/job/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(JobValidator.class)
	public void update() {
		getModel(Job.class).update();
		redirect("/jf/cms/admin/job");
	}

	/**
	 * 查看
	 */
	public void view() {
		Job job = Job.dao.findById(getPara());
		setAttr("job", job);
		render("/cms/admin/job/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		JobService.service.delete(param);
		redirect("/jf/cms/admin/job");
	}
	
}


