<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Iridiscent Coffee</title>
    <link href="index.css" rel="stylesheet" type="text/css" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Amatic+SC&family=Cinzel:wght@600&family=Manrope:wght@300&family=Roboto&display=swap");
      @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
      @import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);
      @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
      @import url("https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap");
    </style>
    <script type="text/javascript">
      window.onload = function () {
        const a = document.querySelector("#wrap");
        a.className = "openwindow";
      };
    </script>
    </head>
    <body link="#4c4c4c" vlink="black" alink="navy">
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
          <div id="menuitem"><a href="./BoardList.jsp">Q&A</a></div>
          <% if(session.getAttribute("LOGINID")==null){ %>
          <div id="menuitem2"><a href="../login/LoginForm.jsp">로그인</a></div>
          <%} else { 
        	  String id = (String)session.getAttribute("LOGINID");
          %>
          <div id="userheader">
          	<div id="menuitem2">
              <a href="../pages/Mypage.jsp">로그인정보</a>
              <ul id="userheader_contents">
              
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li>id:<%=id %></li>
                <li><a href="../login/Logout.jsp">로그아웃</a></li>
              </ul>
            </div>
            </div>
          <%} %>
          <div id="menuitem2"><a href="../login/JoinForm.jsp">회원가입</a></div>
          <% if(session.getAttribute("LOGINID")!=null){ %>
          <div id="menuitem2"><a href="../purchase/putCartinfo.jsp">장바구니</a></div>
        <%} %>
      </div>
      </div>

      <div id="page">
      <div id="banner">
      <div id="con">
                  <table width="1024"  align="center">
                    <tr>
                      <th width="100" scope="col">No</th>
                      <th width="250" scope="col">제목</th>
                      <th width="250" scope="col">작성자</th>
                      <th width="352" scope="col">작성시간</th>
                      <th width="100" scope="col">수정</th>
                      <th width="100" scope="col">삭제</th>
                    </tr>
    <%
    String pageNumberStr = request.getParameter("page");
    int pageNumber = 1;
    if (pageNumberStr != null) {
	    pageNumber = Integer.parseInt(pageNumberStr);
    }
    Connection conn = ConnectionProvider.getConnection();
	BoardListView listView = null;
	try {
		BoardDao dao = new BoardDao();
		listView = dao.getBoardList(conn, pageNumber);
	}catch(SQLException e){}
	if (listView != null) {
%>     <c:set var = "listView" value="<%=listView %>" />
                    <c:forEach var="p" items="<%=listView.getPictureList() %>">
                    <tr>
                      <td align="center">${p.boardId}</td>
                      <td align="center"><a href="BoardView.jsp?bid=${p.boardId}">${p.title}</td>
                      <td align="center">${p.userId}</td>
                      <td align="center">${p.bdate}</td>
                      <td align="center"><input type="button" value="수정" onclick="document.location.href='BoardModify.jsp?bid=${p.boardId}&userId=${p.userId}'"></td>
                      <td align="center"><input type="button" value="삭제" onclick="document.location.href='BoardDelete.jsp?bid=${p.boardId}'"></td>
                    </tr>
                    </c:forEach>
                    <tr>
                    <td align="center"><input type="button" value="글쓰기" onclick="document.location.href='BoardWrite.jsp?bid=${b.boardId}'"></td>
                    </tr>
                    </table>
                  
                  
 
          <div id="number">
          <c:forEach var="i" begin="1" end="${listView.pageTotalCount }">
            <a href="BoardList.jsp?page=${i}">[${i}]</a>
          </c:forEach>
          </div>
          <div id="number"> [${listView.currentPageNumber}/${listView.pageTotalCount}]
          </div>
          <% }
        	  JdbcUtil.close(conn);
          %>
          
   </div>
                  </div>
                  </div>

                  </body>
                  </html>