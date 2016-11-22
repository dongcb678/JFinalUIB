package com.platform.beetl.render;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.log.Log;
import com.platform.beetl.render.image.Captcha;
import com.platform.beetl.render.image.Randoms;
import com.platform.beetl.render.image.Streams;
import com.platform.interceptor.AuthInterceptor;
import com.platform.tools.ToolDateTime;

public class PngCaptcha extends Captcha {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(PngCaptcha.class);
	
	public PngCaptcha() {
	}

	public PngCaptcha(int width, int height) {
		this.width = width;
		this.height = height;
	}

	public PngCaptcha(int width, int height, int len) {
		this(width, height);
		this.len = len;
	}

	public PngCaptcha(int width, int height, int len, Font font) {
		this(width, height, len);
		this.font = font;
	}

	/**
	 * 生成验证码
	 * 
	 * @throws java.io.IOException
	 *             IO异常
	 */
	@Override
	public void out(HttpServletRequest request, HttpServletResponse response) {
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
		response.setContentType("image/gif");//设置相应类型,告诉浏览器输出的内容为图片

		// 生成字符
		char[] rands = alphas();

		// 设置验证码值到cookie
		long date = ToolDateTime.getDateByTime();
		AuthInterceptor.setAuthCode(request, response, String.valueOf(rands) + ".#." + date);

		OutputStream os = null;
		try {
			os = response.getOutputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		graphicsImage(rands, os);
	}

	/**
	 * 画随机码图
	 * 
	 * @param strs
	 *            文本
	 * @param out
	 *            输出流
	 */
	private boolean graphicsImage(char[] strs, OutputStream out) {
		boolean ok = false;
		try {
			BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics2D g = (Graphics2D) bi.getGraphics();
			AlphaComposite ac3;
			Color color;
			int len = strs.length;
			g.setColor(Color.WHITE);
			g.fillRect(0, 0, width, height);
			// 随机画干扰的蛋蛋
			for (int i = 0; i < 15; i++) {
				color = color(150, 250);
				g.setColor(color);
				g.drawOval(Randoms.num(width), Randoms.num(height), 5 + Randoms.num(10), 5 + Randoms.num(10));// 画蛋蛋，有蛋的生活才精彩
				color = null;
			}
			g.setFont(font);
			int h = height - ((height - font.getSize()) >> 1), w = width / len, size = w - font.getSize() + 1;
			/* 画字符串 */
			for (int i = 0; i < len; i++) {
				ac3 = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.7f);// 指定透明度
				g.setComposite(ac3);
				color = new Color(20 + Randoms.num(110), 20 + Randoms.num(110), 20 + Randoms.num(110));// 对每个字符都用随机颜色
				g.setColor(color);
				g.drawString(strs[i] + "", (width - (len - i) * w) + size, h - 4);
				color = null;
				ac3 = null;
			}
			ImageIO.write(bi, "png", out);
			out.flush();
			ok = true;
		} catch (IOException e) {
			ok = false;
		} finally {
			Streams.close(out);
		}
		return ok;
	}
}
