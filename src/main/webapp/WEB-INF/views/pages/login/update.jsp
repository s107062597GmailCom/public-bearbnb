<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="team.lazybear.bearbnb.model.Account" %>
<c:set var="uriRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="/bearbnb.com/images/icons/favicon.ico">
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
<link rel="stylesheet" href="${uriRoot}/styles/login/update.css">
<title>會員資料|Bearbnb</title>
</head>
<body>
	<div class="limiter">
		<div class="container">
			<jsp:include
				page="/WEB-INF/views/objects/headers/universalheader.jsp" />
			<div class="wrap">

				<h3>會員資料</h3>

				<div id="put-user" class="mx-2 my-4">
					<span>帳號</span>
					<div id="username">${myaccount.username}</div>
				</div>

				<div class="form-group">
				<div><span>修改密碼</span></div>
					<div>
						<input class="form-input" type="password" name="password"
							id="password" >
						<button class="hideNSeek" id="pwdSeen">顯示密碼</button>
					</div>
					<div class="warn">
						<span id="result01"></span>
					</div>
				</div>
				<div class="row">
					<div class="form-group col">
						<div>
							<input class="form-input" type="text" name="first_name"
								id="first_name" value="${myaccount.information.firstName}" aria-invalid="true">

						</div>
						<div class="warn">
							<span id="result02"></span>
						</div>
					</div>
					<div class="form-group col">
						<div>
							<input class="form-input" type="text" name="last_name"
								id="last_name" value="${myaccount.information.lastName}" aria-invalid="true">
						</div>
						<div class="warn">
							<span id="result03"></span>
						</div>
					</div>
				</div>

				<div class="mx-2 my-4">
					<div>
						<span>性別</span>
						
						<% if (((Account)request.getSession().getAttribute("myaccount")).getInformation().getGender() == 'm') {%>
							<input type="radio" name="gender" id="male" value="m" checked>
							<label for="male">男</label>
							<input type="radio" name="gender" id="male" value="f">
							<label for="male">女</label>
						<% } else { %>
							<input type="radio" name="gender" id="male" value="m">
							<label for="male">男</label>
							<input type="radio" name="gender" id="male" value="f" checked>
							<label for="male">女</label>
						<% }%>
					</div>
				</div>
				<div class="form-group">
					<div>
						<input class="form-input" type="text" name="phone_number"
							id="phone_number" value="${myaccount.information.phoneNumber}" aria-invalid="true">
					</div>
					<div class="warn">
						<span id="result04"></span>
					</div>
				</div>
				<div class="form-group">
					<div>
						<input class="form-input" type="email" name="email" id="email"
							value="${myaccount.information.email}" aria-invalid="true">
					</div>
					<div class="warn">
						<span id="result05"></span>
					</div>
				</div>
				<div class="form-group">
					<div>
						<input value="${myaccount.information.birthday}" type="date"
							id="birthday" name="birthday" class="form-control datepicker">
					</div>
				</div>

				<div class="mx-2 my-4">
					<span id="result"></span>
					<div></div>
					<button class="submitbutton" id="submit" type="button">送出</button>
				</div>

				<div>
					<a
						href="javaScript:if(confirm('確定停用帳號?')){location.href='http://localhost:8090/bearbnb.com/delete'}">
						停用帳號</a>
				</div>
			</div>
		</div>
	</div>
		<script type="text/javascript" src="${uriRoot}/scripts/login/update.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</body>
</html>