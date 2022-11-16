<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<!-- 註冊可以填入會員基本資料 username, password,first_name,last_name,gender,phone_number,email,birthdate 
	 註冊時 用ajax搜尋資料庫中有沒有重複的username 有重複的話就要提出警告 沒有重複就說可以使用這個名稱-->
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
<link rel="stylesheet" href="${uriRoot}/styles/login/signUpForm.css">
<meta charset="UTF-8">
<title>加入會員|Bearbnb</title>

</head>

<body>
	<div class="limiter">
		<div class="container">
			<jsp:include
				page="/WEB-INF/views/objects/headers/universalheader.jsp" />
			<div class='signup-content'>
				<h2 class="form-title">成為會員</h2>
				<form action="${pageContext.request.contextPath}/signup.controller" method="post" enctype="multipart/form-data" name="signUp">
				<div>
					<div class="form-group">
						<div>
							<input class="form-input" type="text" name="username"
								id="username" placeholder="帳號" aria-invalid="true">
						</div>
						<div class="warn">
							<span id="result01"></span>
						</div>
					</div>
					<div class="form-group">
						<div style="position:relative">
							<input  class="form-input" type="password" name="password"
								id="password" placeholder="密碼" aria-invalid="true">
								<i class="fa-solid fa-eye" id="pwdSeen"></i>
							
						</div>
						<div class="warn">
							<span id="result02"></span>
						</div>
					</div>
					<div class="row">
						<div class="form-group col">
							<div>
								<input class="form-input" type="text" name="first_name"
									id="first_name" placeholder="名字" aria-invalid="true">
							</div>
							<div class="warn">
								<span id="result03"></span>
							</div>
						</div>
						<div class="form-group col">
							<div>
								<input class="form-input" type="text" name="last_name"
									id="last_name" placeholder="姓氏" aria-invalid="true">
							</div>
							<div class="warn">
								<span id="result04"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div>
							<input type="radio" name="gender" id="male" value="m" checked>
							<label for="male">男</label> <input type="radio" name="gender"
								id="female" value="f"> <label for="female">女</label>
						</div>
					</div>
					<div class="form-group">
						<div>
							<input class="form-input" type="text" name="phone_number"
								id="phone_number" placeholder="電話" aria-invalid="true">
						</div>
						<div class="warn">
							<span id="result06"></span>
						</div>
					</div>
					<div class="form-group">
						<div>
							<input class="form-input" type="email" name="email" id="email"
								placeholder="Email" aria-invalid="true">
						</div>
						<div class="warn">
							<span id="result07"></span>
						</div>
					</div>
					<div class="form-group">
						<div>
							<input placeholder="Selected Birthdate" type="date" id="birthday"
								name="birthday" class="form-control datepicker">
							
							<div class="warn">
								<span id="result08"></span>
							</div>
						</div>

									</div>
									<div id="sub_img_div" class="subimg">
										<div id="uploaddi" class="uploaddiv">
											<label id="subimgSpan" class="subimgSpan">
											 <input type="file" id="file" class="filepath"
												onchange="changepic2(this)" name="photo"
												accept="image/jpg,image/jpeg,image/png,image/PNG">
												<i class="fa-solid fa-image"></i> 點擊上傳圖片</label>
										</div>
										<img src="#" id="img" class="showimg" style="display:none" />
									</div>
						<div class="form-group">
							<button class="submitbutton" id="submit">送出</button>
							<div class="warn">
								<span id="result09"></span>
							</div>

						</div>

					</div>
				</form>
				</div>					
			</div>
		</div>
	
	<script type="text/javascript"
		src="${uriRoot}/scripts/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="${uriRoot}/scripts/login/signUpForm.js"></script>
	<script type="text/javascript"
		src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
</body>

</html>