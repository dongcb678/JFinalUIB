package com.weixin.dto.message;

/**
 * 自定义菜单事件
 * 1.点击菜单拉取消息时的事件推送
 * @author 董华健
 */
public class RecevieEventMenu extends RecevieEventBase {
	
	private String EventKey;	 //事件KEY值，与自定义菜单接口中KEY值对应

	public String getEventKey() {
		return EventKey;
	}

	public void setEventKey(String eventKey) {
		EventKey = eventKey;
	}
	
}
