/**
 * 窗口操作
 */
var platform_windows = function() {
	"use strict";

	/**
	 * 关闭窗口
	 */
	var close = function (){
		top.window.opener = null;
		top.window.open('', '_self');
		top.window.close();
	}

	return {
		close : close()
	};
	
}();

