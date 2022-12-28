<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "java.io.PrintWriter" %>	
<% request.setCharacterEncoding("utf-8");  %> 

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
<%
if(session.getAttribute("LOGINID")!=null){ 
         String location = "C:\\web2\\ws\\coffee\\src\\main\\webapp\\board\\downloadImages";
         int maxSize = 1024 * 1024 * 5;

        MultipartRequest multi = new MultipartRequest(request, location, maxSize, "utf-8",
         new DefaultFileRenamePolicy());
        
        String title = multi.getParameter("title");
       	String userId = (String)session.getAttribute("LOGINID");
  
       	
        String memo = multi.getParameter("memo");
        int score = Integer.parseInt(multi.getParameter("score"));
        String fileName = multi.getFilesystemName("image"); 
        String kind= multi.getParameter("kind"); 

		Connection conn = ConnectionProvider.getConnection();
		java.util.Date bdate = new java.util.Date();
		 
		Review review = new Review (0, title, memo, userId, bdate, score, fileName, kind);
		String referer = (String)request.getHeader("REFERER");
		try {
			ReviewDao dao = new ReviewDao();
			dao.insert(conn, review);
		}catch(SQLException e){}
		finally { 
			JdbcUtil.close(conn);
			response.sendRedirect(referer);
		}
}
else{
	%>
	<script>
		alert("로그인하시고 이용해주세요");
		history.go(-1);
	</script>
	<% }%>	


	<div id="page">
         <h3>게시글 작성이 완료되었습니다.</h3> 
         <a href="ReviewList.jsp">[Review 게시판으로 돌아가기]</a>             
                </div>
         </div>
    </div>    


</body>
</html>