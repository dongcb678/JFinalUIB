package com.platform.beetl.render;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.jfinal.render.Render;
import com.jfinal.render.RenderException;
import com.platform.tools.ToolXml;

/**
 * MyXmlRender.
 */
public class MyXmlRender extends Render {
	
	/**
	 * It creates the extra attribute below while tomcat take SSL open.
	 * http://git.oschina.net/jfinal/jfinal/issues/10
	 */
	private static final Set<String> excludedAttrs = new HashSet<String>() {
		private static final long serialVersionUID = 9186138395157680676L;
		{
			add("javax.servlet.request.ssl_session");
			add("javax.servlet.request.ssl_session_id");
			add("javax.servlet.request.ssl_session_mgr");
			add("javax.servlet.request.key_size");
			add("javax.servlet.request.cipher_suite");
			
			add("cUser");
			add("reqSysLog");
			add("cookieMap");
			add("paramMap");
			add("i18nMap");
			add("_res");
			add("decorator");
		}
	};
	
	/**
	 * 仅对无参 renderXml() 起作用
	 */
	public static void addExcludedAttrs(String... attrs) {
		if (attrs != null) {
			for (String attr : attrs) {
				excludedAttrs.add(attr);
			}
		}
	}
	
	public static void removeExcludedAttrs(String... attrs) {
		if (attrs != null) {
			for (String attr : attrs) {
				excludedAttrs.remove(attr);
			}
		}
	}
	
	public static void clearExcludedAttrs() {
		excludedAttrs.clear();
	}
	
	private static final String contentType = "application/xml; charset=" + getEncoding();
	
	private String xmlText;
	private String[] attrs;
	
	public MyXmlRender() {
		
	}
	
	@SuppressWarnings("serial")
	public MyXmlRender(final String key, final Object value) {
		if (key == null) {
			throw new IllegalArgumentException("The parameter key can not be null.");
		}
		this.xmlText = ToolXml.beanToXml(new HashMap<String, Object>(){{put(key, value);}}, HashMap.class);
	}
	
	public MyXmlRender(String[] attrs) {
		if (attrs == null) {
			throw new IllegalArgumentException("The parameter attrs can not be null.");
		}
		this.attrs = attrs;
	}
	
	public MyXmlRender(String xmlText) {
		if (xmlText == null) {
			// throw new IllegalArgumentException("The parameter xmlString can not be null.");
			this.xmlText = "null";
		} else {
			this.xmlText = xmlText;
		}
	}
	
	public MyXmlRender(Object object) {
		this.xmlText = ToolXml.beanToXml(object, object.getClass());
	}
	
	public void render() {
		if (xmlText == null) {
			buildxXmlText();
		}
		
		PrintWriter writer = null;
		try {
			response.setHeader("Pragma", "no-cache");	// HTTP/1.0 caches might not implement Cache-Control and might only implement Pragma: no-cache
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			
			response.setContentType(contentType);
			writer = response.getWriter();
	        writer.write(xmlText);
	        writer.flush();
		} catch (IOException e) {
			throw new RenderException(e);
		}
		finally {
			if (writer != null) {
				writer.close();
			}
		}
	}
	
	@SuppressWarnings({"rawtypes", "unchecked"})
	private void buildxXmlText() {
		Map map = new HashMap();
		if (attrs != null) {
			for (String key : attrs) {
				map.put(key, request.getAttribute(key));
			}
		}
		else {
			for (Enumeration<String> attrs=request.getAttributeNames(); attrs.hasMoreElements();) {
				String key = attrs.nextElement();
				if (excludedAttrs.contains(key)) {
					continue;
				}
				
				Object value = request.getAttribute(key);
				map.put(key, value);
			}
		}
		
		this.xmlText = ToolXml.beanToXml(map, map.getClass());
	}
	
	public String[] getAttrs() {
		return attrs;
	}
	
	public String getXmlText() {
		return xmlText;
	}
	
}






