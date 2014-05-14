package little.ant.pingtai.jfinal;

import org.apache.log4j.Logger;

import com.jfinal.render.IMainRenderFactory;
import com.jfinal.render.JspRender;
import com.jfinal.render.Render;

public class MyJspRenderFactory implements IMainRenderFactory {

	private static Logger log = Logger.getLogger(MyJspRenderFactory.class);
	
	public Render getRender(String view) {
		log.debug("MyJspRenderFactory start");
		JspRender render = new MyJspRender(view);
		log.debug("MyJspRenderFactory end");
		return render;
	}

	public String getViewExtension() {
		return ".jsp";
	}

}
