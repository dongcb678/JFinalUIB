package little.ant.blog.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.admin.service.MessageService;
import little.ant.blog.admin.validator.MessageValidator;
import little.ant.blog.model.Message;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/admin/message
 * /jf/blog/admin/message/save
 * /jf/blog/admin/message/edit
 * /jf/blog/admin/message/update
 * /jf/blog/admin/message/view
 * /jf/blog/admin/message/delete
 * /common/admin/message/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/admin/message")
public class MessageController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MessageController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		MessageService.service.list(splitPage);
		render("/blog/admin/message/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(MessageValidator.class)
	public void save() {
		getModel(Message.class).save();
		render("/blog/admin/message/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Message message = Message.dao.findById(getPara());
		setAttr("message", message);
		render("/blog/admin/message/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(MessageValidator.class)
	public void update() {
		getModel(Message.class).update();
		redirect("/jf/blog/admin/message");
	}

	/**
	 * 查看
	 */
	public void view() {
		Message message = Message.dao.findById(getPara());
		setAttr("message", message);
		render("/blog/admin/message/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		MessageService.service.delete(param);
		redirect("/jf/blog/admin/message");
	}
	
}


