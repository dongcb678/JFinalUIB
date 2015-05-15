package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.CommentService;
import little.ant.cms.admin.validator.CommentValidator;
import little.ant.cms.model.Comment;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/admin/comment
 * /jf/cms/admin/comment/save
 * /jf/cms/admin/comment/edit
 * /jf/cms/admin/comment/update
 * /jf/cms/admin/comment/view
 * /jf/cms/admin/comment/delete
 * /common/admin/comment/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/comment")
public class CommentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CommentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		CommentService.service.list(splitPage);
		render("/cms/admin/comment/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(CommentValidator.class)
	public void save() {
		getModel(Comment.class).save();
		render("/cms/admin/comment/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Comment comment = Comment.dao.findById(getPara());
		setAttr("comment", comment);
		render("/cms/admin/comment/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(CommentValidator.class)
	public void update() {
		getModel(Comment.class).update();
		redirect("/jf/cms/admin/comment");
	}

	/**
	 * 查看
	 */
	public void view() {
		Comment comment = Comment.dao.findById(getPara());
		setAttr("comment", comment);
		render("/cms/admin/comment/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		CommentService.service.delete(param);
		redirect("/jf/cms/admin/comment");
	}
	
}


