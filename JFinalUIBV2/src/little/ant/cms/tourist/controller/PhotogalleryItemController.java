package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.PhotogalleryItemService;
import little.ant.cms.tourist.validator.PhotogalleryItemValidator;
import little.ant.cms.model.PhotogalleryItem;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/photogalleryItem
 * /jf/cms/tourist/photogalleryItem/save
 * /jf/cms/tourist/photogalleryItem/edit
 * /jf/cms/tourist/photogalleryItem/update
 * /jf/cms/tourist/photogalleryItem/view
 * /jf/cms/tourist/photogalleryItem/delete
 * /common/photogalleryItem/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/photogalleryItem")
public class PhotogalleryItemController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryItemController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		PhotogalleryItemService.service.list(splitPage);
		render("/cms/tourist/photogalleryItem/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(PhotogalleryItemValidator.class)
	public void save() {
		getModel(PhotogalleryItem.class).save();
		render("/cms/tourist/photogalleryItem/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		PhotogalleryItem photogalleryItem = PhotogalleryItem.dao.findById(getPara());
		setAttr("photogalleryItem", photogalleryItem);
		render("/cms/tourist/photogalleryItem/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(PhotogalleryItemValidator.class)
	public void update() {
		getModel(PhotogalleryItem.class).update();
		redirect("/jf/cms/tourist/photogalleryItem");
	}

	/**
	 * 查看
	 */
	public void view() {
		PhotogalleryItem photogalleryItem = PhotogalleryItem.dao.findById(getPara());
		setAttr("photogalleryItem", photogalleryItem);
		render("/cms/tourist/photogalleryItem/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		PhotogalleryItemService.service.delete(param);
		redirect("/jf/cms/tourist/photogalleryItem");
	}
	
}


