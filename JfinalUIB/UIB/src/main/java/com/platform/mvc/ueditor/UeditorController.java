package com.platform.mvc.ueditor;

import java.io.File;

import com.baidu.ueditor.ActionEnter;
import com.jfinal.kit.PathKit;
import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;

/**
 * Ueditor编辑器
 */
@SuppressWarnings("unused")
@Controller({"/platform/ueditor"})
public class UeditorController extends BaseController {

	private static final Log log = Log.getLog(UeditorController.class);
	
	public void index() {
		String htmlText = new ActionEnter( getRequest(), PathKit.getWebRootPath() + File.separator ).exec();
		renderHtml(htmlText);
	}
	
}
