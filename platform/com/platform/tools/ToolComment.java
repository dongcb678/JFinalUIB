package com.platform.tools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.jfinal.log.Log;

/**
 * 代码注释处理：清除注释
 * 
 * @author 董华健
 */
public abstract class ToolComment {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ToolComment.class);

	public static String basePath = "C:\\Users\\Administrator\\Desktop\\SSHD\\";

	public static String[] dirs = { basePath + "src\\little\\ant", basePath + "cache\\little\\ant",
			basePath + "jbpm\\little\\ant", basePath + "struts\\little\\ant", basePath + "webServices\\little\\ant",
			basePath + "compass\\little\\ant", basePath + "quartz\\little\\ant", basePath + "application\\little\\ant",
			basePath + "payment\\little\\ant", basePath + "jni\\little\\ant" };

	/** 根目录 */
	// public static String rootDir = "D:\\workspace\\proj_map\\src\\com";

	public static void main(String args[]) throws FileNotFoundException, UnsupportedEncodingException {
		// deepDir(rootDir);
		for (String dir : dirs) {
			deepDir(dir);
		}
	}

	public static void deepDir(String rootDir) throws FileNotFoundException, UnsupportedEncodingException {
		File folder = new File(rootDir);
		if (folder.isDirectory()) {
			String[] files = folder.list();
			for (int i = 0; i < files.length; i++) {
				File file = new File(folder, files[i]);
				if (file.isDirectory() && file.isHidden() == false) {
					System.out.println(file.getPath());
					deepDir(file.getPath());
				} else if (file.isFile() && file.getName().endsWith(".java")) {
					clearComment(file.getPath());
				}
			}
		} else if (folder.isFile()) {
			clearComment(folder.getPath());
		}
	}

	/**
	 * @param currentDir
	 *            当前目录
	 * @param currentFileName
	 *            当前文件名
	 * @throws FileNotFoundException
	 * @throws UnsupportedEncodingException
	 */
	/**
	 * @param filePathAndName
	 * @throws FileNotFoundException
	 * @throws UnsupportedEncodingException
	 */
	@SuppressWarnings("resource")
	public static void clearComment(String filePathAndName) throws FileNotFoundException, UnsupportedEncodingException {
		StringBuilder buffer = new StringBuilder();
		String line = null; // 用来保存每行读取的内容
		InputStream is = new FileInputStream(filePathAndName);
		BufferedReader reader = new BufferedReader(new InputStreamReader(is, ToolString.encoding));
		try {
			line = reader.readLine();
		} catch (IOException e) {
			e.printStackTrace();
		} // 读取第一行
		while (line != null) { // 如果 line 为空说明读完了
			buffer.append(line); // 将读到的内容添加到 buffer 中
			buffer.append("\r\n"); // 添加换行符
			try {
				line = reader.readLine();
			} catch (IOException e) {
				e.printStackTrace();
			} // 读取下一行
		}
		// 1、清除单行的注释，如： //某某，正则为 ：\/\/.*
		// 2、清除单行的注释，如：/** 某某 */，正则为：\/\*\*.*\*\/
		// 3、清除单行的注释，如：/* 某某 */，正则为：\/\*.*\*\/
		// 4、清除多行的注释，如:
		// /* 某某1
		// 某某2
		// */
		// 正则为：.*/\*(.*)\*/.*
		// 5、清除多行的注释，如：
		// /** 某某1
		// 某某2
		// */
		// 正则为：/\*\*(\s*\*\s*.*\s*?)*
		String filecontent = buffer.toString();
		buffer = null;

		Map<String, String> patterns = new HashMap<String, String>();
		patterns.put("([^:])\\/\\/.*", "$1");// 匹配在非冒号后面的注释，此时就不到再遇到http://
		patterns.put("\\s+\\/\\/.*", "");// 匹配“//”前是空白符的注释
		patterns.put("^\\/\\/.*", "");
		patterns.put("^\\/\\*\\*.*\\*\\/$", "");
		patterns.put("\\/\\*.*\\*\\/", "");
		patterns.put("/\\*(\\s*\\*\\s*.*\\s*?)*\\*\\/", "");
		// patterns.put("/\\*(\\s*\\*?\\s*.*\\s*?)*", "");
		Iterator<String> keys = patterns.keySet().iterator();
		String key = null, value = "";
		while (keys.hasNext()) {
			// 经过多次替换
			key = keys.next();
			value = patterns.get(key);
			filecontent = replaceAll(filecontent, key, value);
		}
		System.out.println(filecontent);
		// 再输出到原文件
		try {
			File f = new File(filePathAndName);
			if (!f.getParentFile().exists()) {
				f.getParentFile().mkdirs();
			}
			FileOutputStream out = new FileOutputStream(filePathAndName);
			byte[] bytes = filecontent.getBytes(ToolString.encoding);
			out.write(bytes);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param fileContent
	 *            内容
	 * @param patternString
	 *            匹配的正则表达式
	 * @param replace
	 *            替换的内容
	 * @return
	 */
	public static String replaceAll(String fileContent, String patternString, String replace) {
		String str = "";
		Matcher m = null;
		Pattern p = null;
		try {
			p = Pattern.compile(patternString);
			m = p.matcher(fileContent);
			str = m.replaceAll(replace);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			m = null;
			p = null;
		}
		// 获得匹配器对象
		return str;

	}

}