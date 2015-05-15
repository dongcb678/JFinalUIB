package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.PhotogalleryItemService;
import little.ant.cms.admin.validator.PhotogalleryItemValidator;
import little.ant.cms.model.PhotogalleryItem;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/photogalleryItem
 * /jf/cms/photogalleryItem/save
 * /jf/cms/photogalleryItem/edit
 * /jf/cms/photogalleryItem/update
 * /jf/cms/photogalleryItem/view
 * /jf/cms/photogalleryItem/delete
 * /common/photogalleryItem/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/photogalleryItem")
public class PhotogalleryItemController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryItemController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		PhotogalleryItemService.service.list(splitPage);
		render("/cms/photogalleryItem/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(PhotogalleryItemValidator.class)
	public void save() {
		getModel(PhotogalleryItem.class).save();
		render("/cms/photogalleryItem/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		PhotogalleryItem photogalleryItem = PhotogalleryItem.dao.findById(getPara());
		setAttr("photogalleryItem", photogalleryItem);
		render("/cms/photogalleryItem/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(PhotogalleryItemValidator.class)
	public void update() {
		getModel(PhotogalleryItem.class).update();
		redirect("/jf/cms/photogalleryItem");
	}

	/**
	 * 查看
	 */
	public void view() {
		PhotogalleryItem photogalleryItem = PhotogalleryItem.dao.findById(getPara());
		setAttr("photogalleryItem", photogalleryItem);
		render("/cms/photogalleryItem/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		PhotogalleryItemService.service.delete(param);
		redirect("/jf/cms/photogalleryItem");
	}
	
}


