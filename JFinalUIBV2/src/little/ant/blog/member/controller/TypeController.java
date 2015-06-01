package little.ant.blog.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.member.service.TypeService;
import little.ant.blog.member.validator.TypeValidator;
import little.ant.blog.model.Type;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/member/type
 * /jf/blog/member/type/save
 * /jf/blog/member/type/edit
 * /jf/blog/member/type/update
 * /jf/blog/member/type/view
 * /jf/blog/member/type/delete
 * /common/type/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/member/type")
public class TypeController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TypeController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		TypeService.service.list(splitPage);
		render("/blog/member/type/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TypeValidator.class)
	public void save() {
		getModel(Type.class).save();
		render("/blog/member/type/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Type type = Type.dao.findById(getPara());
		setAttr("type", type);
		render("/blog/member/type/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TypeValidator.class)
	public void update() {
		getModel(Type.class).update();
		redirect("/jf/blog/member/type");
	}

	/**
	 * 查看
	 */
	public void view() {
		Type type = Type.dao.findById(getPara());
		setAttr("type", type);
		render("/blog/member/type/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		TypeService.service.delete(param);
		redirect("/jf/blog/member/type");
	}
	
}


