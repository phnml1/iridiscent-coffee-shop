<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.dao.*,my.model.*,my.util.*,java.sql.*,java.util.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="order.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
     session.removeAttribute("p");
	 session.removeAttribute("pCount");
	 String referer = (String)request.getHeader("REFERER");
	 response.sendRedirect(referer);
	 
	%>

	
</body>
</html>