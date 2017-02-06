package com.platform.mvc.param;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseController;

/**
 * 参数管理
 * @author 董华健
 */
@Controller("/platform/param")
public class ParamController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ParamController.class);
	
	private ParamService paramService;
	
	/**
	 * 参数管理treeTable首页
	 */
	public void index() {
		String sql = getSqlMy(Param.sqlId_treeTableNodeRoot);
		list = Param.dao.find(sql);
		render("/platform/param/treeTable.html");
	}

	/**
	 * 参数管理treeTable数据
	 */
	public void treeTable() {
		String sql = getSqlMy(Param.sqlId_treeTableChildNode);
		list = Param.dao.find(sql, ids);
		render("/platform/param/treeTableSub.html");
	}

	/**
	 * 参数管理ztree数据
	 */
	public void treeData()  {
		List<ZtreeNode> nodeList = paramService.childNodeData(getCxt(), ids);
		renderJson(nodeList);
	}

	/**
	 * 保存参数
	 */
	@Before(ParamValidator.class)
	public void save() {
		paramService.save(getModel(Param.class));
		redirect("/platform/param/toUrl?toUrl=/platform/param/treeTableIframe.html");
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
		paramService.update(getModel(Param.class));
		redirect("/platform/param/toUrl?toUrl=/platform/param/treeTableIframe.html", true);
	}

	/**
	 * 删除参数
	 */
	public void delete() {
		paramService.delete(getPara() == null ? ids : getPara());
		redirect("/platform/param/toUrl?toUrl=/platform/param/treeTableIframe.html");
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


