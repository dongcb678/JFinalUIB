package little.ant.weixin.controller;

import little.ant.pingtai.controller.BaseController;
import little.ant.weixin.service.MessageService;

import org.apache.log4j.Logger;

/**
 * 接收微信消息
 * @author 董华健
 */
public class MessageController extends BaseController {

	private static Logger log = Logger.getLogger(MessageController.class);
	
	private MessageService receiveService = new MessageService();
	
	/**
	 * 1.在开发者首次提交验证申请时，微信服务器将发送GET请求到填写的URL上，并且带上四个参数（signature、timestamp、nonce、echostr），
	 * 开发者通过对签名（即signature）的效验，来判断此条消息的真实性。
	 * 
	 * 2.此后，每次开发者接收用户消息的时候，微信也都会带上前面三个参数（signature、timestamp、nonce）访问开发者设置的URL，
	 * 开发者依然通过对签名的效验判断此条消息的真实性。效验方式与首次提交验证申请一致。 
	 */
	public void index(){
		String echostr  = getPara("echostr");	//随机字符串
		if(echostr != null && !echostr.isEmpty()){ // 验证URL有效性
			log.info("开发者验证");
			String timestamp = getPara("timestamp");//时间戳
			String signature = getPara("signature");//微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数
			String nonce = getPara("nonce");	
			boolean flag = receiveService.checkSignature(signature, timestamp, nonce);
			if(flag){
				renderText(echostr);
			}else{
				renderText("error");
			}
		}else{
			log.info("接受并发送微信消息") ;
			String msg = receiveService.getParseMessage(getRequest());
			renderText(msg);
		}
	}
	
}
