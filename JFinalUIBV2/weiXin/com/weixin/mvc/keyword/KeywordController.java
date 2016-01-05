package com.weixin.mvc.keyword;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseController;

/**
 * 自动回复管理
 * @author 董华健
 */
//@Controller(controllerKey = "/jf/wx/keyword")
public class KeywordController extends BaseController {

	private static Logger log = Logger.getLogger(KeywordController.class);
	
	public void index(){
		log.debug("微信自动回复管理：分页");
		paging(ConstantInit.db_dataSource_main, splitPage, Keyword.sqlId_splitPage);
		render("/weiXin/keyword/list.html");
	}
	
	@Before(KeywordValidator.class)
	public void save() {
		ids = KeywordService.service.save(getModel(Keyword.class));
		redirect("/jf/wx/keyword");
	}
	
	public void edit() {
		setAttr("group", Keyword.dao.findById(getPara()));
		render("/weiXin/keyword/update.html");
	}
	
	@Before(KeywordValidator.class)
	public void update() {
		KeywordService.service.update(getModel(Keyword.class));
		redirect("/jf/wx/keyword");
	}
	
	public void delete() {
		KeywordService.service.delete(getPara());
		redirect("/jf/wx/keyword");
	}
}
