package com.platform.dto;

import java.io.Serializable;

/**
 * Render返回JSON数据封装
 * @author 董华健
 */
public class RenderBean implements Serializable{
	
	private static final long serialVersionUID = -1126196958137979710L;

	/**
	 * 状态：成功success、失败error
	 */
	private String status = "";
	
	/**
	 * 状态码
	 */
	private String code = "";

	/**
	 * 描述
	 */
	private String description = "";
	
	/**
	 * 正常情况下返回的数据
	 */
	private Object data;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
}
