<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% 
	StringBuilder sb = new StringBuilder();
	sb.append(request.getScheme()).append("://").append(request.getServerName()).append(":").append(request.getServerPort()).append(request.getContextPath());
	String path = sb.toString();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<meta http-equiv="Content-Language"  content="ja" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<title>分片上传</title>
	<link href="<%=path%>/jsfile/webuploader/webuploader.css" rel="stylesheet" type="text/css" />
	    
    <script type="text/javascript">
    	var cxt = "<%=path%>";
    </script>
    
	<script type="text/javascript" src="<%=path%>/jsfile/jquery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jsfile/webuploader/webuploader.js"></script>
</head>
<body>

	<div id="uploader" class="wu-example">
	    <!--用来存放文件信息-->
	    <div id="thelist" class="uploader-list"></div>
	    <div class="btns">
	        <div id="attach"></div>
	        <input type="button" value="上传" id="upload"/> 
	    </div>
	</div>
	
	<br/><br/><br/>
	<br/><br/><br/>
	
	<div id="uploader1" class="wu-example">
	    <!--用来存放文件信息-->
	    <div id="thelist1" class="uploader-list"></div>
	    <div class="btns">
	        <div id="multi"></div>
	        <input type="button" value="上传" id="multiUpload"/> 
	    </div>
	</div>

	<script type="text/javascript" src="<%=path%>/jsfile/webuploader/slice.js"></script>
	
</body>
</html>