<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="my.dao.*,my.model.*,my.util.*,java.sql.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>마이페이지</title>
<link href="index.css" rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Roboto&display=swap")
	;

@import
	url("https://fonts.googleapis.com/css2?family=Amatic+SC&family=Cinzel:wght@600&family=Manrope:wght@300&family=Roboto&display=swap")
	;

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);

@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
</style>
<link href="./mypage.css" rel="stylesheet" type="text/css" />
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

		<%
		request.setCharacterEncoding("utf-8");
		Connection conn = ConnectionProvider.getConnection();
		List<User> list = null; 
		String userId = (String)session.getAttribute("LOGINID");
		try {
			UserDao dao = new UserDao();
			list = dao.selectUser(conn, userId);
		}catch(SQLException e){}
		finally { 
			JdbcUtil.close(conn);
		}
		if (list != null) {
%>
		<div id="loginpage">
			<div id="banner2"></div>
			<div class="mpage">
				<div id="middle_brg2">
					<div id="loginform">
						<div align="center">
							<p>
								<img src="images/user.png" width="128" height="128" />
							</p>
							<p>Information</p>
						</div>
					</div>
					<div class="tablestyle">
						<div id="mpagemiddle">
							<div id="rightcon">
								<div class="logincon"></div>
								<div id="mpagetable">
									<table id="registerform" align="center"    width="1024"
										cellpadding="3" cellspacing="0" id="myt">
										<c:forEach var="p" items="<%= list %>">
											<div class="tr2">
												<tr>
													<td width="198">
														<div class="tr1">
															<div align="center">
															  <div class="trtxt">
														    아이디</div></div>
														</div>
													</td>

													<td width="790">
														<div class="tr2">${p.userId}</div>
													</td>

												</tr>
											</div>
											<tr>
												<td><div class="tr1">
														<div align="center">패스워드</div>
													</div></td>

												<td>

													<div class="tr2">${p.userPw}</div>
												</td>
											</tr>
											<tr>
												<td><div class="tr1">
														<div align="center">이름</div>
													</div></td>
												<td>

													<div class="tr2">${p.name}</div>
												</td>
											</tr>
											<tr>
												<td><div class="tr1">
														<div align="center">전화번호</div>
													</div></td>
												<td>

													<div class="tr2">${p.num}</div>
												</td>
											</tr>
											<tr>
												<td><div class="tr1">
														<div align="center">주소</div>
													</div></td>
												<td>

													<div class="tr2">${p.address}</div>
												</td>
											</tr>
											<tr>
												<td align=center col=2>
													<%String adid = (String)session.getAttribute("LOGINID"); 
													if(adid.equals("admin")) {%><div class="tr3"><a href="../items/list.jsp">[관리자 전용 상품 리스트로]</a></div><%} %>
												</td>
												
												
											</tr>
										</c:forEach>
										
									</table>
									<%} %>
								</div>
								


							</div>
						</div>
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
					<li id="footeritems"><a href="./items/countryitem.jsp"
						id="footeritemlink">Coffee</a></li>
					<li id="footeritems"><a href="./pages/aboutus.html"
						id="footeritemlink">About us</a></li>
					<li id="footeritems"><a href="#" id="footeritemlink">Q&A</a></li>
				</ul>
				<div id="footeradress">
					주소 : 경기도 시흥시 산기대학로 237<br /> 전화 : 031-8041-1000
				</div>
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









