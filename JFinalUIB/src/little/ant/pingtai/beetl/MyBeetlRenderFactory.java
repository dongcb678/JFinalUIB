package little.ant.pingtai.beetl;

import org.apache.log4j.Logger;
import org.beetl.ext.jfinal.BeetlRender;
import org.beetl.ext.jfinal.BeetlRenderFactory;

import com.jfinal.render.Render;

public class MyBeetlRenderFactory extends BeetlRenderFactory {
	
	private static Logger log = Logger.getLogger(MyBeetlRenderFactory.class);

	public Render getRender(String view) {
		log.debug("MyJspRenderFactory start");
		BeetlRender render = new MyBeetlRender(groupTemplate, view);
		log.debug("MyJspRenderFactory end");
		return render;
	}

	public String getViewExtension() {
		return ".html";
	}

}
