<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="my.dao.*,my.model.*,my.util.*,java.sql.*,java.util.*" %>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>상품 추가</title>
 <link href="./item.css" rel="stylesheet" type="text/css" />
<link href="qnadesign.css" rel="stylesheet" type="text/css">
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
        <div id="menuitem"><a href="../pages/aboutus.html">About us</a></div>
        <div id="menuitem"><a href="../board/ReviewList.jsp">Review</a></div>
        <% if(session.getAttribute("LOGINID")==null){ %>
          <div id="menuitem2"><a href="../login/LoginForm.jsp">로그인</a></div>
          <%} else { %>
          <div id="menuitem2"><a href="../login/Logout.jsp">로그아웃</a></div>
          <%} %>
        <div id="menuitem2"><a href="../login/JoinForm.html">회원가입</a></div>
        <div id="menuitem2"><a href="../board/BoardList.jsp">고객센터</a></div>
      </div>
    </div>
        
<%
String location = "C:\\web2\\ws\\coffee\\src\\main\\webapp\\uploadfile";

int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트   
 
MultipartRequest multi = new MultipartRequest(request,
					 						  location,
											  maxSize,
											  "utf-8",
											  new DefaultFileRenamePolicy());
String titlefield = multi.getParameter("titlefield");
String namefield = multi.getParameter("namefield");
String memo = multi.getParameter("memo");
String filefield = multi.getFilesystemName("filefield");
int pricefield = Integer.parseInt(multi.getParameter("pricefield"));
java.util.Date rdate = new java.util.Date();
String kind = multi.getParameter("kind");

String detailfield = multi.getFilesystemName("detailfield");
Coffee coffee = new Coffee(0, titlefield, namefield, memo, filefield, pricefield,rdate,"0",kind,detailfield);
Connection conn = ConnectionProvider.getConnection();
try {
	CoffeeDao dao = new CoffeeDao();
	dao.insert(conn, coffee);
	JdbcUtil.close(conn);
}catch(SQLException e) {}
%>        
        </div>
        <div class="rightcon">
                <img src="images/title2.jpg" width="464" height="58" alt="고객등록">
                <div class="tablestyle">파일이 업로드 되었습니다.<br>
         		타이틀: <%=titlefield %> <br>
         		이름: <%=namefield %> <br>
         		메모: <%= memo %> <br>
         		파일명: <%=filefield %> <br>
         		가격: <%= pricefield %><br>
         		종류: <%= kind %><br>
         	
         		<a href = "list.jsp" >리스트보기</a><br>
         		<a href = "qna.jsp" >상품 추가</a>
         		</div>
         		
         </div>
    </div>


</body>
</html>
