package little.ant.platform.controller;

import java.util.List;

import little.ant.platform.annotation.Controller;
import little.ant.platform.dto.ZtreeNode;
import little.ant.platform.model.Param;
import little.ant.platform.service.ParamService;
import little.ant.platform.validator.ParamValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 参数管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/platform/param")
public class ParamController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ParamController.class);
	
	/**
	 * 参数管理treeTable首页
	 */
	public void index() {
		String sql = ParamService.service.getSql(Param.sqlId_treeTableNodeRoot);
		list = Param.dao.find(sql);
		render("/platform/param/treeTable.html");
	}

	/**
	 * 参数管理treeTable数据
	 */
	public void treeTable() {
		String sql = ParamService.service.getSql(Param.sqlId_treeTableChildNode);
		list = Param.dao.find(sql, ids);
		render("/platform/param/treeTableSub.html");
	}

	/**
	 * 参数管理ztree数据
	 */
	public void treeData()  {
		List<ZtreeNode> nodeList = ParamService.service.childNodeData(getCxt(), ids);
		renderJson(nodeList);
	}

	/**
	 * 保存参数
	 */
	@Before(ParamValidator.class)
	public void save() {
		ParamService.service.save(getModel(Param.class));
		redirect("/jf/platform/param/toUrl?toUrl=/platform/param/treeTableIframe.html");
	}

	/**
	 * 准备更新参数
	 */
	public void edit() {
		Param param = Param.dao.findById(getPara());
		String pIds = param.getStr(Param.column_parentids);
		Param parent = Param.dao.findById(pIds);
		setAttr("param", param.put("parentnames", parent.getStr(Param.column_names)));
		render("/platform/param/update.html");
	}

	/**
	 * 更新参数
	 */
	@Before(ParamValidator.class)
	public void update() {
		ParamService.service.update(getModel(Param.class));
		redirect("/jf/platform/param/toUrl?toUrl=/platform/param/treeTableIframe.html", true);
	}

	/**
	 * 删除参数
	 */
	public void delete() {
		ParamService.service.delete(getPara() == null ? ids : getPara());
		redirect("/jf/platform/param/toUrl?toUrl=/platform/param/treeTableIframe.html");
	}

	/**
	 * 参数查看
	 */
	public void view() {
		Param param = Param.dao.findById(getPara());
		String pIds = param.getStr(Param.column_parentids);
		Param parent = Param.dao.findById(pIds);
		setAttr("param", param.put("parentnames", parent.getStr(Param.column_names)));
		render("/platform/param/view.html");
	}

}


