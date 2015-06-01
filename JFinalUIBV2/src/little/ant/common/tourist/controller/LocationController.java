package little.ant.common.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.tourist.service.LocationService;
import little.ant.common.tourist.validator.LocationValidator;
import little.ant.common.model.Location;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/tourist/location
 * /jf/common/tourist/location/save
 * /jf/common/tourist/location/edit
 * /jf/common/tourist/location/update
 * /jf/common/tourist/location/view
 * /jf/common/tourist/location/delete
 * /common/location/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/tourist/location")
public class LocationController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LocationController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		LocationService.service.list(splitPage);
		render("/common/tourist/location/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(LocationValidator.class)
	public void save() {
		getModel(Location.class).save();
		render("/common/tourist/location/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Location location = Location.dao.findById(getPara());
		setAttr("location", location);
		render("/common/tourist/location/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(LocationValidator.class)
	public void update() {
		getModel(Location.class).update();
		redirect("/jf/common/tourist/location");
	}

	/**
	 * 查看
	 */
	public void view() {
		Location location = Location.dao.findById(getPara());
		setAttr("location", location);
		render("/common/tourist/location/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		LocationService.service.delete(param);
		redirect("/jf/common/tourist/location");
	}
	
}


