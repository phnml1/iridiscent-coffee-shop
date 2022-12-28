<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ page import = "java.io.PrintWriter" %>	
<% request.setCharacterEncoding("UTF-8"); %>
<!doctype html>
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
      <div id="banner"></div>
<div class="writecon">
      <form action="WriteCheck.jsp" action="post" onsubmit="return checkFun()">
                  <div class = "QNA" align=center>QnA</div>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" id="registerform">
                      <tr>
                        <th><label for="titlefield">제목</label></th>
                        <td>
                        <input name="title" type="text" id="title" size="100"></td>
                      </tr>
               
                      <tr>
                        <th><label for="memo">내용</label></th>
                        <td>
                        <textarea name="memo" cols="100" rows="10" id="memo"></textarea></td>
                      </tr>
                     
                      <tr>
                        <td  height="30" colspan="2" align="center"  class="btnstyle"><input type="submit" align="center" name="send" id="send" value="글 게시하기"></td>
                      </tr>
                  </table>
                  </form>

</div>
</div>
</body>
</html>
