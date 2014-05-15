package little.ant.pingtai.beetl;

import org.apache.log4j.Logger;
import org.beetl.core.GroupTemplate;
import org.beetl.ext.jfinal.BeetlRender;

public class MyBeetlRender extends BeetlRender {

	private static final long serialVersionUID = 508975754500775679L;

	private static Logger log = Logger.getLogger(MyBeetlRender.class);
	
	public static final String renderTimeKey = "renderTime";
	
	public MyBeetlRender(GroupTemplate gt, String view) {
		super(gt, view);
	}

	public void render() {
		log.debug("MyJspRender render start");
		long start = System.currentTimeMillis();
		super.render();
		long end = System.currentTimeMillis();
		long renderTime = end - start;
		request.setAttribute(MyBeetlRender.renderTimeKey, renderTime);
		log.debug("MyJspRender render end");
	}

}
