package com.weixin.dto.menu;

/**
 * view类型的按钮
 * @author 董华健
 */
public class ResponseMenuButtonView extends ResponseMenuButton {
	
	private String type;
	private String url;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}
