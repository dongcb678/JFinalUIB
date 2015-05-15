package little.ant.common.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.admin.service.AdService;
import little.ant.common.admin.validator.AdValidator;
import little.ant.common.model.Ad;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/admin/ad
 * /jf/common/admin/ad/save
 * /jf/common/admin/ad/edit
 * /jf/common/admin/ad/update
 * /jf/common/admin/ad/view
 * /jf/common/admin/ad/delete
 * /common/admin/ad/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/admin/ad")
public class AdController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AdController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		AdService.service.list(splitPage);
		render("/common/admin/ad/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(AdValidator.class)
	public void save() {
		Ad ad = getModel(Ad.class);
		AdService.service.save(ad, getCUserIds());
		render("/common/admin/ad/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Ad ad = Ad.dao.findById(getPara());
		setAttr("ad", ad);
		render("/common/admin/ad/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(AdValidator.class)
	public void update() {
		getModel(Ad.class).update();
		redirect("/jf/common/admin/ad");
	}

	/**
	 * 查看
	 */
	public void view() {
		Ad ad = Ad.dao.findById(getPara());
		setAttr("ad", ad);
		render("/common/admin/ad/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		AdService.service.delete(param);
		redirect("/jf/common/admin/ad");
	}
	
}


