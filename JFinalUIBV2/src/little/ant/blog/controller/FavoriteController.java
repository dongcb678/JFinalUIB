package little.ant.blog.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.service.FavoriteService;
import little.ant.blog.validator.FavoriteValidator;
import little.ant.blog.model.Favorite;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/favorite
 * /jf/blog/favorite/save
 * /jf/blog/favorite/edit
 * /jf/blog/favorite/update
 * /jf/blog/favorite/view
 * /jf/blog/favorite/delete
 * /common/favorite/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/favorite")
public class FavoriteController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(FavoriteController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		FavoriteService.service.list(splitPage);
		render("/blog/favorite/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(FavoriteValidator.class)
	public void save() {
		getModel(Favorite.class).save();
		render("/blog/favorite/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Favorite favorite = Favorite.dao.findById(getPara());
		setAttr("favorite", favorite);
		render("/blog/favorite/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(FavoriteValidator.class)
	public void update() {
		getModel(Favorite.class).update();
		redirect("/jf/blog/favorite");
	}

	/**
	 * 查看
	 */
	public void view() {
		Favorite favorite = Favorite.dao.findById(getPara());
		setAttr("favorite", favorite);
		render("/blog/favorite/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		FavoriteService.service.delete(param);
		redirect("/jf/blog/favorite");
	}
	
}


