package com.platform.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.kit.StrKit;
import com.jfinal.upload.MultipartRequest;
import com.platform.tools.ToolHtml;

/**
 * XSS拦截器
 * 描述：重写get参数或属性系列方法，参数值增加html转义
 */
@SuppressWarnings({"rawtypes", "unchecked"})
public class XSSInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		HttpServletRequest request = inv.getController().getRequest();
		if (isMultipartRequest(inv)) {
			inv.getController().setHttpServletRequest(new XSSMutipartRequest(request));
		} else {
			inv.getController().setHttpServletRequest(new EscapeXSSHttpServletRequestWrapper(request));
		}
		inv.invoke();
	}

	/**
	 * 是否enctype="multipart/form-data"
	 * @param inv
	 * @return
	 */
	private boolean isMultipartRequest(Invocation inv) {
		String contentType = inv.getController().getRequest().getContentType();
		return contentType != null && contentType.toLowerCase().indexOf("multipart") != -1;
	}

	/**
	 * 重写get参数或属性系列方法，参数值增加html转义
	 */
	static class XSSMutipartRequest extends MultipartRequest {
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

	/**
	 * 重写get参数或属性系列方法，参数值增加html转义
	 */
	static class EscapeXSSHttpServletRequestWrapper extends HttpServletRequestWrapper {

		public EscapeXSSHttpServletRequestWrapper(HttpServletRequest request) {
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
	
}