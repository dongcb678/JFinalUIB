package little.ant.common.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.tourist.service.AdService;
import little.ant.common.tourist.validator.AdValidator;
import little.ant.common.model.Ad;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/tourist/ad
 * /jf/common/tourist/ad/save
 * /jf/common/tourist/ad/edit
 * /jf/common/tourist/ad/update
 * /jf/common/tourist/ad/view
 * /jf/common/tourist/ad/delete
 * /common/ad/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/tourist/ad")
public class AdController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AdController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		AdService.service.list(splitPage);
		render("/common/tourist/ad/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(AdValidator.class)
	public void save() {
		getModel(Ad.class).save();
		render("/common/tourist/ad/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Ad ad = Ad.dao.findById(getPara());
		setAttr("ad", ad);
		render("/common/tourist/ad/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(AdValidator.class)
	public void update() {
		getModel(Ad.class).update();
		redirect("/jf/common/tourist/ad");
	}

	/**
	 * 查看
	 */
	public void view() {
		Ad ad = Ad.dao.findById(getPara());
		setAttr("ad", ad);
		render("/common/tourist/ad/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		AdService.service.delete(param);
		redirect("/jf/common/tourist/ad");
	}
	
}


