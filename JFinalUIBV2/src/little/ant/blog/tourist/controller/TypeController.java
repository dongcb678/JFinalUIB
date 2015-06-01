package little.ant.blog.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.tourist.service.TypeService;
import little.ant.blog.tourist.validator.TypeValidator;
import little.ant.blog.model.Type;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/tourist/type
 * /jf/blog/tourist/type/save
 * /jf/blog/tourist/type/edit
 * /jf/blog/tourist/type/update
 * /jf/blog/tourist/type/view
 * /jf/blog/tourist/type/delete
 * /common/type/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/tourist/type")
public class TypeController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TypeController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		TypeService.service.list(splitPage);
		render("/blog/tourist/type/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TypeValidator.class)
	public void save() {
		getModel(Type.class).save();
		render("/blog/tourist/type/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Type type = Type.dao.findById(getPara());
		setAttr("type", type);
		render("/blog/tourist/type/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TypeValidator.class)
	public void update() {
		getModel(Type.class).update();
		redirect("/jf/blog/tourist/type");
	}

	/**
	 * 查看
	 */
	public void view() {
		Type type = Type.dao.findById(getPara());
		setAttr("type", type);
		render("/blog/tourist/type/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		TypeService.service.delete(param);
		redirect("/jf/blog/tourist/type");
	}
	
}


