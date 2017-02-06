
/**
 * 去除字符串两端空格
 * @returns
 */
String.prototype.trim = function(){  
	return this.replace(/(^\s*)|(\s*$)/g, "");  
};

/**
 * 字符串真实长度
 * @returns
 */
String.prototype.getBytes = function() {    
    var cArr = this.match(/[^\x00-\xff]/ig);    
    return this.length + (cArr == null ? 0 : cArr.length);    
};

/**
 * 日期格式化:new Date().format('yyyy-MM-dd hh:mm:ss')
 * @param format
 * @returns
 */
Date.prototype.format = function(format){
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(),    //day
        "h+" : this.getHours(),   //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
        "S" : this.getMilliseconds() //millisecond
    };
    
    if(/(y+)/.test(format)){
    	format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
    
    for(var k in o){
    	if(new RegExp("("+ k +")").test(format)){
    		format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
    	}
    }
    
    return format;
};
