package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.CommentService;
import little.ant.cms.tourist.validator.CommentValidator;
import little.ant.cms.model.Comment;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/comment
 * /jf/cms/tourist/comment/save
 * /jf/cms/tourist/comment/edit
 * /jf/cms/tourist/comment/update
 * /jf/cms/tourist/comment/view
 * /jf/cms/tourist/comment/delete
 * /common/comment/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/comment")
public class CommentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CommentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		CommentService.service.list(splitPage);
		render("/cms/tourist/comment/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(CommentValidator.class)
	public void save() {
		getModel(Comment.class).save();
		render("/cms/tourist/comment/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Comment comment = Comment.dao.findById(getPara());
		setAttr("comment", comment);
		render("/cms/tourist/comment/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(CommentValidator.class)
	public void update() {
		getModel(Comment.class).update();
		redirect("/jf/cms/tourist/comment");
	}

	/**
	 * 查看
	 */
	public void view() {
		Comment comment = Comment.dao.findById(getPara());
		setAttr("comment", comment);
		render("/cms/tourist/comment/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		CommentService.service.delete(param);
		redirect("/jf/cms/tourist/comment");
	}
	
}


