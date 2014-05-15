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
	
	public void index(){
		String echostr  = getPara("echostr");	//随机字符串
		if(echostr != null && !echostr.isEmpty()){ // 验证URL有效性
			String timestamp = getPara("timestamp");//时间戳
			String signature = getPara("signature");//微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数
			String nonce = getPara("nonce");		//随机数
			
			log.info("signature:" + signature + "  timestamp:" + timestamp + "  nonce:" + nonce + "  echostr:" + echostr) ;
			
			boolean flag = receiveService.checkSignature(signature, timestamp, nonce);
			if(flag){
				renderText(echostr);
			}else{
				renderText("error");
			}
		}else{
			//接受并发送微信消息
			String msg = receiveService.getSendMessage(getRequest());
			renderText(msg);
		}
	}
	
}
