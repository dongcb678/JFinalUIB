package little.ant.blog.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.admin.service.TrampleService;
import little.ant.blog.admin.validator.TrampleValidator;
import little.ant.blog.model.Trample;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/admin/trample
 * /jf/blog/admin/trample/save
 * /jf/blog/admin/trample/edit
 * /jf/blog/admin/trample/update
 * /jf/blog/admin/trample/view
 * /jf/blog/admin/trample/delete
 * /common/admin/trample/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/admin/trample")
public class TrampleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TrampleController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		TrampleService.service.list(splitPage);
		render("/blog/admin/trample/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TrampleValidator.class)
	public void save() {
		getModel(Trample.class).save();
		render("/blog/admin/trample/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Trample trample = Trample.dao.findById(getPara());
		setAttr("trample", trample);
		render("/blog/admin/trample/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TrampleValidator.class)
	public void update() {
		getModel(Trample.class).update();
		redirect("/jf/blog/admin/trample");
	}

	/**
	 * 查看
	 */
	public void view() {
		Trample trample = Trample.dao.findById(getPara());
		setAttr("trample", trample);
		render("/blog/admin/trample/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		TrampleService.service.delete(param);
		redirect("/jf/blog/admin/trample");
	}
	
}


