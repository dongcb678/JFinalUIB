package little.ant.blog.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.tourist.service.MoveService;
import little.ant.blog.tourist.validator.MoveValidator;
import little.ant.blog.model.Move;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/tourist/move
 * /jf/blog/tourist/move/save
 * /jf/blog/tourist/move/edit
 * /jf/blog/tourist/move/update
 * /jf/blog/tourist/move/view
 * /jf/blog/tourist/move/delete
 * /common/move/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/tourist/move")
public class MoveController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MoveController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		MoveService.service.list(splitPage);
		render("/blog/tourist/move/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(MoveValidator.class)
	public void save() {
		getModel(Move.class).save();
		render("/blog/tourist/move/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Move move = Move.dao.findById(getPara());
		setAttr("move", move);
		render("/blog/tourist/move/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(MoveValidator.class)
	public void update() {
		getModel(Move.class).update();
		redirect("/jf/blog/tourist/move");
	}

	/**
	 * 查看
	 */
	public void view() {
		Move move = Move.dao.findById(getPara());
		setAttr("move", move);
		render("/blog/tourist/move/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		MoveService.service.delete(param);
		redirect("/jf/blog/tourist/move");
	}
	
}


