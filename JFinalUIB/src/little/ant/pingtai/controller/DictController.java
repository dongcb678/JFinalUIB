package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.DictModel;
import little.ant.pingtai.service.DictService;
import little.ant.pingtai.tools.ToolSqlXml;
import little.ant.pingtai.validator.DictValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/dict")
public class DictController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DictController.class);
	
	private DictService dictService = new DictService();
	
	public void index() {
		String sql = ToolSqlXml.getSql("pingtai.dict.treeTableNodeRoot");
		list = DictModel.dao.find(sql);
		render("/pingtai/dict/treeTable.html");
	}
	
	public void treeTable() {
		String sql = ToolSqlXml.getSql("pingtai.dict.treeTableChildNode");
		list = DictModel.dao.find(sql, ids);
		render("/pingtai/dict/treeTableSub.html");
	}

	public void treeData()  {
		String jsonText = dictService.childNodeData(ids);
		renderJson(jsonText);
	}
	
	@Before(DictValidator.class)
	public void save() {
		dictService.save(getModel(DictModel.class));
		redirect("/jf/dict/toUrl?toUrl=/pingtai/dict/treeTableIframe.html");
	}
	
	public void edit() {
		DictModel dict = DictModel.dao.findById(getPara());
		String pIds = dict.getStr("parentids");
		DictModel parent = DictModel.dao.findById(pIds);
		setAttr("dict", dict.put("parentnames", parent.getStr("names")));
		render("/pingtai/dict/update.html");
	}
	
	@Before(DictValidator.class)
	public void update() {
		dictService.update(getModel(DictModel.class));
		redirect("/jf/dict/toUrl?toUrl=/pingtai/dict/treeTableIframe.html", true);
	}
	
	public void delete() {
		dictService.delete(getPara());
		redirect("/jf/dict/toUrl?toUrl=/pingtai/dict/treeTableIframe.html");
	}

	public void view() {
		DictModel dict = DictModel.dao.findById(getPara());
		String pIds = dict.getStr("parentids");
		DictModel parent = DictModel.dao.findById(pIds);
		setAttr("dict", dict.put("parentnames", parent.getStr("names")));
		render("/pingtai/dict/view.html");
	}

}


