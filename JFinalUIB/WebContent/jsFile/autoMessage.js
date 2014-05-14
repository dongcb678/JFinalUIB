
var heightShowIndex = -1; //代表补全框中的高亮显示索引值
var timeOutId;
		  	
function autoMessage(getDataUrl, toPageUrl){
	var wordInput = $("#word");  //文本框
    var inputOffset = wordInput.offset();//获取匹配元素在当前视口的相对偏移
    
    $("#auto").hide().css("border", "1px black solid").css("position", "absolute").css("z-index",5).css("background-color","white")
    	.css("top", inputOffset.top + wordInput.height()+ 6 + "px")
        .css("left", inputOffset.left + "px").width(wordInput.width() + 5 + "px"); //找到 div 节点设置属性
            
    wordInput.keyup(function(event) {   //为文本框注册事件
        var myEvent = event || window.event;
        var keyCode = myEvent.keyCode;
        //代表字母:>= 65&&<= 90,退格键:8,删除键:46,空格键Spacebar:32,小键盘：1-9,横排0-9:48-57
        if ((keyCode >= 65 && keyCode <= 90) || keyCode == 8 || keyCode == 46 || keyCode==32 || (keyCode >= 96 && keyCode <= 105) || (keyCode >= 48 && keyCode <= 57))
        {
            var wordText = $.trim(wordInput.val());   //取得文本框的值
            if(wordText == ""){
            	$("#auto").hide();
	            heightShowIndex = -1;//隐藏时就不存在补全框，更谈不上高亮索引值
            	return false;
            }
            var data = "[\"aa1\",\"aa2\",\"aa3\",\"aa4\",\"aa5\",\"aa6\",\"aa7\",\"aa8\",\"aa9\"]";
            showData(data);
            //$.post(getDataUrl, {"autoText":wordText}, showData(data));
        //代表向上和向下键
        } else if (keyCode == 38 || keyCode == 40) {
            if (keyCode == 38){//向上
                var autoNodes = $("#auto").children("div");
                if (heightShowIndex != -1)
                { //先把原来高亮显示的值返回到普通的颜色
                    autoNodes.eq(heightShowIndex).css("background-color", "white").css("color", "#000000");
                    heightShowIndex--;
                } else {
                    heightShowIndex = autoNodes.length - 1;
                }

                if (heightShowIndex == -1)
                {  //判断高粱是否已经走到最上面，如果是就回到最后一个下拉框值
                    heightShowIndex = autoNodes.length - 1;
                }
                //然后把现在选中的下拉框值高亮显示
                autoNodes.eq(heightShowIndex).css("background-color", "#00008B").css("color", "white");
            }
            if (keyCode == 40){//向下
                var autoNodes = $("#auto").children("div");
                if (heightShowIndex != -1)
                {  //先把原来高亮显示的值返回到普通的颜色
                    autoNodes.eq(heightShowIndex).css("background-color", "white").css("color", "#000000");
                }
                heightShowIndex++;
                if (heightShowIndex == autoNodes.length)
                {  //判断高粱是否走到最后，如果是就回到第一个下拉框值
                    heightShowIndex = 0;
                }
                //然后把现在选中的下拉框值高亮显示
                autoNodes.eq(heightShowIndex).css("background-color", "#00008B").css("color", "white");
            }
            //代表回车
        } else if (keyCode == 13) {
            //下拉框有值
            if (heightShowIndex != -1)
            {
                var autoNodes = $("#auto").hide().children("div");
                var comText = autoNodes.eq(heightShowIndex).text();//取出高亮显示的文本内容
                heightShowIndex = -1;
                $("#word").val(comText);
            } else {//下拉框没有值
                $("#auto").hide();
                $("#word").get(0).blur();   //让文本框失去焦点
                //alert("文本中的[" + $("#word").val() + "]被提交了");
                if($("#word").val().trim().length != 0){
                	window.location.href = encodeURI(toPageUrl + $("#word").val());
                }
            }
        }
    });
}
			
function showData(data){
	clearTimeout(timeOutId);//取消上次未完成的延迟
	setTimeout(new Function("showAutoSelect('"+data+"')"), 500);
}
			
function showAutoSelect(data) {
    var wordNodes = eval(data);
    var autoNode = $("#auto"); //找到页面的div
    autoNode.html("");    //先清空旧值再填新值
         
    $.each( wordNodes, function(i, n){//alert( "Item #" + i + ": " + n );
		//1.创建div,2.填入数据,3.添加到页面的div
        var newDivNode = $("<div>").attr("id", i);
        newDivNode.html(n).appendTo(autoNode);
        //增加鼠标进入事件,节点高亮显示
        newDivNode.mouseover(function() {
            if (heightShowIndex != -1)
            { //将原来高亮的节点取消高亮显示
                $("#auto").children("div").eq(heightShowIndex).css("background-color", "white").css("color", "#000000");
            }
            heightShowIndex = $(this).attr("id");//记录新的高亮索引
            $(this).css("background-color", "#00008B").css("color", "white");//高亮显示
        });
        //增加鼠标移出事件,取消节点高亮
        newDivNode.mouseout(function() {
            $(this).css("background-color", "white").css("color", "#000000");
        });
        //增加鼠标点击事件
        newDivNode.click(function() {
            var comText = $(this).text();//取出高亮显示的文本内容
            $("#auto").hide();
            heightShowIndex = -1;
            $("#word").val(comText);
        });
 	});

  	//查找到的<word></word>时就显示，否则就隐藏
  	if (wordNodes.length > 0){
      	$("#auto").show();
  	}else{
      	wordNodes.hide();
      	heightShowIndex = -1;//隐藏时就不存在补全框，更谈不上高亮索引值
  	}
}

function getELXY(e){ 
    return {x:e.offsetLeft,y:e.offsetTop}; 
} 

function getELWH(e){ 
    return {w:e.offsetWidth,h:e.offsetHeight}; 
} 

function getClientXY(e){ 
    e=e||event; 
    return {cx:e.clientX,cy:e.clientY}; 
} 

document.onclick = function(e){ 
    var obj = document.getElementById("auto");
    var lt = getELXY(obj)['x']; 
    var rt = getELXY(obj)['x'] + getELWH(obj)['w']; 
    var topY = getELXY(obj)['y']; 
    var bottomY = getELXY(obj)['y'] + getELWH(obj)['h']; 
    var mouseXX = getClientXY(e)['cx']; 
    var mouseYY = getClientXY(e)['cy']; 
    if(mouseXX<lt || mouseXX>rt || mouseYY<topY || mouseYY>bottomY){ 
      obj.style.display="none"; 
    }else{ 

    } 
}; 
