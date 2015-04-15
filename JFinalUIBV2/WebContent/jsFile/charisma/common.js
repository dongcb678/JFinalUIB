/**
 * 提示弹出框
 * @param title
 * @param content
 */
function simpleDialog(title, content){
	var d = dialog({
	    title: title,
	    content: content
	});
	d.showModal();
}

/**
 * 全选、反选
 * @param id
 * @param checked
 */
function checkFunc(id, checked){
	$("#" + id + " input[name='checkIds']").each(function(){
		$(this).prop("checked", checked);
    });
}

/**
 * 全选、反选
 * @param id
 */
function getCheckFunc(id){
	var ids = "";
	$("#" + id + " input[name='checkIds']").each(function(){
		if($(this)[0].checked == true)
		ids += $(this).val() + ",";
    });
	return ids;
}

/**
 * 分页链接HTML
 * @param divId
 * @param formId
 * @param totalRow
 * @param pageSize
 * @param pageNumber
 * @param totalPages
 * @param isSelectPage
 * @param isSelectSize
 * @param orderColunm
 * @param orderMode
 * @param currentPageCount
 * @returns {String}
 */
function splitPageHtml(divId, formId, totalRow, pageSize, pageNumber, totalPages, isSelectPage, isSelectSize, orderColunm, orderMode, currentPageCount){
	var start = 1;
	var end = currentPageCount;
	
	if(pageNumber != 1){
		start = (pageNumber - 1) * pageSize + 1;
		end = start + currentPageCount - 1;
	}
	
	var splitStr = '';
	
	splitStr += '<div class="col-md-12 space20">';
	splitStr += '<div class="dataTables_paginate paging_bootstrap">';
	splitStr += '<ul class="pagination pagination-blue">';
	
	if (pageNumber == 1 || totalPages == 0) {
		splitStr += '<li class="prev disabled"><a href="javascript:void(0)">' + i18n_common_splitPage_previous + '</a></li>';
	} else {
		splitStr += '<li class="prev"><a href="javascript:splitPageLink(\''+divId+'\', \''+formId+'\', ' + (pageNumber - 1) + ');">' + i18n_common_splitPage_previous + '</a></li>';
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
            	splitStr += '<li><a href="javascript:splitPageLink(\''+divId+'\', \''+formId+'\', ' + i + ');" style="color: #898989; font-size: 14px;">';
            	splitStr += i;
            	splitStr += '</a></li>';
            }
        }
    }
	
	if (pageNumber == totalPages || totalPages == 0) {
		splitStr += '<li class="next disabled"><a href="javascript:void(0)">' + i18n_common_splitPage_next + '</a></li>';
	} else {
		splitStr += '<li class="next"><a href="javascript:splitPageLink(\''+divId+'\', \''+formId+'\', ' + (pageNumber + 1) + ');">' + i18n_common_splitPage_next + '</a></li>';
	}
	
	if(isSelectPage == true){
		splitStr += '&nbsp;&nbsp;<li><select name="pageNumber" onChange="splitPageLink(\''+divId+'\', \''+formId+'\', this.value);" style="width: 120px; height:30px;">';
		for (var i = 1; i <= totalPages; i++) {
			if (i == pageNumber) {
				splitStr += '<option selected value="' + i + '">' + i18n_common_splitPage_jump + i + i18n_common_splitPage_jumpPage + '</option>';
			} else {
				splitStr += '<option value="' + i + '">' + i18n_common_splitPage_jump + i + i18n_common_splitPage_jumpPage + '</option>';
			}
		}
		if(totalPages == 0){
			splitStr += '<option value="0">' + i18n_common_splitPage_noJump + '</option>';
		}
		splitStr += '</select>';
		splitStr += '<li>&nbsp;&nbsp;';
	}else{
		splitStr += '<input type="hidden" name="pageNumber">';
	}
	
	if(isSelectSize == true){
		splitStr += '<li><select name="pageSize" onChange="splitPageLink(\''+divId+'\', \''+formId+'\', 1);" style="width: 100px; height:30px;">';
		
		var optionStr = '<option value="10">' + i18n_common_splitPage_perPage + '10' + i18n_common_splitPage_strip + '</option>';
		optionStr += '<option value="20">' + i18n_common_splitPage_perPage + '20' + i18n_common_splitPage_strip + '</option>';
		optionStr += '<option value="40">' + i18n_common_splitPage_perPage + '40' + i18n_common_splitPage_strip + '</option>';
		optionStr += '<option value="80">' + i18n_common_splitPage_perPage + '80' + i18n_common_splitPage_strip + '</option>';
		optionStr += '<option value="100">' + i18n_common_splitPage_perPage + '100' + i18n_common_splitPage_strip + '</option>';
		optionStr += '<option value="200">' + i18n_common_splitPage_perPage + '200' + i18n_common_splitPage_strip + '</option>';
		optionStr = optionStr.replace('"' + pageSize + '"', '"' + pageSize + '" selected="selected"');
		
		splitStr += optionStr;
		
		splitStr += '</select></li>';
	}else{
		splitStr += '<input type="hidden" name="pageSize">';
	}
	
	splitStr += '&nbsp;&nbsp;<li>显示<strong>' + start + '至<strong>' + end + '</strong>条，共<strong>' + totalRow + '</strong>' + i18n_common_splitPage_records + '</li>';
	
	splitStr += '</ul>';

	splitStr += '<input type="hidden" name="orderColunm" value="'+orderColunm+'"/>';
	splitStr += '<input type="hidden" name="orderMode" value="'+orderMode+'"/>';
	
	splitStr += '</div>';
	splitStr += '</div>';
	
	return splitStr;
}

/**
 * 分页链接处理
 * @param divId
 * @param formId
 * @param toPage
 */
function splitPageLink(divId, formId, toPage){
	//alert($("#" + formId + " select[name=pageNumber]").attr("name"));//input[name=pageNumber]
	$("#" + formId + " select[name=pageNumber],input[name=pageNumber] ").val(toPage);
	ajaxForm(divId, formId);
}

/**
 * 分页列排序点击事件处理
 * @param divId
 * @param formId
 * @param colunmName
 */
function orderbyFun(divId, formId, colunmName){
	var orderColunmNode = $("#" + formId + " input[name=orderColunm]");
	var orderColunm = orderColunmNode.val();
	
	var orderModeNode = $("#" + formId + " input[name=orderMode]");
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
	ajaxForm(divId, formId);
}

/**
 * 公共ajax函数
 * @param url
 * @param data
 * @param callback
 * @returns {String}
 */
function ajaxFunc(url, data, callback){
	var result = "";
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(cxt + url)),
		data : data,
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		cache: false,
		success:function(response){
			result = response;
			//扩展回调函数
			if( callback != null ){
				callback();
			}
		}
	});
	return result;
}

/**
 * ajax提交form替换content
 * @param divId 返回替换div
 * @param formId 提交formid
 * @param callback 回调
 */
function ajaxForm(divId, formId, callback){
	$("#" + formId).ajaxSubmit({
		cache: false,
	    success:  function (data) {
	    	if(data != ""){
	    		var toolbarDiv = $("#toolbarDiv");
				toolbarDiv.nextAll().remove();
				toolbarDiv.after(data);
	    	}
	    	
			//扩展回调函数
			if( callback != null ){
				callback();
			}
	    }
	});
}

/**
 * ajax请求url替换指定div
 * @param divId 返回替换div
 * @param url 请求地址
 * @param data 参数
 * @param callback 回调
 */
function ajaxDiv(divId, url, data, callback){
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(cxt + url)),
		data : data,
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		cache: false,
		success:function(returnData){
			$("#" + divId).html(returnData);
			//扩展回调函数
			if( callback != null ){
				callback();
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			alert("请求出现错误！");
        }
	});
}

/**
 * ajax请求url替换div content
 * @param url 请求地址
 * @param data 参数
 * @param callback 回调
 */
function ajaxContent(url, data, callback){
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(cxt + url)),
		data : data,
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		cache: false,
		success:function(returnData){
			var toolbarDiv = $("#toolbarDiv");
			toolbarDiv.nextAll().remove();
			toolbarDiv.after(returnData);
			//扩展回调函数
			if( callback != null ){
				callback();
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			// 这个方法有三个参数：XMLHttpRequest 对象，错误信息，（可能）捕获的错误对象。
			// 通常情况下textStatus和errorThown只有其中一个有值
            // alert(XMLHttpRequest.status);
            // alert(XMLHttpRequest.readyState);
            // alert(textStatus);
			alert("请求出现错误！");
        }
	});
}

/**
 * ajax请求url替换div content
 * @param url 请求URL
 * @param data 请求参数数据
 * @param callback 回调
 */
function ajaxContentConfirm(url, data, callback){alert(222);
	bootbox.confirm("确定要这样操作吗？", function(result) {
		toastr.success('Confirm result: ' + result);
		//ajaxContent(url, data, callback);
	});
}

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