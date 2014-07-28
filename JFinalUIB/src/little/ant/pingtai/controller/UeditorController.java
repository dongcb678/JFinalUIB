package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;

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
		String htmlText = new ActionEnter( getRequest(), PathKit.getWebRootPath() ).exec();
		renderHtml(htmlText);
	}
	
}
