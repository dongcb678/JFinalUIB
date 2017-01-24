package com.platform.config;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.kit.StrKit;
import com.jfinal.upload.MultipartRequest;
import com.platform.tools.ToolHtml;

/**
 * 重写get参数或属性系列方法，参数值增加html转义
 */
public class XSSMutipartRequest extends MultipartRequest {

	public XSSMutipartRequest(HttpServletRequest request, String uploadPath, int maxPostSize, String encoding) {
		super(request, uploadPath, maxPostSize, encoding);
	}
	
	public XSSMutipartRequest(HttpServletRequest request, String uploadPath, int maxPostSize) {
		super(request, uploadPath, maxPostSize);
	}
	
	public XSSMutipartRequest(HttpServletRequest request, String uploadPath) {
		super(request, uploadPath);
	}

	public XSSMutipartRequest(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		String value = super.getParameter(name);
		if (StrKit.notBlank(value)) {
			value = ToolHtml.escapehtml(value);
		}
		return value;
	}

	@Override
	public Object getAttribute(String name) {
		Object value = super.getAttribute(name);
		if (value instanceof String) {
			value = ToolHtml.escapehtml(String.valueOf(value));
		}
		return value;
	}

	@Override
	public String[] getParameterValues(String name) {
		String[] values = super.getParameterValues(name);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				values[i] = ToolHtml.escapehtml(values[i]);
			}
		}
		return values;
	}

	@Override
	@SuppressWarnings({"rawtypes", "unchecked"})
	public Map getParameterMap() {
		HashMap<String, String[]> paramMap = new HashMap<String,String[]>(super.getParameterMap());
		paramMap = (HashMap) paramMap.clone();

		for (Map.Entry<String, String[]> entry : paramMap.entrySet()){
			String[] values = entry.getValue();
			for (int i = 0; i < values.length; i++) {
				values[i] = ToolHtml.escapehtml(values[i]);
			}
			entry.setValue(values);
		}
		return paramMap;
	}
	
}
