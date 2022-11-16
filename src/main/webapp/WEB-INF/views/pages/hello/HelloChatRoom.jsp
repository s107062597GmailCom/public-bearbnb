<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap5.1.min.css">
<link rel="stylesheet" href="${uriRoot}/styles/fontawesome-free-6.1.2-web/css/all.min.css" />
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<button type="button" id="testButton">執行測試</button>

	<script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
	<script src="${uriRoot}/scripts/bootstrap5.1.bundle.min.js"></script>
	
	<script>
	$(()=>{
		$("#testButton").click(function(){
			var url = "${uriRoot}/hello/createChatRoom";
			window.location.href=url;
		});
	})
	</script>
</body>


</html>