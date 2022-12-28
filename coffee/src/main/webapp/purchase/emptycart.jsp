<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page
import="my.dao.*,my.model.*,my.util.*,java.sql.*,java.util.*" %> <%@ taglib
prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>장바구니 페이지</title>
  <link href="order.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <% int pid = Integer.parseInt(request.getParameter("pid")); int amount =
    Integer.parseInt(request.getParameter("amount")); String image =
    request.getParameter("image"); Integer
    pCount=(Integer)session.getAttribute("pCount");String title = request.getParameter("title"); if(pCount==null) { pCount =
    new Integer(0); } if(pid != 0) { Cart cart = new Cart(pid, amount, image,title);
    pCount = new Integer(pCount.intValue() +1); session.setAttribute("p"+pCount,
    cart); session.setAttribute("pCount", pCount); } %>
    <b><center> <img src="images/cart.png" width="30" height="30"> 고객님의 장바구니 리스트입니다 </center></b>
    <br /><br />
    <hr />
    <br /><br />
    <% Cart cart = null; for(int i=1; i<= pCount.intValue(); i++) { cart =
    (Cart)session.getAttribute("p" + i); %>

    <img
      src="/coffee/uploadfile/<%= cart.getImage() %>"
      width="150"
      height="150"
    />
    수량: <%= cart.getAmount() %> <br />
    <% } %>
    <hr />
    <input type="button" value="구매하기" onclick="purchaseCart()" />
    <a href="/coffee/index.jsp"> 홈으로 돌아가기 </a>&nbsp;
    <a href="./cartdelete.jsp"> 카트 비우기 </a>
    <br /><br />
    <script>
      function purchaseCart() {
        var input = confirm("구매하시겠습니까?");
        if (input) {
          window.open("/coffee/purchase/cartpurchase.jsp", "구매");
        }
      }
    </script>
  </body>
</html>
