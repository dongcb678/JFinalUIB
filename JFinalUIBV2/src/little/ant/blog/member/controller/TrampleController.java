package little.ant.blog.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.member.service.TrampleService;
import little.ant.blog.member.validator.TrampleValidator;
import little.ant.blog.model.Trample;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/member/trample
 * /jf/blog/member/trample/save
 * /jf/blog/member/trample/edit
 * /jf/blog/member/trample/update
 * /jf/blog/member/trample/view
 * /jf/blog/member/trample/delete
 * /common/trample/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/member/trample")
public class TrampleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TrampleController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		TrampleService.service.list(splitPage);
		render("/blog/member/trample/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TrampleValidator.class)
	public void save() {
		getModel(Trample.class).save();
		render("/blog/member/trample/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Trample trample = Trample.dao.findById(getPara());
		setAttr("trample", trample);
		render("/blog/member/trample/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TrampleValidator.class)
	public void update() {
		getModel(Trample.class).update();
		redirect("/jf/blog/member/trample");
	}

	/**
	 * 查看
	 */
	public void view() {
		Trample trample = Trample.dao.findById(getPara());
		setAttr("trample", trample);
		render("/blog/member/trample/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		TrampleService.service.delete(param);
		redirect("/jf/blog/member/trample");
	}
	
}


