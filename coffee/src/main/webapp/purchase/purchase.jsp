<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.dao.*,my.model.*,my.util.*,java.sql.*,java.util.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매완료</title>
<link href="order.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	Connection conn = ConnectionProvider.getConnection();
	
	int pid = Integer.parseInt(request.getParameter("pid"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	String userId = (String)session.getAttribute("LOGINID");
	Coffee coffee = null;
	try{
		CoffeeDao dao = new CoffeeDao();
		coffee = dao.selectById(conn, pid);
		java.util.Date now = new java.util.Date();
		Purchase purchase = new Purchase(userId,pid,amount,coffee.getPrice(),now);
		PurchaseDao purDao = new PurchaseDao();
		purDao.insert(conn, purchase);
	}catch(SQLException e){
		
	}finally {
		JdbcUtil.close(conn);
	}
%> <div id="head" align="center"><img src="images/order.png" width="50" height="50">
<div id="order">주문이 완료되었습니다.
</div><br>

<center>최대한 빠르게 배송해드릴게요 !<br>
모든 문의사항은 고객센터를 이용해주시기 바랍니다.<a href="../board/BoardList.jsp"> [고객센터로 이동]</a><br>
오늘도 저희 Iridiscent coffee와 행복한 하루되세요 ! 감사합니다 !</center>

<a href="../board/ReviewList.jsp"><img src="images/reviewevent.png" width="215" height="275"></a><img src="images/event.png" width="270" height="275"></div>
<center><input type="button" value="메인화면으로 돌아가기" onclick="location.href='../index.jsp'"/></center>
</body>
</html>