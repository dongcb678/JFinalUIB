package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.AnnouncementService;
import little.ant.cms.admin.validator.AnnouncementValidator;
import little.ant.cms.model.Announcement;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/announcement
 * /jf/cms/announcement/save
 * /jf/cms/announcement/edit
 * /jf/cms/announcement/update
 * /jf/cms/announcement/view
 * /jf/cms/announcement/delete
 * /common/announcement/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/announcement")
public class AnnouncementController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AnnouncementController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		AnnouncementService.service.list(splitPage);
		render("/cms/announcement/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(AnnouncementValidator.class)
	public void save() {
		getModel(Announcement.class).save();
		render("/cms/announcement/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Announcement announcement = Announcement.dao.findById(getPara());
		setAttr("announcement", announcement);
		render("/cms/announcement/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(AnnouncementValidator.class)
	public void update() {
		getModel(Announcement.class).update();
		redirect("/jf/cms/announcement");
	}

	/**
	 * 查看
	 */
	public void view() {
		Announcement announcement = Announcement.dao.findById(getPara());
		setAttr("announcement", announcement);
		render("/cms/announcement/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		AnnouncementService.service.delete(param);
		redirect("/jf/cms/announcement");
	}
	
}


