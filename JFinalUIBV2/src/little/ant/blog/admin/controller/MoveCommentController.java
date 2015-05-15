package little.ant.blog.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.admin.service.MoveCommentService;
import little.ant.blog.admin.validator.MoveCommentValidator;
import little.ant.blog.model.MoveComment;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/admin/moveComment
 * /jf/blog/admin/moveComment/save
 * /jf/blog/admin/moveComment/edit
 * /jf/blog/admin/moveComment/update
 * /jf/blog/admin/moveComment/view
 * /jf/blog/admin/moveComment/delete
 * /common/admin/moveComment/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/admin/moveComment")
public class MoveCommentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MoveCommentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		MoveCommentService.service.list(splitPage);
		render("/blog/admin/moveComment/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(MoveCommentValidator.class)
	public void save() {
		getModel(MoveComment.class).save();
		render("/blog/admin/moveComment/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		MoveComment moveComment = MoveComment.dao.findById(getPara());
		setAttr("moveComment", moveComment);
		render("/blog/admin/moveComment/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(MoveCommentValidator.class)
	public void update() {
		getModel(MoveComment.class).update();
		redirect("/jf/blog/admin/moveComment");
	}

	/**
	 * 查看
	 */
	public void view() {
		MoveComment moveComment = MoveComment.dao.findById(getPara());
		setAttr("moveComment", moveComment);
		render("/blog/admin/moveComment/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		MoveCommentService.service.delete(param);
		redirect("/jf/blog/admin/moveComment");
	}
	
}


