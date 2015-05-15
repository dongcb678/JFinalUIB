package little.ant.blog.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.admin.service.ArticleService;
import little.ant.blog.admin.validator.ArticleValidator;
import little.ant.blog.model.Article;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/admin/article
 * /jf/blog/admin/article/save
 * /jf/blog/admin/article/edit
 * /jf/blog/admin/article/update
 * /jf/blog/admin/article/view
 * /jf/blog/admin/article/delete
 * /common/admin/article/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/admin/article")
public class ArticleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ArticleController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		ArticleService.service.list(splitPage);
		render("/blog/admin/article/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(ArticleValidator.class)
	public void save() {
		getModel(Article.class).save();
		render("/blog/admin/article/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Article article = Article.dao.findById(getPara());
		setAttr("article", article);
		render("/blog/admin/article/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(ArticleValidator.class)
	public void update() {
		getModel(Article.class).update();
		redirect("/jf/blog/admin/article");
	}

	/**
	 * 查看
	 */
	public void view() {
		Article article = Article.dao.findById(getPara());
		setAttr("article", article);
		render("/blog/admin/article/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		ArticleService.service.delete(param);
		redirect("/jf/blog/admin/article");
	}
	
}


