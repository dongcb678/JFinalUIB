/*********************************WebUpload 单文件上传 begin*****************************************/

$(function(){
	var $list = $("#thelist");
	var uploader; // 实例化   
	uploader = WebUploader.create({ 
          auto:false, // 是否自动上传
          pick: {
              id: '#attach',
              name: "file",  // 这个地方 name 没什么用，虽然打开调试器，input的名字确实改过来了。但是提交到后台取不到文件。如果想自定义file的name属性，还是要和fileVal 配合使用。
              label: '点击选择文件',
              multiple: false // 默认为true，就是可以多选
          },
          swf: cxt + '/jsfile/webuploader/Uploader.swf',  
          //fileVal:'multiFile',  // 自定义file的name属性，我用的版本是0.1.5 ,打开客户端调试器发现生成的input 的name 没改过来
                                           // 名字还是默认的file,但不是没用哦。虽然客户端名字没改变，但是提交到到后台，是要用multiFile 这个对象来取文件的，用file 是取不到文件的
                                           // 建议作者有时间把这个地方改改啊
          server: cxt + "/platform/upload/slice",  
          duplicate: true, // 是否可重复选择同一文件
          resize: false,
          formData: {
              "param1": "value"
          },  
          compress: null, // 图片不压缩
          chunked: true,  // 分片处理
          chunkSize: 5 * 1024 * 1024, // 每片5M
          chunkRetry: false, // 如果失败，则不重试
          threads: 1, // 上传并发数，允许同时最大上传进程数
          // runtimeOrder: 'flash',  
          // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开
          disableGlobalDnd: true
	});  
     
  	// 当有文件添加进来的时候
	uploader.on("fileQueued", function(file) {
	  	console.log("文件大小(MB):" + file.size/(1024 * 1024));
  		if(file.size > (100 * 1024 * 1024)){ //大于100MB直接结束
  			return false;
  		}
		$list.append( "<div id='"+  file.id + "' class='item'>" +
	             "<h4 class='info'>" + file.name + "</h4>" +
	             "<p class='state'>等待上传...</p>" +
	         "</div>" );
	});

    // 文件上传过程中创建进度条实时显示。
    uploader.on('uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
            $percent = $li.find('.progress .progress-bar');

        // 避免重复创建
        if ( !$percent.length ) {
            $percent = $('<div class="progress progress-striped active">' +
              '<div class="progress-bar" role="progressbar" style="width: 0%; background-color: red;">' +
              '</div>' +
            '</div>').appendTo( $li ).find('.progress-bar');
        }

        $li.find('p.state').text('上传中');

  		//console.log("li:"+ $li.html());
  		//console.log("进度:"+ parseInt(percentage * 100) + '%');
  		
        $percent.css( 'width', percentage * 100 + '%' ).html("上传进度:" + parseInt(percentage * 100) + '%');
    });

    // 当某个文件的分块在发送前触发
    uploader.on("uploadBeforeSend",function(object, data){
    	console.log("uploadBeforeSend");
    	console.log(object);
    	console.log(data);
    })
     
    // 当所有文件上传结束时触发
    uploader.on("uploadFinished",function(){
    	console.log("uploadFinished:");
    });
     
    // 当某个文件上传到服务端响应后，会派送此事件来询问服务端响应是否有效
    uploader.on("uploadAccept", function(object, ret){
    	var data = JSON.parse(ret._raw); // 服务器响应了，ret._raw  类似于 data
    	console.log(data.status);
    	if(data.status != "success"){
    		uploader.reset();
    		alert("error");
    		return false;
    	}
    });
     
    // 当文件上传成功时触发
    uploader.on("uploadSuccess", function(file) {
        $("#"+file.id).find("p.state").text("已上传");
    });

    // 当文件上传失败时触发
    uploader.on("uploadError", function(file) {
    	$("#"+file.id).find("p.state").text("上传出错");
        uploader.cancelFile(file);
        uploader.removeFile(file,true);
        //uploader.reset();
    });

    // 上传结束
    uploader.on('uploadComplete', function( file ) {
        //$( '#'+file.id ).find('.progress').fadeOut();
    });

    // 上传点击事件
    $("#upload").on("click", function() {
    	uploader.upload();
    })
});
/*********************************WebUpload 单文件上传 end*******************************************/

/*********************************WebUpload 多文件上传 begin*****************************************/
$(function(){
  var $list = $("#thelist1");
  var fileSize = 0;  // 总文件大小
  var fileName = []; // 文件名列表
  var fileSizeOneByOne = []; // 每个文件大小
  var  uploader ; // 实例化   
  
  uploader = WebUploader.create({ 
         auto: false, // 是否自动上传
         pick: {
              id: '#multi',
              label: '点击选择文件',
              name: "multiFile"
          },
          swf: cxt + '/jsfile/webuploader/Uploader.swf',  
          fileVal: 'multiFile', // 和name属性配合使用
          server: cxt + "/platform/upload/slices",
          duplicate: true, // 同一文件是否可重复选择
          resize: false,
          formData: {
        	  "param1": "value"
          },  
          compress: null, // 图片不压缩
          chunked: true,  // 分片
          chunkSize: 5 * 1024 * 1024,   // 每片5M
          chunkRetry: false, // 如果失败，则不重试
          threads: 1, // 上传并发数。允许同时最大上传进程数。
          // fileNumLimit:50, // 验证文件总数量, 超出则不允许加入队列
          // runtimeOrder: 'flash',  
          // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。  
          disableGlobalDnd: true
      });  
  
    // 当有文件添加进来的时候
  	uploader.on("fileQueued", function( file ) {
	  	console.log("文件大小(MB):" + file.size/(1024 * 1024));
  		if(file.size > (100 * 1024 * 1024)){ //大于100MB直接结束
  			return false;
  		}
        $list.append( "<div id='"+  file.id + "' class='item'>" +
        		"<h4 class='info'>" + file.name + "</h4>" +
             	"<p class='state'>等待上传...</p>" +
        	"</div>" );
    });

    // 文件上传过程中创建进度条实时显示。
    uploader.on('uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
            $percent = $li.find('.progress .progress-bar');

        // 避免重复创建
        if ( !$percent.length ) {
            $percent = $('<div class="progress progress-striped active">' +
              '<div class="progress-bar" role="progressbar" style="width: 0%; background-color: red;">' +
              '</div>' +
            '</div>').appendTo( $li ).find('.progress-bar');
        }

        $li.find('p.state').text('上传中');

  		//console.log("li:"+ $li.html());
  		//console.log("进度:"+ parseInt(percentage * 100) + '%');
  		
        $percent.css( 'width', percentage * 100 + '%' ).html("上传进度:" + parseInt(percentage * 100) + '%');
    });

  	// 当开始上传流程时触发
    uploader.on("startUpload", function() {
       console.log("startUpload");
       //添加额外的表单参数
       $.extend( true, uploader.options.formData, {"fileSize":fileSize,"multiFileName":fileName,"fileSizeOneByOne":fileSizeOneByOne}); 
    });
     
    //当某个文件上传到服务端响应后，会派送此事件来询问服务端响应是否有效。
    uploader.on("uploadAccept", function(object,ret){
    	var data = JSON.parse(ret._raw); // 服务器响应了，ret._raw  类似于 data
     	console.log(data.status);
     	if(data.status != "success"){
     		uploader.reset();
     		alert("error");
     		return false;
     	}
    });
    
    // 上传成功
    uploader.on("uploadSuccess", function( file ) {
    	$("#" + file.id).find("p.state").text("已上传");
    });

    // 出错之后要把文件从队列中remove调，否则，文件还在队里中，还是会上传到后台去
    uploader.on("uploadError", function(file, reason) {
    	$("#" + file.id).find("p.state").text("上传出错");
    	console.log("uploadError");
    	console.log(file);
    	console.log(reason);
        //多个文件
        var fileArray = uploader.getFiles();
        for(var i = 0 ;i<fileArray.length;i++){
        	//取消文件上传
        	uploader.cancelFile(fileArray[i]);
        	//从队列中移除掉
        	uploader.removeFile(fileArray[i],true);
        }
        //发生错误重置webupload,初始化变量
        uploader.reset();
        fileSize = 0;
        fileName = [];
        fileSizeOneByOne=[];
     });

    // 上传结束
    uploader.on('uploadComplete', function( file ) {
        //$( '#'+file.id ).find('.progress').fadeOut();
    });

    //当validate不通过时，会以派送错误事件的形式通知调用者
    uploader.on("error",function(){
    	console.log("error");
    	uploader.reset();
    	fileSize = 0;
        fileName = [];
        fileSizeOneByOne=[];
        alert("error");
    });

     //如果是在模态框里的上传按钮，点击file的时候不会触发控件
     //修复model内部点击不会触发选择文件的BUG
     /*    $("#multi .webuploader-pick").click(function () {
            uploader.reset();
            fileSize = 0;
            fileName = [];
            fileSizeOneByOne=[];
                $("#multi :file").click();
            });*/
        
    /**
    * 多文件上传
    */
    $("#multiUpload").on("click",function(){
    	uploader.upload();
    });
    
    /**
    *取得每个文件的文件名和文件大小
    */
    //选择文件之后执行上传  
    $(document).on("change","input[name='multiFile']", function() {
    	//multiFileName
        var fileArray1 = uploader.getFiles();
        var fileNames = [];
        for(var i = 0; i<fileArray1.length; i++){
        	fileNames.push(fileArray1[i].name); // input 框用
        	//后台用
        	fileSize += fileArray1[i].size;
        	fileSizeOneByOne.push(fileArray1[i].size);
        	fileName.push(fileArray1[i].name);
        }
        console.log(fileSize);
        console.log(fileSizeOneByOne);
        console.log(fileName);
    });
});
/*********************************WebUpload 多文件上传 end*****************************************/

/************************************webuploader的自带参数提交到后台的参数列表*************************
 * {

//web uploader 的自带参数 
lastModifiedDate=[Wed Apr 27 2016 16:45:01 GMT+0800 (中国标准时间)], 
chunks=[3], chunk=[0], 
type=[audio/wav], uid=[yangl],  id=[WU_FILE_0], 
size=[268620636], name=[3.wav],

//formData的参数
contentsDto.contentsId=[0000004730], existFlg=[false], 
status=[file], uploadNum=[0000004730]
}

可以用这个方法打印webuploader的自带参数列表，基本上就是上面的那一些
 //当某个文件的分块在发送前触发
 uploader.on("uploadBeforeSend",function(object ,data){
   console.log("uploadBeforeSend");
   console.log(object);
   console.log(data);
 })
*********************************************************************************************/
 
