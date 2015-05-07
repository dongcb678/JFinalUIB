package little.ant.cms.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.service.DownloadService;
import little.ant.cms.validator.DownloadValidator;
import little.ant.cms.model.Download;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/download
 * /jf/cms/download/save
 * /jf/cms/download/edit
 * /jf/cms/download/update
 * /jf/cms/download/view
 * /jf/cms/download/delete
 * /common/download/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/download")
public class DownloadController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DownloadController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		DownloadService.service.list(splitPage);
		render("/cms/download/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(DownloadValidator.class)
	public void save() {
		getModel(Download.class).save();
		render("/cms/download/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Download download = Download.dao.findById(getPara());
		setAttr("download", download);
		render("/cms/download/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(DownloadValidator.class)
	public void update() {
		getModel(Download.class).update();
		redirect("/jf/cms/download");
	}

	/**
	 * 查看
	 */
	public void view() {
		Download download = Download.dao.findById(getPara());
		setAttr("download", download);
		render("/cms/download/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		DownloadService.service.delete(param);
		redirect("/jf/cms/download");
	}
	
}


