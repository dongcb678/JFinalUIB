package com.platform.mvc.ueditor;

import java.io.File;

import org.apache.log4j.Logger;

import com.baidu.ueditor.ActionEnter;
import com.jfinal.kit.PathKit;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;

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
