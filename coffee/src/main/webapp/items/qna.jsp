<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page
import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>상품 추가</title>
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
         
            <form
              action="response.jsp"
              method="post"
              enctype="multipart/form-data"
              name="form1"
              id = "form1"
            >
            <div class="procon">
              <table
               
                border="0"
                cellpadding="0"
                cellspacing="0"
                id="registerform"
                align="center"
              >
                <tr>
                  <th><label for="titlefield">* 제품이름</label></th>
                  <td>
                    <input
                      name="titlefield"
                      type="text"
                      id="titlefield"
                      size="70"
                    />
                  </td>
                </tr>
                <tr>
                  <th><label for="namefield">* 국 가</label></th>
                  <td>
                    <input name="namefield" type="text" id="namefield" />
                  </td>
                </tr>
                <tr>
                  <th><label for="pricefield">* 가 격</label></th>
                  <td>
                    <input name="pricefield" type="text" id="pricefield" />
                  </td>
                </tr>
                <tr>
                  <th><label for="memo">* 메모</label></th>
                  <td>
                    <textarea
                      name="memo"
                      cols="70"
                      rows="10"
                      id="memo"
                    ></textarea>
                  </td>
                </tr>

                
                <tr>
                  <th><label for="kindfield">* 종류</label></th>
                  <td>
                    <select name="kind">
                      <option>종류을 선택하세요</option>
                      <option value="나라별 커피">나라별 커피</option>
                      <option value="드립백">드립백</option>
                      <option value="관련상품">관련상품</option>
                    </select>
                  </td>
                </tr>

                <tr>
                  <th><label for="filefield">* 상품이미지첨부</label></th>
                  <td>
                    <label for="filefield2"></label>
                    <input type="file" name="filefield" id="filefield2" />
                  </td>
                </tr>
                <tr>
                  <th><label for="detailfield">* 상세이미지첨부</label></th>
                  <td>
                    <label for="detailfield2"></label>
                    <input type="file" name="detailfield" id="detailfield2" />
                  </td>
                </tr>
                <tr>
                  <td height="30" colspan="2" align="center" class="btnstyle">
                    <input type="submit" name="ok" id="ok" value="확인" />
                    <input
                      type="submit"
                      name="cancel"
                      id="cancel"
                      value="취소"
                    />
                  </td>
                </tr>
                <tr>
                 <td>
                  <a href="list.jsp">리스트보기</a>
                  </td>
                </tr>
              </table>
            </form>
            <br /><br />
           
            </div>
          </div>
       
      </div>
   
  </body>
</html>
