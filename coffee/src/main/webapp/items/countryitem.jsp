<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.dao.*,my.model.*,my.util.*,java.sql.*,java.util.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>나라별 커피</title>
    <link href="./item.css" rel="stylesheet" type="text/css" />
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
      <div id="page">
        <div id="coffeebanner"></div>     
        <div id="section">
          <div id="sub_contents">
          </div>
          <div id="top_section">
          <form method = "post">
            <label for="item_sort"></label>
             <select name="theme" id="item_sort">
              <option value="order by rdate desc">신상순</option>
               <option value="order by favorate desc">별점높은순</option>
               <option value="order by price desc">가격순</option>
               <option value="order by title asc">이름순</option>
                <input type = "submit" value = "보여주기" name="show" id="show">
            </select>
            
            </form>
          </div>
            <%
		Connection conn = ConnectionProvider.getConnection();
		List<String> kinds= null;
		List<Coffee> list = null;
		String label = null;
		String theme = request.getParameter("theme");
		String target = request.getParameter("target");
		String keyword = request.getParameter("keyword");
		try{
			CoffeeDao dao = new CoffeeDao();
		
			String kind="나라별 커피";
				if (theme == null)
					list = dao.selectKindList(conn,kind);
				else if(theme !=null)
					list = dao.selectTheme(conn, theme,kind);
				else if(keyword!=null)
					list = dao.selectLike(conn, target, keyword);
				
			if(list!=null){
%>	
	
          <div class="middle_section">
                  <c:forEach var="p" items = "<%=list %>">
                  <a href = "item_page.jsp?pid=${p.coffeeId }">
                  <div class="shop_item">
             
             <div class="item_img">
               <div class="pur">
                <img src = "/coffee/uploadfile/${p.image}" width="250" height="250" class="purimg"/>
               
               </div>
               <div class="det"><a href = "item_page.jsp?pid=${p.coffeeId }">
                 <img src = "/coffee/uploadfile/${p.detailimage}" width="250" height="250" class="detimg"/>
               </a>
               </div>
                </div>
                <div class="item_txt">
                	<a href = "item_page.jsp?pid=${p.coffeeId }">
                  <div class="item_name">
                   ${p.title }
                  </div>
                  <div class="item_price">₩${p.price }</div>
                  <div class="item_score">★${p.favorate }</div>
                  </a>
                </div>
           
            </div>
               </a>
                  </c:forEach>
            <%
		
			}
		}catch(SQLException e){}
		finally { JdbcUtil.close(conn); }
%>   
          </div>
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
