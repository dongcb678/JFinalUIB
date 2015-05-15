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
 * /jf/blog/articleComment
 * /jf/blog/articleComment/save
 * /jf/blog/articleComment/edit
 * /jf/blog/articleComment/update
 * /jf/blog/articleComment/view
 * /jf/blog/articleComment/delete
 * /common/articleComment/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/articleComment")
public class ArticleCommentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ArticleCommentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		ArticleCommentService.service.list(splitPage);
		render("/blog/articleComment/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(ArticleCommentValidator.class)
	public void save() {
		getModel(ArticleComment.class).save();
		render("/blog/articleComment/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		ArticleComment articleComment = ArticleComment.dao.findById(getPara());
		setAttr("articleComment", articleComment);
		render("/blog/articleComment/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(ArticleCommentValidator.class)
	public void update() {
		getModel(ArticleComment.class).update();
		redirect("/jf/blog/articleComment");
	}

	/**
	 * 查看
	 */
	public void view() {
		ArticleComment articleComment = ArticleComment.dao.findById(getPara());
		setAttr("articleComment", articleComment);
		render("/blog/articleComment/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		ArticleCommentService.service.delete(param);
		redirect("/jf/blog/articleComment");
	}
	
}


