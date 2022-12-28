<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Iridiscent Coffee</title>
    <link href="index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
      window.onload = function () {
        const a = document.querySelector("#wrap");
        a.className = "openwindow";
      };
    </script>
    </head>
    <body>
<div id="wrap" class="closewindow">
       <div id="header">
        <a href="../index.jsp"
          ><div id="toplogo">
            <img src="images/logo.png" width="167" height="69" />
          </div>
        </a>
        <div id="menu">
          <div id="menuitem">
            <div id="coffeeheader">
              <a href="../items/countryitem.jsp">Coffee</a>
              <ul id="coffeeheader_contents">
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="../items/countryitem.jsp">나라별 커피</a></li>
                <li><a href="../items/dripitem.jsp">드립백</a></li>
                <li><a href="../items/Etcitem.jsp">관련상품</a></li>
              </ul>
            </div>
          </div>
          <div id="menuitem"><a href="../pages/aboutus.jsp">About us</a></div>
          <div id="menuitem"><a href="../board/ReviewList.jsp">Review</a></div>
           <% if(session.getAttribute("LOGINID")==null){ %>
          <div id="menuitem2"><a href="../login/LoginForm.jsp">로그인</a></div>
          <%} else { %>
          <div id="menuitem2"><a href="../login/Logout.jsp">로그아웃</a></div>
          <%} %>
          <div id="menuitem2"><a href="../login/JoinForm.jsp">회원가입</a></div>
          <div id="menuitem2"><a href="../board/BoardList.jsp">고객센터</a></div>
        </div>
      </div>
      <div id="page">
<% request.setCharacterEncoding("utf-8");  %> 
<jsp:useBean id="review" class="my.model.Review"/>
<jsp:setProperty property="*" name="review"/>   
        
<%
		String loginId = (String)session.getAttribute("LOGINID");
		if (!review.getUserId().equals(loginId)){
%>
		<script type="text/javascript">
			alert("게시글 작성자만 수정할 수 있습니다.");
			history.go(-1);
		</script>
<%
		}
		else{
		Connection conn = ConnectionProvider.getConnection();
		review.setBdate(new java.util.Date());
		review.setUserId((String)session.getAttribute("LOGINID"));
		
		try {
			ReviewDao dao = new ReviewDao();
			dao.update(conn, review);
		}catch(SQLException e){}
		finally { 
			JdbcUtil.close(conn);
		}
		}
%>        
        <div class="rightcon">
                
                <div class="tablestyle">
         <h3>게시글 수정이 완료되었습니다.</h3> <br><br>
         <a href="../index.jsp">[홈으로]</a>             
                </div>
         </div>
    </div>


</body>
</html>
</html>