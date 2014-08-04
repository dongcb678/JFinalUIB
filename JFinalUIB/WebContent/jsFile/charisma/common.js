/**
 * 分页输出
 * @param totalRow
 * @param pageSize
 * @param pageNumber
 * @param totalPages
 * @param isSelectPage
 * @param isSelectSize
 * @param orderColunm
 * @param orderMode
 */
function splitPageOut(totalRow, pageSize, pageNumber, totalPages, isSelectPage, isSelectSize, orderColunm, orderMode){
	var splitStr = '<ul>';
	
	if (pageNumber == 1 || totalPages == 0) {
		splitStr += '<li><a href="javascript:void(0)">上一页</a></li>';
	} else {
		splitStr += '<li><a href="javascript:splitPage(' + (pageNumber - 1) + ');">上一页</a></li>';
	}
	
	for (var i = 1; i <= totalPages; i++) {
        if (i == 2 && pageNumber - 4 > 1) {
        	splitStr += '<li><a href="javascript:void(0)">...</a></li>';
            i = pageNumber - 4;
        } else if (i == pageNumber + 4 && pageNumber + 4 < totalPages) {
        	splitStr += '<li><a href="javascript:void(0)">...</a></li>';
            i = totalPages - 1;
        } else {
            if (pageNumber == i) {
            	splitStr += '<li class="active"><a href="javascript:void(0)" style="color: #272727; font-size: 14px; text-decoration: none;">' + pageNumber + '</a></li>';
            } else {
            	splitStr += '<li><a href="javascript:splitPage(' + i + ');" style="color: #898989; font-size: 14px;">';
            	splitStr += i;
            	splitStr += '</a></li>';
            }
        }
    }
	
	if (pageNumber == totalPages || totalPages == 0) {
		splitStr += '<li><a href="javascript:void(0)">下一页</a></li>';
	} else {
		splitStr += '<li><a href="javascript:splitPage(' + (pageNumber + 1) + ');">下一页</a></li>';
	}
	
	if(isSelectPage == true){
		splitStr += '&nbsp;&nbsp;<li><select id="pageNumberId" name="pageNumber" onChange="splitPage(this.value);" style="width: 110px; height:35px;">';
		for (var i = 1; i <= totalPages; i++) {
			if (i == pageNumber) {
				splitStr += '<option selected value="' + i + '">跳转到第' + i + '页</option>';
			} else {
				splitStr += '<option value="' + i + '">跳转到第' + i + '页</option>';
			}
		}
		if(totalPages == 0){
			splitStr += '<option value="0">无跳转数据</option>';
		}
		splitStr += '</select>';
		splitStr += '<li>&nbsp;&nbsp;';
	}else{
		splitStr += '<input type="hidden" id="pageNumberId" name="pageNumber">';
	}
	
	if(isSelectSize == true){
		splitStr += '<li><select id="pageSizeId" name="pageSize" onChange="splitPage(1);" style="width: 90px; height:35px;">';
		
		var optionStr = '<option value="10">每页10条</option>';
		optionStr += '<option value="20">每页20条</option>';
		optionStr += '<option value="40">每页40条</option>';
		optionStr += '<option value="80">每页80条</option>';
		optionStr += '<option value="100">每页100条</option>';
		optionStr += '<option value="200">每页200条</option>';
		optionStr = optionStr.replace('"' + pageSize + '"', '"' + pageSize + '" selected="selected"');
		
		splitStr += optionStr;
		
		splitStr += '</select></li>';
	}else{
		splitStr += '<input type="hidden" id="pageSizeId" name="pageSize">';
	}
	
	splitStr += '&nbsp;&nbsp;<li>共<strong>' + totalRow + '</strong>条记录</li>';
	
	splitStr += '</ul>';

	splitStr += '<input type="hidden" id="orderColunmId" name="orderColunm" value="'+orderColunm+'"/>';
	splitStr += '<input type="hidden" id="orderModeId" name="orderMode" value="'+orderMode+'"/>';
	
	return splitStr;
}

/**
 * 分页链接处理
 * @param toPage
 */
function splitPage(toPage){
	$("#pageNumberId" ).val(toPage);
	ajaxForm("splitPage");
}

/**
 * 分页列排序点击事件处理
 * @param td
 */
function orderbyFun(colunmName){
	var orderColunmNode = $("#orderColunmId");
	var orderColunm = orderColunmNode.val();
	
	var orderModeNode = $("#orderModeId");
	var orderMode = orderModeNode.val();
	
	if(colunmName == orderColunm){
		if(orderMode == ""){
			orderModeNode.val("asc");
		}else if(orderMode == "asc"){
			orderModeNode.val("desc");
		}else if(orderMode == "desc"){
			orderModeNode.val("");
		}
	}else{
		orderColunmNode.val(colunmName);
		orderModeNode.val("asc");
	}
	//alert(orderColunmNode.val()+"--"+orderModeNode.val());
	ajaxForm("splitPage");
}

/**
 * ajax提交form替换content
 * @param formId
 */
function ajaxForm(formId){
	$("#" + formId).ajaxSubmit({
		cache: false,
	    success:  function (data) {
	    	$("#content").html(data);
	    	$('#loading').remove();
			$('#content').fadeIn();
			docReady();
	    }
	});
}

/**
 * ajax请求url替换content
 * @param url
 * @param data
 */
function ajaxContent(url, data){
//	if($('.btn-navbar').is(':visible')){
//		$('.btn-navbar').click();
//	}
//	$('#loading').remove();
//	$('#content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(cxt + url)),
		data : data,
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		cache: false,
		success:function(returnData){
			$("#content").html(returnData);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			// 这个方法有三个参数：XMLHttpRequest 对象，错误信息，（可能）捕获的错误对象。
			// 通常情况下textStatus和errorThown只有其中一个有值
            // alert(XMLHttpRequest.status);
            // alert(XMLHttpRequest.readyState);
            // alert(textStatus);
			alert("请求出现错误！");
        },
        complete: function(XMLHttpRequest, textStatus) { 
        	// 请求完成后回调函数 (请求成功或失败时均调用)。参数： XMLHttpRequest 对象，成功信息字符串。
            // 调用本次AJAX请求时传递的options参数
	    	$('#loading').remove();
			$('#content').fadeIn();
			docReady();
        }
	});
}

/**
 * ajax请求url替换DiaLog
 * @param url
 * @param data
 */
function ajaxDiaLog(url, data){
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
			$('#myModal').modal('show');
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
	$.ajax({
		type : "post",
		url : cxt + "/jf/dept/toUrl",
		data : { "toUrl" : "/pingtai/department/radio.html", "ids" : checkedIds, "deptId" : deptId, "deptName" : deptName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
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
	$.ajax({
		type : "post",
		url : cxt + "/jf/dept/toUrl",
		data : { "toUrl" : "/pingtai/department/checkbox.html", "ids" : checkedIds, "deptId" : deptId, "deptName" : deptName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
		}
	});
}
	
/**
 * 字典单选
 * @param dictId
 * @param dictName
 * @param checkedIds
 */
function dictRadioDiaLog(dictId, dictName, checkedIds){
	$.ajax({
		type : "post",
		url : cxt + "/jf/dict/toUrl",
		data : { "toUrl" : "/pingtai/dict/radio.html", "ids" : checkedIds, "dictId" : dictId, "dictName" : dictName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
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
	$.ajax({
		type : "post",
		url : cxt + "/jf/module/toUrl",
		data : { "toUrl" : "/pingtai/module/radio.html", "ids" : checkedIds, "moduleId" : moduleId, "moduleName" : moduleName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
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
	$.ajax({
		type : "post",
		url : cxt + "/jf/station/toUrl",
		data : { "toUrl" : "/pingtai/station/radio.html", "ids" : checkedIds, "stationId" : stationId, "stationName" : stationName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
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
	$.ajax({
		type : "post",
		url : cxt + "/jf/station/toUrl",
		data : { "toUrl" : "/pingtai/station/checkbox.html", "ids" : checkedIds, "stationId" : stationId, "stationName" : stationName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
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
	$.ajax({
		type : "post",
		url : cxt + "/jf/user/toUrl",
		data : { "toUrl" : "/pingtai/user/radio.html", "ids" : checkedIds, "userId" : userId, "userName" : userName },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
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
	$.ajax({
		type : "post",
		url : cxt + "/jf/user/toUrl",
		data : { "toUrl" : "/pingtai/user/checkbox.html", 
			"checkedDeptIds" : checkedDeptIds, "checkedUserIds" : checkedUserIds,
			"userId" : userId, "userName" : userName, "deptIds" : deptIds, "deptNames" : deptNames 
			},
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
		}
	});
}

/**************************************		功能定制函数	start	***************************************************/

/**
 * 部门负责人设置
 * @param deptId
 */
function setDeptPrincipalDiaLog(deptId){
	$.ajax({
		type : "post",
		url : cxt + "/jf/dept/toUrl",
		data : { "toUrl" : "/pingtai/department/userTree.html", "ids" : deptId },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
		}
	});
}

/**
 * 菜单功能设置
 * @param menuIds
 */
function setMenuOperatorDiaLog(menuIds){
	$.ajax({
		type : "post",
		url : cxt + "/jf/operator/toUrl",
		data : { "toUrl" : "/pingtai/menu/operatorTree.html", "ids" : menuIds },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
		}
	});
}

/**
 * 菜单国际化名称设置
 * @param menuIds
 */
function setMenuEditDiaLog(menuIds){
	$.ajax({
		type : "post",
		url : cxt + "/jf/menu/toEdit",
		data : { "ids" : menuIds },
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
		}
	});
}

/**
 * 角色功能设置
 * @param roleIds
 */
function setRoleOperatorDiaLog(roleIds){
	$.ajax({
		type : "post",
		url : cxt + "/jf/operator/toUrl",
		data : { "toUrl" : "/pingtai/role/operatorTree.html", "ids" : roleIds},
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
		}
	});
}

/**
 * 岗位功能设置
 * @param stationIds
 */
function setStationOperatorDiaLog(stationIds){
	$.ajax({
		type : "post",
		url : cxt + "/jf/operator/toUrl",
		data : { "toUrl" : "/pingtai/station/operatorTree.html", "ids" : stationIds},
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
		}
	});
}

/**
 * 用户的分组设置
 * @param userIds
 */
function groupSelectDialog(userIds){
	$.ajax({
		type : "post",
		url : cxt + "/jf/group/select",
		data : { "ids" : userIds},
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
		}
	});
}

/**
 * 分组的角色设置
 * @param groupIds
 */
function roleSelectDialog(groupIds){
	$.ajax({
		type : "post",
		url : cxt + "/jf/role/select",
		data : { "ids" : groupIds},
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		success:function(data){
			$('#myModal').html(data);
			$('#myModal').modal('show');
		}
	});
}

/**************************************		功能定制函数	end	***************************************************/