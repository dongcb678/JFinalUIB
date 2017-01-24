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
		
		// 只过滤普通请求，把XSSMutipartRequest中重写的方法全部移动到JFinal的MultipartRequest类，解决文件上传类型参数过滤
		inv.getController().setHttpServletRequest(new EscapeXSSHttpServletRequestWrapper(request));
		
		inv.invoke();
	}

}
