<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    <c:set var="urlRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Order</title>
</head>
<body>
<div>
<h1>add new order</h1>
	<form:form action="${urlRoot}/order/post" method="post" modelAttribute="order">
	
	checkInDatetime:<input path="checkInDatetime" name="CID" type="date"/><br></br>
	checkOutDatetime<input path="checkOutDatetime" name="COD" type="date"/><br></br>
	adultCount:<form:input path="adultCount" /><br></br>
	childCount:<form:input path="childCount"/><br></br>
	price:<form:input path="price"/><br></br>
	
	
	<div>Account:
	<select name="account">
	<c:forEach items="${accList}" var="a">
	
	<option value="${a.id}">${a.username}</option>

	</c:forEach>
	</select>
	<br></br>
	</div>
	
	<div>
	
	ROOM:<select name="room">
	<c:forEach items="${RoomList}" var="i">
	
	<option value="${i.id}">${i.information.title}</option>

	</c:forEach>
	</select><br></br>
	</div>
	<div>
	Status:<select name="status">
	<c:forEach items="${osList}" var="s">
	
	<option value="${s.id}">${s.title}</option>

	</c:forEach>
	</select><br></br>
	</div>
	
	
	
	
	
	
	
	
	<button type="submit" >送出</button>
	
	</form:form>
</div>
</body>
</html>