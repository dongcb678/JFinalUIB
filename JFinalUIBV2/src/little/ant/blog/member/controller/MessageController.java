package little.ant.blog.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.member.service.MessageService;
import little.ant.blog.member.validator.MessageValidator;
import little.ant.blog.model.Message;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/member/message
 * /jf/blog/member/message/save
 * /jf/blog/member/message/edit
 * /jf/blog/member/message/update
 * /jf/blog/member/message/view
 * /jf/blog/member/message/delete
 * /common/message/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/member/message")
public class MessageController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MessageController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		MessageService.service.list(splitPage);
		render("/blog/member/message/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(MessageValidator.class)
	public void save() {
		getModel(Message.class).save();
		render("/blog/member/message/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Message message = Message.dao.findById(getPara());
		setAttr("message", message);
		render("/blog/member/message/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(MessageValidator.class)
	public void update() {
		getModel(Message.class).update();
		redirect("/jf/blog/member/message");
	}

	/**
	 * 查看
	 */
	public void view() {
		Message message = Message.dao.findById(getPara());
		setAttr("message", message);
		render("/blog/member/message/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		MessageService.service.delete(param);
		redirect("/jf/blog/member/message");
	}
	
}


