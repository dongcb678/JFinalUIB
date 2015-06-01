package little.ant.blog.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.tourist.service.TrampleService;
import little.ant.blog.tourist.validator.TrampleValidator;
import little.ant.blog.model.Trample;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/tourist/trample
 * /jf/blog/tourist/trample/save
 * /jf/blog/tourist/trample/edit
 * /jf/blog/tourist/trample/update
 * /jf/blog/tourist/trample/view
 * /jf/blog/tourist/trample/delete
 * /common/trample/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/tourist/trample")
public class TrampleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TrampleController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		TrampleService.service.list(splitPage);
		render("/blog/tourist/trample/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TrampleValidator.class)
	public void save() {
		getModel(Trample.class).save();
		render("/blog/tourist/trample/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Trample trample = Trample.dao.findById(getPara());
		setAttr("trample", trample);
		render("/blog/tourist/trample/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TrampleValidator.class)
	public void update() {
		getModel(Trample.class).update();
		redirect("/jf/blog/tourist/trample");
	}

	/**
	 * 查看
	 */
	public void view() {
		Trample trample = Trample.dao.findById(getPara());
		setAttr("trample", trample);
		render("/blog/tourist/trample/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		TrampleService.service.delete(param);
		redirect("/jf/blog/tourist/trample");
	}
	
}


