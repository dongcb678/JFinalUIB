package little.ant.blog.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.service.PraiseService;
import little.ant.blog.validator.PraiseValidator;
import little.ant.blog.model.Praise;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/praise
 * /jf/blog/praise/save
 * /jf/blog/praise/edit
 * /jf/blog/praise/update
 * /jf/blog/praise/view
 * /jf/blog/praise/delete
 * /common/praise/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/praise")
public class PraiseController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PraiseController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		PraiseService.service.list(splitPage);
		render("/blog/praise/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(PraiseValidator.class)
	public void save() {
		getModel(Praise.class).save();
		render("/blog/praise/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Praise praise = Praise.dao.findById(getPara());
		setAttr("praise", praise);
		render("/blog/praise/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(PraiseValidator.class)
	public void update() {
		getModel(Praise.class).update();
		redirect("/jf/blog/praise");
	}

	/**
	 * 查看
	 */
	public void view() {
		Praise praise = Praise.dao.findById(getPara());
		setAttr("praise", praise);
		render("/blog/praise/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		PraiseService.service.delete(param);
		redirect("/jf/blog/praise");
	}
	
}


