package little.ant.blog.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.service.TypeService;
import little.ant.blog.validator.TypeValidator;
import little.ant.blog.model.Type;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/type
 * /jf/blog/type/save
 * /jf/blog/type/edit
 * /jf/blog/type/update
 * /jf/blog/type/view
 * /jf/blog/type/delete
 * /common/type/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/type")
public class TypeController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TypeController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		TypeService.service.list(splitPage);
		render("/blog/type/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TypeValidator.class)
	public void save() {
		getModel(Type.class).save();
		render("/blog/type/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Type type = Type.dao.findById(getPara());
		setAttr("type", type);
		render("/blog/type/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TypeValidator.class)
	public void update() {
		getModel(Type.class).update();
		redirect("/jf/blog/type");
	}

	/**
	 * 查看
	 */
	public void view() {
		Type type = Type.dao.findById(getPara());
		setAttr("type", type);
		render("/blog/type/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		TypeService.service.delete(param);
		redirect("/jf/blog/type");
	}
	
}


