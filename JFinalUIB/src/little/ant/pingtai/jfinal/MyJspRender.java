package little.ant.pingtai.jfinal;

import org.apache.log4j.Logger;

import com.jfinal.render.JspRender;

public class MyJspRender extends JspRender {

	private static final long serialVersionUID = 6004117114368918765L;
	
	private static Logger log = Logger.getLogger(MyJspRender.class);
	
	public static final String renderTimeKey = "renderTime";
	
	public MyJspRender(String view) {
		super(view);
	}
	
	public void render() {
		log.debug("MyJspRender render start");
		long start = System.currentTimeMillis();
		super.render();
		long end = System.currentTimeMillis();
		long renderTime = end - start;
		request.setAttribute(MyJspRender.renderTimeKey, renderTime);
		log.debug("MyJspRender render end");
	}

}
