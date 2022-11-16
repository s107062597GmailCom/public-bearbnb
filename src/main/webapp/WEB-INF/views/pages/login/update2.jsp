<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="team.lazybear.bearbnb.model.Account"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
<link rel="stylesheet" href="${uriRoot}/styles/login/update2.css">

<script type="text/javascript"
	src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
<title>會員資料|Bearbnb</title>
</head>
<body>
	<div class="limiter">
		<div class="container">
			<jsp:include
				page="/WEB-INF/views/objects/headers/universalheader.jsp" />
			<div class="wrap">
				<h3>會員資料</h3>
				<form action="${pageContext.request.contextPath}/profileUpdate"
					method="post" enctype="multipart/form-data">

					<div id="put-user" class="mx-2 my-4 border-bottom w-50">
					<div class="mx-2 my-4 w-50">
						<span>會員帳號：</span> &nbsp;
						<div id="username">${myaccount.username}</div>
					</div>
					</div>

					<!-- 密碼區 -->
<div class="mx-2 my-4 border-bottom w-50" >
					<div id="pwdbefore" class="mx-2 my-4 w-50"
						style="display: block">
						<span>密碼：</span> &nbsp;

					</div>
					<div id="pwdafter" class="mx-2 my-4  w-50"
						style="display: none">
						<div>
							<span>修改密碼</span>
						</div>
						<div >
							<div style="position:relative"><input class="form-input" type="password" name="password"
								id="password" aria-invalid="false"><i class="fa-solid fa-eye" id="pwdSeen"></i></div>
								<div > </div>
						</div>

						<div class="warn">
							<span id="result01"></span>
						</div>
					</div>
					<i class="fa-solid fa-pen-nib" id="pwdswitch">編輯</i>
</div>
					<!-- 姓名區 -->
					<div class="mx-2 my-4 border-bottom w-50" >

					<div id="namebefore" class="mx-2 my-4  w-50" style="display: block">
						<div style="display: flex; justify-content: between">
							<span>姓名：</span> &nbsp;
							<div id="first_name1">${myaccount.information.firstName}</div>
							&nbsp;
							<div id="last_name1">${myaccount.information.lastName}</div>
						</div>
						
					</div>

					<div id="nameafter" class="mx-2 my-4  w-50" style="display: none">
						<div class="row">
							<div class="form-group col">
								<div>
									<input class="form-input" type="text" name="first_name"
										id="first_name" value="${myaccount.information.firstName}"
										aria-invalid="false">
								</div>
							<div class="warn">
									<span id="result02"></span>
								</div>								
							</div>
							<div class="form-group col">
								<div>
									<input class="form-input" type="text" name="last_name"
										id="last_name" value="${myaccount.information.lastName}"
										aria-invalid="false">
								</div>
															<div class="warn">
								<span id="result03"></span> <br />
							</div>
							</div>
							</div>
						
					</div>
					<i class="fa-solid fa-pen-nib" id="nameswitch">編輯</i>
</div>
					<!-- 性別區 -->

					<div class="mx-2 my-4 border-bottom w-50">
						<div class="mx-2 my-4 w-50">
							<span>性別：</span> &nbsp;

							<%
							if (((Account) request.getSession().getAttribute("myaccount")).getInformation().getGender() == 'm') {
							%>
							<input type="radio" name="gender" id="male" value="m" checked>
							<label for="male">男</label> <input type="radio" name="gender"
								id="male" value="f"> <label for="male">女</label>
							<%
							} else {
							%>
							<input type="radio" name="gender" id="male" value="m"> <label
								for="male">男</label> <input type="radio" name="gender" id="male"
								value="f" checked> <label for="male">女</label>
							<%
							}
							%>
						</div>
					</div>
					
					<!-- 電話區 -->
<div class="mx-2 my-4 border-bottom w-50" >
					<div id="phonebefore" class="mx-2 my-4  w-50" style="display: block">
						<span>電話：</span> &nbsp;
						<div id="phone_number1">${myaccount.information.phoneNumber}</div>
					</div>
					
					<div id="phoneafter" class="mx-2 my-4 w-50" style="display: none">
						<div>
			<input class="form-input" type="text" name="phone_number" id="phone_number" value="${myaccount.information.phoneNumber}" aria-invalid="false">
			</div><div class="warn">
			<span id="result04"></span></div>
				</div>
					
					<i class="fa-solid fa-pen-nib" id="phoneswitch">編輯</i>
					</div>
					<!-- mail區 -->
<div class="mx-2 my-4 border-bottom w-50" >
					<div id="mailbefore" class="mx-2 my-4 border-bottom w-50" style="display: block">
						<span>email：</span> &nbsp;
						<div id="email1">${myaccount.information.email}</div>						
					</div>
					
					<div id="mailafter" class="mx-2 my-4 border-bottom w-50" style="display: none">
			<div>
			<input class="form-input" type="email" name="email" id="email" value="${myaccount.information.email}" aria-invalid="false">
			</div><div class="warn">
			<span id="result05"></span></div>
			</div>
					
					<i class="fa-solid fa-pen-nib" id="mailswitch">編輯</i>
					</div>
					<!-- 生日區 -->
<div class="mx-2 my-4 border-bottom w-50" >
					<div id="birthbefore" class="mx-2 my-4 border-bottom w-50" style="display: block">
						<span>生日：</span> &nbsp;
						<div id="birthday">
							<fmt:formatDate pattern="yyyy-MM-dd"
								value="${myaccount.information.birthday}" />
						</div>
					</div>
					
					<div id="birthafter" class="mx-2 my-4 border-bottom w-50" style="display: none">
					<div>
					<input value="<fmt:formatDate pattern="yyyy-MM-dd"
								value="${myaccount.information.birthday}" />" type="date" id="birthday" name="birthday" class="form-control datepicker">
					</div>
					</div>									
					<i class="fa-solid fa-pen-nib" id="birthswitch">編輯</i>
					</div>
				<!-- 照片區 -->
<div class="mx-2 my-4 border-bottom w-50" >
					<div id="put-photo" class="mx-2 my-4 w-50"
						style="display: block">
						<img alt="" src="${uriRoot}/photo/account/${myaccount.photo.uuid}"
							style="width: 360px">

					</div>

					<div id="sub_img_div" class="subimg" style="display: none">
						<div id="uploaddi" class="uploaddiv">
							<label id="subimgSpan" class="subimgSpan"><i class="fa fa-photo"></i> 點擊上傳圖片
							 <input type="file" id="file" class="filepath"
								onchange="changepic(this)" name="photo"
								accept="image/jpg,image/jpeg,image/png,image/PNG"></label>
						</div>
						<img src="#" id="img" class="showimg" style="display: none" />

					</div>
					<i class="fa-solid fa-pen-nib" id="photoswitch">編輯</i>
</div>
					<div class="mx-2 my-4">
						<span></span>
						<div></div>
						<button class="submitbutton" id="submit">送出</button>
					</div>
				</form>
				<div>
					<a
						href="javaScript:if(confirm('確定停用帳號?')){location.href='http://localhost:8090/bearbnb.com/delete'}">停用帳號</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${uriRoot}/scripts/bootstrap.bundle.min.js"></script>

<c:if test="${duplicateDate != null}">
	<script>
		alert("${duplicateDate}");
	</script>
</c:if>

<script src="https://kit.fontawesome.com/5abfac332a.js" crossorigin="anonymous"></script>
	<script>

		/*照片*/

		$('#photoswitch').click(function() {
			$('#put-photo').toggle();
			$('#sub_img_div').toggle();
			if ($('#photoswitch').text() == '編輯') {
				$('#photoswitch').text('取消');
			} else if ($('#photoswitch').text() == '取消') {
				$('#photoswitch').text('編輯');
			}
			changepic();
		})
		function changepic() {
				$("#uploaddiv").css("display", "none");
				var reads = new FileReader();
				let f = document.getElementById('file').files[0];
				reads.readAsDataURL(f);
				reads.onload = function(e) {
					document.getElementById('img').src = this.result;
					$("#img").css("display", "block");
				};
			}

		/*密碼*/

$('#pwdswitch').click(function() {
$('#pwdbefore').toggle();
$('#pwdafter').toggle();
if ($('#pwdswitch').text() == '編輯') {
$('#pwdswitch').text('取消');
} else if ($('#pwdswitch').text() == '取消') {
$('#pwdswitch').text('編輯');}
$('#pwdSeen').click(function() {
if ($('#password[type="password"]').length) {
$('#password').attr('type','text');
$('#pwdSeen').attr('class','fa-solid fa-eye-slash');
} else {
$('#password').attr('type','password');
$('#pwdSeen').attr('class','fa-solid fa-eye');}
})

var warn = '<font color="red" size="-1">密碼須包含大小寫英文、數字、特殊符號(!@#$%^&*)</font>';

$('#password').blur(function() {

if (!(/[A-Z]/.test($('#password').val()))) {
$('#result01').html(warn);

} else if (!(/[a-z]/.test($('#password').val()))) {
$('#password').attr('aria-invalid','false');
$('#result01').html(warn);

} else if (!(/[0-9]/.test($('#password').val()))) {
$('#result01').html(warn);
$('#password').attr('aria-invalid','false');
} else if (!(/[!@#$%^&*]/.test($('#password').val()))) {
$('#result01').html(warn);
$('#password').attr('aria-invalid','false');
} else if ($('#password').val().length == 0) {
$('#result01').html('<font color="red" size="-1">此欄不得為空</font>');
$('#password').attr('aria-invalid','false');
} else if ($('#password').val().length < 4) {
$('#result01').html('<font color="red" size="-1">密碼不得小於4個字元</font>');
$('#password').attr('aria-invalid','false');
} else {$('#result01').html('');
$('#password').attr('aria-invalid','true');}
})
})


/*姓名*/

		$('#nameswitch').click(function() {
			$('#namebefore').toggle();
			$('#nameafter').toggle();
			if ($('#nameswitch').text() == '編輯') {
				$('#nameswitch').text('取消');
			} else if ($('#nameswitch').text() == '取消') {
				$('#nameswitch').text('編輯');
			}
			$('#first_name').blur(function(){
				if($('#first_name').val().length == 0){
					$('#result02').html('<font color="red" size="-1">此欄不得為空</font>');
					$('#first_name').attr('aria-invalid','false');
				}else {$('#result02').html('');
				$('#first_name').attr('aria-invalid','true');}
			})
			$('#last_name').blur(function(){
				if($('#last_name').val().length == 0){
					$('#result03').html('<font color="red" size="-1">此欄不得為空</font>');
					$('#last_name').attr('aria-invalid','false');
				}else {$('#result03').html('');
				$('#last_name').attr('aria-invalid','true');}
			})
		})

/* 電話 */

		$('#phoneswitch').click(function() {
			$('#phonebefore').toggle();
			$('#phoneafter').toggle();
			if ($('#phoneswitch').text() == '編輯') {
				$('#phoneswitch').text('取消');
			} else if ($('#phoneswitch').text() == '取消') {
				$('#phoneswitch').text('編輯');
			}
			$('#phone_number').blur(function(){				
				if($('#phone_number').val().length ==0 ){
					$('#result04').html('<font color="red" size="-1">此欄不得為空</font>');
					$('#phone_number').attr('aria-invalid','false');}
				else if ($('#phone_number').val().length > 10 ){
					$('#result04').html('<font color="red" size="-1">格式不符請重新填寫</font>');
					$('#phone_number').attr('aria-invalid','false');}
				else if ($('#phone_number').val().length < 8 ){
					$('#result04').html('<font color="red" size="-1">格式不符請重新填寫</font>');
					$('#phone_number').attr('aria-invalid','false');}
				else if (!(/^[0-9]+$/.test($('#phone_number').val()))){
					$('#result04').html('<font color="red" size="-1">格式不符請重新填寫</font>');
					$('#phone_number').attr('aria-invalid','false');}
				else {$('#result04').html('');
					$('#phone_number').attr('aria-invalid','true');}
				
				$.ajax({
					url:'http://localhost:8090/bearbnb.com/checkPhone',
					type:'post',
					data:{phone_number:$('#phone_number').val()},
					success: function(response){
						var a = response.phone_number;
						var b = $('#phone_number').val();
						if( a !=null){
							if(a != ${myaccount.information.phoneNumber}){
						$('#result04').html('<font color="red" size="-1">此電話已被其他人使用</font>');
						$('#phone_number').attr('aria-invalid','false');}}
						else {$('#result04').html('此電話可使用');
						$('#phone_number').attr('aria-invalid','true');}						
					},
					error: function(xhr){
						$('#result04').html('<font color="red" size="-1">網路問題，請重新整理頁面</font>');
					}
					});
			})
		})
		
/* email */
$('#mailswitch').click(function(){
	$('#mailbefore').toggle();
	$('#mailafter').toggle();
	if ($('#mailswitch').text() == '編輯') {
		$('#mailswitch').text('取消');
	} else if ($('#mailswitch').text() == '取消') {
		$('#mailswitch').text('編輯');
	}
	$('#email').blur(function(){
		if($('#email').val().length == 0 ){
			$('#result05').html('<font color="red" size="-1">此欄不得為空</font>');
			$('#email').attr('aria-invalid','false');}
		else if(!(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/.test($('#email').val()))){
			$('#result05').html('<font color="red" size="-1">格式不符請重新填寫</font>');
			$('#email').attr('aria-invalid','false');
		}else{
			$('#result05').html('');
			$('#email').attr('aria-invalid','true');
		}
		$.ajax({
			url:'http://localhost:8090/bearbnb.com/checkEmail',
			type:'post',
			data:{email:$('#email').val()},
			success: function(response){
				var a = response.email;
				var b = $('#email1').val();
				console.log( response.email);
				if( a !=null){
					if(a != "${myaccount.information.email}"){
				$('#result05').html('<font color="red" size="-1">信箱已被其他人使用</font>');
				$('#email').attr('aria-invalid','false');}}
				else if($('#email').val().length == 0 ){
					$('#result05').html('<font color="red" size="-1">此欄不得為空</font>');
					$('#email').attr('aria-invalid','false');}
				else if(!(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/.test($('#email').val()))){
					$('#result05').html('<font color="red" size="-1">格式不符請重新填寫</font>');
					$('#email').attr('aria-invalid','false');
				}else{
					$('#result05').html('');
					$('#email').attr('aria-invalid','true');
				}						
			},
			error: function(xhr){
				$('#result04').html('<font color="red" size="-1">網路問題，請重新整理頁面</font>');
			}
			});
		/*為什麼一樣的內容在驗證電話的地方就OK到這邊就狂死啊*/
	})
})
 
/* birth */
	
$('#birthswitch').click(function(){
	$('#birthbefore').toggle();
	$('#birthafter').toggle();
	if ($('#birthswitch').text() == '編輯') {
		$('#birthswitch').text('取消');
	} else if ($('#birthswitch').text() == '取消') {
		$('#birthswitch').text('編輯');
	}
})

	</script>
</body>
</html>