<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
    <link rel="stylesheet" href="${uriRoot}/styles/index.css">
    <title>Bearbnb</title>
    
    <style>
    .informations{
    	margin:100px;
    
    }
    
    </style>
    
</head>
<body>
    <div id="global-background" class="global-background">
        <div id="main-container">
            <jsp:include page="/WEB-INF/views/objects/headers/universalheader.jsp"/>
			<div class="informations">
			<h1 >訂單申請成功！</h1>
			<a href="${pageContext.request.contextPath}/">回到首頁</a>
			</div>	
        </div>
    </div>
</body>
</html>