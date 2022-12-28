<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>1:1문의하기</title>
<link href="qnadesign.css" rel="stylesheet" type="text/css">

</head>

<body>
        <div class="rightcon">
             
                <div class="tablestyle">
                 <%
                
                 session.removeAttribute("LOGINID");
                 session.removeAttribute("pCount");
                 response.sendRedirect("/coffee/index.jsp");
               
                 %>
                 <center><h3>로그아웃 되었습니다.</h3></center>
                 <a href="../index.jsp">[홈으로]</a>
                </div>
         </div>
    </div>


</body>
</html>
