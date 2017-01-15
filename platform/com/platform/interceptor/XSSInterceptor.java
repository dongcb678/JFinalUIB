package com.platform.interceptor;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.lang3.StringEscapeUtils;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.kit.StrKit;
import com.jfinal.upload.MultipartRequest;

/**
 * XSS拦截器
 */
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

	private boolean isMultipartRequest(Invocation inv) {
		String contentType = inv.getController().getRequest().getContentType();
		return contentType != null && contentType.toLowerCase().indexOf("multipart") != -1;
	}

	static class XSSMutipartRequest extends MultipartRequest {
		public XSSMutipartRequest(HttpServletRequest request) {
			super(request);
		}

		@Override
		public String getParameter(String name) {
			String value = super.getParameter(name);
			if (StrKit.notBlank(value)) {
				value = escape(value);
			}
			return value;
		}

		@Override
		public Object getAttribute(String name) {
			Object value = super.getAttribute(name);
			if (value instanceof String) {
				value = escape(String.valueOf(value));
			}
			return value;
		}

		@Override
		public String[] getParameterValues(String name) {
			String[] values = super.getParameterValues(name);
			if (values != null) {
				for (int i = 0; i < values.length; i++) {
					values[i] = escape(values[i]);
				}
			}
			return values;
		}

		@Override
		public Map getParameterMap() {
			HashMap<String, String[]> paramMap = (HashMap<String, String[]>) super.getParameterMap();
			paramMap = (HashMap) paramMap.clone();

			for (Iterator<Map.Entry<String, String[]>> iterator = paramMap.entrySet().iterator(); iterator.hasNext();) {
				Map.Entry<String, String[]> entry = (Map.Entry<String, String[]>) iterator.next();
				String[] values = entry.getValue();
				for (int i = 0; i < values.length; i++) {
					values[i] = escape(values[i]);
				}
				entry.setValue(values);
			}
			return paramMap;
		}

		private String escape(String value) {
			return StringEscapeUtils.escapeHtml4(value);
		}

	}

	static class EscapeXSSHttpServletRequestWrapper extends HttpServletRequestWrapper {

		public EscapeXSSHttpServletRequestWrapper(HttpServletRequest request) {
			super(request);
		}

		@Override
		public String getParameter(String name) {
			String value = super.getParameter(name);
			if (StrKit.notBlank(value)) {
				value = escape(value);
			}
			return value;
		}

		@Override
		public Object getAttribute(String name) {
			Object value = super.getAttribute(name);
			if (value instanceof String) {
				value = escape(String.valueOf(value));
			}
			return value;
		}

		@Override
		public String[] getParameterValues(String name) {
			String[] values = super.getParameterValues(name);
			if (values != null) {
				for (int i = 0; i < values.length; i++) {
					values[i] = escape(values[i]);
				}
			}
			return values;
		}

		@Override
		public Map getParameterMap() {
			HashMap<String, String[]> paramMap = (HashMap<String, String[]>) super.getParameterMap();
			paramMap = (HashMap) paramMap.clone();

			for (Iterator<Map.Entry<String, String[]>> iterator = paramMap.entrySet().iterator(); iterator.hasNext();) {
				Map.Entry<String, String[]> entry = (Map.Entry<String, String[]>) iterator.next();
				String[] values = entry.getValue();
				for (int i = 0; i < values.length; i++) {
					values[i] = escape(values[i]);
				}
				entry.setValue(values);
			}
			return paramMap;
		}

		private String escape(String value) {
			return StringEscapeUtils.escapeHtml4(value);
		}
	}
}