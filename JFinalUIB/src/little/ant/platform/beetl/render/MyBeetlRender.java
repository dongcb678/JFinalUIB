package little.ant.platform.beetl.render;

import org.apache.log4j.Logger;
import org.beetl.core.GroupTemplate;
import org.beetl.ext.jfinal.BeetlRender;

/**
 * 继承BeetlRender，实现视图耗时的计算
 * @author 董华健
 */
public class MyBeetlRender extends BeetlRender {

	private static Logger log = Logger.getLogger(MyBeetlRender.class);
	
	public static final String renderTimeKey = "renderTime";
	
	public MyBeetlRender(GroupTemplate gt, String view) {
		super(gt, view);
	}

	public void render() {
		log.debug("MyBeetlRender render start");
		long start = System.currentTimeMillis();
		super.render();
		long end = System.currentTimeMillis();
		long renderTime = end - start;
		request.setAttribute(MyBeetlRender.renderTimeKey, renderTime);
		log.debug("MyBeetlRender render end");
	}

}
