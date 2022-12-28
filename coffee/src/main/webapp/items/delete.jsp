<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>s
<%@ page import="my.dao.*,my.model.*,my.util.*,java.sql.*,java.util.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>상품 삭제완료</title>
    <link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
  />
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Roboto&display=swap");
      @import url("https://fonts.googleapis.com/css2?family=Amatic+SC&family=Cinzel:wght@600&family=Manrope:wght@300&family=Roboto&display=swap");
      @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
      @import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);
      @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
    </style>
    <link href="./item.css" rel="stylesheet" type="text/css" />
    <script>
      window.onload = function () {
      const a = document.querySelector("#wrap");
      a.className = "openwindow";
    };
    </script>
  
  </head>
  <body link="#4c4c4c" vlink="black" alink="navy">
    <div id="wrap" class="closewindow">
      <div id="header">
        <a href="../index.html"
          ><div id="toplogo">
            <img src="images/logo.png" width="167" height="69" />
          </div>
        </a>
        <div id="menu">
          <div id="menuitem">
            <div id="coffeeheader">
              <a href="./countryitem.jsp">Coffee</a>
              <ul id="coffeeheader_contents">
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="./countryitem.jsp">나라별 커피</a></li>
                <li><a href="./dripitem.jsp">드립백</a></li>
                <li><a href="./Etcitem.jsp">관련상품</a></li>
              </ul>
            </div>
          </div>
          <div id="menuitem"><a href="../pages/aboutus.html">About us</a></div>
          <div id="menuitem"><a href="/">Q&A</a></div>
           <% if(session.getAttribute("LOGINID")==null){ %>
          <div id="menuitem2"><a href="../login/LoginForm.jsp">로그인</a></div>
          <%} else { %>
          <div id="menuitem2"><a href="../login/Logout.jsp">로그아웃</a></div>
          <%} %>
          <div id="menuitem2"><a href="/">회원가입</a></div>
          <div id="menuitem2"><a href="/">장바구니</a></div>
        </div>
      </div>
      <div id="page">
        <div class="rightcon">
               
         <div class="tablestyle">
         <% 
         	int pid = Integer.parseInt(request.getParameter("pid"));
         	Connection conn = ConnectionProvider.getConnection();
         	Picture picture = null;
         	try{
         		CoffeeDao dao = new CoffeeDao();
         		dao.deleteById(conn,pid);
         	}catch(SQLException e){}
         	finally{
         		JdbcUtil.close(conn);
         	}
        %> 
        <%= pid %> 상품이 삭제되었습니다. <br><br>
        <a href = "list.jsp" >리스트보기</a>
         </div>
         </div>
</div>

</body>
</html>
