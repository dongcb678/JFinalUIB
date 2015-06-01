package little.ant.cms.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.member.service.PhotogalleryItemService;
import little.ant.cms.member.validator.PhotogalleryItemValidator;
import little.ant.cms.model.PhotogalleryItem;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/member/photogalleryItem
 * /jf/cms/member/photogalleryItem/save
 * /jf/cms/member/photogalleryItem/edit
 * /jf/cms/member/photogalleryItem/update
 * /jf/cms/member/photogalleryItem/view
 * /jf/cms/member/photogalleryItem/delete
 * /common/photogalleryItem/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/member/photogalleryItem")
public class PhotogalleryItemController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryItemController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		PhotogalleryItemService.service.list(splitPage);
		render("/cms/member/photogalleryItem/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(PhotogalleryItemValidator.class)
	public void save() {
		getModel(PhotogalleryItem.class).save();
		render("/cms/member/photogalleryItem/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		PhotogalleryItem photogalleryItem = PhotogalleryItem.dao.findById(getPara());
		setAttr("photogalleryItem", photogalleryItem);
		render("/cms/member/photogalleryItem/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(PhotogalleryItemValidator.class)
	public void update() {
		getModel(PhotogalleryItem.class).update();
		redirect("/jf/cms/member/photogalleryItem");
	}

	/**
	 * 查看
	 */
	public void view() {
		PhotogalleryItem photogalleryItem = PhotogalleryItem.dao.findById(getPara());
		setAttr("photogalleryItem", photogalleryItem);
		render("/cms/member/photogalleryItem/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		PhotogalleryItemService.service.delete(param);
		redirect("/jf/cms/member/photogalleryItem");
	}
	
}


