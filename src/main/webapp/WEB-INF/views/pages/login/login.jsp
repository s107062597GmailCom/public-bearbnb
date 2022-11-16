<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<!-- 到底為什麼form標籤用在AJAX送出資料後一定會跳轉頁面啦！不想跳轉頁面的話千萬不要寫form在外面！ -->
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
<link rel="stylesheet" href="${uriRoot}/styles/login/login.css">

<meta charset="UTF-8">
<title>登入會員|Bearbnb</title>
</head>
<body>
	<div class="limiter">
		<div class="container">
			<jsp:include
				page="/WEB-INF/views/objects/headers/universalheader.jsp" />
			<div class="wrap">
				
				<h3 class="form-title">登入</h3>
				<div>
					<div style="display: flex; justify-content: space-between">
						<span>帳號:</span>&emsp;<span class="warn" id="iderror"></span>
					</div>
					<div class="wrap-input-1" data-validate="Username is required">
						<input class="input" type="text" name="username" id="username" />
						<span class="focus-input"></span>
					</div>
					<div style="display: flex; justify-content: space-between">
						<span>密碼:</span>&emsp;<span class="warn" id="pwderror"></span>
					</div>
					<div class="wrap-input-2" data-validate="Password is required" style="position:relative">
						<input type="password" name="password" id="password" /><i class="fa-solid fa-eye" id="pwdSeen"></i> <span
							class="focus-input"></span>
					</div>




					<div style='display:flex; justify-content: space-between'>
					<button type="submit" class="submitbutton" value="login"
						id="submit">Login</button>
					<button class="submitbutton" >
						<a href="http://localhost:8090/bearbnb.com/signup"
							style='color: white'> 註冊 </a>
					</button>
					</div>
					<div id="error"></div>



					<br />
					


				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${uriRoot}/scripts/login/login.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>


</body>
</html>