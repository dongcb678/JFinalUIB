package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.Param;
import little.ant.pingtai.service.ParamService;
import little.ant.pingtai.tools.ToolSqlXml;
import little.ant.pingtai.validator.ParamValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/param")
public class ParamController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ParamController.class);
	
	private ParamService paramService = new ParamService();
	
	public void index() {
		String sql = ToolSqlXml.getSql("pingtai.param.treeTableNodeRoot");
		list = Param.dao.find(sql);
		render("/pingtai/param/treeTable.html");
	}
	
	public void treeTable() {
		String sql = ToolSqlXml.getSql("pingtai.param.treeTableChildNode");
		list = Param.dao.find(sql, ids);
		render("/pingtai/param/treeTableSub.html");
	}

	public void treeData()  {
		String jsonText = paramService.childNodeData(ids);
		renderJson(jsonText);
	}
	
	@Before(ParamValidator.class)
	public void save() {
		paramService.save(getModel(Param.class));
		redirect("/jf/param/toUrl?toUrl=/pingtai/param/treeTableIframe.html");
	}
	
	public void edit() {
		Param param = Param.dao.findById(getPara());
		String pIds = param.getStr("parentids");
		Param parent = Param.dao.findById(pIds);
		setAttr("param", param.put("parentnames", parent.getStr("names")));
		render("/pingtai/param/update.html");
	}
	
	@Before(ParamValidator.class)
	public void update() {
		paramService.update(getModel(Param.class));
		redirect("/jf/param/toUrl?toUrl=/pingtai/param/treeTableIframe.html", true);
	}
	
	public void delete() {
		paramService.delete(getPara());
		redirect("/jf/param/toUrl?toUrl=/pingtai/param/treeTableIframe.html");
	}

	public void view() {
		Param param = Param.dao.findById(getPara());
		String pIds = param.getStr("parentids");
		Param parent = Param.dao.findById(pIds);
		setAttr("param", param.put("parentnames", parent.getStr("names")));
		render("/pingtai/param/view.html");
	}

}


