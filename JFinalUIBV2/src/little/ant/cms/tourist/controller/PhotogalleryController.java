package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.PhotogalleryService;
import little.ant.cms.tourist.validator.PhotogalleryValidator;
import little.ant.cms.model.Photogallery;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/photogallery
 * /jf/cms/tourist/photogallery/save
 * /jf/cms/tourist/photogallery/edit
 * /jf/cms/tourist/photogallery/update
 * /jf/cms/tourist/photogallery/view
 * /jf/cms/tourist/photogallery/delete
 * /common/photogallery/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/photogallery")
public class PhotogalleryController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		PhotogalleryService.service.list(splitPage);
		render("/cms/tourist/photogallery/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(PhotogalleryValidator.class)
	public void save() {
		getModel(Photogallery.class).save();
		render("/cms/tourist/photogallery/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Photogallery photogallery = Photogallery.dao.findById(getPara());
		setAttr("photogallery", photogallery);
		render("/cms/tourist/photogallery/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(PhotogalleryValidator.class)
	public void update() {
		getModel(Photogallery.class).update();
		redirect("/jf/cms/tourist/photogallery");
	}

	/**
	 * 查看
	 */
	public void view() {
		Photogallery photogallery = Photogallery.dao.findById(getPara());
		setAttr("photogallery", photogallery);
		render("/cms/tourist/photogallery/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		PhotogalleryService.service.delete(param);
		redirect("/jf/cms/tourist/photogallery");
	}
	
}


