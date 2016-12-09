package com.platform.run;

import com.jfinal.core.JFinal;

public class Run {

	/**
	 * 运行此 main 方法可以启动项目
	 * 
	 * 说明：
	 * 		1. linux 下非root账户运行端口要>1024
	 * 		2. idea 中运行webAppDir路径可能需要适当调整
	 */
	public static void main(String[] args) {
		JFinal.start("src/main/webapp", 8899, "/", 5);
	}
	
}
