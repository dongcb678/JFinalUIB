package com.weixin.handler;

/**
 * 消息处理接口类
 * @author 董华健  dongcb678@163.com
 */
public interface BaseHandler {
	
	/**
	 * 消息处理接口方法
	 * @param message
	 * @return
	 */
	public Object handle(String message);
	
}
