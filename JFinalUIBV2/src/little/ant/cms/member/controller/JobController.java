package little.ant.cms.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.member.service.JobService;
import little.ant.cms.member.validator.JobValidator;
import little.ant.cms.model.Job;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/member/job
 * /jf/cms/member/job/save
 * /jf/cms/member/job/edit
 * /jf/cms/member/job/update
 * /jf/cms/member/job/view
 * /jf/cms/member/job/delete
 * /common/job/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/member/job")
public class JobController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(JobController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		JobService.service.list(splitPage);
		render("/cms/member/job/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(JobValidator.class)
	public void save() {
		getModel(Job.class).save();
		render("/cms/member/job/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Job job = Job.dao.findById(getPara());
		setAttr("job", job);
		render("/cms/member/job/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(JobValidator.class)
	public void update() {
		getModel(Job.class).update();
		redirect("/jf/cms/member/job");
	}

	/**
	 * 查看
	 */
	public void view() {
		Job job = Job.dao.findById(getPara());
		setAttr("job", job);
		render("/cms/member/job/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		JobService.service.delete(param);
		redirect("/jf/cms/member/job");
	}
	
}


