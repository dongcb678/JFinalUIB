package little.ant.blog.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.admin.service.MoveService;
import little.ant.blog.admin.validator.MoveValidator;
import little.ant.blog.model.Move;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/admin/move
 * /jf/blog/admin/move/save
 * /jf/blog/admin/move/edit
 * /jf/blog/admin/move/update
 * /jf/blog/admin/move/view
 * /jf/blog/admin/move/delete
 * /common/admin/move/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/admin/move")
public class MoveController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MoveController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		MoveService.service.list(splitPage);
		render("/blog/admin/move/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(MoveValidator.class)
	public void save() {
		getModel(Move.class).save();
		render("/blog/admin/move/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Move move = Move.dao.findById(getPara());
		setAttr("move", move);
		render("/blog/admin/move/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(MoveValidator.class)
	public void update() {
		getModel(Move.class).update();
		redirect("/jf/blog/admin/move");
	}

	/**
	 * 查看
	 */
	public void view() {
		Move move = Move.dao.findById(getPara());
		setAttr("move", move);
		render("/blog/admin/move/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		MoveService.service.delete(param);
		redirect("/jf/blog/admin/move");
	}
	
}


