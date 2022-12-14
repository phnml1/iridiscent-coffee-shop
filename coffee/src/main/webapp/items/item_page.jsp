<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>s
<%@ page import="my.dao.*,my.model.*,my.util.*,java.sql.*,java.util.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>์ํ ๊ตฌ๋งค</title>
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
                <li><a href="./countryitem.jsp">๋๋ผ๋ณ ์ปคํผ</a></li>
                <li><a href="./dripitem.jsp">๋๋ฆฝ๋ฐฑ</a></li>
                <li><a href="./Etcitem.jsp">๊ด๋?จ์ํ</a></li>
              </ul>
            </div>
          </div>
          <div id="menuitem"><a href="../pages/aboutus.jsp">About us</a></div>
          <div id="menuitem"><a href="../board/BoardList.jsp">Q&A</a></div>
          <% if(session.getAttribute("LOGINID")==null){ %>
          <div id="menuitem2"><a href="../login/LoginForm.jsp">๋ก๊ทธ์ธ</a></div>
          <%} else { 
        	  String id = (String)session.getAttribute("LOGINID");
          %>
          <div id="userheader">
          	<div id="menuitem2">
              <a href="../pages/Mypage.jsp">๋ก๊ทธ์ธ์?๋ณด</a>
              <ul id="userheader_contents">
              
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li>id:<%=id %></li>
                <li><a href="../login/Logout.jsp">๋ก๊ทธ์์</a></li>
              </ul>
            </div>
            </div>
          <%} %>
          <div id="menuitem2"><a href="../login/JoinForm.jsp">ํ์๊ฐ์</a></div>
          <% if(session.getAttribute("LOGINID")!=null){ %>
          <div id="menuitem2"><a href="../purchase/putCartinfo.jsp">์ฅ๋ฐ๊ตฌ๋</a></div>
        <%} %>
      </div>
      </div>
      <div id="page">
        <div id="banner"></div>
        <% 
         	int pid = Integer.parseInt(request.getParameter("pid"));
       	    
         	Connection conn = ConnectionProvider.getConnection();
         	Coffee coffee = null;
         	ReviewDao rdao = new ReviewDao();
			Review review = null;   	
        	List<Review> list = null;
        	String id = (String)session.getAttribute("LOGINID");
     		
        
         	try{
         		CoffeeDao dao = new CoffeeDao();
         		coffee = dao.selectById(conn, pid);
         		
         		String kind = coffee.getTitle();
         		list = rdao.selectKindList(conn, kind);
         		
         	}catch(SQLException e){}
         	if(coffee !=null) {
        %> 
          <c:set var="p" value="<%= coffee %>" />
        <div id="inside">
         <form name="frm" method="post">
            <input type = "hidden" name = "pid" value = "${p.coffeeId }">
            <input type = "hidden" name = "image" value = "${p.detailimage }">
            <input type = "hidden" name = "title" value = "${p.title }">
          <div id="item_top">
          <div class="pur">
          <img src="/coffee/uploadfile/${p.detailimage }"  name="item_pic" width="550" height="550" class="purimg" />
          </div>
          <div class="det">
          <img src="/coffee/uploadfile/${p.image }"  name="item_pic" width="550" height="550" class="detimg"/>
          </div>
        </div>
            <div id="item_detail">
              <div id="detail_form">
                <div id="detail_header">${p.title }
                  <div id="detail_icon">
                    <div id="icons">NEW</div>
                    <div id="icon_sale">SALE</div>
                  </div>
                  <div id="detail_price">${p.price }์</div>
                </div>
                <div id="detail_country">์์ฐ์ง: ${p.name }</div>
                <div id="detail_memo">
                  ${p.memo }
                </div>
              </div>
              <%if(id!=null){ %>
              <p id = "purchase_amount">์๋ :
                <label for="amount"></label>
                <select name="amount" id="amount">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                </select>
              </p>
            
              <input type="button" value="๊ตฌ๋งคํ๊ธฐ" name="purchase" onClick = "putPurchase(form)"width="300" id="purchase_button"/>
              <input type="button" value="์ฅ๋ฐ๊ตฌ๋" onClick = "putCart(form)" width="300" id="bag_button"/>
              <%} %>
                </form>
            </div>
           <%} %>
          </div>
         
         

         
          <div id="reviewinside">
        
          <div id="reviewtitle">REVIEW</div>
          
          <div id ="reviewsc">ํ๊ท?๋ณ์?: ${p.favorate }
          </div>
           <%
          
      		if(list.isEmpty()==false){
      		
      			
          %>
          <div id = "reviews">	
          
         <c:set var="sumscore" value="0"/>
         <c:set var="count" value="0"/>
            <c:forEach var="d" items = "<%=list %>">	
         	<c:set var="sumscore" value="${sumscore+d.score}"/>
         	<c:set var="count" value = "${count+1}"/>
            <div id="eachreview">
          		<div id = "reviewti">์?๋ชฉ: ${d.title}</div>
          		<div id = "reviewid">์์ฑ์: ${d.userId}</div>
          		<div id = "reviewscore">๋ณ์?: ${d.score}</div>
          		<div id = "reviewmemo">${d.memo}</div>   
          		<div id="reviewmod"><a href="../board/ReviewModify.jsp?bid=${d.boardId}&userId=${d.userId}">์์?</a></div>
          		<div id="reviewdel"><a href="../board/ReviewDelete.jsp?bid=${d.boardId}">์ญ์?</a></div>      		
          		</div>
          	  </c:forEach>
          	 
          	  <c:set var="mean" value="${sumscore/count}" />
          	 
						 
          	 
          	  </div>
          	  <%}else{ %>
          	  <div id="noreviews"><h3>๋ฆฌ๋ทฐ๊ฐ ์์ง์์ต๋๋ค..!</h3></div>
          	  <%} 
           CoffeeDao dao = new CoffeeDao();
          	if(list.isEmpty()==false){
          	String strmean = String.format("%.2f", pageContext.getAttribute("mean"));
          
          	
          
          	if(Double.isNaN(Double.parseDouble(strmean))){
          		dao.updateFav(conn,pid,"0");
          	}else{
          	dao.updateFav(conn, pid,strmean);
          	}
          	}else{
          		dao.updateFav(conn,pid,"0");
          	}
          	JdbcUtil.close(conn);
          	  if(id!=null){
          		  %>
        
          	  <div id = "reviewwrite">
          	    <form action="../board/ReviewWriteCheck2.jsp" action="post" onsubmit="return checkFun()" method="post" enctype="multipart/form-data" name="form2">

                    <table  align="center" width="900"border="0" cellpadding="0" cellspacing="0" id="reviewform">
                      <tr>
                        <th><label for="titlefield">์?๋ชฉ</label></th>
                        <td>
                        <input name="title" type="text" id="title" size = "106"></td>
                      </tr>
                      <tr>
                        <th><label for="memo">๋ด์ฉ</label></th>
                        <td>
                        <textarea name="memo" cols="100" rows="7" id="memo"></textarea></td>
            
                      </tr>
                      <tr>
                        <th><label for="score">๋ณ์?</label></th>
                        <td><select name="score" id="score">
                          <option value="5">5</option>
                          <option value="4">4</option>
                          <option value="3">3</option>
                          <option value="2">2</option>
                          <option value="1">1</option>
                        </select>
                        </select></td>
            
                      </tr>
                      
                     <input type="hidden" name="userId" value="<%= id %>">
                    <input type="hidden" name="image" value = "${p.detailimage }">
                      <input type="hidden" name="kind" value = "${p.title }">
                      <tr>
                        <td height="30" colspan="2" align="center" class="btnstyle"><input type="submit" name="send" id="join" value="๋ฆฌ๋ทฐ ๊ฒ์ํ๊ธฐ"></td>
                      </tr>
                  </table>
                 
                  </form>
                  </div>
                  <%}else {%>
                  <div id="plzlogin">๋ฆฌ๋ทฐ๋ฅผ ์ฐ์๋?ค๋ฉด ๋ก๊ทธ์ธํด์ฃผ์ธ์</div>
                  <%} %>
           </div>
         
         
          <div id="footer">
            <div id="footercom">
              <div id="footercompanyeng">IRIDISCENT COFFEE</div>
              <div id="footercompanykor">์ด๋ฆฌ๋์ผํธ ์ปคํผ</div>
            </div>
            <div id="teamname">
              <div id="teamleadername">ํ์ฅ: ์ด์ฃผ์</div>
              <div id="teammembername">ํ์: ์ต์น์ฐ ๊น์์</div>
            </div>
            <ul id="footeritem">
              <li id="footeritems"><a href="./countryitem.jsp" id="footeritemlink">Coffee</a></li>
              <li id="footeritems">
                <a href="../pages/aboutus.jsp" id="footeritemlink">About us</a>
              </li>
              <li id="footeritems"><a href="../board/BoardList.jsp" id="footeritemlink">Q&A</a></li>
            </ul>
            <div id="footeradress">
              ์ฃผ์ : ๊ฒฝ๊ธฐ๋ ์ํฅ์ ์ฐ๊ธฐ๋ํ๋ก 237<br />
              ์?ํ : 031-8041-1000
            </div>
          </div>
        </div>
        
      </div>
    </div>
      <script>
    function putPurchase(frm){
    	var amount = frm.amount.value.trim();
    	var id = frm.pid.value.trim();
    	//location.href='purchase.jsp?bookId='+id+'&amount='+amount;
    	var input = confirm("๊ตฌ๋งคํ์๊ฒ?์ต๋๊น?");
    	if(input){
    	window.open("/coffee/purchase/purchase.jsp?pid="+id+"&amount="+amount,"","width=500, height=500");
    	}
    }
    function putCart(frm){
    	var amount = frm.amount.value.trim();
    	var id = frm.pid.value.trim();
    	var image = frm.image.value.trim();
    	var title = frm.title.value.trim();
    	window.open("/coffee/purchase/putCart.jsp?pid="+id+"&amount="+amount+"&image="+image+"&title="+title,"","width=500, height=300");
    }
    </script>
  </body>
</html>
