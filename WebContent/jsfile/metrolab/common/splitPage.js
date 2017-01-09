/**
 * 分页处理方法集合
 */
var common_splitPage = function() {

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
	 * @param startRow
	 * @param endRow
	 * @returns {String}
	 */
	var splitPageHtml = function(divId, formId, totalRow, pageSize, pageNumber, totalPages, isSelectPage, isSelectSize, orderColunm, orderMode, currentPageCount, startRow, endRow){
		var splitStr = '';
		
		splitStr += '<ul>';
		
		if (pageNumber == 1 || totalPages == 0) {
			splitStr += '<li><a href="javascript:void(0)">' + i18n_common_splitPage_previous + '</a></li>';
		} else {
			splitStr += '<li><a href="javascript:common_splitPage.splitPageLink(\''+divId+'\', \''+formId+'\', ' + (pageNumber - 1) + ');">' + i18n_common_splitPage_previous + '</a></li>';
		}
		
		for (var i = 1; i <= totalPages; i++) {
	        if (i == 2 && (pageNumber - 4) > 1) {
	        	splitStr += '<li><a href="javascript:void(0)">...</a></li>';
	            i = pageNumber - 4;
	            
	        } else if (i == (pageNumber + 4) && (pageNumber + 4) < totalPages) {
	        	splitStr += '<li><a href="javascript:void(0)">...</a></li>';
	            i = totalPages - 1;
	            
	        } else {
	            if (pageNumber == i) {
	            	splitStr += '<li class="active"><a href="javascript:void(0)" style="color: #272727; font-size: 14px; text-decoration: none;">' + pageNumber + '</a></li>';
	            } else {
	            	splitStr += '<li><a href="javascript:common_splitPage.splitPageLink(\''+divId+'\', \''+formId+'\', ' + i + ');" style="color: #898989; font-size: 14px;">';
	            	splitStr += i;
	            	splitStr += '</a></li>';
	            }
	        }
	    }
		
		if (pageNumber == totalPages || totalPages == 0) {
			splitStr += '<li><a href="javascript:void(0)">' + i18n_common_splitPage_next + '</a></li>';
		} else {
			splitStr += '<li><a href="javascript:common_splitPage.splitPageLink(\''+divId+'\', \''+formId+'\', ' + (pageNumber + 1) + ');">' + i18n_common_splitPage_next + '</a></li>';
		}
		
		if(isSelectPage == true){
			splitStr += '&nbsp;&nbsp;<li><select name="pageNumber" onChange="common_splitPage.splitPageLink(\''+divId+'\', \''+formId+'\', this.value);" style="width: 120px; height:30px;">';
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
			splitStr += '<li><select name="pageSize" onChange="common_splitPage.splitPageLink(\''+divId+'\', \''+formId+'\', 1);" style="width: 100px; height:30px;">';
			
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
		
		splitStr += '&nbsp;&nbsp;<li>显示<strong>' + startRow + '至<strong>' + endRow + '</strong>条，共<strong>' + totalRow + '</strong>' + i18n_common_splitPage_records + '</li>';
		
		splitStr += '</ul>';
		
		splitStr += '<input type="hidden" name="orderColunm" value="'+orderColunm+'"/>';
		splitStr += '<input type="hidden" name="orderMode" value="'+orderMode+'"/>';
		
		return splitStr;
	};
	
	/**
	 * 分页链接处理
	 * @param divId
	 * @param formId
	 * @param toPage
	 */
	var splitPageLink = function(divId, formId, toPage){
		//alert($("#" + formId + " select[name=pageNumber]").attr("name"));//input[name=pageNumber]
		$("#" + formId + " select[name=pageNumber],input[name=pageNumber] ").val(toPage);
		if(divId == "main-content"){
			common_ajax.ajaxFormMainPanel(formId);
		}else{
			common_ajax.ajaxFormDiv(divId, formId);
		}
	};
	
	/**
	 * 分页列排序点击事件处理
	 * @param divId
	 * @param formId
	 * @param colunmName
	 */
	var orderbyFun = function(divId, formId, colunmName){
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
		
		if(divId == "main-content"){
			common_ajax.ajaxFormMainPanel(formId);
		}else{
			common_ajax.ajaxFormDiv(divId, formId);
		}
	};
	
	return {
		splitPage : splitPageHtml,
		splitPageLink : splitPageLink,
		orderbyFun : orderbyFun
	};
	
}();
