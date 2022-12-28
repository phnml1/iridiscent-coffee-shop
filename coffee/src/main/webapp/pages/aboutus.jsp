<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page
import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>About us</title>
    <link href="index.css" rel="stylesheet" type="text/css" />
    <!--이거 안넣으면 css안들어감-->
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
  <body>
    <!--여기부터-->
    <div id="wrap" class="closewindow">
      <!--class="closewindow"는 코딩하실때는 삭제하세요-->
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
          <div id="menuitem"><a href="./aboutus.jsp">About us</a></div>
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
      <!--여기까지 헤더 html에다가 여기까지 카피-->
      <div id="page">
        <!--반드시! page id가진 div안에 디자인 해주세요!!!-->
        <div id="banner1"></div>

        <div id="aboutusdiv">
          <div id="aboutusdes">
            <h3>irridescent: 한국번역으로는 무지개빛으로 알려져있으나</h3>
            <h4>
              정확한 뜻은 보는 각도에 따라 색이 바뀌는 진주같은 다채로운 빛깔을
              뜻합니다.
            </h4>
            <p>
              저희 irridescent coffeeshop은 신맛, 단맛, 쓴맛 ,짠맛 등<br />
              다양한 맛을 느끼게 할 수 있는 커피의 맛 처럼<br /><br />
              저희 사이트를 방문해 주신 고객님들께 다양한 상품들과 서비스들과<br />
              나라별 최고로 엄선한 원두들과 다양한 관련상품들을 통하여<br />
              고객여러분들께 다채로운 즐거운 경험을 드리고자 노력하고 있습니다.
            </p>
          </div>
          <div id="aboutusphoto"></div>
        </div>
        <div id="aboutusdiv2">
          <div id="aboutusdes2">
            <div class="ad2des">
              저희 쇼핑몰은 다양한 스페셜티 커피를 로스팅하고<br />
              여러나라의 원두를 공급하거나 여러가지 커피 관련상품들을<br />
              공급하고 있습니다.<br /><br />
              저희는 항상 최고급의 품질의 상품들을 엄선하여 판매하고있고,<br />
              고객님들의 소중한 의견 하나하나 놓치지않고자<br />
              Q&A게시판과 리뷰게시판 역시 운영중에 있습니다.<br />
              많은 이용 부탁드립니다 감사합니다!
            </div>
            <div class="ad2main">
              당신 곁에 당신을 위한 커피, 다채로운 즐거움
            </div>
            <div class="ad2title">irridescent coffee</div>
          </div>
          <div id="aboutusphoto2"></div>
        </div>
        <div id="banner2"></div>
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
              <a href="../items/countryitem.jsp" id="footeritemlink">Coffee</a>
            </li>
            <li id="footeritems">
              <a href="./aboutus.jsp" id="footeritemlink">About us</a>
            </li>
            <li id="footeritems">
              <a href="../board/BoardList.jsp" id="footeritemlink">고객센터</a>
            </li>
          </ul>
          <div id="footeradress">
            주소 : 경기도 시흥시 산기대학로 237<br />
            전화 : 031-8041-1000
          </div>
        </div>
        <!--여기까지 footer-->
      </div>
    </div>
  </body>
</html>
