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
	};
	
	/**
	 * 打开新窗口url，还可以指定一个form作为参数
	 */
	var open = function(url, formId){
		if(url.indexOf("?") == -1){
			url = url + "?localePram=" + localePram;
		}else{
			url = url + "&localePram=" + localePram;
		}
		
		if(formId != undefined && formId != null){
			var data = $("#" + formId).formToArray();//console.log(data);
			for (var index in data) {//console.log(index);
				if(data[index].value != ""){
					url += "&" + data[index].name + "=" + encodeURI(encodeURI(data[index].value));
				}
			}
		}//console.log(url);
		
		window.open(url);
	};

	return {
		close : close,
		open : open
	};
	
}();

