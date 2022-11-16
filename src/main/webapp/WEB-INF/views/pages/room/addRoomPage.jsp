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
<title>add new room</title>
</head>
<body>
<div>
<h1>add new Room</h1>
	<form:form action="${urlRoot}/room/post" method="post" modelAttribute="room">
	price:<form:input path="price"/><br></br>
	address:<form:input path="address"/><br></br>
<%-- 	roomName:<form:input path="information.title"/><br></br> --%>

	
	<div>Account:
<!-- 	<select name="account"> -->
<%-- 	<c:forEach items="${accList}" var="a"> --%>
<%-- 	<option value="${a.id}">${a.username}</option> --%>
<%-- 	</c:forEach> --%>
<!-- 	</select> -->
	<input type="text" name="account">
	<br></br>
	</div>
		<div>City:
	<select name="city">
	<c:forEach items="${cityList}" var="c">
	<option value="${c.id}">${c.title}</option>
	</c:forEach>
	</select>
	<br></br>
	</div>
	
	
	
	<button type="submit" >送出</button>
	
	</form:form>
	</div>
</body>
</html>