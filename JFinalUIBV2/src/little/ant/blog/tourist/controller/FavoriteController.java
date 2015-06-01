package little.ant.blog.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.tourist.service.FavoriteService;
import little.ant.blog.tourist.validator.FavoriteValidator;
import little.ant.blog.model.Favorite;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/tourist/favorite
 * /jf/blog/tourist/favorite/save
 * /jf/blog/tourist/favorite/edit
 * /jf/blog/tourist/favorite/update
 * /jf/blog/tourist/favorite/view
 * /jf/blog/tourist/favorite/delete
 * /common/favorite/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/tourist/favorite")
public class FavoriteController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(FavoriteController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		FavoriteService.service.list(splitPage);
		render("/blog/tourist/favorite/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(FavoriteValidator.class)
	public void save() {
		getModel(Favorite.class).save();
		render("/blog/tourist/favorite/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Favorite favorite = Favorite.dao.findById(getPara());
		setAttr("favorite", favorite);
		render("/blog/tourist/favorite/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(FavoriteValidator.class)
	public void update() {
		getModel(Favorite.class).update();
		redirect("/jf/blog/tourist/favorite");
	}

	/**
	 * 查看
	 */
	public void view() {
		Favorite favorite = Favorite.dao.findById(getPara());
		setAttr("favorite", favorite);
		render("/blog/tourist/favorite/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		FavoriteService.service.delete(param);
		redirect("/jf/blog/tourist/favorite");
	}
	
}


