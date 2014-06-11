package little.ant.pingtai.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.AsyncContext;
import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

/**
 * Log4j在线即时查看
 */
//@WebServlet(urlPatterns = { "/se/log4j" }, asyncSupported = true)
public class Log4j extends HttpServlet {

	private static final long serialVersionUID = -260157400324419618L;

	private static Logger log = Logger.getLogger(Log4j.class);
	
	/**
	 * 初始化Log4j路径配置
	 */
	public void init(){   
		String path = this.getServletContext().getRealPath("/");   
		String file = this.getInitParameter("log4j_init_path");   
   		String logFile = this.getInitParameter("log4j_file_path");   
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
	
	/**
	 * 将客户端注册到监听Logger的消息队列中
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "private");
		response.setHeader("Pragma", "no-cache");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		// for IE
		writer.println("<!-- Comet is a programming technique that enables web servers to send data to the client without having any need for the client to request it. -->\n");
		writer.flush();

		final AsyncContext ac = request.startAsync();
		ac.setTimeout(1 * 60 * 60 * 1000);//1小时
		ac.addListener(new AsyncListener() {
			public void onComplete(AsyncEvent event) throws IOException {
				ac.getResponse().getWriter().close();
				Log4jAsyncWriter.deleteAc(ac);
			}

			public void onTimeout(AsyncEvent event) throws IOException {
				ac.getResponse().getWriter().close();
				Log4jAsyncWriter.deleteAc(ac);
			}

			public void onError(AsyncEvent event) throws IOException {
				ac.getResponse().getWriter().close();
				Log4jAsyncWriter.deleteAc(ac);
			}

			public void onStartAsync(AsyncEvent event) throws IOException {
			}
		});
		Log4jAsyncWriter.addAc(ac);
	}
}
