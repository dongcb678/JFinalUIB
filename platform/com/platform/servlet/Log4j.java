package com.platform.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.AsyncContext;
import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.log.Log;

/**
 * Log4j在线查看
 */
//@WebServlet(urlPatterns = { "/se/log4j" }, asyncSupported = true)
public class Log4j extends HttpServlet {

	private static final long serialVersionUID = -260157400324419618L;

	private static final Log log = Log.getLog(Log4j.class);
	
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
				if(log.isDebugEnabled()) log.debug("AsyncListener onComplete");
			}

			public void onTimeout(AsyncEvent event) throws IOException {
				ac.getResponse().getWriter().close();
				Log4jAsyncWriter.deleteAc(ac);
				if(log.isDebugEnabled()) log.debug("AsyncListener onTimeout");
			}

			public void onError(AsyncEvent event) throws IOException {
				ac.getResponse().getWriter().close();
				Log4jAsyncWriter.deleteAc(ac);
				if(log.isDebugEnabled()) log.debug("AsyncListener onError");
			}

			public void onStartAsync(AsyncEvent event) throws IOException {
				if(log.isDebugEnabled()) log.debug("AsyncListener onStartAsync");
			}
		});
		Log4jAsyncWriter.addAc(ac);
	}
}
