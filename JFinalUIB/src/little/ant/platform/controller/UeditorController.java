package little.ant.platform.controller;

import java.io.File;

import little.ant.platform.annotation.Controller;

import org.apache.log4j.Logger;

import com.baidu.ueditor.ActionEnter;
import com.jfinal.kit.PathKit;

/**
 * Ueditor
 */
@SuppressWarnings("unused")
@Controller(controllerKey = {"/jf/ueditor"})
public class UeditorController extends BaseController {

	private static Logger log = Logger.getLogger(UeditorController.class);
	
	public void index() {
		String htmlText = new ActionEnter( getRequest(), PathKit.getWebRootPath() + File.separator ).exec();
		renderHtml(htmlText);
	}
	
}
