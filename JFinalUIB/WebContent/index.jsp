<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	//response.sendRedirect("/jf/login");
	request.getRequestDispatcher("/jf/login").forward(request, response);
%>