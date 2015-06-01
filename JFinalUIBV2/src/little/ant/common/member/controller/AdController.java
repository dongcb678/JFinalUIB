package little.ant.common.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.member.service.AdService;
import little.ant.common.member.validator.AdValidator;
import little.ant.common.model.Ad;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/member/ad
 * /jf/common/member/ad/save
 * /jf/common/member/ad/edit
 * /jf/common/member/ad/update
 * /jf/common/member/ad/view
 * /jf/common/member/ad/delete
 * /common/ad/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/member/ad")
public class AdController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AdController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		AdService.service.list(splitPage);
		render("/common/member/ad/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(AdValidator.class)
	public void save() {
		getModel(Ad.class).save();
		render("/common/member/ad/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Ad ad = Ad.dao.findById(getPara());
		setAttr("ad", ad);
		render("/common/member/ad/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(AdValidator.class)
	public void update() {
		getModel(Ad.class).update();
		redirect("/jf/common/member/ad");
	}

	/**
	 * 查看
	 */
	public void view() {
		Ad ad = Ad.dao.findById(getPara());
		setAttr("ad", ad);
		render("/common/member/ad/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		AdService.service.delete(param);
		redirect("/jf/common/member/ad");
	}
	
}


