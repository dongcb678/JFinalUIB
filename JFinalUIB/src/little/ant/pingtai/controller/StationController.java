package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.StationModel;
import little.ant.pingtai.service.StationService;
import little.ant.pingtai.validator.StationValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/station")
public class StationController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(StationController.class);
	
	private StationService stationService = new StationService();
	
	private String pIds;
	private String names;
	private int orderIds;

	private String moduleIds;
	private String operatorIds;
	
	public void index() {
		render("/pingtai/station/tree.html");
	}
	
	public void treeData()  {
		String jsonText = stationService.childNodeData(ids);
		renderJson(jsonText);
	}
	
	@Before(StationValidator.class)
	public void save() {
		ids = stationService.save(pIds, names, orderIds);
		renderText(ids);
	}
	
	@Before(StationValidator.class)
	public void update() {
		stationService.update(ids, pIds, names);
		renderText(ids);
	}
	
	public void delete() {
		stationService.delete(ids);
		renderText(ids);
	}

	public void getOperator(){
		StationModel station = StationModel.dao.findById(ids);
		renderJson(station);
	}

	public void setOperator(){
		stationService.setOperator(ids, moduleIds, operatorIds);
		renderJson(ids);
	}
	
}


