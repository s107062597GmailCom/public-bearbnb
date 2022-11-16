<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="urlRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bearbnb - Hello!</title>
    <link rel="icon" href="${urlRoot}/images/icons/favicon.ico">
</head>
<body>
    <c:if test="${ list != null }">
	    <c:forEach var="item" items="${ list }">
	        <h2>${ item.greeting }</h2>
	       	<h2>${ item.uuid }</h2>
	       	<h2>${ item.createdAt }</h2>
	        
	    </c:forEach>
    </c:if>
    <a href="${ urlRoot }/hello/account/"><button>button</button></a>
</body>
</html>