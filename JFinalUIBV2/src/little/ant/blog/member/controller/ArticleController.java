package little.ant.blog.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.member.service.ArticleService;
import little.ant.blog.member.validator.ArticleValidator;
import little.ant.blog.model.Article;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/member/article
 * /jf/blog/member/article/save
 * /jf/blog/member/article/edit
 * /jf/blog/member/article/update
 * /jf/blog/member/article/view
 * /jf/blog/member/article/delete
 * /common/article/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/member/article")
public class ArticleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ArticleController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		ArticleService.service.list(splitPage);
		render("/blog/member/article/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(ArticleValidator.class)
	public void save() {
		getModel(Article.class).save();
		render("/blog/member/article/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Article article = Article.dao.findById(getPara());
		setAttr("article", article);
		render("/blog/member/article/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(ArticleValidator.class)
	public void update() {
		getModel(Article.class).update();
		redirect("/jf/blog/member/article");
	}

	/**
	 * 查看
	 */
	public void view() {
		Article article = Article.dao.findById(getPara());
		setAttr("article", article);
		render("/blog/member/article/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		ArticleService.service.delete(param);
		redirect("/jf/blog/member/article");
	}
	
}


