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
    </style>
  <script>
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
          <div id="menuitem"><a href="../board/BoardList.jsp">Q&A</a></div>
          <% if(session.getAttribute("LOGINID")==null){ %>
          <div id="menuitem2"><a href="./LoginForm.jsp">로그인</a></div>
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
                <li><a href="./Logout.jsp">로그아웃</a></li>
              </ul>
            </div>
            </div>
          <%} %>
          <div id="menuitem2"><a href="./JoinForm.jsp">회원가입</a></div>
          <% if(session.getAttribute("LOGINID")!=null){ %>
          <div id="menuitem2"><a href="../purchase/putCartinfo.jsp">장바구니</a></div>
        <%} %>
      </div>
      </div>
    <div id="loginpage">
      <div id="banner"></div>
      <div id="middle_brg">
        <div id="loginform">
          <div align="center">LOGIN</div>
        </div>
        <div class="logincon">
          <div class="tablestyle">
            <form action="Login.jsp" method="post">
              <table border="0" cellpadding="0" cellspacing="0" id="registerform">
                <tr>

                  <td><label for="userId"></label>
                    <input type="text" name="userId" id="userId" placeholder="아이디">
                  </td>
                </tr>
                <tr>

                  <td><label for="password"></label>
                    <input type="password" name="userPw" id="userPw" placeholder="패스워드">
                  </td>
                </tr>
                <tr>
                  <td colspan="2" class="center"><input type="submit" name="join" id="join" value="로그인"></td>
                </tr>
              </table>
            </form>
          </div>
        </div>
      </div>
      <div id="footer">
        <div id="footercom">
          <div id="footercompanyeng">IRIDISCENT COFFEE</div>
          <div id="footercompanykor">이리디센트 커피</div>
        </div>
        <div id="teamname">
          <div id="teamleadername">팀장: 이주영</div>
          <div id="teammembername">팀원: 최승연 김예원</div>
        </div>
        <ul id="footeritem">
          <li id="footeritems">
            <a href="./items/countryitem.jsp" id="footeritemlink">Coffee</a>
          </li>
          <li id="footeritems">
            <a href="./pages/aboutus.html" id="footeritemlink">About us</a>
          </li>
          <li id="footeritems"><a href="#" id="footeritemlink">Q&A</a></li>
        </ul>
        <div id="footeradress">
          주소 : 경기도 시흥시 산기대학로 237<br />
          전화 : 031-8041-1000
        </div>
      </div>
    </div>



</body>

</html>