package little.ant.blog.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.admin.service.FavoriteService;
import little.ant.blog.admin.validator.FavoriteValidator;
import little.ant.blog.model.Favorite;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/admin/favorite
 * /jf/blog/admin/favorite/save
 * /jf/blog/admin/favorite/edit
 * /jf/blog/admin/favorite/update
 * /jf/blog/admin/favorite/view
 * /jf/blog/admin/favorite/delete
 * /common/admin/favorite/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/admin/favorite")
public class FavoriteController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(FavoriteController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		FavoriteService.service.list(splitPage);
		render("/blog/admin/favorite/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(FavoriteValidator.class)
	public void save() {
		getModel(Favorite.class).save();
		render("/blog/admin/favorite/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Favorite favorite = Favorite.dao.findById(getPara());
		setAttr("favorite", favorite);
		render("/blog/admin/favorite/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(FavoriteValidator.class)
	public void update() {
		getModel(Favorite.class).update();
		redirect("/jf/blog/admin/favorite");
	}

	/**
	 * 查看
	 */
	public void view() {
		Favorite favorite = Favorite.dao.findById(getPara());
		setAttr("favorite", favorite);
		render("/blog/admin/favorite/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		FavoriteService.service.delete(param);
		redirect("/jf/blog/admin/favorite");
	}
	
}


