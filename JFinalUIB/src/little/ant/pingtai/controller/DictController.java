package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.Dict;
import little.ant.pingtai.service.DictService;
import little.ant.pingtai.validator.DictValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/dict")
public class DictController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DictController.class);
	
	private DictService dictService = new DictService();
	
	public void index() {
		list = Dict.dao.find("select * from pt_dict where parentids is null order by orderIds asc");
		render("/pingtai/dict/treeTable.html");
	}
	
	public void treeTable() {
		list = Dict.dao.find("select * from pt_dict where parentids=? order by orderIds asc", ids);
		render("/pingtai/dict/treeTableSub.html");
	}

	public void treeData()  {
		String jsonText = dictService.childNodeData(ids);
		renderJson(jsonText);
	}
	
	@Before(DictValidator.class)
	public void save() {
		dictService.save(getModel(Dict.class));
		redirect("/jf/dict/toUrl?toUrl=/pingtai/dict/treeTableIframe.html");
	}
	
	public void edit() {
		Dict dict = Dict.dao.findById(getPara());
		String pIds = dict.getStr("parentids");
		Dict parent = Dict.dao.findById(pIds);
		setAttr("dict", dict.put("parentnames", parent.getStr("names")));
		render("/pingtai/dict/update.html");
	}
	
	@Before(DictValidator.class)
	public void update() {
		dictService.update(getModel(Dict.class));
		redirect("/jf/dict/toUrl?toUrl=/pingtai/dict/treeTableIframe.html", true);
	}
	
	public void delete() {
		dictService.delete(getPara());
		redirect("/jf/dict/toUrl?toUrl=/pingtai/dict/treeTableIframe.html");
	}

}


