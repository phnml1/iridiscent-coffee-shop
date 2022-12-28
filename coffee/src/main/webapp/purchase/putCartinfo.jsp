<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page
import="my.dao.*,my.model.*,my.util.*,java.sql.*,java.util.*" %> <%@ taglib
prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>장바구니 페이지</title>
      <link href="order.css" rel="stylesheet" type="text/css">
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
              <a href="./items/countryitem.jsp">Coffee</a>
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
    <%  Integer pCount=(Integer)session.getAttribute("pCount"); if(pCount==null) { pCount =
    new Integer(0); }%>
    <b><center> <img src="images/cart.png" width="30" height="30"> 고객님의 장바구니 리스트입니다 </center></b>
    <br /><br />
    <hr />
    <br /><br />
    <% Cart cart = null; for(int i=1; i<= pCount.intValue(); i++) { cart =
    (Cart)session.getAttribute("p" + i); %>

    <img
      src="/coffee/uploadfile/<%= cart.getImage() %>"
      width="150"
      height="150"
    />
    <%=cart.getTitle()    %>
       수량: <%= cart.getAmount() %> <br />
       
    <% } %>
    <hr />
    <input type="button" value="구매하기" onclick="purchaseCart()" />
    <a href="/coffee/index.jsp"> 홈으로 돌아가기 </a>&nbsp;
    <a href="./cartdeleteinfo.jsp"> 카트 비우기 </a>
    <br /><br />
    </div>
    </div>
    <script>
      function purchaseCart() {
        var input = confirm("구매하시겠습니까?");
        if (input) {
          window.open("/coffee/purchase/cartpurchase.jsp", "구매");
        }
      }
    </script>
  </body>
</html>
