package little.ant.weixin.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.controller.BaseController;
import little.ant.weixin.model.LocationModel;
import little.ant.weixin.service.LocationService;

import org.apache.log4j.Logger;

/**
 * 位置管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/wx/location")
public class LocationController extends BaseController {

	private static Logger log = Logger.getLogger(LocationController.class);
	
	private LocationService locationService = new LocationService();
	
	public void index(){
		log.debug("微信用户位置管理：分页");
		locationService.list(splitPage);
		render("/weiXin/location/list.html");
	}
	
	public void delete() {
		LocationModel.dao.deleteById(getPara());
		redirect("/jf/wx/location");
	}
	
}
