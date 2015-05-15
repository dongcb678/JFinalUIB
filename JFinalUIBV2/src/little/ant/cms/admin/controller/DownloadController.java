package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.DownloadService;
import little.ant.cms.admin.validator.DownloadValidator;
import little.ant.cms.model.Download;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/admin/download
 * /jf/cms/admin/download/save
 * /jf/cms/admin/download/edit
 * /jf/cms/admin/download/update
 * /jf/cms/admin/download/view
 * /jf/cms/admin/download/delete
 * /common/admin/download/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/download")
public class DownloadController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DownloadController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		DownloadService.service.list(splitPage);
		render("/cms/admin/download/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(DownloadValidator.class)
	public void save() {
		getModel(Download.class).save();
		render("/cms/admin/download/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Download download = Download.dao.findById(getPara());
		setAttr("download", download);
		render("/cms/admin/download/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(DownloadValidator.class)
	public void update() {
		getModel(Download.class).update();
		redirect("/jf/cms/admin/download");
	}

	/**
	 * 查看
	 */
	public void view() {
		Download download = Download.dao.findById(getPara());
		setAttr("download", download);
		render("/cms/admin/download/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		DownloadService.service.delete(param);
		redirect("/jf/cms/admin/download");
	}
	
}


