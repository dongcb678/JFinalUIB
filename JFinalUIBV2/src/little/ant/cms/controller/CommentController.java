package little.ant.cms.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.service.CommentService;
import little.ant.cms.validator.CommentValidator;
import little.ant.cms.model.Comment;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/comment
 * /jf/cms/comment/save
 * /jf/cms/comment/edit
 * /jf/cms/comment/update
 * /jf/cms/comment/view
 * /jf/cms/comment/delete
 * /common/comment/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/comment")
public class CommentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CommentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		CommentService.service.list(splitPage);
		render("/cms/comment/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(CommentValidator.class)
	public void save() {
		getModel(Comment.class).save();
		render("/cms/comment/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Comment comment = Comment.dao.findById(getPara());
		setAttr("comment", comment);
		render("/cms/comment/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(CommentValidator.class)
	public void update() {
		getModel(Comment.class).update();
		redirect("/jf/cms/comment");
	}

	/**
	 * 查看
	 */
	public void view() {
		Comment comment = Comment.dao.findById(getPara());
		setAttr("comment", comment);
		render("/cms/comment/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		CommentService.service.delete(param);
		redirect("/jf/cms/comment");
	}
	
}


