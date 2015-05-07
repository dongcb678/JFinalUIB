package little.ant.platform.controller;

import java.io.File;

import little.ant.platform.annotation.Controller;

import org.apache.log4j.Logger;

import com.baidu.ueditor.ActionEnter;
import com.jfinal.kit.PathKit;

/**
 * Ueditor编辑器
 */
@SuppressWarnings("unused")
@Controller(controllerKey = {"/jf/platform/ueditor"})
public class UeditorController extends BaseController {

	private static Logger log = Logger.getLogger(UeditorController.class);
	
	public void index() {
		String htmlText = new ActionEnter( getRequest(), PathKit.getWebRootPath() + File.separator ).exec();
		renderHtml(htmlText);
	}
	
}
