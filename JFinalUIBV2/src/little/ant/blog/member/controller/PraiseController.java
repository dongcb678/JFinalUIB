package little.ant.blog.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.member.service.PraiseService;
import little.ant.blog.member.validator.PraiseValidator;
import little.ant.blog.model.Praise;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/member/praise
 * /jf/blog/member/praise/save
 * /jf/blog/member/praise/edit
 * /jf/blog/member/praise/update
 * /jf/blog/member/praise/view
 * /jf/blog/member/praise/delete
 * /common/praise/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/member/praise")
public class PraiseController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PraiseController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		PraiseService.service.list(splitPage);
		render("/blog/member/praise/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(PraiseValidator.class)
	public void save() {
		getModel(Praise.class).save();
		render("/blog/member/praise/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Praise praise = Praise.dao.findById(getPara());
		setAttr("praise", praise);
		render("/blog/member/praise/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(PraiseValidator.class)
	public void update() {
		getModel(Praise.class).update();
		redirect("/jf/blog/member/praise");
	}

	/**
	 * 查看
	 */
	public void view() {
		Praise praise = Praise.dao.findById(getPara());
		setAttr("praise", praise);
		render("/blog/member/praise/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		PraiseService.service.delete(param);
		redirect("/jf/blog/member/praise");
	}
	
}


