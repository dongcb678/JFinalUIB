package com.platform.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Queue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.LinkedBlockingQueue;

import javax.servlet.AsyncContext;

import com.jfinal.log.Log;

/**
 * log4j异步输出处理类
 * @author 董华健
 *
 */
public class Log4jAsyncWriter extends Writer {

	private static final Log log = Log.getLog(Log4jAsyncWriter.class);
	

	/**
	 * AsyncContext队列
	 */
	private static final Queue<AsyncContext> acQueue = new ConcurrentLinkedQueue<AsyncContext>();

	/**
	 * log消息队列
	 */
	private static final BlockingQueue<String> msgQueue = new LinkedBlockingQueue<String>();

	/**
	 * 添加AsyncContext对象到队列
	 * 
	 * @param ac
	 */
	public static void addAc(AsyncContext ac) {
		acQueue.add(ac);
	}

	/**
	 * 删除AsyncContext队列对象
	 * 
	 * @param ac
	 */
	public static void deleteAc(AsyncContext ac) {
		acQueue.remove(ac);
	}

	/**
	 * 构造AsyncContextQueueWriter 异步线程，当消息队列中被放入数据，将释放take方法的阻塞，将数据发送到http response流上
	 */
	public Log4jAsyncWriter() {
		Thread notifierThread = new Thread(new Runnable() {
			public void run() {
				while (true) {
					try {
						String message = msgQueue.take();
						for (AsyncContext ac : acQueue) {
							AsyncContext asyncContext = ac;
							try {
								PrintWriter acWriter = ac.getResponse().getWriter();
								acWriter.println("<script type='text/javascript'>\nwindow.parent.update(\""
										+ message.replaceAll("\n", "").replaceAll("\r", "") + "\");</script>\n");
								acWriter.flush();
							} catch (IOException ex) {
								acQueue.remove(asyncContext);
								if(log.isErrorEnabled()) log.error("Log4jAsyncWriter IOException 异常!");
							}
						}
					} catch (InterruptedException iex) {
						if(log.isErrorEnabled()) log.error("Log4jAsyncWriter InterruptedException 异常! msgQueue.take()");
					}
				}
			}
		});
		notifierThread.setName("little-ant-Thread-Log4jAsyncWriter");
		notifierThread.start();
	}

	@Override
	public void write(char[] cbuf, int off, int len) throws IOException {
		try {
			msgQueue.put(new String(cbuf, off, len));
		} catch (Exception ex) {
			IOException t = new IOException();
			t.initCause(ex);
			throw t;
		}
	}

	@Override
	public void flush() throws IOException {
	}

	@Override
	public void close() throws IOException {

	}

}
