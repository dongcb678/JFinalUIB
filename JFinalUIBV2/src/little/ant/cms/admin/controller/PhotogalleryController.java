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
 * /jf/cms/photogallery
 * /jf/cms/photogallery/save
 * /jf/cms/photogallery/edit
 * /jf/cms/photogallery/update
 * /jf/cms/photogallery/view
 * /jf/cms/photogallery/delete
 * /common/photogallery/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/photogallery")
public class PhotogalleryController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		PhotogalleryService.service.list(splitPage);
		render("/cms/photogallery/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(PhotogalleryValidator.class)
	public void save() {
		getModel(Photogallery.class).save();
		render("/cms/photogallery/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Photogallery photogallery = Photogallery.dao.findById(getPara());
		setAttr("photogallery", photogallery);
		render("/cms/photogallery/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(PhotogalleryValidator.class)
	public void update() {
		getModel(Photogallery.class).update();
		redirect("/jf/cms/photogallery");
	}

	/**
	 * 查看
	 */
	public void view() {
		Photogallery photogallery = Photogallery.dao.findById(getPara());
		setAttr("photogallery", photogallery);
		render("/cms/photogallery/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		PhotogalleryService.service.delete(param);
		redirect("/jf/cms/photogallery");
	}
	
}


