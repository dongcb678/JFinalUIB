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
		String echostr  = getPara("echostr");
		if(echostr != null ){
			//申请成为开发者
			String signature = getPara("signature");
			String timestamp = getPara("timestamp");
			String nonce = getPara("nonce");
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
