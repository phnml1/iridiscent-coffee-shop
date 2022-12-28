<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page
import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Iridescent Coffee</title>
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
    </style>
    <script type="text/javascript">
      function MM_preloadImages() {
        //v3.0
        var d = document;
        if (d.images) {
          if (!d.MM_p) d.MM_p = new Array();
          var i,
            j = d.MM_p.length,
            a = MM_preloadImages.arguments;
          for (i = 0; i < a.length; i++)
            if (a[i].indexOf("#") != 0) {
              d.MM_p[j] = new Image();
              d.MM_p[j++].src = a[i];
            }
        }
      }

      function MM_swapImgRestore() {
        //v3.0
        var i,
          x,
          a = document.MM_sr;
        for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
          x.src = x.oSrc;
      }

      function MM_findObj(n, d) {
        //v4.01
        var p, i, x;
        if (!d) d = document;
        if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
          d = parent.frames[n.substring(p + 1)].document;
          n = n.substring(0, p);
        }
        if (!(x = d[n]) && d.all) x = d.all[n];
        for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
        for (i = 0; !x && d.layers && i < d.layers.length; i++)
          x = MM_findObj(n, d.layers[i].document);
        if (!x && d.getElementById) x = d.getElementById(n);
        return x;
      }

      function MM_swapImage() {
        //v3.0
        var i,
          j = 0,
          x,
          a = MM_swapImage.arguments;
        document.MM_sr = new Array();
        for (i = 0; i < a.length - 2; i += 3)
          if ((x = MM_findObj(a[i])) != null) {
            document.MM_sr[j++] = x;
            if (!x.oSrc) x.oSrc = x.src;
            x.src = a[i + 2];
          }
      }
    
      window.onload = function () {
        const a = document.querySelector("#wrap");
        a.className = "openwindow";
      };
    </script>
  </head>
  <body >
    <!--여기부터-->

    <div id="wrap" class="closewindow" >
      <!--class="closewindow"는 코딩하실때는 삭제하세요-->
      <div id="header">
        <a href="./index.jsp"
          ><div id="toplogo">
            <img src="./images/logo.png" width="167" height="69" />
          </div>
        </a>
        <div id="menu">
          <div id="menuitem">
            <div id="coffeeheader">
              <a href="./items/countryitem.jsp">Coffee</a>
              <ul id="coffeeheader_contents">
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="./items/countryitem.jsp">나라별 커피</a></li>
                <li><a href="./items/dripitem.jsp">드립백</a></li>
                <li><a href="./items/Etcitem.jsp">관련상품</a></li>
              </ul>
            </div>
          </div>
          <div id="menuitem"><a href="./pages/aboutus.jsp">About us</a></div>
          <div id="menuitem"><a href="./board/BoardList.jsp">Q&A</a></div>
          <% if(session.getAttribute("LOGINID")==null){ %>
          <div id="menuitem2"><a href="./login/LoginForm.jsp">로그인</a></div>
          <%} else { 
        	  String id = (String)session.getAttribute("LOGINID");
          %>
          <div id="userheader">
          	<div id="menuitem2">
              <a href="./pages/Mypage.jsp">로그인정보</a>
              <ul id="userheader_contents">
              
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li>id:<%=id %></li>
                <li><a href="./login/Logout.jsp">로그아웃</a></li>
              </ul>
            </div>
            </div>
          <%} %>
          <div id="menuitem2"><a href="./login/JoinForm.jsp">회원가입</a></div>
          <% if(session.getAttribute("LOGINID")!=null){ %>
          <div id="menuitem2"><a href="./purchase/putCartinfo.jsp">장바구니</a></div>
        <%} %>
      </div>
      </div>
      <!--여기까지 헤더 html에다가 여기까지 카피-->
      <div id="page">
        <!--반드시! page id가진 div안에 디자인 해주세요!!!-->
        <div id="banner">
          <div id="bannerintro">Iridescent Joy in our coffee</div>
          <div id="bannerdes">당신 곁에 당신을 위한 커피, 다채로운 즐거움</div>
        </div>
        <div id="homeintro">
          <div id="homeintrodes">
            Iridescent Coffee는
             다채로운 향과 맛을 더한 스페셜티를 로스팅하고,<br />
             세계 각국의 원두들과 다양한 커피 관련상품들을<br />
            판매하고 있습니다.<br />
            <br />
            이 곳에서 다채로운 즐거움을 느껴보세요.<br />
            당신에게 맞는 특별한 커피가 존재합니다.<br /><br />
            <p>Good coffee is in Our Shop!</p>
          </div>
        </div>
        <div id="best">
          <div id="best_title">Event</div>
          <div id="best_image">
            <img
              name="mainevent"
              id="mainevent"
              src="images/promotion1.png"
             height="487px"
             width="805px"
            />
          </div>
          <div class="imgmenu">
            <a href="./items/countryitem.jsp">
              <div
                class="imgmenus"
                onmouseover="MM_swapImage('mainevent','','images/promotion1.png',1)"
                onClick="location.href='./items/countryitem.html'"
              >
                나라별 커피
              </div>
            </a>
            <a href="./items/dripitem.jsp">
              <div
                class="imgmenus"
                onmouseover="MM_swapImage('mainevent','','images/promotion2.png',1)"
                onClick="location.href='./items/dripitem.html'"
              >
                드립백
              </div>
            </a>
            <a href="./items/Etcitem.jsp">
              <div
                class="imgmenus"
                onmouseover="MM_swapImage('mainevent','','images/promotion3.png',1)"
                onClick="location.href='./items/Etcitem.html'"
              >
                관련상품
              </div>
            </a>
          </div>
        </div>
        <div id="banner2"></div>
        <!--여기부터-->
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
              <a href="./pages/aboutus.jsp" id="footeritemlink">About us</a>
            </li>
            <li id="footeritems">
              <a href="./board/BoardList.jsp" id="footeritemlink">고객센터</a>
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
