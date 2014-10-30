package little.ant.platform.listener;

import java.io.FileInputStream;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.jfinal.kit.PathKit;
/**
 * 系统启动初始化数据
 * @author 董华健 2012-9-7 下午1:55:35
 */
public class InitListener implements ServletContextListener {
	
	private static Logger log = Logger.getLogger(InitListener.class);
	
	// 销毁
	public void contextDestroyed(ServletContextEvent event) {
		// ServletContext context = event.getServletContext();
	}

	// 启动加载
	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		String path = context.getRealPath("/");
		// 解决Weblogic 11g下pathkit路径获取不正确的bug，把Servlet的path赋值给pathkit
		System.out.println("################ServletContext--"+path);
		PathKit.setWebRootPath(path);
		System.out.println("################PathKit.getWebRootPath--"+PathKit.getWebRootPath());
		
		String file = context.getInitParameter("log4j_init_path");   
   		String logFile = context.getInitParameter("log4j_file_path");   
   		if(file != null){   
   			try{   
   	   			Properties prop = new Properties();
   				prop.load(new FileInputStream(path+file)); //加载log4j.properties
   				prop.setProperty("log4j.appender.file.File", path + logFile + prop.getProperty("log4j.appender.file.File")); //设置日志文件的输出路径   
   				PropertyConfigurator.configure(prop); //加载配置项
   			}catch(Exception e){
   				log.info("初始化log4j日志输入路径异常，请检查web.xml参数配置是否正常，异常发生在" + this.getClass().getName() + "类的public void init()方法，异常的愿意是：" + e.getMessage(), e.fillInStackTrace());   
   			}
   		}
	}

}
