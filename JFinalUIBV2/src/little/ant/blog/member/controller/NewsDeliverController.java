package little.ant.blog.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.member.service.NewsDeliverService;
import little.ant.blog.member.validator.NewsDeliverValidator;
import little.ant.blog.model.NewsDeliver;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/member/newsDeliver
 * /jf/blog/member/newsDeliver/save
 * /jf/blog/member/newsDeliver/edit
 * /jf/blog/member/newsDeliver/update
 * /jf/blog/member/newsDeliver/view
 * /jf/blog/member/newsDeliver/delete
 * /common/newsDeliver/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/member/newsDeliver")
public class NewsDeliverController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(NewsDeliverController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		NewsDeliverService.service.list(splitPage);
		render("/blog/member/newsDeliver/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(NewsDeliverValidator.class)
	public void save() {
		getModel(NewsDeliver.class).save();
		render("/blog/member/newsDeliver/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		NewsDeliver newsDeliver = NewsDeliver.dao.findById(getPara());
		setAttr("newsDeliver", newsDeliver);
		render("/blog/member/newsDeliver/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(NewsDeliverValidator.class)
	public void update() {
		getModel(NewsDeliver.class).update();
		redirect("/jf/blog/member/newsDeliver");
	}

	/**
	 * 查看
	 */
	public void view() {
		NewsDeliver newsDeliver = NewsDeliver.dao.findById(getPara());
		setAttr("newsDeliver", newsDeliver);
		render("/blog/member/newsDeliver/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		NewsDeliverService.service.delete(param);
		redirect("/jf/blog/member/newsDeliver");
	}
	
}


