package little.ant.blog.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.admin.service.InformService;
import little.ant.blog.admin.validator.InformValidator;
import little.ant.blog.model.Inform;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/inform
 * /jf/blog/inform/save
 * /jf/blog/inform/edit
 * /jf/blog/inform/update
 * /jf/blog/inform/view
 * /jf/blog/inform/delete
 * /common/inform/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/inform")
public class InformController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(InformController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		InformService.service.list(splitPage);
		render("/blog/inform/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(InformValidator.class)
	public void save() {
		getModel(Inform.class).save();
		render("/blog/inform/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Inform inform = Inform.dao.findById(getPara());
		setAttr("inform", inform);
		render("/blog/inform/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(InformValidator.class)
	public void update() {
		getModel(Inform.class).update();
		redirect("/jf/blog/inform");
	}

	/**
	 * 查看
	 */
	public void view() {
		Inform inform = Inform.dao.findById(getPara());
		setAttr("inform", inform);
		render("/blog/inform/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		InformService.service.delete(param);
		redirect("/jf/blog/inform");
	}
	
}


