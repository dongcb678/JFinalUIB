var Modals = function() {
	"use strict";
	
	//function to initiate bootstrap extended modals
	var initModals = function() {
		$.fn.modalmanager.defaults.resize = true;
		$.fn.modal.defaults.spinner = $.fn.modalmanager.defaults.spinner = '<div class="loading-spinner" style="width: 200px; margin-left: -100px;">' + '<div class="progress progress-striped active">' + '<div class="progress-bar" style="width: 100%;"></div>' + '</div>' + '</div>';
		var $modal = $('#ajax-modal');
		$('.ajax .demo').on('click', function() {
			// create the backdrop and wait for next modal to be triggered
			$('body').modalmanager('loading');
			setTimeout(function() {
				$modal.load('modal_ajax_test.html', '', function() {
					$modal.modal();
				});
			}, 1000);
		});
		$modal.on('click', '.update', function() {
			$modal.modal('loading');
			setTimeout(function() {
				$modal.modal('loading').find('.modal-body').prepend('<div class="alert alert-info fade in">' + 'Updated!<button type="button" class="close" data-dismiss="alert">&times;</button>' + '</div>');
			}, 1000);
		});
	};
	
	//function to initiate programmatic dialog boxes
	var initDialogBoxes = function() {
		var dialogBoxes = {};

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
			var ids = getCheckFunc('dataTable');
			if(ids != ""){
				bootbox.confirm("确定要这样操作吗？", function(result) {
					if(result){
						var data = {'ids' : getCheckFunc('dataTable')};
						ajaxContent(url, data);
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
					ajaxContent(url);
				}
			});
		};
	};
	
	return {
		init : function() {
			// initModals();
			initDialogBoxes();
		}
	};
}(); 