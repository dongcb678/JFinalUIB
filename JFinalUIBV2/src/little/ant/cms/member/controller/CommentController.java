package little.ant.cms.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.member.service.CommentService;
import little.ant.cms.member.validator.CommentValidator;
import little.ant.cms.model.Comment;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/member/comment
 * /jf/cms/member/comment/save
 * /jf/cms/member/comment/edit
 * /jf/cms/member/comment/update
 * /jf/cms/member/comment/view
 * /jf/cms/member/comment/delete
 * /common/comment/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/member/comment")
public class CommentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CommentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		CommentService.service.list(splitPage);
		render("/cms/member/comment/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(CommentValidator.class)
	public void save() {
		getModel(Comment.class).save();
		render("/cms/member/comment/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Comment comment = Comment.dao.findById(getPara());
		setAttr("comment", comment);
		render("/cms/member/comment/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(CommentValidator.class)
	public void update() {
		getModel(Comment.class).update();
		redirect("/jf/cms/member/comment");
	}

	/**
	 * 查看
	 */
	public void view() {
		Comment comment = Comment.dao.findById(getPara());
		setAttr("comment", comment);
		render("/cms/member/comment/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		CommentService.service.delete(param);
		redirect("/jf/cms/member/comment");
	}
	
}


