package little.ant.blog.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.tourist.service.ArticleCommentService;
import little.ant.blog.tourist.validator.ArticleCommentValidator;
import little.ant.blog.model.ArticleComment;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/tourist/articleComment
 * /jf/blog/tourist/articleComment/save
 * /jf/blog/tourist/articleComment/edit
 * /jf/blog/tourist/articleComment/update
 * /jf/blog/tourist/articleComment/view
 * /jf/blog/tourist/articleComment/delete
 * /common/articleComment/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/tourist/articleComment")
public class ArticleCommentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ArticleCommentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		ArticleCommentService.service.list(splitPage);
		render("/blog/tourist/articleComment/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(ArticleCommentValidator.class)
	public void save() {
		getModel(ArticleComment.class).save();
		render("/blog/tourist/articleComment/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		ArticleComment articleComment = ArticleComment.dao.findById(getPara());
		setAttr("articleComment", articleComment);
		render("/blog/tourist/articleComment/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(ArticleCommentValidator.class)
	public void update() {
		getModel(ArticleComment.class).update();
		redirect("/jf/blog/tourist/articleComment");
	}

	/**
	 * 查看
	 */
	public void view() {
		ArticleComment articleComment = ArticleComment.dao.findById(getPara());
		setAttr("articleComment", articleComment);
		render("/blog/tourist/articleComment/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		ArticleCommentService.service.delete(param);
		redirect("/jf/blog/tourist/articleComment");
	}
	
}


