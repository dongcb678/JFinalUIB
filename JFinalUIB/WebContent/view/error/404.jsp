<%@ page language="java" isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>404-页面没有找到</title>
    
	<link rel="icon" href="${pageScope.cxt}/files/images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="${pageScope.cxt}/files/images/favicon.ico" type="image/x-icon" />
	
	<meta name="robots" content="nofollow">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style>
		*{
			margin:0;
			padding:0;
		}
		body{
			font-family: 'Audiowide', cursive, arial, helvetica, sans-serif;
			background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAUElEQVQYV2NkYGAwBuKzQAwDID4IoIgxIikAMZE1oRiArBDdZBSNMIXoJiFbDZYDKcSmCOYimDuNSVKIzRNYrUYOFuQgweoZbIoxgoeoAAcAEckW11HVTfcAAAAASUVORK5CYII=) repeat;
			background-color:#212121;
			color:white;
			font-size: 18px;
			padding-bottom:20px;
		}
		.error-code{
			font-family: 'Creepster', cursive, arial, helvetica, sans-serif;
			font-size: 200px;
			color: white;
			color: rgba(255, 255, 255, 0.98);
			width: 50%;
			text-align: right;
			margin-top: 5%;
			text-shadow: 5px 5px hsl(0, 0%, 25%);
			float: left;
		}
		.not-found{
			width: 47%;
			float: right;
			margin-top: 5%;
			font-size: 50px;
			color: white;
			text-shadow: 2px 2px 5px hsl(0, 0%, 61%);
			padding-top: 70px;
		}
		.clear{
			float:none;
			clear:both;
		}
		.content{
			text-align:center;
			line-height: 30px;
		}
		input[type=text]{
			border: hsl(247, 89%, 72%) solid 1px;
			outline: none;
			padding: 5px 3px;
			font-size: 16px;
			border-radius: 8px;
		}
		a{
			text-decoration: none;
			color: #9ECDFF;
			text-shadow: 0px 0px 2px white;
		}
		a:hover{
			color:white;
		}

	</style>
</head>
<body>
	
	<p class="error-code">
		404 
	</p>
	<p class="not-found">Not<br/>Found</p>
	<div class="clear"></div>
	<div class="content">
		您访问的页面没有找到。
		<br/><a href="${requestScope.cxt}/jf/">回到主页</a> 或者<br/><form>搜索<br/><input autofocus type="text" name="search" /></form>
	</div>
	
	<div style="display:none;">
  		<p class="message">query_string：${requestScope["javax.servlet.forward.query_string"]}</p>
  		<p class="message">status_code：${requestScope["javax.servlet.error.status_code"]}</p>
  		<p class="message">message：${requestScope["javax.servlet.error.message"]}</p>
  		<p class="message">exception_type：${requestScope["javax.servlet.error.exception_type"]}</p>
  		<p class="message">request_uri：${requestScope["javax.servlet.forward.request_uri"]}</p>
  		<p class="message">error.message：${requestScope["javax.servlet.error.message"]}</p>
    </div>
    
</body>
</html>
