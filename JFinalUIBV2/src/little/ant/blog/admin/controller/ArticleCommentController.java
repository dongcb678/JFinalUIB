package little.ant.blog.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.admin.service.ArticleCommentService;
import little.ant.blog.admin.validator.ArticleCommentValidator;
import little.ant.blog.model.ArticleComment;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/admin/articleComment
 * /jf/blog/admin/articleComment/save
 * /jf/blog/admin/articleComment/edit
 * /jf/blog/admin/articleComment/update
 * /jf/blog/admin/articleComment/view
 * /jf/blog/admin/articleComment/delete
 * /common/admin/articleComment/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/admin/articleComment")
public class ArticleCommentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ArticleCommentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		ArticleCommentService.service.list(splitPage);
		render("/blog/admin/articleComment/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(ArticleCommentValidator.class)
	public void save() {
		getModel(ArticleComment.class).save();
		render("/blog/admin/articleComment/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		ArticleComment articleComment = ArticleComment.dao.findById(getPara());
		setAttr("articleComment", articleComment);
		render("/blog/admin/articleComment/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(ArticleCommentValidator.class)
	public void update() {
		getModel(ArticleComment.class).update();
		redirect("/jf/blog/admin/articleComment");
	}

	/**
	 * 查看
	 */
	public void view() {
		ArticleComment articleComment = ArticleComment.dao.findById(getPara());
		setAttr("articleComment", articleComment);
		render("/blog/admin/articleComment/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		ArticleCommentService.service.delete(param);
		redirect("/jf/blog/admin/articleComment");
	}
	
}


