package little.ant.platform.tools;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;
import java.util.Set;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

/**
 * Velocity工具类
 * @author 董华健
 */
public class ToolVelocity {

	/**
	 * 渲染模板
	 * @param templateContent
	 * @param paramMap
	 * @return
	 * @throws IOException
	 * @throws TemplateException
	 */
	public static String render(String templateContent, Map<String, Object> paramMap) {
		// 初始化并取得Velocity引擎
		VelocityEngine ve = new VelocityEngine();
		ve.init();

		// 取得velocity的上下文context
		VelocityContext context = new VelocityContext();
		
		Set<String> keys = paramMap.keySet();
		for (String key : keys) {
			context.put(key, paramMap.get(key));// 把数据填入上下文
		}

		// 输出流
		StringWriter writer = new StringWriter();

		// 转换输出
		ve.evaluate(context, writer, "", templateContent); // 关键方法

		return writer.toString();
	}
	
}
