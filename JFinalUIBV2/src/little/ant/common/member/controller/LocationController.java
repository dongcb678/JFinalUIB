package little.ant.common.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.member.service.LocationService;
import little.ant.common.member.validator.LocationValidator;
import little.ant.common.model.Location;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/member/location
 * /jf/common/member/location/save
 * /jf/common/member/location/edit
 * /jf/common/member/location/update
 * /jf/common/member/location/view
 * /jf/common/member/location/delete
 * /common/location/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/member/location")
public class LocationController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LocationController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		LocationService.service.list(splitPage);
		render("/common/member/location/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(LocationValidator.class)
	public void save() {
		getModel(Location.class).save();
		render("/common/member/location/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Location location = Location.dao.findById(getPara());
		setAttr("location", location);
		render("/common/member/location/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(LocationValidator.class)
	public void update() {
		getModel(Location.class).update();
		redirect("/jf/common/member/location");
	}

	/**
	 * 查看
	 */
	public void view() {
		Location location = Location.dao.findById(getPara());
		setAttr("location", location);
		render("/common/member/location/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		LocationService.service.delete(param);
		redirect("/jf/common/member/location");
	}
	
}


