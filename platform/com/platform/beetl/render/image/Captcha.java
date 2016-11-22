package com.platform.beetl.render.image;

import java.awt.Color;
import java.awt.Font;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Captcha {

	protected Font font = new Font("Verdana", Font.ITALIC | Font.BOLD, 28); // 字体
	protected int len = 5; // 验证码随机字符长度
	protected int width = 150; // 验证码显示跨度
	protected int height = 40; // 验证码显示高度
	private String chars = null; // 随机字符串

	/**
	 * 生成随机字符数组
	 * 
	 * @return 字符数组
	 */
	protected char[] alphas() {
		char[] cs = new char[len];
		for (int i = 0; i < len; i++) {
			cs[i] = Randoms.alpha();
		}
		chars = new String(cs);
		return cs;
	}

	public Font getFont() {
		return font;
	}

	public void setFont(Font font) {
		this.font = font;
	}

	public int getLen() {
		return len;
	}

	public void setLen(int len) {
		this.len = len;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	/**
	 * 给定范围获得随机颜色
	 * 
	 * @return Color 随机颜色
	 */
	protected Color color(int fc, int bc) {
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + Randoms.num(bc - fc);
		int g = fc + Randoms.num(bc - fc);
		int b = fc + Randoms.num(bc - fc);
		return new Color(r, g, b);
	}

	/**
	 * 验证码输出,抽象方法，由子类实现
	 * 
	 * @param response
	 *            输出流
	 */
	public abstract void out(HttpServletRequest request, HttpServletResponse response);

	/**
	 * 获取随机字符串
	 * 
	 * @return string
	 */
	public String text() {
		return chars;
	}
}
