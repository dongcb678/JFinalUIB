package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.PhotogalleryService;
import little.ant.cms.admin.validator.PhotogalleryValidator;
import little.ant.cms.model.Photogallery;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/admin/photogallery
 * /jf/cms/admin/photogallery/save
 * /jf/cms/admin/photogallery/edit
 * /jf/cms/admin/photogallery/update
 * /jf/cms/admin/photogallery/view
 * /jf/cms/admin/photogallery/delete
 * /common/admin/photogallery/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/photogallery")
public class PhotogalleryController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		PhotogalleryService.service.list(splitPage);
		render("/cms/admin/photogallery/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(PhotogalleryValidator.class)
	public void save() {
		getModel(Photogallery.class).save();
		render("/cms/admin/photogallery/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Photogallery photogallery = Photogallery.dao.findById(getPara());
		setAttr("photogallery", photogallery);
		render("/cms/admin/photogallery/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(PhotogalleryValidator.class)
	public void update() {
		getModel(Photogallery.class).update();
		redirect("/jf/cms/admin/photogallery");
	}

	/**
	 * 查看
	 */
	public void view() {
		Photogallery photogallery = Photogallery.dao.findById(getPara());
		setAttr("photogallery", photogallery);
		render("/cms/admin/photogallery/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		PhotogalleryService.service.delete(param);
		redirect("/jf/cms/admin/photogallery");
	}
	
}


