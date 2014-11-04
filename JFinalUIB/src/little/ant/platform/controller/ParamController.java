package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.model.Param;
import little.ant.platform.service.ParamService;
import little.ant.platform.tools.ToolSqlXml;
import little.ant.platform.validator.ParamValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/platform/param")
public class ParamController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ParamController.class);
	
	public void index() {
		String sql = ToolSqlXml.getSql("platform.param.treeTableNodeRoot");
		list = Param.dao.find(sql);
		render("/platform/param/treeTable.html");
	}
	
	public void treeTable() {
		String sql = ToolSqlXml.getSql("platform.param.treeTableChildNode");
		list = Param.dao.find(sql, ids);
		render("/platform/param/treeTableSub.html");
	}

	public void treeData()  {
		String jsonText = ParamService.service.childNodeData(ids);
		renderJson(jsonText);
	}
	
	@Before(ParamValidator.class)
	public void save() {
		ParamService.service.save(getModel(Param.class));
		redirect("/jf/platform/param/toUrl?toUrl=/platform/param/treeTableIframe.html");
	}
	
	public void edit() {
		Param param = Param.dao.findById(getPara());
		String pIds = param.getStr("parentids");
		Param parent = Param.dao.findById(pIds);
		setAttr("param", param.put("parentnames", parent.getStr("names")));
		render("/platform/param/update.html");
	}
	
	@Before(ParamValidator.class)
	public void update() {
		ParamService.service.update(getModel(Param.class));
		redirect("/jf/platform/param/toUrl?toUrl=/platform/param/treeTableIframe.html", true);
	}
	
	public void delete() {
		ParamService.service.delete(getPara());
		redirect("/jf/platform/param/toUrl?toUrl=/platform/param/treeTableIframe.html");
	}

	public void view() {
		Param param = Param.dao.findById(getPara());
		String pIds = param.getStr("parentids");
		Param parent = Param.dao.findById(pIds);
		setAttr("param", param.put("parentnames", parent.getStr("names")));
		render("/platform/param/view.html");
	}

}


