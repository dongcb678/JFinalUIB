package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.DownloadService;
import little.ant.cms.tourist.validator.DownloadValidator;
import little.ant.cms.model.Download;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/download
 * /jf/cms/tourist/download/save
 * /jf/cms/tourist/download/edit
 * /jf/cms/tourist/download/update
 * /jf/cms/tourist/download/view
 * /jf/cms/tourist/download/delete
 * /common/download/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/download")
public class DownloadController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DownloadController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		DownloadService.service.list(splitPage);
		render("/cms/tourist/download/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(DownloadValidator.class)
	public void save() {
		getModel(Download.class).save();
		render("/cms/tourist/download/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Download download = Download.dao.findById(getPara());
		setAttr("download", download);
		render("/cms/tourist/download/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(DownloadValidator.class)
	public void update() {
		getModel(Download.class).update();
		redirect("/jf/cms/tourist/download");
	}

	/**
	 * 查看
	 */
	public void view() {
		Download download = Download.dao.findById(getPara());
		setAttr("download", download);
		render("/cms/tourist/download/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		DownloadService.service.delete(param);
		redirect("/jf/cms/tourist/download");
	}
	
}


