package little.ant.blog.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.member.service.InformService;
import little.ant.blog.member.validator.InformValidator;
import little.ant.blog.model.Inform;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/member/inform
 * /jf/blog/member/inform/save
 * /jf/blog/member/inform/edit
 * /jf/blog/member/inform/update
 * /jf/blog/member/inform/view
 * /jf/blog/member/inform/delete
 * /common/inform/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/member/inform")
public class InformController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(InformController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		InformService.service.list(splitPage);
		render("/blog/member/inform/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(InformValidator.class)
	public void save() {
		getModel(Inform.class).save();
		render("/blog/member/inform/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Inform inform = Inform.dao.findById(getPara());
		setAttr("inform", inform);
		render("/blog/member/inform/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(InformValidator.class)
	public void update() {
		getModel(Inform.class).update();
		redirect("/jf/blog/member/inform");
	}

	/**
	 * 查看
	 */
	public void view() {
		Inform inform = Inform.dao.findById(getPara());
		setAttr("inform", inform);
		render("/blog/member/inform/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		InformService.service.delete(param);
		redirect("/jf/blog/member/inform");
	}
	
}


