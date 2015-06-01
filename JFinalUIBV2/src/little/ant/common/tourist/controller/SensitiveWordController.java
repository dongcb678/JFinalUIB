package little.ant.common.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.tourist.service.SensitiveWordService;
import little.ant.common.tourist.validator.SensitiveWordValidator;
import little.ant.common.model.SensitiveWord;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/tourist/sensitiveWord
 * /jf/common/tourist/sensitiveWord/save
 * /jf/common/tourist/sensitiveWord/edit
 * /jf/common/tourist/sensitiveWord/update
 * /jf/common/tourist/sensitiveWord/view
 * /jf/common/tourist/sensitiveWord/delete
 * /common/sensitiveWord/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/tourist/sensitiveWord")
public class SensitiveWordController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SensitiveWordController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		SensitiveWordService.service.list(splitPage);
		render("/common/tourist/sensitiveWord/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(SensitiveWordValidator.class)
	public void save() {
		getModel(SensitiveWord.class).save();
		render("/common/tourist/sensitiveWord/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		SensitiveWord sensitiveWord = SensitiveWord.dao.findById(getPara());
		setAttr("sensitiveWord", sensitiveWord);
		render("/common/tourist/sensitiveWord/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(SensitiveWordValidator.class)
	public void update() {
		getModel(SensitiveWord.class).update();
		redirect("/jf/common/tourist/sensitiveWord");
	}

	/**
	 * 查看
	 */
	public void view() {
		SensitiveWord sensitiveWord = SensitiveWord.dao.findById(getPara());
		setAttr("sensitiveWord", sensitiveWord);
		render("/common/tourist/sensitiveWord/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		SensitiveWordService.service.delete(param);
		redirect("/jf/common/tourist/sensitiveWord");
	}
	
}


