package little.ant.weixin.controller;

import org.apache.log4j.Logger;

import little.ant.platform.annotation.Controller;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.controller.BaseController;
import little.ant.platform.model.BaseModel;
import little.ant.weixin.model.Location;

/**
 * 位置管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/wx/location")
public class LocationController extends BaseController {

	private static Logger log = Logger.getLogger(LocationController.class);
	
	public void index(){
		log.debug("微信用户位置管理：分页");
		paging(ConstantInit.db_dataSource_main, splitPage, BaseModel.sqlId_splitPage_select, Location.sqlId_splitPage_from);
		render("/weiXin/location/list.html");
	}
	
	public void delete() {
		Location.dao.deleteById(getPara());
		redirect("/jf/wx/location");
	}
	
}
