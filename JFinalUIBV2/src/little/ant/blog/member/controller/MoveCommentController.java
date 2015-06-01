package little.ant.blog.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.member.service.MoveCommentService;
import little.ant.blog.member.validator.MoveCommentValidator;
import little.ant.blog.model.MoveComment;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/member/moveComment
 * /jf/blog/member/moveComment/save
 * /jf/blog/member/moveComment/edit
 * /jf/blog/member/moveComment/update
 * /jf/blog/member/moveComment/view
 * /jf/blog/member/moveComment/delete
 * /common/moveComment/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/member/moveComment")
public class MoveCommentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MoveCommentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		MoveCommentService.service.list(splitPage);
		render("/blog/member/moveComment/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(MoveCommentValidator.class)
	public void save() {
		getModel(MoveComment.class).save();
		render("/blog/member/moveComment/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		MoveComment moveComment = MoveComment.dao.findById(getPara());
		setAttr("moveComment", moveComment);
		render("/blog/member/moveComment/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(MoveCommentValidator.class)
	public void update() {
		getModel(MoveComment.class).update();
		redirect("/jf/blog/member/moveComment");
	}

	/**
	 * 查看
	 */
	public void view() {
		MoveComment moveComment = MoveComment.dao.findById(getPara());
		setAttr("moveComment", moveComment);
		render("/blog/member/moveComment/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		MoveCommentService.service.delete(param);
		redirect("/jf/blog/member/moveComment");
	}
	
}


