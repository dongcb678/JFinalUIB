package little.ant.common.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.admin.service.LocationService;
import little.ant.common.admin.validator.LocationValidator;
import little.ant.common.model.Location;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 广告位置管理	
 * 描述：
 */
@Controller(controllerKey = "/jf/common/admin/location")
public class LocationController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LocationController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		LocationService.service.list(splitPage);
		render("/common/admin/location/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(LocationValidator.class)
	public void save() {
		Location location = getModel(Location.class);
		LocationService.service.save(location, getCUserIds());
		render("/common/admin/location/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Location location = Location.dao.findById(getPara());
		setAttr("location", location);
		render("/common/admin/location/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(LocationValidator.class)
	public void update() {
		getModel(Location.class).update();
		redirect("/jf/common/admin/location");
	}

	/**
	 * 查看
	 */
	public void view() {
		Location location = Location.dao.findById(getPara());
		setAttr("location", location);
		render("/common/admin/location/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		LocationService.service.delete(param);
		redirect("/jf/common/admin/location");
	}
	
}


