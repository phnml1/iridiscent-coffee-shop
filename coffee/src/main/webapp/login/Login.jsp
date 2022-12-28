<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>1:1문의하기</title>
<link href="qnadesign.css" rel="stylesheet" type="text/css">

</head>

<body>

        <div class="rightcon">
                <img src="images/title2.jpg" width="464" height="58" alt="고객등록">
                <div class="tablestyle">
        <%	request.setCharacterEncoding("utf-8"); %>
        <jsp:useBean id="user" class="my.model.User"/>
        <jsp:setProperty property="*" name="user"/>
        <%
        	Connection conn = ConnectionProvider.getConnection();
        	try {
        		UserDao dao = new UserDao();
        		user.setLoginTime(new java.util.Date());
        		if (dao.checkPassword(conn, user.getUserId(), user.getUserPw())){
        			session.setAttribute("LOGINID", user.getUserId());
        			if (user.getUserId().equals("admin")){
        				response.sendRedirect("/coffee/items/list.jsp");
        			} else {
        				response.sendRedirect("/coffee/index.jsp");
        			}
        		} else {
%>
		<script type="text/javascript">
			alert("패스워드가 틀립니다. 다시 입력해주세요.");
			history.go(-1);
		</script>
<%        			
        		}
        	}catch(SQLException e){}
%>  
       
                </div>
         </div>
    </div>


</body>
</html>