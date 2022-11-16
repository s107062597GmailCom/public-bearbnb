<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
  <h2>歡迎 ${ account.username } 使用本系統</h2>
  <br>
  <h2>房間名稱： ${room.information.title }</h2>
  <h2>${room.owner.information.firstName }是超棒的房東</h2>
  <br>
  
<h2>租借房間</h2>
<form action="${pageContext.request.contextPath}/room/createOrder/${room.id}" method="post">
    起始時間<input type="date" name="check_in_datetime"> <br>
    結束時間<input type="date" name="check_out_datetime"> <br>
    成人人數 <input type="text" name="adult_count"> <br>
    幼兒人數 <input type="text" name="child_count"> <br>
    <input type="submit">
</form>

 	<h2>最近的是 ${closest} </h2>


</body>
</html>