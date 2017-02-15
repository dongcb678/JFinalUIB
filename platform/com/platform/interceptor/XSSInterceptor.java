package com.platform.interceptor;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.platform.config.EscapeXSSHttpServletRequestWrapper;

/**
 * XSS拦截器
 * 描述：重写get参数或属性系列方法，参数值增加html转义
 */
public class XSSInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		HttpServletRequest request = inv.getController().getRequest();
		
		// 这里只过滤普通请求，在BaseController重写getFile系列方法，解决文件上传类型参数过滤
		if (!isMultipartRequest(inv)) {
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

}
