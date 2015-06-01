package little.ant.blog.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.member.service.FavoriteService;
import little.ant.blog.member.validator.FavoriteValidator;
import little.ant.blog.model.Favorite;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/member/favorite
 * /jf/blog/member/favorite/save
 * /jf/blog/member/favorite/edit
 * /jf/blog/member/favorite/update
 * /jf/blog/member/favorite/view
 * /jf/blog/member/favorite/delete
 * /common/favorite/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/member/favorite")
public class FavoriteController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(FavoriteController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		FavoriteService.service.list(splitPage);
		render("/blog/member/favorite/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(FavoriteValidator.class)
	public void save() {
		getModel(Favorite.class).save();
		render("/blog/member/favorite/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Favorite favorite = Favorite.dao.findById(getPara());
		setAttr("favorite", favorite);
		render("/blog/member/favorite/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(FavoriteValidator.class)
	public void update() {
		getModel(Favorite.class).update();
		redirect("/jf/blog/member/favorite");
	}

	/**
	 * 查看
	 */
	public void view() {
		Favorite favorite = Favorite.dao.findById(getPara());
		setAttr("favorite", favorite);
		render("/blog/member/favorite/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		FavoriteService.service.delete(param);
		redirect("/jf/blog/member/favorite");
	}
	
}


