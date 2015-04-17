/**
 * 系统常用弹出框集合
 */
var common_Dialog = function() {
	
	return {
		//ajaxFunc : ajaxFunc
	};
	
}();

/**
 * ajax请求url替换DiaLog
 * @param url 请求地址
 * @param data 参数
 * @param callback 回调
 */
function ajaxDiaLog(url, data, callback){
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(cxt + url)),
		data : data,
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		cache: false,
		success:function(returnData){
			$('#myModal').html(returnData);
			//扩展回调函数
			if( callback != null ){
				callback();
			}
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
			docReady();
		}
	});
}

/**
 * 部门单选
 * @param deptId 点击确认时回写deptId值的地方
 * @param deptName 点击确认时回写deptName值的地方
 * @param checkedIds 默认选中的部门
 */
function deptRadioDiaLog(deptId, deptName, checkedIds){//ids默认选中：4
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/dept/toUrl",
		data : { "toUrl" : "/platform/department/radio.html", "ids" : checkedIds, "deptId" : deptId, "deptName" : deptName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 部门多选
 * @param deptId 点击确认时回写deptId值的地方
 * @param deptName 点击确认时回写deptName值的地方
 * @param checkedIds 默认选中的部门
 */
function deptCheckboxDiaLog(deptId, deptName, checkedIds){//ids默认选中：4,或者4,5,
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/dept/toUrl",
		data : { "toUrl" : "/platform/department/checkbox.html", "ids" : checkedIds, "deptId" : deptId, "deptName" : deptName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}
	
/**
 * 字典单选
 * @param dictId 数据回填
 * @param dictName 数据回填
 * @param checkedIds 默认选中
 * @param rootNumbers 根节点编号
 * @param callback 回调
 */
function dictRadioDiaLog(dictId, dictName, checkedIds, rootNumbers, callback){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/dict/toUrl",
		data : { "toUrl" : "/platform/dict/radio.html", "ids" : checkedIds, "dictId" : dictId, "dictName" : dictName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			//扩展回调函数
			if( callback != null ){
				callback();
			}
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 参数单选
 * @param dictId 数据回填
 * @param dictName 数据回填
 * @param checkedIds 默认选中
 * @param rootNumbers 根节点编号
 * @param callback 回调
 */
function paramRadioDiaLog(dictId, dictName, checkedIds, rootNumbers, callback){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/param/toUrl",
		data : { "toUrl" : "/platform/param/radio.html", "ids" : checkedIds, "paramId" : dictId, "paramName" : dictName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			//扩展回调函数
			if( callback != null ){
				callback();
			}
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 模块单选
 * @param moduleId
 * @param moduleName
 * @param checkedIds
 */
function moduleRadioDiaLog(moduleId, moduleName, checkedIds){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/module/toUrl",
		data : { "toUrl" : "/platform/module/radio.html", "ids" : checkedIds, "moduleId" : moduleId, "moduleName" : moduleName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 岗位单选
 * @param stationId
 * @param stationName
 * @param checkedIds
 */
function stationRadioDiaLog(stationId, stationName, checkedIds){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/station/toUrl",
		data : { "toUrl" : "/platform/station/radio.html", "ids" : checkedIds, "stationId" : stationId, "stationName" : stationName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 岗位多选
 * @param stationId
 * @param stationName
 * @param checkedIds
 */
function stationCheckboxDiaLog(stationId, stationName, checkedIds){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/station/toUrl",
		data : { "toUrl" : "/platform/station/checkbox.html", "ids" : checkedIds, "stationId" : stationId, "stationName" : stationName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 人员单选
 * @param userId
 * @param userName
 * @param checkedIds
 */
function userRadioDiaLog(userId, userName, checkedIds){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/user/toUrl",
		data : { "toUrl" : "/platform/user/radio.html", "ids" : checkedIds, "userId" : userId, "userName" : userName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 人员多选
 * @param userId
 * @param userName
 * @param deptIds
 * @param deptNames
 * @param checkedDeptIds
 * @param checkedUserIds
 */
function userCheckboxDiaLog(userId, userName, deptIds, deptNames, checkedDeptIds, checkedUserIds){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/user/toUrl",
		data : { "toUrl" : "/platform/user/checkbox.html", 
			"checkedDeptIds" : checkedDeptIds, "checkedUserIds" : checkedUserIds,
			"userId" : userId, "userName" : userName, "deptIds" : deptIds, "deptNames" : deptNames 
			},
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**************************************		功能定制函数	start	***************************************************/

/**
 * 部门负责人设置
 * @param deptId
 */
function setDeptPrincipalDiaLog(deptId){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/dept/toUrl",
		data : { "toUrl" : "/platform/department/userTree.html", "ids" : deptId },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 菜单功能设置
 * @param menuIds
 */
function setMenuOperatorDiaLog(menuIds){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/operator/toUrl",
		data : { "toUrl" : "/platform/menu/operatorTree.html", "ids" : menuIds },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 菜单国际化名称设置
 * @param menuIds
 */
function setMenuEditDiaLog(menuIds){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/menu/toEdit",
		data : { "ids" : menuIds },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 角色功能设置
 * @param roleIds
 */
function setRoleOperatorDiaLog(roleIds){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/operator/toUrl",
		data : { "toUrl" : "/platform/role/operatorTree.html", "ids" : roleIds},
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 岗位功能设置
 * @param stationIds
 */
function setStationOperatorDiaLog(stationIds){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/operator/toUrl",
		data : { "toUrl" : "/platform/station/operatorTree.html", "ids" : stationIds},
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 用户的分组设置
 * @param userIds
 */
function groupSelectDialog(userIds){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/group/select",
		data : { "ids" : userIds},
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}

/**
 * 分组的角色设置
 * @param groupIds
 */
function roleSelectDialog(groupIds){
	$('#content').parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : cxt + "/jf/platform/role/select",
		data : { "ids" : groupIds},
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
		}
	});
}


/**************************************		功能定制函数	end	***************************************************/