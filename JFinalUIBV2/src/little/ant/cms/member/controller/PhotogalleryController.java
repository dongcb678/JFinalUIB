package little.ant.cms.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.member.service.PhotogalleryService;
import little.ant.cms.member.validator.PhotogalleryValidator;
import little.ant.cms.model.Photogallery;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/member/photogallery
 * /jf/cms/member/photogallery/save
 * /jf/cms/member/photogallery/edit
 * /jf/cms/member/photogallery/update
 * /jf/cms/member/photogallery/view
 * /jf/cms/member/photogallery/delete
 * /common/photogallery/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/member/photogallery")
public class PhotogalleryController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		PhotogalleryService.service.list(splitPage);
		render("/cms/member/photogallery/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(PhotogalleryValidator.class)
	public void save() {
		getModel(Photogallery.class).save();
		render("/cms/member/photogallery/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Photogallery photogallery = Photogallery.dao.findById(getPara());
		setAttr("photogallery", photogallery);
		render("/cms/member/photogallery/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(PhotogalleryValidator.class)
	public void update() {
		getModel(Photogallery.class).update();
		redirect("/jf/cms/member/photogallery");
	}

	/**
	 * 查看
	 */
	public void view() {
		Photogallery photogallery = Photogallery.dao.findById(getPara());
		setAttr("photogallery", photogallery);
		render("/cms/member/photogallery/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		PhotogalleryService.service.delete(param);
		redirect("/jf/cms/member/photogallery");
	}
	
}


