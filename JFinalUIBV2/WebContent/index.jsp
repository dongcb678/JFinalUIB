<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	//response.sendRedirect("/jf/platform/login");
	request.getRequestDispatcher("/jf/platform/login").forward(request, response);
%>