package com.platform.beetl.render;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.log.Log;
import com.platform.beetl.render.image.Captcha;
import com.platform.beetl.render.image.GifEncoder;
import com.platform.beetl.render.image.Randoms;
import com.platform.beetl.render.image.Streams;
import com.platform.interceptor.AuthInterceptor;
import com.platform.tools.ToolDateTime;

public class GifCaptcha extends Captcha {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(GifCaptcha.class);

	public GifCaptcha() {
		
	}

	public GifCaptcha(int width, int height) {
		this.width = width;
		this.height = height;
	}

	public GifCaptcha(int width, int height, int len) {
		this(width, height);
		this.len = len;
	}

	public GifCaptcha(int width, int height, int len, Font font) {
		this(width, height, len);
		this.font = font;
	}

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

		try {
			GifEncoder gifEncoder = new GifEncoder(); // gif编码类，这个利用了洋人写的编码类，所有类都在附件中
			gifEncoder.start(os);
			gifEncoder.setQuality(180);
			gifEncoder.setDelay(100);
			gifEncoder.setRepeat(0);
			BufferedImage frame;

			Color fontcolor[] = new Color[len];
			for (int i = 0; i < len; i++) {
				fontcolor[i] = new Color(20 + Randoms.num(110), 20 + Randoms.num(110), 20 + Randoms.num(110));
			}
			for (int i = 0; i < len; i++) {
				frame = graphicsImage(fontcolor, rands, i);
				gifEncoder.addFrame(frame);
				frame.flush();
			}
			gifEncoder.finish();
		} finally {
			Streams.close(os);
		}
	}

	/**
	 * 画随机码图
	 * 
	 * @param fontcolor
	 *            随机字体颜色
	 * @param strs
	 *            字符数组
	 * @param flag
	 *            透明度使用
	 * @return BufferedImage
	 */
	private BufferedImage graphicsImage(Color[] fontcolor, char[] strs, int flag) {
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// 或得图形上下文
		// Graphics2D g2d=image.createGraphics();
		Graphics2D g2d = (Graphics2D) image.getGraphics();
		// 利用指定颜色填充背景
		g2d.setColor(Color.WHITE);
		g2d.fillRect(0, 0, width, height);
		AlphaComposite ac3;
		int h = height - ((height - font.getSize()) >> 1);
		int w = width / len;
		g2d.setFont(font);
		for (int i = 0; i < len; i++) {
			ac3 = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, getAlpha(flag, i));
			g2d.setComposite(ac3);
			g2d.setColor(fontcolor[i]);
			g2d.drawOval(Randoms.num(width), Randoms.num(height), 5 + Randoms.num(10), 5 + Randoms.num(10));
			g2d.drawString(strs[i] + "", (width - (len - i) * w) + (w - font.getSize()) + 1, h - 4);
		}
		g2d.dispose();
		return image;
	}

	/**
	 * 获取透明度,从0到1,自动计算步长
	 * 
	 * @return float 透明度
	 */
	private float getAlpha(int i, int j) {
		int num = i + j;
		float r = (float) 1 / len, s = (len + 1) * r;
		return num > len ? (num * r - s) : num * r;
	}

}
