package little.ant.common.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.admin.service.SensitiveWordService;
import little.ant.common.admin.validator.SensitiveWordValidator;
import little.ant.common.model.SensitiveWord;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 敏感词 管理	
 * 描述：
 */
@Controller(controllerKey = "/jf/common/admin/sensitiveWord")
public class SensitiveWordController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SensitiveWordController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		SensitiveWordService.service.list(splitPage);
		render("/common/admin/sensitiveWord/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(SensitiveWordValidator.class)
	public void save() {
		SensitiveWord sensitiveWord = getModel(SensitiveWord.class);
		SensitiveWordService.service.save(sensitiveWord, getCUserIds());
		render("/common/admin/sensitiveWord/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		SensitiveWord sensitiveWord = SensitiveWord.dao.findById(getPara());
		setAttr("sensitiveWord", sensitiveWord);
		render("/common/admin/sensitiveWord/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(SensitiveWordValidator.class)
	public void update() {
		getModel(SensitiveWord.class).update();
		redirect("/jf/common/admin/sensitiveWord");
	}

	/**
	 * 查看
	 */
	public void view() {
		SensitiveWord sensitiveWord = SensitiveWord.dao.findById(getPara());
		setAttr("sensitiveWord", sensitiveWord);
		render("/common/admin/sensitiveWord/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		SensitiveWordService.service.delete(param);
		redirect("/jf/common/admin/sensitiveWord");
	}
	
}


