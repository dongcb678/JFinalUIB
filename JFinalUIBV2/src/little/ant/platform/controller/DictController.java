package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.model.Dict;
import little.ant.platform.service.DictService;
import little.ant.platform.tools.ToolSqlXml;
import little.ant.platform.validator.DictValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 字典管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/platform/dict")
public class DictController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DictController.class);
	
	/**
	 * 首页
	 */
	public void index() {
		String sql = ToolSqlXml.getSql("platform.dict.treeTableNodeRoot");
		list = Dict.dao.find(sql);
		render("/platform/dict/treeTable.html");
	}
	
	/**
	 * treeTable子节点数据获取
	 */
	public void treeTable() {
		String sql = ToolSqlXml.getSql("platform.dict.treeTableChildNode");
		list = Dict.dao.find(sql, ids);
		render("/platform/dict/treeTableSub.html");
	}

	/**
	 * ztree子节点数据获取
	 */
	public void treeData()  {
		String jsonText = DictService.service.childNodeData(ids);
		renderJson(jsonText);
	}
	
	/**
	 * 保存
	 */
	@Before(DictValidator.class)
	public void save() {
		DictService.service.save(getModel(Dict.class));
		redirect("/jf/platform/dict/toUrl?toUrl=/platform/dict/treeTableIframe.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Dict dict = Dict.dao.findById(getPara());
		String pIds = dict.getStr("parentids");
		Dict parent = Dict.dao.findById(pIds);
		setAttr("dict", dict.put("parentnames", parent.getStr("names")));
		render("/platform/dict/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(DictValidator.class)
	public void update() {
		DictService.service.update(getModel(Dict.class));
		redirect("/jf/platform/dict/toUrl?toUrl=/platform/dict/treeTableIframe.html", true);
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		DictService.service.delete(getPara());
		redirect("/jf/platform/dict/toUrl?toUrl=/platform/dict/treeTableIframe.html");
	}

	/**
	 * 查看
	 */
	public void view() {
		Dict dict = Dict.dao.findById(getPara());
		String pIds = dict.getStr("parentids");
		Dict parent = Dict.dao.findById(pIds);
		setAttr("dict", dict.put("parentnames", parent.getStr("names")));
		render("/platform/dict/view.html");
	}

}


