package little.ant.blog.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.tourist.service.MoveCommentService;
import little.ant.blog.tourist.validator.MoveCommentValidator;
import little.ant.blog.model.MoveComment;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/tourist/moveComment
 * /jf/blog/tourist/moveComment/save
 * /jf/blog/tourist/moveComment/edit
 * /jf/blog/tourist/moveComment/update
 * /jf/blog/tourist/moveComment/view
 * /jf/blog/tourist/moveComment/delete
 * /common/moveComment/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/tourist/moveComment")
public class MoveCommentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MoveCommentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		MoveCommentService.service.list(splitPage);
		render("/blog/tourist/moveComment/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(MoveCommentValidator.class)
	public void save() {
		getModel(MoveComment.class).save();
		render("/blog/tourist/moveComment/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		MoveComment moveComment = MoveComment.dao.findById(getPara());
		setAttr("moveComment", moveComment);
		render("/blog/tourist/moveComment/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(MoveCommentValidator.class)
	public void update() {
		getModel(MoveComment.class).update();
		redirect("/jf/blog/tourist/moveComment");
	}

	/**
	 * 查看
	 */
	public void view() {
		MoveComment moveComment = MoveComment.dao.findById(getPara());
		setAttr("moveComment", moveComment);
		render("/blog/tourist/moveComment/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		MoveCommentService.service.delete(param);
		redirect("/jf/blog/tourist/moveComment");
	}
	
}


