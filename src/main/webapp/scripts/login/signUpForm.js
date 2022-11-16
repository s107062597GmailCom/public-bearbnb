/**
 * 
 */

/* 變數們 */
/*var submit = document.getElementById("submit"); --加這個送出不會動欸*/
var pwdSeen = document.getElementById("pwdSeen");

var username = document.getElementById("username");
var password = document.getElementById("password");
var first_name = document.getElementById("first_name");
var last_name = document.getElementById("last_name");
var phone_number = document.getElementById("phone_number");
var email = document.getElementById("email");
var birthday = document.getElementById("birthday");

var divId = document.getElementById("result01");
var divPwd = document.getElementById("result02");
var divFName = document.getElementById("result03");
var divLName = document.getElementById("result04");
var divPhone = document.getElementById("result06");
var divMail = document.getElementById("result07");
var divBirth = document.getElementById("result08");
var divResult = document.getElementById("result09");



/* 密碼顯示/隱藏 */
	pwdSeen.onclick = function() {
		if (password.type === 'password') {
			this.setAttribute('class', 'fa-solid fa-eye-slash');
			password.setAttribute('type','text');
		}
		else {
			this.setAttribute('class', 'fa-solid fa-eye');
			password.setAttribute('type','password');
		}
	}


/* 目標移出帳號輸入框就驗證 */
username.onblur = function() {
	id = username.value;	/* 帳號限制；除了英數字之外的東西都不能有 */
	var message = "";
	if (!id) {
			username.setAttribute("aria-invalid","false");
			divId.innerHTML = "<font color='red' size='-1'>請輸入帳號</font>";
			return;
		}
		if (id.length < 4){
			username.setAttribute("aria-invalid","false");
			divId.innerHTML = "<font color='red' size='-1'>帳號不得小於4個字元</font>";
			return;			
		}/*帳號 不能重複 只能限制英文 數字 特殊符號 不區分大小寫*/
/*		else if(!(/[a-z]/.test(id))){
/*			username.setAttribute("aria-invalid","false");
/*			divId.innerHTML = "<font color='red' size='-1'>帳號僅能輸入英數字</font>";
/*			return;	
/*		}
/*		else if (!(/[0-9]/.test(id))){
/*			username.setAttribute("aria-invalid","false");
/*			divId.innerHTML = "<font color='red' size='-1'>帳號須包含英數字</font>";
/*			return;
/*		}*/
		else if (!(/^[A-Za-z0-9]+$/.test(id))){
			username.setAttribute("aria-invalid","false");
			divId.innerHTML = "<font color='red' size='-1'>帳號僅能輸入英數字，請重新輸入帳號</font>";
			return;
		}
		
		
	//驗證帳號是否重複
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "checkUsername", true);
	xhr.setRequestHeader("Content-Type",
		"application/x-www-form-urlencoded");
	xhr.send("username=" + id);

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = JSON.parse(xhr.responseText);

			if (result.id == null) {
				username.setAttribute("aria-invalid","true");
				message = "此帳號可使用";
			} else if (result.id.startsWith("Error")) {
				username.setAttribute("aria-invalid","false");
				message = result.id;
			} else {
				username.setAttribute("aria-invalid","false");
				message = "帳號重複，請重新輸入帳號";
			}
			divId.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
		}
	}
}

password.onblur = function() {
	pwd = password.value;
	if (!pwd) {
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-1'>請輸入密碼</font>";
		return;
	}
	if (pwd.length < 4) {
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-1'>密碼不得小於4個字元</font>";
		return;
	}/*密碼 不能重複 只能限制英文 數字 特殊符號 區分大小寫*/
	if (!(/[A-Z]/.test(pwd))) {
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-1'>密碼須包含大小寫英文、數字</font>";
		return;
	} else if (!(/[a-z]/.test(pwd))) {
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-1'>密碼須包含大小寫英文、數字</font>";
		return;
	} else if (!(/[0-9]/.test(pwd))) {
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-1'>密碼須包含大小寫英文、數字</font>";
		return;
	} else if (!(/^[A-Za-z0-9]+$/.test(pwd))) {
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-1'>含有規定外字元，請重新輸入密碼</font>";
		return;
	} else {
		password.setAttribute("aria-invalid","true");
		divPwd.innerHTML = "";
	}
}

phone_number.onblur = function(){
	phone = phone_number.value;
	if(!phone){
		phone_number.setAttribute("aria-invalid","false");
		divPhone.innerHTML = "<font color='red' size='-1'>請輸入電話號碼</font>";
		return;
	} else if(phone.length > 10 || phone.length < 9 ){
		phone_number.setAttribute("aria-invalid","false");
		divPhone.innerHTML = "<font color='red' size='-1'>電話格式不符請重新輸入</font>";
		return;
	} else if(!(/^[0-9]+$/.test(phone))){
		phone_number.setAttribute("aria-invalid","false");
		divPhone.innerHTML = "<font color='red' size='-1'>電話格式不符請重新輸入</font>";
		return;
	}
	
	/* 驗證是否註冊重複電話 */
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST","checkPhone" , true );
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("phone_number="+ phone);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var result = JSON.parse(xhr.responseText);
			if(result.phone_number == null){
				phone_number.setAttribute("aria-invalid","true");
				divPhone.innerHTML = "<font color='red' size='-1'>此電話可使用</font>";
			}else{
				phone_number.setAttribute("aria-invalid","false");
				divPhone.innerHTML = "<font color='red' size='-1'>此電話已被使用請重新輸入</font>";
				return;
			}
		}
	}
}

email.onblur = function() {
	var mail = email.value;
	if (!mail) {
		email.setAttribute("aria-invalid","false");
		divMail.innerHTML = "<font color='red' size='-1'>請輸入mail</font>";
		return;
	} else if (!(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/.test(mail))) {
		email.setAttribute("aria-invalid","false");
		divMail.innerHTML = "<font color='red' size='-1'>mail格式不符請重新輸入</font>";
		return;
	}
	
		/* 驗證是否註冊重複email */
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST","checkEmail" , true );
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("email="+ mail);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var result = JSON.parse(xhr.responseText);
			if(result.email == null){
				email.setAttribute("aria-invalid","true");
				divMail.innerHTML = "<font color='red' size='-1'>您的email可使用</font>";
			}else{
				email.setAttribute("aria-invalid","false");
				divMail.innerHTML = "<font color='red' size='-1'>此email已被使用請重新輸入</font>";
			}
		}
	}
}
		function changepic2() {
			$("#uploaddiv").css("display", "none");
			var reads = new FileReader();
			let f = document.getElementById('file').files[0];
			reads.readAsDataURL(f);
			reads.onload = function(e) {
				document.getElementById('img').src = this.result;
				$("#img").css("display", "block");
			};
		}

/* 按下送出時的動作 */
submit.onclick = function() {
/*	alert("驗證信件已寄出，請到信箱完成驗證"); */
	vuser = username.value;
	vpwd = password.value;
	var vFN = first_name.value;
	var vLN = last_name.value;
	var vPN = phone_number.value;
	var vmail = email.value;
	var vBir = birthday.value;
	var vGender = document.querySelector('input[name="gender"]:checked').value;

	var hasError = false;


	if (!vuser) {
		username.setAttribute("aria-invalid","false");
		divId.innerHTML = "<font color='red' size='-2'>請輸入帳號</font>";
		hasError = true;
	} else if (vuser.length < 4) {
		username.setAttribute("aria-invalid","false");
		/*帳號 不能重複 只能限制英文 數字 特殊符號 不區分大小寫*/
		divId.innerHTML = "<font color='red' size='-2'>帳號不得小於4個字元</font>";
		hasError = true;
	}else if(!(/^[A-Za-z0-9]+$/.test(id))){
		username.setAttribute("aria-invalid","false");
		divId.innerHTML = "<font color='red' size='-2'>帳號僅能輸入英數字，請重新輸入</font>";
		hasError = true;		
	}else {
		divId.innerHTML = "";
	}
	if (!vpwd) {
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-2'>請輸入密碼</font>";
		hasError = true;
	} else if (vpwd.length < 4) {
		/*密碼 限制英文 數字 特殊符號 區分大小寫*/
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-2'>密碼須包含大小寫英文與數字</font>";
		hasError = true;
	} else if (!(/[A-Z]/.test(pwd))) {
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-2'>密碼須包含大小寫英文與數字</font>";
		hasError = true;
	} else if (!(/[a-z]/.test(pwd))) {
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-2'>密碼須包含大小寫英文與數字</font>";
		hasError = true;
	} else if (!(/[0-9]/.test(pwd))) {
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-2'>密碼須包含大小寫英文與數字</font>";
		hasError = true;
	} else if (!(/^[A-Za-z0-9]+$/.test(pwd))) {
		password.setAttribute("aria-invalid","false");
		divPwd.innerHTML = "<font color='red' size='-2'>密碼使用規則外字元，請重新輸入</font>";
		hasError = true;
	} else {
		divPwd.innerHTML = "";
	}
	if (!vFN) {
		first_name.setAttribute("aria-invalid","false");
		divFName.innerHTML = "<font color='red' size='-2'>請輸入名字</font>";
		hasError = true;
	} else {
		divFName.innerHTML = "";
	}
	if (!vLN) {
		last_name.setAttribute("aria-invalid","false");
		divLName.innerHTML = "<font color='red' size='-2'>請輸入姓氏</font>";
		hasError = true;
	} else {
		divLName.innerHTML = "";
	}
	if (!vPN) {
		phone_number.setAttribute("aria-invalid","false");
		divPhone.innerHTML = "<font color='red' size='-2'>請輸入電話</font>";
		hasError = true;
	} else if (vPN.length > 10 || vPN.length < 9 ) {
		phone_number.setAttribute("aria-invalid","false");
		divPhone.innerHTML = "<font color='red' size='-2'>電話格式不符請重新輸入</font>";
		hasError = true;
	}  else if (!(/^[0-9]+$/.test(vPN))) {
		phone_number.setAttribute("aria-invalid","false");
		divPhone.innerHTML = "<font color='red' size='-2'>電話格式不符請重新輸入</font>";
		hasError = true;
	}
	 else {
		divPhone.innerHTML = "";
	}
	if (!vmail) {
		email.setAttribute("aria-invalid","false");
		divMail.innerHTML = "<font color='red' size='-2'>請輸入email</font>";
		hasError = true;
	} else if(!(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/.test(vmail))) {
		email.setAttribute("aria-invalid","false");
		divMail.innerHTML = "<font color='red' size='-2'>mail格式不符請重新輸入</font>";
		hasError = true;
	} else {
		divMail.innerHTML = "";
	}
	if (!vBir) {
		birthday.setAttribute("aria-invalid","false");
		divBirth.innerHTML = "<font color='red' size='-2'>請選擇生日</font>";
		hasError = true;
	} else {
		divBirth.innerHTML = "";
	}
	if (hasError) {
		return false;
			}
	
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			alert("驗證信件已寄出，請到信箱完成驗證");
			window.location.replace('http://localhost:8090/bearbnb.com/');
		}
	var url = "http://localhost:8090/bearbnb.com/sendEmail?email="+vmail;
	xhr.open("GET",url , true );
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
	

//	var xhr1 = new XMLHttpRequest();
//	var form = {
//		"username": vuser,
//		"password": vpwd,
//		"first_name": vFN,
//		"last_name": vLN,
//		"gender": vGender,
//		"phone_number": vPN,
//		"email": vmail,
//		"birthday": vBir
//	}
//	var jsonString = JSON.stringify(form);
//
//	xhr1.onreadystatechange = function() {
//
//		if (xhr1.readyState == 4 && xhr1.status == 200) {
//			result = JSON.parse(xhr1.responseText);
//
//			/* 成功之前要先經過各種回傳判別式 */
//			if (result.error) {
//				divResult.innerHTML = "<font color='BLACK'>" + result.error + "</font>";
//			}
//			if (result.success) {
//				divResult.innerHTML = "<font color='GREEN'>" + result.success + ",將跳轉首頁" + "</font>";
//				/* 我想清空表格但是為什麼不行啦 */
//				window.setTimeout(parent.location.replace('http://localhost:8090/bearbnb.com'), 3000);
//			}
//		}
//	}
//	//送出資料指令建議放後面R，不然它有可能送完就不管你跟資料庫無關的指令了
//	xhr1.open("POST", "signup.controller", true);
//	xhr1.setRequestHeader("Content-Type", "application/json");
//	xhr1.send(jsonString);

}




