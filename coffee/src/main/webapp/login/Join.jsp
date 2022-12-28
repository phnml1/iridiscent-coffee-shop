<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입완료</title>
<link href="qnadesign.css" rel="stylesheet" type="text/css">
<link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Amatic+SC&family=Cinzel:wght@600&family=Manrope:wght@300&family=Roboto&display=swap");
      @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
      @import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);
      @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
    </style>

</head>

<body>

        <div class="rightcon">
                <div class="tablestyle">
                <% request.setCharacterEncoding("utf-8"); %>
                 <jsp:useBean id="user" class="my.model.User"/>
                 <jsp:setProperty property="*" name="user"/>
                 <%
                     Connection conn = ConnectionProvider.getConnection();
                 try {
                	 UserDao dao = new UserDao();
                	 user.setLoginTime(new java.util.Date());
                	 dao.insert(conn,user);
                	 
                 }catch(SQLException e){}
                 %>
                회원가입을 축하합니다 !
                 <script type="text/javascript">alert("회원가입이 완료되었습니다.")
                      		location.href="../index.jsp";
                      </script>
         </div>
    </div>


</body>
</html>
