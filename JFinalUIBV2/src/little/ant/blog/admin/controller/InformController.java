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
 * /jf/blog/admin/inform
 * /jf/blog/admin/inform/save
 * /jf/blog/admin/inform/edit
 * /jf/blog/admin/inform/update
 * /jf/blog/admin/inform/view
 * /jf/blog/admin/inform/delete
 * /common/admin/inform/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/admin/inform")
public class InformController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(InformController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		InformService.service.list(splitPage);
		render("/blog/admin/inform/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(InformValidator.class)
	public void save() {
		getModel(Inform.class).save();
		render("/blog/admin/inform/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Inform inform = Inform.dao.findById(getPara());
		setAttr("inform", inform);
		render("/blog/admin/inform/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(InformValidator.class)
	public void update() {
		getModel(Inform.class).update();
		redirect("/jf/blog/admin/inform");
	}

	/**
	 * 查看
	 */
	public void view() {
		Inform inform = Inform.dao.findById(getPara());
		setAttr("inform", inform);
		render("/blog/admin/inform/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		InformService.service.delete(param);
		redirect("/jf/blog/admin/inform");
	}
	
}


