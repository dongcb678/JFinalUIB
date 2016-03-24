var common_modals = function() {
	"use strict";
	
	/**
	 * 注册弹出框事件功能
	 */
	var initModals = function() {
		var progressHtml = '<div class="loading-spinner" style="width: 200px; margin-left: -100px;">' + 
		'<div class="progress progress-striped active">' + 
		'<div class="progress-bar" style="width: 100%;"></div>' + '</div>' + '</div>';
		
		$.fn.modalmanager.defaults.resize = true;
		$.fn.modal.defaults.spinner = $.fn.modalmanager.defaults.spinner = progressHtml;
		
		
		var $modal = $('#ajax-modal');
		/*
		$('.ajaxDialog').on('click', function() {
			// create the backdrop and wait for next modal to be triggered
			$('body').modalmanager('loading');
			
			var url = $(this).attr("data-url");
			url = encodeURI(encodeURI(cxt + url));
			
			var data = $(this).attr("data-param");
			data = "[" + data + "]";
			data = eval(data);
			
			$modal.load(url, data[0], function() {
				$modal.modal();
			});
		});
		*/
		$(document).on("click", ".ajaxDialog", function(e) {
			e.preventDefault();
			// create the backdrop and wait for next modal to be triggered
			$('body').modalmanager('loading');
			
			var url = $(this).attr("data-url");
			url = encodeURI(encodeURI(cxt + url));
			
			var data = $(this).attr("data-param");
			data = "[" + data + "]";
			data = eval(data);
			
			$modal.load(url, data[0], function() {
				$modal.modal();
			});
		});
		
		/*
		$modal.on('click', '.update', function() {alert(222);
			$modal.modal('loading');
			setTimeout(function() {
				$modal.modal('loading').find('.modal-body').prepend('<div class="alert alert-info fade in">' + 'Updated!<button type="button" class="close" data-dismiss="alert">&times;</button>' + '</div>');
			}, 1000);
		});
		*/
	};
	
	/**
	 * 注册单行和多行删除的弹出框确认和Ajax删除处理
	 */
	var initDialogBoxes = function() {
		var dialogBoxes = {};
		// obj.die("click").live(click",function(){})
		$(document).on("click", "button[data-bb]", function(e) {
			e.preventDefault();
			var type = $(this).data("bb");
			var url = $(this).attr("data-url");
			if ( typeof dialogBoxes[type] === 'function') {
				dialogBoxes[type](url);
			}
		});

		/**
		 * 删除单行数据
		 */
		dialogBoxes.deleteList = function(url) {
			var ids = common_common.getCheckFunc('dataTable');
			if(ids != ""){
				bootbox.confirm("确定要这样操作吗？", function(result) {
					if(result){
						var data = {'ids' : ids};
						common_ajax.ajaxMainPanel(url, data);
					}
				});
			}else{
				toastr.warning("请选择操作数据！");
			}
		};
		
		/**
		 * 删除多行数据
		 */
		dialogBoxes.deleteOne = function(url) {
			bootbox.confirm("确定要这样操作吗？", function(result) {
				if(result){
					common_ajax.ajaxMainPanel(url);
				}
			});
		};
	};
	
	/**
	 * 部门单选
	 * @param deptId 点击确认时回写deptId值的地方
	 * @param deptName 点击确认时回写deptName值的地方
	 * @param checkedIds 默认选中的部门
	 */
	var deptRadioDiaLog = function(deptId, deptName, checkedIds){//ids默认选中：4
		var url = "/jf/platform/dept/toUrl";
		var data = { "toUrl" : "/platform/department/radio.html", "ids" : checkedIds, "deptId" : deptId, "deptName" : deptName };
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**
	 * 部门多选
	 * @param deptId 点击确认时回写deptId值的地方
	 * @param deptName 点击确认时回写deptName值的地方
	 * @param checkedIds 默认选中的部门
	 */
	var deptCheckboxDiaLog = function(deptId, deptName, checkedIds){//ids默认选中：4,或者4,5,
		var url = "/jf/platform/dept/toUrl";
		var data = { "toUrl" : "/platform/department/checkbox.html", "ids" : checkedIds, "deptId" : deptId, "deptName" : deptName };
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
		
	/**
	 * 字典单选
	 * @param dictId 数据回填
	 * @param dictName 数据回填
	 * @param checkedIds 默认选中
	 * @param rootNumbers 根节点编号
	 * @param callback 回调
	 */
	var dictRadioDiaLog = function(dictId, dictName, checkedIds, rootNumbers, callback){
		var url = "/jf/platform/dict/toUrl";
		var data = { "toUrl" : "/platform/dict/radio.html", "ids" : checkedIds, "dictId" : dictId, "dictName" : dictName };
		var result = common_ajax.ajaxFunc(url, data, callback);
		return result;
	}
	
	/**
	 * 参数单选
	 * @param dictId 数据回填
	 * @param dictName 数据回填
	 * @param checkedIds 默认选中
	 * @param rootNumbers 根节点编号
	 * @param callback 回调
	 */
	var paramRadioDiaLog = function(dictId, dictName, checkedIds, rootNumbers, callback){
		var url = "/jf/platform/param/toUrl";
		var data = { "toUrl" : "/platform/param/radio.html", "ids" : checkedIds, "paramId" : dictId, "paramName" : dictName };
		var result = common_ajax.ajaxFunc(url, data, callback);
		return result;
	}
	
	/**
	 * 模块单选
	 * @param moduleId
	 * @param moduleName
	 * @param checkedIds
	 */
	var moduleRadioDiaLog = function(moduleId, moduleName, checkedIds){
		var url = "/jf/platform/module/toUrl";
		var data = { "toUrl" : "/platform/module/radio.html", "ids" : checkedIds, "moduleId" : moduleId, "moduleName" : moduleName };
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**
	 * 岗位单选
	 * @param stationId
	 * @param stationName
	 * @param checkedIds
	 */
	var stationRadioDiaLog = function(stationId, stationName, checkedIds){
		var url = "/jf/platform/station/toUrl";
		var data = { "toUrl" : "/platform/station/radio.html", "ids" : checkedIds, "stationId" : stationId, "stationName" : stationName };
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**
	 * 岗位多选
	 * @param stationId
	 * @param stationName
	 * @param checkedIds
	 */
	var stationCheckboxDiaLog = function(stationId, stationName, checkedIds){
		var url = "/jf/platform/station/toUrl";
		var data = { "toUrl" : "/platform/station/checkbox.html", "ids" : checkedIds, "stationId" : stationId, "stationName" : stationName };
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**
	 * 人员单选
	 * @param userId
	 * @param userName
	 * @param checkedIds
	 */
	var userRadioDiaLog = function(userId, userName, checkedIds){
		var url = "/jf/platform/user/toUrl";
		var data = { "toUrl" : "/platform/user/radio.html", "ids" : checkedIds, "userId" : userId, "userName" : userName };
		var result = common_ajax.ajaxFunc(url, data);
		return result;
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
	var userCheckboxDiaLog = function(userId, userName, deptIds, deptNames, checkedDeptIds, checkedUserIds){
		var url = "/jf/platform/user/toUrl";
		var data = { "toUrl" : "/platform/user/checkbox.html", 
				"checkedDeptIds" : checkedDeptIds, "checkedUserIds" : checkedUserIds,
				"userId" : userId, "userName" : userName, "deptIds" : deptIds, "deptNames" : deptNames 
				};
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**************************************		功能定制函数	start	***************************************************/
	
	/**
	 * 部门负责人设置
	 * @param deptId
	 */
	var setDeptPrincipalDiaLog = function(deptId){
		var url = "/jf/platform/dept/toUrl";
		var data = { "toUrl" : "/platform/department/userTree.html", "ids" : deptId };
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**
	 * 菜单功能设置
	 * @param menuIds
	 */
	var setMenuOperatorDiaLog = function(menuIds){
		var url = "/jf/platform/operator/toUrl";
		var data = { "toUrl" : "/platform/menu/operatorTree.html", "ids" : menuIds };
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**
	 * 菜单国际化名称设置
	 * @param menuIds
	 */
	var setMenuEditDiaLog = function(menuIds){
		var url = "/jf/platform/menu/toEdit";
		var data = { "ids" : menuIds };
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**
	 * 角色功能设置
	 * @param roleIds
	 */
	var setRoleOperatorDiaLog = function(roleIds){
		var url = "/jf/platform/operator/toUrl";
		var data = { "toUrl" : "/platform/role/operatorTree.html", "ids" : roleIds};
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**
	 * 岗位功能设置
	 * @param stationIds
	 */
	var setStationOperatorDiaLog = function(stationIds){
		var url = "/jf/platform/operator/toUrl";
		var data = { "toUrl" : "/platform/station/operatorTree.html", "ids" : stationIds};
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**
	 * 用户的分组设置
	 * @param userIds
	 */
	var groupSelectDialog = function(userIds){
		var url = "/jf/platform/group/select";
		var data = { "ids" : userIds};
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**
	 * 分组的角色设置
	 * @param groupIds
	 */
	var roleSelectDialog = function (groupIds){
		var url = "/jf/platform/role/select";
		var data = { "ids" : groupIds};
		var result = common_ajax.ajaxFunc(url, data);
		return result;
	}
	
	/**************************************		功能定制函数	end	***************************************************/	
		
	return {
		init : function() {
			initModals();
			initDialogBoxes();
		}/*,
		deptCheckboxDiaLog : deptCheckboxDiaLog,
		dictRadioDiaLog : dictRadioDiaLog,
		paramRadioDiaLog : paramRadioDiaLog,
		moduleRadioDiaLog : moduleRadioDiaLog,
		stationRadioDiaLog : stationRadioDiaLog,
		stationCheckboxDiaLog : stationCheckboxDiaLog,
		userRadioDiaLog : userRadioDiaLog,
		userCheckboxDiaLog : userCheckboxDiaLog,
		setDeptPrincipalDiaLog : setDeptPrincipalDiaLog,
		setMenuOperatorDiaLog : setMenuOperatorDiaLog,
		setMenuEditDiaLog : setMenuEditDiaLog,
		setRoleOperatorDiaLog : setRoleOperatorDiaLog,
		setStationOperatorDiaLog : setStationOperatorDiaLog,
		groupSelectDialog : groupSelectDialog,
		roleSelectDialog : roleSelectDialog*/
	};
	
}(); 