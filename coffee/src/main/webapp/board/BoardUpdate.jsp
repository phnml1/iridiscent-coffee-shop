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
<div id="wrap" >
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

    <div id="inside">
      <% request.setCharacterEncoding("utf-8");  %> 
<jsp:useBean id="board" class="my.model.Board"/>
<jsp:setProperty property="*" name="board"/>   
        
<%
		String loginId = (String)session.getAttribute("LOGINID");
	if (!board.getUserId().equals(loginId)){
%>
		<script type="text/javascript">
			alert("게시글 작성자만 수정할 수 있습니다.");
			history.go(-1);
		</script>
<%
		}else{
		Connection conn = ConnectionProvider.getConnection();
		board.setBdate(new java.util.Date());
		board.setUserId((String)session.getAttribute("LOGINID"));
		try {
			BoardDao dao = new BoardDao();
			dao.update(conn, board);
		}catch(SQLException e){}
		finally { 
			JdbcUtil.close(conn);
		}
		}
%>        
                <div class="tablestyle">
         <div id="subinside">게시글 수정이 완료 되었습니다.</div>
         <a href="./BoardList.jsp"><div id="insidelink">Q&A 게시판으로 돌아가기</div></a>
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
    </div>


</body>
</html>