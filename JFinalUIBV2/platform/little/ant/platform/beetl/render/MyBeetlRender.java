package little.ant.platform.beetl.render;

import org.apache.log4j.Logger;
import org.beetl.core.GroupTemplate;
import org.beetl.ext.jfinal.BeetlRender;

import little.ant.platform.constant.ConstantWebContext;

/**
 * 继承BeetlRender，实现视图耗时的计算
 * @author 董华健
 */
public class MyBeetlRender extends BeetlRender {

	private static Logger log = Logger.getLogger(MyBeetlRender.class);
	
	public MyBeetlRender(GroupTemplate gt, String view) {
		super(gt, view);
	}

	public void render() {
		long start = System.currentTimeMillis();
		log.debug("MyBeetlRender render start time = " + start);
		
		super.render();
		
		long end = System.currentTimeMillis();
		long renderTime = end - start;
		log.debug("MyBeetlRender render end time = " + end + "，renderTime = " + renderTime);
		
		request.setAttribute(ConstantWebContext.renderTimeKey, renderTime);
	}

}
