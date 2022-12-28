<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
        <jsp:useBean id="review" class="my.model.Review"/>
        <jsp:setProperty property="*" name="review"/>
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
       <div id="rbanner"></div>
 
<div id="page">
  <%
            int bid = Integer.parseInt(request.getParameter("bid"));
            Connection conn = ConnectionProvider.getConnection();
            Review reviews = null;
            try {
            	ReviewDao dao = new ReviewDao();
            	review = dao.selectById(conn, bid);
            }catch(SQLException e){}
            finally {
            	JdbcUtil.close(conn);
            }
            if (review != null){
        %>
<table  align="center">
<c:set var="b" value="<%=review %>"/>
  <tr>
   <td>
   <table width="1024">
     <td>
     <tr height="1" bgcolor="BLACK"><td colspan="4"></td></tr>
     <tr>
      <td width="142" height="100">일련번호</td>
      <td>${b.boardId}</td>
     </tr>
	 <tr height="1" bgcolor="BLACK"><td colspan="4"></td></tr>
    <tr>
      <td width="142" height="100">작성일</td>
      <td>${b.bdate}</td>
     </tr>
     <tr height="1" bgcolor="BLACK"><td colspan="4"></td></tr>
    <tr>
      <td width="142" height="100">작성자</td>
      <td>${b.userId}</td>
     </tr>
      <tr height="1" bgcolor="BLACK"><td colspan="4"></td></tr>
    <tr>
      <td width="142" height="100">제목</td>
      <td>${b.title}</td>
     </tr>
      <tr height="1" bgcolor="BLACK"><td colspan="4"></td></tr>
     <tr>
      <td width="142" height="100">내용</td>
      <td>${b.memo}</td>
     </tr>
     <tr height="1" bgcolor="BLACK"><td colspan="4"></td></tr>
     <tr>
      <td width="142" height="100">이미지</td>
      <td><img src="/1005/downloadImages/${b.image}"></td>
     </tr>
     <tr height="1" bgcolor="BLACK"><td colspan="4"></td></tr>
     <tr>
      <td width="142" height="100">상품 카테고리</td>
      <td>${b.kind}</td>
     </tr>
     <tr height="1" bgcolor="BLACK"><td colspan="4"></td></tr>
     <tr align="center">
      <td width="142">&nbsp;</td>
	<input type=button value="목록" OnClick="location.href='ReviewList.jsp'">
	
      <td width="870">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
  <% } %>
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
 </div>
</body>
 </html>