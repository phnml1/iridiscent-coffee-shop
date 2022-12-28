<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>s
<%@ page import="my.dao.*,my.model.*,my.util.*,java.sql.*,java.util.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>상품 리스트</title>
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
    <link href="./purchase.css" rel="stylesheet" type="text/css" />
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
        <a href="../index.jsp"
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
   <%
   
  
		request.setCharacterEncoding("utf-8");
		String target = request.getParameter("target");
		String keyword = request.getParameter("keyword");
		Connection conn = ConnectionProvider.getConnection();
		List<Coffee> list = null;
		try {
			CoffeeDao dao = new CoffeeDao();
			list = dao.selectLike(conn, target, keyword);
			JdbcUtil.close(conn);
		}catch(SQLException e){}
		if (list != null) {
%>        
<div id="page">
      
        <div id="rightcon">
                
                     <table id="registerform" align="center" width="1024" border="1" cellpadding="3" cellspacing="0" id="myt">
                    <tr>
                      <th width="95" scope="col">아이디</th>
                      <th width="125" scope="col">제품이름</th>
                      <th width="111" scope="col">국가</th>
                      <th width="105" scope="col">이미지</th>
                      <th width="115" scope="col">가격</th>
                      <th width="95" scope="col">수정</th>
                      <th width="95" scope="col">삭제</th>
                    </tr>
        <c:forEach var="p" items="<%= list %>">            
                    <tr>
                      <td>${p.coffeeId}</td>
                      <td>${p.title}</td>
                      <td>${p.name}</td>
                      <td><img src="/coffee/uploadfile/${p.image}" width="50" height="70"></td>
                      <td>${p.price}</td>
                 <td><input type = "button" value = "수정" onClick = "location.href='updateForm.jsp?pid=${p.coffeeId}'"></td>
                  <td><input type = "button" value = "삭제" onClick = "location.href='delete.jsp?pid=${p.coffeeId}'"></td>
                    </tr>
         </c:forEach>
         			<tr>
         				<td colspan="8"><a href="qna.jsp">[상품추가]</a></td>
         			</tr>
         			<tr>
         				<td colspan="8">
			<form  method="post">
				<select name="target">
					<option value="title">제품이름</option>
					<option value="name">국가</option>
					<option value="memo">메모</option>
					<option value="kind">종류</option>
				</select>
				<input type="text" name="keyword">
				<input type="button" value="검색" onclick="searchCheck(form)">
			</form>
						</td>
         			</tr>
                  </table>
        <% } %>          
                </div>
                </div>
      
<script type="text/javascript">
	function searchCheck(frm){
		if (frm.keyword.value==""){
			alert("검색어를 입력하세요.");
			frm.keyword.focus();
			return;
		} else {
			frm.submit();
		}
	}
</script>

</body>
</html>









