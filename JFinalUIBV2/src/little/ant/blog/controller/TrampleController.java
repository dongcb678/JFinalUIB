package little.ant.blog.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.service.TrampleService;
import little.ant.blog.validator.TrampleValidator;
import little.ant.blog.model.Trample;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/trample
 * /jf/blog/trample/save
 * /jf/blog/trample/edit
 * /jf/blog/trample/update
 * /jf/blog/trample/view
 * /jf/blog/trample/delete
 * /common/trample/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/trample")
public class TrampleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TrampleController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		TrampleService.service.list(splitPage);
		render("/blog/trample/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TrampleValidator.class)
	public void save() {
		getModel(Trample.class).save();
		render("/blog/trample/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Trample trample = Trample.dao.findById(getPara());
		setAttr("trample", trample);
		render("/blog/trample/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TrampleValidator.class)
	public void update() {
		getModel(Trample.class).update();
		redirect("/jf/blog/trample");
	}

	/**
	 * 查看
	 */
	public void view() {
		Trample trample = Trample.dao.findById(getPara());
		setAttr("trample", trample);
		render("/blog/trample/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		TrampleService.service.delete(param);
		redirect("/jf/blog/trample");
	}
	
}


