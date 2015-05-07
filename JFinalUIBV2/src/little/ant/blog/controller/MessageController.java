package little.ant.blog.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.service.MessageService;
import little.ant.blog.validator.MessageValidator;
import little.ant.blog.model.Message;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/message
 * /jf/blog/message/save
 * /jf/blog/message/edit
 * /jf/blog/message/update
 * /jf/blog/message/view
 * /jf/blog/message/delete
 * /common/message/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/message")
public class MessageController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MessageController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		MessageService.service.list(splitPage);
		render("/blog/message/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(MessageValidator.class)
	public void save() {
		getModel(Message.class).save();
		render("/blog/message/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Message message = Message.dao.findById(getPara());
		setAttr("message", message);
		render("/blog/message/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(MessageValidator.class)
	public void update() {
		getModel(Message.class).update();
		redirect("/jf/blog/message");
	}

	/**
	 * 查看
	 */
	public void view() {
		Message message = Message.dao.findById(getPara());
		setAttr("message", message);
		render("/blog/message/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		MessageService.service.delete(param);
		redirect("/jf/blog/message");
	}
	
}


