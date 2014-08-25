package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.Dict;
import little.ant.pingtai.service.DictService;
import little.ant.pingtai.tools.ToolSqlXml;
import little.ant.pingtai.validator.DictValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/dict")
public class DictController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DictController.class);
	
	public void index() {
		String sql = ToolSqlXml.getSql("pingtai.dict.treeTableNodeRoot");
		list = Dict.dao.find(sql);
		render("/pingtai/dict/treeTable.html");
	}
	
	public void treeTable() {
		String sql = ToolSqlXml.getSql("pingtai.dict.treeTableChildNode");
		list = Dict.dao.find(sql, ids);
		render("/pingtai/dict/treeTableSub.html");
	}

	public void treeData()  {
		String jsonText = DictService.service.childNodeData(ids);
		renderJson(jsonText);
	}
	
	@Before(DictValidator.class)
	public void save() {
		DictService.service.save(getModel(Dict.class));
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
		DictService.service.update(getModel(Dict.class));
		redirect("/jf/dict/toUrl?toUrl=/pingtai/dict/treeTableIframe.html", true);
	}
	
	public void delete() {
		DictService.service.delete(getPara());
		redirect("/jf/dict/toUrl?toUrl=/pingtai/dict/treeTableIframe.html");
	}

	public void view() {
		Dict dict = Dict.dao.findById(getPara());
		String pIds = dict.getStr("parentids");
		Dict parent = Dict.dao.findById(pIds);
		setAttr("dict", dict.put("parentnames", parent.getStr("names")));
		render("/pingtai/dict/view.html");
	}

}


